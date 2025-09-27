Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43616CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:26 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.6911.1758954798952165546
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VtBvWznK;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-428551be643so6319965ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954798; x=1759559598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2wOhe+yKQqrpik1aYKnCQiwzy8yTo7TGCmL8NfdOnA=;
        b=VtBvWznKio43ORqPxT+9VmbqNuJ+RCKzLUBS00UgbmE5hWDBNemz4i7vwJ5gWJ1E8W
         biXRj6dBvDMW+E9FrlM+732rCOxCee1+GU0XwceiV8qo+YedG9RlRi0T0vZ8u0JXZ+QA
         aB52+UHNb1t3X+6CfZMZxWD9XCXCF1jXmLaDyz7liVsqDUx+1/fS5t9BhjmpSFgqku7m
         jm7StUsbYmMLgyrl4h6coGvlaekJcxtRWqYtD4txusYIzrBUNPfFD+38+o0Zwuo17MtU
         TApfdiQ6i1c+lDSBGjh0/x/pqc//fJdbCGyuY8nK2m/PwjnF0VK6P940hVwWnddRHRM5
         pJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954798; x=1759559598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2wOhe+yKQqrpik1aYKnCQiwzy8yTo7TGCmL8NfdOnA=;
        b=qMw/PSD6WvZaCciDd2dhPqhcENfW2NX2lsB35ul9JMtyC2APB2ElFhpc2Zrzx8HAck
         CbuPqlLjfwWOxqfGq2XqUFjvB4/ckXv2vS+R0WKO4EnihitoiBjaFM0agcXfQIazuOGb
         ecqEbqJ148Lu6VSLKBJcbaMqKMHPWI9B2jKlSQimCU68SKFnWxGHW067IUy7ZQ/vfXcT
         qdPcK711OTrULQ7/pnFPFZ5fki+9L8EDwWga0q7DakPLLP22SnGqZsyexp8HTFgXq/vX
         1TIpL0gni7rBrqO4slNiRUCqS/K2zAoK6w3iUX+ggLvluaGpvcH5gvy7eyGtJabQJxp0
         2EHg==
X-Gm-Message-State: AOJu0YzSuo8zYPnPTLXOiaqSbOkVAjpHDUuSRwHNhPFvbgXhBVK1n1+W
	adptfVc2vDUyR0II/fF0L07WtWMTI0d358iQm/PRkeDJcMppRPxw/+8amDZmObah
X-Gm-Gg: ASbGncurajBod+1N9TRVtEcpa27Xbwo/Zl9uUYdMEn99/gQkdxa5n4HQ6CI1T11+4Sc
	pAb2aPZY+KfKnPo/o5kD7jH63DEBXd/llaTvZ3IgVsHeO+4d9RoH7T5TUUuyyZwvlx5oQYMGYQ3
	Tb10yiWdEocerXk+nDn7Vu/63IMNQmxfipuo5gRh8emugdq8uUU5pF7oG58g1RggiMhFH1q+iDB
	SYi1zEzt4ftNitcEV8AHlPkcZFD0kKnYjKoXZ2GcbfTT9iU5yz015eOUfjbUsWCcg/aLHjplZ4u
	IraCkKGaZ2v1gXdf/FIDi7Pr1LgNuRK4X2lipyuzd1pH/VPla9sn8lU6JryC3eNuIORgErgqmLd
	88e3DK7L+KKNcVyYMTi33gjmZ37ZpHdSV7ypwQk62tUyQSdHoPxg=
X-Google-Smtp-Source: AGHT+IEEEoW1oyXgHPvkXjRD3JaDSyAjp3zwBuwLOelMlQ+sXDy7RP7gV3b2H5K92jsQhcwn1svOPQ==
X-Received: by 2002:a05:6e02:3e93:b0:424:8d44:a261 with SMTP id e9e14a558f8ab-425955fba29mr162257975ab.11.1758954798034;
        Fri, 26 Sep 2025 23:33:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:17 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 21/21] safec: Pass Qunused-arguments when using clang
Date: Sat, 27 Sep 2025 18:32:16 +1200
Message-ID: <20250927063216.1865627-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119975

From: Khem Raj <raj.khem@gmail.com>

Fixes build issue since clang does not respect some options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c324bee29d7208344df1aa255b19d8b6be407488)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.7.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/safec/safec_3.7.1.bb b/meta-oe/recipes-core/safec/safec_3.7.1.bb
index 9dd6f1c7cc..684046050c 100644
--- a/meta-oe/recipes-core/safec/safec_3.7.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.7.1.bb
@@ -11,6 +11,9 @@ SRCREV = "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
 SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https \
            file://0001-strpbrk_s-Remove-unused-variable-len.patch \
            "
+# arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-mretpoline' [-Werror,-Wunused-command-line-argument]
+# arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-fstack-clash-protection' [-Werror,-Wunused-command-line-argument]
+TUNE_CCARGS:append:toolchain-clang = " -Qunused-arguments"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64|mips).*-linux'
 

