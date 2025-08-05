Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3E4C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:17:46 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.7893.1754421462321816778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQFPcg1s;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bd9d723bfso3849732b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421461; x=1755026261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAwzONGiJU2aJM37k+zqhLEpm+q0DRUYygkQ6753Raw=;
        b=IQFPcg1s7ZPSEb19cCyCi25wAiPjuBeBBJXCKpgcbQT34+1OPRo2zYUpvTckBQEOsh
         1oYXVKjTQIqWl30pVrYbEX27UohA0M3pYBorpUwbPUOPiH5EAXJkpjoLqJ4yAQYhcm5d
         JOzuC3HvW3pwFsVadUg5gYisdEF8zyiRCd7npR0WSHyoIhIoi44X1F0T8yGVpuaQR7iA
         xaJtTh7tiWzM9/145K1ldu2TFoO95x2gI63NTmx9H74xopP75V0ODitH7Ywv2bhTxRB7
         cDIxdfR2FMA9DfCqG5LLBtR3a1Wd1ISmL9zlx7NOZajn0Hj87eA0eWxAm6+tAQjjtI2C
         +o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421461; x=1755026261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAwzONGiJU2aJM37k+zqhLEpm+q0DRUYygkQ6753Raw=;
        b=PZNlnDdPB6sCPl5qoECF4g7ZlWicBCEQmOAFOhjLyQy7gyrLJNSS+D8XdMD+48AoqO
         o895InllYHUG+ZPupskeqJQeV9pTDem+uAzkgYU2PxoLXdhXgixidZGP3BuH3y2nfw7Y
         q7dSTyQ1hSKfnHRkAJdDQQySbnRdOtbved13p+k/llb8Bvjh+jEWrTq6DNYN6IwiVZpi
         Dcr0ecxbPJWlwpfV8q8NjE2olgONTCQQLMQQNUgZ4nhegnr2au5Pp78sNgk5nqlWiYhu
         DmnaoLKZ/myuzf0NguRgwUnz9GMYlzRjyZhVnNtoXhdkpnlUBSZLSgVGhB8lToWCelFi
         FFBw==
X-Gm-Message-State: AOJu0YwSK7wkMl3hqSXzaGFQA6/6m3moDCIA968VsdH2EBZSzjqKKXig
	Ky50c9lx7qreIaUQY4RriF+iJKLrfSyqO0cqBA16hZzBcaUqDTHcW683VcBojFtPIX4=
X-Gm-Gg: ASbGncs8JXeskHjn+6JkEHFP1SJNgb2Pcmq/EaMQQrcGjPenDFIo6KPutNYR9477xbh
	M4T2xQGl3g+x/StimuC2xp5Tq0/DUPLK2dbDUI7bWOuKopLRD+8lPqe2CRjVMPvEoJRMluo/I4d
	kfgLIbU+qz/b3dZt4Ws1MfuZinj27T08x3dLkFqxNm/5IWrq8uDTxGwdnY2kR+yl48ic5SymIy6
	rkFDrF292ptOVX+uNslBP3/5w4+0UQwdg7lg/Un5oM9KE0rXOj841jemTP6cafDj9ZoJaFxs27m
	Nd6wxoqdKNQvxuL1AF07nVWblZcmOPuEdxuGVXWPUo2qJxqlQuMzSvOOOs9rOY6pUvX4fbJdMat
	HWZEKqoX/w9aY5FR426ucSg==
X-Google-Smtp-Source: AGHT+IFH+iPhC18SPOPGyIbHOpiT7UZ3u24+kmDA1MMS56MXTAyOHsVUirVxnZhk2BWYwONZu37Hqg==
X-Received: by 2002:a05:6a20:559a:b0:23d:9fd5:9231 with SMTP id adf61e73a8af0-240315b3ba3mr210094637.46.1754421460782;
        Tue, 05 Aug 2025 12:17:40 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd02csm13383412b3a.62.2025.08.05.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:17:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] spdm-utils: Add missing clang-native dependency
Date: Tue,  5 Aug 2025 12:17:38 -0700
Message-ID: <20250805191738.2250699-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 19:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118883

It was getting by because it was in a dynamic layer
anchored with meta-clang being in bblayers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
index 82f4b7f0fb..5c5022d9c0 100644
--- a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
+++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
@@ -17,7 +17,7 @@ include spdm-utils-crates.inc
 
 SRCREV = "f67ac9e00b79f603ecbbd29928a4ecc3dec5abd5"
 
-DEPENDS += "libspdm udev bindgen-cli-native pciutils"
+DEPENDS += "libspdm udev clang-native bindgen-cli-native pciutils"
 
 COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:mipsarcho32 = "null"

