Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2540CD11BF
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:31 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.52051.1711373251233601301
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WoaRFtVv;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: jhatnedap@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3688b3e915cso3779945ab.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711373250; x=1711978050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mXrxItA/OzMnYULpLU0gh6647ZYpQ4+pBUrMhzIRQS0=;
        b=WoaRFtVvNtYGJwlRduoE62zu6gU1aHoccBs1JaCtaTSzDv2iobj/2eU6LkGawyH2+a
         /+4ZJ6nBkwtl5MubjDspVGcSfTg7agMvgxGoA7La3lqvaj7YNXXx8QG6vBOU/0HEMSg9
         MEnO00yXCQKglK+vIuZY5tYQAcKWWEgFXe1jt5aNLmWc01ccj/67ofEJ9HPXEydlTWUZ
         Ji68lZy9LJaJWiNMOkIdDecQG30+zP6uh5vXY/ftdWy9jISQzxJeH2q55zTzMcsYFQi2
         TSi8o6Hvr4nkjqjJfOqdXUnXaAjyjy/1vvB9B/BY7JmE+oNo6SgWHJ3K8bg0jNzEdqcN
         VzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373250; x=1711978050;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXrxItA/OzMnYULpLU0gh6647ZYpQ4+pBUrMhzIRQS0=;
        b=LiAMOOcOch0Yv/4tvdV0YKMEmWv0EhAbfgPXa3GL9dE/3bvkxhN9QcNhEpGu1F1752
         t5i6HY2XfmJT+SNaXouCKA18m2I6DCQsLZ6Q9iUHvIlZJfvAiZGjdoGapxTWs7W7Bxe6
         WitbtcxqURwQg3BT7VRUanUKyc1A6BAih802/6k/jXRAVRUxxVr4m9LIredLFPtB2Sua
         efHei79ueHmki3oo4cNEzMHQm5rnxeHdngmzEhoJGvr3ldWfLbrq1rtY9AGqPKE6h1oG
         VTMhyfjGrU9sEjaBYPQRAen6ToxEUXlebkHa+q74e7FZAF/ZYoIhKJSGMr0rsD5r3OX2
         dnRQ==
X-Gm-Message-State: AOJu0YznPqIyWQbWNX2F8k4NNoh0LSK8ii0inMiZAyoQlGPfZk7qhLly
	Li7LEQaSLe/UYgKftXFFLBIX7upAvQGRAxJf2l5bw1ybVowaYo2HqC1yIh4C
X-Google-Smtp-Source: AGHT+IG8eV0+S59LKg/DwkGD63mMyehs2fxeiBHYvI0qEKcDO0di8h3VhMvMLkm7m1MDLDnsGzr9NA==
X-Received: by 2002:a05:6e02:1c26:b0:368:96d2:7cdc with SMTP id m6-20020a056e021c2600b0036896d27cdcmr1568300ilh.10.1711373250453;
        Mon, 25 Mar 2024 06:27:30 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q4-20020a056e02106400b0036862333c77sm2390379ilj.33.2024.03.25.06.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:27:30 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 6/7] avalon-framework: Update SRC_URI
Date: Mon, 25 Mar 2024 14:26:01 +0100
Message-ID: <20240325132603.2477-6-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240325132603.2477-1-jermain.horsman@nedap.com>
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109584

From: Jermain Horsman <jermain.horsman@nedap.com>

Archive layout seems to have changed.

Also update all SRC_URIs to use https.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
index 081cfe7..c6d8374 100644
--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 PR = "r1"
 
 SRC_URI = " \
-	   http://archive.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
-	   http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
+	   https://archive.apache.org/dist/excalibur/excalibur-framework/source/${BP}-src.tar.gz;name=archive \
+	   https://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	  "
 
 inherit java-library
-- 
2.43.0.windows.1


