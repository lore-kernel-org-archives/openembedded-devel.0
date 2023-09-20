Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01ACCE79C6
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:29:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.34510.1695205764875755500
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MpNx6uhH;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-532784c8770so2834940a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695205763; x=1695810563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3IBFce6HYwUi3+7NsJYMtjOw4pPAeBF7+YM3D/Gin0=;
        b=MpNx6uhHzNBnT0Uk8JkNa7wKf9I2fOFM/ht7fh7gSyeh5U/+8QBoJrQKfANwRbvyST
         NWXEyPiaXBnw9PIMtjhBLyHTD6tmfc5AndK601CpEiar5wYmdb2N8DTusJB+O10GyOv/
         jpVoYup84q24mUtyHrDQ5UUAzr/E80Qc4DUERS1qSlRktje/A0POvJBlVrQXlHUhO1ff
         kOW+MtmjdH6PWzHDOgZsgiyFJZixdckmdTf+lch1UFY2yexddKFzoMNkRBYQG5XgDQ5f
         LH3Pn6uxZ6g2wTWaAMcyuWKxBlsRQv7qYmrgmxFZWv9nGyKdTSCCrfJy4isbSUCCFHVH
         MmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205763; x=1695810563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3IBFce6HYwUi3+7NsJYMtjOw4pPAeBF7+YM3D/Gin0=;
        b=etN2Y6PzDBydytmLUruYe7nzbx7IKdxk1Az74pQnkKX4KnwhVDHNjF5I/gL1CaTATY
         evTpf90JTMf6ZvkiK+0evUyY96GkM00SDEx9o7jTw1zbXs0kXRD+leeElYlh+0fq6+nY
         BP3rTxCbXeTSs9YGpeYbwMyifhxxKmAaQrJj1AAsly4zsVjeKQQsBMJFwuoGm5XsjFmQ
         RqfCIP1xnzqthkzpEb6lNS+6EapTmhE6TVpTLOV5U7p1lTFv8Lgddb5ayBir92DKt7Uy
         SWm+LuitUe3b4BWQ1CUEmcHwV4WA1bFpUjNqiK/EUBeNTJgnNOLvULcH1UF3H/hRPlT3
         wjyw==
X-Gm-Message-State: AOJu0Ywhjqx7/Ug396WvB0QB2cujldKAm7bhxTmVJDwd1xpjUTddhSLR
	aADYcaV0Dmd2RJ95ygnNNsv58oo+1Kk=
X-Google-Smtp-Source: AGHT+IFfozYiZPgCWAeglDHfH1ECTMXVf8pxteXlacWVJHqmL9u4ufX8KjW3t0avvkMP3QUUtErwyA==
X-Received: by 2002:aa7:c54d:0:b0:525:570c:566b with SMTP id s13-20020aa7c54d000000b00525570c566bmr1656677edr.22.1695205763311;
        Wed, 20 Sep 2023 03:29:23 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ec31-20020a0564020d5f00b00530a9488623sm6602822edb.46.2023.09.20.03.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:29:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] mdio-tools: exclude siggen dependency on mdio-netlink
Date: Wed, 20 Sep 2023 12:29:14 +0200
Message-ID: <20230920102915.1269280-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920102915.1269280-1-martin.jansa@gmail.com>
References: <20230920102915.1269280-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105012

* it has runtime dependency on mdio-netlink to satisfy:
  RDEPENDS:${PN} = "kernel-module-mdio-netlink"
  and mdio-netlink is MACHINE_ARCH because inherits module.bbclass

* fixes:
  bitbake-diffsigs \
    sstate-before/hammerhead-halium/cortexa8t2hf-neon-halium-webos-linux-gnueabi/mdio-tools/1.3.0.do_package_write_ipk.sigdata.1c175d042bd09e59c1329c51fba2569376f395ba79ee9adc62157ee91ad99e80 \
    sstate-before/mako/cortexa8t2hf-neon-halium-webos-linux-gnueabi/mdio-tools/1.3.0.do_package_write_ipk.sigdata.4ad94062582b2cbbff07167598c1243aa18ff6c5cc23b3de8bce99081da500d8
  Hash for task dependency mdio-netlink:do_packagedata changed from 759076223ccea58a05414b33bcc55c8d4b41a85c75ce56f2ba965004c422fd4c to b3c2ceee91dedb3b40f298d2efe09bbb7d3024f9ae93e83204233dcfd0a66459

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 12ce08c8a1..ea6d9c9479 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -22,6 +22,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   wireguard-tools->wireguard-module \
+  mdio-tools->mdio-netlink \
 "
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
-- 
2.42.0


