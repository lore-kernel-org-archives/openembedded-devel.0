Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 96AD373808
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:56:48 +0000 (UTC)
Received: by wggz12 with SMTP id z12so18569964wgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wRQCCuWE7SM6pBcL8tybTTtQPYm3XZDT0ovAFphsAGQ=;
	b=0tZOXogyhbI8H24mfyb/eZhBdTNJwvfH6Pg2LoFL0YgM3G97wQqDMw9YlLD3Pn1fi8
	t3uPtJgwdoVWSDrVw85NWwpnFoEq2dNhl5xQOGvdJ39+iJS9tVOzklkXzGD5SUKFIdQe
	rZOlsn+qJALNFJbTd0RGAuhInFLQ8sm8zOUnVvteDLKUr6ytoGT1SBfnhLjTUb02OPHl
	AyLeOBOwyDL+mhe5PAOA2ro2HnBEb2wWXKeFmHQHcLDfrOG3+tjm3w71e4eG0CIG5Kw3
	tKI0J/IDw+rXrhiKNHdahdXFUUofDAtVDi7X9IlZKiKMWQubp9Ha3JSgJ6CYAS5g/fFN
	p0Ug==
X-Received: by 10.194.235.71 with SMTP id uk7mr25614289wjc.13.1425027409272;
	Fri, 27 Feb 2015 00:56:49 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jy7sm1791770wid.22.2015.02.27.00.56.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 00:56:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 09:57:05 +0100
Message-Id: <1425027425-28350-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-efl][PATCH] e-wm: upgrade to 0.19.3
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
X-List-Received-Date: Fri, 27 Feb 2015 08:56:50 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/e19_3_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/e-wm/0001-configure.ac-add-foreign.patch   | 29 ++++++++++++++++++++++
 .../e17/{e-wm_0.19.2.bb => e-wm_0.19.3.bb}         |  4 +--
 meta-efl/recipes-efl/e17/e-wm_git.bb               |  5 ++--
 3 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
 rename meta-efl/recipes-efl/e17/{e-wm_0.19.2.bb => e-wm_0.19.3.bb} (80%)

diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch b/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
new file mode 100644
index 0000000..c7a574c
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
@@ -0,0 +1,29 @@
+From 19e59b6e8148388e7a17f10d4390176a50e2917f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 25 Aug 2014 16:06:03 +0200
+Subject: [PATCH] configure.ac: add foreign
+
+* fixes:
+  | configure.ac:312: error: required file './ABOUT-NLS' not found
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 51ad0ba..cd77739 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ AH_BOTTOM([
+ #endif /* EFL_CONFIG_H__ */
+ ])
+ 
+-AM_INIT_AUTOMAKE([1.11 dist-bzip2 dist-xz -Wno-portability])
++AM_INIT_AUTOMAKE([1.11 dist-bzip2 dist-xz -Wno-portability foreign])
+ AM_SILENT_RULES([yes])
+ 
+ AC_USE_SYSTEM_EXTENSIONS
+-- 
+2.3.0
+
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.2.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.3.bb
similarity index 80%
rename from meta-efl/recipes-efl/e17/e-wm_0.19.2.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.19.3.bb
index ac33406..489cb2d 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.2.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.3.bb
@@ -15,5 +15,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "ca76c640c2a54f89f069176258151334"
-SRC_URI[sha256sum] = "9063d3de704a5700468a558f6707f402fe239c0807bc38ed29aaf7c62db1cd02"
+SRC_URI[md5sum] = "001b657528aadafcfae5b89b2c81aee8"
+SRC_URI[sha256sum] = "9d2e3c9e25dd48a8f5948d9c7757863d40f7b5bdbc13fdca5a72fb050e048dec"
diff --git a/meta-efl/recipes-efl/e17/e-wm_git.bb b/meta-efl/recipes-efl/e17/e-wm_git.bb
index 1873878..f4b893b 100644
--- a/meta-efl/recipes-efl/e17/e-wm_git.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_git.bb
@@ -1,13 +1,14 @@
 require ${BPN}.inc
 
-PV = "0.19.2+git${SRCPV}"
+PV = "0.19.3+git${SRCPV}"
 DEFAULT_PREFERENCE = "-2"
 
 SRC_URI = " \
     git://git.enlightenment.org/core/enlightenment.git;branch=enlightenment-0.19 \
+    file://0001-configure.ac-add-foreign.patch \
     file://enlightenment_start.oe \
     file://applications.menu \
 "
 S = "${WORKDIR}/git"
 
-SRCREV = "be0d07877e561edd7242368797a90c36c4e77ee4"
+SRCREV = "19e59b6e8148388e7a17f10d4390176a50e2917f"
-- 
2.3.1


