Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17946.1794787859255460523
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WXS8ocA3;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so3839852c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787859; x=1795392659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KYbqHRUSAwLuf/R8PujdBYkvxzKckFvFccCwyyEq1Q=;
        b=WXS8ocA35X0r79bvzfyBxfxUWHcJNBlwjKpW9ZcyfgUpQLsTVtqbMKN+KlzAwz9oZ4
         dhk4b3nf22Tbknt61P2ezCI316zplTAiNMLmmb2YCoHa52Cr3/2iMdtNgL7ak9vdJtHD
         f6fe1nTCORTUKcBicaC+SKqUZR4aA0j63d8DTpnLqWAe2w0Cg+l7p6n7BURMxKwNIFnI
         0oCToQNC2cAwMIWObopNB9wq8eZ+4kEXMOAG/8hjfeHoaeE+/Hh8Zen728Prpjl9htco
         FxkGdAn7UDMH5YBY3+OBKHuVzq2AOa9zcEO6GQuuFM+1lFoLlJAutSPAwhubXY1G5jNJ
         wjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787859; x=1795392659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KYbqHRUSAwLuf/R8PujdBYkvxzKckFvFccCwyyEq1Q=;
        b=azyzOWI3dzeBsnNyitC7QvqjsnL0WK18vT6BTQEfD+7gS5Zs/2Qxa+wptL4pv+Veuk
         YBBizAgv1IEvAPVOuDRuOyizbnywPDY5NQgALWJPFJvPJmPHhZDIy5sNz1lxdkh6JRQq
         wd/COay8Ix/m4Tg99Yul55ry0bwsTvxE2d23S5WiclZ1GNkQI2z6aJkLpkPIbhzEUqEP
         k1lWf1+Nh2jVknmW2DUiBU7xTxX9PQI6gzlefdZDqOkFoK5fmfqCP5dhtJwq/MXULzLY
         i+S4gg71KpHC7/4etxHAUNaoVPC49CTjJhLPcyEJH96zYmo71K0BBXplejL+wfaloB+R
         7oQQ==
X-Gm-Message-State: APuU4Z9ccyp/D1moCV/PoJbwDPpCeeTgChPSWc0l9x7rpwzgRuRJpD+A
	PVUaMeu7oauYwF+KH7rH1JJXHiAoAVqvT1ezyIg01kj/uPeBlSEgE/jexBRMGct0
X-Gm-Gg: AYBFou2QA1R4criOGgoiQareryIDMmLkFXaO1WJG6AEf8WQjV4Hd+0BRspqJWfcm6te
	16vXbQWhY99GYQn2Q47WZvQno8wwFMYyJFNeplxh3hDhVxLZEFWZd20XEXdE5YC80fwRrJ65rU4
	81Y1kQZ+AxSZ2m7kj7xzZKf7CcJnxodLBZ4YaUAn4bvwFedUWuSQ0/kVvqO1clwAxaLiyIBJrwJ
	NyWjL3NmlsSIMFbqQZJ/mcvGMkzB1oVWjrZSDq274bnbCkAEC4BwphsAYnMcC5pS1L02pz7FOjp
	/qT/YWxSd8r6H8/9mIGuxhfANDd90yB/q4ZSdhQXRrRpauaUc8BJEbJLghkZT/f6wIBlu4U3GMx
	q17oOEcIyicigcLCiSAO5IVgnnXnYTjWddlEkIAXyMPdKQScGaVPzWmRonHJSxq+vvG0DWE+bux
	1VzT5CMEELffUBbi0VA6XXQ6MB9gJ+M0+MNYAF2Nsd2r9+PwIgKOhIwcTh2d5V6It/ktQ3d/LDO
	MML2YJWFvATaxc3KNj2s94/9SC5MaMI6bw9w8fxkhoFsE1BTw4kUf50OMswubbLQzD8IRealp/q
	HhUSgvDaQ6s+BxRVcaP5/3rhO5Gf+XvnwayFWVnqw7JrYHZXCfZOsHJToa+k7gkb64Kzw6sHsM6
	ycQEeuCV08fGX9h8qGglUuLuT+YpmyjpM2Ak+ablechYEltLBB+6xlcBrAem7nOsrsjrn9u26ol
	RiBsYLDeKM/gjVbaZZPILEy4lRYQeTn1Noli4ZkTFOVyOcBONu7N/X//L9uwY+N5x+NGJQk9obS
	g5zcQxLMeSfAydDQwoC++AJqxbEeszp/Fn6XbShlTXLX+cvVAj73/9vRfWAb4vRd47NxPOIFD1a
	WrBx
X-Received: by 2002:a05:701b:4584:b0:144:fb87:5b91 with SMTP id a92af1059eb24-1b50310ae62mr8357020c88.44.1794787858395;
        Sun, 15 Nov 2026 16:10:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/16] font-*-100dpi: Drop ineffective class-native RDEPENDS
Date: Sun, 15 Nov 2026 16:10:38 -0800
Message-ID: <20261116001038.440763-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132397
Content-Type: text/plain; charset="utf-8"

None of these recipes are extended to native, so
RDEPENDS:${PN}:class-native never applies.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb    | 1 -
 .../recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb | 1 -
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb       | 1 -
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb           | 1 -
 .../recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb    | 1 -
 5 files changed, 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb
index 7c145c43b8..b743fc3b69 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5dfa0fdf45473b4ca0acf37d854df10e"

 DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
-RDEPENDS:${PN}:class-native = "font-util-native"

 UPSTREAM_CHECK_REGEX = "font\-adobe\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb
index bf9089a982..4a4cc76e3f 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa13e704b7241f60ef9105cc041b9732"

 DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
-RDEPENDS:${PN}:class-native = "font-util-native"

 UPSTREAM_CHECK_REGEX = "font\-adobe\-utopia\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb
index e5dcc01e3e..4b153555b8 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.4.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cffd5e9c4b61b3d74166ca74b99e460e"

 DEPENDS += "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
-RDEPENDS:${PN}:class-native = "font-util-native"

 UPSTREAM_CHECK_REGEX = "font\-bh\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb
index 89e2f26f05..ba9566ec51 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0d221a9cd144806cb469735cc4775939"

 DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
-RDEPENDS:${PN}:class-native = "font-util-native"

 UPSTREAM_CHECK_REGEX = "font\-bh\-lucidatypewriter\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb
index 5a05ae9728..55a8b2bbfe 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=30330812324ff9d9bd9ea645bb944427"

 DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS:${PN} = "encodings font-util"
-RDEPENDS:${PN}:class-native = "font-util-native"

 UPSTREAM_CHECK_REGEX = "font\-bitstream\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

