Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAE2E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 21:30:16 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3961.1736285408199470800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 13:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5an56lo;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso321855a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 13:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736285407; x=1736890207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HsRY2gkt+gXDR9PvGW6W+i7WLmNcDS4va03lcG22os=;
        b=d5an56loD3VHQ+E4K6ysAoWA7cOEf2Fo4+CM3BP0Hz/dt8jdem2VODeSZ1tXd9WkoZ
         Z83VWsj90UKaYWifsBSytTqFr2WSOr5/rCQG/PEtws9/hZyK06vZ0i0Y7pqBbHo4wJkv
         ScYQFqq7pHXoEu4YCiwpFfy9xJT8kcORShgT9J0NLR56yRdn6gvZVwESUJq3jybtGHqv
         e8igExFemEvLCGqNi9ceZDSJYIaEbYhY/1vL86pn7iYRayM+7qYKtjwqa0Ob+ynvz1Uk
         t7NZ+hpMs29e+8aNccCdTTaC7as56xXc02jye+4wpAbhwi1VVFKW+Wl2Fb+Yi61Dm9qN
         q8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736285407; x=1736890207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HsRY2gkt+gXDR9PvGW6W+i7WLmNcDS4va03lcG22os=;
        b=shvFqPP7PYpO1LrFxd6b2RAUmIai3JjaxsiwCDU27NjD2IHMS/37/Vn+9PBoTIzczT
         NG7bSlxj4AdxlWaNmiwyZ6J7TEDhOQHdq8W+IjNuix4Q5dPCKLsNhDjbk3Fwh1AmNWkp
         iupB6RTQXsTy5BzEWV26cTX3TsxDBmQau8uH4ujIAGxIOd++yGEml4Rq+mTKKktvZpxv
         NH15BZmC23uVsfPOLr+XX2bc20GWpaYTQq11zT62c+fAwKAjr7ERR/H/BUOj/687g/72
         /2vg/TdFb5sg2U4gx3tLPjHsDxMv9y5Z3XMuWmCATdHBs9IcM/GmjJxz37+g0AgqlNoa
         9D5w==
X-Gm-Message-State: AOJu0YxZfgFCSX/iBQMeA89tHQrwP1YWkAuK/ImyC6RWd140uEmhDxvt
	eYW37UJrD1e3cZ9oM3Ihbq55q68PyvQtDujXk6UQuGMvubCH9+SH9WBbOg==
X-Gm-Gg: ASbGncvy8WJLx7tDifjN8bkJ8EDh0G5Bsfxb+W2L55slDKo2wLFZyi9bvjsrYX8UtVb
	PYd2eAJDvKHObKgvAzPq3xw+BBKSj0mz2rS53C7LOpT1nrGIHN31RVxWESP28KyTvZQlgAy3aOS
	bZAAlNn+PbhYWd8idZm31rbmZKoDOSZfA1+xKBcbYJk53P7/tH/NOEk8ksyCRkEZbTPDyddaoTN
	Dxq84WdibxMx/muGfLKckHVi7dzCKsTCUCeFVJLmovhUCa0
X-Google-Smtp-Source: AGHT+IGJVwZcizn/52ejeD0sW9yC4h4eyvYStR3XCWwFqzatse40zwUv2Ghu2Baxvg3WWYky7ixtiA==
X-Received: by 2002:a05:6a00:aa05:b0:724:db17:f975 with SMTP id d2e1a72fcca58-72d2174e8a3mr1273914b3a.12.1736285407347;
        Tue, 07 Jan 2025 13:30:07 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::5bc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8157e3sm25877847b3a.26.2025.01.07.13.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 13:30:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] libheif: Make openh264 as packageconfig
Date: Tue,  7 Jan 2025 13:30:02 -0800
Message-ID: <20250107213002.1443331-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107213002.1443331-1-raj.khem@gmail.com>
References: <20250107213002.1443331-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 21:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114730

openh264 is an optional dependency so its good to make it a configurable
option since the build says that its an optional dependency, this helps
in building libheif for architectures like riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
index 4610a60392..b0f09d113c 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
@@ -14,13 +14,14 @@ SRCREV = "cd95b113d78d0696105a9e678cbd19487ee13d6c"
 inherit cmake pkgconfig
 
 DEPENDS += "gdk-pixbuf openh264 x265 libde265 tiff zlib libpng libwebp"
-
-PACKAGECONFIG += "dav1d jpeg jpeg2000 ffmpeg aom"
+PACKAGECONFIG += "dav1d jpeg jpeg2000 ffmpeg aom openh264"
+PACKAGECONFIG:remove:riscv32 = "openh264"
 PACKAGECONFIG[aom] = "-DWITH_AOM_ENCODER=ON -DWITH_AOM_DECODER=ON,-DWITH_AOM_ENCODER=OFF -DWITH_AOM_DECODER=OFF,aom"
 PACKAGECONFIG[dav1d] = "-DWITH_DAV1D=ON, -DWITH_DAV1D=OFF,dav1d"
 PACKAGECONFIG[svt-av1] = "-DWITH_SvtEnc=ON,-DWITH_SvtEnc=OFF,svt-av1"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON,-DWITH_JPEG_ENCODER=OFF -DWITH_JPEG_DECODER=OFF,jpeg"
 PACKAGECONFIG[ffmpeg] = "-DWITH_FFMPEG_DECODER=ON,-DWITH_FFMPEG_DECODER=OFF,ffmpeg"
 PACKAGECONFIG[jpeg2000] = "-DWITH_OpenJPEG_ENCODER=ON -DWITH_OpenJPEG_DECODER=ON,-DWITH_OpenJPEG_ENCODER=OFF -DWITH_OpenJPEG_DECODER=OFF,openjpeg"
+PACKAGECONFIG[openh264] = ",,openh264"
 
 FILES:${PN} += "${libdir}/libheif ${datadir}/thumbnailers ${libdir}/gdk-pixbuf*"

