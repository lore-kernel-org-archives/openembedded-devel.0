Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9806CF24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 20:34:14 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so3576498eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GZRu2fh89CW6oSuC5IWuOoJcvyYIrtp0IADIL/1/A20=;
	b=C2f7SCfDemCFYj+xm5nQMsFUWr+D+gVv43SkqyXfcxGqSzug+Kjn1Qt/ef8tHGZcFQ
	p88wAx6JZVPi5rHfpc2qotNLc9w7qvZO3HAcYFMHI4SQwM/pFKh8+NMqhq6OfYVb7vIr
	MHFcCL8BTCDC6N8QoPLQ3shIT82Rc5luIM8idJrFRgL85/dggxm/DNPUjkuknV4knpUk
	IAIgEuxfNIR/k9Wuu+pE6CavIF/shUQHb6wpyhsy2T8VDQCKnseNBcmNXCJD/MymYgcX
	iTdNM8Pg5NxE5N68pU7sT4KZeQK2ylUJwNtMNC76byqt/B2KYE96/tuN9IRL1hZioyp4
	ig5w==
X-Received: by 10.14.212.72 with SMTP id x48mr53746125eeo.0.1381782855658;
	Mon, 14 Oct 2013 13:34:15 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	b45sm157559417eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 13:34:15 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 22:34:10 +0200
Message-Id: <1381782850-29371-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] meta-handheld: use explicit ERASEBLOCKSIZE and remove the variable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 20:34:14 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/akita.conf  | 6 ++----
 conf/machine/c7x0.conf   | 6 ++----
 conf/machine/collie.conf | 6 ++----
 conf/machine/h3600.conf  | 3 +--
 conf/machine/poodle.conf | 6 ++----
 conf/machine/spitz.conf  | 6 ++----
 conf/machine/tosa.conf   | 6 ++----
 7 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index b7b1ed7..12a2fe9 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -11,12 +11,10 @@ require conf/machine/include/tune-xscale.inc
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt" 
 MACHINE_FEATURES += "iwmmxt"
 
-ERASEBLOCKSIZE = "0x20000"
-
-EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max akita (128-7 MiB = 968 PEBs)
 # 121 x 1024 : 128 = 968 PEBs
 MKUBIFS_ARGS = "-m 2048 -e 129024 -c 968 -x zlib"
-UBINIZE_ARGS = "-m 2048 -p ${ERASEBLOCKSIZE} -s 512"
+UBINIZE_ARGS = "-m 2048 -p 131072 -s 512"
diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
index 3c8e69a..ffa998d 100644
--- a/conf/machine/c7x0.conf
+++ b/conf/machine/c7x0.conf
@@ -11,12 +11,10 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-ERASEBLOCKSIZE = "0x4000"
-
-EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max c7x0 (128-7 MiB = 7744 PEBs)
 # 121 x 1024 : 16 = 7744 PEBs
 MKUBIFS_ARGS = "-m 512 -e 15872 -c 7744 -x zlib"
-UBINIZE_ARGS = "-m 512 -p ${ERASEBLOCKSIZE} -s 256"
+UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 00a25bf..26bc257 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -5,10 +5,8 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
 
-ERASEBLOCKSIZE = "0x20000"
-
-EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=${ERASEBLOCKSIZE} -n"
-EXTRA_IMAGECMD_sum.jffs2 = "--pad -l --eraseblock=0x20000 -n"
+EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e 0x20000 -n"
+EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e 0x20000 -n"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index adb354d..78e11be 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -27,8 +27,7 @@ MACHINE_EXTRA_RDEPENDS = "mtd-utils mtd-utils-jffs2"
 
 MACHINE_EXTRA_RRECOMMENDS = ""
 
-ERASEBLOCKSIZE = "0x40000"
-EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x40000"
 
 #
 # Modules autoload and other boot properties
diff --git a/conf/machine/poodle.conf b/conf/machine/poodle.conf
index b3a34f8..53dbc4a 100644
--- a/conf/machine/poodle.conf
+++ b/conf/machine/poodle.conf
@@ -8,12 +8,10 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-ERASEBLOCKSIZE = "0x4000"
-
-EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max poodle (64-7 MiB = 3648 PEBs)
 # 57 x 1024 : 16 = 3648 PEBs
 MKUBIFS_ARGS = "-m 512 -e 15872 -c 3648 -x zlib"
-UBINIZE_ARGS = "-m 512 -p ${ERASEBLOCKSIZE} -s 256"
+UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index e88462e..d4243fa 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -22,12 +22,10 @@ PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 # MKUBIFS_ARGS = "-m 512 -e 15872 -c 576 -x zlib"
 # UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
 
-ERASEBLOCKSIZE = "0x20000"
-
-EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max spitz (128-7 MiB = 968 PEBs)
 # 121 x 1024 : 128 = 968 PEBs
 MKUBIFS_ARGS = "-m 2048 -e 129024 -c 968 -x zlib"
-UBINIZE_ARGS = "-m 2048 -p ${ERASEBLOCKSIZE} -s 512"
+UBINIZE_ARGS = "-m 2048 -p 131072 -s 512"
diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
index dcfad04..0ec93c7 100644
--- a/conf/machine/tosa.conf
+++ b/conf/machine/tosa.conf
@@ -8,12 +8,10 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-ERASEBLOCKSIZE = "0x4000"
-
-EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max tosa (128-7 MiB = 7744 PEBs)
 # 121 x 1024 : 16 = 7744 PEBs
 MKUBIFS_ARGS = "-m 512 -e 15872 -c 7744 -x zlib"
-UBINIZE_ARGS = "-m 512 -p ${ERASEBLOCKSIZE} -s 256"
+UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
-- 
1.8.1.5


