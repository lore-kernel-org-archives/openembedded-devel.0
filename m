Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B14E6814E
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:01:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8204.1771318894035334582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Idfc8D++;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824af5e5c81so3816581b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 01:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771318893; x=1771923693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9I5MRLb4iWZOh/Wuufp4g1kF52dvUjWdb0ExQvCOdnc=;
        b=Idfc8D++NcNcK6WBpwDh+WAlMjkmADkvLfG1RDGcBs2ScAULM1rcRPvti+09+h79yD
         QXICr4n47Y8zDlSKizjc8GpuwhohkokCC6Fj6exlayd5B0jHEuh/E84aTtWG0ZoOhnUl
         Zh3M+21R+Q7KLAgxWK9iC7v/sCYWMb3e2VEl8Wk/Zn/1RWzXMxyfbmA0XRPrO5DyAq1o
         b8m2A9aBFyyTY1BEaYYbCHHEWWyytA5nui3ZbDQ88sYZKuC75pGlPAQm416F/BxcCb7J
         PJ3IlqItJltSFjAVllKsYlB5EJ35Mj67eVhqg+3yjTCgYre/kVnjv01dWdF6CahILI2n
         A6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771318893; x=1771923693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9I5MRLb4iWZOh/Wuufp4g1kF52dvUjWdb0ExQvCOdnc=;
        b=WazI9s8s2dxvKGPhfkSAqaeekst35n5qclmxd/Jd37XFBNjLwlS50dJ4/2x7GU4KDc
         R9EYiQHaVJIXJ8HojLGlIuGlYdJY72DIBlKQsqlLBx+XYIqfBI3brIf66GCi4HwHwju5
         0dGUGih2CyVEdX3WvY61qzh7/8srxSfYVhIAeDks7QFkBoCQ51vSTWT/g1CNk6JgnB5V
         aiqLqVMGeJMvh0kffSmT9/bkWQc166VjN9e/EMpJaycHCbKc+hZaMv+ij4ssVQ/FLbM5
         SYCmqVgM0iSwtfoMzLx1qW5wdQOh+FL+gXuWUXfGGVWTLD8H9119RNbVe5Bp7Ug7srY8
         lD4A==
X-Gm-Message-State: AOJu0Yw44rhHnctxJoEyGQwORWGZk6j51rdkQl0YOspitKb36rrQingc
	RjU0agp99K8I/9itshHLtOwh+EjOAz1H78FVAchs+detmbBT8g+E89jc6KRAIA==
X-Gm-Gg: AZuq6aKZmLl6zEcPceDGBdWSNlLr6eimTSpKJqamd0CdXlO9MfmNcomSOXOBlVB93yv
	DUcSsxaLy8m8dmHPCBACMs8QvYszccKg2Qe/YBxomR9XrdwPd/GiA85JPN9EgzPAlVkbVSiYLGG
	V+Ar2pVR0QFOH/CCGbHR54JjQZBMy9mhJBqWkJGr6WTaAtGXF5VAo5AeEgscn8/ncDTwLAMP5yk
	IGiajgs+h/O1mGprWoo7yi/MS5YtRtGDGaq2txBCuWhBDaT5O+wYsyFofK9WUHgjKlVROFDSXee
	r/0p9KWSOQnUmDVd/fZXBwFStLecEINeLFvATwYI0nildiy4qC05vvEidmJmyBRgC8UeyPSLpaq
	8/zsiAZW7eOgiw3/Z+p1npMQzKbwXbJLcTMfDDmgLm3aaiNqakKCvR/wwIp1RvXjD9o25Dz1+BE
	HrK7c/Wxrcz+bITfxM4xUyWS3eBIOfzQ==
X-Received: by 2002:a05:6a20:e292:b0:366:14ac:e1f0 with SMTP id adf61e73a8af0-3946733e2f3mr14526806637.66.1771318893241;
        Tue, 17 Feb 2026 01:01:33 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5332facfsm9171274a12.32.2026.02.17.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:01:32 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [meta-oe][scartgap][PATCH 2/4] imagemagick: Fix CVE-2026-23874
Date: Tue, 17 Feb 2026 14:30:17 +0530
Message-Id: <20260217090019.1076725-2-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217090019.1076725-1-bhabu.bindu@kpit.com>
References: <20260217090019.1076725-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 09:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124442

Fix CVE-2026-23874 with patch provided by Debian from fixed version.

Link: https://security-tracker.debian.org/tracker/CVE-2026-23874

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../imagemagick/CVE-2026-23874.patch          | 40 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23874.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23874.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23874.patch
new file mode 100644
index 0000000000..59fa8354e2
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23874.patch
@@ -0,0 +1,40 @@
+From 2a09644b10a5b146e0a7c63b778bd74a112ebec3 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 15 Jan 2026 17:50:19 -0500
+Subject: [PATCH] MSL: Stack overflow via infinite recursion in
+ ProcessMSLScript
+
+CVE: CVE-2026-23874
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2a09644b10a5b146e0a7c63b778bd74a112ebec3]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ coders/msl.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/coders/msl.c b/coders/msl.c
+index 5b182b5922f..53e3a95d14b 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -7041,9 +7041,19 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+ 
+           /* process */
+           {
+-            *msl_info->image_info[n]->magick='\0';
+-            (void) WriteImage(msl_info->image_info[n], msl_info->image[n],
+-              msl_info->exception);
++            (void) CopyMagickString(msl_info->image_info[n]->filename,
++              msl_info->image[n]->filename,MagickPathExtent);
++            (void) SetImageInfo(msl_info->image_info[n],1,exception);
++            if (LocaleCompare(msl_info->image_info[n]->magick,"msl") != 0)
++              {
++                *msl_info->image_info[n]->magick='\0';
++                (void) WriteImage(msl_info->image_info[n],msl_info->image[n],
++                  msl_info->exception);
++              }
++            else
++              (void) ThrowMagickException(msl_info->exception,GetMagickModule(),
++                FileOpenError,"UnableToWriteFile","`%s'",
++                msl_info->image[n]->filename);
+             break;
+           }
+         }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 94b2df10a2..0a1d34e313 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-62171.patch \
            file://CVE-2025-65955.patch \
            file://CVE-2026-22770.patch \
+           file://CVE-2026-23874.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


