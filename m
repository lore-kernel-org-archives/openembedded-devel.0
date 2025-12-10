Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B500D3C902
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:28:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15674.1765373282999186560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uoyg3IDg;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7e2762ad850so7128706b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373282; x=1765978082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxURYvzP2mHWkeRAm1GmK7o0zbVz/+hxQDyIyxjvTNQ=;
        b=Uoyg3IDgW2Qk7aOyjGp8ney/I02i0P2bUTtnGntDImluPag2luQvY4tdaRax4wyv6u
         BltO57SmnXwrhoo2Srk3O72MeCNIvqh6CTqJND8agZGPOxiuqdGMZ01P1y13dSEMZWDw
         EYdzEd50QdVcmzfKQ8ovi4H0c2POlNMc08Qkthn/okK3kTKeWYOX57YGGhlT38/YfFLI
         JFyiuTnYLRrggJ4zZnR1ML7Sk4t2BxysduOQB8UixV5+ZN/aAsYPaA56bf8X3cNtxvr5
         UAvwTJt13ecXgHQ5sL6ETbDNeyp0KzxEb21WjoXBe7w3M8rJSR48F8qiXS8WZIO96Lbl
         PF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373282; x=1765978082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SxURYvzP2mHWkeRAm1GmK7o0zbVz/+hxQDyIyxjvTNQ=;
        b=YycXty/kdf9ASxO7YBaLp9hSLvljjqmvdMxzmIpOWSte0XxZKeX42UY2ilFkKf8N/1
         vUQHcaY3MVr9MXaoUdKAkd9qge7D2uT9Sawc3d+KdGVXme9mKxL3tJcckVqFqpLEPvcg
         Uhkd8n52t6uvXu3YW7MFIptKek46J7MeNQOh5QqIgEeaqjzKr//Vxhl6xb0ZdWvsbA3r
         CTHe+XYLrExUINJ6TJ63pyCwj66R8Ky6KNN3pmJI6VFnoTVgY+9gUuNntLxLKv9v88lJ
         hbfsIb/SK56G0FZODF091Cc/L48FH+18IeEoz+hvzQOa1tFuAdiFHmVol3IRTJwDxWXy
         NGfw==
X-Gm-Message-State: AOJu0YzqRpYjuqaC6n8q1uQvoGLmhIDbmoOTzhiDKYZM3Qdsk56Y8mFD
	/PmIyUUSGcSAzw8XWThC8N6xwTsbya2vox1qGO43lSHY53aYDBTbNAS3qPKHgA==
X-Gm-Gg: AY/fxX5V1cnNMY3QonVCz83ZXRuIjApQBkHzVNjCmFELk3IVfnbI7SDS6p5NuSvY2jY
	i/ZPEcgso8rEhJTvEOtwdfE5LSbBDzcSjtIEEfBwak/CJnMrBiLaFtVmLwlU+zRilRahNPgd7Co
	omVic26ApR2qLSFp5k60rnRLY6nt8k5GouP0NxJ5RETzoNdzXuPUcGyw/vxn5HVckkwOav5CKfW
	Zmyw4a+W2XpvCvjpCV/73abuzPRTfeF1gCOAD7YGfyPde94OfyKmpzh34IzJ1pEHUmJPditHcFI
	N0KyDTsUU9jIiEqFx3IszwC6husQBEKoLyFKGWE4FUfkf814mYsygt91V5EfOu53NKfL5e4IRMD
	LB3hljYnScGwSbxlcAiQIbm+E3e905a1/dGmQ4/xQIKvD40/luibEjnEiQT2nWZKf5wbEYQEq7u
	uT4/9HGliEgp5wiYHuNl3+T4w=
X-Google-Smtp-Source: AGHT+IEhIsdSJecq4GCH0+zIavkZWFYwcpeF21VsgJwOm0WUWcFng/jMtYCuiPwjM53fRKmSHoGOuA==
X-Received: by 2002:a05:6a00:3d08:b0:7aa:5c32:17a3 with SMTP id d2e1a72fcca58-7f22dfa61a1mr2396642b3a.17.1765373282161;
        Wed, 10 Dec 2025 05:28:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:28:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 40/43] version-check.conf: mute version mismatch warning for flite
Date: Wed, 10 Dec 2025 18:57:41 +0530
Message-ID: <20251210132744.336180-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
References: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122544

From: Changqing Li <changqing.li@windriver.com>

* flite --version return 1 block version output for
  check-version-mismatch.bbclass
* even with version output flite-2.2-current, regular version match
  regexp cannot match the version

so mute version mismatch warning for flite

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d819512cb3d9e58e7f664aa11cd00b797f219af7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index b41c9e8d22..d1a6cdf7a5 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -35,3 +35,4 @@ CHECK_VERSION_PV:pn-pps-tools = '%'
 CHECK_VERSION_PV:pn-libusb-compat = "0.1.12"
 CHECK_VERSION_PV:pn-jemalloc = "${@d.getVar('PV').split('+')[0]}%"
 CHECK_VERSION_PV:pn-dialog = "${@d.getVar('PV').split('-')[0]}%"
+CHECK_VERSION_PV:pn-flite = '%'

