Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1qz6-00045X-DK
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 04:38:28 +0200
Received: by wyf19 with SMTP id 19so1161804wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2011 19:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=RdH+uZPNFWky31ZGM1KcbsdsRxPfg4mgsOQuW1thgbg=;
	b=UkvtX7s3yA/OiyOGBDR9QHFIYh+dU+GsbjfA61Wv8jANnQBxrVlMp4lfhac9g+7SLc
	L+5w/gFu4fSiUw8UcHEH4/oYXtLrBhFrGLFbOb54D5Vbsufp4id/xWBg+9h8vBbg5tyr
	ww5QLZTRnc5h+jdBlI7Q9yvwQcrn1xjGGmqgI=
Received: by 10.216.230.213 with SMTP id j63mr1371241weq.113.1315535600459;
	Thu, 08 Sep 2011 19:33:20 -0700 (PDT)
Received: from localhost.localdomain
	(host86-135-215-249.range86-135.btcentralplus.com [86.135.215.249])
	by mx.google.com with ESMTPS id y28sm6046050wbn.17.2011.09.08.19.33.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Sep 2011 19:33:19 -0700 (PDT)
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 04:33:21 +0100
Message-Id: <1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
Cc: Ilya Dmitrichenko <errordeveloper@newbrik.new-synth.info>
Subject: [PATCH 2/2] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Fri, 09 Sep 2011 02:38:28 -0000

From: Ilya Dmitrichenko <errordeveloper@newbrik.new-synth.info>

Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
---
 recipes/binutils/binutils_2.20.1.bb  |   33 ---------------------------------
 recipes/binutils/binutils_2.20.1a.bb |   33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 33 deletions(-)
 delete mode 100644 recipes/binutils/binutils_2.20.1.bb
 create mode 100644 recipes/binutils/binutils_2.20.1a.bb

diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
deleted file mode 100644
index f40b676..0000000
--- a/recipes/binutils/binutils_2.20.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require binutils.inc
-LICENSE = "GPLv3"
-
-PR = "${INC_PR}.4"
-EXTRA_OECONF += "--disable-werror"
-
-#COMPATIBLE_TARGET_SYS = "."
-
-SRC_URI = "\
-     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=tarball \
-     file://binutils-uclibc-100-uclibc-conf.patch \
-     file://110-arm-eabi-conf.patch \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
-     file://binutils-uclibc-300-006_better_file_error.patch \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
-     file://binutils-uclibc-gas-needs-libm.patch \
-     file://binutils-x86_64_i386_biarch.patch \
-     ${@['file://libtool-update.patch','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
-     file://binutils-2.19.1-ld-sysroot.patch \
-     "
-
-SRC_URI_append_nios2 =" \
-	file://binutils-nios2-files.patch \
-	file://binutils-nios2.patch \
-	"
-
-SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
-SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
-
-# powerpc patches
-SRC_URI += "\
-     file://binutils-2.16.1-e300c2c3.patch \
-     "
diff --git a/recipes/binutils/binutils_2.20.1a.bb b/recipes/binutils/binutils_2.20.1a.bb
new file mode 100644
index 0000000..f40b676
--- /dev/null
+++ b/recipes/binutils/binutils_2.20.1a.bb
@@ -0,0 +1,33 @@
+require binutils.inc
+LICENSE = "GPLv3"
+
+PR = "${INC_PR}.4"
+EXTRA_OECONF += "--disable-werror"
+
+#COMPATIBLE_TARGET_SYS = "."
+
+SRC_URI = "\
+     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=tarball \
+     file://binutils-uclibc-100-uclibc-conf.patch \
+     file://110-arm-eabi-conf.patch \
+     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
+     file://binutils-uclibc-300-006_better_file_error.patch \
+     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
+     file://binutils-uclibc-gas-needs-libm.patch \
+     file://binutils-x86_64_i386_biarch.patch \
+     ${@['file://libtool-update.patch','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
+     file://binutils-2.19.1-ld-sysroot.patch \
+     "
+
+SRC_URI_append_nios2 =" \
+	file://binutils-nios2-files.patch \
+	file://binutils-nios2.patch \
+	"
+
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
+
+# powerpc patches
+SRC_URI += "\
+     file://binutils-2.16.1-e300c2c3.patch \
+     "
-- 
1.7.3.4



