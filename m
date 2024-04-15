Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1C8C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 20:19:34 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.3205.1713212368128783439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 13:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MZzOPHKD;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-570097653faso2052979a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713212366; x=1713817166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlaUorQNxsnFdRW4RdImGBUg6wb1fhoneVTuEtGQlCk=;
        b=MZzOPHKDU2IDi6UdeIemRAkv5UlCiQCSlJwEBD7bBn33RuzplYrkXz6nXPi1zFWNZA
         jcE7ewp+XB24MLRDCsH6Q0VJ/2OvZXXPSrKoTshzOQSC0L9vuwLQiqfPicHwVtAp9w/S
         S0pJQVKIJ+7ki2MaMQADui2vCdk1Fx/EdP8TJeDfMRmFW/nkWpJgNwy9iclKlblO3tzR
         VYylepeM+STbkTfeQhzdHR0WuKkP+tD58Ar3lUjgDFlCfQuvycvBLFyUv+sSUuNQi0xJ
         GBxiydJWLPkT7Lw1Gw6lwNjc/C5SXrgXhlcplbZPDmBv6I/+QTgfBQnpapwdIiT8MIrh
         C4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713212366; x=1713817166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlaUorQNxsnFdRW4RdImGBUg6wb1fhoneVTuEtGQlCk=;
        b=K6kGdKEDEH7ugYcl2L308KfoWxZUtCWyI7pp4MYUK1SSlQxDkmDbAhwVE4vMqWkW69
         pd5FOCH0L38/IG8Acf4KF37mUAqWDjy/HsHj0Jws4230yUMCU1GrrGZ74Oj7cDqzS5YA
         vcbLKRN5J/eoEFgTpEhU0KvBDfZy+8dAkbR1x53c2Ik6McCvVs7JubVv2NJxXX1nw+TF
         gu9ViygBCLjul7XN7bbf8wUPgjTdaIdLn4BeVN89f7vtemcSVZ+1wWICw5TKMTxS5MNv
         LfiKj5oPzz7qgTP2f/vjyKPpiZYRiSeK0UGy5a7vShfqZ/phuUJNFzJVE9cWR09lr+V0
         OfjQ==
X-Gm-Message-State: AOJu0Yw/IsFfwOOAaS0//7EaRs3k9sAFRSvcHfuc+Nk3LswYO0kdFanJ
	AcNv+zzbyDuIz9cYNKADBuOyeLffIoffT2LvxSSNY/fVk3H2X54DnaqdQUvR
X-Google-Smtp-Source: AGHT+IE5KiK9qlsGZlmV5GbEUQu90bslQuqH2p/zJz/s6xxARdKHB+7y/VQs+GN0Xk8+bqW2U9hdGw==
X-Received: by 2002:a17:907:e91:b0:a4e:57c5:e736 with SMTP id ho17-20020a1709070e9100b00a4e57c5e736mr12392196ejc.25.1713212365755;
        Mon, 15 Apr 2024 13:19:25 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id jg25-20020a170907971900b00a4e5ab88803sm5850383ejc.183.2024.04.15.13.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:19:25 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-zeroconf: upgrade 0.131.0 -> 0.132.0
Date: Mon, 15 Apr 2024 19:49:31 +0000
Message-Id: <20240415194929.2315308-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240415194929.2315308-1-t.f.g.geelen@gmail.com>
References: <20240415194929.2315308-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 20:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109969

Python3-zeroconf specifies a pyproject.toml and uses poetry as a build tool. Adjusted recipe accordingly
---
 ...3-zeroconf_0.131.0.bb => python3-zeroconf_0.132.0.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.131.0.bb => python3-zeroconf_0.132.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.132.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.132.0.bb
index 4c7bebe76..ea8ef1cb9 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.132.0.bb
@@ -3,12 +3,13 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "90c431e99192a044a5e0217afd7ca0ca9824af93190332e6f7baf4da5375f331"
+SRC_URI[sha256sum] = "e2dddb9b8e6a9de3c43f943d8547300e6bd49b2043fd719ae830cfe0f2908a5c"
 
-inherit pypi setuptools3
+DEPENDS += "python3-cython-native"
+
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
-    python3-ifaddr \
-    python3-asyncio \
+    python3-ifaddr (>=0.1.7) \
     python3-async-timeout \
 "
-- 
2.34.1


