Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B28FC433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 18:05:07 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.25719.1634493906513951209
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 11:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U20fbEYd;
 spf=pass (domain: gmail.com, ip: 209.85.210.45,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id
 l10-20020a056830154a00b00552b74d629aso988900otp.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o0Tar/6pFn2lnX1lopREZzOb/wWICS0OH+yf9L0A40A=;
        b=U20fbEYd1LPYwr/Qh/ZZLdpfEaMkQPPTTx7rhOEVusM++06NniwQUmEvArpVK0uymw
         BgUS/u8qflBBTswEuzOVrddtdWNMh4qryqERB2HXDV8cNWouD1UGEFN5ioHvY06cY41h
         GTCRHxEQ2RqZjMYCkqAg9/NPPzMIcigB4kAsjktpxM241jPLFkZX1JDuZGgiYRVjrF15
         H4fQE/HPSKts5EpexDj8glVCKIj84rx0xjxVNgyTzpDrJp5PNHb1eeljB4+Xxw2+qipa
         J9prR0VCU/FLAdoCrEVvhlFwto1zkoDtnqq1uDm0Ca9YxxSRGUY+47Jawif1GfQQad5+
         jg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o0Tar/6pFn2lnX1lopREZzOb/wWICS0OH+yf9L0A40A=;
        b=jtuC4NFbLFas0YAdKXlzD0rwwoWQBqwWTkghms8PmC2akEM78Tf/juKLDhuncKfHtu
         xTvhOhgzmcr7jbxFYGYu4Pfl/Onw/KYl0MTFLyzgtwwnCp6dAabOPOMELhcqjt0MjB4k
         fW94aiCsVeEjv90wPXzP0yunOuSBAJSYIioofAi3XKDORYQg53TZTTOKqOul/3vGjtG6
         xdG12lRNMINqJj8Zj6RoemrJzbTAjE+Ccr6IxlgMsggkFWN3fBPT1+qi4VepLwE8dTOz
         U9AIKuY9yKaGkO8QL81bGFPyHWygCqe4WcTSbxn1tZSEglpUR1ewfZQUf47L5n73ev4H
         s/9w==
X-Gm-Message-State: AOAM5301DC9xVQTJRk05eGCc4llfQINothJIMf6kltkFrCDDHiA+1zcX
	dMv14kJas3eAREiGcVoC0cC+2XHZPuM=
X-Google-Smtp-Source: 
 ABdhPJymVbDjI2PKodhvTimsZ3gaGNUxg06VShclcLUlSzRaSmdWEZmdGGZ6ArHO7xdLsoBsT/+R4A==
X-Received: by 2002:a9d:4118:: with SMTP id o24mr18496031ote.47.1634493905646;
        Sun, 17 Oct 2021 11:05:05 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 d10sm2136312ooj.24.2021.10.17.11.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 11:05:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] colord-native: Inherit pkgconfig
Date: Sun, 17 Oct 2021 13:05:03 -0500
Message-Id: <20211017180503.3375574-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Oct 2021 18:05:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93408

pkgconfig.bbclass is now required for pkg-config to be present

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-support/colord/colord-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/colord/colord-native.bb b/meta-oe/recipes-support/colord/colord-native.bb
index 65fa0f44b..64dd94a9e 100644
--- a/meta-oe/recipes-support/colord/colord-native.bb
+++ b/meta-oe/recipes-support/colord/colord-native.bb
@@ -2,7 +2,7 @@ require ${BPN}.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-native:"
 
-inherit meson native
+inherit meson pkgconfig native
 
 DEPENDS += " \
     meson-native \
-- 
2.33.0


