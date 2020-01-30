Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA6960D33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 21:04:11 +0000 (UTC)
IronPort-SDR: 84KYMUlnZtojOTRqdhFth5H5gY/JrokBW4bpwRBgrkR+0Mfu3aGbGN00Ia6l1sSaCnfOUEwC/h
	Unb+rcZSE2pxO04Wup7fEkfCvGlVggkodTHewU4cH4GC2lNofV8BUSFeYSVe17Tet2fkSY4I63
	0ciK16JdBfFPgT4GNe9mBcmdy47CVFJXqKx+DBrjTA4CStmM+IF9nMCV9FrvOyiNTE+jnxNPvT
	dQBDodExM0eQmnO4BrosGpJOc8JEIBOOFxv9qnIMgnUvc7e+pdCOf+6JRRm6dh6p2noJyueraB
	07w=
X-IronPort-AV: E=Sophos;i="5.70,382,1574118000"; 
   d="scan'208";a="4921814"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jan 2020 22:04:09 +0100
Message-ID: <20200130210409.29802-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200130210409.29802-1-pkj@axis.com>
References: <20200130210409.29802-1-pkj@axis.com>
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH 2/2] gitpkgv.bbclass: Add support for extending the supported tag formats
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introduce GITPKGV_TAG_REGEXP (which defaults to "v(\d.*)") to support
dropping other unwanted parts of the found tags than just a leading
"v". Any matching groups in the regexp will be concatenated to yield
the final version.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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


