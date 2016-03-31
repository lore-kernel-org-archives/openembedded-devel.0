Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFBC6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:43 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id k79so57226981lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kam5N8FtuGKypfG2SWTHlPdLBSX4kSXQMSFi47ILyI4=;
	b=ja/uyE1Lg97Ua+DBZczL2podabjb0EEa1BDIYtJFCXmB9ltFMjDGDxinpM7OFSai9a
	yvyYRxIVaNDwUTjnih3Vpdll+imDzo01AdXyACf+RtFA2Bw2U1CiVksQpV6kwRnLDatU
	1c4fXDmjWPTnIkYkqFeQfPzPHb0Oa+ICgj8Ha74Clc2hjKIQrjfcFHB0W/lSU1uiFB+m
	6seL5uyqIG30b4GGxNLblwPd1mD6hPhh1gZ1q8Ke7UVkZeO0iGhvVgPvkOKjGPh2P/LP
	NU8rxhBQ1YF7U76cW9ej5q48g5+ZFf4cQA2fuGVOCARp1tm0XmgrM2jMsSndTfcDD6e6
	D3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kam5N8FtuGKypfG2SWTHlPdLBSX4kSXQMSFi47ILyI4=;
	b=cbxMv/BvPq+5ziFE+3o2YknytGlKRLEdIrBi9OOvDNs76JSHbtgxOydJHjyS3Sh8le
	xivrPWsxOc3gY9ktNCn5REzajSXckOEVGoVnFFE/fx5JLRGff12Un6Y0IBHvTB2jrbuu
	QuNLKg8yHlw77OYxAgPNQNFd1Jpye/TP84xNB8BHx/nqrNKptVJD+4ofCb9yHaZh2PXW
	1tMYrW6yAwYeNfM5MxYCVj/VLwyaMer+rkqqeIdqzs7LpVl7IdEtizTpjlUA9NUE1B7p
	x55C1cOjQEvqZ3uavkLqWe7qgfjy+j7k/rfDw0+Um/39I6zPDvOpzlSPjI8/4jE2VUWQ
	eH+A==
X-Gm-Message-State: AD7BkJIvekZlo8dOJwMcAgcdnCPKc08ptK3zg2F+RvElJFCSXiJ9CJW6qehDNDBIP15/lg==
X-Received: by 10.25.23.233 with SMTP id 102mr6464890lfx.113.1459423604249;
	Thu, 31 Mar 2016 04:26:44 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:43 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:33 +0200
Message-Id: <1459423593-4123-8-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v4 7/7] opencv: Remove blacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2016 11:26:44 -0000

Opencv 3.1 builds fine with ffmpeg.

ricardo@neopili:~/curro/qt5022/oe/openembedded-core/build$ bitbake
opencv
Loading cache: 100%
|############################################################################|
ETA:  00:00:00
Loaded 2018 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.29.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-testing"
TARGET_SYS        = "i586-oe-linux"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "master:300f858ba07c938427ccd05a3d7220027a03d461"
meta-oe           = "master:29462f7161b346dbc2ea00830da869a0a1c35fb9"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1242 tasks of which 1228 didn't need to
be rerun and all succeeded.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 7f09168784d9..a0e7bf948ece 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -142,5 +142,3 @@ do_install_append() {
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
 }
 
-# http://errors.yoctoproject.org/Errors/Details/40660/
-PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
-- 
2.8.0.rc3


