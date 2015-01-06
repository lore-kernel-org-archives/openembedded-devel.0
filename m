Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id E2CE5728C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 18:31:25 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id q59so10034401wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 10:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+FrAKAvhtvfljlZJ3LzY/bIIQbsRE7LheaVVuNZPyjU=;
	b=mT2PLgyM3L1Wa5zv6AvuK3SMV1+fCtXabJbX80UtJ0+sVSRa+7sbRSWLkS3Qko/tpB
	srP/pEuDaQ0hTbpdnsfC//+NWxEjrFHD4xU+cEoYUBzGmH+Cy+DXFvhJgxT6X9oqSAMb
	3gZ0opg71z9hjP8t6ck2+QAIoiRTHqAlAOE32OYwWfHa1a1kRaKm6iY78GiZC2kYLUMz
	Z1AD6Dc7AlUCpNwPQot5t4QOloZoBPy45AjC3V4rsLfs479eCUMpuGnn8s+Pl8YivB+c
	I2ACbX73Bamll/OswrbWA7YqvCXEeoIwTNX8WfEoGdhhqss+U5ArCFfz4oHj0ZPTh/OJ
	9pHw==
X-Received: by 10.180.208.112 with SMTP id md16mr38631158wic.37.1420569084516; 
	Tue, 06 Jan 2015 10:31:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t12sm67465367wju.19.2015.01.06.10.31.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 10:31:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 19:31:24 +0100
Message-Id: <1420569085-9816-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-efl][PATCH 1/2] e-wm: upgrade to 0.19.2
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
X-List-Received-Date: Tue, 06 Jan 2015 18:31:30 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/e19_2_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc                  |  2 +-
 .../e17/e-wm/0001-configure.ac-add-foreign.patch   | 29 ----------------------
 .../e17/{e-wm_0.19.1.bb => e-wm_0.19.2.bb}         |  5 ++--
 meta-efl/recipes-efl/e17/e-wm_git.bb               |  9 +++----
 4 files changed, 7 insertions(+), 38 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
 rename meta-efl/recipes-efl/e17/{e-wm_0.19.1.bb => e-wm_0.19.2.bb} (75%)

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 5e3f293..45637f3 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -4,7 +4,7 @@ LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 
-inherit e update-alternatives gettext
+inherit e update-alternatives gettext pkgconfig
 S = "${WORKDIR}/${SRCNAME}"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch b/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
deleted file mode 100644
index 14899d5..0000000
--- a/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8526270c418a5dc3d737a8eaff315209433f69d2 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 25 Aug 2014 16:06:03 +0200
-Subject: [PATCH] configure.ac: add foreign
-
-* fixes:
-  | configure.ac:312: error: required file './ABOUT-NLS' not found
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 62c0f6d..49b290b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,7 +34,7 @@ AH_BOTTOM([
- #endif /* EFL_CONFIG_H__ */
- ])
- 
--AM_INIT_AUTOMAKE([1.11 dist-bzip2 -Wno-portability])
-+AM_INIT_AUTOMAKE([1.11 dist-bzip2 -Wno-portability foreign])
- AM_SILENT_RULES([yes])
- 
- AC_USE_SYSTEM_EXTENSIONS
--- 
-2.0.4
-
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.1.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.2.bb
similarity index 75%
rename from meta-efl/recipes-efl/e17/e-wm_0.19.1.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.19.2.bb
index 4c9830f..ac33406 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.1.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.2.bb
@@ -11,10 +11,9 @@ DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
     ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://0001-configure.ac-add-foreign.patch \
     file://enlightenment_start.oe \
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "2c5a110496a867253f31cf7ed1a2143a"
-SRC_URI[sha256sum] = "3430d94c3def706de3b421ee48d92f2a475224f2f86111442a5d2d90c2363116"
+SRC_URI[md5sum] = "ca76c640c2a54f89f069176258151334"
+SRC_URI[sha256sum] = "9063d3de704a5700468a558f6707f402fe239c0807bc38ed29aaf7c62db1cd02"
diff --git a/meta-efl/recipes-efl/e17/e-wm_git.bb b/meta-efl/recipes-efl/e17/e-wm_git.bb
index 4bf1b96..1873878 100644
--- a/meta-efl/recipes-efl/e17/e-wm_git.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_git.bb
@@ -1,14 +1,13 @@
 require ${BPN}.inc
 
-PV = "0.18.999+0.19-alpha2+git${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
+PV = "0.19.2+git${SRCPV}"
+DEFAULT_PREFERENCE = "-2"
 
 SRC_URI = " \
-    git://git.enlightenment.org/core/enlightenment.git \
-    file://0001-configure.ac-add-foreign.patch \
+    git://git.enlightenment.org/core/enlightenment.git;branch=enlightenment-0.19 \
     file://enlightenment_start.oe \
     file://applications.menu \
 "
 S = "${WORKDIR}/git"
 
-SRCREV = "525b963133d7168226b8e07ba26730212a8b7e82"
+SRCREV = "be0d07877e561edd7242368797a90c36c4e77ee4"
-- 
2.2.1


