Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490DAC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 06:23:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.16250.1751523827320595129
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 23:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i/+AoB6D;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c7a52e97so7388990b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 23:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751523826; x=1752128626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yy4PYa776c2oKMxjy6UHrwHgCWBXSiyO46f87B6mU4I=;
        b=i/+AoB6DhRImXJBDmMDOdxWSI4+tGGxjtiR8NukNElcbCqAQBxy1q6P7VkycJSjYYv
         btjjBWfR3vqR0+XSiZaenIDSyoNwYBlwSoeo2EYtpwQTyQbRI+FtS4MnzS8w2SrAtJy6
         bvsYv6WOl/nFt/RTLKwDQTCccyCO70D3S0stcD1VSVGqRwCI2rCDPJIKsGiCxKna+vH5
         oohtwGUERIEBce3RUb1sbWiIXBtJ6z4Uh2/BnNrelyr6Hzp6j9iI0kxz3bNAozgjzPX1
         WawzKPdrtMpmYrsaOdb2pDAbh3Kce2HyveSn9SKS7r8kUms7IE4P1+2khsL5T3xkagZd
         wh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751523826; x=1752128626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy4PYa776c2oKMxjy6UHrwHgCWBXSiyO46f87B6mU4I=;
        b=hhnKuiC70z5gyI7qPcUXVXGwzS7zXQFZUoM1IBL7/MB11gsfi7eoXdMk3rUdR+lU3p
         fGKlW3vAFS2R8NUoJ0qSUqKp7oD8Z9iL+s4zoy3G1uPf7UXU16NVkhiNft4N9vgF8mbE
         zt918RBDE4ANuL46YEmbaFrEoXxc1UE5TZuUudhsch7lpIR9aba6exbJ25EK4vLZKY3j
         8F25ZL+uiDOTcUOIcv574peAlIomyWYjXmK4qon091xjf4Nlpk/Du6lMO9zEjfikJrYu
         YFT6RDA8ONqJ8fGQM/RDI9uuaxR8y0DMiav35dWjhTuIDUf1nF3yYGjrXmN+qzVp3qzz
         dILg==
X-Gm-Message-State: AOJu0Yxg0Dw7HtkLdg1Bq6F18qI8Y19SHJyBUrt9UgpfQXT0naz5EFzD
	WixfO65UWxUc/L/encOJVJmKUe3+Cpd8CVDOwDT3k49+EHWHxrDNfjKuH3jIJ0bF
X-Gm-Gg: ASbGncv2PcDNnvhckgz+wFykFOB4XjCIyXPg5KHpyKVeOWW09JqOwqA+xt+u2FGKE/N
	9+PFzr3VHk7unq17ZGbiXPl1YsuVMvqs7Vkk4qbWw6dFCZwNVmE6tfbin1pfhJGTEWYS7KPGF2p
	sGCnLczu5NA30AaZQv51VvbThpi1unA5PIr/NMJhIDq8/cLxQ6k+9mmAT6y04GyWuRD3ylVvyvg
	N/67QxtVW01NEzLdi7gI7XsgXrvsm1mkP9jACqyUIJFkqo2zLnF2vxEVUWcjqcIIgUKAR/axzm9
	7RLu2Im3k+2JwbmbujEFk3JmO7EAQTWA6yR8RQ8OEVqvxkmnxrgx9g==
X-Google-Smtp-Source: AGHT+IErFhvT515rnanmXILGErerYkJ868HHxyTDb+LmlTa4ADD+NEejbDFc7xVFA+V/ydsUbiEKCw==
X-Received: by 2002:a05:6a20:6a1f:b0:1f5:8622:5ecb with SMTP id adf61e73a8af0-2240c6a1a38mr4054010637.34.1751523826277;
        Wed, 02 Jul 2025 23:23:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409ccfsm15242504b3a.4.2025.07.02.23.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 23:23:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] jq: Add tzdata to ptest rdeps
Date: Wed,  2 Jul 2025 23:23:43 -0700
Message-ID: <20250703062343.2830524-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 06:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118208

This is needed for some ptests to pass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq_1.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
index af35324b5f..4aaf27da9a 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
@@ -43,4 +43,6 @@ do_install_ptest() {
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
 
+RDEPENDS:${PN}-ptest += "tzdata"
+
 BBCLASSEXTEND = "native"

