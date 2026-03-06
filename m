Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCF9FCB611
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71233.1772809568688252316
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BbhEiPXu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so109128925e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809567; x=1773414367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzB4eCJSOwoHOWM08vjAGtmEV/qow6F+2N6eV6Rf4Cw=;
        b=BbhEiPXuKRauNevoR0uSnxYyHuPimSW1j5lyHKVd2tyFshX731WPDWXdBFvsN5wP0G
         4NlZNbne3Kt2GII2qup+rex9ZsbpoTUUgoeULZ8Sg10aItv1Te0CpgD+AxRVtp9nuCh2
         uSNVRojRCB6Y85tW+d+5VzHAN5TiFlcfgHtSWGWbTT2Bes0lyHKuzTL4nCHH2rd1en1s
         3CASMUBeSNPWVgEIIQl/Nn47maSKxSApuXxh03ZXlvZftarvtJn74mBcokOEYec/M7KZ
         IREz/aIb8zEJ5+WLrg2UteLheR6Baab2MkT7VVThAn+y1duVR3aT8yQfXdtk0Q8dUV+4
         E4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809567; x=1773414367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dzB4eCJSOwoHOWM08vjAGtmEV/qow6F+2N6eV6Rf4Cw=;
        b=Q+/tsU32aO66Z33HIHDmUEaAYuhBJWvJyFMFRAOSo96rGkdmjKL7z+9n1A17CBcWuO
         DT9a1F3ltPX/IZhNEzIAwkhx608+X5YqBEUc2kIgERT5HHlLnRe0xXGEcz2YXKxOf8JS
         oOOWRUSGoDKGWo2XxHT7koVSEpAHBcjLEmLUAOSjpWFu6LkxFdu9bCf8I6CvpT8bZPMp
         5ES2WneUxD/wN0mfYWhed7zqYudsyeZ2SR7e625KCvW+OQQ76eTKkHebvgNSivMncac5
         Sa2UW+KBIYvgH587QtnrSnxpAL7lfrDJAVUaEqWy9IhygMAybeLnLF5NxLgqX/hIq7+2
         gVtg==
X-Gm-Message-State: AOJu0Yz+AFUsnk+VO1tL9z4GRRPTT5z7vTWjPGeZM16oNvovKPhNR1Je
	7yz7giN4DW1t8kiz9ajFigpEFuVPHKqrooWPTo62hUmfVdVv8MiOBkUFuly3Tw==
X-Gm-Gg: ATEYQzyv7RyMAi0Cs5AgEB1MET+X973Hrfr15pnzxg7YCbUJd07ZWEJLfse6KyXn98N
	zAb/ELX66jq3R/RDgsWWeGtjwmQGGc3e5D77hM04J0AN9roDyPrC9bSEqkmaET+wYW8MOuSYmv8
	kK7cQv8KJepvOe5xKeZ3lL5sHeMr5XG/K0shdtFub+xIEHJ/zMRWNVqi2ptkXv9Ld0FPD6DZEZN
	YHoD1BV4rCEP4Djiz+EqwI/VPwGOo5Xz9Pw0K3J1USwbMUvgJqQyro0jJpP4EMGb2vK4ot3lsO0
	lF3NiTyFlDQYLDQ4e+s15owaY7BN8DsO8njGgRGeoSF/32239+L8ne7zP5AYFv+gwwgULWpEAW1
	vkFQntOPiKtI+XxilOf5VUAmlKJ4mWl4MztfPvWzib/c7opp54Xu9KtpIy5XIY7LPI8BwzorVYY
	+v64wayutkg07DxgDw9GcN
X-Received: by 2002:a05:600c:6387:b0:483:3380:ca0c with SMTP id 5b1f17b1804b1-48526979206mr41116225e9.35.1772809566810;
        Fri, 06 Mar 2026 07:06:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 05/11] imagemagick: patch CVE-2026-25637
Date: Fri,  6 Mar 2026 16:05:56 +0100
Message-ID: <20260306150602.616834-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124909

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25637

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25637.patch          | 41 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25637.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25637.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25637.patch
new file mode 100644
index 0000000000..030a833966
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25637.patch
@@ -0,0 +1,41 @@
+From b5cf2b185d6b08eae82a401483623ab780dcfc25 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Wed, 4 Feb 2026 17:19:53 +0100
+Subject: [PATCH] Fixed possible memory leak (GHSA-gm37-qx7w-p258)
+
+CVE: CVE-2026-25637
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/30ce0e8efbd72fd6b50ed3a10ae22f57c8901137]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/ashlar.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/coders/ashlar.c b/coders/ashlar.c
+index e94cd473d..a6c8c769c 100644
+--- a/coders/ashlar.c
++++ b/coders/ashlar.c
+@@ -655,13 +655,13 @@ static Image *ASHLARImage(ImageInfo *image_info,Image *image,
+           *label,
+           offset[MagickPathExtent];
+ 
+-        DrawInfo
+-          *draw_info = CloneDrawInfo(image_info,(DrawInfo *) NULL);
+-
+         label=InterpretImageProperties((ImageInfo *) image_info,tile_image,
+           value,exception);
+         if (label != (const char *) NULL)
+           {
++            DrawInfo
++              *draw_info = CloneDrawInfo(image_info,(DrawInfo *) NULL);
++
+             (void) CloneString(&draw_info->text,label);
+             label=DestroyString(label);
+             (void) FormatLocaleString(offset,MagickPathExtent,"%+g%+g",(double)
+@@ -669,6 +669,7 @@ static Image *ASHLARImage(ImageInfo *image_info,Image *image,
+               geometry.y/2.0+4);
+             (void) CloneString(&draw_info->geometry,offset);
+             status=AnnotateImage(ashlar_image,draw_info,exception);
++            draw_info=DestroyDrawInfo(draw_info);
+           }
+       }
+ #if defined(MAGICKCORE_OPENMP_SUPPORT)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 6e0b42cd2a..362ce24e59 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-24484.patch \
            file://CVE-2026-24485.patch \
            file://CVE-2026-25576.patch \
+           file://CVE-2026-25637.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

