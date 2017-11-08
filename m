Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A87647782F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 12:10:30 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id g70so2881398lfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 04:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HFNDpXNeK+98IrSKGrfVxCWuoq+9Vf5SuicGg8XdZ5Q=;
	b=ORhn3gs5HXzhgEw7t02ur/FOonDfLNQ3GHXjwgm1OuiVqzyPsdF2skidfy7YtHXWA2
	XfoMep++tctSmbA+dgs8c6h50hhPE4pOLIqx+PJnbDt0SuqbqNGGeGSsvYVixeTUekx9
	Xmm3yQr93imXghL76PFdBZjOen/pV9mBCxdXCFD6prqu4sLS5AN0/sNwTHQrdQ9CgYe7
	TgJsB1+3g78Y9VQmD3+yH4grFK9VFMWwPRJtgnSJuSewYD4Z3a+MWB5xl7sfzuQJjRom
	/Bv9Ij6o1+WPnq5o5V7B96PQBiaOSgR2eW/lLMJr5oV8LPh3cDaJwmUMWFts0lc1A6XL
	Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HFNDpXNeK+98IrSKGrfVxCWuoq+9Vf5SuicGg8XdZ5Q=;
	b=dw/6OtqDbth80tSHxyQdvJ4Qfte58tOovluhOqMLsusvYse4oxWdrfvPGDiK7Q8Ipm
	1PQOIrEcuixO1J3YXJN0IWKfNKIuycSk1AHMeli3cXTLKEGEScl72YF9wbm5kLRl3vVJ
	gw5aY+HfwVlBFP8L+Vo2D3/ul4BvWCRz/Vp1nG/lfh8SIoPrfcqbCbYLeE7gaIYYUiMV
	QP5DRnW4kn+8S7KAQmENh6/HsGGR3Z0av2Rq2qPv8s96aG9qsJsueYaL98YlwhnE4l1Q
	wzK/nmdP0J1Cbf3WMmNoH6haOdxk8V+a7Am5oTJoqNNh0MdYeK+tmF9dc3Vs049ylryL
	SyVw==
X-Gm-Message-State: AJaThX5xvknj7hm0Ass55/47R6JI9xtXMKv07o0PVB+MYQ7IwlD33LN6
	AWARuT7jiMkLRyqBX53qAQGhWLaL
X-Google-Smtp-Source: AGs4zMYJ3yHt35v/rt5BAxOEn99c5f2YGqSUogI2SV2vSQfMFdmh7F9FMhk9ixle7LtpaRuH7Sg+oQ==
X-Received: by 10.25.67.30 with SMTP id q30mr116854lfa.118.1510143030957;
	Wed, 08 Nov 2017 04:10:30 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x18sm744216lja.55.2017.11.08.04.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:10:29 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Nov 2017 13:10:24 +0100
Message-Id: <20171108121027.27572-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH 1/4] opencv: Update ICV variable names
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
X-List-Received-Date: Wed, 08 Nov 2017 12:10:30 -0000

Since 3.3 ICV variables have been renamed. Without this patch OpenCV
configure cannot find ICV/IPP binaries.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index dd9e4ca44f50..bcb17d34f8fb 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -68,8 +68,8 @@ addtask unpack_extra after do_unpack before do_patch
 EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DWITH_1394=OFF \
     -DCMAKE_SKIP_RPATH=ON \
-    -DOPENCV_ICV_PACKAGE_DOWNLOADED=${IPP_MD5} \
-    -DOPENCV_ICV_PATH=${WORKDIR}/ippicv_lnx \
+    -DOPENCV_ICV_HASH=${IPP_MD5} \
+    -DIPPROOT=${WORKDIR}/ippicv_lnx \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.14.2


