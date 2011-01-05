Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaXUy-0002W5-EK
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 18:50:12 +0100
Received: by pxi17 with SMTP id 17so3021771pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 09:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=DnxVaTwDzBC+HYhduJikBm4uOCRCgP0L8Yw/kzSDK9g=;
	b=fOa5z7umVuOPXpFtxWAySzLtQrX8hETUMthujc+sKPqpdHFCdID+3uyOAwuL7xHNQ1
	C6gHfrUSPPlcyWbZTDLeOlMH1eQejMqQn0Es12xTuZVy+Rqv4LVlEMlyrIbNgQzrxuUo
	h6za+2yAy7v3/wQlKwUbyy2jQG9+DcVU2fIDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IWHNzb2c/WoCkl9TV02FKyf9Ddkui3eWoWPgqN1lqUL/+3J0pDv7EdgAB+W+3FhEvk
	i7LzJr4RAHgrnAJ9hc6YOzTzsmWKVy/QaLoM4F9sezNu+I/CTlssF20LowoNMgT9XQDl
	D4XYzT4TvQJgFkBEy6voGUza6Q8/l2QQcOGMs=
Received: by 10.142.49.11 with SMTP id w11mr15567213wfw.166.1294249786346;
	Wed, 05 Jan 2011 09:49:46 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e14sm32701903wfg.20.2011.01.05.09.49.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 05 Jan 2011 09:49:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jan 2011 09:49:47 -0800
Message-Id: <1294249787-6035-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] distro/slugos: Upgrade to use gcc 4.5 and libtool 2.4
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
X-List-Received-Date: Wed, 05 Jan 2011 17:50:13 -0000

* Depend on sane-toolchain
* Upgrade few old pinned versions
* Inherit own-mirrors to define slug src mirror

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/preferred-slugos-versions.inc |   22 +-------------------
 conf/distro/include/slugos.inc                    |    9 ++-----
 conf/distro/slugos.conf                           |    7 +-----
 3 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index 6ae4432..a92f95f 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -26,38 +26,20 @@ PREFERRED_VERSION_autoconf			?= "2.65"
 PREFERRED_VERSION_autoconf-native		?= "2.65"
 PREFERRED_VERSION_automake			?= "1.11.1"
 PREFERRED_VERSION_automake-native		?= "1.11.1"
-PREFERRED_VERSION_binutils			?= "2.20.1"
-PREFERRED_VERSION_binutils-cross		?= "2.20.1"
-PREFERRED_VERSION_binutils-cross-sdk		?= "2.20.1"
 PREFERRED_VERSION_busybox			?= "1.18.1"
 PREFERRED_VERSION_dbus				?= "1.2.3"
-PREFERRED_VERSION_eglibc			?= "2.11"
-PREFERRED_VERSION_eglibc-initial		?= "2.11"
-PREFERRED_VERSION_gcc				?= "4.4.4"
-PREFERRED_VERSION_gcc-cross			?= "4.4.4"
-PREFERRED_VERSION_gcc-cross-sdk			?= "4.4.4"
-PREFERRED_VERSION_gcc-cross-initial		?= "4.4.4"
-PREFERRED_VERSION_gcc-cross-intermediate	?= "4.4.4"
-PREFERRED_VERSION_glib-2.0			?= "2.22.1"
-PREFERRED_VERSION_glib-2.0-native		?= "2.22.1"
-PREFERRED_VERSION_glibc				?= "2.10.1"
-PREFERRED_VERSION_glibc-initial			?= "2.10.1"
+PREFERRED_VERSION_glib-2.0			?= "2.26.1"
+PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"
 PREFERRED_VERSION_gtk+				?= "2.18.6"
 PREFERRED_VERSION_gtk+-native			?= "2.18.6"
 PREFERRED_VERSION_ipkg				?= "0.99.163"
 PREFERRED_VERSION_ipkg-native			?= "0.99.163"
-PREFERRED_VERSION_libtool			?= "2.2.6b"
-PREFERRED_VERSION_libtool-native		?= "2.2.6b"
-PREFERRED_VERSION_libtool-cross			?= "2.2.6b"
-PREFERRED_VERSION_libtool-sdk			?= "2.2.6b"
 PREFERRED_VERSION_linux-libc-headers		?= "2.6.23"
 PREFERRED_VERSION_m4				?= "1.4.14"
 PREFERRED_VERSION_m4-native			?= "1.4.14"
 PREFERRED_VERSION_nslu2-linksys-firmware	?= "2.3r63"
 PREFERRED_VERSION_pkgconfig			?= "0.23"
 PREFERRED_VERSION_pkgconfig-native		?= "0.23"
-PREFERRED_VERSION_uclibc			?= "0.9.30.1"
-PREFERRED_VERSION_uclibc-initial		?= "0.9.30.1"
 PREFERRED_VERSION_udev				?= "118"
 
 ##################### Stuff with special notes, and broken stuff:
diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
index bbfd907..2fb6957 100644
--- a/conf/distro/include/slugos.inc
+++ b/conf/distro/include/slugos.inc
@@ -30,13 +30,10 @@ THUMB_INTERWORK = "yes"
 #    arm system and vice versa.  It is strongly recommended that DISTROs not
 #    turn this off - the actual cost is very small.
 # We want images supporting the following features (for task-base)
-DISTRO_FEATURES = "largefile ipv4 ipv6 nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda pcmcia usbhost pci"
+DISTRO_FEATURES = "largefile ipv4 ipv6 nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda pcmcia usbhost pci eabi"
 # We may also wish to enable raid support at some point (space permitting)
 #DISTRO_FEATURES += " raid"
 
-# Add thumb-interwork to feature list if selected machine supports it.
-DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) == "yes"]}'
-
 IMAGE_BASENAME = "${@['slugos${SITEINFO_ENDIANNESS}', 'ucslugc'][bb.data.getVar('TARGET_OS', d, 1) == 'linux-uclibc']}"
 
 # The following need not be set, the defaults should be adequate
@@ -111,8 +108,8 @@ DISTRO_EXTRA_DEPENDS ?= ""
 DISTRO_EXTRA_RDEPENDS ?= ""
 DISTRO_EXTRA_RRECOMMENDS ?= ""
 
-CVS_TARBALL_STASH = "http://sources.nslu2-linux.org/sources/"
-INHERIT += "nslu2-mirrors"
+SOURCE_MIRROR_URL = "http://sources.nslu2-linux.org/sources/"
+INHERIT += "own-mirrors"
 
 #FIXME: HACK: REMOVE THIS
 IGNORE_STRIP_ERRORS = ""
diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
index 5f9c06c..7fb6d1c 100644
--- a/conf/distro/slugos.conf
+++ b/conf/distro/slugos.conf
@@ -11,16 +11,11 @@ DISTRO_NAME = "SlugOS"
 DISTRO_TYPE = "alpha"
 TARGET_ARCH ?= "armeb"
 ARM_INSTRUCTION_SET = "arm"
-TARGET_OS = "linux-gnueabi"
 IPKG_VARIANT ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_opkg ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg-nocurl-slugos"
 IMAGE_INITSCRIPTS ?= "initscripts-slugos"
 
 require conf/distro/include/slugos.inc
-
-# Can be either glibc or eglibc (or perhaps even uclibc)
-LIBC ?= "eglibc"
-require conf/distro/include/${LIBC}.inc
+require conf/distro/include/sane-toolchain.inc
 require conf/distro/include/arm-thumb.inc
-
-- 
1.7.0.4



