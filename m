Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1ShqtI-0001hZ-BK
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 01:34:20 +0200
Received: from mizar.localdomain (87.14.251.158) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B0E4B7BD9; Fri, 22 Jun 2012 01:23:34 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 01:23:31 +0200
Message-Id: <1340321011-5631-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][meta-initramfs][PATCH] ubi-utils-klibc_1.5.0: fix build because of ioctl renaming
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
X-List-Received-Date: Thu, 21 Jun 2012 23:34:20 -0000

* This patch follows the one in oe-core for mtd-utils_1.5.0
* which was staging an older version of the ubi-user.h header.
* We need to match the renaming done in kernel 3.0
* http://lists.infradead.org/pipermail/linux-mtd/2011-March/
* 034419.html

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/libubi.c.patch             |   17 +++++++++++++++++
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb  |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
index db95904..b52e207 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -9,3 +9,20 @@
  {
  	int fd, ret;
  
+@@ -1346,13 +1346,13 @@
+ 
+ int ubi_set_property(int fd, uint8_t property, uint64_t value)
+ {
+-	struct ubi_set_prop_req r;
++	struct ubi_set_vol_prop_req r;
+ 
+-	memset(&r, 0, sizeof(struct ubi_set_prop_req));
++	memset(&r, 0, sizeof(struct ubi_set_vol_prop_req));
+ 	r.property = property;
+ 	r.value = value;
+ 
+-	return ioctl(fd, UBI_IOCSETPROP, &r);
++	return ioctl(fd, UBI_IOCSETVOLPROP, &r);
+ }
+ 
+ int ubi_leb_unmap(int fd, int lnum)
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
index 2095552..d4d0055 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-PR = "r0"
+PR = "r1"
 
 inherit klibc
 
-- 
1.7.3.4



