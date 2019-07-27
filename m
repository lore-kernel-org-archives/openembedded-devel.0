Return-Path: <tworaz@tworaz.net>
X-Greylist: delayed 405 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 27 Jul 2019 09:03:06 UTC
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 86AEB6BBE6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 09:03:06 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id A9FFC1001CC;
	Sat, 27 Jul 2019 08:56:22 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 10:56:16 +0200
Message-Id: <20190727085616.14529-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] itstool: Don't use hardcoded, absolute path to python3 binary.
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
X-List-Received-Date: Sat, 27 Jul 2019 09:03:06 -0000
Content-Transfer-Encoding: 8bit

Unfortunately itstoll build system produces script file which contains
absolute path to python3 binary used during packaging. In case of OE
this refers to recipe-sysroot-native directory. This obviously make the
resulting script unusable for both target and native builds. This
problem was patched in OE using sed after the script file was installed.
The sed line replaced one absolute path with /usr/bin/python3. This
seems to work fine for target builds but is still not good enough for
native targets.s

The main problem with native builds is we can't mix host and OE provided
python3 when recipe using the tool inherits python3native bbclass. This
bbclass exports _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata" which is
likely to break host python3.

To make sure itstool is usable on both build host and target replace
/usr/bin/python3 absolute path with /usr/bin/env python3.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...ld-time-hardcoded-python-binary-path.patch | 29 +++++++++++++++++++
 .../recipes-support/itstool/itstool_2.0.5.bb  |  8 ++---
 2 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch

diff --git a/meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch b/meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch
new file mode 100644
index 000000000..b91105330
--- /dev/null
+++ b/meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch
@@ -0,0 +1,29 @@
+From cd9b56224895576125e91cca317ace8a80f3eb77 Mon Sep 17 00:00:00 2001
+From: Piotr Tworek <tworaz@tworaz.net>
+Date: Sat, 27 Jul 2019 10:19:11 +0200
+Subject: [PATCH] Don't use build time hardcoded python binary path.
+
+This path obviously won't work on target since they refer to build
+machine directory structure. Native builds will also fail if local.conf
+has INHERIT+=rm_work. Instread of hardcoding path to python binary use
+whatever is found in PATH first. This should also allow the tool to use
+python3 binary provided in recipe-sysroot-native.
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ itstool.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/itstool.in b/itstool.in
+index b3c0033..7df2476 100755
+--- a/itstool.in
++++ b/itstool.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@ -s
++#!/usr/bin/env -S python3 -s
+ #
+ # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
+ #
+--
+2.21.0
+
diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
index a0af44a71..2e7e8f194 100644
--- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
@@ -7,15 +7,11 @@ inherit autotools python3native
 
 DEPENDS = "libxml2-native"
 
-SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-Don-t-use-build-time-hardcoded-python-binary-path.patch"
 SRC_URI[md5sum] = "655c6f78fc64faee45adcc45ccc5a57e"
 SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100d4b308"
 
-do_install_append() {
-    # fix shebang of main script
-    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
-}
-
 BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN} += "libxml2-python"
-- 
2.21.0


