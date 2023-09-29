Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE784E7F154
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 10:48:16 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.14475.1695984493818365299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 03:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d8GB0yjT;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so1936309666b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695984492; x=1696589292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8+lsu7NMVNtUEq/txP+Vit1iQ8TDM+2MsJHgQYtpDI=;
        b=d8GB0yjTv0JnnePgUSu9DS6Bk8l10eHl1x8OwzRxCz1rcCQX1yPmkqtFtvhY3FGski
         cT9TnMUlL+bLX47vEOGPHbAwRmcY3gGXKWho+kuZ4NkG318+kDMB2loAZuUkSfFWCp9z
         rBsJHL5zVMxgXgKdiC1G1njSFf/Hrzjkt99BuUMOvMeLa2472j8em9LWCugqsXSERJKG
         KCXS1fy2mVo65zuNplORmMpisfQmBhBl2/bTSihTWug9RE/VupxzkdIKNs7rqKgUMCQe
         /0X/LUm1m1AeHkd2qF90FSbcULZxhiG4kz9Ng+sDs2qvlfrZ1dLFNKA/PAoa9eUhWytT
         4XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695984492; x=1696589292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8+lsu7NMVNtUEq/txP+Vit1iQ8TDM+2MsJHgQYtpDI=;
        b=J9gu1YGk9GP6muUx4CtsvLYkIKpFVKOWSHgD3aVKd3YHHvvX6D6Rm3faSfArpDifAW
         LAvztpJKH5Fh+qUnEPiH4FLX5wDs8uNGBHXPCRNJX7xnD/rflJCU02mkWO5QBc6vLJjC
         s100K3yM1oT3GcMn8N2Ob6pi+PZr/ti3dHndkx7gP9NgS/RYpS8t6GnZiZqJQ36bvUOv
         iCcrbVa9GdRX7kSk2pbB9aXstVgLSURmgESUf1h5LxWdkhs++S7SaRZZOqwtuIPT0VVP
         DPadnaGPwzrnkAy6REo2GtLTj+tIKUA6Ruf++BD3v6pDVehKsnlhHUJ28KkJGaE6Ton6
         kV/g==
X-Gm-Message-State: AOJu0YwdMpw4znon0YDpABSpLKaA6Wvqlj8r9RsOZV0SoQwvL8nPFxp6
	fQZCZCIVPPdizNtgFdYTby0bBEBB4fQ=
X-Google-Smtp-Source: AGHT+IF6BZDpAs9/gaF3JHjP0yMIeTCYzEXpIeP3G3mIIx1Dco0+ebmvDq5f/cNzpo3HgBDUMJ9PHg==
X-Received: by 2002:a17:907:78c1:b0:9b2:7367:a6a4 with SMTP id kv1-20020a17090778c100b009b27367a6a4mr3412744ejc.31.1695984492092;
        Fri, 29 Sep 2023 03:48:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bl19-20020a170906c25300b0099bc8db97bcsm12216081ejb.131.2023.09.29.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:48:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] mosquitto, etcd-cpp-apiv3: add missing Upstream-Status
Date: Fri, 29 Sep 2023 12:48:03 +0200
Message-ID: <20230929104808.1980075-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 10:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105234

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


