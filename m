Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.4637.1607406932501247811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 21:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lEMjb03h;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id y10so4963934plr.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Dec 2020 21:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCzEsmsmx15egFTGlD19DCo5aWu1gxm2weSzLVvlgro=;
        b=lEMjb03hSCJZOD67kLn3Z7znF3SXM3vYJy3peIzNRBHClwGPEqSJCv10khcC2TP4uL
         5mJ31cp9LC+9g7tjectAxCTvS8b0PaUKpr4FYMJjaRtwU+2Vpow8ftfADKw5exOTEdys
         6pwt2sFpO75YujG5fWRivMDBcDuHKS/kRKcr3GXUc/EGgvkDN93qejEi+tV81gjChnfK
         z70qx9No2IDUcmL+dnuXm73k2hEPD0QJBoOvs9EpKq7YiQK6xKWP7iBpEvTmA1N3vRir
         T9kpu0RFvh8wFFEJE5dfScJ4mOV0X6S7InpyU5qihSCqblU0ODGf5/wZo2QqmdGFlWhV
         /Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCzEsmsmx15egFTGlD19DCo5aWu1gxm2weSzLVvlgro=;
        b=qOD5DrW6OWKVWPgCzxcEHsE07CejM8gxiOLd2s3WsL3NdggVn8K5Kx3grfuD0r/61E
         ObFdcjLPcnLmaQKGCNzEZPQGVZJ8N5l7ZpgJ3FTEFxGUXyju6Az50mgRKDiajjzXigss
         2iSu2A5KUYMhjjHC5YZ0Og0FR5LFNlQx6kz94CKcryrKdSPNBRyPTxBn+JmEPqsm64Xp
         Vy18/pV60GM4WZ4P2GqDGXqgjNeW3L2kgpXka8l8us5DYyKAHaNJyckmk5iCrbKSlOR8
         YQCBDG7lhKza/nB8+S12YWJGw60R1pvkv+nXIXnczBd/2Mt72OjFWSKOykesNVvAGFLd
         i9Pw==
X-Gm-Message-State: AOAM531FtW1K+QnnZuhFQwKovDWcn3f/BsGVzd5nNHB0So91Q72PyOSZ
	6pv8Bew3oHObbfjTWTA9b0aE1WQ4HI0lgQ==
X-Google-Smtp-Source: ABdhPJwC8ZHKo9JYWwVnK6oCzSlmuI7gyp6O1SfynxAh9TDh8yFmX9xh39vGCVpg/a+QVpP7dw5eOA==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id o2-20020a1709026b02b02900dac6c0d650mr20176281plk.74.1607406931680;
        Mon, 07 Dec 2020 21:55:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::23fd])
        by smtp.gmail.com with ESMTPSA id a10sm16182009pfi.168.2020.12.07.21.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 21:55:31 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 4/4] openct: use upstream SRC_URI
Date: Mon,  7 Dec 2020 21:55:25 -0800
Message-Id: <20201208055525.877400-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208055525.877400-1-raj.khem@gmail.com>
References: <20201208055525.877400-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

The Debian pool URLs are not permanent, and the package is no longer
included in any active Debian release. It is also not available through
any of the default Debian snapshot mirrors. Instead of adding a new
Debian snapshot mirror, use the upstream URL directly.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 08b2e3c232..1514c7a958 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -11,7 +11,7 @@ readers to remote machines via TCP/IP."
 DEPENDS += "libtool pcsc-lite libusb-compat"
 
 SRC_URI = " \
-    ${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
+    https://downloads.sourceforge.net/project/opensc/${BPN}/${BPN}-${PV}.tar.gz \
     file://etc-openct.udev.in-disablePROGRAM.patch \
     file://etc-openct_usb.in-modify-UDEVINFO.patch \
     file://openct.init \
-- 
2.29.2

