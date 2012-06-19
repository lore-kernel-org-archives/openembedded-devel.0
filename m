Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sgt42-00057s-1W
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 09:41:26 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp206.alice.it
	(8.6.023.02) id 4F9BF1D3061B31BE; Tue, 19 Jun 2012 09:30:43 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 09:30:36 +0200
Message-Id: <1340091036-26496-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][meta-initramfs][PATCH] ubi-utils-klibc: catch up with struct renaming in mtd/ubi-user.h
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
X-List-Received-Date: Tue, 19 Jun 2012 07:41:26 -0000

* fix build, broken by header upgrade
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/libubi.c.patch             |    9 +++++++++
 .../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb  |    2 +-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
index db95904..dc86951 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -9,3 +9,12 @@
  {
  	int fd, ret;
  
+@@ -1354,7 +1354,7 @@
+ {
+ 	struct ubi_set_vol_prop_req r;
+ 
+-	memset(&r, 0, sizeof(struct ubi_set_vol_prop_req));
++	memset(&r, 0, sizeof(struct ubi_set_prop_req));
+ 	r.property = property;
+ 	r.value = value;
+ 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
index ebdd3f6..7d5eaac 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-PR = "r4"
+PR = "r5"
 
 inherit klibc
 
-- 
1.7.3.4



