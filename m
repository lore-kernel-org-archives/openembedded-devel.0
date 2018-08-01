Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5EE78D63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w717BqAf022186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:52 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:35 +0800
Message-ID: <6d0ee159fe691ea0666a59a383ad973ad857d75d.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/16] tigervnc: 1.8.0 -> 1.9.0
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
X-List-Received-Date: Wed, 01 Aug 2018 07:11:51 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-tigervnc-remove-includedir.patch    | 16 ++++++-------
 ...005-Remove-INITARGS-from-xserver119.patch.patch | 27 ----------------------
 .../{tigervnc_1.8.0.bb => tigervnc_1.9.0.bb}       | 11 ++++-----
 3 files changed, 13 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.8.0.bb => tigervnc_1.9.0.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch b/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
index 12c4376..f0056d6 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
@@ -1,6 +1,6 @@
-From 4b423cd2e5e4296abca3be553bf64d8cc287180a Mon Sep 17 00:00:00 2001
+From 47f175618a0b0817714ea557c9e93f22f327421e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 20 Jul 2017 17:09:05 +0800
+Date: Tue, 31 Jul 2018 16:39:52 +0800
 Subject: [PATCH 1/4] tigervnc: remove includedir
 
 Upstream-Status: Pending
@@ -15,28 +15,28 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/unix/xserver/hw/vnc/Makefile.am b/unix/xserver/hw/vnc/Makefile.am
-index 0d6a4ac..854f078 100644
+index 470424b..ee18bf9 100644
 --- a/unix/xserver/hw/vnc/Makefile.am
 +++ b/unix/xserver/hw/vnc/Makefile.am
-@@ -22,7 +22,7 @@ libvnccommon_la_SOURCES = $(HDRS) \
+@@ -23,7 +23,7 @@ libvnccommon_la_SOURCES = $(HDRS) \
  
- libvnccommon_la_CPPFLAGS = -DVENDOR_RELEASE="$(VENDOR_RELEASE)" \
+ libvnccommon_la_CPPFLAGS = -DVENDOR_RELEASE="$(VENDOR_RELEASE)" -I$(TIGERVNC_SRCDIR)/unix/common \
  	-DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_H \
 -	-I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} -I$(includedir) \
 +	-I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} \
  	-I$(top_srcdir)/include
  
  bin_PROGRAMS = Xvnc
-@@ -42,7 +42,7 @@ Xvnc_CPPFLAGS = $(XVNC_CPPFLAGS) -DTIGERVNC -DNO_MODULE_EXTS \
+@@ -43,7 +43,7 @@ Xvnc_CPPFLAGS = $(XVNC_CPPFLAGS) -DTIGERVNC -DNO_MODULE_EXTS \
  	-UHAVE_CONFIG_H \
  	-DXFree86Server -DVENDOR_RELEASE="$(VENDOR_RELEASE)" \
- 	-DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common \
+ 	-DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common -I$(TIGERVNC_SRCDIR)/unix/common \
 -	-I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS} -I$(includedir)
 +	-I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS}
  
  Xvnc_LDADD = $(XVNC_LIBS) libvnccommon.la $(COMMON_LIBS) \
  	$(XSERVER_LIBS) $(XSERVER_SYS_LIBS) $(XVNC_SYS_LIBS) -lX11
-@@ -62,7 +62,7 @@ libvnc_la_CPPFLAGS = $(XVNC_CPPFLAGS) -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_
+@@ -64,7 +64,7 @@ libvnc_la_CPPFLAGS = $(XVNC_CPPFLAGS) -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_
  	-I$(top_srcdir)/hw/xfree86/os-support \
  	-I$(top_srcdir)/hw/xfree86/os-support/bus \
  	-I$(top_srcdir)/include \
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch b/meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch
deleted file mode 100644
index 2f342c6..0000000
--- a/meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e4ec992984983ac9107efae1f1cc552007e4229e Mon Sep 17 00:00:00 2001
-From: Vishal Biswas <vshlbiswas@ymail.com>
-Date: Mon, 8 May 2017 11:06:11 +0530
-Subject: [PATCH] Remove INITARGS from xserver119.patch
-
-Upstream-Status: Backport
-
----
- unix/xserver119.patch | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/unix/xserver119.patch b/unix/xserver119.patch
-index 614f104..7adf314 100644
---- a/unix/xserver119.patch
-+++ b/unix/xserver119.patch
-@@ -66,7 +66,7 @@ diff -up xserver/mi/miinitext.c.xserver116-rebased xserver/mi/miinitext.c
-  #include "globals.h"
-  
- +#ifdef TIGERVNC
--+extern void vncExtensionInit(INITARGS);
-++extern void vncExtensionInit(void);
- +#endif
- +
-  /* The following is only a small first step towards run-time
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
index 469745f..f3dc899 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
@@ -15,23 +15,22 @@ REQUIRED_DISTRO_FEATURES = "x11"
 inherit autotools cmake
 B = "${S}"
 
-SRCREV = "4d6e1b8306a8cca8ad5e15ff8201f6ea24459cfd"
+SRCREV = "6f2301d08e64a965ad36b401ec8dc2b24bc47075"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.8-branch \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.9-branch \
            file://0001-tigervnc-remove-includedir.patch \
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
-           file://0005-Remove-INITARGS-from-xserver119.patch.patch \
 "
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "1.19.3"
+XORG_PV ?= "1.19.6"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
 XORG_S = "${WORKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.md5sum] = "015d2fc4b9f2bfe7a626edb63a62c65e"
-SRC_URI[xorg.sha256sum] = "677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98"
+SRC_URI[xorg.md5sum] = "3e47777ff034a331aed2322b078694a8"
+SRC_URI[xorg.sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
-- 
2.7.4


