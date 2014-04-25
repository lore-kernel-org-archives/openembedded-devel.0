Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 00E9265E1B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 22:52:50 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id y10so3628506pdj.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 15:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+SN+K+WLOFsELtG3GIn7egOpsV5VMwapQFl4pCTMEtI=;
	b=xq5nmR7eK9+TRV/dEY2f1p6/LRIwZN6jgtFUexuDvfjioKl/mSuzzwQTS2J+IX1Yhp
	m+JLxt4C5YK7LSAxK2bmtcdLa/l00dDrSsOCZ8Gh34aC2pv03gI176WCqHgfpxMR7lnu
	Yuc2f4iUJphwkSwEi67BRbj67n+JrrIO0jiZTiLO1iYZmAMOKDkD92/OM0C99NnRX9uH
	wP+iWkdA9GU1uVBfeyD7eO7hOhCcenicsey/SlmatLwcLJvSgnvjIaYAcHxY4E/aVJrs
	xPcKk95sL0XAsARR3wDQJqJOapROEWQCUXGJ6UPfs2cX/5aTH1F2HzHCBfQW5aPig5Jw
	3P3w==
X-Received: by 10.66.137.109 with SMTP id qh13mr10972516pab.39.1398466371741; 
	Fri, 25 Apr 2014 15:52:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	it4sm18334713pbd.48.2014.04.25.15.52.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 15:52:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 15:55:00 -0700
Message-Id: <1398466500-28117-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-gnome][PATCH] libbonobo: Update to latest versions and fix build when S != B
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
X-List-Received-Date: Fri, 25 Apr 2014 22:52:51 -0000

Do not install idl files which are already installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc            |    2 --
 .../bonobo/libbonobo/do-not-use-srcdir-variable.patch    |   14 +++++++-------
 meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb      |    8 --------
 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb      |    8 ++++++++
 .../{libbonoboui_2.24.3.bb => libbonoboui_2.24.5.bb}     |    7 ++-----
 5 files changed, 17 insertions(+), 22 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
 create mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
 rename meta-gnome/recipes-gnome/bonobo/{libbonoboui_2.24.3.bb => libbonoboui_2.24.5.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index 43e034b..b876db4 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -35,6 +35,4 @@ do_compile() {
 
 do_install() {
     oe_runmake ORBIT_IDL="${ORBIT_IDL_SRC}" DESTDIR="${D}" install
-    install -d ${D}${datadir}/idl/bonobo-activation-2.0/
-    install idl/*.idl ${D}${datadir}/idl/bonobo-activation-2.0/
 }
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
index 46f8137..a20edda 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
@@ -9,16 +9,16 @@ st-properties.sh'
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Not Submitted
 
-Index: libbonobo-2.24.3/tests/Makefile.am
+Index: libbonobo-2.32.1/tests/Makefile.am
 ===================================================================
---- libbonobo-2.24.3.orig/tests/Makefile.am	2009-04-18 05:27:41.000000000 -0700
-+++ libbonobo-2.24.3/tests/Makefile.am	2013-10-17 16:59:45.612989079 -0700
-@@ -53,7 +53,7 @@
+--- libbonobo-2.32.1.orig/tests/Makefile.am	2010-08-29 04:56:00.000000000 -0700
++++ libbonobo-2.32.1/tests/Makefile.am	2014-04-25 15:38:22.024744384 -0700
+@@ -55,7 +55,7 @@
  	MODELS_DIR="$(srcdir)/models"
  
  TESTS = test-moniker$(EXEEXT) test-event-source$(EXEEXT) test-object$(EXEEXT) \
 -	test-stream-mem$(EXEEXT) $(srcdir)/test-properties.sh test-storage-mem$(EXEEXT) \
 +	test-stream-mem$(EXEEXT) test-properties.sh test-storage-mem$(EXEEXT) \
- 	test-generic-factory.sh test-main-loop$(EXEEXT)
- check_SCRIPTS = test-properties.sh test-generic-factory.sh
- EXTRA_DIST=$(check_SCRIPTS) Test_Generic_Factory.server
+ 	test-main-loop$(EXEEXT)
+ 
+ # TESTS += test-generic-factory.sh
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
deleted file mode 100644
index b837802..0000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libbonobo.inc
-PR = "r2"
-
-SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
-            file://do-not-use-srcdir-variable.patch \
-           "
-SRC_URI[archive.md5sum] = "b217cef6a187505290c66c5bf8225d38"
-SRC_URI[archive.sha256sum] = "5310957fa90691689c0557218b8833f681666cae160bd84e1f2c2705189a4ebe"
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
new file mode 100644
index 0000000..a83a0f1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
@@ -0,0 +1,8 @@
+require libbonobo.inc
+
+SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
+            file://do-not-use-srcdir-variable.patch \
+           "
+SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
+SRC_URI[archive.sha256sum] = "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"
+
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
rename to meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index 5db8a3f..74dd908 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -4,11 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 inherit gnomebase pkgconfig gtk-doc
-
-PR = "r2"
-
-SRC_URI[archive.md5sum] = "3a754b1df0a4d5fd4836a05020a0bb4a"
-SRC_URI[archive.sha256sum] = "0be51ee3069a2ef21d98561ee28036dd263ac08b401776fe9164e084825ffd84"
+SRC_URI[archive.md5sum] = "853be8e28aaa4ce48ba60be7d9046bf4"
+SRC_URI[archive.sha256sum] = "fab5f2ac6c842d949861c07cb520afe5bee3dce55805151ce9cd01be0ec46fcd"
 
 DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gconf libxml2 libglade"
 
-- 
1.7.10.4


