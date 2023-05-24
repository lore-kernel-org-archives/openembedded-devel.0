Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA86CC7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:23 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.3706.1684914794003175077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GqXiBjLj;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-96f6e83e12fso80306566b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914792; x=1687506792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Dmz0xkyNOkvYnpWpL+CSsvbZiP2GFZhAlCn0q5MTUA=;
        b=GqXiBjLjGXqHMBTPPuDA5j+NSuTtteSXpazbU4QSaDCEsv1pgqGPGQyM33zyKUzHX3
         H8yN13W8ZddI2Mu70+uNaT9wEah8mCcCYP/MbwqNGPpp5opLxmcqib+cmo6IMyVtbZwi
         AqkzlDoJMmJewMdioiBo3Uo47CPMvl9CuRJeCeTa81rm5PfhKPK3/mEPEraFpQ6CUm6t
         cpMjMUcNMz9nAQBhV5COg2b11DXYvF9TvYEM4wHsisBU4rgR5Op+sOTrNAjtMY0hbYRA
         sswd9nQbRBoGQ2R6HLV4bAjKSlBzw7DhkmDYOGm7Cgn8XEApFHRQw2oAY1DxC6Pei69y
         vNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914792; x=1687506792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Dmz0xkyNOkvYnpWpL+CSsvbZiP2GFZhAlCn0q5MTUA=;
        b=Hfpp2ZBy//FYcdi1s8am5BOrSZvh8nCH/HAEHJ3smJvEGZaX63POF3ITnMSlXN4xlZ
         9ZVp4YdwUDzIqsaytyHCWboEJD/zhs565H+b/ySf4d9jSjbRNMNZCigDUgCkpYuAqhSJ
         v766nmYkC3CG7/0PEz95lvxVgqIXdTZr3HydHnGDuh1q0npMr0gBSbJy4cp8HDuCdDiA
         IztIyWE/7P5BpeJpyriHTr0D8bi9FQjvSJ5hbMuFJcmNyCMz9bF4O5o/Q+K9iwGSeohI
         yS7CDSMtgobv7oNRxyvHQEtGk5i0PPow2lgPgDOYDYqq/3ZkSPAfnYkfrAJSO76Om9kq
         0aGg==
X-Gm-Message-State: AC+VfDy5bQs5uEkLCUqSzYuM//gWMLuKFwnXSErm1+blo0XjdTGDmgzH
	aQw9BnrQ/j5GIPlxwdgMYP80564B70s=
X-Google-Smtp-Source: ACHHUZ7GhgSX60HYd2qyD0XShdwJvjkTX4nMbdRWb7eRzrMWGqAOGn7nI1f0ctbxgdqdPp38tAp42A==
X-Received: by 2002:a17:907:970c:b0:96b:e92:4feb with SMTP id jg12-20020a170907970c00b0096b0e924febmr17859841ejc.60.1684914792457;
        Wed, 24 May 2023 00:53:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v21-20020a170906339500b0096efd44dbffsm5448809eja.105.2023.05.24.00.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 16/20] paho-mqtt-c: remove unused patch file
Date: Wed, 24 May 2023 09:52:49 +0200
Message-Id: <20230524075253.1033593-16-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102770

* it was added in:
  https://git.openembedded.org/meta-openembedded/commit/?id=4d43e788f2c835948ebeb0180a5c1aaa09e8b3b5
  but never used it seems

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../paho-mqtt-c/files/makefile.patch          | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch b/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
deleted file mode 100644
index a31bfaa749..0000000000
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Disable building some things we don't need
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
- Makefile |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 33bd2d0..84262bd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -115,7 +115,8 @@ LDFLAGS_AS = -shared -Wl,-soname,lib${MQTTLIB_AS}.so.${MAJOR_VERSION} -lpthread
- 
- all: build
- 	
--build: | mkdir ${MQTTLIB_C_TARGET} ${MQTTLIB_CS_TARGET} ${MQTTLIB_A_TARGET} ${MQTTLIB_AS_TARGET} ${MQTTVERSION_TARGET} ${SYNC_SAMPLES} ${ASYNC_SAMPLES} ${SYNC_TESTS} ${SYNC_SSL_TESTS} ${ASYNC_TESTS} ${ASYNC_SSL_TESTS}
-+build: | mkdir ${MQTTLIB_C_TARGET} ${MQTTLIB_CS_TARGET} ${MQTTLIB_A_TARGET} ${MQTTLIB_AS_TARGET}
-+#${MQTTVERSION_TARGET} ${SYNC_SAMPLES} ${ASYNC_SAMPLES} ${SYNC_TESTS} ${SYNC_SSL_TESTS} ${ASYNC_TESTS} ${ASYNC_SSL_TESTS}
- 
- clean:
- 	rm -rf ${blddir}/*
--- 
-- 
2.40.1


