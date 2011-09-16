Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Z4M-0003dd-Ho
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:07:06 +0200
Received: by eya25 with SMTP id 25so5416853eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fJNsCeyRbrcfD4javLmeeh0KEyOVCuSFiPwQTZJXvdA=;
	b=P6X9Z5ks4ynDnsosZMbOY4lqncM4wubM34A2fqAoNbsrVvlySmqefz5Zi9QR8AT0sX
	VuwnbSyvMf20XKNMZavizZ36P87DNGxSc8e3h/WfgocHNW3MopKYTgXC1XGR4v8vt2pi
	uGWjxIf76SvRGI65AqnK+m0h1ar5xsMx43uMw=
Received: by 10.204.138.211 with SMTP id b19mr92074bku.257.1316181409800;
	Fri, 16 Sep 2011 06:56:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p9sm1600407fah.1.2011.09.16.06.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:56:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:09 +0200
Message-Id: <8f2e5c05b0b819d9cd3336e977da378b6a4671ad.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/10] pointercal-xinput: move machine specific files to their bsp layers, remove SECTION
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
X-List-Received-Date: Fri, 16 Sep 2011 14:07:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pointercal-xinput/iphone3g/pointercal.xinput   |    1 -
 .../pointercal-xinput/nokia900/pointercal.xinput   |    2 --
 .../pointercal-xinput/om-gta01/pointercal.xinput   |    2 --
 .../pointercal-xinput/om-gta02/pointercal.xinput   |    2 --
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |    4 +---
 5 files changed, 1 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
deleted file mode 100644
index d6ce56b..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
+++ /dev/null
@@ -1 +0,0 @@
-xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 -102 4739 6 7321;
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
deleted file mode 100644
index 66bb32c..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
+++ /dev/null
@@ -1,2 +0,0 @@
-xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 204 3897 3763 178;
-
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
deleted file mode 100644
index be25da3..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
+++ /dev/null
@@ -1,2 +0,0 @@
-xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 911 98
-xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
deleted file mode 100644
index be25da3..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
+++ /dev/null
@@ -1,2 +0,0 @@
-xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 911 98
-xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 993a75d..9b68d54 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -2,9 +2,7 @@ DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-SECTION = "base"
-
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "file://pointercal.xinput"
 S = "${WORKDIR}"
-- 
1.7.6.1



