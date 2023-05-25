Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BD6C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 05:47:16 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.5510.1684993635212582139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 22:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Lkwfu6yY;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-534696e4e0aso834818a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 22:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684993634; x=1687585634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/LgeoOG0CYejlsvOL1QjniGr+fUZi/pS2x6SaCU9fQ=;
        b=Lkwfu6yY1oSo23lqdiCHfCdWHAFDFknz5dLtwMJQpb1MSOPfWrHdf7YG6dnEvyLGYP
         7TsF1fRipSqqr2D32gZSBLTV1qEWWhvaYEtKYnjoK7ZKd1aVcUpKztWvWpcZveKAckeh
         XaiPzMRIzRMED421eq5jy6XgPVLzxC6gduQ4jJVWxR1cDzfhbD6H/ew8XQa3Y4b3qU1c
         f9CbWDeeKv/t8QhIZVjwD3UU8E77AOxkWtxIHRM9CfFWyZRUryh6mjeLlwacWEyjO1mC
         rHone/U91H6aaxPcE/cd5hPw1XGw0UMVLpmiUGjuYKCpl2xZQxZzMEnTqNC2F1o0nXnv
         uFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684993634; x=1687585634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/LgeoOG0CYejlsvOL1QjniGr+fUZi/pS2x6SaCU9fQ=;
        b=K7Ao9XY43POfOXXjnpcrOGBteD94EW31DvTrU75rzpetcimlOU3EjbOR1KvEse7PH8
         6rEmiMds+IbTtLoVLUXPEEzzP/ZxS1O4wRBN8UwEJ56gsFgYCF52kBSOB0X9NebSFRfB
         x4ItQkY8ksoYnHPcn59qOa4QExQMGrVCO+WBrcqgYh+qiam6H34Nj7tLzRXlIgFOomHS
         sUucgvQvYMO8KHhJaCFjGp9OQ+5nUt6b2/JoX3VFL935lQkyQAHZZfTC/BCi+EwVWaui
         FoXenXiEm2hg/BxkdD8Wyr6nOIdmzcetgOaxTbxRNfjoxoaYuTMTTanJA1+Tga0ss+e1
         rMxg==
X-Gm-Message-State: AC+VfDwXTjKskWsGSWiiI/WFZnf2N6gSP0Xq5p+CrC9vgxkjj00D/ixg
	pA309Rm/sfgpUmfOqTxRhYYuzpUMcCE=
X-Google-Smtp-Source: ACHHUZ5/JprhSkCF7f1rt0foB/mCRS+GKD9pU4pgVCI3YAX0xLpeLRUKY7H9XR+jeeSp7BT4PBCxRg==
X-Received: by 2002:a17:903:32c7:b0:1ac:820e:c348 with SMTP id i7-20020a17090332c700b001ac820ec348mr635395plr.0.1684993634033;
        Wed, 24 May 2023 22:47:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090276c700b001a6d4ea7301sm441286plt.251.2023.05.24.22.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 22:47:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] remmina: Fix buildpaths QA warnings
Date: Wed, 24 May 2023 22:47:08 -0700
Message-Id: <20230525054712.1593592-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 05:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102799

buildflags.h is generated file which contains buildtime CFLAGS and it
gets included into sources via src/remmina_exec.c

Fixes
WARNING: remmina-1.4.30-r0 do_package_qa: QA Issue: File /usr/bin/remmina in package remmina contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.4.30.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.30.bb b/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
index c22eaf1d38..0437fba515 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
@@ -38,6 +38,10 @@ PACKAGECONFIG[spice] = "-DWITH_SPICE=ON, -DWITH_SPICE=OFF, spice spice-protocol"
 # Switch on gtk support in avahi recipe if you want to enable avahi support
 PACKAGECONFIG[avahi] = "-DWITH_AVAHI=ON, -DWITH_AVAHI=OFF, avahi"
 
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}|<WORKDIR>|g' ${B}/generated/buildflags.h
+}
+
 RDEPENDS:${PN} = "bash"
 
 FILES:${PN}+= " \
-- 
2.40.1


