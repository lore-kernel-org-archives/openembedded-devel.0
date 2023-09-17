Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEE2CD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 06:39:43 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.25998.1694932776341544236
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 23:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLIJp/4h;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-573249e73f8so2253957eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694932775; x=1695537575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YZxVh80FqCw+oyJ5Igk2295JMJHwoIOSCBQkDm3XhXM=;
        b=JLIJp/4hRpxrhDgvb3oEHyjWYVkk/Ixa1zWvzn9yot2t7VjSD3mPsrs3TGFC7WVrQD
         CU4QpwEXIRjDSfCsBsbgsIGRy2HQ+ykLEOvmLW6Nsx2ReF7aCMwZQmIfnHfr/645/DW4
         lLp571zUs4Z67W7Fi0npZ0eYWqXaR76RYBxrLFGWWl9lpezlgzQ7vwfq8NimegPszD4u
         8AGzS0Ej+MYOiGfhancH3Ef7tUhwhj/kitbYzTenMXO2xtJxFykiZ4TeRv6MXwD3Zzb2
         +zcVu9ylrrhAKpu7wnKaYo3j/JBZkm4xOB+cqC9FbS0+IrtgyHf7592NhhAnBP0YZlUS
         6EgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694932775; x=1695537575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZxVh80FqCw+oyJ5Igk2295JMJHwoIOSCBQkDm3XhXM=;
        b=ZHS0vsTUsrAeabBUkkODkLiBJyfy53tt4MYrWIT4aRWpPslsaPBEtHwIAyzPdMal/I
         kCOq+p9LbfRTFk373s/LyK9GMcfRGd9jYCufqrSiVoGWgQxmeNJ0988TxG1C4bNm7W7w
         s2stWHU3HhgCusuex6LSki4rG8F4FQKQCeVVlH5qPNuT1zT7LzoPfpb4lt2JdZG67wWp
         aOHxZpDNPPU+aNy8PnfWL8LZjPmzmgPcQcmtVFwe/0CeGMqqUJX4HT2rx7Tp/uxvkEZW
         Akx9xjw9pshFHPaai4Io5JdD6tbaEloWoikaRThEHU2xQvZ6npCxHOiLIRq/U9a4dmY9
         VgFA==
X-Gm-Message-State: AOJu0YyyYzjGgK8y1KuKSX1SuIz9QmrmgNKFpKgrAVZkvS9e1yrSfgsc
	qBEtoqAyEAqV+4GgHbQRK34PoFOL/Ps=
X-Google-Smtp-Source: AGHT+IHaaEw/vWvLjsDq5hDT3x13e3iVUyBwpmLjKcJd8VxRqOPZsumCwLQrREVq/OoGFFKHoosDJw==
X-Received: by 2002:a05:6358:94a9:b0:139:a0fd:780a with SMTP id i41-20020a05635894a900b00139a0fd780amr7944719rwb.12.1694932775324;
        Sat, 16 Sep 2023 23:39:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902e31400b001bdc664ecd3sm2682384plc.307.2023.09.16.23.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 23:39:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mongodb: Add rdep on tzdata-core
Date: Sat, 16 Sep 2023 23:39:29 -0700
Message-ID: <20230917063931.2207782-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 06:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104907

mongod fails to start without /usr/shared/timezone data

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 21c3b10148..21051a8958 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -143,3 +143,5 @@ CONFFILES:${PN} = "${sysconfdir}/mongod.conf"
 SYSTEMD_SERVICE:${PN} = "mongod.service"
 
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
+
+RDEPENDS:${PN} += "tzdata-core"
-- 
2.42.0


