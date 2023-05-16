Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676BEC77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 15:28:13 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.24989.1684250884829439358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 08:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=b5ltJ6Oh;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1aaec6f189cso97376865ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684250884; x=1686842884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh2ac5SwITDOTuhitPJXcNN7SyLE5mM1h6u0u0b0xRw=;
        b=b5ltJ6OhdMIE2oo/d+6GL+kXtuj5IIUdkcHqxOv4nO74A/sKpkf3e8opLXb9K51X9V
         SP0XSHS3i+Z6Yb/Xf5Rt699X4/2n/LNov/0Spg/yXuWed5Pm0Ev9sZLqyBLTgZWuygaw
         gNFnQVjRAZCO8A6iVAvVC2mAPvCFqkPunojxEz65a6DDdXecWmJP8f34iDktJZdjwRPA
         HIB5dVeR325Nry5tt2qerbj/N4xoS8cfRyxmmwHcJav7I/8NjdxpJvSK8dRrdZPTAHyL
         pK5ZrsR2SudhKN7f5sk+mia3oGMGC4xJfc3lB7ypDQjA5jgHW2Xenh2kSHRXpyv1E9XM
         ItXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684250884; x=1686842884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh2ac5SwITDOTuhitPJXcNN7SyLE5mM1h6u0u0b0xRw=;
        b=MB3evl6bzUDXVufWhx7Q5INCmZXy8UmH0d1Tv3wPFgSF36teQ5vgocL8cdTbzpwQmg
         OaKM6isYeYCWoteqq7lrcNj/HbQ/cXieuFjUvhDOUv+ntufQXGUmgqOIjdNtGBWXzZEx
         +jLYcBFdPG24JPq0mu2i5er+4akGtih/68mXfaTrXUn6/SiH4n1lDOwjAChRtm8CveWE
         zXPnHWwkL6DOr3+tNP5YQl9uvC2WBu7T2AwuO35IEhpqE6eyf6UFEL3ndYx6UUDgrOgO
         3RBQ4UhpgiChIom6TBJwvdH1D/7Re12P5r1vU6bKq6zKvP3Jxg3y1VsJKTck8kYrOUhE
         St2A==
X-Gm-Message-State: AC+VfDzyOeIQocsqeJiIE5jLFIs72veJu1b5YNdIcAIwwButsxd/bLK+
	+n9LiwzQZNyUMxtaodcb4bxMXTc+dos=
X-Google-Smtp-Source: ACHHUZ7WMgiI84Trbd0AiVZI0N0aplSi6lonTTCcBn8ZEwaywhoIhRZt8BAg3uCYiyizPIRHV9PdYg==
X-Received: by 2002:a17:902:be0b:b0:1a9:7ffb:5ed0 with SMTP id r11-20020a170902be0b00b001a97ffb5ed0mr33044501pls.59.1684250883864;
        Tue, 16 May 2023 08:28:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c11100b001aad714400asm15647365pli.229.2023.05.16.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 08:28:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] uw-imap: Pass CFLAGS from environment
Date: Tue, 16 May 2023 08:28:01 -0700
Message-Id: <20230516152801.198459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 15:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102632

This ensures that -ffile-prefix-map passed to compiler

Fixes
WARNING: uw-imap-2007f-r0 do_package_qa: QA Issue: File /usr/lib/libc-client.a in package uw-imap-staticdev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 2f4261b00d..ea76d4870b 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -29,7 +29,7 @@ CVE_CHECK_IGNORE += "\
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = ",,libpam"
 
-EXTRA_OEMAKE = "CC='${CC} -std=c99 -D_GNU_SOURCE' ARRC='${AR} -rc' RANLIB='${RANLIB}'"
+EXTRA_OEMAKE = "CC='${CC} -std=c99 -D_GNU_SOURCE' ARRC='${AR} -rc' RANLIB='${RANLIB}' EXTRACFLAGS='${CFLAGS}'"
 
 HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
 
-- 
2.40.1


