Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3D8C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 22:43:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.1703.1642545813610853231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 14:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T7gsgCDo;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c6so317013plh.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 14:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RTpj5rH9wp1EJV5T14UnMH9D7MvRlruLRFmKsIC8Dr4=;
        b=T7gsgCDoupaejP8eUYoCqxB6tQfMqhGhtFKisxHGMyHT98LVBgPLXIMXjMdNBOiRlM
         +W6AyzhC8IU1uXydvb2Wj4bKxkKpec58lJvUOkJ+bUBZSDb2l/qX8uVbgjytvbhQ4VP2
         ljQf4gdPbNnWH8K2xn3jxUYhtUN3U777ovCvFvlZgwzQqga8JSPtF2kOWxIVRDZA/5IA
         xpXpyF8eCmlIfj0lDNqlRLGtrkHoHueafjOoqmrTseJF3/mqWIPmO18hZ9QZM1v7IvbS
         2v4I6o/Gh1H9CWIFX0hKaZFsvxdVQkETkBO2e2It3fJm5ajYn0teBAk2dY9gq/pEPF69
         6lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RTpj5rH9wp1EJV5T14UnMH9D7MvRlruLRFmKsIC8Dr4=;
        b=lBjXMx4ZbwjVp09YJkBAPPPx3kAfbc5yq175+9+cbutD32U7eZ1+d+3eNvD9CCtotn
         KCWj2NMB52GBDv6DX2zMREUx2WOvPcA+6AD6RS3Q13VSqAeD13gKLDR058ImnQusGwuC
         jkby5igo+tH0J8m9DGoZsFjB7FkxQXrHen73TwgwQ7cc+vrqKrxXtbs8B/FGhcJQPOC9
         qYvMyPpYDRlMu+P/imUXpHuSu+3pOflLxTsx43svywcwe+8VRIRl4XVyBCCOZ7QEVWdk
         9S/bgHFMjv2/gn+zooeFUzuhogApPE+lD/r7RtiWHnNXyS8qNOUUVlXA/fiIMCBnYW3H
         qqXg==
X-Gm-Message-State: AOAM531kl4b5mh8zDq3gzL4ePjOcvqHKGzxTfVHjted5jvcz366iiii4
	NYQ4RW86iJ3mteHTNU+l2bsKTSQtDpjleQ==
X-Google-Smtp-Source: 
 ABdhPJz7FVzQe9oBF0a6am5b0e6F+YUTE8TPh1zfU0m9firzp20QV+Tp8UaRQqkm1hvKULS9f25XfQ==
X-Received: by 2002:a17:902:bd93:b0:149:ba01:e67a with SMTP id
 q19-20020a170902bd9300b00149ba01e67amr29865882pls.156.1642545812648;
        Tue, 18 Jan 2022 14:43:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 p12sm3200707pjj.55.2022.01.18.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 14:43:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] iotop: Use lld with clang on arm
Date: Tue, 18 Jan 2022 14:43:29 -0800
Message-Id: <20220118224329.2392410-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 22:43:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94921

BFD linker is crashing when using clang, workaround it by always using
lld when using clang on arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_1.20.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.20.bb b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
index 17c567095b..b05c8cd35d 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.20.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
@@ -12,6 +12,10 @@ inherit pkgconfig
 
 EXTRA_OEMAKE = "V=1 STRIP=true"
 
+# Workaround BFD linker crash with clang on arm
+# revisit when upgrading binutils and see if its fixed
+LDFLAGS:append:toolchain-clang:arm = " -fuse-ld=lld"
+
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
-- 
2.34.1


