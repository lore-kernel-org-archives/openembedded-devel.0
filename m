Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44755C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 07:06:49 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7717.1678345601044439829
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 23:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=htTWBwkQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id s11so3122121edy.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 23:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678345599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJFTkQqK3zAOgUT8jaI/9SmcHayylqZwzKooD/JwPFo=;
        b=htTWBwkQMhuEkDbODnBMjwFI6XUJpZxeulUR/83ePW9BcCvAUAMS2X6KGj6ENmtv+u
         M3I9J9AnBbkJYY0pgNkus1kMo83Jw5TSbcHGS2M2hcKNrwGv0hOpKJlkZMsT+rkouWuU
         E50DVxggBE3fDTD6ILPSkEx6dfVXZE1QuNb4jkPeg63cj86waiXWotsEBxMr6DbXRqZY
         ugAEWeZSf4s6hNFylZWLUPbOEEiT3WLr3nHBsfCn0U4FLv7JkDug6NcFNBKvm3W+7CIH
         MTGPMsS34CfBxTbC0cAVB2Wa6ET/rZ67OwArjw6RcieH/wp2sEe+cePzAw49JTxFcqIT
         1/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678345599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJFTkQqK3zAOgUT8jaI/9SmcHayylqZwzKooD/JwPFo=;
        b=t0CS97AKJdWfG9Tuc3xQymcUOtkgQOhHWW+vlJUlywMZBzFXrkHVJyrPVWI/pxVWcq
         /OtWNYj2ceg1UmhTENSR/1YfDFyZtH8DALLfJ51+cd0yvNLoyLaDLFVz/+rPMck/Ndi1
         5oAT/YCU1MP8smJ6+XcKLKq+6GgsXxTWqjHrHJ9m1KWJrqqMahXOceLo4sriWSCz7Avv
         sdch5of6mDVSFJTEW+q3yH4mRnqrOkdtoZ83YYqykBzahAxlx3EoClSYrZhgdXRa4+8m
         6jU+eYiFSl2pYTwXItBDBkdgmpGzT+C5D7/DbrHWfUk8YwAnnHpgggBQlYUiqlePQ1mE
         2C7w==
X-Gm-Message-State: AO0yUKXUcBJsnEXjc5Xc5i4f6DMpKtEBUa1feO/JZ1a9Kh3Ftf1vOimu
	+3f9D/+BBWJhvmY5SAi7LLirrW6GApAlDg==
X-Google-Smtp-Source: AK7set+yf7gPGtpcMmX/90FCkDQidiTHFI7g23lEEOw0KqnJ52hjNvOM7/jjkaCcyoWIn1OyHx6k6A==
X-Received: by 2002:a17:906:730d:b0:8b1:3193:4874 with SMTP id di13-20020a170906730d00b008b131934874mr26272599ejc.46.1678345598883;
        Wed, 08 Mar 2023 23:06:38 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id gj14-20020a170906e10e00b008df7d2e122dsm8368802ejb.45.2023.03.08.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:06:38 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-java][PATCH] conf/layer.conf: Add mickledore support
Date: Thu,  9 Mar 2023 08:06:34 +0100
Message-Id: <20230309070634.2164792-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 07:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101434

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index bf592de..be0ddd8 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-java = "kirkstone langdale mickledore"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.39.2


