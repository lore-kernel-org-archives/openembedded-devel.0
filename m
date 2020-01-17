Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Jan 2020 20:41:35 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id D2DCF7FB43
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 20:41:35 +0000 (UTC)
IronPort-SDR: +QqMIw8B92QtY34+pI9Tui3gU6536AtF3cbB0bOz78Wcl8F1oSutxWzlkEZxyaWViMJOkiFEnu
	PTdL9lAg6G5DXgt2d/ZUZoUPgOrh1ABDKFzHL7hB+csWIjIA8+ExWPiv+IDOtI3DeXMCZMk29W
	uYNsTGSJ5EbIiNt/vfeEgISZ7Agy4BVJ2GSBDv2L5S0K0pOI/32a0GBH2rCXdjVvR9c4NL0c88
	NrmpdnpjBOsGtfgqRzBxi1/0gyABli09k45AS2ROHn7tBfKxdSaHkXiqzZaZY1Rup5se+M8BSq
	lvw=
X-IronPort-AV: E=Sophos;i="5.70,331,1574118000"; 
   d="scan'208";a="4411941"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 21:34:21 +0100
Message-ID: <20200117203421.4944-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [meta-oe][master][zeus][PATCH] gitpkgv.bbclass: Add support for extending the supported tag formats
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
X-List-Received-Date: Fri, 17 Jan 2020 20:41:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introduce GITPKGV_TAG_REGEXP (which defaults to "v(\d.*)") to support
dropping other unwanted parts of the found tags than just a leading
"v". Any matching groups in the regexp will be concatenated to yield
the final version.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

In our case, the tags looks like either R1.2.3 or IR1.2.3-4, so we
want to use GITPKGV_TAG_REGEXP = "(?:[vR]|IR)(\d.*)" to drop our
prefixes.

 meta-oe/classes/gitpkgv.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index ab591bd45..180421ed3 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -40,10 +40,16 @@
 GITPKGV = "${@get_git_pkgv(d, False)}"
 GITPKGVTAG = "${@get_git_pkgv(d, True)}"
 
-def gitpkgv_drop_tag_prefix(version):
+# This regexp is used to drop unwanted parts of the found tags. Any matching
+# groups will be concatenated to yield the final version.
+GITPKGV_TAG_REGEXP ??= "v(\d.*)"
+
+def gitpkgv_drop_tag_prefix(d, version):
     import re
-    if re.match("v\d", version):
-        return version[1:]
+
+    m = re.match(d.getVar('GITPKGV_TAG_REGEXP'), version)
+    if m:
+        return ''.join(group for group in m.groups() if group)
     else:
         return version
 
@@ -105,7 +111,7 @@ def get_git_pkgv(d, use_tags):
                         output = bb.fetch2.runfetchcmd(
                             "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
                             % vars, d, quiet=True).strip()
-                        ver = gitpkgv_drop_tag_prefix(output)
+                        ver = gitpkgv_drop_tag_prefix(d, output)
                     except Exception:
                         ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])
                 else:
-- 
2.21.1


