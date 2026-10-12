Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B63CC6B04
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:12:05 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5102.1791839517318557808
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rhbk2wgx;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1068841a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839517; x=1792444317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFdLD08Zonuc1MwlLqwImzL9VYb6JVQWrc6o++fcaLQ=;
        b=rhbk2wgxd+pnuyIZvSEp9q/8AZr6dCaMhIuOvnqY3Dn7IulSBe2ZiVKzxXTvk3wncF
         JZXi0V2TS0jjKQVbydNFdOhczdFBjhz21+39HKbUfSxwr5GF3KegWcvSA1OstRW4zsO6
         ydqDctZxO1UiKzditaJn+XstPQo+XiCdn2LmTQr5xTm8PHQg8GxIs2JrLSMFDUU8dMCn
         2BIFfY6b7TphVL6HOLeWg81dmAoELcvCIzMGy8xxAspb9+AfRXcdu0xAIGO+arypQFr1
         JHPdJeYIg4wJj+37krPOiay7Ra3mswJ7GVr5Aw/OP1Pjy5y+5jVM5Rl3cAFs1IGNIoDo
         WIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839517; x=1792444317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFdLD08Zonuc1MwlLqwImzL9VYb6JVQWrc6o++fcaLQ=;
        b=xl7mJdU8ztwBft6YWDyi+UBuW90kvsORKo6bCZPfSEfrH7VMoNZAXVnoU8pV/08Dnc
         Pggm7jKaJq9/GIX1J4KrkhUJ5fv6mINtGbqABlkzShKKWyUS0G1Tam7lZB7/KeRvpt63
         n0GLqTmOTVT7DqcV/wgSB8a9rmeEi3Y5DOhWo0xJBlpq72V8Y/YaxLpCWMO9FxKFkylD
         kKtX1TKSV2Kig/RQ+RaPlhxM70Kf6WOm5P2tqOsxm6AhJ02VtyWqM6vPjKQTtftL57fW
         KxNWgmCOjE1SDEi4zBaDC1G1lNgHO8lQiBeZxTLx4bm/SZYkvF08G4RdG0C7bJSkcaXT
         jv/w==
X-Gm-Message-State: AFq9FYJ97yc9y84B1np1ie+Zm86m/0qQfosSTCqBwntdHnYtdT4obTmC
	8NbTntc42zRsakvc+/43P+0xSwOjPFssFHEJ+4UCq8yKLKI8w5j3/Ipd8klFWA==
X-Gm-Gg: AYBFou0fDQdGIqVd0TcZ1oKGI/aqUBfdU09AgU0stnTMIzH1nrqgmHNDddaE2FFXr1B
	mh/MgL1Z/MqB2mMGO/gpohUO733mIX9GUUbSBT+F4hmHXvnH4LVwkzCzKkBNGE99YNJeylMJ4sc
	cV5XSEsTqfxC5LSBVBASOfH35FpHhJNTTw9QoC9RzVI6t1kFRmJh0o/TAOYdqL5Vr2iPdu9KY+I
	4jrvtmka/QSm8AeDrScPQU7Hhp8v6BF5ckE24eBsNNkEMDVdo+/ugy0mTO/F4+IxHkNJ6U6tg70
	bscz8O6Oi+zTgH+0EGRt/D5rj6E8H0b8ya/xJQXOeT2hdGix/CzbeGTNFBCFXKyc1rLaJC4o84r
	pEI28Ecg/gV56+/GosPrWIHOFiOeHyhY/PpJwCQaZwetmxq+R0daq2RSuGTdpZ0oRaHwvHLl5Rn
	ri0iXwlKXbSxeo9xKHyxMEuSY72msLUEoNRBxGiGL/Y5Fp92X7cBjrYy4EHX2UbM2Hjr84MM1jI
	moYEkzLDzzLykyfkZnzZYm/8534hsqPU++F4XE=
X-Received: by 2002:a17:90b:4b85:b0:3a0:f4ee:d2a6 with SMTP id 98e67ed59e1d1-3ab3ac54b32mr8577579a91.19.1791839516654;
        Mon, 12 Oct 2026 14:11:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][blacksail][PATCH 39/43] python3-django: upgrade 5.2.17 -> 5.2.18
Date: Tue, 13 Oct 2026 10:10:03 +1300
Message-ID: <20261012211009.3352822-39-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130809

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/5.2.18/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0640fa901df7783fc9f544a6bbfde5b771e22b96)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.17.bb => python3-django_5.2.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb => python3-django_5.2.18.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.17.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.18.bb
index a9009adaf90..eb84122116d 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "9d4d93be539a18ab80d058eb515900e10951e04c537c5a6b394fc49528d3251f"
+SRC_URI[sha256sum] = "461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d"

