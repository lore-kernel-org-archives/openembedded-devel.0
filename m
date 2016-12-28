Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2891B719E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:20:04 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id d16so17623349lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 05:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9uQeY8BNHKXtOoqZPkAg4Om1DQTSZzTlLsGK3ubASAI=;
	b=JQmVIkA85vIGNe4QaQ7z7JgLtYhizg4Z2kRyoWHUUGR98mxysMJyaGcuidNxVYl82T
	BIvGSy3MuUDTvvPCiLjnI/WrKsHUScrEluui7K9hKT25KZ7jx+/fxHHPRJ/eMNZeDg2Q
	xqWs2xui/InGqco4trT2ItScELN+qd7viUP3+zY13h8T25vxdeOEUDTtTFbfSWIduRuX
	GtPv5RPgQzLKn554VX9pGtOvC7KJgthyyoGHRfjJf/UeVqulzkzIL4Gfpge3K+XmQMlD
	KrUflokqhEkkuqVAuiEO33+PNYHYGWp8tX+tsD4wVyzflJnGwskO87jwNZoIpHl6HRkx
	K8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9uQeY8BNHKXtOoqZPkAg4Om1DQTSZzTlLsGK3ubASAI=;
	b=PnPiOGYUDgqMkXLUT1p9xPFbhjT7YslILlqQRQOaU9NyCLSsOyIkJyehn2SQ2qnxRv
	Lo1m7iIxNb0qArt76RP6EA3xze+kv06TJgxIXo8Nhh+QOmDFa4f5SEvM9HoCxSk5pGtq
	OG6iDBt6MLuoz3Vx4HQdJHQHOwm8ah672ZsztgJ2W8B3EHZjFo4veu2GQY8yVK0Zqwfl
	qt5RXLEcmU0LxRuHrDOhsBq/aOBpa45TGvKnlqyKedJXgX4ZT8Lm1AdwGDxuIdHsYYBh
	rJvmZubvQ+287grcjmfx7MPndaqlThsyxFavlukySbPJKC2u/vMOyx9u7286CehcDmKi
	mFKA==
X-Gm-Message-State: AIkVDXL83ihTbiYW19PTODAli9idouLsPhIrb7Mv6P8jEAeZbL0uIVg//Gtjm6MR4Mbtuw==
X-Received: by 10.25.17.231 with SMTP id 100mr8259041lfr.39.1482931206001;
	Wed, 28 Dec 2016 05:20:06 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	137sm11902825lfz.2.2016.12.28.05.20.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Dec 2016 05:20:04 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: martin.jansa@gmail.com, raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 14:19:56 +0100
Message-Id: <20161228131956.29551-4-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161228131956.29551-1-ricardo.ribalda@gmail.com>
References: <20161228131956.29551-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 4/4] opencv: Remove extra space
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
X-List-Received-Date: Wed, 28 Dec 2016 13:20:05 -0000

No functional change, it just looked ugly.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 667623e71a41..17805f7a017a 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -46,7 +46,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb  gphoto2 \
+PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
-- 
2.11.0


