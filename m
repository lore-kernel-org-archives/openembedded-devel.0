Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DE8CD4F4D
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17894.1763014845349887020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2sjmBOu;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aace33b75bso413070b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014844; x=1763619644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsXqmzzaaTa7AOMyP5+ylVGdK4mYdU8NXGwJG7sFb7E=;
        b=I2sjmBOuynfHxHlO9Xr2ch9QYHhdz7Mi5qaV1Lz7Hb8uR46qfGkVI/vpLhtr91zA1r
         Cql7/rUCHNa+tig9QRwV7m02f9mex5BwApDHJxF/ZFYboZtr6YjN3tBIX/vLIEO+xFIF
         Y/2iPQ8qjsOn5+gJbGCEbQ7kEeg4z+cjMJTP4w2b4Ism2cYWJdG2+hXgPweHhDguD2W/
         kkl729202XumoMAEGuiITKL2+Nkt+ksDJ2DBfywvAPTX0TSuFkqWswOaMiy632DzSkLr
         Iw3b7V5ET6eYkVf8sl+iPp4nT+vjL4ammrlkiw/YQO6YrLIEC5oJzb57nEx8cxfraMuC
         W9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014845; x=1763619645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bsXqmzzaaTa7AOMyP5+ylVGdK4mYdU8NXGwJG7sFb7E=;
        b=knANH5yvz62GtxuOOuf4v2oYJx39219n73j7kcvbRKm7Jtsv7MKIqrcZy2iBE3kp5C
         DiBZTkBrHW9CzOOqc+J7NwIlRPBhyNVpjBcabORXv3o6QaSvT32YAxIuAudwooCuHnWN
         Hb0jRoKKrGmk1plkfBrCXe/pCJ+E93r9JqJDKfbNEoNiy0QtZv2w3iptU9+EOjf/JMQB
         qdKRzdHF6bNvz/ZOU/KpDeIe4j7C+3cI4BX5DP4NP59KgKsEu4cWY/65XbBZyoDIcKAm
         /vyP5EXFszGCuKnlRaXJP6DTw8ggza2+3Vca/nnzDVeSw4lVhiPvpHk5w87YxpOzAKzy
         w5Pg==
X-Gm-Message-State: AOJu0YyP5Lg0JPdTZ0aL7T6oyZuangFGPfyP4flvLB/nGzBmtY3TTItB
	5KUhAM7r2Yufh8hAPQtQrF16OqQzsaMhJeeX/X4qJFKC1sIOl3hv3y15gt98zg==
X-Gm-Gg: ASbGncujHiSSWBPOgedoOsmWHhHCo+/8W+rMkf0TvLQC8/Uoo8ZEK6JAE/Lbz9QhqH0
	iOdiqhYk1HMQFKGPaMLFt+VzGXWCmN0ZV11KUEoaKonoQp1/CFatRXQJaUzxLkKT879sr/FZc6X
	jdYbj1gyvIyZ/+mws/vhEMfhvof3+GkRRsHlm7dgPPnt//mj8NFfCjemSgdQbQL+MDaYzXnQJqa
	xgS7Akb/xswezh9hlUKKKPQbOvM8SjOCKFMWzeT2h9iyxDXILRSA+PIcky0p30EuhhAWFQ0uGDz
	7IeCzx6Yaj3c3uISqrBQXgGj1U6fgi5YrnT5bsqpe1ncRllzWmkxfYYT5MEVKe2Ad0I2Bce93oj
	v8rBkDohfRX/rZECtmjX9uQHFh5Orjjnf8Gb2jJe+Mhiz3o7byw3XueNwUUL8sJ8DMXxSizWXUO
	l9TwivLD6UJ1fJMg==
X-Google-Smtp-Source: AGHT+IGKXt8M4VrIT/TUab8O2/fTzrf7NZj8+2JiEuwckTTnnmQzt1FpWdTSf0NNgaT0qSuv2konhw==
X-Received: by 2002:a05:6a00:1792:b0:7aa:bc48:abbb with SMTP id d2e1a72fcca58-7b7a27aaa8emr5649461b3a.3.1763014844595;
        Wed, 12 Nov 2025 22:20:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 25/38] libbpf: upgrade 1.4.5 -> 1.4.6
Date: Thu, 13 Nov 2025 19:19:00 +1300
Message-ID: <20251113061914.3756301-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121623

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- BPF skeleton forward compatibility fix
- BTF endianness inheritance bug fix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5bb9ed684b8d9f17b22b26a94a926b96d666465e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libbpf/{libbpf_1.4.5.bb => libbpf_1.4.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.5.bb => libbpf_1.4.6.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
index 5ee7701484..914ac9f087 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.5"
-SRCREV = "a5086158dc90593b4e4b3ddbafab9bdaf9ec97ef"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.6"
+SRCREV = "fdf402b384cc42ce29bb9e27011633be3cbafe1e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"

