Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8460CC369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 23:07:44 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.15995.1746296783793452698
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 May 2025 11:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BD2pKdPA;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af5085f7861so2230077a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746296782; x=1746901582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThfwuSIbrTf0dmyo7sX3LXsgdF+bUSPafkBo493CBng=;
        b=BD2pKdPAXvq1xT64hkKX/L8vec5afgrBsYg6JNDNP0hX1ZyNMyLoWN4Dqaer8yDL9T
         pPm7fwDumTz3PBGb7yn/6anEKe1XeW6+vLDdXrwlULjRpRfbL/36CA+4aUVEA5EqpYyw
         vm3eacJTFKwWNcmm/10JJ+rfQ6v81LcCHJtHKzKpQ0aZJ4CYCUS7oZNFkcD8I55jqj0w
         ARXFYtF5g2AHTpzDYH1WaGmhlTKGZLHH3LqgfatEk5/iuZkH92Kb0+srbsps5GB3zS+z
         e2beSjRnz9qB/PZmWFzjDIn+zsfem0tIShMG1lPOeA6l9hQMeWVXJj9Ri86KZNxTwOMk
         quEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746296782; x=1746901582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThfwuSIbrTf0dmyo7sX3LXsgdF+bUSPafkBo493CBng=;
        b=FFhVEz3vcXwjDAFa/IGNb+bFBQRM1Bmbnkq7aXyut/fW2lAxOrZbo51IUrB9gBCTCk
         kzbbLWIlOob26gUEm7lCg6732YvWQEdCL3segchpz+JpgTRdFbw1L2pXZKRbgeyoWaoc
         psYsHP8sno7jnUu2n1pZF+AEzPQW9BznVSmOZzcpskUP1jk7JYqVdUF0mbQJrbrnxMaN
         huaNiEEpVZKdCCDNV1N5MzGZmgPSg34NK1qk2HiPzVIVHTWD7ou4Rp6NdGmf6IrgAxND
         Wtozl56dRF0OSpndOp3yMrIWqT4GFJtppqkizG/zXWGzb2LtXwvAkQjsMON7IAyAy11P
         /wQA==
X-Gm-Message-State: AOJu0Yznf6ccZMpkqQbPlBFwA/gZkG5WGMlaW0wrqRx+nrOAKcrfkI3O
	EQosGXJP4OUrbGJLEb17l/hjTXNc5Xo4VZrdvpirAjx9NIUihYeWIoegUg==
X-Gm-Gg: ASbGncscV1QHdJjQjyVKkKoHaZ9q2BlcyOM9H55+tEijVqkCA/RLPL07XXOrSkTSpF/
	44wRqRbTUQRWcBpXZTvAAj3VTSJSRpu0wxap/3XghWYp1IYL1Hh0osiI8P7INwEbPtKRiJawDWN
	4q00agItBfDwmI6H7Fb5JvhTgbn/LHgy2cmGlTFSRYw1vTCAB3BgjyD6Co4KykXecJaOAYBDsq6
	eUVji47fZvWEYcRa7hT6LNWam9j8zaA4hl1GCWMeodruif50HWOJnyUNg+leD3KNnQCDg4rxHcM
	QbodsUfCV74xFkXDRiWH6vGQcE/oaQzGZpovfBj8pdo7Jt65ZGyZKTELL1c+U7e+uWR5Nuo3l9h
	evjWh
X-Google-Smtp-Source: AGHT+IGAFn1H7RLMxDyWS2TFNWzpHU51DxXAtgNnUYEsghsN4Vc10Ig1pmmZDYQoBAQnXWtkYfP1zA==
X-Received: by 2002:a17:903:186:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22e1ea60302mr29695335ad.40.1746296781526;
        Sat, 03 May 2025 11:26:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228f9csm26837745ad.178.2025.05.03.11.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 11:26:21 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
Date: Sun,  4 May 2025 01:26:09 +0700
Message-ID: <20250503182609.2224178-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 23:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117287

- Move "libsimplelog" to "recipes-support".

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_1.0.6.bb                          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/{recipes-libsimplelog => recipes-support}/libsimplelog/libsimplelog_1.0.6.bb (95%)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
similarity index 95%
rename from meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
index 0aacbcd2cc..c159492aac 100644
--- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
-SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v1.0.6"
 
 SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
 
-- 
2.47.1


