Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A12CA1007
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 22:43:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.64710.1756766573820958024
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 15:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BQrSY8vg;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77251d7cca6so1356354b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766573; x=1757371373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOWgFb/WWm5aqPKPqeahtibCrykRRLWNiN5hf/hcEh8=;
        b=BQrSY8vg/ae6nUG/Eim1FL1K7pAxpG/mJnEB/CeI2EAW6r4SHdcQNcvR7nywVXqoBL
         rJPo5G8JjIbYhmj7s69UgBAWweIV8IGtAZe7p2uyBXfkZ43GUZWHED0xX0OlW21fYXaZ
         L8+0jdo+g0W4IPPBUV5bkxa0G3JZRAptVDA2xqgZsvHb5EnvyXEOd+X047+LS3BClqli
         EC4azZT/hgBcrB1pc11BzpDCGm7w72zzGN+oPi9SvN9Vimk6Axctm/sdu29kL78EGCsC
         ay6m2MSzynhzJJuQlOz9lv+X6l5FggyNOgJl6oOE5t6sjyM+W0vMZUuNhJP7pUwtBpsA
         QFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766573; x=1757371373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOWgFb/WWm5aqPKPqeahtibCrykRRLWNiN5hf/hcEh8=;
        b=SgY7kmtsQzteK982HfUmbH20tUU1RYTpYleRArM4vIxmfOEFo6D/rVJJXDKrc/+xsF
         x8rJSJalpCCwL/SXJxSeVRiiBto9VSfE8/AFGXfcVhKbBEcpKMKwHbRCrdKrDFKV5KF/
         vfSV8VJeOufCCgjeZolhOiKPXipB5ZH/KO/Otmio1Qlo+cpBLmGOf7uSl3UA7lubGt4j
         JkoV8UxdpGe2rwV19K1Fzj7lNmAsqy0RHWaqyIwkFXGrnM128eUREVBOGG8gp9UKHh5p
         KGzPKvYf/eC0Ru68csNO7ZRpSIEwF0PeGaKywJGpzibhIDykk3SJYjtUMSc2Cn/PqBrs
         JO8g==
X-Gm-Message-State: AOJu0Yx53a9vl2vetdl9rZNzSROq9bS4sF+mluljNA5X5FtHG+HRgfVO
	WDjvz8pE/5vKhqg94QVBgQFdeIW02vZaSMIUaT2UYB2LBje5VwErpvGS3GXqS5cj
X-Gm-Gg: ASbGncs3uEA86VlVfQW6uYxmzK8/WyWfrWi1sTELnWqNM4a7NY/rJ5c+F5hWmSELoC6
	yvpqUcSqrGYShNiLAYP9HMZdbW9LUWVcDMRdABGhL//Dnf8vy/WOk0wU/wP7jHwEne36F6pv2iv
	T8kdlXifelv3FS/GvoLBBTpMbvCrS5Gt9rwuhEaDGsv16SiCJ4nWZsfWflD8mn6afvVg+ZseL50
	u9wuqtcGsbs9/ZTe9R/K98V1KBeZkTcHsN/JS2FCJszL3f1hJ2uvl6kYOXX4m0/8G14E+8J44AH
	oVEIbNmM/mnl0i7QBZMgpPjEEBDP0MTHqy7yb/f998ZgFUDJWJVVbjKgXeLePWJwxcOOhroHr3O
	dWya6cyVWXq/hnM12jhPZJpyqn8prdc9Hcm3ydHDKZKCkVbkbTtjWDNpc/hv7t65CQxU7ygYHHk
	bhCS55YQF0NO3WREGKXeLhOAsPu9fPqodWxR9hbL1N
X-Google-Smtp-Source: AGHT+IGy3Z5+s/WIpmYqPKdgg0RpVE3GSrPbGjvfhSK28EsaFtatM3UT0TZ0LtcX3GydVfa6h6JH4Q==
X-Received: by 2002:a05:6a00:4f85:b0:772:5e09:6933 with SMTP id d2e1a72fcca58-7725e097053mr4993584b3a.9.1756766572909;
        Mon, 01 Sep 2025 15:42:52 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb72sm11648240b3a.61.2025.09.01.15.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:42:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 5/5] klibc: Do not let clang generate wcslen builtin
Date: Mon,  1 Sep 2025 15:42:43 -0700
Message-ID: <20250901224244.1913647-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224244.1913647-1-raj.khem@gmail.com>
References: <20250901224244.1913647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 22:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119166

clang-21 decides to emit wcslen call on arm architecture
klibc does not provide widechar support so it should not
be used.

Fixes
| arm-yoe-linux-gnueabi-ld.bfd: usr/kinit/do_mounts_md.o: in function `md_run':
| /usr/src/debug/klibc/2.0.14/usr/kinit/do_mounts_md.c:294:(.text+0x5d6): undefined reference to `wcslen'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 26d4ebc72c..4e8710f7bb 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -35,7 +35,7 @@ S = "${UNPACKDIR}/klibc-${PV}"
 
 OPTFLAGS = "${TUNE_CCARGS} -Os -fcommon"
 OPTFLAGS:append = " ${DEBUG_PREFIX_MAP}"
-OPTFLAGS:append:toolchain-clang = " -fno-builtin-bcmp"
+OPTFLAGS:append:toolchain-clang = " -fno-builtin-bcmp -fno-builtin-wcslen"
 OPTFLAGS:append:toolchain-clang:mipsarch = " -no-integrated-as"
 
 PARALLEL_MAKE = ""

