Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id E337761C2E
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:43 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id y7so1923391pjn.1
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s0AJ10VsshxUa5LGP+GBsnk1dDlQuufpIqwf+gfv8Is=;
	b=cDXI091eLmN6VQUTxQUM/HAFHc2wrvQ11PYTuKrAhnUBnFJPcBqwofKhG7tEuHwLgv
	dFZ3TtIg6T/wgvQ+qgEz6i9ZSUUfv+TQX7ey5du1PgvQM4XYWhx/PvHlpmDEuz+cC+oR
	k+dUItzFfNTOgaZOeN2RaGXJhmDy14iKxSIefLyUcbag02bHOinD89zhu1DeBZIXtn6m
	ok90a6ONU2PFOpz6qHHdobZVHbFT8FvwqTd34nL/txPMERKGjjLiMBm8nYdqHE1MR4Fm
	p1o5BYRSUS9w0U6y5VLRX62HYFEWLbYSm09oj+nqFTFtIdeYLMncMw3eEIzJsMyzU2Vb
	ASnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s0AJ10VsshxUa5LGP+GBsnk1dDlQuufpIqwf+gfv8Is=;
	b=Ers7kEbB8OREF8C9Ci19DOXfKiDA8fw3DSolX1DJkY0rXrCoY3u7B8J6OrJmle6gU3
	zh7AcmvUSDtY+zp3exTdHcicBJAomRM8StzEE9fLxJIiHHYx3XRbbttKrfodXa3vndJ8
	C779k0u+QkPfISM2T90LcR+ZpxuqCQgu8Cf+H8fyZ06GAAxcJGLnRe9o74aPd/meQdXc
	S49yUAk5S1QfUN8/eaqIoHY4Mz//bqUdi62RbXhOuG+kE9K8fE5vHaZZCO0H0gB1ZYM1
	5Hf6/Z7kcSAKMARbBppxG2PNYHQRsGQQJYU8XOSDCCpqRdd2kwBDS7qkHCZElmkQ1pop
	iGSQ==
X-Gm-Message-State: ANhLgQ3ud6L59U0CO/urlS3VyrN3NI9Gg6bsm6er/XriNGRpCbJ29ZMD
	kOwtWw+90B2jqZDgym0nXObfo78l
X-Google-Smtp-Source: ADFU+vuikCFxkHt95REkBB5vGcOk5dQh94qH+x/SqmxulDcPNAlsmSVK2MFsUGUb55k4aMOqgNpI2Q==
X-Received: by 2002:a17:902:ab8f:: with SMTP id
	f15mr6017915plr.280.1583981864736; 
	Wed, 11 Mar 2020 19:57:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.43
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:26 -0700
Message-Id: <79aad0803acddfbc00144936727c86a4820696de.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 07/13] opencv: Enable pkg-config .pc file generation
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:44 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

In OpenCV 4, .pc file generation is disabled by default. Yet, other
software such as GStreamer and FFmpeg rely on the .pc files during build
time configuration. Explicitely enable .pc file generation to make sure
pkg-config can be used for getting information about OpenCV.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 77b5dd60c4..5e89db0977 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -64,6 +64,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DCMAKE_SKIP_RPATH=ON \
     -DOPENCV_ICV_HASH=${IPP_MD5} \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
+    -DOPENCV_GENERATE_PKGCONFIG=ON \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.17.1


