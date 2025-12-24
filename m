Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA8EE78493
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:39:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127562.1766608755980050436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8e2sD1K;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so41148635e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766608754; x=1767213554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eBg6UXuP/vP9SjpZF0WDfHajePSvJ+d3li7OPW7rDIs=;
        b=M8e2sD1KdG33TPiLqUK1l4Fn6T8dZTqZUiQuriUA/5NDXhx0KTqvDKsOZ5gbp7Wigu
         ys46k6x2jai7FTydNdTWrpiAqepkTkclIk6JqCqLgXZPtvQn/ttq8++A29mqibzlLWe9
         bfje0ZCZpLq0SjkGF540ShfYe+dYf5sLBx581gRdmXA3TEAPQ65xd7FiWIyG5invC/Ks
         Sxhb3AgNJXSBb5dt8l2w2Xr4nV18vzWNcB2AWAkMkpZ0FlsE42el6W1eyHWYTfp/a1kT
         JuI8iuNwZMp5KXH0H8jkDCMu6HkiFIqjB2YOkGbkVQZ12r0wTKQ+SnakoBuJLB4AyuXi
         nqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766608754; x=1767213554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBg6UXuP/vP9SjpZF0WDfHajePSvJ+d3li7OPW7rDIs=;
        b=q0N6x3kDiCFiAyb1iazAbF4vyS5z7ls9+hNYE6ff3igzpgFNSXOYYTFnTxfAKx4QW/
         WVZP53peKfi0cRO4x5mKNWNBAaF1NSpqAprRCLZGIupVoPzI600z0Ka2BHfL5ImVicf0
         vLdiENQlD/YN8BAjg5goiwVp7OLxrE1N4JumPOgcLDzEShuCGfUyoiMFlyKH4/ysSLb3
         mSdpqQZ8GYfjMUP7o25T7nmC9+JSU7bGoolgIG4fzQqIKZ9yr+5HGfuOc73cNuIhCxsH
         vstS2wxoWCK2cRQ+px2/kI0zAI/MBBNanyp1LMHeGASHHADhN8MmJVg8OFQavkpmFi7R
         BLBQ==
X-Gm-Message-State: AOJu0YwXBHNiEZ7wJ7IhTDTeX1le/KCQ5FqcWAwwF6Y6CKwcfbV/axfq
	Ib11hvjycCT07a4y2ElNnNnAe5mfbHsP13/6vfDgb+uGvp91FG354UAD0i31oA==
X-Gm-Gg: AY/fxX6wP26vIYDZFPg+rAYYWLHx4ccrKzpCydUg25BNULs/OTSqkq6VJGgX01aCKhm
	H3P8APFQKSKCmo3zxJzN7MsX+Ejcrq9EdaBr6UeDGUMg+4hG827h89uyVNbUOMQyl6fuHYgt6RW
	3AuxyTAKh3qqCaD45ipqfHElyKP080uPyOPprwtpphrmovKly282wbwR2QJIfUMQ0PtEPaVQFTA
	NrwzXQFTWfZNqUzocmRyNQmTxTi8ggMiHyhofkVeevWQKdQalqqsqiKTpelKjLenjRB/oE8aUqi
	XLv5K0pK+FLBqmQeJ+UJeEUnW6fyGWr/StPo6+066FAShSGjnxqc/tRYzqKS3CHTwiBZnUXz4oe
	T0cVkWon1bzKIoG59SdDZQdaXwZ7bheTtVl7yhZV0hsxrEMHuBwneSBRBMXtehwbw8o9vjCxsDk
	cR5e/sUkUP
X-Google-Smtp-Source: AGHT+IEWwz86OI/FqLJ5JvItjJvllT6GV1i09jl5SACgdq4PezfNs/JNXonrvwVsO/ZXewIVKW++1g==
X-Received: by 2002:a05:600c:4fc6:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47d1953bc3cmr164483535e9.5.1766608754060;
        Wed, 24 Dec 2025 12:39:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272eaf8sm361970155e9.5.2025.12.24.12.39.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 12:39:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 1/2] freerdp3: upgrade 3.19.0 -> 3.20.0
Date: Wed, 24 Dec 2025 21:39:12 +0100
Message-ID: <20251224203913.2794088-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122901

Contains fix for CVE-2025-68118

Changelog:
3.20.0:
Mingw fixes
[crypto,certificate_data] add some hostname sanitation
[client,common]: Fix loading of rdpsnd channel
[client,sdl] set touch and pen hints

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: there was no v2
v3: rebased on the current master branch

 .../freerdp/{freerdp3_3.19.1.bb => freerdp3_3.20.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.19.1.bb => freerdp3_3.20.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.19.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.19.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
index 055e757907..07e6db69b7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.19.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "f848367ffa82b43c52705b637cfc9cdfd594f7c5"
+SRCREV = "b8e790a02ede8dd64ff7177fb9027d1844e66bb6"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 

