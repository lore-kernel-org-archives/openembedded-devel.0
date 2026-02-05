Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E151BE91276
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15257.1770274804552842138
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6WnwW0J;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee07570deso4458265e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274803; x=1770879603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjE5kP7zbWCqrsHcF9D4zhC8/PTxNlo2MhAhyZzt6gE=;
        b=O6WnwW0Jtt+Ze6LuF+VosZZKl4B9pMa0L3bNygb1RowT1JVnJahRorfYCTsEqt8KOX
         /gD/5i/tX1gT5yT0ur+AWElMI6DTHa0sBqTb/uc4cPjvWmDn6BadLJGEMJwGMN1hhSR7
         hfiAZGrT4S3qMwIFB4AfU+DDqlQI6pTOn6yAzwIV2uP6CDLpM3/n0s+/p9gb3sW8832Y
         exzDKugXCNk+gQmoqPvvkJQKFq8qQRezDMtTg/DQGMI46+efTypVIQ35If19LWYcCkuX
         ui351MgDGTJ6iXVECTSFXv03Z/+8hbnHEAzUwYlJtTCRDFLysDdZK1n8LbttqcgO9F/G
         CrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274803; x=1770879603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EjE5kP7zbWCqrsHcF9D4zhC8/PTxNlo2MhAhyZzt6gE=;
        b=u/nVA3DikympHfqizV/fcrH7jr6WIM3GMTBn7/3ylUMFvIVtB5WK9BTgXRZGH5aC3Q
         3P/vU/Q2kxwE+kARLqZ2FZG62GyhFWR6OtDg3jeG1l+6KRTggOxWRmlSaR3jLaKXvxqu
         5a55bxNi4TrmSNnjiOTcdxA3WseQRKO93rVNjipCWzxZ6fSWKzyulfbRzaclcfO8e7u7
         iWqbM4WUJ1DuqNq7gmCh/XWxekX7WT6WnEVAvontGJ4zRtJlXpWKU/RFYA2O2Fjqq19M
         +MVacHKwjGPfLjO5itVPU1odIuEldBCpSeCzzRYiPyMupJfPIZMnMjAGSWI9emSn11EJ
         d2Cg==
X-Gm-Message-State: AOJu0YxXSgN4/GVlBmejVnKgH6cZg7M90oKMQ8BkwVoEHdCAhG7WqW7K
	b/vvMyQVscbE87J7WKO9QYVRRH2n1gmC4hNwQVa1wUvoDGbrduPqdaY1CbUSvQ==
X-Gm-Gg: AZuq6aKSu8MMdQ+UVCaDcF0C7IPsAHhH0mnJxsVx56z5G2V3AMqyvUsmTnNOfpGUghK
	AvCDJaqna//UG0qI5KvONyvTs+ad7RRg4esUZ4JA666YfzRXPz2nJ/zpw4K+2yvv6cDG9IZWsqt
	ghhbsU2jvql6bGLy4DMPCfV67CzePsgnWHDgCZeXTMLzoOvb1bWyQafYLTn243KWzM6nRtZM4zx
	CMBtadOJDcPwteWshVVFo3evcZCPITY7KUYVzVwfEheMcMVqJu6+KBuaUbjGYbgX4/O0onx2NUT
	7yECOZSby4VGms+LTA0s+OYMW3UT7+D3Q+ynVX+Gb4g4anuvAPvYPs5WK5zqId0RNm4bQjl+KD6
	YUPUQ9zmH63oIJltvxnGa6GFjwjh4jWVgQDbzLLe08c8eRsiDSYfOWLVU80BqQ6pL7D+q+gOwUk
	rZ7h6oBT1S
X-Received: by 2002:a05:600c:c3cd:10b0:47e:e946:3a57 with SMTP id 5b1f17b1804b1-4830e9a3c64mr56234545e9.36.1770274802828;
        Wed, 04 Feb 2026 23:00:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 09/20] python3-orjson: upgrade 3.10.17 -> 3.10.18
Date: Thu,  5 Feb 2026 07:59:44 +0100
Message-ID: <20260205065955.1267785-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124185

Changelog:
Fix incorrect escaping of the vertical tabulation character.
This was introduced in 3.10.17.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-orjson_3.10.17.bb => python3-orjson_3.10.18.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb => python3-orjson_3.10.18.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb b/meta-python/recipes-devtools/python/python3-orjson_3.10.18.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.10.18.bb
index 7db76c9415..1a8c369879 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.10.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRC_URI[sha256sum] = "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
+SRC_URI[sha256sum] = "e8da3947d92123eda795b68228cafe2724815621fe35e8e320a9e9593a4bcd53"
 
 require ${BPN}-crates.inc
 

