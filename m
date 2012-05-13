Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SThwQ-0006jc-LX
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 01:11:06 +0200
Received: from mizar.localdomain (87.9.251.174) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650ECB4D4F; Mon, 14 May 2012 01:01:08 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2012 01:01:01 +0200
Message-Id: <1336950061-12068-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1336950061-12068-1-git-send-email-andrea.adami@gmail.com>
References: <1336950061-12068-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH 2/2] ubi-utils-klibc: clean patch
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
X-List-Received-Date: Sun, 13 May 2012 23:11:06 -0000

* after klibc refactoring
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/libubi.c.patch             |   27 --------------------
 .../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb  |    5 +--
 2 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
index 97c4fa3..8278a4f 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -1,32 +1,5 @@
 --- a/ubi-utils/libubi.c	2012-05-01 01:57:51.000000000 +0200
 +++ b/ubi-utils/libubi.c	2012-05-01 01:55:14.000000000 +0200
-@@ -36,6 +36,26 @@
- #include "libubi_int.h"
- #include "common.h"
- 
-+/* parts of mtd/ubi-user.h */
-+
-+/* Set an UBI volume property */
-+#define UBI_IOCSETPROP _IOW(UBI_VOL_IOC_MAGIC, 6, struct ubi_set_prop_req)
-+
-+/**
-+ * struct ubi_set_prop_req - a data structure used to set an ubi volume
-+ *                           property.
-+ * @property: property to set (%UBI_PROP_DIRECT_WRITE)
-+ * @padding: reserved for future, not used, has to be zeroed
-+ * @value: value to set
-+ */
-+struct ubi_set_prop_req {
-+	uint8_t  property;
-+	uint8_t  padding[7];
-+	uint64_t value;
-+}  __attribute__ ((packed));
-+
-+/* end parts of mtd/ubi-user.h */
-+
- /**
-  * mkpath - compose full path from 2 given components.
-  * @path: the first component
 @@ -382,8 +402,8 @@
  		return errmsg("\"%s\" is not a character device", node);
  	}
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
index c46ded5..9a8987c 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-PR = "r1"
+PR = "r2"
 
 inherit klibc
 
@@ -36,7 +36,6 @@ PACKAGES =+ "ubinfo-klibc ubiattach-klibc ubidetach-klibc mtdinfo-klibc ubiupdat
              ubimkvol-klibc ubirename-klibc ubirmvol-klibc ubirsvol-klibc \
              ubinize-klibc ubiformat-klibc ubicrc32-klibc"
 
-FILES_ubicrc32-klibc = "${sbindir}/ubicrc32"
 FILES_ubinfo-klibc = "${sbindir}/ubinfo"
 FILES_ubiattach-klibc = "${sbindir}/ubiattach"
 FILES_ubidetach-klibc = "${sbindir}/ubidetach"
@@ -48,4 +47,4 @@ FILES_ubirmvol-klibc = "${sbindir}/ubirmvol"
 FILES_ubirsvol-klibc = "${sbindir}/ubirsvol"
 FILES_ubinize-klibc = "${sbindir}/ubinize"
 FILES_ubiformat-klibc = "${sbindir}/ubiformat"
-
+FILES_ubicrc32-klibc = "${sbindir}/ubicrc32"
-- 
1.7.3.4



