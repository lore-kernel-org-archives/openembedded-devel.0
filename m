Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SZUo9-0007YJ-7I
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 00:22:29 +0200
Received: from mizar.localdomain (87.15.248.154) by smtp209.alice.it
	(8.6.023.02) id 4EF08A6311D68B7B; Wed, 30 May 2012 00:12:13 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2012 00:12:07 +0200
Message-Id: <1338329527-9380-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1338329527-9380-1-git-send-email-andrea.adami@gmail.com>
References: <1338329527-9380-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH 2/2] ubi-utils-klibc: more patch-cleanings
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
X-List-Received-Date: Tue, 29 May 2012 22:22:29 -0000

* remove unnecessary patches after klibc upgrades
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/libiniparser.c.patch       |   24 +++++++----
 .../mtd/ubi-utils-klibc/libmtd.c.patch             |   24 -----------
 .../mtd/ubi-utils-klibc/libubi.c.patch             |   44 --------------------
 .../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb  |    3 +-
 4 files changed, 16 insertions(+), 79 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
index 8be8ac3..45f2439 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
@@ -1,13 +1,19 @@
---- a/ubi-utils/libiniparser.c	2012-04-30 23:59:40.000000000 +0200
-+++ b/ubi-utils/libiniparser.c	2012-04-30 23:55:15.000000000 +0200
-@@ -333,7 +333,9 @@
- 
-     str = iniparser_getstring(d, key, INI_INVALID_KEY);
+--- a/ubi-utils/libiniparser.c	2012-05-29 23:46:08.000000000 +0200
++++ b/ubi-utils/libiniparser.c	2012-05-29 23:45:01.000000000 +0200
+@@ -327,6 +327,8 @@
+   the notfound value is returned.
+  */
+ /*--------------------------------------------------------------------------*/
++/* Floating-point is not supported in klibc */
++/*
+ double iniparser_getdouble(dictionary * d, char * key, double notfound)
+ {
+     char    *   str ;
+@@ -335,6 +337,7 @@
      if (str==INI_INVALID_KEY) return notfound ;
--    return atof(str);
-+    double value;
-+    sscanf(str,"%lf",&value);
-+    return value;
+     return atof(str);
  }
++*/
  
  /*-------------------------------------------------------------------------*/
+ /**
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch
deleted file mode 100644
index f32fb70..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- a/lib/libmtd.c	2012-04-29 21:44:52.000000000 +0200
-+++ b/lib/libmtd.c	2012-04-29 21:43:04.000000000 +0200
-@@ -441,8 +441,8 @@
- 		return -1;
- 	}
- 
--	major = major(st.st_rdev);
--	minor = minor(st.st_rdev);
-+	major = __major(st.st_rdev);
-+	minor = __minor(st.st_rdev);
- 
- 	if (mtd_get_info((libmtd_t *)lib, &info))
- 		return -1;
-@@ -1381,8 +1381,8 @@
- 		return -1;
- 	}
- 
--	major = major(st.st_rdev);
--	minor = minor(st.st_rdev);
-+	major = __major(st.st_rdev);
-+	minor = __minor(st.st_rdev);
- 
- 	if (mtd_get_info((libmtd_t *)lib, &info))
- 		return -1;
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
index 8278a4f..db95904 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -1,27 +1,5 @@
 --- a/ubi-utils/libubi.c	2012-05-01 01:57:51.000000000 +0200
 +++ b/ubi-utils/libubi.c	2012-05-01 01:55:14.000000000 +0200
-@@ -382,8 +402,8 @@
- 		return errmsg("\"%s\" is not a character device", node);
- 	}
- 
--	major = major(st.st_rdev);
--	minor = minor(st.st_rdev);
-+	major = __major(st.st_rdev);
-+	minor = __minor(st.st_rdev);
- 
- 	if (minor == 0) {
- 		errno = EINVAL;
-@@ -448,8 +468,8 @@
- 		return errmsg("\"%s\" is not a character device", node);
- 	}
- 
--	major = major(st.st_rdev);
--	minor = minor(st.st_rdev);
-+	major = __major(st.st_rdev);
-+	minor = __minor(st.st_rdev);
- 
- 	if (minor != 0) {
- 		errno = EINVAL;
 @@ -686,7 +706,7 @@
   * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
   * device number.
@@ -31,25 +9,3 @@
  {
  	int fd, ret;
  
-@@ -757,8 +777,8 @@
- 				  mtd_dev_node);
- 	}
- 
--	major = major(sb.st_rdev);
--	minor = minor(sb.st_rdev);
-+	major = __major(sb.st_rdev);
-+	minor = __minor(sb.st_rdev);
- 
- 	if (major != MTD_CHAR_MAJOR) {
- 		errno = EINVAL;
-@@ -866,8 +886,8 @@
- 		return -1;
- 	}
- 
--	major = major(st.st_rdev);
--	minor = minor(st.st_rdev);
-+	major = __major(st.st_rdev);
-+	minor = __minor(st.st_rdev);
- 
- 	if (ubi_get_info((libubi_t *)lib, &info))
- 		return -1;
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
index f975952..ebdd3f6 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
@@ -6,14 +6,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-PR = "r3"
+PR = "r4"
 
 inherit klibc
 
 SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf32f381c140bf72b21bf91cef1b \
             file://Makefile.patch \
             file://common.mk.patch \
-            file://libmtd.c.patch \
             file://libubi.c.patch \
             file://libiniparser.c.patch \
             file://ubiformat.c.patch \
-- 
1.7.3.4



