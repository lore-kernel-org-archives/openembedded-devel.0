Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 80502606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 18:19:35 +0000 (UTC)
Received: by igl9 with SMTP id 9so93680727igl.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 10:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4pp4WAyFJrwG+7J2lhcKqyYtP/jUisgnU1Oj7oXxaeE=;
	b=qSqUyC5QB1gpznCfztqONzyMstEu3VTZPi9u3WwRzFeRbu8XypKoDDCQlRuNkIZ3ym
	oAWu5k+NbkJlkloL6tS1OTBG/Xym+Kwkh/3SuVnkMqH3SZSrtjJmo5Y4FVLI/Aph3bdD
	Tnr/2gY8VXoQmAo0AuCFxxy+/pL+a7B4Vb794gfqP7CQq1lWMFI9r9iT5MXintNogXJJ
	W+0C2K8Baa4RQiyOkgpYDVECSGb4BQO12wET0CHkFVCDDFE/ViTzFVXwsVQaee6+vNKJ
	YovgbfSeCnSZqrVoCfUXzQi5948ZT9Aldqpf5vwgoGOas3IQCnPqiYTBj3M6Z9zkpEuh
	PZsg==
X-Received: by 10.50.150.37 with SMTP id uf5mr29654140igb.10.1448993976326;
	Tue, 01 Dec 2015 10:19:36 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	q17sm10070800igr.3.2015.12.01.10.19.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 10:19:35 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 13:19:25 -0500
Message-Id: <1448993965-32226-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Subject: [meta-oe][PATCH v2] nodejs: cleanup and update
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
X-List-Received-Date: Tue, 01 Dec 2015 18:19:37 -0000

Remove old nodejs_0.4.12 and update nodejs_0.12.7 to the latest stable
nodejs_4.2.2.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../nodejs/nodejs4/libev-cross-cc_0.4.12.patch     | 13 ------
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb  | 49 ----------------------
 .../nodejs/{nodejs_0.12.7.bb => nodejs_4.2.2.bb}   |  6 +--
 3 files changed, 3 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_4.2.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
deleted file mode 100644
index 2b9838f..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/deps/libev/wscript b/deps/libev/wscript
-index 4f6c9a8..1796749 100644
---- a/deps/libev/wscript
-+++ b/deps/libev/wscript
-@@ -58,7 +58,7 @@ def configure(conf):
-           return 0;
-       }
-   """
--  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
-+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
-                 msg="Checking for SYS_clock_gettime")
- 
-   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
deleted file mode 100644
index c73cefc..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
-
-DEPENDS = "openssl"
-
-PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
-
-SRC_URI = " \
-    http://nodejs.org/dist/node-v${PV}.tar.gz \
-    file://libev-cross-cc_${PV}.patch \
-"
-SRC_URI[md5sum] = "a6375eaa43db5356bf443e25b828ae16"
-SRC_URI[sha256sum] = "c01af05b933ad4d2ca39f63cac057f54f032a4d83cff8711e42650ccee24fce4"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-do_configure () {
-    sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript
-    sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript
-    ./configure --prefix=${prefix} --without-snapshot
-}
-
-do_compile () {
-    make
-}
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-
-    # fix namespace conflicts with other nodejs recipes
-    mv ${D}${bindir}/node ${D}${bindir}/node4
-    mv ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
-
-    mv ${D}${includedir}/node ${D}${includedir}/node4
-
-    mv ${D}${libdir}/node ${D}${libdir}/node4
-    mv ${D}${libdir}/pkgconfig/nodejs.pc ${D}${libdir}/pkgconfig/nodejs4.pc
-    sed -i -e s:include/node:include/node4: ${D}${libdir}/pkgconfig/nodejs4.pc
-
-    mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1
-}
-
-FILES_${PN} += "${libdir}/node4/wafadmin"
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb
index 41eb5ee..2ca2403 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
 
 DEPENDS = "openssl"
 
@@ -9,8 +9,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "5523ec4347d7fe6b0f6dda1d1c7799d5"
-SRC_URI[sha256sum] = "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
+SRC_URI[md5sum] = "7c46c158e4c9a44cfbd039951c13dfe6"
+SRC_URI[sha256sum] = "00e709353435b436b5bbf5e62272ebb15fe801065422c4c2afe2b93456210cb1"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.6.0.rc3


