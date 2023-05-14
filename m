Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80915C77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 22:27:58 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.76414.1684103274225295110
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 15:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZS0rCK6i;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-24df758db1cso8092215a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684103273; x=1686695273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V64uKQxoFcBFeijKP9to9OPs0soNc16udZWqW40zr1Y=;
        b=ZS0rCK6iDZX7cEuE/3l+xywbQGV9ditvBCbxDToAzJkMcAwmtZsnoFweaXR6CGbP6B
         7l8CGPh/L36bkM10C0u4WypdpwlCoK84Ga1PNTdJCr8yMGiG3FwX/sQ4OyXvXeILYcaY
         OQdmcgRa28i37GIFp64Ti+2yWsbXLuPxeZJhCMftcOlBNzTJBXzAC+0SDa7cXKxNd4QY
         ZfcViI60y858g8/Akg+frN98lx7Rdt7cxV4I1avBchpd4rZWA+eR/PaLVauujWBcG0Eh
         dqPiarwWu0ghD9DMJF2rS+ESbaYjsqhf5ROHPKvK0glwcOS7jvCtkj32d4qT1llb3HP/
         LEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684103273; x=1686695273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V64uKQxoFcBFeijKP9to9OPs0soNc16udZWqW40zr1Y=;
        b=SuY6ZHAQxlfLa6nEh0KsCyOvI1MsqTr3X/6KUK6M6xgxxsEZP6JlHWy97oqae7jlL6
         EB0OuB6E51EMri8PdjTU977QkPDRUcjA0D/JlGuT30g4Q9U4BsTdrUY8xtZCmJANuluc
         Ca+HXfXA2ivBIboyAFHG43qqEGfRb/FJLeua8CSn/57iT4aYUES+ueqvxWwLfDMH/eIa
         YmlXHhAjWY7hC3nfIdlnJmXKnTqCsmCOCcaI4NfloowHVgzapeo0Itw951TZd1iHIxte
         rY9ZCV2+VewgkuD3wQ18ANoaAa5v+4nqfte6Q27rp6gn7lysxuG4t19XvhE88gc6tBx5
         cwjA==
X-Gm-Message-State: AC+VfDwdZ01Jfo2w5F0KWz6VCw3oD3kXDnrn7cNGNpR7R9UdTgYj8SIG
	1O79e7Swp6a9as/HxFMMCnY2DnuJrHw=
X-Google-Smtp-Source: ACHHUZ5ZOHUu2J0fE02pAkKz5xirLAm8FSji3z5oxN8trZhcH+fKg1Ethruw2Fc/cXa64G0VZLJUSQ==
X-Received: by 2002:a17:90a:bc88:b0:24f:13ec:ecac with SMTP id x8-20020a17090abc8800b0024f13ececacmr31656005pjr.26.1684103273194;
        Sun, 14 May 2023 15:27:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id u13-20020a17090a6a8d00b0024dee5cbe29sm1736512pjj.27.2023.05.14.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 15:27:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] squid: Remove buildpaths from generated binaries
Date: Sun, 14 May 2023 15:27:50 -0700
Message-Id: <20230514222750.768716-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 22:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102589

Compiler invocation and flags are added to SQUID_CONFIGURE_OPTIONS which
is added via generated autoconf.h during configure step. Since OE
encodes sysroot and buildpaths for cross compile, they end up in squid
binary, this patch removes from workdir from them so avoid encoding
build workspace path

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_5.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_5.7.bb b/meta-networking/recipes-daemons/squid/squid_5.7.bb
index a208a2a88f..2a5de1872d 100644
--- a/meta-networking/recipes-daemons/squid/squid_5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_5.7.bb
@@ -69,6 +69,10 @@ do_configure:prepend() {
     export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
+do_configure:append() {
+   sed -i -e 's|${WORKDIR}||g' ${B}/include/autoconf.h
+}
+
 do_compile_ptest() {
     oe_runmake -C ${TESTDIR} buildtest-TESTS
 }
-- 
2.40.1


