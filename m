Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7761EC35296
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.21899.1649623227991502042
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=KQ6Ojjk4;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id bu29so23472797lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWTslur7MlIkehxZf2O8OKOQl2d4/PVjJKNuBDTp+8s=;
        b=KQ6Ojjk4/DYCVbpxFubJFHkEiFUDZHMC8rIykySnlKgwX9cAiADlQx6o+lztsQT6Pf
         RUfVUPia8MvjrRyjwiXfIok0En0sqDnn6iBAzWYkpm3Ri/qRv/USZPQxLDdQYZlpgK7D
         a+nZEkq6fj5EuTSA7XBSjvkAyaBcJA6fun3rDCqP1b0i2un8uXpUv1peiN2UWlrutwSV
         CUmYkR/o72jeqUz1p7FAVUBJ1T878c0xvFUSfowcrCQCkD0dLYiEYd/uV8kvfaNP0Fus
         4SlK2YLTnIK1BKryKXM9g8FrePXZV7txVvO7bb/e5il0FFvysAe5hpkccrvD/1EoTy8B
         UzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWTslur7MlIkehxZf2O8OKOQl2d4/PVjJKNuBDTp+8s=;
        b=Qt8DySEmdu6PPELlQyiKzpQdcbWV+qsu48EQic9VlYKqzQtZ+eKvFUZX4HReptUykz
         P6eatqmZ6wr1rtcsvSCJvFsWaCfHs1a9Kz92SmTrSeizuIYWoue/DjIJ5qWBQkeWlX2C
         n4GKjKrQIiQNcD7MQKIzD+fOwpoRtyimANsH2K91vY/kUFZuU3Tx9QjG/p98UIPd5eEP
         iu7lkEfn7uwJ2dbyBVaQX/2PcyxmHbpmAKOXfJVQjXZndi2i+YuXE30V8N5f79nNEWaN
         grPACXeUlU4hTtoPbLxtZ4Wq6JkhVwqAofmGq7qPUcST//WLTrjLiGgZ2QE96LE735Fk
         syiA==
X-Gm-Message-State: AOAM530JdC7WYmniXx/OiaNI5XcfUM0GvMo0LcjOv0V7tz61Ur24FQad
	AaNWPNOLkrTAwDuucKeYM9lpvVco7cCOuHOG
X-Google-Smtp-Source: 
 ABdhPJxZnr3nB+pzOQL2F0zQ+paNloV8xddHAyRiMOvLYPZYGZQbIiL3n0fMTyCaVuTXnscBFqZtbQ==
X-Received: by 2002:a05:6512:b28:b0:44a:9b62:3212 with SMTP id
 w40-20020a0565120b2800b0044a9b623212mr19544379lfu.320.1649623225640;
        Sun, 10 Apr 2022 13:40:25 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0044a211622aesm3109021lfe.282.2022.04.10.13.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-portalocker: update to 2.4.0
Date: Sun, 10 Apr 2022 22:40:23 +0200
Message-Id: <20220410204023.4043165-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96508

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...thon3-portalocker_2.3.2.bb => python3-portalocker_2.4.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.3.2.bb => python3-portalocker_2.4.0.bb} (66%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.4.0.bb
similarity index 66%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.4.0.bb
index 2d23017c8..e3b55a7ea 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.4.0.bb
@@ -4,8 +4,7 @@ LICENSE = "PSF-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9273424c73af966635d66eb53487e14"
 
-SRC_URI[md5sum] = "bd4908d035464aa440dd7f262ef78345"
-SRC_URI[sha256sum] = "75cfe02f702737f1726d83e04eedfa0bda2cc5b974b1ceafb8d6b42377efbd5f"
+SRC_URI[sha256sum] = "a648ad761b8ea27370cb5915350122cd807b820d2193ed5c9cc28f163df637f4"
 
 inherit pypi setuptools3
 
-- 
2.25.1


