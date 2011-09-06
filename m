Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R0t3E-0000GW-JF
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:38:44 +0200
Received: by fxg11 with SMTP id 11so4405761fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=h1D15pwA5RMne+G/ORDQNnpKfk7FQk9pdZrc0enjlbE=;
	b=xxrLyKUfkF78igYVRqnDg06dIi6gxmb1acUnQdFN1ipfS1DOvG5OP7AKIL0RC3R21R
	MTMkhglXGDgLtfbQcldU7JFnKIzkUeQYOIXW4Zfk5FsMsQwjSoCbOKWC1mJSZWPhrtBv
	N6Yirr9p92w1yjF5lxeemZzvLqWLMt+6QomiI=
Received: by 10.223.58.13 with SMTP id e13mr1410648fah.41.1315305218157;
	Tue, 06 Sep 2011 03:33:38 -0700 (PDT)
Received: from Hellboy (qrc29-1-82-245-206-103.fbx.proxad.net [82.245.206.103])
	by mx.google.com with ESMTPS id c12sm5008309fad.14.2011.09.06.03.33.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 03:33:37 -0700 (PDT)
Received: by Hellboy (sSMTP sendmail emulation);
	Tue, 06 Sep 2011 12:33:33 +0200
From: =?UTF-8?q?Sylvain=20=27GarthPS=27=20Par=C3=A9?= <sylvain.pare@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 12:33:25 +0200
Message-Id: <1315305205-17767-1-git-send-email-sylvain.pare@gmail.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] binutils*: recipes updates to new version 2.21.1
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
X-List-Received-Date: Tue, 06 Sep 2011 10:38:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com>
---
 recipes/binutils/binutils-cross-sdk_2.21.1.bb |    2 ++
 recipes/binutils/binutils-cross-sdk_2.21.bb   |    2 --
 recipes/binutils/binutils-cross_2.21.1.bb     |    2 ++
 recipes/binutils/binutils-cross_2.21.bb       |    2 --
 recipes/binutils/binutils_2.21.1.bb           |   21 +++++++++++++++++++++
 recipes/binutils/binutils_2.21.bb             |   21 ---------------------
 6 files changed, 25 insertions(+), 25 deletions(-)
 create mode 100644 recipes/binutils/binutils-cross-sdk_2.21.1.bb
 delete mode 100644 recipes/binutils/binutils-cross-sdk_2.21.bb
 create mode 100644 recipes/binutils/binutils-cross_2.21.1.bb
 delete mode 100644 recipes/binutils/binutils-cross_2.21.bb
 create mode 100644 recipes/binutils/binutils_2.21.1.bb
 delete mode 100644 recipes/binutils/binutils_2.21.bb

diff --git a/recipes/binutils/binutils-cross-sdk_2.21.1.bb b/recipes/binutils/binutils-cross-sdk_2.21.1.bb
new file mode 100644
index 0000000..f509566
--- /dev/null
+++ b/recipes/binutils/binutils-cross-sdk_2.21.1.bb
@@ -0,0 +1,2 @@
+require binutils_${PV}.bb
+require binutils-cross-sdk.inc
diff --git a/recipes/binutils/binutils-cross-sdk_2.21.bb b/recipes/binutils/binutils-cross-sdk_2.21.bb
deleted file mode 100644
index f509566..0000000
--- a/recipes/binutils/binutils-cross-sdk_2.21.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require binutils_${PV}.bb
-require binutils-cross-sdk.inc
diff --git a/recipes/binutils/binutils-cross_2.21.1.bb b/recipes/binutils/binutils-cross_2.21.1.bb
new file mode 100644
index 0000000..01d99db
--- /dev/null
+++ b/recipes/binutils/binutils-cross_2.21.1.bb
@@ -0,0 +1,2 @@
+require binutils_${PV}.bb
+require binutils-cross.inc
diff --git a/recipes/binutils/binutils-cross_2.21.bb b/recipes/binutils/binutils-cross_2.21.bb
deleted file mode 100644
index 01d99db..0000000
--- a/recipes/binutils/binutils-cross_2.21.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require binutils_${PV}.bb
-require binutils-cross.inc
diff --git a/recipes/binutils/binutils_2.21.1.bb b/recipes/binutils/binutils_2.21.1.bb
new file mode 100644
index 0000000..88c33d1
--- /dev/null
+++ b/recipes/binutils/binutils_2.21.1.bb
@@ -0,0 +1,21 @@
+require binutils.inc
+PR = "${INC_PR}.3"
+LICENSE = "GPLv3"
+
+SRC_URI = "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
+     file://binutils-uclibc-100-uclibc-conf.patch \
+     file://110-arm-eabi-conf.patch \
+     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
+     file://binutils-uclibc-300-006_better_file_error.patch \
+     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
+     file://binutils-uclibc-gas-needs-libm.patch \
+     file://fix-clone-conflicts.patch \
+     ${@['','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
+     file://binutils-2.19.1-ld-sysroot.patch \
+     "
+SRC_URI[md5sum] = "bde820eac53fa3a8d8696667418557ad"
+SRC_URI[sha256sum] = "cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"
+
+FILES_${PN}-symlinks += "${bindir}/elfedit"
+# When we enable gold this might need to be make conditional
+FILES_${PN}-symlinks += "${bindir}/ld.bfd"
diff --git a/recipes/binutils/binutils_2.21.bb b/recipes/binutils/binutils_2.21.bb
deleted file mode 100644
index df044aa..0000000
--- a/recipes/binutils/binutils_2.21.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require binutils.inc
-PR = "${INC_PR}.3"
-LICENSE = "GPLv3"
-
-SRC_URI = "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
-     file://binutils-uclibc-100-uclibc-conf.patch \
-     file://110-arm-eabi-conf.patch \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
-     file://binutils-uclibc-300-006_better_file_error.patch \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
-     file://binutils-uclibc-gas-needs-libm.patch \
-     file://fix-clone-conflicts.patch \
-     ${@['','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
-     file://binutils-2.19.1-ld-sysroot.patch \
-     "
-SRC_URI[md5sum] = "c84c5acc9d266f1a7044b51c85a823f5"
-SRC_URI[sha256sum] = "60abec5bf448eb930a5a15acb8712612377dc8bcfb13dfd5131228f70561d0c7"
-
-FILES_${PN}-symlinks += "${bindir}/elfedit"
-# When we enable gold this might need to be make conditional
-FILES_${PN}-symlinks += "${bindir}/ld.bfd"
-- 
1.7.4.1



