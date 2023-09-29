Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76515E71D58
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:11:08 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.29171.1696021867171696653
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: straka.derek@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-49ab0641e77so1814377e0c.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021866; x=1696626666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cQs0wTXkLlI1EZYu6RnzEwwWx8Jxnh4Cw8yD4unsyE=;
        b=RhFOTP7fdebGLLIXJMRAKE03ofW6HJYgzL33YDL/tPwDzcxognVpUHpOe104u0iqdw
         5doIG7Cos7gX7YR3Bten/pManDy+gqrG56P0I3sIIgmuCo5cscQb8hAH4ZvYrk96XHbb
         tRzu6Ayu/9KW4vbARoePZvXtmRchlhSYvJqDYYFj8Ty+7sqS7iTUR5Eub5TdfHGhtB2Q
         DiMc1D+iiuJywIyuttbgLB5DyP2YGYYrHck8taJZFiCZrEtUNx9UHHjJ1qrKwT/UqeVg
         wJkeRNAvh5apI0hts9V9mEhUIxBopzP021jwudRncDgfmg3CfX4/gP4u6Q6TCr04axxt
         eLEQ==
X-Gm-Message-State: AOJu0Yy8fqXgb9gXSQJ21HNQ9pTQdmeKNVp7V98Fde+07jvBaKOIfMac
	bVVShJhV7ebMDQXeqdwjsnY//ML8DpXcD43g
X-Google-Smtp-Source: AGHT+IEeMnh0O2noPd6FZckDwlAOKWuzULYbVV7s10aP3w+W6zmc3JWGAL40ZnZnSJYoO7wfPvC5pg==
X-Received: by 2002:a1f:cc41:0:b0:486:e696:c69a with SMTP id c62-20020a1fcc41000000b00486e696c69amr4826152vkg.16.1696021865572;
        Fri, 29 Sep 2023 14:11:05 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l13-20020ac84a8d000000b004181b41e793sm3859269qtq.50.2023.09.29.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:11:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-google-api-python-client: update version 2.100.0 -> 2.101.0
Date: Fri, 29 Sep 2023 21:10:52 +0000
Message-Id: <20230929211052.2127771-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105269

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...t_2.100.0.bb => python3-google-api-python-client_2.101.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.100.0.bb => python3-google-api-python-client_2.101.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.100.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.101.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.100.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.101.0.bb
index 1c6253a83..495a37444 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.100.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.101.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "eaed50efc2f8a4027dcca8fd0037f4b1b03b8093efc84ce3cb6c75bfc79a7e31"
+SRC_URI[sha256sum] = "e9620a809251174818e1fce16604006f10a9c2ac0d3d94a139cdddcd4dbea2d8"
 
 inherit pypi setuptools3
 
-- 
2.34.1


