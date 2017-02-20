Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB3371E02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so15745881wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aQ1X9f+83H26caVIS9C/k0ohi1WDNZ75AvZGWolQsnw=;
	b=outcE/Td4uLpajAafc+MfbL8yc8owQ2b2xaAqypmWdLGJ7pHbG0cX3FxOs2a4zKFWw
	gUoDZRJpEc7cNlGtc+jGqzL2wSzbjX/vfTjI05BX4CY7HD9t5HPeJH2A3lSZva9xSal8
	nFGry4pngJsEpVmKOuyM/3x0m8IFokPuuksC6+p02UAzJKkfxa+MqalXgjKTd5356P2C
	+GGS5v+7MeVsTLLSWriXmhicz8ovYn1ypDA8O9bn3aFNygio2AEz/lj8J8ecnym5s5PT
	fL2DuL9nAsrUhdK0Y91K1VNOKFelFKXwg8wB9wlSILuklpWlY/2uzLSztE2bxPvSw8Da
	//vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aQ1X9f+83H26caVIS9C/k0ohi1WDNZ75AvZGWolQsnw=;
	b=aR84AcCkkIsBZpDPEKU3OTgLHWAZcA/q13Pods8fnY3wWkVxMMyMYsjzJVxDFe27dq
	coF+uRKRhgjmd3OznJVv5Xuov8iis+yEN9KpMoZXylWz0drR5YFWmr2Rst0Lq42Ac2EV
	HtgfCk/dFTLCuGhKVyn7VIvZkcGsdo/5Kjj5HjeLin+bsp0ArpWvCBi411zMRu2LDp9w
	cyD07aEs6HJddTNQhrEEhXZDHcmrLnBtSwpyS11eiHyTZsYr2NSEwmzuYf4OUeMGuQH9
	I6L1eimGKCgNTyB5xoO7TStQOCQsitZrDoIN1fT8BivvWIRfOAJt57AliGjmsm8aoZ/H
	T/KA==
X-Gm-Message-State: AMke39l8Fgb1GuvqfsVPrzxLHATwVuB2sOp1z3vhXZuZdQ6+o/ivSI0px9qt1xR+1oD05w==
X-Received: by 10.28.45.213 with SMTP id t204mr20866451wmt.113.1487614073712; 
	Mon, 20 Feb 2017 10:07:53 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:55 +0100
Message-Id: <20170220180700.29836-40-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 39/44] gst-plugins-ugly: unblacklist - gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
index d8a8fd5..199b47d 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
@@ -33,5 +33,3 @@ SRC_URI += "file://0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.pat
             file://0002-Fix-opencore-include-paths.patch"
 
 FILES_${PN}-amrnb += "${datadir}/gstreamer-0.10/presets/GstAmrnbEnc.prs"
-
-PNBLACKLIST[gst-plugins-ugly] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


