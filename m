Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00AD473163
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:47:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so9293880wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 17:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=macLMU/gBh+b20egEiha0ZwENCi+BNjz8LlqQnCHYVQ=;
	b=etZtRTkhq++Zg0BtUopA2hgAgzbF4jszyBpPxrVQnevqKvT2S2m/Oq5K1rsdHX5dxR
	rd+F5nrufASetDMJj8kX6nZlMn1BztjSosWs3c7m7jTzRB2z9fNxAcOLsIuL/k4xol+e
	2X1xb+ms9wmYCVnXkS/H25Q6cq02ispl7tgIIRy5Cp/LeXToX5zA9qrE0l8a9xnOZ8iZ
	bzbr1MkbBmM0uvyqJhyGPnI3NuAP9z7TR7sKlinHmcgZ0elqQhj1fks4U9XD1NElNixn
	nAtYWf8F/d+nKsOYDfq2Bx9FtIm2I3G/6zjZpTR3lLZUl8C1giw6PAjU9U+1EAOf5ohI
	B+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=macLMU/gBh+b20egEiha0ZwENCi+BNjz8LlqQnCHYVQ=;
	b=TpK7rQTUjTNuMKxBPL1dxbs2bWJXxSl+074tZ9uM6xIpxNHR/KET17gN4TnD8ed6DA
	CbysSDzDZxQmWM0wK00aum4BH4l8vCILKEWi6wKOhpZ8oeKYWy/rZGmbA3RWHx6tQWoK
	U0+/si/t69yOROsOc+IN7LwgTHrMx/cXeLKL2SrHn83boW/MlCyNmXGGAOGl19BU58jo
	LC9mqpa3hlc0Y2vz5TZlOmWuDuW/ov0VR+R5DxarOX2secvOv0A75W8dJ8taKl94Nuyv
	gbdrHYeCtdvBADgyEKZJHftzaJdKpWkmBEZLuSv8J0eXOanmaYyKh5tlhnu71UTOnCmr
	i1Fw==
X-Gm-Message-State: AE9vXwPWlRbGWbEE8S04I3Hf+AiOfa9XF+FV8xMg1r4dmfX+fN0ifLXAr30HuBF4mIv5+A==
X-Received: by 10.28.198.130 with SMTP id w124mr3262549wmf.63.1474159663889;
	Sat, 17 Sep 2016 17:47:43 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	a1sm15415116wju.41.2016.09.17.17.47.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 17:47:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2016 02:47:26 +0200
Message-Id: <1474159646-8902-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474159646-8902-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474159646-8902-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] imagemagick: depend on fftw not virtual/fftw
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
X-List-Received-Date: Sun, 18 Sep 2016 00:47:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index adfcf55..74fe369 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=22d47a47bf252ca3ed7f71273b53612e"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
-DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
+DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
-- 
2.5.5


