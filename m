Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.11480.1610837436222962434
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jan 2021 14:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NygYzjQS;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id h17so10202162wmq.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Jan 2021 14:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0Ht4NJDb7rqp0MDii4rjjLBOPVb15Do2Qg/xZsRnUo=;
        b=NygYzjQSCwHK4DYfTyPVymA1TpNRVz2dLIg6pxCU6o/WF0Hs5GfcmtpNpFZ3BB2SLQ
         94vvFLF9ypI3OQftxG9OY0gpDjQsOmD2yeG6VygrAYUVpp6pTN67Ffo2fVYapX9Rfc1g
         M334wCIfICKfWwobWcJ1+NVCo/LaO0MjhV423tMCDTmU5QldSpNA1S5zl4B99E1Hzako
         7VPEaqHZcluZXFW6dIA510/ocCbVJOTDbkah2AFu6MwM7fP35BCX7oARmLsJ5R3MGO4d
         jz9I12MtgxLOnx2BVfWwJfryfuaNcRwIwUbAcfdNHIyZ1PLvZUC5Cql90ruem+Qqffjo
         ISJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0Ht4NJDb7rqp0MDii4rjjLBOPVb15Do2Qg/xZsRnUo=;
        b=OwR66exAgozSeH81LTaNNLRXtKFZ4y2z6/BaoIm2Ur1j9et6Ltb4uR1np4CZUnlbtp
         8P3f3szojCyKUP+davlVDQymJ5siXmPQ3UBXbeurivvwLWh934MTVCv+5CCJCeZ4L1vX
         eSnPYlFXypVb4kOTX7DANOMtyt/iyjy5ISDO86+mKLqZZLjoGzMrG+WD6gOv0bTVmFU1
         WejBBVkrrG+z5ln7G2YQ4r03oP/nnzMlck4lwstfyYBpf9L16PdJCACiYMhAUPujAIsD
         pSkRz5MhQ+1jXRFTh3TjpG6CKLYcd0x3hvwCxJaBXD/9Xf8A2xYG5rdOcMNV+Eov7cjx
         yumQ==
X-Gm-Message-State: AOAM530cAOTYcXw93waGRMo3zDi5Sbzil2fJMrPMLNHivV5fcyUALJbv
	sxPWI8llaRhSN9VgBmU7MRRXedWBiUqysg==
X-Google-Smtp-Source: ABdhPJwLoyAD3feUOrLIAMDso8o53HQBDbyH3Z+SgGxiuIExOwDH3Gtc2m8t0Wr1qD0iEDVsSs+zjQ==
X-Received: by 2002:a05:600c:4e87:: with SMTP id f7mr14567545wmq.163.1610837434685;
        Sat, 16 Jan 2021 14:50:34 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07b34716c71558fcd84d86.dip0.t-ipconnect.de. [2003:f0:7f07:b347:16c7:1558:fcd8:4d86])
        by smtp.gmail.com with ESMTPSA id z21sm16891167wmk.20.2021.01.16.14.50.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 14:50:33 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] garcon: upgrade 0.8.0 -> 4.16.1
Date: Sat, 16 Jan 2021 23:50:19 +0100
Message-Id: <20210116225021.3753895-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.1
========================
- Launch applications as children again (Fixes #18)
- Translation Updates:
  Kabyle, Portuguese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/garcon/{garcon_0.8.0.bb => garcon_4.16.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.8.0.bb => garcon_4.16.1.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
index bbaa6fd6f..3e596323d 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
@@ -9,7 +9,7 @@ inherit xfce gtk-doc gobject-introspection features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[sha256sum] = "4811d89ee5bc48dbdeffd69fc3eec6c112bbf01fde98a9e848335b374a4aa1bb"
+SRC_URI[sha256sum] = "84914927a2c1fda167f67af26a6640630a744a22940df508aa6c752cdbd3d21d"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.26.2

