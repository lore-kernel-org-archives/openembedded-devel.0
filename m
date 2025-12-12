Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD1FD4920F
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:14 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11137.1765540687080228761
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKdL4zfK;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso684038b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540686; x=1766145486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nZ/SrN/CeQcoVQXKyByUG0yp7ps2KITZQGEl3QzYdk=;
        b=IKdL4zfKCe39QxRuI71xk6dGcn1FZVhVx7XX7ErAOCpZ/8p0Grg3jNXL9rN6fiIt+t
         tDPIj/mI9ah92b8m4cupHeVhuCVwO4s3LMBsjMfGelGgI+4CCWzUlmjxpuUMS8XXr7YS
         J5YMobzL0OIIXV44qfDd/FsFz5u1sxNmfGSG72scFmM/nlauXySSCKqp64Sg2ZTaKtJq
         EKkAvmQEe8PmZ+lndxo/NOy9Yx7kHB8Fwmydfbijk1D+wWkvDFpmFrYwFv4JXCkzqMNY
         d7+wx3cpT0ZPn8h1Ga6E1vXvg+m2b7rGxDUi2N6ocq6PboWDYmC9xCfxY0OKINjLexbi
         95GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540686; x=1766145486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nZ/SrN/CeQcoVQXKyByUG0yp7ps2KITZQGEl3QzYdk=;
        b=Ukeb0oU6KYtpkLMvksaty5h4IxdNBlx7w5GQ8bAl+VVYWjzOAQxvYgdsItvaLUHAvX
         sP/hIvjpcSBKd7D/RTGNLMEk+EdLr8IJHESLKCWjl+VIQBgH3Prwr6NUPOZf0tQX2qIP
         kdc/LVFx3TMkKcZU82yezaoR0HA0Il+OMQ/yKeCuBuh77tPIpSCAwAcibxQ/gDdslFAe
         0MbIA0MptudmNSz5y1J0AKQ9sLtsjglaHsXavcWdUbBCEe1S/BrdEAuOORSlvmCg+Z9+
         ISBS+0zzhQOLfwTGBYFe7n4DMO40CjO3kIwnY4GdqfqWF1nNwPcOMfVFmhCienPonwx6
         UsyQ==
X-Gm-Message-State: AOJu0Yz6vqMWhT7E4N0kcsCybJ9FFplrOxJhkkjNqd1ax1u4fgxeh/TY
	htzJmxouwVGP5i5ZUQJRH7Cq2cAO5BLjmNWNpf9Gr/B0OGCEtnmS0cag44wT5Q==
X-Gm-Gg: AY/fxX6pyBpr+iOI3EDEqWh77PlFU4NeXQqQjXE+BhEWjUdaaeQuBAUNhSqN5IHjAF2
	fhzK0JLyuOhXj8ysvhOjYDRh9RZgnOfEdHitVhBW7juhVmGjcr38AQ8ffTs5UPBp0V4JVH3t6SD
	QJGUq3HVdoucdUpEPUxB3+GO2z7RkZ/wbOKy883YXuEMLz0YirQNRVV7Dqxkf29x+oW7/uPOH/X
	Dzv5fp2Yr1Oo3JY3AyfuYR7Qk5GvPuMwwj6VfHYYOkd90BwsHfnurARhhZNg7DJ7nlGFF8tjo93
	hHFt4gQtZd/vs4zoT7Rf4xz5AuaaPzknNJPFGENWALqTxGoErkWENLRy4ggO6zUxmhlI3NKY2l3
	N5DJpXZY7H1OyN1pUfoGYzRfNX6z/DZMR6nIWz2N+5icutOeb5zjsb1ytnVg0XpeeOmAloLf3r3
	MatF6q8a8ELMKNsoxgl5rtCZU=
X-Google-Smtp-Source: AGHT+IHHF5CpJVtIoXW/Jq2q7eUChBBZmIl2mFXQbVdBe1E92HZD2NjxzOtRn5RlLnpWPnbZ5XxTFw==
X-Received: by 2002:aa7:9e45:0:b0:7a2:6adc:cbe8 with SMTP id d2e1a72fcca58-7f51db03cfbmr3236611b3a.16.1765540686219;
        Fri, 12 Dec 2025 03:58:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 08/15] python3-gmpy2: upgrade 2.2.1 -> 2.2.2
Date: Fri, 12 Dec 2025 17:27:37 +0530
Message-ID: <20251212115744.569676-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122608

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e274146fa454127ca6483a02f6a4c30ac733fa3c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-gmpy2_2.2.1.bb => python3-gmpy2_2.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.2.1.bb => python3-gmpy2_2.2.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
index 15599bfad7..2196616a0e 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS += "gmp mpfr libmpc"
 
-SRC_URI[sha256sum] = "e83e07567441b78cb87544910cb3cc4fe94e7da987e93ef7622e76fb96650432"
+SRC_URI[sha256sum] = "d9b8c81e0f5e1a3cabf1ea8d154b29b5ef6e33b8f4e4c37b3da957b2dd6a3fa8"
 
 inherit pypi python_setuptools_build_meta python3native
 

