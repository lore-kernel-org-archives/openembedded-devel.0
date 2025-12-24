Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C05E7848A
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:34:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127034.1766604879249976203
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V5D/zaDq;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3225798f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604877; x=1767209677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVI5E3mINeukwDN78uRnAQ+phEH/0Gt+m5Iz5SSJ6iI=;
        b=V5D/zaDq0yfAG2Q8e55g49QV60HLaDW/UNHoxUfo07QzzZASiJONlEl0JGrS/W/6Cl
         Wt7Te4HQM5wE0eRckQ95lpg4eqHT1dcbBucyxRDQc52lBbhaH79X2Zb5agWvfva540X1
         C++jHkOnv2pucK/h1ir9YnxgIZfFU1Bh2m7U2iLZbm9XT+uasbeMk7BZ4y/P9fpeUAM2
         iC5U+OGkzHQaqxmHLeOoCh/+XgWkXZOKMsK9tK9fKdNWDbqiUoY2KfO1H1IuOhjVrfnx
         LNwOnS0iuJRmMXlb+0fCdU2PZ/26fgvkU9YaNrygbMqYywNKb1G5lRG7GdoAPu7vqbv6
         1AnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604877; x=1767209677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVI5E3mINeukwDN78uRnAQ+phEH/0Gt+m5Iz5SSJ6iI=;
        b=H4BB/cXdsPc2EFpKbR1SvDOT6wD0ZYHp84QkUVFHK12UXazkP/zEgTF9WAxdlwjQCx
         phOI55fEknTosPW/tzEVdDIdlq3yqaZog2EMLkGBfzuwhpFxOWSjpfO9N+9fMny7KP9+
         GJ1Wz+K3bukwrAQlv++3sLS/yMasEFrPWb0LUtbiVCYVlC+00IeRxBw+/1H/UG2mAKOk
         1qOHxMTqgEmhjYKGa5Ye27ndDRWFqH6mq1UFB4tGOREA43zVEvbAgnOEiGzJvcPUiMLX
         d3RRhMzHmsoku9t5+sRIIh+LrzcQVfTLL2mFxCHe/EkFXm/CDi1PaIzMAQEctcoHmjtc
         fbFQ==
X-Gm-Message-State: AOJu0YxzVZbHxus+pdONAxFtrKeZERoAttHdx8mNoJwtNEMXrUAYbrwG
	gOPmZzwfoCtPq+9K6MgH/T2bJRjXW+swD3dC8JYrxOKRRe9dgYHprvceBQdWTw==
X-Gm-Gg: AY/fxX4XOvlaIaAkjUCGqYS6LbvkVY5QY6Tx0/Z7FkzJJJhQNq4I8O5k8wlNeQ0CsEZ
	uatg8O4ZDzTK5P5cuH6j9aqDBeOcdCfHkfMkq2W3bDBxDrvtxTMQ8ih7KPUO9byN1lGg717EXd1
	TSVG2Pj5Xrxt5YWZhCjPh0+PWKR+cbdaVlPByjWqwXHC5lTI1Nrc2mfaj9FOM3AXfZz0Almog8G
	loJr+WfRI8HnC51iW9JDUajhhI7OGAvfuz6sPhV1jeOF2+zGcfgZKvHDA1JQ2Vlhdxs7zgLgIVt
	S6XEm4drMGP4/z2gfAL1rwzYmnB7GZ1pL3umopI1081UWXcSAdtqupnQBhMx3s2lVUzyWrhvRRx
	1woyJ3sfztuWT3Uu98IG6tQz7UU5nrp1k2zKczsejAAip4bMalmNyoV0MRRglvq2pRuSeykeN0T
	3y4DooSlRYEtXSyihwfc8=
X-Google-Smtp-Source: AGHT+IFOacTKZA24KB3ZVFulnfpI5KX4Cp4z7gS4GDjhgWvqJg6bDPoUQrz3tEbbxiBDquaGB4mruA==
X-Received: by 2002:a05:6000:401f:b0:42f:bb08:d1f0 with SMTP id ffacd0b85a97d-4324e704909mr22979443f8f.60.1766604877408;
        Wed, 24 Dec 2025 11:34:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33750665f8f.2.2025.12.24.11.34.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:34:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] imagemagick: patch CVE-2022-1115
Date: Wed, 24 Dec 2025 20:34:30 +0100
Message-ID: <20251224193434.2631122-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122892

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-1115

Pick the patch referenced in the NVD report.
Tested successfully against the PoC described in the related Github issue[1].

[1]: https://github.com/ImageMagick/ImageMagick/issues/4974

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/files/CVE-2022-1115.patch     | 25 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-1115.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-1115.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1115.patch
new file mode 100644
index 0000000000..51a441cfe3
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1115.patch
@@ -0,0 +1,25 @@
+From 0d8ca198fd90d882e524a3bc2eed55aff5c737c1 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Tue, 22 Mar 2022 20:11:27 -0400
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/4974
+
+CVE: CVE-2022-1115
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick6/commit/1f860f52bd8d58737ad883072203391096b30b51]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/tiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coders/tiff.c b/coders/tiff.c
+index d8e9a8953..c3767c8c3 100644
+--- a/coders/tiff.c
++++ b/coders/tiff.c
+@@ -1993,7 +1993,7 @@ static Image *ReadTIFFImage(const ImageInfo *image_info,
+         number_pixels=(MagickSizeType) columns*rows;
+         if (HeapOverflowSanityCheck(rows,sizeof(*tile_pixels)) != MagickFalse)
+           ThrowTIFFException(ResourceLimitError,"MemoryAllocationFailed");
+-        extent=TIFFTileSize(tiff);
++        extent=4*MagickMax(rows*TIFFTileRowSize(tiff),TIFFTileSize(tiff));
+ #if defined(TIFF_VERSION_BIG)
+         extent+=columns*sizeof(uint64);
+ #else
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 0b2eeb2ad4..350b504400 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2023-3415.patch \
     file://0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2023-3415.patch \
     file://0011-ImageMagick-Fix-CVE-2023-34151.patch \
+    file://CVE-2022-1115.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"

