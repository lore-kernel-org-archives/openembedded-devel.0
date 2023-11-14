Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F82FC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 10:35:30 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.9875.1699958119746560481
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 02:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=XyJ5qtbb;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40838915cecso44239485e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 02:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699958117; x=1700562917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEcSstMHNjcf4khsze38vbB/loXdnzUoWJHutX6qdqU=;
        b=XyJ5qtbbUbktkkCVlGHQJ6jElO+Ehb1ahFB9U7OwDockMsrWAiBGPaL8Hjg7IFfD/a
         D0pM3wndBKg9v6ADbo66OWex6HhsXEbpDIlwQSfK0LeuskrZ48cALFIGkjawsAocVAf0
         eh3TJIXtyuGOQxhqSvRFh8n7aw/8W2ZDynaFxASw2sig77ExU+Fy9wyqd25UX/HaDMzz
         wJBxl4SVsl8bR6Qck6xPfOMCwtgd2GBU0d9zy4h8fOZMAhc7YkdGlw+IHkIStFvwEHEi
         Ia6zokH9zlWEciXpKL2H3ULk7rYXwx2VJyAnURmuuG2Nr/qdtfFU+X7Z+NJV+6bBxzMC
         kRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699958117; x=1700562917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEcSstMHNjcf4khsze38vbB/loXdnzUoWJHutX6qdqU=;
        b=oGNfoEAtNQSMjfFrbfAwtCU5faYX/iSdIKdijOLxf2i/OyTdHubeEKZhbZ5TY+3yqZ
         7CEBsgpMPRB5ujBicYRsUHqE2Jv/m9AJITtqnfbQdAx97FgB4RkLFUWviZCLOXVAYf/8
         hqVzLHtrghtPuSyD4uTIMNTm6Sz48brS5OSF6o/VFcR1mBcjWy6zYeuK5Or5POBfs3IE
         3FqfpMurIXIRbA2uSL34VPLEY18I8v4/oUJ35f+gVD63w55I3UizDKnLfuifapR3mnJW
         LTLASGOwYuq6oFnk6pl9UAXPmwmH1Pw1I31yJxs2FBtIqJVBtHw460VhNUHpGALxC0eL
         uBqA==
X-Gm-Message-State: AOJu0YwikaNOLPj7+ZVbpzM/kstMOhN4hM+7+kKIGnlN8KNeYj9j0+PC
	QbyLzg7Ge99idsbAvdghGDDvilNgCfiqJiKUTeQ=
X-Google-Smtp-Source: AGHT+IG36epuJkVOiB3O2YFqA1/3CZkrblAgoAqqANtG9snSqu/znPBECUNKGKXqbS9VbOcpw7O8Mw==
X-Received: by 2002:adf:f392:0:b0:32d:570b:c0a4 with SMTP id m18-20020adff392000000b0032d570bc0a4mr5257283wro.27.1699958117370;
        Tue, 14 Nov 2023 02:35:17 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p5-20020a056000018500b003232380ffd5sm7487619wrx.106.2023.11.14.02.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:35:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] emlog: ignore CVE-2022-3968 & CVE-2023-43291
Date: Tue, 14 Nov 2023 11:35:12 +0100
Message-Id: <20231114103512.3279180-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 10:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106707

CVE-2022-3968 & CVE-2023-43291 apply to the other "emlog" and can be
safely ignored.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/emlog/emlog_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index 03c895f66..6331f618f 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -32,4 +32,6 @@ CVE_STATUS_EMLOG = " \
     CVE-2019-17073 \
     CVE-2021-44584 \
     CVE-2022-1526 \
+    CVE-2022-3968 \
+    CVE-2023-43291 \
 "
-- 
2.30.2


