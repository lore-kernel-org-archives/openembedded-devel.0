Return-Path: <niko.mauno@iki.fi>
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net
	[83.102.40.154])
	by mail.openembedded.org (Postfix) with ESMTP id 380FB751D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Nov 2019 13:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 697C114E3C;
	Sat, 23 Nov 2019 15:48:06 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id K7AdrkpJIq5v; Sat, 23 Nov 2019 15:48:06 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 1295015081;
	Sat, 23 Nov 2019 15:48:06 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 4EF532C66;
	Sat, 23 Nov 2019 15:48:01 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Nov 2019 15:47:32 +0200
Message-Id: <20191123134732.81429-2-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191123134732.81429-1-niko.mauno@iki.fi>
References: <20191123134732.81429-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [meta-oe][thud][PATCH 2/2] gitpkgv.bbclass: Support also lightweight tags
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
X-List-Received-Date: Sat, 23 Nov 2019 13:54:44 -0000
Content-Transfer-Encoding: 8bit

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

When checking for commit specific tags during GITPKGVTAG resolution, use
additional '--tags' and '--exact-match' options for 'git describe'
command.

This changes the behaviour so that in case an annotated tag does not
exist for the particular commit, then the latest lightweight
(non-annotated) tag is used instead, in case that commit has at least
one such tag.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 22609f584..ab591bd45 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -7,8 +7,8 @@
 #   NN equals the total number of revs up to SRCREV
 #   GITHASH is SRCREV's (full) hash
 #
-# - GITPKGVTAG which is the output of 'git describe' allowing for
-#   automatic versioning
+# - GITPKGVTAG which is the output of 'git describe --tags --exact-match'
+#   allowing for automatic versioning
 #
 # gitpkgv.bbclass assumes the git repository has been cloned, and
 # contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
@@ -103,7 +103,7 @@ def get_git_pkgv(d, use_tags):
                 if use_tags:
                     try:
                         output = bb.fetch2.runfetchcmd(
-                            "git --git-dir=%(repodir)s describe %(rev)s 2>/dev/null"
+                            "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
                             % vars, d, quiet=True).strip()
                         ver = gitpkgv_drop_tag_prefix(output)
                     except Exception:
-- 
2.20.1


