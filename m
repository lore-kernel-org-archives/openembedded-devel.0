Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12269C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 17:28:02 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.1092.1635874080926085811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 10:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQSQ9vOk;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id s5so8637310pfg.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 10:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXfen6ElE/PwHYIg3FBRTLOW+IbOZ/2g9fQD+DDEEHs=;
        b=cQSQ9vOkI9o+RcM5SrIxK8tk8bDTJT/YzU8h8/HtrU38TUMfpVyT47Y2IMSmIUwtpb
         30F8aif+7185CPCWojca4yV6aKm3GnrdXHvEU5Sqy5C5M/kTryz6+/nUImjWu0tuchd6
         XZt98yYWN8WtdIo71N031ckZsWOdgmeiJPu/O8Ka5AeiVLo6owN+GNIdAvgjInNOua+t
         FVRvnZ7yvFFnVfg3YmBVtGixLoHYZANVImwQjq9pA4zHzYSFjrNaEnVNmONWjV/Bdz/p
         8ANZTb1u4LlwtIZoPjfGt2rlkgzTaZl5cX31xnayXj6SV3amdS0AQlbB99yjKPOwlbs5
         8DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXfen6ElE/PwHYIg3FBRTLOW+IbOZ/2g9fQD+DDEEHs=;
        b=1PW4kzteOOZeDIzvxbNbrmESmlUy2PwkJTcrsIgNx1Bd14P1JWWGmej55Z9awSNiVx
         RLeFK/JmPHe0XAW5s5zeQfR9W68tFmGWyHqg27PFks1SlDwvoiOhYYq2R/moDoTjXG9z
         sbM1xEel8+cY/0lEdWyKXrcmLhatdo6jxo21T6+f1GKrUPFwxeysxz1svwp4/WAZtPTr
         aonKVSImhVFH8OnblPTBLdkrZV+OsNw9vSiV4RuXM6Lk72ZJFtXMm7zyxxI/bK5VweDq
         yka9dzZxq7goyQkn/uY6Xmh/evO7Ab1kCx/wv/uJ24FzAyrlERiIlBp+F9DuZem6BYHj
         opPA==
X-Gm-Message-State: AOAM5303JPFY+xEWiE6/BiGfVPIiqG0GoRi+QnmSavOZgi286RI7xVeW
	u1Qsdxm0nIyv4YoYXTUuR+gny8URaqw=
X-Google-Smtp-Source: 
 ABdhPJzx08spZu7KAQVJMt7K9hLe03VHivdbhp2+QR0AyhWeZrtUlTM3UHnn3rsx3E3fGGqaejPqDg==
X-Received: by 2002:a05:6a00:2449:b0:44c:2221:8c38 with SMTP id
 d9-20020a056a00244900b0044c22218c38mr38520426pfj.74.1635874079920;
        Tue, 02 Nov 2021 10:27:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 ip8sm3521568pjb.9.2021.11.02.10.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 10:27:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: Add python3-imgtool
Date: Tue,  2 Nov 2021 10:27:57 -0700
Message-Id: <20211102172757.1336-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 17:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93782

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f0159f8234..c2f056ad7f 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -180,6 +180,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-idna-ssl \
     python3-ifaddr \
     python3-imageio \
+    python3-imgtool \
     python3-incremental \
     python3-inflection \
     python3-intelhex \
-- 
2.33.1


