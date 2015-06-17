Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1303573E3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 20:22:52 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so3078418wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sx9niNcXBpIXIUDRBAO99NhnjUmHkviES9BGViaWtcg=;
	b=nDoskbQphlkiNs5dLP1KA1kM6KbHFYkdvtzL2mHk1FB03ByiXMomLmOhAxhn6/Uu5Y
	3I+xY6gLYq8W0btUjUmzKDz27jsdRqV0k460tbDAJl4Dl5CyNmcQMeQ1Fig+q1uRGj/R
	VJMsmrpgumtTNuRnOO4vef1SXCrTswhqvNjudj/o9HOXpHjj9Mu7kC5mv4tEC+acSPbu
	xxUvqkTDhp8GBjqwhe8u8GIq2ZNtnNCsxJz8isIms0f4WYC2HScX0mslUfI15eCgopGa
	IUnXQqF/d1JfU8CBVAea6gv3lcenVnkkm+uWWvch4YDnXwdnhWhxD9sbd3eSTXMrXHG/
	NjzA==
X-Received: by 10.180.102.227 with SMTP id fr3mr56638035wib.19.1434572573000; 
	Wed, 17 Jun 2015 13:22:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ft12sm9444985wic.11.2015.06.17.13.22.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 13:22:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2015 22:23:06 +0200
Message-Id: <1434572586-30883-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-efl][PATCH] efl, elementary: upgrade to 1.14.1
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
X-List-Received-Date: Wed, 17 Jun 2015 20:22:56 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/efl_and_elementary_1_14_1_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl_1.14.0.bb        | 25 -------------------------
 meta-efl/recipes-efl/efl/efl_1.14.1.bb        | 25 +++++++++++++++++++++++++
 meta-efl/recipes-efl/efl/elementary_1.14.0.bb | 16 ----------------
 meta-efl/recipes-efl/efl/elementary_1.14.1.bb | 16 ++++++++++++++++
 4 files changed, 41 insertions(+), 41 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/efl_1.14.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/efl_1.14.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.14.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.14.1.bb

diff --git a/meta-efl/recipes-efl/efl/efl_1.14.0.bb b/meta-efl/recipes-efl/efl/efl_1.14.0.bb
deleted file mode 100644
index c891f0d..0000000
--- a/meta-efl/recipes-efl/efl/efl_1.14.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch \
-    file://0002-evas_3d-Add-Eet.h-includes.patch \
-"
-
-SRC_URI[md5sum] = "b0813fe92cb6eaf861e3c179a19d8e41"
-SRC_URI[sha256sum] = "30a8a239449e0d068a39787b5a4769dd26ddf0476f58f094c85e65b108086269"
-
-# Temporary disable until error like the one following are fixed
-# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
-# collect2: error: ld returned 1 exit status
-# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
-# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
-PARALLEL_MAKE_class-native = ""
-
-#EFL_RUN_IN_TREE=1 ../src/bin/eolian/eolian_gen --eo --legacy -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/eo -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/edje -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/ecore_audio --gc -o lib/evas/canvas/evas_line.eo.c /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas/evas_line.eo
-#ERR<32439>:eolian_gen /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/bin/eolian/main.c:103 _generate_c_file() Couldnt open file lib/evas/canvas/evas_line.eo.c for writing
-#Makefile:30738: recipe for target 'lib/evas/canvas/evas_line.eo.c' failed
-#make[2]: *** [lib/evas/canvas/evas_line.eo.c] Error 1
-#Makefile:2163: recipe for target 'all-recursive' failed
-# autotools-brokensep
-B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/efl_1.14.1.bb b/meta-efl/recipes-efl/efl/efl_1.14.1.bb
new file mode 100644
index 0000000..a17a685
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl_1.14.1.bb
@@ -0,0 +1,25 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch \
+    file://0002-evas_3d-Add-Eet.h-includes.patch \
+"
+
+SRC_URI[md5sum] = "e0668a93a67be2d59fb40cf71369d82d"
+SRC_URI[sha256sum] = "4e7e69c52c4fa6801e271f30bb4fb41fd62abfe1c9a874f502ca077e2d26329b"
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
diff --git a/meta-efl/recipes-efl/efl/elementary_1.14.0.bb b/meta-efl/recipes-efl/efl/elementary_1.14.0.bb
deleted file mode 100644
index 99d58e6..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.14.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-# only for target, because configure doesn't default to sane default when
-# these paths aren't passed in -native build
-SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
-
-SRC_URI[md5sum] = "e77075b8a80e9a931b91388d608c211c"
-SRC_URI[sha256sum] = "aa06ca1b332b3cd29ffd136c1f10edf08a06906b3532785ce7e390c1cad6090e"
-
-# autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
-# which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
-B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.14.1.bb b/meta-efl/recipes-efl/efl/elementary_1.14.1.bb
new file mode 100644
index 0000000..ecb147a
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.14.1.bb
@@ -0,0 +1,16 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+# only for target, because configure doesn't default to sane default when
+# these paths aren't passed in -native build
+SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
+
+SRC_URI[md5sum] = "704adee92de4010b88b89b329d1faaff"
+SRC_URI[sha256sum] = "e182d7079100edead934d6d2e9a6ff67ce7d7106f59387d9b7ed146cf8770b80"
+
+# autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
+# which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
+B = "${S}"
-- 
2.4.3


