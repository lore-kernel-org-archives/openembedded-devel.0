Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZVTX-0002P4-EM
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 22:56:14 +0200
Received: by eyf5 with SMTP id 5so316653eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ukj+U6kXC7X1W2b6FG/ou4PmwmgcScT7vEAG/3Wlvwc=;
	b=StuAVE7wcIAnMh6xjpTnqFsvEd51khQaijNu6JaPNunywEcwRyPWvHrsq9ipOPb0/0
	y4W3A9Ub+EMSuXo1wHN0p20BcEBe24ObiQLx4SHTgAHXp+/As7XXUtWQIDS3svbeLY9D
	N5vbOMvckeWage1vUrJP0fyFm1cqjQPej/y1A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UgrP1DcO6f7TkPqJruajfCGU7zwlf5zNWLN7j9bFWI1TY+Iqe3M/++YcEwrsCGZ9fc
	48JWI6fzgR0zBiOYVPqrMBOdHb88O3mWPLgboO6madTWNgmBBk56zRR4yNXLwF9boSit
	1UTSu6gpJoMLuBSqRPLuVq+0NdVLGxbgb93zc=
Received: by 10.213.9.193 with SMTP id m1mr2752928ebm.3.1279227366932;
	Thu, 15 Jul 2010 13:56:06 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v59sm11279849eeh.22.2010.07.15.13.56.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 13:56:06 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 22:56:02 +0200
Message-Id: <1279227362-6279-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,PLING_QUERY,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] binutils: added COMPATIBLE_TARGET_SYS = "(?!nios2)"
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
X-List-Received-Date: Thu, 15 Jul 2010 20:56:15 -0000

added COMPATIBLE_TARGET_SYS = "(?!nios2)" to all versions
that do not support nios2.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
Once accepted I will remove the pinning from nios2.inc

Frans

 recipes/binutils/binutils_2.14.90.0.6.bb      |    2 ++
 recipes/binutils/binutils_2.14.90.0.7.bb      |    2 ++
 recipes/binutils/binutils_2.15.94.0.1.bb      |    2 ++
 recipes/binutils/binutils_2.16.1.bb           |    2 ++
 recipes/binutils/binutils_2.16.91.0.6.bb      |    2 ++
 recipes/binutils/binutils_2.16.91.0.7.bb      |    2 ++
 recipes/binutils/binutils_2.16.bb             |    2 ++
 recipes/binutils/binutils_2.17.50.0.1.bb      |    2 ++
 recipes/binutils/binutils_2.17.50.0.5.bb      |    2 ++
 recipes/binutils/binutils_2.17.50.0.8.bb      |    2 ++
 recipes/binutils/binutils_2.17.bb             |    2 ++
 recipes/binutils/binutils_2.18.50.0.7.bb      |    2 ++
 recipes/binutils/binutils_2.18.atmel.1.0.1.bb |    2 ++
 recipes/binutils/binutils_2.18.bb             |    2 ++
 recipes/binutils/binutils_2.19.1.bb           |    2 ++
 recipes/binutils/binutils_2.19.51.0.3.bb      |    2 ++
 recipes/binutils/binutils_2.19.51.bb          |    2 ++
 recipes/binutils/binutils_2.19.bb             |    2 ++
 recipes/binutils/binutils_2.20.bb             |    2 ++
 recipes/binutils/binutils_cvs.bb              |    2 ++
 20 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/recipes/binutils/binutils_2.14.90.0.6.bb b/recipes/binutils/binutils_2.14.90.0.6.bb
index c539a9f..8ec66d3 100644
--- a/recipes/binutils/binutils_2.14.90.0.6.bb
+++ b/recipes/binutils/binutils_2.14.90.0.6.bb
@@ -5,6 +5,8 @@ inherit autotools gettext
 INC_PR = "r5"
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 DESCRIPTION = "A GNU collection of binary utilities"
 HOMEPAGE = "http://www.gnu.org/software/binutils/"
 LICENSE = "GPL"
diff --git a/recipes/binutils/binutils_2.14.90.0.7.bb b/recipes/binutils/binutils_2.14.90.0.7.bb
index 4f5a560..d08ccaf 100644
--- a/recipes/binutils/binutils_2.14.90.0.7.bb
+++ b/recipes/binutils/binutils_2.14.90.0.7.bb
@@ -8,6 +8,8 @@ LICENSE = "GPL"
 INC_PR = "r6"
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 PACKAGES = "${PN} ${PN}-dev ${PN}-doc ${PN}-symlinks"
 
 FILES_${PN} = " \
diff --git a/recipes/binutils/binutils_2.15.94.0.1.bb b/recipes/binutils/binutils_2.15.94.0.1.bb
index 91cf368..f392070 100644
--- a/recipes/binutils/binutils_2.15.94.0.1.bb
+++ b/recipes/binutils/binutils_2.15.94.0.1.bb
@@ -5,6 +5,8 @@ LICENSE = "GPL"
 INC_PR = "r5"
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 inherit autotools gettext
 
 PACKAGES = "${PN} ${PN}-dev ${PN}-doc ${PN}-symlinks"
diff --git a/recipes/binutils/binutils_2.16.1.bb b/recipes/binutils/binutils_2.16.1.bb
index 0b3ede1..4b135e8 100644
--- a/recipes/binutils/binutils_2.16.1.bb
+++ b/recipes/binutils/binutils_2.16.1.bb
@@ -14,6 +14,8 @@ require binutils.inc
 
 PR = "${INC_PR}.0"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI[archive.md5sum] = "6a9d529efb285071dad10e1f3d2b2967"
 SRC_URI[archive.sha256sum] = "351a6846ee179a37ed87a487971547159a7f4f92a1dec598c727f184a0de61ae"
 SRC_URI[patch1.md5sum] = "b12426fd72bedf00c389a7fb458275a8"
diff --git a/recipes/binutils/binutils_2.16.91.0.6.bb b/recipes/binutils/binutils_2.16.91.0.6.bb
index cbaa4a5..103f7e8 100644
--- a/recipes/binutils/binutils_2.16.91.0.6.bb
+++ b/recipes/binutils/binutils_2.16.91.0.6.bb
@@ -9,6 +9,8 @@ PR = "${INC_PR}.1"
 # of binutils.
 DEFAULT_PREFERENCE = "-1"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 
 inherit autotools gettext
 
diff --git a/recipes/binutils/binutils_2.16.91.0.7.bb b/recipes/binutils/binutils_2.16.91.0.7.bb
index 369dd0a..68e545e 100644
--- a/recipes/binutils/binutils_2.16.91.0.7.bb
+++ b/recipes/binutils/binutils_2.16.91.0.7.bb
@@ -6,6 +6,8 @@ DEFAULT_PREFERENCE = "-1"
 INC_PR = "r5"
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 inherit autotools gettext
 
 PACKAGES = "${PN} ${PN}-dev ${PN}-doc ${PN}-symlinks"
diff --git a/recipes/binutils/binutils_2.16.bb b/recipes/binutils/binutils_2.16.bb
index 35255a8..774045b 100644
--- a/recipes/binutils/binutils_2.16.bb
+++ b/recipes/binutils/binutils_2.16.bb
@@ -1,5 +1,7 @@
 PR = "r10"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = \
     "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
      file://ld_makefile.patch \
diff --git a/recipes/binutils/binutils_2.17.50.0.1.bb b/recipes/binutils/binutils_2.17.50.0.1.bb
index d107431..1c874e5 100644
--- a/recipes/binutils/binutils_2.17.50.0.1.bb
+++ b/recipes/binutils/binutils_2.17.50.0.1.bb
@@ -5,6 +5,8 @@ LICENSE = "GPL"
 DEFAULT_PREFERENCE = "-1"
 PR = "r2"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 inherit autotools gettext
 
 PACKAGES = "${PN} ${PN}-dev ${PN}-doc ${PN}-symlinks"
diff --git a/recipes/binutils/binutils_2.17.50.0.5.bb b/recipes/binutils/binutils_2.17.50.0.5.bb
index f0eb7f6..3eeb3eb 100644
--- a/recipes/binutils/binutils_2.17.50.0.5.bb
+++ b/recipes/binutils/binutils_2.17.50.0.5.bb
@@ -2,6 +2,8 @@ require binutils.inc
 
 PR = "${INC_PR}.0"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = \
     "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
diff --git a/recipes/binutils/binutils_2.17.50.0.8.bb b/recipes/binutils/binutils_2.17.50.0.8.bb
index 450fbf8..d56dd04 100644
--- a/recipes/binutils/binutils_2.17.50.0.8.bb
+++ b/recipes/binutils/binutils_2.17.50.0.8.bb
@@ -1,6 +1,8 @@
 require binutils.inc
 PR = "${INC_PR}.0"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = \
     "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
diff --git a/recipes/binutils/binutils_2.17.bb b/recipes/binutils/binutils_2.17.bb
index ce31709..aa4ebf2 100644
--- a/recipes/binutils/binutils_2.17.bb
+++ b/recipes/binutils/binutils_2.17.bb
@@ -3,6 +3,8 @@ require binutils-avr32.inc
 
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = \
     "http://ftp.gnu.org/gnu/binutils/binutils-${PV}.tar.bz2 \
      file://better_file_error.patch \
diff --git a/recipes/binutils/binutils_2.18.50.0.7.bb b/recipes/binutils/binutils_2.18.50.0.7.bb
index a320b4a..3fcef35 100644
--- a/recipes/binutils/binutils_2.18.50.0.7.bb
+++ b/recipes/binutils/binutils_2.18.50.0.7.bb
@@ -2,6 +2,8 @@
 require binutils.inc
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 LICENSE = "GPLv3"
 
 SRC_URI = "\
diff --git a/recipes/binutils/binutils_2.18.atmel.1.0.1.bb b/recipes/binutils/binutils_2.18.atmel.1.0.1.bb
index 8f52c08..a3661b4 100644
--- a/recipes/binutils/binutils_2.18.atmel.1.0.1.bb
+++ b/recipes/binutils/binutils_2.18.atmel.1.0.1.bb
@@ -1,6 +1,8 @@
 INC_PR = "r8"
 PR = "${INC_PR}.2"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 require binutils.inc
 LICENSE = "GPLv3"
 
diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_2.18.bb
index 6ba551e..b953005 100644
--- a/recipes/binutils/binutils_2.18.bb
+++ b/recipes/binutils/binutils_2.18.bb
@@ -2,6 +2,8 @@ require binutils.inc
 PR = "${INC_PR}.2"
 LICENSE = "GPLv3"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "\
      ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
diff --git a/recipes/binutils/binutils_2.19.1.bb b/recipes/binutils/binutils_2.19.1.bb
index a4ed780..41b2779 100644
--- a/recipes/binutils/binutils_2.19.1.bb
+++ b/recipes/binutils/binutils_2.19.1.bb
@@ -2,6 +2,8 @@ require binutils.inc
 PR = "${INC_PR}.1"
 LICENSE = "GPLv3"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "\
      ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
diff --git a/recipes/binutils/binutils_2.19.51.0.3.bb b/recipes/binutils/binutils_2.19.51.0.3.bb
index 3141c25..34d0c24 100644
--- a/recipes/binutils/binutils_2.19.51.0.3.bb
+++ b/recipes/binutils/binutils_2.19.51.0.3.bb
@@ -2,6 +2,8 @@ require binutils.inc
 PR = "${INC_PR}.1"
 LICENSE = "GPLv3"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "\
      ${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
diff --git a/recipes/binutils/binutils_2.19.51.bb b/recipes/binutils/binutils_2.19.51.bb
index 7dac777..5c10200 100644
--- a/recipes/binutils/binutils_2.19.51.bb
+++ b/recipes/binutils/binutils_2.19.51.bb
@@ -1,6 +1,8 @@
 require binutils.inc
 PR = "${INC_PR}.0"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 LICENSE = "GPLv3"
 
 SRC_URI = "\
diff --git a/recipes/binutils/binutils_2.19.bb b/recipes/binutils/binutils_2.19.bb
index 187a99f..0e4da25 100644
--- a/recipes/binutils/binutils_2.19.bb
+++ b/recipes/binutils/binutils_2.19.bb
@@ -2,6 +2,8 @@ require binutils.inc
 PR = "${INC_PR}.1"
 LICENSE = "GPLv3"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 SRC_URI = "\
      ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
diff --git a/recipes/binutils/binutils_2.20.bb b/recipes/binutils/binutils_2.20.bb
index 54c969c..ffdb8db 100644
--- a/recipes/binutils/binutils_2.20.bb
+++ b/recipes/binutils/binutils_2.20.bb
@@ -1,6 +1,8 @@
 require binutils.inc
 LICENSE = "GPLv3"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 PR = "${INC_PR}.4"
 
 SRC_URI = "\
diff --git a/recipes/binutils/binutils_cvs.bb b/recipes/binutils/binutils_cvs.bb
index 1e4e210..6d4cffc 100644
--- a/recipes/binutils/binutils_cvs.bb
+++ b/recipes/binutils/binutils_cvs.bb
@@ -1,6 +1,8 @@
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
 PV = "2.20+cvs${SRCDATE}"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 require binutils.inc
 PR = "${INC_PR}.2"
 
-- 
1.6.4.2



