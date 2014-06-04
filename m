Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 529B26FA5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:18:14 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so8218617wes.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=89ptYctdcoB+l8OI0IivqXKOwt7YOJxM8Eld2KRSTi8=;
	b=NMjWIAPYkrVkqfjDK3Xh37V2dZadv2pVUPI+ci6LnZLsu1IEWDGIggBrLkxP6VA67O
	ITlPAYz+tgLEBAGFKvFdCDcbvCeSLt7aIgcXAugQmR97brR/QmZ1XbxRJBWEMJIPgdsB
	NgEHUgpQQ+OpAE25oGe7xUeDsofLX9e2KiSYd7W0loTmo7Q5QVLFbMW0nVfj5skuxm7E
	vfvBNhvPJG4rwlRcTTXAuZ4xhaImpw+/B1im2eFBjnIPxyy8KTY/xC2LcbajRltyKd4p
	qrRybAKrOiVouzigqx76SPct01Nf0nBQKwsM72WicMF658WgvYMd3hUfWTpz6dGiYtx3
	NWFw==
X-Received: by 10.180.126.97 with SMTP id mx1mr3222449wib.29.1401873495593;
	Wed, 04 Jun 2014 02:18:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p18sm47192607wik.3.2014.06.04.02.18.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:18:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:18:19 +0200
Message-Id: <1401873504-32120-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/7] efl, elementary: upgrade to 1.10.0
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
X-List-Received-Date: Wed, 04 Jun 2014 09:18:16 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/59/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/efl.bbclass                       |  5 +++++
 meta-efl/recipes-efl/efl/efl.inc                   |  5 ++++-
 meta-efl/recipes-efl/efl/efl_1.10.0.bb             | 25 ++++++++++++++++++++++
 meta-efl/recipes-efl/efl/efl_1.9.3.bb              | 17 ---------------
 meta-efl/recipes-efl/efl/elementary.inc            |  6 ++++++
 .../{elementary_1.9.3.bb => elementary_1.10.0.bb}  |  4 ++--
 .../efl/emotion-generic-players_1.10.0.bb          |  8 +++++++
 .../efl/emotion-generic-players_1.9.0.bb           |  8 -------
 .../recipes-efl/efl/evas-generic-loaders_1.10.0.bb |  8 +++++++
 .../recipes-efl/efl/evas-generic-loaders_1.9.0.bb  |  8 -------
 10 files changed, 58 insertions(+), 36 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/efl_1.10.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efl_1.9.3.bb
 rename meta-efl/recipes-efl/efl/{elementary_1.9.3.bb => elementary_1.10.0.bb} (79%)
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb

diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index d8cdd11..fb96ef0 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -21,6 +21,7 @@ do_install_prepend () {
 
 PACKAGES =+ "${PN}-themes"
 PACKAGES += "${PN}-tests"
+PACKAGES += "${PN}-eolian"
 
 FILES_${PN} = "${libdir}/*.so.* \
                ${libdir}/edje/modules/${PN}/*/module.so \
@@ -49,6 +50,10 @@ FILES_${PN}-dev   += "${bindir}/${PN}-config \
                       ${libdir}/edje/modules/${PN}/*/module.la \
 "
 
+FILES_${PN}-eolian = " \
+    ${datadir}/eolian/include \
+"
+
 FILES_${PN}-staticdev += "${libdir}/${BPN}/*/*.a"
 
 FILES_${PN}-dbg +=   "${libdir}/${PN}/.debug \
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 929fc20..752e3b7 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -22,7 +22,9 @@ EXTRA_OECONF = " \
     --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aaa \
 "
 EXTRA_OECONF_append_class-target = " \
-    --with-bin-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+    --with-eolian-gen=${STAGING_BINDIR_NATIVE}/eolian_gen \
+    --with-eolian-cxx=${STAGING_BINDIR_NATIVE}/eolian_cxx \
 "
 EXTRA_OECONF_append_class-native = " \
     --disable-fontconfig \
@@ -186,6 +188,7 @@ FILES_efreet = " \
 "
 FILES_eet = " \
     ${bindir}/eet \
+    ${bindir}/vieet \
     ${libdir}/libeet${SOLIBS} \
 "
 FILES_emotion = " \
diff --git a/meta-efl/recipes-efl/efl/efl_1.10.0.bb b/meta-efl/recipes-efl/efl/efl_1.10.0.bb
new file mode 100644
index 0000000..deeb92a
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl_1.10.0.bb
@@ -0,0 +1,25 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4dedbbbd03ccd3c8ac227b8682d0d0e4"
+SRC_URI[sha256sum] = "55ab54150e4c53781f7b3239f39c11a06c3b9208f4109700bca049c36cd6c49b"
+
+# Temporary disable until error like the one following are fixed
+# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
+# collect2: error: ld returned 1 exit status
+# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
+# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
+PARALLEL_MAKE_class-native = ""
+
+#EFL_RUN_IN_TREE=1 ../src/bin/eolian/eolian_gen --eo --legacy -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/eo -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/edje -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/ecore_audio --gc -o lib/evas/canvas/evas_line.eo.c /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas/evas_line.eo
+#ERR<32439>:eolian_gen /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/bin/eolian/main.c:103 _generate_c_file() Couldnt open file lib/evas/canvas/evas_line.eo.c for writing
+#Makefile:30738: recipe for target 'lib/evas/canvas/evas_line.eo.c' failed
+#make[2]: *** [lib/evas/canvas/evas_line.eo.c] Error 1
+#Makefile:2163: recipe for target 'all-recursive' failed
+# autotools-brokensep
+B = "${S}"
+
+SRC_URI += "file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch"
diff --git a/meta-efl/recipes-efl/efl/efl_1.9.3.bb b/meta-efl/recipes-efl/efl/efl_1.9.3.bb
deleted file mode 100644
index 61e6a9e..0000000
--- a/meta-efl/recipes-efl/efl/efl_1.9.3.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "102acebaf453346d745b0974f736a5e6"
-SRC_URI[sha256sum] = "46da18ce5ec6ded559dbf461ff58113f82937efb6e26a098a82b2f360e8faf88"
-
-# Temporary disable until error like the one following are fixed
-# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
-# collect2: error: ld returned 1 exit status
-# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
-# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
-PARALLEL_MAKE_class-native = ""
-
-SRC_URI += "file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch"
diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index dd18abe..c22070f 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -11,6 +11,7 @@ EXTRA_OECONF_append_class-target = "\
     --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
     --with-elementary-codegen=${STAGING_BINDIR_NATIVE}/elementary_codegen \
     --with-elm-prefs-cc=${STAGING_BINDIR_NATIVE}/elm_prefs_cc \
+    --with-eolian-gen=${STAGING_BINDIR_NATIVE}/eolian_gen \
 "
 
 BBCLASSEXTEND = "native"
@@ -18,6 +19,11 @@ BBCLASSEXTEND = "native"
 PACKAGECONFIG[eweather] = "--enable-eweather,--disable-eweather,libeweather"
 PACKAGECONFIG[ewebkit] = "--with-elementary-web-backend=ewebkit,--with-elementary-web-backend=none,webkit-efl"
 
+do_configure_prepend() {
+    # prefix returned eolian paths with STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
+    sed -i "s^DEPS_EOLIAN_FLAGS=\`pkg-config --variable=eolian_flags eo evas edje ecore\`$^DEPS_EOLIAN_FLAGS=\`\$PKG_CONFIG --variable=eolian_flags eo evas edje ecore | sed 's#-I${prefix}#-I${STAGING_DIR_HOST}${prefix}#g'\`^g" ${S}/configure.ac
+}
+
 do_compile_append_class-target() {
     sed -i -e s:${STAGING_DIR_TARGET}::g \
            -e s:/${TARGET_SYS}::g \
diff --git a/meta-efl/recipes-efl/efl/elementary_1.9.3.bb b/meta-efl/recipes-efl/efl/elementary_1.10.0.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.9.3.bb
rename to meta-efl/recipes-efl/efl/elementary_1.10.0.bb
index 4f24baf..86e718b 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.10.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "cc75bb1c7c4c49de120ec33e413130ce"
-SRC_URI[sha256sum] = "49f896066b72ba51eefd8e92f0b7e7b8e190b0dd26323b12cbd4f26216f578fb"
+SRC_URI[md5sum] = "81d4072c728a41518f59f3d115c1556b"
+SRC_URI[sha256sum] = "01c9127f0b29c1a07328199f51fb6d72d7f250be31e8afb26914566fb1c7e612"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb
new file mode 100644
index 0000000..5d5ed4b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f73b1f73b38a323e37bd138b103191a5"
+SRC_URI[sha256sum] = "ccfb1c8c346ba1a84484b82ce1ce871fd2c6660421ca7fa5d911661bd3cc94db"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
deleted file mode 100644
index 0337751..0000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "dc897ba540560fce0787bbff8455c022"
-SRC_URI[sha256sum] = "d26546adf61db7521f9d46f2baedcb645af72497fc259e93907026970d42d794"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb
new file mode 100644
index 0000000..732c296
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "ef5ac6a7960528bb12e997f3e304f151"
+SRC_URI[sha256sum] = "f5294c1a86dd4d7d4983ec4217c0d0d1a9cfa3fc2060d4af7eec5fa4ce23a463"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
deleted file mode 100644
index 38d0518..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "bec6d27fc4afd2f5e4829da5aeccdc0b"
-SRC_URI[sha256sum] = "9447839047b087b0293b2ed6c453249919f66e5c4f62e252a7b7e4f996c2ac5f"
-- 
2.0.0


