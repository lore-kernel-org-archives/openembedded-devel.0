Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0731C04FED
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 19:13:39 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.4568.1695237212801262726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 12:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-41205469f4eso667721cf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 12:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695237211; x=1695842011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ecre1FgzmLEyKVkMA372oz75IdrogiwfpyQyTVHftPM=;
        b=uGsPOiljlWLlpbyFLYJUZghaMGO384y41q1JOaL4SobbYYpMbLHILOsykmCGZiDHMM
         7QP12r6dkeqOUo7A8zR1YCUfpMlESv3YdqFZcEHsO/10LGr7UulnpqnDwlRSGj+EB9xm
         7v18fw0bE3gadmso18TqpJyPVbFjLuZrZFypW137S3ivBH9K7ZHHjARVhbzCEN/33G43
         gY/ZI4yWPdBe3EFlfqHxq2W5LxTA5r5ud+MU55+hBxEjc9HpzrD9X0ww8McPz3nyzHnc
         w7SoYx2/7sXe4S234p9+Wgwa1v149VG7gsUos0RhKzFd8AVk59tENXjY6wV3qezPWtzu
         T3dg==
X-Gm-Message-State: AOJu0YzgqDQ5//ZQ300pjvA//vTzx140xd4z0K2wyM7Rx0CEFtUMTpO5
	pETJVN1zes4PruL3onYasqs2lkLIfM5mjA==
X-Google-Smtp-Source: AGHT+IHDv2KrW2Qcmeh49fwuejOTc10JONbDhxOT1wsuFd5Bn0oFlw0K6xdPpeTg4xI3wCg1REH5YQ==
X-Received: by 2002:a05:622a:14c8:b0:400:a6f4:7a1e with SMTP id u8-20020a05622a14c800b00400a6f47a1emr8596645qtx.24.1695237211288;
        Wed, 20 Sep 2023 12:13:31 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id b11-20020ac8678b000000b003fde3d63d22sm4747877qtp.69.2023.09.20.12.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 12:13:30 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-filelock: Update version 3.12.0 -> 3.12.4
Date: Wed, 20 Sep 2023 19:13:03 +0000
Message-Id: <20230920191303.1343212-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 19:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105026

Remove incorrect/deprevated URI for upstream version checking

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...python3-filelock_3.12.0.bb => python3-filelock_3.12.4.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.12.0.bb => python3-filelock_3.12.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.12.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-filelock_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb
index 8deca31b5..49a9d956a 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb
@@ -6,10 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "fc03ae43288c013d2ea83c8597001b1129db351aad9c57fe2409327916b8e718"
-
-UPSTREAM_CHECK_URI = "https://pypi.org/project/lockfile/"
-UPSTREAM_CHECK_REGEX = "/lockfile/(?P<pver>(\d+[\.\-_]*)+)"
+SRC_URI[sha256sum] = "2e6f249f1f3654291606e046b09f1fd5eac39b360664c27f5aad072012f8bcbd"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


