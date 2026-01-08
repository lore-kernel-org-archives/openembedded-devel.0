Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338C3D185CE
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4004.1767869633216173935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XIw7p8kF;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso12135845e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869632; x=1768474432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJRTcWonr8fUqLFeIuBYlgJOS7IMDyhZBd8BdDgg5ag=;
        b=XIw7p8kFqIuW6n1QwPRHkYGZO2/HPWpJr00LcVWz2e1UkO+i83wk5GBBxXqJLu75zG
         jkf14E6lF/xxHFjZSoMx7+oQA1gkcMCX48NT1/3KWMu82r+CWDRGDxvpoHBK3Jg8DHGM
         8LDhCf3w6ek7Sd/xXsQKshqXlIkbb8/wKVhvKIaaOAkloTKlGz2jLM0e2Dxq4STIpMmF
         uQgSFvCxEL2PTDq9JL/1tpQ/IE2ff449X2Ei00iSYt7OAvseg1CfBTEXlm5BzQMoMKyL
         UaShfanWluXwPhsmL9fuZt1pxWNmh2wUK5sw8MY2KpUpdrvZP/0j9z6KRBN6gnsDaFCe
         CZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869632; x=1768474432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vJRTcWonr8fUqLFeIuBYlgJOS7IMDyhZBd8BdDgg5ag=;
        b=tvqMXDi6HAtpbQ6cXyR/j/IDTtrF0IcxxvvF0GBWTdl4pyArFuSoHV9EB3G/cclQSw
         GP2d6FD0q86/bNqdDrxROg4tU+Vu8VsOXSQr93A55x9GEQftQE+8/7TrpU9Qq00tb71H
         60Qwv5gATvz6gkte6xC8t1WyToAwfcYLBTJ8QaU7bGg1Y8ZriRUL/zhbxl8nqFk6IRs1
         APQMuGEAVNbCgjnWS7Smug0xI1jh6xBVOeKIgCRS6DkgeCufMahHinJK1tdweoOhDmu/
         kULNncj0ChJG2W9Eclv6OwmDVoQ+W8r0bgdcncs7kiC1XJpv99bmu9kY1iLRSgAHmoC0
         gA8g==
X-Gm-Message-State: AOJu0YyBQCTdOmQtXvPh7WOn6c3qiqGukn5qMMkeGnrS540dIlVZoOJU
	ltA37daPLPdQSCAXK1+xBLVn8e58XK6lZdzfSlGavnXIfm5auA3QKAdDAPPxWw==
X-Gm-Gg: AY/fxX4lzec03xzXQz+aQiHbiauncH4eYZQvxBGWmbAjS2U+Vvtz0o/KDFtHor5HOje
	oGIw7RtPpiaw5IG1+kZzmJgwmQev4WpZKKKwm+g5JP+1cA0l3iQb9zz0wq6wz/YfDrkSlL1IW8f
	5opVmUZW7puwUj5hXh067ys4EjgnSk2L9EmB7S5l6d/z34k+zwd384VNQOHjiH4Y1E53Qm9gkXU
	fCnMLLD3+vw+GTTiWyi+CZfdP6wHdEQT3Ta7K38Qjj0EPkna4iQNdn95zXNmcYO5UwGMe1pSQOX
	69J4rQiohXG9YGJoBJPfqLjxop61TyeuZAmFVCk0p7f/ukIY+6yw6ISLkgkl8PN9XKLbGQ/6Oim
	tGn3y4QP68L2CRmTF8ObCNU+HGVqrt7OLmrvAaEL/sJb7RfQ2d5ypuNx87TXWsY1rlXzp/hpoQD
	FpA7uiK7Jh+NPDEHms11k=
X-Google-Smtp-Source: AGHT+IGSDNeG8QxVg1EuPHh2E9jIpbQtccmQtK+CdJLHrKCLO5K60B5JhnymACDmQ2lNj1q9JeLNOA==
X-Received: by 2002:a05:600c:3b28:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-47d84b41bbfmr68591965e9.33.1767869631531;
        Thu, 08 Jan 2026 02:53:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 06/15] imagemagick: patch CVE-2025-53101
Date: Thu,  8 Jan 2026 11:53:08 +0100
Message-ID: <20260108105317.460246-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123260

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53101

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-53101.patch          | 54 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch
new file mode 100644
index 0000000000..5688ad1372
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch
@@ -0,0 +1,54 @@
+From 682d679b300cdcbb0990742c29cd4397fe43c65d Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Fri, 27 Jun 2025 20:02:12 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qh3h-j545-h8c9
+
+CVE: CVE-2025-53101
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/image.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 1b242f828..ca89e9cc4 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1665,7 +1665,6 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+     canonical;
+ 
+   ssize_t
+-    field_width,
+     offset;
+ 
+   canonical=MagickFalse;
+@@ -1681,21 +1680,23 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+         p++;
+         continue;
+       }
+-    field_width=0;
+-    if (*q == '0')
+-      field_width=(ssize_t) strtol(q,&q,10);
+     switch (*q)
+     {
+       case 'd':
+       case 'o':
+       case 'x':
+       {
++        ssize_t
++          count;
++
+         q++;
+         c=(*q);
+         *q='\0';
+-        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
++        count=FormatLocaleString(filename+(p-format-offset),(size_t)
+           (MagickPathExtent-(p-format-offset)),p,value);
+-        offset+=(4-field_width);
++        if ((count <= 0) || (count > (MagickPathExtent-(p-format-offset))))
++          return(0);
++        offset+=(ssize_t) ((q-p)-count);
+         *q=c;
+         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
+         canonical=MagickTrue;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index cb4735e394..e486d072be 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-53014.patch \
            file://CVE-2025-53015.patch \
            file://CVE-2025-53019.patch \
+           file://CVE-2025-53101.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

