Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431DECD11DB
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 10:17:31 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.48318.1711361849590961566
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 03:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MqR04xPX;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso3102594b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711361848; x=1711966648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPRtArUQ33+r0tPGNNVggNlBGvJzSDFUqhYHVhTwduk=;
        b=MqR04xPXehbLQI14g2ZC8C0QZbroC8RIbkbnLJe5Q6cfC9Mcx/3ijNvhkBHxVquzfn
         e861J6T2oB63/qfJwcIv0Y0dBysxrOPYvYAdrhAInbXgYKmBtUo18qgXnrAEHx9cbfv5
         1tLYxXescIz9GkUjnxBVR5pvaHuF0x9BEm5Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361848; x=1711966648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPRtArUQ33+r0tPGNNVggNlBGvJzSDFUqhYHVhTwduk=;
        b=ctc8LICfDPV0fzGjyOLKpk8yIfpkHx8gpEKqHznoJslqRUMIjdz49F2uwiRvM+X/Z0
         AYSKr7JRSpbgzCJhFrY4jCllaLwTfp5WrgyW6VR4F7RUI1R0XzjJfCpPpQkBSJ8Y7h9o
         Af5Hv1KfTxgCdV4S6c3TjpfSzQvKpUpEsL6z+UKJEoDQkdeWs2ULe28POkjQm7nEPXX0
         BiwPXlWhFDnjVAh2vDrdBSGJ+imyTQEVs0Rx7SDrZ4zswnd8alFz3l98OD+Mi1mnXWiq
         H5Qk+7RDNSR18lyTbCxHoH9QfwGPtvO8usToq5j16Jk7RdqSyZ7J9iMaPdq1LiIqTT3R
         FXig==
X-Gm-Message-State: AOJu0Yxqex0HWqLe6klpyTSu/32r4cq26nk5H8L6xGUtnznj+MGZamcE
	LbJg1hH8w1cLhfv8B2azhDP+XSQuSeiWIu9Ho97Og2LBojjZj6CNhNvKUxSqm1O6EZ+8A15RB5z
	6
X-Google-Smtp-Source: AGHT+IGH9vRYck0riTNEsG6Nhw5An++jmLD/TpfHxZzcx02XH94+9NK301in6O8OeXNziM8kQE6Paw==
X-Received: by 2002:a05:6a20:244d:b0:1a3:c8bf:737b with SMTP id t13-20020a056a20244d00b001a3c8bf737bmr1866410pzc.46.1711361847796;
        Mon, 25 Mar 2024 03:17:27 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb1:ffb5:58d2:2c62:d37e:ba2f])
        by smtp.gmail.com with ESMTPSA id qd13-20020a17090b3ccd00b002a058159ff8sm3226955pjb.8.2024.03.25.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:17:27 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] postgresql: Update to 12.18
Date: Mon, 25 Mar 2024 15:47:17 +0530
Message-Id: <20240325101717.580147-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 10:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109573

From: Vijay Anusuri <vanusuri@mvista.com>

Minor security and bugfix release. Fixes CVE-2024-0985.

Additional information is available in the release notes:
https://www.postgresql.org/docs/release/12.18/

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../postgresql/{postgresql_12.17.bb => postgresql_12.18.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.17.bb => postgresql_12.18.bb} (51%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.18.bb
similarity index 51%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.18.bb
index e9f9f50a2..44074a233 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.18.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c31f662bb2bfb3b4187fe9a53e0ffe7c"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89afbb2d7716371015101c2b2cb4297a"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -8,4 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "93e8e1b23981d5f03c6c5763f77b28184c1ce4db7194fa466e2edb65d9c1c5f6"
+SRC_URI[sha256sum] = "4f9919725d941ce9868e07fe1ed1d3a86748599b483386547583928b74c3918a"
-- 
2.25.1


