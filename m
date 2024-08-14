Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF22C52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 11:54:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.96048.1723636481272426713
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 04:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LVmCV6Jq;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-369f68f63b1so3778570f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 04:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723636479; x=1724241279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToV1onxbOkVWmUUN+4n8qHTVtY8/fyXJNAYFrKrq+lg=;
        b=LVmCV6JqE8X9kUtIuBmCcA/lZsb8vzuVM8Y4iX6QwnBqjoiFh2NxroK1wE3K2pUnLf
         0Om72qdGeDa9GkYs5WmHOPbRG/zagmDvWvwKwnKnQGYM0EYX9tEbJaVjhpioyJJofMLx
         l1hEK4g6Pudt8u6BjOEnBqM1ZVlO31qAK4G/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636479; x=1724241279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToV1onxbOkVWmUUN+4n8qHTVtY8/fyXJNAYFrKrq+lg=;
        b=Go6yIbmIlfg4CyY9+9qVFRLJslGhp048wQlW5Q3Y3oc+p3RAkcO3z36Ffk/83/L+7O
         xEvFXGozxNvwGr7f/DO5zRATegRXwxU/00096UCexk37tWa7ySK461mbsynxl8GAm/EF
         C4LmJdMMpwsJeZopLVUMqVQ7WQNfd1SPu+vFr7JQM3VDO+++/TnqgqkAesq2XgRbvLcK
         C18hODBVKd9g/hNpNRRfAku2QZIGiE3llQU1HebgNMpjdMjjipgd1P1O4aLbd5K8DMJT
         up85dqUwPaC0tRWaL0ugL6UE4JvUrO95Oi+ynLREKjkzQkuG1OuSEP1LSIjyNOJ6yqB0
         TVMQ==
X-Gm-Message-State: AOJu0Yy3RAZSsY7QM8Y60lTOBoXAxskLmc2/foWXWecV7S6041zijoUv
	EMqJGnf+Ce/NKFszbaTVewgQgYr+JXRRKnvpNVx23Q42NYK+CQFFfUAhw+FimxKjrX49KMemw2c
	A
X-Google-Smtp-Source: AGHT+IHEP4+Bj4xIkUSDpdXyM3dVogcudqctYcoCrKE+K0qigEMihh7V66i38xMQHCKfjctCdEFx5A==
X-Received: by 2002:adf:fc11:0:b0:368:31c7:19d3 with SMTP id ffacd0b85a97d-3717774a3e8mr1925837f8f.9.1723636479469;
        Wed, 14 Aug 2024 04:54:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfeeb09sm12700620f8f.51.2024.08.14.04.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:54:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-fastjsonschema: Upgrade 2.18.0 -> 2.20.0
Date: Wed, 14 Aug 2024 14:54:35 +0300
Message-Id: <20240814115435.808089-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240814115435.808089-1-leon.anavi@konsulko.com>
References: <20240814115435.808089-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 11:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111803

Upgrade to release 2.20.0. Added validations at compile time:

- required must have unique items
- checking if schema is not allowing required items (item is
  required, but is not listed in properties)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...jsonschema_2.18.0.bb => python3-fastjsonschema_2.20.0.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.18.0.bb => python3-fastjsonschema_2.20.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
index b2e969c5c..0524a73b6 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
@@ -6,15 +6,12 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRCREV = "756540088687cda351390f687b92e602feaa7dc6"
-PYPI_SRC_URI = "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
+SRC_URI[sha256sum] = "3d48fc5300ee96f5d116f10fe6f28d938e6008f59a6a025c2649475b87f76a23"
 
 SRC_URI += "file://run-ptest"
 
 inherit ptest pypi setuptools3
 
-S = "${WORKDIR}/git"
-
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-- 
2.39.2


