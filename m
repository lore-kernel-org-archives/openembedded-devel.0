Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.17122.1610488331965130301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I84Z21R6;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id c5so12444wrp.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+n9uiq3iIcQl2BwaKYcPYt/UXBMEGxKDCswLicf73M=;
        b=I84Z21R66Bcnd0Q08c2SdjIIxqp/AuwGctUMUECvJ6Cy0WInVgCJmJaIX8uvvYrqpo
         bd8svI6+FJM166ZkbZi41qZWhkeljIsXk9hj5Y/dHqcCjixtl4+KOCGcENQ+KrDK07N4
         LuBQUuP0CkYPuGqf+aWj+RFIsOq/OFKzOCeUeJwIcgJWdr2KzEnmpn0IMDcpcHZVmXDj
         ajDrPb8lyJM9yDjH8VDgqjiBRqOeljikAgVIdn1Uv2Pm8KtnULRXU3UmlvlMmQ94PxsQ
         eCOb1XWA9lNn2cGwS9WJ2db10HmDr+HoJrmoEJNRV1pgO8lBYZTXS8g0Mi+5tJAZEWNn
         4uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+n9uiq3iIcQl2BwaKYcPYt/UXBMEGxKDCswLicf73M=;
        b=VAQxr8s0mJn+t9NuHhTaXZHa9DmfVFIRvw4TtGr4K+Un3Yd2DIIWqWL3+MVvr1SiMc
         wincnLUjD38aB5vH0Z9uS6DlhwGGnVvqTJ1DenYogi7d+ZbOIRKEDlnXNJKk6V+YCxQL
         BQAczD1FD3fM6/LvZ7XTZFTKQeKeuDxdvurx0ZPEwsmehc4ubq1+L04EBu9uVEFzcZmz
         CMYaHjIPgVVN+UIw/WoqpuBphPyBTCBZ391sxYR9rWBEQ4fr3pT4DIWLQZELdSnEvhPm
         LS3X/FsTEig7uusBpbaM77Af1B+6L2cKcb0lYHP+ZuC2pDWyAc0fv8DF8XDADsdttNVY
         iiSg==
X-Gm-Message-State: AOAM530d1bL7F9/rPyqUiKAuHXY53Po4Ds3EsRI0mpzOhRteR1b0wACT
	mefX7a5v/DAPvjttN/or6+CBha80/HQnIA==
X-Google-Smtp-Source: ABdhPJzXMp7vWVt6MIAk+4O9ayjspXt4AITnoQ6gPfocjz+tzuNE71sYJLQq7QUzY47KrFBSZiqv1A==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr792293wrt.136.1610488330448;
        Tue, 12 Jan 2021 13:52:10 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:09 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/8] poppler: upgrade 20.12.1 -> 21.01.0
Date: Tue, 12 Jan 2021 22:51:54 +0100
Message-Id: <20210112215201.3940196-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 21.01.0
core:
 * Faster routines for jpeg decoding
 * Fix reading signatures in encrypted files
 * Add white point correction when lcms is used
 * JBIG2Stream: Fix byte counting
 * Fix potential data loss if we try to fetch a non existing Ref after modifying the document
 * Specifically use DeviceGray instead of DefaultGray for softmasks
 * Fix various issues handling broken files
utils:
 * pdftocairo: Setmode binary for windows
 * pdfsig: Add hability to digitally sign files
 * pdftoppm: add options to set DeviceGray/DeviceRGB/DeviceCMYK
 * pdftops: add options to set DeviceGray/DeviceRGB/DeviceCMYK
 * pdfimages: Account for rotation in PPI calculation
qt5:
 * Add hability to digitally sign files
qt6:
 * Add hability to digitally sign files
build system:
 * Enable clang-tidy bugprone-signed-char-misuse

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_20.12.1.bb => poppler_21.01.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_20.12.1.bb => poppler_21.01.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_20.12.1.bb b/meta-oe/recipes-support/poppler/poppler_21.01.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_20.12.1.bb
rename to meta-oe/recipes-support/poppler/poppler_21.01.0.bb
index 87a57523f..4d4c310a4 100644
--- a/meta-oe/recipes-support/poppler/poppler_20.12.1.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.01.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "d0aa2586c0a4296c775f0d2045f28bb95a694113fc995f95350faa12930f7b35"
+SRC_URI[sha256sum] = "016dde34e5f868ea98a32ca99b643325a9682281500942b7113f4ec88d20e2f3"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.26.2

