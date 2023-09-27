Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51536E82CD0
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:11:48 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.27489.1695845501946770866
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bs64fAXL;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99357737980so1502501066b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695845500; x=1696450300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8+lsu7NMVNtUEq/txP+Vit1iQ8TDM+2MsJHgQYtpDI=;
        b=Bs64fAXLn3PJnfCqTy49AuF63fwuFeSV8h8xnKmZQq4mJRH/0nbiFBFFHppIpogDhR
         NXq9ky5x2PnM++od6iZPbZD1T3nlJxqGh9/ZTII8cGE+Xhia3fAK75gCMePeveINqbY9
         xjQ3cl2CyU0XzPu8O/sYkLEW0CsyIY0LhHkksRKGLIo8tIk3M9ChVlouK17enE9tQDGw
         vYsnUnTq6Aq0EZlISQhYkTSc7vUEsyE9HujLxQZu6r/CMfCombrAQ/tYdVRCXPWWCmQn
         aNUxPyIdrVgsNJLabyhZJwL+nrj6z2CKhJwrMyGvDfSH8sKlmnK3ftQCXHKIym7P9ulA
         2g6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695845500; x=1696450300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8+lsu7NMVNtUEq/txP+Vit1iQ8TDM+2MsJHgQYtpDI=;
        b=s5G8FNBbJk1+Oj1qFoYqxIrBFhwHXmg5BM2/6xCkbhsnjzz8CU4Ur59R2m13dkPS+o
         w2YSO76DymskCa2PAQ1nPWdsDX+qu7HpwYeWMv2td+EnLIC0GAab2GBwmPi6koBr6PDX
         1YNg/fMT0kPxSPiow+4LAyLBt7NFrZQm5kbaqI/eoe96r9nP0CIk9U4RT755Mbvjw+TV
         7QCUscQAGzitDBa1mobcAbnm0VUuHwSvHZg67V1GrRcBwPqKuxBWBnCYbfuxDJ1xc+oT
         voyDCl7XXlB+0RSUtCRjdDacLvSE6Lc7PiFZSeKa0UC8+qeZvn2kyDJQ6h77hMuJlwyQ
         R42g==
X-Gm-Message-State: AOJu0YyLBcfSaRWkA3Sf4yAP4bCQpGx9PBTUGKFs4EEtUl/qdzZtXLlE
	6SWiYKiTG0LgbogADRSEZ8Fi57p1Uko=
X-Google-Smtp-Source: AGHT+IEc9pLQRU2xaSFcqQGs8d6t7SjqWa2Gzo4xryZsbW/zMK5wflPde1FSvWrUEJ0f55NT2HkQZw==
X-Received: by 2002:a17:907:c24e:b0:9ad:e21a:8389 with SMTP id tj14-20020a170907c24e00b009ade21a8389mr3242610ejc.25.1695845500140;
        Wed, 27 Sep 2023 13:11:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id pw15-20020a17090720af00b0099bca8b9a31sm9744837ejb.100.2023.09.27.13.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:11:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] mosquitto, etcd-cpp-apiv3: add missing Upstream-Status
Date: Wed, 27 Sep 2023 22:11:32 +0200
Message-ID: <20230927201136.2587713-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105203

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 ++
 meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 ++
 .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
index 3275e57e38..7374cbd26f 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets library if needed see:
 
 Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel Engberg <daniel.engberg.lists@pyret.net>
 ---
+Upstream-Status: Pending
+
  src/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
index a9e9c97b83..853f881754 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-online when starting
 
 See: https://github.com/eclipse/mosquitto/issues/2878
 ---
+Upstream-Status: Pending
+
  service/systemd/mosquitto.service.simple | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
index d1126aa05b..ce12d4270a 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
@@ -17,6 +17,8 @@ CMake is cross compiling.
 
 Signed-off-by: Clément Péron <peron.clem@gmail.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 28 ++++++++++++++++++++++++++--
  1 file changed, 26 insertions(+), 2 deletions(-)
 
-- 
2.42.0


