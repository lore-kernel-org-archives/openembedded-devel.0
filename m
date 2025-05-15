Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B36C3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 11:12:48 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.10069.1747307561025383514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 May 2025 04:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z/ZAmjGj;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7b5f81594fso263099276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 May 2025 04:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747307560; x=1747912360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UePLTMW+5VGNJ6/2GgidArz13C+jx9ZWbuagLcRqn1o=;
        b=Z/ZAmjGjDWy58YrW5zjrDHzYJg/voUBOsAR14Ys9IKBt3gpT9Tm7QQS7fCltYytvmE
         UMj0EdVptb/Q0gar8G4/PDqywEG9hAZd+CoxVY+hhScrHkRiMu44HrW9AkU41bDSXUpB
         sKY1RMoCnSLHRC2nc5+Rkh4Cy+5yDHJdQ97E6I0l3vP6HGH7AEeYyqt/6tQJLEsDJdE0
         muC1hSWwxQwFulhxns0fRJUa3qFsf5G0LwKcix/TXpIRbtUnl0kyNxoj7eicbKYo9KL+
         YZj/0CAqQt7MovXAr9mJN7EZWUtxlXITxp9G3FSATE4lu7u8bIyIsJCpF7pCCwsA8ubp
         mETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747307560; x=1747912360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UePLTMW+5VGNJ6/2GgidArz13C+jx9ZWbuagLcRqn1o=;
        b=BeEQRCmP3sKglhHUtee6Vobk925fs2ak+eurSXZY1nd/HILC7RKjOpe2nAwXNHB2o0
         eN2WBrbOSd2dT5c7bs5jnaaAeUEUJTKtNpPzkTOlLq35WoG1NOeAqjtpBiHCMxV4kyRH
         ud9yU+884Fv4BdVJM/a/t0MkVc22TYwVAuJy9F2r1Ey+xEh9rnMnFQUkov+N27hr6k0O
         H1pd0ymcqb0/huQqE/xZzo7zZYdL8Q0mGVmILRqygxHO0Y2PAJifQg/SBLiUINHfZiBN
         BAC6uvl2F6qn+4pu+wpQSxbZEWcLPdcnUwTw6ZsKzccMD4gEn4RlceQ8c+Yx28EjCETy
         nRJg==
X-Gm-Message-State: AOJu0YzQOBqCwxtarrQ2hbGolC8pDXeB6jPDK7Gsx3WpDhDAs4EVnzcb
	yzQxjmWSM1pqq93S/mrSCxc9TxJgIBHAQOPZZ1sPl1G2keiB03A/hBUkeqW2
X-Gm-Gg: ASbGncvfUxuPZPc0EHopRv8SahJ6zjg94W1Ko3iZ96RVTbAyggP7fmhn74x61aOICZV
	eTc/hhrXOa+MsneAiMBNE+rkTHEKzKz19aAn3+YAdh5Te4I3fydbgzMt2FOvtR6NJCOcM7BFsL8
	npJhJ26Ns9hsrqehyeEPkKfwFFUnwu9B1Vn69wca1Jao4Qs9Poz7wHPEJzRjatjng0RMc1HUiSU
	8suHgBBi0pGf+USTGFJviouMA0x1gH5KlA/R/n8wLb0WVXeMkKMo7vqUanOcIc/cyLct7hGRGjS
	vk1opzBOpaX4VgzkgBE6fps0Ne0A2YYIKHMpyLMbwQTsR2znh8x5TXOQ
X-Google-Smtp-Source: AGHT+IHsuzjMpvgvu1vXCJ8AP+CjJKnw+9IrVnfV3iA187NMo3H7VAqSAQ00pwBz7o6pBLkx0gR04w==
X-Received: by 2002:a05:6902:2e0f:b0:e79:1281:c4e7 with SMTP id 3f1490d57ef6-e7b3d613ac2mr8192821276.48.1747307559432;
        Thu, 15 May 2025 04:12:39 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e78fd4a72f0sm3619816276.20.2025.05.15.04.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:12:38 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.15.0 -> 22.15.1
Date: Thu, 15 May 2025 07:12:19 -0400
Message-ID: <20250515111220.4395-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 May 2025 11:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117422

This is a security update.

    (CVE-2025-23166) fix error handling on async crypto operation
    (CVE-2025-23165) add missing call to uv_fs_req_cleanup

https://nodejs.org/en/blog/vulnerability/may-2025-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.15.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.15.0.bb => nodejs_22.15.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.15.0.bb => nodejs_22.15.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.15.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.15.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.15.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.15.1.bb
index a255749711..9798635ba2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.15.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.15.1.bb
@@ -38,7 +38,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "e7c4226d1d92f33ad854d6da4f7e519e77690b8e73f93496881f8c539174d9df"
+SRC_URI[sha256sum] = "c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.43.0


