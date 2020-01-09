Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 00F467FE07
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 16:21:48 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so3597563wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 08:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NSoc31leigEkunqVbYrgzdBp+s1gwduDKKhWtOgmBd0=;
	b=oX/+rnWNX8lWLZK2DpV5f/w79OSzdcOhWVP6bBfuDsp72lt/GTsUSGaqM4xSjD2Tyl
	LJh1Q/jcHGhocZW2GW1zan98oVZ5vFuL4Mw/m+pzYoWG2+hEWwP8jAgH5cngUOPRXPHW
	/JN9JnW7g10Nq7u3jPlpg53cERBejoLxgfGe2Li6KtjO5HdRIAEHrJ8Ivg6YIIxdZOZB
	c3Ljc6tYHNiAsgNP+itO8Qw4ZAlHiOqrhBBG8WrUo+5z2RiRUdP8ARsGXwA8wA7uvZp4
	zNuCG3Ofn6b5j69WJrwRuf10gv466HeMJ1bGeGqOq2VN2TN4tnugY9P+ilxSKL6ycpe5
	lpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NSoc31leigEkunqVbYrgzdBp+s1gwduDKKhWtOgmBd0=;
	b=V9C8m1bmpUGTIuRdPMQFdso3mNrqezEtFF4kAETTxTlxDI9VN+tS895eJ/5wBZXNco
	8AkZAkvE4YeCTTpNFfja5vdJ7RDWjw+F8LH7RCoqU9Ak34f7GbgE3F7sMrTN6duzNjxF
	BX4ORLFGrSQBaaxEWSdEbAmZ3e9eSulNNZ0bDwAo7Cy7dJbAjp79dPySxI2/Vl9EuFbJ
	55RvruAWh/rzT/ESbPsg3Iw/V5+dYGkRjw5awuiyJrzbEkQaj9g1IPOLmo3I6rsagELV
	1elYZlKG8owqOLQIj3qgqOnPU+zzUOD7/8WQuuRrh3x6haZ2X9C0xSf18wh5d9AJwsox
	UY5Q==
X-Gm-Message-State: APjAAAVPw42Pj/Qpqrx6z2Gk2ju2LLJLU6/F7PX/eE8TP5DS2l84KhcX
	31XQMV+2K7NgXbjl56i73tuiNgO2pok=
X-Google-Smtp-Source: APXvYqzLWh5OhsI4Iq5SVHUIv2rcGgKp56tIxHpRure7xRJmfpuHjGgmUO78DLlAuWgjr+C/uGRO+A==
X-Received: by 2002:a7b:cfc2:: with SMTP id f2mr5820063wmm.44.1578586909450;
	Thu, 09 Jan 2020 08:21:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d14sm8655010wru.9.2020.01.09.08.21.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 08:21:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 16:21:39 +0000
Message-Id: <20200109162141.20579-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109162141.20579-1-ross.burton@intel.com>
References: <20200109162141.20579-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] opencv: also download face alignment data in do_fetch()
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
X-List-Received-Date: Thu, 09 Jan 2020 16:21:49 -0000
Content-Transfer-Encoding: 8bit

The face alignment data is downloaded in do_configure, so download it in
do_fetch and add it to the cache.

Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.20.1


