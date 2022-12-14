Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6EFC4167B
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 11:27:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.100809.1671017268325575086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Dec 2022 03:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qJpPTzeA;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id h12so18924170wrv.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j/qBSmfGaEfl+Jd+cVHHXlkxR9FTYBorm+DEeOfVtQ4=;
        b=qJpPTzeAGnEgGwAvLRUdvzI/TTD38SfZsGVuCZXHTukzvmCojTsRWYBDoz+hzNYi+I
         DnpYeySgDJ0xRTK/xABfiNO7h7/QtVywwR25uoSCUcmyDmPXuWUv3flSct2la1yNiXyN
         AkuzlqT4M68TAOQwc2y9DuTuptduS1vTtCabyofTD4K9Sz9g5VN+Fl/OgQ7GxZbHNzWe
         bQDGO1WS/5r8aibZ/bgktizuIaeYoVZtes9wnkeCLyva0rsL/035pFcbRiWhTtL6Qmnz
         weRj5hNAHHSU8pFLR/RWdti2G6oFyXJftA81c+kcZMPprOdAtQJwuFqc5qH2ny1m1tO+
         SYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/qBSmfGaEfl+Jd+cVHHXlkxR9FTYBorm+DEeOfVtQ4=;
        b=HolPjcpSCwaYzHjBDpCRj5ekR1XxJ7mL0KfWYtQQW5Tt999oo2RErDHp1H5bWxlq26
         BdKZMig2/MYyBW0/wfLRkXLgs2/iwpsUs4WLGymD7foT7cIdLQn2fC/ksUd9FfvHQaqV
         Po6duH8lYn+UkbN7eTFQi+g3DQzguL55G8SJGN7QYDdtTo4OdYTjyJKvPUCBD4q38cCn
         N/j0DBrjvNXRmaKbfQv/Nl3hu4Om5/t1BjbalLFybWO/gnZGR2cHl3EJtyQlKa7YVPvm
         IWKtbJ7+Y9IEUxlW4sXVLJ4w4K81RZ9AvQYD9Ljn1sA41PuIAoLljzFxbQIMfIJ1I4Xs
         ygFg==
X-Gm-Message-State: ANoB5pnCWjN1WvHnjgWz9mytiHLjqJ4CuSuZV+mMmsExH7pT0idKnY3/
	awhfnu36jzt2xNvk1u+Dp9NvLqUCZrs=
X-Google-Smtp-Source: AA0mqf5sOOSQqIghInlJ4uU//NsBuUjgidoQUdJqkK0D/7s6LrhdkqFh2odfjV5WYNtuZCg1rZX9Tg==
X-Received: by 2002:adf:e707:0:b0:242:73d5:d8cf with SMTP id c7-20020adfe707000000b0024273d5d8cfmr14433313wrm.32.1671017266079;
        Wed, 14 Dec 2022 03:27:46 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx5-20020a5d5b05000000b00241cfa9333fsm2763058wrb.5.2022.12.14.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 03:27:45 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 1/2] mdns: Set MDNS_VERSIONSTR_NODTS
Date: Wed, 14 Dec 2022 11:27:34 +0000
Message-Id: <20221214112735.21135-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 11:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100077

MDNS_VERSIONSTR_NODTS disables __DATE__ and __TIME__ in the version string,
which are fixed anyway for build reproducibility.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb
index 84018de1bbb8..eb4d3eeaa561 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1790.40.31.bb
@@ -62,6 +62,10 @@ PARALLEL_MAKE = ""
 
 EXTRA_OEMAKE = "os=linux 'CC=${CCLD}' 'LD=${CCLD}' 'LINKOPTS=${LDFLAGS}' STRIP=: ${PACKAGECONFIG_CONFARGS}"
 
+# MDNS_VERSIONSTR_NODTS disables __DATE__ and __TIME__ in the version string,
+# which are fixed anyway for build reproducibility.
+TARGET_CPPFLAGS += "-DMDNS_VERSIONSTR_NODTS"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 MDNS_BUILDDIR = "build/${@bb.utils.contains('PACKAGECONFIG','debug','debug','prod', d)}"
-- 
2.35.1


