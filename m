Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14645.1793092839121635890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WrAsQhzJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so25887285e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092837; x=1793697637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmdMlFiKqn2Pr0FiegoEGbpMroqIVnGJbEa8Qwf3GlE=;
        b=WrAsQhzJ4WqXI41O/jbTIGXTVWq7iicGVYBRcGpq/d1hyPTa+cBnVcGcJ8vIf8x3Z5
         y8keBBRfqciLW+M15H0qRzR9ca4/XPQDVb0m/2SDaaxRFfu5OhLbsTPeQLlLFl5SMDqh
         f+/9EFN7BVZdE/+36qZ50k+xDrqrB7glY6t6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092837; x=1793697637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wmdMlFiKqn2Pr0FiegoEGbpMroqIVnGJbEa8Qwf3GlE=;
        b=lUXFCuKG1SV9tduV48pFlQM4AYjiflFRg+ER0atqXiT/YwzX9SZD/cbbqOBNaaxPYv
         dmBjL44wH5G0xkggJe6rXXy3/Kw8Q/EAXbr2T28aSECyBoBQjDOgNlWDI9n5g4LjW0Z+
         guUfaNUONciraIo6V2ryG0ZVPFEV07qQ40z0ZVPWockoMIrYWPKkqYi8jaEF3cfgl3cv
         0QnAyJiMrGxfzL9CODODMIZiODcvbG8QP9iBtnIY1bxf4mxjTaMzQfx5QRHT+QXmpizz
         ncq7mukjXIYGLOwXyTNrqkp+sWWBDKgJi7fnqUcZNsaklcq+ZWrKUXldBk4Atn0h7RwW
         9Iyw==
X-Gm-Message-State: AFq9FYJG+NYlSqUL6+DsPxhfp5AuGAwNsYZguIiuuHPPS7oQUDXC3MOe
	2ebyGLeZLmAirdRsqq2W/Lkz/9dJwZZok0AlrZg8ZUjaRIMIHLURQZRoJSn4BgiAfA/lJIpfEEI
	2uMoH
X-Gm-Gg: AYBFou1dgDusAlEfjgKf8Hf8C785J1Cuh42ocMtVE3nm1RC0LMnI4gQrHKlzYIUmcUm
	bPOLuQ6vnBTsmV1/v7+5OcER21hZ6m64FT4d4B0dEPSm6SgVnQr/cUO+1qAbSiE2aYQfkzsDWAm
	M+fGsqdGyBj8Qdh40HznlXB8+W4pzbi69g6VZaONDdRs/+rO1yv05HFQjaU+qkM5kA9QpNHFqL3
	NVwu5OzUiN9oZp+g+95eM+8PIwXWnWq/CtV1P4tOdqyEoUdDZj/odh6TFHDjNpsZmhfQvvu8C2X
	vvnBIj5pdB08vqtFt38P87smblREUD/Y+dYmX2A35whTk9jWiBDAwD84JJ1fkL0nmwDLEXEUO4j
	W2oA5dOsT26P8pXrvmkgQiRyjVa98sTKIQ76kkqgHebCEuubkYe/3qIlMo24f5rGQpQ8lu2l4Ud
	ruYgbZHBZR3jQXQH08syi4UV0z1VSkKWpp4OOXbwhU/wD6GQNZPPR4oNPQgm7v09pIraGYPaNON
	Fj31nwEZ4tA3++IBLj7Hn8fexh9arD0GyrDSmw49g/ZRxwa3HAVRYa11/9GoVLPduYNp5oxurFU
	odHflOR6x6tm6q77jIOopQmiGzA9GpJcVjwMs+o5OnmkKg5KqJ98X2SrxgIeM9u6OkkdV1ly7Sh
	uqaXU3S0q/UuS3yQiTVpY9cEUcI8=
X-Received: by 2002:a05:600c:c0c8:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4a4de702b8bmr116611765e9.22.1793092837414;
        Tue, 27 Oct 2026 02:20:37 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/61] python3-grpcio-channelz: Upgrade 1.84.1 -> 1.85.0
Date: Tue, 27 Oct 2026 11:19:32 +0200
Message-ID: <20261027092028.782979-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131469
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.0:

- [AIO] Fixed data race in PollerCompletionQueue.
- Fix SyncServicerContext abort not raising exception.
- Fixed channelz module leak.
- Fixed CSDS memory leak.
- Unpin Cython dependency for source builds.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cio-channelz_1.84.1.bb => python3-grpcio-channelz_1.85.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.84.1.bb => python3-grpcio-channelz_1.85.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.0.bb
index 22b86b3597..f7b580142d 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "03d2085415bde0e30515e4e429d0d68d25471aa0624628ce335d92f40f8445f9"
+SRC_URI[sha256sum] = "2a16ad645cf4897325c617c6eb2a9f82ffaf28978c3de3b1039ef06e3bef8c42"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

