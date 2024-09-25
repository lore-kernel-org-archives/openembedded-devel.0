Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F531CF9C7A
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:33 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.9069.1727245469474700733
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c786BTSt;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso5661334276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245468; x=1727850268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRo2FcqTClpP2XQzKccgmJKvOqgjodXo2WlRi8iQXyY=;
        b=c786BTStIAIAbSmthZ/e3+r0YIEDX6HCX++R/oK4TwPwaB6UAxKWsLNovOoR59Edt9
         Uabfla4ifq3a26aOUoaCFcwVa7t7v7ZNQGC77xwqTa60+o70NeCjtQXBq58sVFTTyfba
         ZrgaJXwab0DslWFHPf7+uYCD0kCILriyKEQ1d0ipACRMQ/D7pV6CnloffeRdDJKD2Fzw
         xZ2UvuZWxt3+3bjIO126j3tHtCH/ksZezYcdJ0fLYeBHpm0Fiio9wqiENnZ15xICFAPJ
         7ipBSNlIY57DcElOdYybQKNzsgFtvKtZdNA26T1gUKDzYIYP5XPY68pS8Usg8+Vv5xv2
         tOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245468; x=1727850268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRo2FcqTClpP2XQzKccgmJKvOqgjodXo2WlRi8iQXyY=;
        b=P5pKuPJUBfOaSm/Pc8WShXee3UWR6j7WelyoogSfeIAcJlQdkTGuhrtXl6ysPNncHM
         Caz0PV/LVYL1KgDxE0c7Jpr38ON3HervJfwpHLKD6Q1VZmkyTGgv//SKXvEp8sja4diz
         sTHLsgpgYwJ4HQsCYcyT2vGp1+dZsaWh7UrLppp7abnv9jjkmgY95ZAkAyABVjP4AaXb
         XJhtj4fvdXblLtU6XDdn88c/bosjfw2lDNc+tJlWQzjSRwDx7jcMQ3zS/Z2OrcS8Jtn/
         QjwNzaqU1QcFGzhDNUugAvexQFpMvMGrX7sVnNmAySR31xNthq3Nr5trydD+M3r6wPzt
         vvgQ==
X-Gm-Message-State: AOJu0YxI36cJpYbjuqxsg61Guo2GRpcBx/1JCuj4bLCvvQMNWoY8zSmS
	xw/mlm2OMBZMDeCbKummXzLvhjgo8TZIYk5SPWZK+kxWVqsX3+KKy+4UuK2H
X-Google-Smtp-Source: AGHT+IHUnovpfZQexpHA3Hf/Zc4rVzMJecuUj+2DYFSYXTn4tkkXQzYhZe0a/NJwK9cgneXt9kj6Zw==
X-Received: by 2002:a05:6902:120b:b0:e1d:436c:3b4f with SMTP id 3f1490d57ef6-e24da1a46cdmr1079481276.50.1727245468399;
        Tue, 24 Sep 2024 23:24:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/9] python3-pdm-backend: Upgrade to 2.4.1 release
Date: Tue, 24 Sep 2024 23:24:16 -0700
Message-ID: <20240925062422.3146738-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112486

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ython3-pdm-backend_2.3.3.bb => python3-pdm-backend_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.3.3.bb => python3-pdm-backend_2.4.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.3.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.4.1.bb
index e78f1957a7..f2175150e8 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "a8616f628ec84353d7a0ba86b228dcf01bab5debc9e4d1a29e5311a52425d594"
+SRC_URI[sha256sum] = "d6404e94a612459c5213cc63df035711244173c57441b8312a2a6f4a8c110934"
 
 inherit pypi python_setuptools_build_meta
 

