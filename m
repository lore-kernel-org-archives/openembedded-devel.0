Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7741C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:13:04 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.4834.1663834379867518070
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GpBQeyCw;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id q17so9986164lji.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=oSHI0IcX8L6v1KhRF046X/XSoJVNwoVM8VZFyGB05pU=;
        b=GpBQeyCwDCGIoy0ZfaPNONCbrH7w/4yKb8ausJN4j1lwrYVRr6I+/CaYBCDDwj3QaJ
         Xw3RY4qr7iMTxBZZa6N2LKxJs/9kcvxIzIQAH40YU0HeZZkI9Tc/p2X6S5zArG4YnYTi
         5dY/4yj3LpzU6ZRYxrwSKR1h6lBYudIHfutLefEiXdrXDWz9quBBl9X3noDt1hOxoCUf
         SHQ0ox1C8WnAWTE69z1ejP+SvMv4z4prGO29C5nY8OHxedtA6gjZ9NRcXIjeFiD+6aN3
         II+WwEeztQdZXXCU5Su59KtDbNSe1+Qn1DTEByg3IFD7asCSQ8MiEm+P9lzEqRNjZ/iH
         tv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=oSHI0IcX8L6v1KhRF046X/XSoJVNwoVM8VZFyGB05pU=;
        b=z7rTDYF2L92B18RFKdWaJldB98gPF22GYuAPB41GO+BvfWNeDaTXwY3xyyOUFNwBNu
         UEwvWmCF5bhmYxa5i7yQbSveABxsFYa5iWlMKVeECahfkaPnGfd0k8kbkDoY/wQjxK9M
         FE1Hg7QMsII8qSZ1gYK6B1FrEt1Va8BvURJ/c9QRWEVsJCsnMl1rhuGuC8/LTonzuF5e
         7kefJBsnXURPuTzDuHVHmYy/3Zsc5x6i8MI2/i1Vj1s8r8uBG1Of2cRK7Lj0M/T6b65c
         riGR1rrDM00NeSAocStzAZBZ2XrTO4ALnjthUi1cJy7dhqpipn52W2DI19KfBTMi5IMQ
         +sBw==
X-Gm-Message-State: ACrzQf0C1a2A/K0ybYbxxZ95SW2Kk56/aUCH1CUjR62lQhpvX+HbUcSl
	dPIZHdbG4rC6xRcBi1vlGyLwjmaDbEs=
X-Google-Smtp-Source: 
 AMsMyM4vsVzcmLiWTVmYJYv1q21iZxSUNrJlcpe+1ZsGtuTprthe7TE2eU5kxnHXTiT4dIWCUw375w==
X-Received: by 2002:a05:651c:12c6:b0:26c:3e1a:c857 with SMTP id
 6-20020a05651c12c600b0026c3e1ac857mr622839lje.304.1663834377775;
        Thu, 22 Sep 2022 01:12:57 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:1a0d:35fd:99c8:8f16:a655])
        by smtp.gmail.com with ESMTPSA id
 d3-20020ac24c83000000b0049aa20af00fsm822371lfl.21.2022.09.22.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:12:57 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [kirkstone] [PATCH 0/1] lmdb break kirkstone build
Date: Thu, 22 Sep 2022 10:12:54 +0200
Message-Id: <20220922081255.14964-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 08:13:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98921

From: Ming Liu <liu.ming50@gmail.com>

lmdb is currently breaking kirkstone build, cherry pick the fix from master.

Richard Purdie (1):
  lmdb: Don't inherit base

 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


