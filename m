Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NLMf7-0001CB-PG
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 21:09:29 +0100
Received: by ywh26 with SMTP id 26so2457607ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2009 12:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sywJZGjIG35mEs+LS4C9HGXT+ow2jm7ZGT8XP3GUCgI=;
	b=xU8CbwLQMGLwpcgDDbKlGjcbyxwg/vFqOUbFDto530gWVCT78i/4RscPTspeJNFvTD
	sUROn9/7eCeALdpivJ2g4982Rmux/GnK2GJwN0BdqjsHt3LmCzfh48GMILJ9c2DpyWHR
	nMxpF8gd11aLtxAM/2WbheT7fEeaGxAnp/MgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wfLbggOifI8khy+CEj1ZbhzyFZqeJOMRIc80bMcfOkhcK/wy/BPgBdgpqCuikmJTCv
	HugQDzhwoWHdej4lbg1z6Q50pu25fmS+ECljLoj0dvJrbQ10HvFklGqfvp3Wwv/C+uE/
	MnGEB1MzSTZbUJuOt015NJrAJGW5yqAKFGBlE=
Received: by 10.91.31.20 with SMTP id i20mr3263766agj.20.1261080456628;
	Thu, 17 Dec 2009 12:07:36 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 14sm1119593gxk.6.2009.12.17.12.07.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 17 Dec 2009 12:07:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Dec 2009 12:07:33 -0800
Message-Id: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Thu, 17 Dec 2009 20:09:29 -0000

* This is not supporting multilib
* Only 64-bit userspace can be built.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/include/tune-x86_64.inc |    4 ++++
 conf/machine/x86_64-generic.conf     |   31 +++++++++++++++++++++++++++++++
 recipes/gcc/gcc-common.inc           |    4 ++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/tune-x86_64.inc
 create mode 100644 conf/machine/x86_64-generic.conf

diff --git a/conf/machine/include/tune-x86_64.inc b/conf/machine/include/tune-x86_64.inc
new file mode 100644
index 0000000..db2a560
--- /dev/null
+++ b/conf/machine/include/tune-x86_64.inc
@@ -0,0 +1,4 @@
+TARGET_CC_ARCH = "-mtune=generic"
+BASE_PACKAGE_ARCH = "x86_64"
+FEED_ARCH = "x86_64"
+PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
diff --git a/conf/machine/x86_64-generic.conf b/conf/machine/x86_64-generic.conf
new file mode 100644
index 0000000..0dad0ff
--- /dev/null
+++ b/conf/machine/x86_64-generic.conf
@@ -0,0 +1,31 @@
+# Copyright (C) 2007,2009 Stelios Koroneos - Digital OPSiS, All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+#@TYPE: Machine
+#@NAME: x86_64-generic
+#@DESCRIPTION: Machine configuration for a generic x86_64 machine
+
+
+TARGET_ARCH = "x86_64"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
+XSERVER="xserver-kdrive-vesa"
+
+KERNEL_IMAGETYPE = "bzImage"
+
+GLIBC_ADDONS = "nptl"
+GLIBC_EXTRA_OECONF = "--with-tls"
+
+IMAGE_FSTYPES ?= "ext2.gz"
+IMAGE_DEVICE_TABLES = " \
+  files/device_table-minimal.txt \
+  files/device_table_add-loop.txt \
+  files/device_table_add-scsi.txt \
+"
+
+MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost acpi ext2 x86"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+
+#tune for x86_64
+require conf/machine/include/tune-x86_64.inc
+
diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
index 6e777e6..772e7a7 100644
--- a/recipes/gcc/gcc-common.inc
+++ b/recipes/gcc/gcc-common.inc
@@ -15,6 +15,10 @@ def get_gcc_fpu_setting(bb, d):
         return "--with-float=soft"
     return ""
 
+EXTRA_OECONF_append_x86_64	= " --disable-multilib"
+EXTRA_OECONF_append_mips64	= " --disable-multilib"
+EXTRA_OECONF_append_powerpc64	= " --disable-multilib"
+
 # We really need HOST_SYS here for some packages and TARGET_SYS for others.
 # For now, libgcc is most important so we fix for that - RP.
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
-- 
1.5.4.3



