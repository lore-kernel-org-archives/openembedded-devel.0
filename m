Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86533C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:09:26 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.2364.1706904556387525953
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78405c9a152so161763985a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706904554; x=1707509354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLrL4KsXpbtB+3/9IEywnvpmoYC7M/iCgzNp4gf/GP0=;
        b=mhfpZgM3L9QfLVICBrtPxesJLkW8BbKb9tlULyHRvnm9Tnx+xS1JcJ7GLaT8J9oRVX
         LNamnitBOmT8/ktWrI3SF19gZM4HUkeqDYkPAyyW1OJcXktbDFKIeTmZbIr0LUQX76Za
         33NnM0wjxsFa1lI+9KVC0jtljsmcQ5ibukk4ZdV5+wvrqbgzUkAv4JWrZw18kYEf5vUS
         qvh2d3WHsnx/rErEXwR6rNjebzJp8oiJCWwaaWrVV36QgxtMPJogmsZGAN49TYWPkKv6
         iVa2nJvACBPguzjoLsNZMFvZHvHHt2tylDpAgnQFoK9fJdxn1IggVNhTe5sMfWt7KdyS
         1iGg==
X-Gm-Message-State: AOJu0YwSh1mHXnC2c5D4s8SYX3PaFxNo9fbKyu8c8ItNMzZ0ItCjQgc9
	5c2+LlpthGev0v+32PhSz4Gl1G+UDkI+gOHZspJLw5wPd9Aj9op+h1NSHiOcWFRpMg==
X-Google-Smtp-Source: AGHT+IH31Eh+lhtqz1DxrB1tfalsL/ezfIBzvy9pNTHyut7Ik+42YT5/5yBW0xOCu6ITxxFO77/bJQ==
X-Received: by 2002:ad4:5cca:0:b0:686:1c06:4659 with SMTP id iu10-20020ad45cca000000b006861c064659mr10752551qvb.40.1706904554555;
        Fri, 02 Feb 2024 12:09:14 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ny6-20020a056214398600b00681785c95e0sm1109758qvb.46.2024.02.02.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:09:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/3] python3-google-auth: update to version 2.27.0
Date: Fri,  2 Feb 2024 20:09:01 +0000
Message-Id: <20240202200901.1570392-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202200901.1570392-1-derek@asterius.io>
References: <20240202200901.1570392-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108541

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hon3-google-auth_2.26.2.bb => python3-google-auth_2.27.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.26.2.bb => python3-google-auth_2.27.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.26.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.26.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
index 9bd0926ca..45098e662 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "97327dbbf58cccb58fc5a1712bba403ae76668e64814eb30f7316f7e27126b81"
+SRC_URI[sha256sum] = "e863a56ccc2d8efa83df7a80272601e43487fa9a728a376205c86c26aaefa821"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


