Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9463CC83F04
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 02:39:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.4225.1751596739887709858
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 19:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fULGIDId;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-749068b9b63so384640b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751596739; x=1752201539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRPTwSbsZnJRJrWCtDtfAg3hhtF3oLLdcSEybjUVSh4=;
        b=fULGIDIdUIKsQEgz/SNl34GbNydkPXFUUH+JwgIpx68vl3oVoEj4i7x/6LveOEOxcH
         5E+wiU+PxjVk41O7LbjEZsUh8H7+BSEWRvI22iB0lvuxxbT0N4XJdKSCrqJDNLcUQYWn
         sQModMez+Y2JJo9Hm851bnYbbF/MDJzx0q3iqqQ6MIMc7FfRem5hferXkl/BKdpzZ3iU
         zm2JFdJ9VP8izUKtEibx3FXXGrCswf3f1PWQ0IlrBJu2F7Fu13bJRU+oW6Kv9fJ0a4p0
         32BJiErcV/dT3pmjRHUQvZVABgDchsAVU+nBINRjZk+vXazTwLxwDOKWHZvxlf05vgrp
         MYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596739; x=1752201539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRPTwSbsZnJRJrWCtDtfAg3hhtF3oLLdcSEybjUVSh4=;
        b=n8WzlJL7fs2kbaDLwTE/r4HVWnHcXuhJuK3u5b7PpROuGd6VUunDVAiaIBJcr6B7ka
         hHQ1v0O2cTUbSf+OV1JivfK5m69qEVmy5bOmOR0O2s9+Ob89LfElchl+d55V7QsbwiPg
         VkRVZ970eVCmwHKRc5xZpq6aMysX8lLntLvyqJr8b/8pZICFv6WdpEMUR8XqT+ftQsy+
         q/al+qHXCrJwrzpiUyZ0+qNCDrRi2ErqrIYchkeItGG0HOZJB47/JQISahRBar+b9Kno
         TEeUZpGzxtEp7cAGp2dsR4RqwSSx+YW5mCyrL/de21HWcTaGGzjw5mL494ao3U+guw2A
         LkSA==
X-Gm-Message-State: AOJu0Yxx4KxkyrjeIyjt5duzIDiycIgKtRR/jm1B8Wfh4mSJSZUmN8/N
	qIIrusMZ9Dg7fOddd8SYJXloYibDxxkTEZDhJJKsVCoCSTcCpjT+vRLVA1GcKELi
X-Gm-Gg: ASbGncu4b+vGv4KTBLWTgevH+0Qq9kL+GVmDLiReD50BCNtn95E6Ehv/Uim6T7sWExy
	Bw+gFDkb+gdJvQ/+YZf/Dd1wLFUzqyOaOAs0f4M5YIVc46ZNna1qstJkuyXoN2wi3JuHPrrQgCW
	yys+XO2dsCzPl56lZh+zj7/neSm0TWAhNTXdcVdoVhcqZQJk4KaLZQStV9NYbdQ2eLnoQzqm7a4
	P30qfe7mxYVWQ0dBtGyKgfUJDyTVrb1vyDCwJyHqf9oIQbfuwzz+pB3ToPxVjX8pmbxXIwQ89uN
	fKgf4JQugdan1oFHkrKWlkYaQr6pavxVaTdgcWtThKSgnLOlYn/DKw==
X-Google-Smtp-Source: AGHT+IEZLC6XFf0F47xHzMXyz20inXZxSbDzh+jxDgbZ6cCYLwFQlbEGcB2sm5x1OBjR3bJvIS8M2Q==
X-Received: by 2002:a05:6a20:1591:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-225be6e76d6mr1509915637.9.1751596738813;
        Thu, 03 Jul 2025 19:38:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62555asm799426a12.51.2025.07.03.19.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 19:38:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/2] imsettings: Disable two warnings with clang
Date: Thu,  3 Jul 2025 19:38:55 -0700
Message-ID: <20250704023856.3131843-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 02:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118229

clang is fussy and this package is old. It should perhaps
be removed but this keeps it going so let it be.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
index 59de3b3a08..6daf1f57b1 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
                 --disable-static \
                "
 
+CFLAGS:append:toolchain-clang = " -Wno-error=unused-function -Wno-error=single-bit-bitfield-constant-conversion"
 PACKAGECONFIG ??= "xfce"
 PACKAGECONFIG[xfce] = ",,xfconf"
 PACKAGECONFIG[xim] = ",,libgxim"

