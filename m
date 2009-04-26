Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LyDx8-0001QF-6u
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 01:40:06 +0200
Received: by ewy20 with SMTP id 20so2908914ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Apr 2009 16:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:to:from
	:subject; bh=5maYHwmkPvTwJ5hNohb5r+7PJReVhxNF1kwetuupTY8=;
	b=wIl+ht7WG6JWYDAAaUkJTCcu46FDbqj8OEq+WOwbt3uUrRaSoEaChkmHnuTXhBa40H
	8rXL1LiTl8GMcU8oa85HXPg04L+xst9hE+3bQDvZiOve+xXxz4J/vVbcYISfrUJPzeFP
	rZsWrOl8YCM3LzuUA9zQZLhO1Ur3AQA6EilP4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:to:from:subject;
	b=wP+gOBd5WRcZjZ0OafI1+RHCPvgOG+UwmhTLhtCEFTD3XUXdzE3v2FDt9tN9alfpU/
	GCRdJJqBGZzLEUA+YFWA5OV5XqAq0C5W2yXChy20AIRIHZ2xbHUZn6qbvddmTsBECEBx
	x7XmiKO7wwcuy6zbOFQEnVHwCAdh2L5H22W5c=
Received: by 10.210.53.1 with SMTP id b1mr5101173eba.48.1240788905094;
	Sun, 26 Apr 2009 16:35:05 -0700 (PDT)
Received: from localhost (82-171-51-231.ip.telfort.nl [82.171.51.231])
	by mx.google.com with ESMTPS id 24sm5528816eyx.53.2009.04.26.16.35.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 26 Apr 2009 16:35:04 -0700 (PDT)
Message-ID: <49f4efa8.1818d00a.3e97.4971@mx.google.com>
Date: Sun, 26 Apr 2009 16:35:04 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
From: leon.woestenberg@gmail.com
Subject: [PATCH] madwifi-ng_r3837: Fix for LDFLAGS / GNU_HASH QA
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Apr 2009 23:40:06 -0000

Submit LDFLAGS variable to make.
Remove the cleaning of LDFLAGS in the binary Makefiles.
Unset LDFLAGS for the kernel modules compile.

Compile tested on powerpc (mpc8313e-rdb).

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>

diff --git a/recipes/madwifi/files/respect-ldflags.patch b/recipes/madwifi/files/respect-ldflags.patch
new file mode 100644
index 0000000..1e5e360
--- /dev/null
+++ b/recipes/madwifi/files/respect-ldflags.patch
@@ -0,0 +1,39 @@
+Index: madwifi-trunk-r3837-20080802/Makefile
+===================================================================
+--- madwifi-trunk-r3837-20080802.orig/Makefile	2009-04-27 00:34:19.000000000 +0200
++++ madwifi-trunk-r3837-20080802/Makefile	2009-04-27 00:34:31.000000000 +0200
+@@ -61,7 +61,7 @@
+ 		$(MAKE) -C $$i || exit 1; \
+ 	done
+ else
+-	$(MAKE) -C $(KERNELPATH) SUBDIRS=$(shell pwd) modules
++	$(MAKE) -C $(KERNELPATH) LDFLAGS= SUBDIRS=$(shell pwd) modules
+ endif
+ 
+ $(addprefix $(obj)/, $(obj-y:/=)): $(TOP)/svnversion.h
+Index: madwifi-trunk-r3837-20080802/tools/Makefile
+===================================================================
+--- madwifi-trunk-r3837-20080802.orig/tools/Makefile	2009-04-27 00:34:19.000000000 +0200
++++ madwifi-trunk-r3837-20080802/tools/Makefile	2009-04-27 00:34:36.000000000 +0200
+@@ -55,7 +55,7 @@
+ INCS = -I. -I$(HAL) -I$(TOP) -I$(ATH_HAL)
+ CFLAGS = -g -O2 -Wall
+ ALL_CFLAGS = $(CFLAGS) $(INCS)
+-LDFLAGS =
++#LDFLAGS =
+ 
+ all: all-subdirs $(PROGRAMS)
+ 
+Index: madwifi-trunk-r3837-20080802/tools/ath_info/Makefile
+===================================================================
+--- madwifi-trunk-r3837-20080802.orig/tools/ath_info/Makefile	2009-04-27 00:34:19.000000000 +0200
++++ madwifi-trunk-r3837-20080802/tools/ath_info/Makefile	2009-04-27 00:34:40.000000000 +0200
+@@ -5,7 +5,7 @@
+ USER_CROSS_COMPILE ?= $(CROSS_COMPILE)
+ CC = $(USER_CROSS_COMPILE)gcc
+ CFLAGS = -g -O2 -W -Wall
+-LDFLAGS =
++#LDFLAGS =
+ PREFIX = /usr/local
+ BINDIR = $(PREFIX)/bin
+ MANDIR = $(PREFIX)/share/man
diff --git a/recipes/madwifi/madwifi-ng_r.inc b/recipes/madwifi/madwifi-ng_r.inc
index 8fc3065..59f8bc5 100644
--- a/recipes/madwifi/madwifi-ng_r.inc
+++ b/recipes/madwifi/madwifi-ng_r.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 RDEPENDS = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
-PR ="r5"
+PR ="r6"
 
 WACKELF_SRC_URI = ""
 WACKELF_SRC_URI_ixp4xx = " file://20-xscale-VFP-wackelf.patch;patch=1"
@@ -21,19 +21,19 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit module-base
 
-ARCH_efika="powerpc"
 ARCH_dht-walnut="ppc"
+ARCH_efika="powerpc"
 ARCH_magicbox="ppc"
+ARCH_mpc8313e-rdb="powerpc"
+ARCH_mpc8315e-rdb="powerpc"
 ARCH_sequoia="ppc"
 
-EXTRA_OEMAKE = "LDFLAGS= KERNELPATH=${STAGING_KERNEL_DIR} KERNELRELEASE=${KERNEL_VERSION} TOOLPREFIX=${TARGET_PREFIX}"
+EXTRA_OEMAKE = "KERNELPATH=${STAGING_KERNEL_DIR} KERNELRELEASE=${KERNEL_VERSION} TOOLPREFIX=${TARGET_PREFIX}"
 
 EXTRA_OEMAKE_prepend_ixp4xxle = "TARGET=xscale-le-elf "
 EXTRA_OEMAKE_prepend_ixp4xxbe = "TARGET=xscale-be-elf "
 
-
 do_compile() {
-	unset LDFLAGS
 	oe_runmake all
 }
 
@@ -61,3 +61,4 @@ fi
 PACKAGES += "${PN}-modules ${PN}-tools"
 FILES_${PN}-modules = "/lib/modules/"
 FILES_${PN}-tools = "/usr/"
+
diff --git a/recipes/madwifi/madwifi-ng_r3837-20080802.bb b/recipes/madwifi/madwifi-ng_r3837-20080802.bb
index bf14c33..d79ff3c 100644
--- a/recipes/madwifi/madwifi-ng_r3837-20080802.bb
+++ b/recipes/madwifi/madwifi-ng_r3837-20080802.bb
@@ -12,7 +12,9 @@ require madwifi-ng_r.inc
 WACKELF_SRC_URI_ixp4xx =          " file://20-xscale-VFP-wackelf-v2.patch;patch=1"
 WACKELF_SRC_URI_compulab-pxa270 = " file://20-xscale-VFP-wackelf-v2.patch;patch=1"
 
+SRC_URI += "file://respect-ldflags.patch;patch=1"
+
 SRCNAME = "madwifi-trunk"
 
 # PR set after the include, to override what's set in the included file.
-PR = "r1"
+PR = "r2"


