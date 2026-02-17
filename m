Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49906E8385D
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 06:52:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7076.1771311145725440362
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 22:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U5+5nUn7;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82318702afbso2747388b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 22:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771311145; x=1771915945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9I5MRLb4iWZOh/Wuufp4g1kF52dvUjWdb0ExQvCOdnc=;
        b=U5+5nUn7agXCy9Xia8nSfTtG7PCH41hrsRJGT8oUuYgedY0COv9xey7GZp6in/Mo8K
         GqtN9n+bn6zopogfZ83JPAbSl6VUMe7BOYur8e5BMcHHlrimkqfTQ19UsN+iggF1qjPC
         SO9g4TDAchWCYxyosfr+YZV4cxBEDAmBuysfA1BdDTsavnFGsDMvndewbgbbdtR7n4Vc
         nnHIaDKhy8b2jUlfpHODdpotlIzLZI9apGI1syhGIlO7KdGeM1pnkld62fMbm5ft7Yyi
         /DWeV2x8wdB/AwoOHiij+2fdxpS64PxLbGJD/UWMkduimvfGzEyvDQ+c4uvHqVAteNdn
         fkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771311145; x=1771915945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9I5MRLb4iWZOh/Wuufp4g1kF52dvUjWdb0ExQvCOdnc=;
        b=EJn+3fWinDnV6IO3bJxyIE4B+Qbbz6D6+QuK8Cjf1vKCiKQNYlCZoWZIFVso0S6+tH
         gxSj/x4pmuPw8UzIEfspfeYGcKwbZxCLGTAf7bPx0HtdXPtLZgfpvn/nSYuJGHgIa/ix
         5mehhlVwOGpFIx5BGtLfGEriU2R30uBKSWACAJnnAOX3nmpssy0gpFgzbxx8bJ+JRpBh
         qtMmf0dhDqEFcHdHsVtY1/0DbJE+MSWt84Fw4x1OTouIdL3+YFsIOCEOVPwxMKfD0sjz
         er+BoL5CwA69sw/83p/pjLTCXZ8PFhGSVQDxMF4OcNONOUd9cszjkQrsDcoofxWjhcdr
         Dnig==
X-Gm-Message-State: AOJu0YzmgyzhtUddeCBuJqq6doG4UH+LLbDvudl1aa2gO5Rb2h1bXjPS
	YWFncBCps7k9EAPB/7r5TdYC6Yg8fKDy3I6kOJX5OY2TwKUFQHRrMrG09xv6PQ==
X-Gm-Gg: AZuq6aLVFWpDLbrwgWJZzFjy0CciHbOftIKAu+D/G5qxu0NwCzNETCqAhTbaMAOk4ar
	IhhwuDH2UlPmAJG3M2i1s6iqMAAU0GNQowrubfT6OpBn5QD2IMo2pSHnioG1yd1L86uEBy4A9v0
	VYLZdzuiOykRDccTjX1yoOeTggYfnyzArZZgUlBXdRICpHV4R/KhPGD8FlQNVVwBcm8CEXxdM4P
	5xe9iYguJBRKotxU/cUWwHHtjKZmgyq9V6YHULFZ66Uw486r5r7jleEkj1vk4VbgKBNNsbftGYf
	YejUKks58NAPkgHqvMmL5PgPtO/Dq1ajBE15/ksg9SpHq5gXxlhJlbJcYkgzxOaahiMNPWOwnXQ
	aBl5TV2rIiVEOm4uQx2kxE2ZJTQMM4Kn1BGHmGyE0z59qDJbHP9GNEiJIwNnU6JDTa+NH6TJDuw
	MAYYzSmmzOXR2B1YKV+8Hkz9ToqUtQzg==
X-Received: by 2002:a05:6a20:438e:b0:392:e5ab:3125 with SMTP id adf61e73a8af0-39483aa0c07mr10252000637.66.1771311144879;
        Mon, 16 Feb 2026 22:52:24 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a61cf8asm131561585ad.0.2026.02.16.22.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:52:24 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [OE-core][scartgap][PATCH 2/4] imagemagick: Fix CVE-2026-23874
Date: Tue, 17 Feb 2026 12:21:21 +0530
Message-Id: <20260217065123.1001038-2-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217065123.1001038-1-bhabu.bindu@kpit.com>
References: <20260217065123.1001038-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124436

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


