Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MRYl6-00007k-0f
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jul 2009 23:44:56 +0200
Received: by rv-out-0708.google.com with SMTP id l33so84133rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2009 14:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Z/t0KJNyOFJx/+AG2K9QHrtR4tDFQOQobUkTQ8jC5Zw=;
	b=rW8LNmTn6Rpx+hGGKOF1neqUuIBGTwYS5ndSPLvwX8qyQBlKee7RiIsXx3XElilKYG
	lRX2GtZl2JDBNA4T/2XDD43G9rdnApsKbN+MW9xBHMuYwamAN0vWgGiGpPZtnYy6CbDJ
	n8juMxJdOUAlVa8+YssFh9tbegyYq7eAG7D+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EjnbL3tonUHK/UscWdyAROsz2dFTa0u0GEag7Kx/2xC50zOu+eLan9bY4zZKcyE6pH
	4zBbJb3zJY8Xqp7CH1VNtpNyNFaICpMGp6OPRGBCPvzHicWZvMrV2++UiDPgbrZjsL8U
	fyO1QaTnIIQbKNuC/RG1tirS/THKk0OSf+WNg=
Received: by 10.140.171.15 with SMTP id t15mr166831rve.134.1247779883004;
	Thu, 16 Jul 2009 14:31:23 -0700 (PDT)
Received: from localhost (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id g31sm2402709rvb.0.2009.07.16.14.31.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Jul 2009 14:31:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jul 2009 14:31:20 -0700
Message-Id: <1247779880-31274-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] util-linux-ng: Do not provide libblkid.
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
X-List-Received-Date: Thu, 16 Jul 2009 21:44:56 -0000

	Currently we let utils-linux-ng provide
	libblkid package which then ends up being
	provided twice once from e2fsprogs-libs and
	once from util-linux-ng. Future versions might
	move libblkid and libuuid to utils-linux-ng
	till then we will use e2fsprogs-libs provided one
	on the system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/util-linux-ng/util-linux-ng.inc       |   15 ++-------------
 recipes/util-linux-ng/util-linux-ng_2.13.1.bb |    1 +
 recipes/util-linux-ng/util-linux-ng_2.14.bb   |    1 +
 recipes/util-linux-ng/util-linux-ng_2.15.bb   |    1 +
 4 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 59d2f08..44cd94c 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -1,14 +1,14 @@
 DESCRIPTION = "Util-linux-ng is a suite of essential utilities for any Linux system."
 SECTION = "base"
 LICENSE = "GPL"
-DEPENDS = "udev zlib ncurses virtual/libintl e2fsprogs-libs"
+DEPENDS = "udev zlib ncurses virtual/libintl"
 
 inherit autotools_stage
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 # allows for a release candidate
 RC ?= ""
@@ -16,7 +16,6 @@ RC ?= ""
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2"
 
 PACKAGES =+ "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-swaponoff util-linux-ng-losetup util-linux-ng-umount util-linux-ng-mount util-linux-ng-readprofile "
-PACKAGES_DYNAMIC = "libblkid*"
 
 FILES_${PN}-doc += "/usr/share/misc/getopt/getopt-*.*"
 FILES_${PN} = "${bindir} ${sbindir} ${base_bindir} ${base_sbindir}"
@@ -139,16 +138,6 @@ do_install () {
 	ln -sf ${sbindir}/shutdown ${D}${sbindir}/fasthalt
 }
 
-python populate_packages_prepend () {
-	ulinxng_libdir = bb.data.expand('${libdir}', d)
-	ulinxng_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
-	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev', allow_links=True)
-	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so\.*', 'lib%s', 'util-linux-ng %s library', extra_depends='', allow_links=True)
-}
-
-
 pkg_postinst_${PN} () {
 	update-alternatives --install ${base_bindir}/dmesg dmesg dmesg.${PN} 100
 	update-alternatives --install ${base_bindir}/kill kill kill.${PN} 100
diff --git a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
index c239b15..73e6023 100644
--- a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
+++ b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
@@ -1,4 +1,5 @@
 require util-linux-ng.inc
+DEPENDS += "e2fsprogs-libs"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v2.13/util-linux-ng-${PV}${RC}.tar.bz2"
 #SRC_URI += "file://util-linux_2.12r-12.diff.gz;patch=1"
diff --git a/recipes/util-linux-ng/util-linux-ng_2.14.bb b/recipes/util-linux-ng/util-linux-ng_2.14.bb
index d7eafd3..b5972a9 100644
--- a/recipes/util-linux-ng/util-linux-ng_2.14.bb
+++ b/recipes/util-linux-ng/util-linux-ng_2.14.bb
@@ -1,4 +1,5 @@
 require util-linux-ng.inc
+DEPENDS += "e2fsprogs-libs"
 
 PR = "${INC_PR}"
 
diff --git a/recipes/util-linux-ng/util-linux-ng_2.15.bb b/recipes/util-linux-ng/util-linux-ng_2.15.bb
index 0c2416f..396b41d 100644
--- a/recipes/util-linux-ng/util-linux-ng_2.15.bb
+++ b/recipes/util-linux-ng/util-linux-ng_2.15.bb
@@ -1,4 +1,5 @@
 require util-linux-ng.inc
+DEPENDS += "e2fsprogs-libs"
 
 PR = "${INC_PR}"
 
-- 
1.5.4.3



