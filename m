Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SWDyQ-0005qF-SU
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2012 23:47:34 +0200
Received: from mizar.localdomain (87.0.30.151) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6310BC7C83; Sun, 20 May 2012 23:37:30 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2012 23:37:22 +0200
Message-Id: <1337549842-1438-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
References: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH 3/3] ubi-utils-klibc: clean ubiformat patch
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
X-List-Received-Date: Sun, 20 May 2012 21:47:35 -0000

* fixes have been committed in klibc for stdio and the additional
* fflush is not necessary anymore (runtime tested pressing CTRL+D)
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/ubiformat.c.patch          |   16 +++-------------
 .../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb  |    2 +-
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
index 7539d76..d21ed57 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
@@ -1,25 +1,15 @@
 --- a/ubi-utils/ubiformat.c	2012-05-03 01:14:39.000000000 +0200
-+++ b/ubi-utils/ubiformat.c	2012-05-03 01:00:57.000000000 +0200
-@@ -246,7 +246,11 @@
++++ b/ubi-utils/ubiformat.c	2012-05-20 23:11:57.000000000 +0200
+@@ -246,7 +246,7 @@
  
  	while (1) {
  		normsg_cont("continue? (yes/no)  ");
 -		if (scanf("%3s", buf) == EOF) {
-+
-+		fflush(stderr);
-+		fflush(stdout);
-+
 +		if (fgets(buf,4,stdin) == NULL) {
  			sys_errmsg("scanf returned unexpected EOF, assume \"yes\"");
  			return 1;
  		}
-@@ -259,10 +263,13 @@
- 
- static int answer_is_yes(void)
- {
-+	fflush(stderr);
-+	fflush(stdout);
-+
+@@ -262,7 +262,7 @@
  	char buf[4];
  
  	while (1) {
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
index 9a8987c..f975952 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-PR = "r2"
+PR = "r3"
 
 inherit klibc
 
-- 
1.7.3.4



