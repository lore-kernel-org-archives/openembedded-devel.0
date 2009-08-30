Received: from [209.85.217.223] (helo=mail-gx0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhZDa-0005iQ-Kc
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 03:28:30 +0200
Received: by gxk23 with SMTP id 23so4029929gxk.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 18:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=OMdKynwGGIRzaA84VphdZ+OcI45ilFRPXz7cLjgncdY=;
	b=xqtRtkevNWh49oO1+pwywqID8DJ2YreKoPAt0u5tkjpjaJe6zVdZJB1++htfwq7FI+
	P5cxTKtQwudQMtII2AV3sIcFTsgXrUgYiNsdl1cEfGS0XsiVKrKpm7EGlm7rY8uMjQNT
	kGGtwtJz9t0ddJ/wcEX8wAr+T8GWIbReqnNK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=QWoNClupS2o5pT6/TBVmwYNpzIs7y1JQVYWFOn9PtlQPNmG3TV5MjnnnZmQjFozRCG
	64Rz86HGDApPSecFtv4m/UD730pBDRJGH1SMg4vNlcVTz/tY0IRjDj216YCOlACpIoNz
	IODCU7to/C/2kPFnWI110l0iR3tp7BJAnajl8=
Received: by 10.150.183.11 with SMTP id g11mr5499263ybf.50.1251594608411;
	Sat, 29 Aug 2009 18:10:08 -0700 (PDT)
Received: from localhost (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 21sm1773525pzk.11.2009.08.29.18.10.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Aug 2009 18:10:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Aug 2009 18:09:56 -0700
Message-Id: <1251594596-4738-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] micro-uclibc, minimal-uclibc: Reorder including the base distro config.
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
X-List-Received-Date: Sun, 30 Aug 2009 01:28:31 -0000

A lot of stuff in these conf's are already set and
is duplicated. This is removed. The base conf file
should be included at the end after assigning LIBC
so that correct toolchain configuration is picked.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/micro-uclibc.conf   |   30 ++++--------------------------
 conf/distro/minimal-uclibc.conf |   20 ++------------------
 2 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/conf/distro/micro-uclibc.conf b/conf/distro/micro-uclibc.conf
index f793d4a..9cce7d1 100644
--- a/conf/distro/micro-uclibc.conf
+++ b/conf/distro/micro-uclibc.conf
@@ -7,42 +7,20 @@
 #@COMMENT: based on uclibc.
 #############################################################################
 
-# Based on the Micro Linux distribution
-require conf/distro/micro.conf
-
 # Use overrides for micro as well
 OVERRIDES .= ":micro"
 
 #############################################################################
 # DISTRO CONFIGURATION
 #############################################################################
-DISTRO_NAME = "micro-uclibc"
 
-#############################################################################
-# TARGET OS 
-#############################################################################
-# Use linux uclibc
-TARGET_OS = "linux-uclibc"
-TARGET_OS_armeb = "linux-uclibcgnueabi"
+DISTRO_NAME = "micro-uclibc"
 
 #############################################################################
 # TOOLCHAIN
 #############################################################################
-LIBC = "uclibc"
-
-#############################################################################
-# PREFERRED PROVIDERS 
-#############################################################################
-PREFERRED_PROVIDER_virtual/libc		= "uclibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc	= "uclibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils	= "binutils-cross"
-PREFERRED_PROVIDER_linux-libc-headers	= "linux-libc-headers"
-PREFERRED_PROVIDER_virtual/libintl	= "proxy-libintl"
-PREFERRED_PROVIDER_virtual/libiconv     = "libiconv"
 
-#############################################################################
-# PREFERRED VERSIONS 
-#############################################################################
-PREFERRED_VERSION_uclibc = "0.9.30.1"
-PREFERRED_VERSION_uclibc-initial = "0.9.30.1"
+LIBC = "uclibc"
+# Based on the Micro Linux distribution
+require conf/distro/micro.conf
 
diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index f246bff..9594622 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -1,7 +1,7 @@
 #-----------------------------------------------------------------------------
 #@TYPE: Distribution
-#@NAME: Minimal uClibC
-#@DESCRIPTION: uClibC Embedded Linux Distribution Configuration (minimal)
+#@NAME: Minimal uClibc
+#@DESCRIPTION: uClibc based Embedded Linux Distribution Configuration (minimal)
 #
 #@COMMENT: This distribution configuration serves as a starting point for
 #@COMMENT: the integration of new target platforms, machines, or distributions.
@@ -13,25 +13,9 @@
 #
 DISTRO_NAME = "minimal-uclibc"
 
-#
-# Target OS & FPU system
-#
-TARGET_OS = "linux-uclibc"
 TARGET_FPU_arm = "soft"
 TARGET_FPU_armeb = "soft"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
-PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 
-# Override the default virtual/libintl
 LIBC = "uclibc"
-PREFERRED_PROVIDER_virtual/libintl = "proxy-libintl"
-
-USE_NLS ?= "no"
-USE_NLS_glib-2.0 = "yes"
-USE_NLS_glib-2.0-native = "yes"
-USE_NLS_gcc-cross = "no"
-
-PREFERRED_VERSION_uclibc ?= "0.9.30.1"
-PREFERRED_VERSION_uclibc-initial ?= "0.9.30.1"
 
 require conf/distro/minimal.conf
-- 
1.6.3.3



