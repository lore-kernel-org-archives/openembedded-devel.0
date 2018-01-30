Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1479B7882D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:14:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j21so3378705wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ElXXKE4p3xBXEex/oEeB3sY7Nqqiz4YfKDrVqfs7tiI=;
	b=fUngzG6JBj9VstTAAiqtMhB74X3ohXamlPC1H/NTTJWXE8BC2+nuB4VPBzTDBArO+F
	pU0/0my8iLFzvHnk8QDQrMSZ7P5fcw8ohHq/x2oiGDJJSZ4x8xkp4f2E6ikUeERBVb5h
	qzGmNo75lMFYyaKhvROoptErCa8T8+QCNsiSTyZHbI47NlHtXXqioBM5WBF+DNaQ/rJQ
	+nMPWYftPG4cBRbdcpKk3NQndVH8hY7syhm5WFsCKrN8dNUF2uoa+KZ6AarOvdlQDSP4
	wjnAtuBrNJ1xWBFAFqCeDhSVdrALi03WwDzUr44dciwnsAtueoFPZMDMHSivFXlwQIn7
	8M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ElXXKE4p3xBXEex/oEeB3sY7Nqqiz4YfKDrVqfs7tiI=;
	b=n9fJjRUgoceFYFNk1hIqPp3GlYH9t+QaY2QIxl8o69u6Cu5DCv7YRxRMhrR9Qd28qs
	h1Y2UcN1fODNV8lFZVT+mLOpzlfo+r0MlFhWtVit9htVeMpTy6rmDgi8aeUhHQiYcmke
	you6Ds1SMRK/JfOe7k2MK7hrsEiDuxag5trxawatii7V7S21JgJCdSbSoxZ8/gyIisPr
	UNThOk16p+GUDFj9MVr0ZZuw8IYm8S6ESpFKOu4HHcKIRBKMMjyM+iQqIWz1zcunK8yO
	AMC5NoLhGgtjVmPGQDpw+xLQcAPuD7G6Zim71MSUmkYVQtXJbMPoOB8dcAcw9DTSwWHY
	P55Q==
X-Gm-Message-State: AKwxytfQ8//g9jn19KXgFR8YyWX6ZPtcxZ52JZSytyQSCuVdbbvlMmjh
	i/IAoYLHd/et+F363tqFP7nvMw==
X-Google-Smtp-Source: AH8x227R5O2XOtzaly7LeJOOccY8hnauh4wGsn6IriSJx0sHUxF0IerJB8KUg9OguLJcKR3I0YOaYQ==
X-Received: by 10.28.167.5 with SMTP id q5mr22472958wme.90.1517314476552;
	Tue, 30 Jan 2018 04:14:36 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 44sm24481325wrv.0.2018.01.30.04.14.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jan 2018 04:14:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 12:14:32 +0000
Message-Id: <20180130121432.508-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] recipes: use oe.utils.conditional instead of deprecated base_conditional
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
X-List-Received-Date: Tue, 30 Jan 2018 12:14:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc-utils.inc        | 2 +-
 meta-networking/recipes-connectivity/samba/samba_4.7.0.bb    | 2 +-
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 2 +-
 meta-oe/recipes-devtools/php/php.inc                         | 2 +-
 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb    | 4 ++--
 meta-oe/recipes-kernel/linux/linux.inc                       | 2 +-
 meta-oe/recipes-support/mongodb/mongodb_git.bb               | 2 +-
 meta-oe/recipes-support/opencv/opencv_3.3.bb                 | 4 ++--
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc              | 4 ++--
 meta-webserver/recipes-httpd/nginx/nginx.inc                 | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 9014f5267f..7df33d64e4 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -48,7 +48,7 @@ do_install() {
     ln -s gzip ${D}${base_bindir}/zcat
 }
 
-EXTRA_KLIBC_DEPS = "${@base_conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
+EXTRA_KLIBC_DEPS = "${@oe.utils.conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
 
 PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
 
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
index f33c1384bf..686998e5ef 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
@@ -119,7 +119,7 @@ EXTRA_OECONF += "--enable-fhs \
                  --disable-rpath-install \
                  --with-shared-modules=${SAMBA4_MODULES} \
                  --bundled-libraries=${SAMBA4_LIBS} \
-                 ${@base_conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
+                 ${@oe.utils.conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
                  --with-cluster-support \
                  --with-profiling-data \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 3c05874690..29cd6b3bf4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-shared \
                 --with-defaults \
                 --with-install-prefix=${D} \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
+                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
 "
 
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index e466cdaf61..8394c4f647 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
+                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
                 ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
                 ${COMMON_EXTRA_OECONF} \
 "
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index cbf04734e1..0f798d2334 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -20,8 +20,8 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+                 ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
                 "
 
 LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
diff --git a/meta-oe/recipes-kernel/linux/linux.inc b/meta-oe/recipes-kernel/linux/linux.inc
index e200127718..9f14370cd8 100644
--- a/meta-oe/recipes-kernel/linux/linux.inc
+++ b/meta-oe/recipes-kernel/linux/linux.inc
@@ -16,7 +16,7 @@ CMDLINE_DEBUG ?= "loglevel=3"
 
 # Kernel bootlogo is distro-specific (default is OE logo).
 # Logo resolution (qvga, vga, ...) is machine-specific.
-LOGO_SIZE ?= '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
+LOGO_SIZE ?= '${@oe.utils.conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
 # To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or similar
 # to your kernel recipe, and then structure your logos for each resolution
 # accordingly.
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index 0ff7d0b59f..8acbf071b4 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -58,7 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  --use-system-zlib \
                  --js-engine=none \
                  --nostrip \
-                 --endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+                 --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
                  ${PACKAGECONFIG_CONFARGS} \
                  mongod mongos"
 
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index 3663d30e92..ca62de7c8f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -82,8 +82,8 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-    ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+    ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+    ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index f1bf9b06f6..771cdb1969 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -41,7 +41,7 @@ EXTRA_OECONF = " \
 "
 
 CONFIG_TLS = "--enable-thread-tls"
-CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
+CONFIG_TLS_arm = "${@oe.utils.conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
@@ -101,7 +101,7 @@ CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
 
 # syslog initscript is handled explicitly because order of
 # update-rc.d and update-alternatives is important
-RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+RDEPENDS_${PN} += " ${@oe.utils.conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
 RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 51523b606f..e6ae52a09f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -51,7 +51,7 @@ do_configure () {
 
     ./configure \
     --crossbuild=Linux:${TUNE_ARCH} \
-    --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+    --with-endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
     --with-int=4 \
     --with-long=${PTRSIZE} \
     --with-long-long=8 \
-- 
2.15.1


