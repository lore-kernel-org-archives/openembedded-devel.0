Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f178.google.com (mail-gg0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id D671C60EB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2013 05:15:31 +0000 (UTC)
Received: by mail-gg0-f178.google.com with SMTP id n5so1834531ggj.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2013 21:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=T6izGVzn8BBpLVUOeWihhrAXxmvwVJP53bkwe9AyOoc=;
	b=mTHHbMET6nSz3/YPwp8zsFh7fuJ2M5sgCZJ5BU4LjPyJff9/7YSS6Sq2uzoPxh8Hr5
	cvMU4HKY+znGC/SyCSHYouQb4PzPMG2pImIGBatsApqeC+VZZor/OP2PFzTXN7lnRi5p
	9ZMAZ+ni3l4vmtdGhXGC3JLuOEoxfFdoCm27qvw84BMXaxoQ5vTF1veb+B5/qbutiKeD
	nUqlI4GYyc9PvloKJB1/0M/7YrW5OjTpqtjHmyCzTaZlUIyRp53RA/e7nh4ptWX8jjOb
	M47wCX9q8RyKlEyYDU4zSYUJAutsvWmQUIzi12n6i9jU8h+Npysi8AlVq3rgGzZZV5R8
	4gMg==
X-Received: by 10.236.113.237 with SMTP id a73mr812456yhh.147.1388121332729;
	Thu, 26 Dec 2013 21:15:32 -0800 (PST)
Received: from nano.lab.ossystems.com.br (72.17.156.179.nw.nuvox.net.
	[72.17.156.179]) by mx.google.com with ESMTPSA id
	k76sm44863425yho.18.2013.12.26.21.15.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Dec 2013 21:15:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EE9751764748D; Fri, 27 Dec 2013 03:15:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2013 03:15:12 -0200
Message-Id: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][for-dora 1/3] geos: Update to 3.4.2 and rework the packaging
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
X-List-Received-Date: Fri, 27 Dec 2013 05:15:32 -0000

* This updates to the 3.4.2 release and rework the packaging splitting
  the C bindings in another binary package to reduce footprint in
  rootfs; this also moves geos-config to the development package as it
  should.

* Fix -dev installation and upgrade path
  Using 'lib_package' renames the binaries and we need a transitional
  package to be used as upgrade path. This is done using an empty 'geos'
  package which installs the new ones as runtime dependency.

  This same package is used to satisfy -dev dependency of geos package
  allowing for its inclusion into SDK.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../geos-config-Add-includedir-variable.patch      | 39 ++++++++++++++++++++++
 meta-oe/recipes-navigation/geos/geos.inc           | 22 ++++++------
 meta-oe/recipes-navigation/geos/geos_3.3.2.bb      |  7 ----
 meta-oe/recipes-navigation/geos/geos_3.4.2.bb      |  6 ++++
 4 files changed, 56 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
 delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.3.2.bb
 create mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.2.bb

diff --git a/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
new file mode 100644
index 0000000..645e6f6
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
@@ -0,0 +1,39 @@
+From 9d51027c228dafd7db2d0cffca1f0fc695e950fd Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 2 Dec 2013 11:33:26 -0200
+Subject: [PATCH] geos-config: Add includedir variable
+
+This fixes cross-compile as it is easier to mangle the includedir
+during sysroot generation.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ tools/geos-config.in |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/geos-config.in b/tools/geos-config.in
+index 9b45b5f..1749892 100644
+--- a/tools/geos-config.in
++++ b/tools/geos-config.in
+@@ -1,6 +1,7 @@
+ #!/bin/sh
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
++includedir=@includedir@
+ libdir=@libdir@
+ 
+ usage()
+@@ -38,7 +39,7 @@ case $1 in
+     echo @VERSION@
+      ;;
+     --cflags)
+-    echo -I${prefix}/include 
++    echo -I${includedir}
+       ;;
+     --libs)
+       # TODO: make an alias for --clibs
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos.inc
index e0c82bc..2e308b4 100644
--- a/meta-oe/recipes-navigation/geos/geos.inc
+++ b/meta-oe/recipes-navigation/geos/geos.inc
@@ -2,20 +2,20 @@ DESCRIPTION = "GEOS - Geometry Engine, Open Source"
 HOMEPAGE = "http://trac.osgeo.org/geos/"
 SECTION = "libs"
 
-INC_PR = "r1"
-
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig binconfig
+
+PACKAGES =+ "geoslib ${PN}-c1"
+
+DESCRIPTION_${PN}lib = "Geometry engine for Geographic Information Systems - C++ Library"
+FILES_${PN}lib += "${libdir}/libgeos-${PV}.so"
+
+DESCRIPTION_${PN}-c1 = "Geometry engine for Geographic Information Systems - C Library"
+FILES_${PN}-c1 += "${libdir}/libgeos_c.so.*"
 
-# libgeos-${PV}.so is needed in PV
-FILES_SOLIBSDEV = ""
-FILES_${PN}-dev = "${libdir}/*.la \
-                   ${libdir}/libgeos.so \
-                   ${libdir}/libgeos_c.so \
-                   ${includedir}"
-FILES_${PN} += " ${libdir}/libgeos-${PV}.so"
-INSANE_SKIP_${PN} = "dev-so"
+ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN} += "geoslib ${PN}-c1"
diff --git a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
deleted file mode 100644
index e57ca6b..0000000
--- a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require geos.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "5b7270c73fd1c516f368af8fd1962323"
-SRC_URI[sha256sum] = "ec64d3a92540a1618aa3b91dc1235caae1c370ec23afd59a2734062bf182ed5b"
-
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
new file mode 100644
index 0000000..3a9a028
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
@@ -0,0 +1,6 @@
+require geos.inc
+
+SRC_URI += "file://geos-config-Add-includedir-variable.patch"
+
+SRC_URI[md5sum] = "fc5df2d926eb7e67f988a43a92683bae"
+SRC_URI[sha256sum] = "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
-- 
1.8.4.3


