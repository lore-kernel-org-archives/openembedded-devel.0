Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7C39007C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 22:58:15 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q7so939483pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 15:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BtdANaCnSck1yAapIdV628Q3zaWpGr+0JMbUYOgixLA=;
	b=tdPSVqnR5acNjMOFon8QJC5FeddVjV3w09uEE9KEw7RMyxgeAZkZ1jEHvx7Wt/YRvn
	WdmOFYRzxdPtMHTgptSLJbnX4KWnFEeerFLNqTH0hhlMfkjjWSkKzPZe8/uveWoAeJ9p
	hxIKFTTJrW5QPs02h+j1tuD8zd9OmI4fxefTd7eFtbYWeAJNo1N7FdzjrT1KWdg6r6nv
	gSEiwbRUFjz4g2CS47IKIiyLgSG7C4PBEhews23vmSDd6GzmsfQL4zM0qBvFsLErvfOD
	FAYrmy0pIEAQ2fz8rA8wVAyU4iGx40uOW2mLxAx/pafuiO6dePHwpj+E0PFv5M2FXXr5
	FdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BtdANaCnSck1yAapIdV628Q3zaWpGr+0JMbUYOgixLA=;
	b=a8RKcVrry9q4GjQE5y+s0KsyZeaMgevBzdTRYd/kj1XSSICJfm5efSP1cLX6ltbJgt
	7+8ZVOL7dU9I24p9ZzC/ilJXvcOZvCuxmtdtYG3H8G3JvVlr6aF8IzJV0ToL2CACDl/M
	DOpe7DL+9Si+tbeQ5xuYB9saek7411C8TghQ5Yv/zoAojIVjWSxOnRlxig9GyQTYLZFX
	RnVAerKaEiLr0YOwgQ9C8I9c/yxZjfF8+4kQ/6tXspdzG9EFMh2kOSkmKvEsyRytGRBU
	JZenTVGnMcnD6m5vJ1vHyMte/dSsA2O5wwXg6N0A2N9eOggkrkmQ+ZTy+wHDveuC5PJP
	IIPQ==
X-Gm-Message-State: APjAAAWnEfJZYwQq/7Lpl5E9902grzevFqMiE2ntWPCf4SUJdMozfMje
	AVUe6cjtuDsjDxVqhZepf+6GQ0UiKCs=
X-Google-Smtp-Source: APXvYqwkKR7phpSqJ16Nrc9PPFGF1n4OGh2GPJglAdcEJAoxI7ScHqBF+TtpfiHG6/92GR3ht551hg==
X-Received: by 2002:a17:90a:cb01:: with SMTP id z1mr351336pjt.96.1568847495784;
	Wed, 18 Sep 2019 15:58:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	c35sm6333405pgl.72.2019.09.18.15.58.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 15:58:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Sep 2019 15:58:05 -0700
Message-Id: <20190918225805.825469-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918225805.825469-1-raj.khem@gmail.com>
References: <20190918225805.825469-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] live555: Switch SRC_URI where archives are kept for longer
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
X-List-Received-Date: Wed, 18 Sep 2019 22:58:15 -0000
Content-Transfer-Encoding: 8bit

Current location only maintains the latest archive and the releases are
often enough that we might not update that frequent

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index a88f7eb342..cf4dc7f4fe 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -8,7 +8,7 @@ LICENSE = "LGPLv3"
 SECTION = "devel"
 
 URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
-SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
+SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz \
            file://config.linux-cross"
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
-- 
2.23.0


