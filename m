Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892ABC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:51 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.4257.1634338550609444532
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=IGi2RimA;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id y26so47867325lfa.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x7AUkAJDff85s8BqDI0j/ooe8e8q6Kz4Lkpkr27ZBy4=;
        b=IGi2RimA4v6kkgJSlEto3kyp1LOukACCU0gYDJUpNNC/xfTiaBr9hFmDOFXgl+gdPW
         Dk+jH5D/6B/FF6ftPDxfQzFrQVDUFR5B+etRmDdGUtXH5JNjVqYIPo1YYM283+/nuFCc
         hZNU7u7z30vkvHEYMQlr81DmVIX8BRW9LcjJ7bEFK/8sE2HaWuGRBrnswDrkImIRb3Df
         rDXpWF1USSgYgBcLGuZ6axlC/6RezKvs2HISNVnZWasiTiGj6+HEXa2qDXgLqmhJmCng
         yHNEpqF9WhfHM2tGJNK3SRbgqiY/6kyv5jT1Y2vfwZrtZDDk7oRekzfQsrPTvPwUCkAR
         B/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x7AUkAJDff85s8BqDI0j/ooe8e8q6Kz4Lkpkr27ZBy4=;
        b=MyHXpI7sL3LIaYEc36uQhSEfPWm1mTUt6m8wFvPeKLB/HegnB7tYgO4VguDb3I6Aht
         QxLWCLoO9QxDPHKHss4+Raff82o2KDiA8nNMxOj6dUmddV2Ck+tQ0GKIiwi+yzy5+a7F
         34zpqDr1M+8cjqLjmlzKWV3TB1xSh8n8d/5zPHCyWHRTb8YAQyL9xyprdZvulg007pon
         dcdnFzFeLlSjExPIEXTJ4c5hxkipzw2q3TTZaFLLkfoFK4k6+1740rMspsn8MV2P53mX
         9aBmLy9BIoDf8XnWSuG13BKQFbgwyQOKh8bNekkojEUBDx/mIbZGk7mkzJPNcSpR34ry
         efSQ==
X-Gm-Message-State: AOAM5300m8PxdsV37CtmY9wSd17yBUHI6v0VZv4gQFOCi4t8whHSQCvl
	1HdQt9B10DlW0/OUuISViR5AcRPzCBL96UFE
X-Google-Smtp-Source: 
 ABdhPJzq9TVR+AF8UZClTBVfUR2Fq9y5O+m5xnKhqyOfIvb4M9EROMf4AoOGFtoYYB4yW3uwzumvEA==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr13687126lfq.553.1634338548670;
        Fri, 15 Oct 2021 15:55:48 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 w16sm397070lfu.51.2021.10.15.15.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-wrapt: update to 1.13.2
Date: Sat, 16 Oct 2021 00:55:42 +0200
Message-Id: <20211015225542.4161798-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93339

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-wrapt_1.12.1.bb => python3-wrapt_1.13.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.12.1.bb => python3-wrapt_1.13.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.13.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.13.2.bb
index 22457d9c8..b1710fcd1 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.13.2.bb
@@ -4,8 +4,7 @@ LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
 
-SRC_URI[md5sum] = "6d56ed0de4336462a73350341462f45e"
-SRC_URI[sha256sum] = "b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
+SRC_URI[sha256sum] = "dca56cc5963a5fd7c2aa8607017753f534ee514e09103a6c55d2db70b50e7447"
 
 inherit pypi setuptools3 
 
-- 
2.25.1


