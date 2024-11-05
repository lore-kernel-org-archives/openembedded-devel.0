Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D0FD2B95E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.19611.1730817415401148918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KXn9Intl;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso5312612276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817414; x=1731422214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuCuhRf6LeGnYaU8IzwnAsTZhV2Trld+4N8VdC0xf98=;
        b=KXn9Intlttp0LXp9SFWihsAzX+jE4YZUvNaNVV5/jEEVAUvQSgl7+Keknj6MKdFMLf
         IxDIScjnlw3XilY6MJ9suQDmNE+/l9ckbeQT5rE3xlRxwP7e9K+kWtTv8wHf5csmDK0l
         ENAmfU/kd9f2ac/QPvX1UmRH16qUiAtua07iz6xc00RKyrPSiO2Dz8BhFeqpv2d17EoB
         5WJfbTxbDEv5nS05/lrWIag6GkOcGGdoXXr7ADPm0JmVr9qW5EtPS3Fr9m73PpxWOnQM
         WBJudPXuYMETMBFgs3vDidLMOb4T+QwXlguQRBVPbnQsZLFwF6YkUU1YSZIXWURlH+TY
         ywDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817414; x=1731422214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuCuhRf6LeGnYaU8IzwnAsTZhV2Trld+4N8VdC0xf98=;
        b=RiR6HRj3G4IQ3IjIm2GLx1lHiedRqO+bHNZrq2w8iNhvk8JmDo8atMP+TtxId5e3hb
         HtYpyQdnwvLP13IBE2mJMJPAoWtzpuj+s1iJwsbJWvw6IgmFbZe1Gb3RasV9PDrJi9sN
         g06ocCMywQV2FKRxKlnFqQdR4tTt+KOtPCOvnMRuklb0ZIY0twOWgoZekK3iHKGrNWrN
         IgbEHBlP1EraFtoz2JZ3Q8x/7kaXzCzROsC11RkSYgemw63IrKGsIP0RV+tnlIMuhIiY
         O004f7zaykq3SfOyxpV7Gp62n1NHWCUcILPHGvfPuKlN6a7Z/SfKnHU6GfnF5/c/dNCE
         PpYg==
X-Gm-Message-State: AOJu0YzOgfbeAsPQXH0iha7XGXmnFY/rvf0HO/JKfjvJZTPCmevbujrG
	OH29s8Pg4Gzb4BE/mr0/hYJ2dOtWMYKd0xPKWNiNKWvMiSdtLpMThstlhg==
X-Google-Smtp-Source: AGHT+IHnggT3kN7psm6ES+XM6m2Oi08oi0uRG8xu61vJxXY2yeNVvenLiwTb2IE2Vd3V7TPYCs9V1g==
X-Received: by 2002:a05:690c:e1e:b0:6dd:bcce:7cd7 with SMTP id 00721157ae682-6ea52551ef0mr197778387b3.42.1730817414396;
        Tue, 05 Nov 2024 06:36:54 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 34/90] lksctp-tools: upgrade 1.0.19 -> 1.0.20
Date: Tue,  5 Nov 2024 09:34:59 -0500
Message-ID: <20241105143638.2301245-35-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113452

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/sctp/lksctp-tools/blob/v1.0.20/ChangeLog

Drop redundant variables LK_REL, SOLIBVERSION and SOLIBMAJORVERSION in
recipe.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...sctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} (79%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
similarity index 79%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
index 0243f2a1db..a5f9c5543f 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "05b50d379ff0037de4957bb2a1befcce88b70225"
-
-PV .= "+git"
-LK_REL = "1.0.19"
+SRCREV = "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git;branch=master;protocol=https \
@@ -34,19 +31,14 @@ do_install_ptest () {
     done
 }
 
-SOLIBVERSION="${LK_REL}"
-SOLIBMAJORVERSION="1"
-
 PACKAGES =+ "${PN}-withsctp ${PN}-utils"
 
 FILES:${PN} = " \
-    ${libdir}/libsctp.so.${SOLIBVERSION} \
-    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/libsctp.so.* \
 "
 
 FILES:${PN}-withsctp = " \
-    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
-    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/lksctp-tools/libwithsctp.so.* \
 "
 
 FILES:${PN}-dev += " \
-- 
2.43.0


