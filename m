Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1B265F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 03:08:52 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so178837yha.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 20:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=LlXc+F6HdNwoJ3b0yAb6kwGbtaXZz/qiXlgoWZAvvCs=;
	b=DMggtHY7z+tQNfsGjM1qBhN+h46mwF2kN/uj2ZZeLLMXcngc1Edzj1gLSyYyed3zvD
	X2oVq8tl5DIBQfcrwVhRWF8lfzAyS0IcOcDHo7bW2KEKfj2V7Vzawr7BjcyaY8fhQ18b
	18LOLplu5XCA7NnXdHSLXQCaW6RmKYsa/2uO2Puh6BLoVYUz+DmKiuG0PkuJZ7HUqqmr
	z6faJUk3pWWX9PuWdJIWSzKHWiZ1dyY4xDq3YwyzjRsO8c9etAAxJKN0wBSpdFnPEgVU
	VIyOkAmgKLsanBKjVYvdTguifSf2cW2GDmMrizGS4ud9islmSa/n35Y3NjITrBWAD8xU
	2xkg==
X-Received: by 10.236.99.99 with SMTP id w63mr54380487yhf.52.1399345733030;
	Mon, 05 May 2014 20:08:53 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 46sm19223101yhg.36.2014.05.05.20.08.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 20:08:50 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 21DE51AAE75C0; Tue,  6 May 2014 00:08:47 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  6 May 2014 00:08:45 -0300
Message-Id: <1399345725-12124-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2] v4l-utils: Update to 1.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 May 2014 03:08:55 -0000

This updates to last stable release and, as a plus, fix an out of tree
build failure.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-multimedia/v4l2apps/files/openat.patch | 38 ---------------------
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb | 39 ----------------------
 .../recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb | 26 +++++++++++++++
 3 files changed, 26 insertions(+), 77 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/files/openat.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb

diff --git a/meta-oe/recipes-multimedia/v4l2apps/files/openat.patch b/meta-oe/recipes-multimedia/v4l2apps/files/openat.patch
deleted file mode 100644
index 6cbd528..0000000
--- a/meta-oe/recipes-multimedia/v4l2apps/files/openat.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ac8eb4d8e1c16b907e795da123a032869c77c56f Mon Sep 17 00:00:00 2001
-From: Riku Voipio <riku.voipio@linaro.org>
-Date: Tue, 22 Jan 2013 12:44:48 +0200
-Subject: [PATCH] libv4lsyscall-priv.h: use openat when available
-
-New architectures such as 64-Bit arm build kernels without legacy
-system calls - Such as the the no-at system calls. Thus, use
-SYS_openat whenever it is available.
-
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
-Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
-
-Upstream-status: backport
----
- lib/libv4lconvert/libv4lsyscall-priv.h |    5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/lib/libv4lconvert/libv4lsyscall-priv.h b/lib/libv4lconvert/libv4lsyscall-priv.h
-index 2dac49a..cdd38bc 100644
---- a/lib/libv4lconvert/libv4lsyscall-priv.h
-+++ b/lib/libv4lconvert/libv4lsyscall-priv.h
-@@ -72,8 +72,13 @@ typedef off_t __off_t;
- 
- #ifndef CONFIG_SYS_WRAPPER
- 
-+#ifdef SYS_openat
-+#define SYS_OPEN(file, oflag, mode) \
-+	syscall(SYS_openat, AT_FDCWD, (const char *)(file), (int)(oflag), (mode_t)(mode))
-+#else
- #define SYS_OPEN(file, oflag, mode) \
- 	syscall(SYS_open, (const char *)(file), (int)(oflag), (mode_t)(mode))
-+#endif
- #define SYS_CLOSE(fd) \
- 	syscall(SYS_close, (int)(fd))
- #define SYS_IOCTL(fd, cmd, arg) \
--- 
-1.7.10.4
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
deleted file mode 100644
index 485a416..0000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "v4l2 and IR applications"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
-                    file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
-
-PR = "r2"
-
-DEPENDS = "jpeg virtual/libx11"
-
-inherit autotools gettext
-
-# libv4l was absorbed into this, let OE know that
-PROVIDES = "libv4l"
-
-SRC_URI = "git://linuxtv.org/v4l-utils.git \
-           file://openat.patch \
-"
-# 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
-SRCREV = "0298efdcd1153b8f719b9164548a3f0546f0cb7c"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev" 
-
-do_configure() {
-    # autotools_do_configure fails with:
-    # | configure.ac:139: error: required file 'build-aux/config.rpath' not found
-    autoreconf -vfi 
-    oe_runconf
-}
-
-PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
-
-FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
-FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
-FILES_libv4l += "${libdir}/libv4l/* ${libdir}/*.so.*"
-FILES_libv4l-dbg += "${libdir}/libv4l/.debug"
-FILES_libv4l-dev += "${libdir}/*.so ${includedir}/lib* ${libdir}/pkgconfig/lib*"
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
new file mode 100644
index 0000000..6c25c90
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "v4l2 and IR applications"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
+                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
+
+DEPENDS = "jpeg virtual/libx11"
+
+inherit autotools gettext
+
+# libv4l was absorbed into this, let OE know that
+PROVIDES = "libv4l"
+
+SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b06ea8b15e27cff352b4536e835448bc"
+SRC_URI[sha256sum] = "fc0132e82a18dfad9619be3abf50c206e2f449b1c14440cde36f25874fdce7df"
+
+EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
+
+PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
+
+FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
+FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
+FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
+                 ${libdir}/libv4l/*-decomp"
+FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
+FILES_libv4l-dev += "${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
2.0.0.rc0


