Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKFqj-0000kI-3N
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 20:45:21 +0100
Received: (qmail 8320 invoked by uid 503); 21 Nov 2010 19:48:35 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 21 Nov 2010 19:48:35 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Nov 2010 21:44:08 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Nov 2010 21:44:08 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Nov 2010 20:42:00 +0100
Message-Id: <1290368520-9162-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <AANLkTimB+pvrtjXGMrHds-MDQC5SOMw-kS=L5fG6UAGb@mail.gmail.com>
References: <AANLkTimB+pvrtjXGMrHds-MDQC5SOMw-kS=L5fG6UAGb@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8541076693785029961
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] handle PACKAGE_ARCH change in an amend.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Nov 2010 19:45:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* setting PACKAGE_ARCH = "${MACHINE_ARCH}" in an amend.inc actually
leads to a package with the correct machine arch but the
work/stage/stamp dirs are not correct because MULTIMACH_ARCH is not
updated after amend.inc is parsed.

* this patch :
- factorizes the code which compute MULTIMACH_ARCH in base.bbclass
- updates MULTIMACH_ARCH if required by an amend.inc

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 classes/amend.bbclass |    2 +
 classes/base.bbclass  |   55 +++++++++++++++++++++++++++---------------------
 2 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/classes/amend.bbclass b/classes/amend.bbclass
index a03de64..048a8f3 100644
--- a/classes/amend.bbclass
+++ b/classes/amend.bbclass
@@ -42,4 +42,6 @@ python () {
             depends = set()
         depends |= set(newdata)
     d.setVar("__depends", depends)
+
+    set_multimach_arch(d)
 }
diff --git a/classes/base.bbclass b/classes/base.bbclass
index 308498f..7f58b17 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -288,6 +288,36 @@ addtask build
 do_build = ""
 do_build[func] = "1"
 
+def set_multimach_arch(d):
+    # 'multimachine' handling
+    mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
+    pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
+
+    #
+    # We always try to scan SRC_URI for urls with machine overrides
+    # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
+    #
+    override = bb.data.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', d, 1)
+    if override != '0' and is_machine_specific(d):
+        bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
+        bb.data.setVar('MULTIMACH_ARCH', mach_arch, d)
+        return
+
+    multiarch = pkg_arch
+
+    packages = bb.data.getVar('PACKAGES', d, 1).split()
+    for pkg in packages:
+        pkgarch = bb.data.getVar("PACKAGE_ARCH_%s" % pkg, d, 1)
+
+        # We could look for != PACKAGE_ARCH here but how to choose
+        # if multiple differences are present?
+        # Look through PACKAGE_ARCHS for the priority order?
+        if pkgarch and pkgarch == mach_arch:
+            multiarch = mach_arch
+            break
+
+    bb.data.setVar('MULTIMACH_ARCH', multiarch, d)
+
 python () {
     import exceptions
 
@@ -363,30 +393,7 @@ python () {
         # Already machine specific - nothing further to do
         return
 
-    #
-    # We always try to scan SRC_URI for urls with machine overrides
-    # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
-    #
-    override = bb.data.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', d, 1)
-    if override != '0' and is_machine_specific(d):
-        bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
-        bb.data.setVar('MULTIMACH_ARCH', mach_arch, d)
-        return
-
-    multiarch = pkg_arch
-
-    packages = bb.data.getVar('PACKAGES', d, 1).split()
-    for pkg in packages:
-        pkgarch = bb.data.getVar("PACKAGE_ARCH_%s" % pkg, d, 1)
-
-        # We could look for != PACKAGE_ARCH here but how to choose
-        # if multiple differences are present?
-        # Look through PACKAGE_ARCHS for the priority order?
-        if pkgarch and pkgarch == mach_arch:
-            multiarch = mach_arch
-            break
-
-    bb.data.setVar('MULTIMACH_ARCH', multiarch, d)
+    set_multimach_arch(d)
 }
 
 EXPORT_FUNCTIONS do_setscene do_fetch do_unpack do_configure do_compile do_install do_package
-- 
1.6.3.3



