Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D6CCF2579
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:52 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7548.1763525567788210624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cxZpMFfU;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-295548467c7so72853485ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525567; x=1764130367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YjcBVaE6gCw7fiBuSemmoo2qcPfcZdyXL8lmOvX9/Y=;
        b=cxZpMFfUg8VvYrZ3tT93TLtPyPap0TnoScNzHRyHtFwf51WQTZxhbPjJV+Vj3eNWDu
         kJv3SYZqyveAqceAQWxNF5IRMueZzNyasIqOMoR55tWM5wBVN7G+5db+syQyL8XeHayq
         oR9r1KMoCYo9kIyOqpgpWzCtuRn8w/igJxdb2CHmxwgDZoagtvZb1JClTFIEriPC1v8l
         5/wLr9vGP7FT9babIQYYKTidVN5/oAARHS2vt1Wc538YTAUt2+nBPUMY7EsuldfdXYns
         vwsxKjvf+QfJu0glGkD15EfY/fsy6D4eFCgE1G+uSlCf+jR7HSiNGMaiyOpDxJL3qO1z
         RpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525567; x=1764130367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YjcBVaE6gCw7fiBuSemmoo2qcPfcZdyXL8lmOvX9/Y=;
        b=HpXFgbpKXiahd7EAWhLgVS9UwxS0pH6z453rS0rtecT/RigI4p3yo9o51LkOUAJvSc
         diXj8cSl7mJPLY4Nzrue3Acc398HfU74MYOkihPzPuMCYrT5abYjPOoEpacftr4A5Dls
         OqCN4i2bDworTJlAUG+OPsGle7BbwB49ad5GCEwjLtmsgTBvbLF81gfaLnu9KwmzLmD4
         HhzMkXkd2ViVVpHLsaLNBjfMHgfthbsci6neV1p8eiysELLh/kSR+KGVz/Vxi9KCc9Fa
         M6/HAS0bO4XbXtGemVubV4kzzCweHM1Q29kIL3d74nMKzPko4kxz95s1Fxg7KAYtCAJ2
         h/FA==
X-Gm-Message-State: AOJu0YyrjZY2oU/HvrjVkd3A7ZC1H02kkC4He2QFtKlWj+Zgo1zDiD5Q
	Ou/d1Jdt25oJfMmbPP/20oVxyoctQ5jjk6NLqU2g2beqvn6CAqwHwPoFxyOVbdpbqpY=
X-Gm-Gg: ASbGnctHeM/ESZRtf6daQb2xHM/wyqtAbGBClxrN/MC/eLb45bJPmOFbCDsaW2dbsFz
	NdSnvdH3iPrKF2u1YeFhQAdQkue6Ylm14F9mq/yogdIyLeIqnIBt9uz28EfD3Oj3Q6mgZm2Vnn5
	sfp7rlmauFCSYejn9gMu7KXZHceMcCwM/pzUVURxqAq1rxBf10klQdDJNthOD+F2C6mYuAeH1eM
	LM4BdxALoHbm6Djq3Od9ebNZBV+eZYDvPylUgbR7lDJAjtbk3M2uur4OROccTbHezshG3UKDRNt
	j4yFS5u5hIadbQxHez73RbNvyyGzZdG33acCI49DU4ZzQw4XLTlDrpukeIApyCz4xAvE1eZd1nY
	uaETkZqpHosQJF0PZHKSkiIqPFLWq9FCC0F8RU4eXnhcVbwhAym3/vGe/5ZhWR/ejjwTy4J3KQb
	3F5NtxFvZqCCeTu4LiGTIfEWZat6rcBgpV27draU8zOCV1sjrIe64G9hHf0ae51DY7jcnWle9HO
	AVNQoy1OWLzMKaIyiY+u+uulmYgbvGSuQi6so5ifNM=
X-Google-Smtp-Source: AGHT+IFAOR019bqMEFtaGhQ4bXCEyY+bAgMJ6N4VvJftwUz2lj2CdEfgwLiQjkHJ4n9g81Ozuhd48w==
X-Received: by 2002:a05:7022:ea47:10b0:119:e569:fbb4 with SMTP id a92af1059eb24-11c8d9c638amr356280c88.35.1763525566837;
        Tue, 18 Nov 2025 20:12:46 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 9/9] Revert "python3-argcomplete: Upgrade 3.6.2 -> 3.6.3"
Date: Tue, 18 Nov 2025 20:12:35 -0800
Message-ID: <20251119041235.2448193-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121883

This reverts commit 809cb8f42473ea0ead9074f7d699619f66f13c05.

It causes ptest regression in traitlets as seen here [1]

We will have to fix this regression before we upgrade argcomplete module

[1] https://github.com/ipython/traitlets/issues/925

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...hon3-argcomplete_3.6.3.bb => python3-argcomplete_3.6.2.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.6.3.bb => python3-argcomplete_3.6.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
index f73ecf4523..abad776d8c 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"

-SRC_URI[sha256sum] = "62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c"
+SRC_URI[sha256sum] = "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
+
+PYPI_PACKAGE = "argcomplete"

 inherit pypi python_hatchling


