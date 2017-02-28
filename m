Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB9A572F83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 18:19:17 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n127so4793797qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qJ+HBCk1DlzgxqhrYXRzScem19yMtmjGumCLOQQUhdU=;
	b=sZXforCN6YRhspyd+1uC2cL6o+CTEv882srZFB1jGbxSg2GLF5QlPj3lNBx2/g+d/k
	j9fuuyzfvBF9XZx7P98QmJkwf6tuEuAYdGHUFq1TXFwKS2HF3UOOQ3uKEzbM8E1Zt7Q5
	LQoBh1VDGR7UO/0C9ZsFQd4V00Fy4/fq2EUPMPL6m+bZPe4K7Gpn+BcGoYP0tJgoBHJT
	855dzi+VE2wi3XTQUQcu2ty25+szU5UTivZiwMgLD8Yd2NdJNCyNC6jKG6Usm+KyfcVC
	7A79VPh2FW5IOiZ9aL6vPcBHqQsan6tXHxC+YNODQWHKZyTyTUs7nqWMxmDs37YsSX4m
	mygg==
X-Gm-Message-State: AMke39mrcde+c9XJ8/sJ4soyK9S1l6j/8R0xq7Kj+MsENBsmEVjMX/hD5SvriZW86oq6jw==
X-Received: by 10.200.57.106 with SMTP id t39mr4794126qtb.20.1488305958221;
	Tue, 28 Feb 2017 10:19:18 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 37sm1471582qto.43.2017.02.28.10.19.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 10:19:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 13:19:00 -0500
Message-Id: <1488305940-13335-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-filesystems][PATCH] xfsprogs: update to version 4.10.0
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
X-List-Received-Date: Tue, 28 Feb 2017 18:19:18 -0000

Add a fix for the UUID linking
Verified the license remains the same after copyright year update

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../xfsprogs/files/link_needed_libs.patch          | 45 +++++++++++++++++-----
 .../{xfsprogs_4.8.0.bb => xfsprogs_4.10.0.bb}      |  9 ++---
 2 files changed, 40 insertions(+), 14 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.8.0.bb => xfsprogs_4.10.0.bb} (83%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
index 18b95c1..1de634e 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
@@ -1,7 +1,7 @@
-Index: xfsprogs-4.8.0/libxcmd/Makefile
+Index: xfsprogs-4.10.0/libxcmd/Makefile
 ===================================================================
---- xfsprogs-4.8.0.orig/libxcmd/Makefile
-+++ xfsprogs-4.8.0/libxcmd/Makefile
+--- xfsprogs-4.10.0.orig/libxcmd/Makefile
++++ xfsprogs-4.10.0/libxcmd/Makefile
 @@ -30,10 +30,21 @@ LCFLAGS += -DENABLE_EDITLINE
  LTLIBS += $(LIBEDITLINE) $(LIBTERMCAP)
  endif
@@ -25,10 +25,10 @@ Index: xfsprogs-4.8.0/libxcmd/Makefile
 +	$(INSTALL_LTLIB_DEV)
  
  -include .ltdep
-Index: xfsprogs-4.8.0/libxfs/Makefile
+Index: xfsprogs-4.10.0/libxfs/Makefile
 ===================================================================
---- xfsprogs-4.8.0.orig/libxfs/Makefile
-+++ xfsprogs-4.8.0/libxfs/Makefile
+--- xfsprogs-4.10.0.orig/libxfs/Makefile
++++ xfsprogs-4.10.0/libxfs/Makefile
 @@ -137,6 +137,7 @@ include $(BUILDRULES)
  
  install: default
@@ -37,10 +37,10 @@ Index: xfsprogs-4.8.0/libxfs/Makefile
  
  install-headers: $(addsuffix -hdrs, $(PKGHFILES))
  
-Index: xfsprogs-4.8.0/libxlog/Makefile
+Index: xfsprogs-4.10.0/libxlog/Makefile
 ===================================================================
---- xfsprogs-4.8.0.orig/libxlog/Makefile
-+++ xfsprogs-4.8.0/libxlog/Makefile
+--- xfsprogs-4.10.0.orig/libxlog/Makefile
++++ xfsprogs-4.10.0/libxlog/Makefile
 @@ -19,6 +19,10 @@ default: ltdepend $(LTLIBRARY)
  
  include $(BUILDRULES)
@@ -53,3 +53,30 @@ Index: xfsprogs-4.8.0/libxlog/Makefile
 +	$(INSTALL_LTLIB_DEV)
  
  -include .ltdep
+Index: xfsprogs-4.10.0/io/Makefile
+===================================================================
+--- xfsprogs-4.10.0.orig/io/Makefile
++++ xfsprogs-4.10.0/io/Makefile
+@@ -13,7 +13,7 @@
+ 	getrusage.c imap.c link.c mmap.c open.c parent.c pread.c prealloc.c \
+ 	pwrite.c reflink.c seek.c shutdown.c sync.c truncate.c utimes.c
+ 
+-LLDLIBS = $(LIBXCMD) $(LIBHANDLE) $(LIBPTHREAD)
++LLDLIBS = $(LIBXCMD) $(LIBHANDLE) $(LIBUUID) $(LIBPTHREAD)
+ LTDEPENDENCIES = $(LIBXCMD) $(LIBHANDLE)
+ LLDFLAGS = -static-libtool-libs
+ 
+Index: xfsprogs-4.10.0/quota/Makefile
+===================================================================
+--- xfsprogs-4.10.0.orig/quota/Makefile
++++ xfsprogs-4.10.0/quotq/Makefile
+@@ -14,7 +14,7 @@
+ PCFILES = darwin.c freebsd.c irix.c linux.c
+ LSRCFILES = $(shell echo $(PCFILES) | sed -e "s/$(PKG_PLATFORM).c//g")
+ 
+-LLDLIBS = $(LIBXCMD)
++LLDLIBS = $(LIBXCMD) $(LIBUUID)
+ LTDEPENDENCIES = $(LIBXCMD)
+ LLDFLAGS = -static
+ 
+
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
similarity index 83%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
index b4c50a2..f7e10cd 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
@@ -3,18 +3,19 @@ HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv2.1"
 LICENSE_libhandle = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=102f7fec3d53c7c8f0b7baf9bf9d76a8"
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://link_needed_libs.patch \
 "
-SRC_URI[md5sum] = "4f047bc9a28b48a95c6db0ad5ce4dbcb"
-SRC_URI[sha256sum] = "82ce9cb3a55f4e208e8fe3471ff0aff0602b8300f3e50bdf05cc7e11549686f9"
+SRC_URI[md5sum] = "ddbb04493addf014db07a7e2b96b2804"
+SRC_URI[sha256sum] = "d8cb9ab2c686699d37914354ce3992b4aff3677093cbce06ad18bf798da8a8a7"
 
 inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
 
+DEPENDS += "util-linux"
 
 RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
 
@@ -54,5 +55,3 @@ do_configure_prepend () {
 do_install_append() {
         oe_runmake 'DESTDIR=${D}' install install-dev
 }
-
-PNBLACKLIST[xfsprogs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130663/"
-- 
2.7.4


