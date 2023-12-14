Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF13C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:17:15 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.15519.1702531033226703164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7b719f05b11so249601939f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531031; x=1703135831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXNBwhLRVtV7kQzxRrIGts5VoUqYCA/t0WjTDMUicUs=;
        b=mDm2zZxLJ3OSxxWQ5eHAdjuUXyNR6KGWvuFn4Y4iB1qAmJatAMjFk3ZKbaaHEfGjEZ
         wDBEEH4qfsFHV7m2XNhgiXWIMCBv7ZTA0ijkuq3fpmyyVHv2s9XMND4sdvT/zPT5WCdG
         4Q03LpxmuW5iptVZfrMLtXXn76VWi/whfc40lUn4hgG9YxbDXmJkxNs+8/z73+ckM+4w
         Xbmv7I10wnGQFkyy83GrAmw9nU2gO8VcS3+856wULJ2SnsCDZI7BZ2uM13J/mn6KEb0j
         ZMykjy30jtXEsteGwvhdD9UKpsJwh2X2ryxeJQrgeHu1Un8l2Rp1xTpQbpJ8KnhnNHtC
         n2Qg==
X-Gm-Message-State: AOJu0YwYhDAIhRvU58pTaSrV/BUpdvpkkwpUHiHv+/dhQ6qbT47+bvKF
	Y3i9w954+g3RGykPOda9i79460d0g6Wy4A==
X-Google-Smtp-Source: AGHT+IGWgIotWUkffbl9fyxO2BZPCJd1GOTDKhAPiZzSSIp2PuRQBMnJGnlZuJj5K/O5bhl0zqxe+Q==
X-Received: by 2002:a05:6602:104:b0:7b7:3ba4:894b with SMTP id s4-20020a056602010400b007b73ba4894bmr7923789iot.15.1702531031558;
        Wed, 13 Dec 2023 21:17:11 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id d2-20020a02a482000000b004691845afb0sm3235872jam.38.2023.12.13.21.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:17:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-bandit: update to version 1.7.6
Date: Thu, 14 Dec 2023 05:16:56 +0000
Message-Id: <20231214051656.1206600-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107415

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-bandit_1.7.5.bb => python3-bandit_1.7.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.5.bb => python3-bandit_1.7.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
index ede7f92e8..3cf927e10 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197e54e0389dd59e11e"
+SRC_URI[sha256sum] = "72ce7bc9741374d96fb2f1c9a8960829885f1243ffde743de70a19cee353e8f3"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.34.1


