Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 94E2F71C27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 09:06:52 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 25B342807F8; Mon, 20 Feb 2017 01:07:07 -0800 (PST)
Date: Mon, 20 Feb 2017 01:07:07 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170220090707.GW25952@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe][PATCH] gitpkgv.bbclass: fix versioning with multiple repos
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 09:06:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

gitpkgv class is supposed to use SRCREV_FORMAT variable to define
how to smoosh together revision info from multiple repos that are
used in a single recipe. It is incorrectly repeating the rev hash
for the first repo instead of including the rev from each listed repo.

Example:

  SRC_URI = "git://some-server/purple.git;destsuffix=git/purple;name=purple"
  SRC_URI += "git://other-server/blue.git;destsuffix=git/blue;name=blue"
  SRCREV_purple = "${AUTOREV}"
  SRCREV_blue = "${AUTOREV}"
  SRCREV_FORMAT = "purple_blue"

Suppose gitpkgv calculates "67+ea121ea" for purple repo,
and "123+feef001" for blue repo. This should result in a
package version with them joined together like so:

"67+ea121ea_123+feef001"

It didn't. Instead the git hash part for the first repo got repeated:

"67+ea121ea_123+ea121ea"

Fix this by looking in the right place for the git revisions of 2nd
(and following) repos when assembling the full version string.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-oe/classes/gitpkgv.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 8cd4bfd..26a758f 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -110,9 +110,9 @@ def get_git_pkgv(d, use_tags):
                             d, quiet=True).strip()
                         ver = gitpkgv_drop_tag_prefix(output)
                     except Exception:
-                        ver = "0.0-%s-g%s" % (commits, rev[:7])
+                        ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])
                 else:
-                    ver = "%s+%s" % (commits, rev[:7])
+                    ver = "%s+%s" % (commits, vars['rev'][:7])
 
                 format = format.replace(name, ver)
 
-- 
1.9.4

