Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCD9C77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:06:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.8803.1680876410881603063
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=WDtWsAVF;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id g18so8655196ejj.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680876409; x=1683468409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c86Biq67mIVW/wLmgAGBEF9B9DEX6cm0PmYimKtpW3M=;
        b=WDtWsAVF29e3RUOoeftgUlLruQPVqGcnbQrEflWnJaPxuVjdMDlmQR3+gyBS6M4BJQ
         qxxPx/SvNxdqzw1GX60p8zCPYwOZHW13cwW9M4V3IT/g23HQWi9EzEuKebZSzX6T1jhM
         GCWxo+k0NE3DahBrZqTB3c7Y6i+ByrRiJHwf2TIPhilG4U1MPhY4Y2EgbgWldrtoWcne
         1IT2tKIx9fCblgS0G1XhbO+p8JduBPV+Xxw2+TBiuiC0C/dgpZdC3IlnIzncXeKvrRvw
         yAkhpf7fIUfKsLhS5YJp0OYsrpVRxr5o68IPzwOcYOnOqQKpaAfWt9yQOEBYGvmAmnz4
         VcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680876409; x=1683468409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c86Biq67mIVW/wLmgAGBEF9B9DEX6cm0PmYimKtpW3M=;
        b=G9q0lcG0j+fx552xErokbappb7hz6mcS45DrbIWNgchrf1igXb1tx/XQGS7hk5M1vD
         e/HKFLE+XzPHOfgBO2xjAr35oAS5/8MjGMGmoD4TWayCdSkQSYxVpi2/0drpq0P9qRG2
         ++pF58xN08y4EvFeudz0EBIWL4w/FOV+bK4yEK7InD918yjrT62BNNmg0M6BZ75EtIMQ
         YVYV1XlttnAybP03NPNxtfPnVPI/Rf8+LLWEln9Sgzz3hA2PiPQQsicGbG438jBdWzk9
         gHNCbgJP7BMLS9Qg3Z/bJXg4EnKWWymUrlS+e6HmlbHB5t4bsjvIUTSM3k3sk0kfXq8K
         5teg==
X-Gm-Message-State: AAQBX9fSKF76uXR5jhI661RtDu8z3nlkk+jgTxIiPhOtSouwIcV8Eu/g
	E3D6vIZzow9juomVFkjtBcMsnKt/Zcg=
X-Google-Smtp-Source: AKy350athT9Cc4kwJHTdR9uCDUGJg9Zhy6S8YGEVzXUoiaAERIU7gI6jSM//Y41usRfeLgUhGWzmXA==
X-Received: by 2002:a17:907:783:b0:93e:908d:cfe2 with SMTP id xd3-20020a170907078300b0093e908dcfe2mr2648370ejb.0.1680876409004;
        Fri, 07 Apr 2023 07:06:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n5-20020a170906840500b0093fa8c2e877sm2078308ejx.80.2023.04.07.07.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:06:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] restinio: fix S variable in multilib builds
Date: Fri,  7 Apr 2023 16:06:37 +0200
Message-Id: <20230407140638.2359718-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 14:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101985

* do_populate_lic as well as do_configure fails in multilib builds, because S points to empty:
  lib32-restinio/0.6.13-r0/lib32-restinio-0.6.13/dev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/restinio/restinio_0.6.13.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
index e715135dc3..03eff43dd2 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
@@ -9,11 +9,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=f399b62ce0a152525d1589a5a40c0ff6"
 DEPENDS = "asio fmt http-parser"
 
-SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/restinio-${PV}.tar.bz2"
+SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "37a4310e98912030a74bdd4ed789f33c"
 SRC_URI[sha256sum] = "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b5000f5252e0188848e7"
 
-S = "${WORKDIR}/${PN}-${PV}/dev"
+S = "${WORKDIR}/${BP}/dev"
 
 inherit cmake
 
-- 
2.40.0


