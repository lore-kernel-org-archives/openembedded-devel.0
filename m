Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11C5C433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:34:09 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.11436.1651502041470076489
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dsatc2Vn;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id x12so11822477pgj.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ReztLPrqSoSV4D6o1pTjt0iOxfV20SET0oR6bQKi9NM=;
        b=dsatc2VnF+WXYtQJ99cUUt+D6/SQBiLyr7oY6jvraZu9UJXiopvTf17EMkLVPU9orZ
         Qtuedgq6TDrIUvRjtyk94FJX9tlmokSh0cBJ79KNPkZoWn/wLLQwHisBnhTjx5rYd3aS
         X8fdT5nDvH/M9uF1/5QloXhmeuVrv1GjTVpcudkUGiTwEPqNL4k3dXc6WZWENGzXWZun
         wV8t3aiHqj7oCEpqget8ueG6iEBR0k6C4DI4C8k7nHQ7FGoBNcmn6HYU6FPSsKzgdlny
         oXG6f80IU/xQF5SHq8/ZWUG9PnWjoDtrnF3/QIHyswwc2iGqJUXUQiAaWpQ6ezZ8ekhj
         lrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReztLPrqSoSV4D6o1pTjt0iOxfV20SET0oR6bQKi9NM=;
        b=M5nSo8rCaTXby0KPyV3PLxSggzSsJtzxcZxrFUuQOPEj551i285RUe/VWlxDzFXfKd
         Xs99nlOQK2GHEsIkEONS9YOgqZY+BbJeACJl2/ArhqmsbSYRcl2/0BrK0vPqyiWLsrG1
         Z7RkRkYquoB+OQEhbo3SgdULv2gwJZAIJDzm0chVaE/eVHi7zYUlnet/moWpy6U99dwx
         CiJFN50EySXWCnsYokKlNVP3/lgYfS8owBS7gfjskCfT/JzondIXsGZUubAqkcFBfrmL
         pY0Y8cWbqyXogWMdCCTPDtL/T/AS4aq47YYrBaHGxkAGhEwWB0fKNxU5yP6A1U3uYshs
         DhVw==
X-Gm-Message-State: AOAM531MucoSdYhwVFcqZ9HqWOKjEaaFP7Pee0+X0S+TiS+aUGZpmbtj
	Rx7xa9v5aT4fgoLv7RNOSV5S28wgT1XbQw==
X-Google-Smtp-Source: 
 ABdhPJwV0VIhs/ABAhMV/hbFMQ8FKCbmVS4ilWJxkaZFcV3n8MTFbmORsdXDkUh7+iyMQiruqLV7Fw==
X-Received: by 2002:a63:2cc3:0:b0:39d:a9af:bc5b with SMTP id
 s186-20020a632cc3000000b0039da9afbc5bmr10214963pgs.3.1651502040634;
        Mon, 02 May 2022 07:34:00 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.33.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:33:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 07/10] packagegroup-meta-python.bb: update pkg
 group
Date: Mon,  2 May 2022 07:33:42 -0700
Message-Id: <20220502143345.1500852-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:34:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96936

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 20492e9522..bee5298058 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -209,6 +209,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-lazy-object-proxy \
     python3-libconf \
     python3-license-expression \
+    python3-ldap \
     python3-lockfile \
     python3-lorem \
     python3-lrparsing \
-- 
2.25.1


