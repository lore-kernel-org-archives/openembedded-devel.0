Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1079DCD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18380.1777549657132973577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sjEbw0JP;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so834579a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549656; x=1778154456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXVMyCEzejOzINv4/X3Sy/7zPCVH/OXZhdNTHsTnIeo=;
        b=sjEbw0JPDQJJ1SYcuecWuzlMgKSm4kFvN7ViOwWmOE84cEDXxaTiFpZzgRlW6VYzdJ
         m/IHivwMI4+jtpcAfZsXNatdL3euRhOnpgunLdyaXBpydj81uTBOB8sSiQZrnQLCF0ny
         98hYUaT7OvevD5Wm6a3L5LZbH2GCX8AbpV03GGx0f6tbR32FJnsWVsliE+/ZLJ2L2W72
         +pfzXU/AGJfJQMSvVNT9B8YHyiZy0NU4djHQBxYbvsvXimI78s7vbKUWreIUpEdOPRau
         0ytK55dQzBL5Ys70GaYzKY93Ea8UL/9Uw8C42mTRJa1/XumzWpd7gpfRMKDLA5wA4//q
         rkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549656; x=1778154456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXVMyCEzejOzINv4/X3Sy/7zPCVH/OXZhdNTHsTnIeo=;
        b=r5ziymhRfcqXAs6dMm8RHrPmcce/NNAZBTEJxJa3LfWqLFz1zDPjk9o7O9SFtIEuFE
         sastRkTpeTNyJBnb1FYhcl9L722EIlYB3Ml4uut2UiGNXmvjXHSmGNGmxxX9UCFnlxVQ
         0XoqB8gDnL1puaXw2C/SzNHLKj6z50SaCJ9x9oAst3ohwfqRvUgxgeuKLR9+avciiIYm
         BjkuAlJYrPaH9q5Lxbn6QRpz5mviFqSxIP8dLHagYvk9s9C4QrWNBoXoqUejaXPToWnJ
         iyvGQ21jQUXLNZZx6SDR4BHmCr1onhC6R1PstbqnMmH7lbPUTYOJuq4edh+yET3ZpKXP
         mASw==
X-Gm-Message-State: AOJu0YzvfdDZmwvy6vjOc9BxehSuf4hPFSlIFK9gz2E8aOl6P87CHiAC
	9C+Ya0V18PiupHcMa1Toy1jvjDgo7SUlVn+CDPlnpdgVLuM/UCUA0eH2LtVgI9NM
X-Gm-Gg: AeBDiet40jQOd6iO+rAjkqj3IzLYnZO49RxnpknylOfkTUT1utLpTA/G4iJ0zjUea2G
	N5qr615sXs3lZxv/bzZQCi2kuKrK+3BdxrciExoNUU4DZsic5uqff4yAnupDqZfkEBDnXlBcKBn
	Am4a4GATCW04dPHT/+YpKTE1RG5NPV1hMacoDpcaoKw8Nffxmq5EHiSPeP0TeeOiAebNrfmcTp1
	aI9SMJiPuUPdL5Xiv5YrRfPp/3wwe8oaB28EP+do06OAanN/rceoRHpjnUH3g9rx3+l72XJXcyl
	pRsF5LVSgChmmRCqzyL6zV0GQBnQ8P/n3lTLO5huGTjb5heq0MngijuwaNCnSe64wG5HHmsy17Q
	eVsn9RtL8VnNwKVPelzEIrgN0W2jjyNBUYjvXFU/GXiVh05qjtdO83oGfgL0GbBUHui/lesfMfH
	DAsa8p4U9lSXAr5LKt4clikvuMuckgl++9yed/MXwsKm2sXmEYn7TsGCi38Q==
X-Received: by 2002:a17:90b:6c5:b0:364:ae19:f2eb with SMTP id 98e67ed59e1d1-364c2d9bc90mr2774438a91.0.1777549656290;
        Thu, 30 Apr 2026 04:47:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 13/24] python3-bitarray: upgrade 3.8.0 -> 3.8.1
Date: Thu, 30 Apr 2026 23:46:36 +1200
Message-ID: <20260430114649.4184890-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126747

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* fixed critial findings in C Extension Analysis Report
* add tests, in particular 'devel/test_capi.py'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 041704b01cc0c039390b42ee72a28bdc13a630b2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-bitarray_3.8.0.bb => python3-bitarray_3.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.8.0.bb => python3-bitarray_3.8.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
index 4cacd79522..6ef0f4202a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "3eae38daffd77c9621ae80c16932eea3fb3a4af141fb7cc724d4ad93eff9210d"
+SRC_URI[sha256sum] = "f90bb3c680804ec9630bcf8c0965e54b4de84d33b17d7da57c87c30f0c64c6f5"
 
 inherit python_setuptools_build_meta pypi
 

