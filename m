Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id A89C461C24
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:46 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id mq3so2003646pjb.0
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NvJBB72DRqKucqbgEDu08b6HijTI0HVWH9fqsUcxv0k=;
	b=c7zNdo490EraNKhWpm5M2NpgR/zbNBjRmILLwG5v1Fsu98bdGYuqPL6FM/ycYsGk/r
	7dpkUTJt2kg0h8laPRHLS6tANOPc3236slrOc0g23gKUa0BIOXbNB6B/mth9r3OPmr5b
	7f1eORr5ZJOTm0iu99qaWCnY2W+gTVJN9YtEFW2VEs9T+S0YGnpiQyzfMrp6+uxA7p2Z
	5nLZKHd8dmR8XIdNhMOSlrVNZZZJw12fc6p7iELDgb/tXSEzs2MmPA9b1XenN5Cum3DE
	TFWgAp+eeIsBTzhOh/fsnKWeZSkKKpDl2TI7McPCGtQu5Th5yob8VopJc/hU7pq6gBi6
	ESAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NvJBB72DRqKucqbgEDu08b6HijTI0HVWH9fqsUcxv0k=;
	b=fjk+PFVJKH8vr+B2/d2dS1Fy0tkxTVHNIa/nMlfMSzR2VjNd6yZX03Yzh5CNkYKYuX
	y+Z9d75mxl148IRkEtGre5JV2zHXA/MOhiGdAJkDMzg5b95gpgTdB/mMACFMBIWIdnnN
	QOeiVhOxm32sXQdUoDzeE9iyGTI2/fY3ACrw89CO8LCtKi6HswKgT/7ch61JqjwHaobS
	r2Zkut9XP8OkqCUmco2FEJ7bt1YEfwoUfx3ehAuVE48doM6vVM3Qkqs7hlA4xaZqjb2z
	4OiIY0Ok1WJNqR9sX9VjIzgFycW2iDSruVt5j2m8YY4Q4pyXh0RR/+IeIc581okVuA9f
	+CGg==
X-Gm-Message-State: ANhLgQ0evg/h4wk5aPrFiAL0Q6nMOya8A3WgSNCeuAez3OWMyYDhHld9
	OOzSu5lkCi8RYvL7RmxKWbTtYQQt
X-Google-Smtp-Source: ADFU+vtmkl+6MFm7mDI9lgmaxM2b0Q90W/Ter5aJFAtU4H0Moymt4pa1tDeI08YxmjFxsQL0tCJgiQ==
X-Received: by 2002:a17:90a:3a8f:: with SMTP id
	b15mr1782693pjc.178.1583981867516; 
	Wed, 11 Mar 2020 19:57:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.45
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:28 -0700
Message-Id: <41f3185f91bf1e8b1ec7cfe0c6da29a9058093d0.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 09/13] opencv: also download face alignment data in do_fetch()
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:46 -0000

From: Ross Burton <ross.burton@intel.com>

The face alignment data is downloaded in do_configure, so download it in
do_fetch and add it to the cache.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index cfc7854e1d..487393f388 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -15,6 +15,7 @@ SRCREV_contrib = "2c32791a9c500343568a21ea34bf2daeac2adae7"
 SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
+SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 
 def ipp_filename(d):
     import re
@@ -41,6 +42,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20180723;destsuffix=ipp;name=ipp \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=face;name=face \
            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
            file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
            file://0003-To-fix-errors-as-following.patch \
@@ -73,6 +75,7 @@ do_unpack_extra() {
     }
     cache xfeatures2d/boostdesc ${WORKDIR}/boostdesc/*.i
     cache xfeatures2d/vgg ${WORKDIR}/vgg/*.i
+    cache data ${WORKDIR}/face/*.dat
 }
 addtask unpack_extra after do_unpack before do_patch
 
-- 
2.17.1


