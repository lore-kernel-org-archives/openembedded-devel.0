Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B490C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 17:07:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.296.1699981629994621493
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 09:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=26Q8ROTj;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32da9ef390fso3762337f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 09:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699981627; x=1700586427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRKhUuo7zSJdwjF3bUcBa6EFxgmr+Mp2swOQ2HKzBKg=;
        b=26Q8ROTjy4NqDQPyDU+avfCHEkNkvPnhDTw7iYKzWNkiUmh/bmMOT+k0UnmCn3uXcQ
         dk43fTOmfn2NzwCQPs4ym9vShTudtdfvR8OuWoyGan8M7qB88cYQeOysMXSBBbx/KedC
         9oopfuf6nW8Giknn5vvQXbvjD1iOIALMk3/frWHzuFfn1DQCNRmFL9SXvEStq4rRdEes
         JBxkdPEon7StzZ972tSDNbp2C4M00PPzfKw74bxE7Wo2qs9ZGJiL7TgvElKOlZkZZcJ5
         o4d323vsulmTQtYuvKN0e1dEwg85b5BTPKhmj/widMOmwKSfVOb2ReThVkXSBAv4PHch
         V7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699981627; x=1700586427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRKhUuo7zSJdwjF3bUcBa6EFxgmr+Mp2swOQ2HKzBKg=;
        b=i0W9Zv0U1eOCne3YBmT69NbUQZQx8wIXBV/JTStmF43yIV0hDSCMVKVrCXUlUh0lmp
         z/IMAvCnwHIY9aKSVv8lrtH5RiCbnAvFjWHqo/H8NIGKMSenpAbSv6p7jcZjZ50Y9Amm
         wlvFFHxEuc8tJxi4fVTSiR2JyPBNCU6eEfihYeKOkbunqhfKx82+yqs+T0DPCN4xcQAH
         QU4Y8XVPRhDLl5RhkNeka2LvvNHbF69LcId8TksaotQcDIIJa+G+cTNMna23ZSwhxiwL
         L+1oSEf/ZfdGEbH6nx3y2pfBe6NBC05P7S0IjzX140XOOrp1T8hrgzN243rKB7mMTbhn
         Iwbg==
X-Gm-Message-State: AOJu0Yz48/6do3itf3ZFHB27TbKt1P6FnSVQ4Q0rTiiOxMN7z+uTs55E
	SM2vQoDMEB+o5SIVP9/l0eFu7ZuLbQscRhYbWaI=
X-Google-Smtp-Source: AGHT+IEOv+O6+eHAsQXciq512CNdIGQKD0UE43M1caN+MuXKP873UuW80tW9Y6/THZ89RH6h+1UGkg==
X-Received: by 2002:a05:6000:1845:b0:32f:7fb0:de13 with SMTP id c5-20020a056000184500b0032f7fb0de13mr7222363wri.5.1699981627512;
        Tue, 14 Nov 2023 09:07:07 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id dn17-20020a0560000c1100b0032db1d741a6sm8067069wrb.99.2023.11.14.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 09:07:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davidegarde2000@gmail.com>,
	Davide Gardenal <davide.gardenal@huawei.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][dunfell][PATCH] openflow: ignore CVE-2018-1078
Date: Tue, 14 Nov 2023 18:06:54 +0100
Message-Id: <20231114170654.3327542-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 17:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106720

From: Davide Gardenal <davidegarde2000@gmail.com>

CVE-2018-1078 is not for openflow but in the NVD database the
CVE is for a specific implementation that we don't have so we
can ignore it.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
(cherry picked from commit c1e7b0b993c294d52737e8e631badb5aaaefd2e3)
Backported: Changed CVE_CHECK_IGNORE to CVE_CHECK_WHITELIST
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/recipes-protocols/openflow/openflow.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index ab538c620..c425b48e1 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -35,3 +35,7 @@ do_install_append() {
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
 }
+
+# This CVE is not for this product but cve-check assumes it is
+# because two CPE collides when checking the NVD database
+CVE_CHECK_WHITELIST = "CVE-2018-1078"
-- 
2.30.2


