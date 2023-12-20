Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB07EC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 23:11:04 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.34755.1703113854630127002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 15:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b6fc484b77so6190239f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703113853; x=1703718653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVCBbrPDK5XckkAkqf4DA3w57cbLPBVqwYA9fM81bLY=;
        b=JSATxm68LEWytbIg2FKDjDpafF11OvlV7aKuznCjyrZAZ1Qz9jxvj6vS88Sqh/9QZB
         B9JfGmF9eS+yEOpiaxxxFbWI5dhvnudKoEV1oUEi/GMJqadTmE9dERwN2BlAfiYaHbFO
         Z+/DDNziDEHJ5ZIj4vEyWmBZJ9Gp9kErPmUl1enh1E0sqjNI+n3u65Jbsi0NOQCk2QRx
         ebVS/rX57Pnj+WL/KaEO3rzBZhuQA3ZjRxDoU+nMOOv7tkFSDyQcImHMZ96MPzkey1i8
         eK5X9XzDqX54F+y/61glbZ8ap2I4JksMh3VgdRQ4HFkR4Q9sr7awWKI0LFHAijQc6r/s
         12Bg==
X-Gm-Message-State: AOJu0YxP5j29hW7QYLX4aPvph4erBTeOxpoX9QIGB4oSOlvedYwJOTD+
	y1ztASogqrd+7lu5Bf3ZBeROPsaLstfpOA==
X-Google-Smtp-Source: AGHT+IG2jQXO669zHuXuKPFiIG87uM27oGzCUsRspdYYkbv2GMOwW3P1bae28+o0lu75pMnRf12rvA==
X-Received: by 2002:a05:6602:2561:b0:7ba:81af:a20b with SMTP id dj1-20020a056602256100b007ba81afa20bmr490003iob.17.1703113853027;
        Wed, 20 Dec 2023 15:10:53 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id z26-20020a6be21a000000b007b3e44dc200sm152613ioc.42.2023.12.20.15.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:10:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-xmlschema: update to version 2.5.1
Date: Wed, 20 Dec 2023 23:10:44 +0000
Message-Id: <20231220231044.3836750-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 23:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107690

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-xmlschema_2.3.1.bb => python3-xmlschema_2.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.3.1.bb => python3-xmlschema_2.5.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.3.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.5.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.5.1.bb
index 9be7cb555..19fae9131 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "2eb426c5710833a05610c22c8766713a1b87e9405e3eca0b7c658375bf7ec810"
+SRC_URI[sha256sum] = "4f7497de6c8b6dc2c28ad7b9ed6e21d186f4afe248a5bea4f54eedab4da44083"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


