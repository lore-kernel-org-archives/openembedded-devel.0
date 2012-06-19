Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SgtK1-0005ZM-Bk
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 09:57:57 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp208.alice.it
	(8.6.023.02) id 4F056E851301BE30; Tue, 19 Jun 2012 09:47:14 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 09:47:09 +0200
Message-Id: <1340092029-30030-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1340091036-26496-1-git-send-email-andrea.adami@gmail.com>
References: <1340091036-26496-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH v2] ubi-utils-klibc: catch up with struct renaming in mtd/ubi-user.h
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
X-List-Received-Date: Tue, 19 Jun 2012 07:57:57 -0000

* v2 replaces malformed v1 patch
* fix build, broken by header upgrade
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/libubi.c.patch             |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
index db95904..048e39b 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -9,3 +9,20 @@
  {
  	int fd, ret;
  
+@@ -1352,13 +1352,13 @@
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
-- 
1.7.3.4



