Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEC3C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 16:13:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.29340.1658160831369736409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 09:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Spvk7jw8;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso18690910pjc.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zquPWz5VRVbUpK/IKv68HaeiR3MGTAuVuYeFmDDMCKU=;
        b=Spvk7jw8kTWeL5JohNtGfwf3OOEdNn+y/9B05qi5yfwFRvD5tV+tY+yqK2woB1wq6Y
         FngzCNA2aBjVCbaxjX+XqzJt2lGd25SC1BBbfy8KGWm5xuGYxl3MPdpFfVWl2P4EV2uj
         MpKdtDn9jUOevChAvCKik70NggzLJGVJGy6ME2e7Ftn8L/8+k2cwaBXdMVc944Vg2h1O
         LfhiKT2TNnuvNrSiGkk4Re+bHrxRLdg+jcR1H9RKskRiI+6wNb8egtzMPRhtTbVLEvzL
         TBm3Xuzxb3SMYZnMU+PTrQRDYOg6I+byLQGXwIOVO2CiZ77IhBi7VO2Vfu4GlsSZen6U
         KETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zquPWz5VRVbUpK/IKv68HaeiR3MGTAuVuYeFmDDMCKU=;
        b=4EqSlgwMUeQIwF/NBVXnNW+enlA24To10umuMyWBLn4McLkitVvocQElOeMDRxMzy1
         XyoTKy/jH0CD735KtxXaJJITM55oai7IDuKJmnQefE7fUfX693YMesql0ZfXeqb/Ou4x
         lc+4UdMVwz7S4S0Bere9TW5ToM/kr3a9lRTZAAw5zTkDUZcOTiq+xYjPEMOI1vdpuDlN
         igPp/iBADxRE3dGT9b4Gy9jR0rY5gAMEmcZCL8DjgQWA/nxxxIIPN9CeJXSccTkG8nku
         1eOaKLvBmMX/9t9OyEM13cyhZhZSy82bGuUitRopd4ji0jhR4Kda6bAZhZxQUDjNxqKa
         w+4g==
X-Gm-Message-State: AJIora/ORNYEYLgD5TaIYkgz9IYaw6yo6/fRhvkqNh+rYfaU7Igffc4J
	m+TxHNkHyjO9QkTCty5ljSI8KvFo22MneQ==
X-Google-Smtp-Source: 
 AGRyM1sDkx8D07gemhCB2MDlrdOZoFFmr27SfRUP06niKl4z6xr3c0XFCGnKtfF8tEWrGh8Jvrtjbw==
X-Received: by 2002:a17:902:7c88:b0:16c:5301:8a52 with SMTP id
 y8-20020a1709027c8800b0016c53018a52mr28940346pll.95.1658160830348;
        Mon, 18 Jul 2022 09:13:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 u1-20020a170902bf4100b0016a058b7547sm9598882pls.294.2022.07.18.09.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 09:13:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] poco: Link with libatomic on mips
Date: Mon, 18 Jul 2022 09:13:47 -0700
Message-Id: <20220718161347.1861813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 16:13:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97881

mips compiler does not provide intrinsics for 64bit atomics, use
libatomics to get them.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.0.bb b/meta-oe/recipes-support/poco/poco_1.12.0.bb
index 428d374569..c3b52c8885 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.0.bb
@@ -67,6 +67,7 @@ EXTRA_OECMAKE:append:class-native = " -DPOCO_UNBUNDLED=OFF"
 EXTRA_OECMAKE:append = " -DCMAKE_SKIP_RPATH=ON"
 
 LDFLAGS:append:riscv32 = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
+LDFLAGS:append:mips = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
 
 python populate_packages:prepend () {
     poco_libdir = d.expand('${libdir}')
-- 
2.37.1


