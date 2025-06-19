Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968E5C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 18:13:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.173.1750356775406094916
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 11:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eeGyepJi;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso1618627a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 11:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750356773; x=1750961573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVUfHvZ0T77u0t+3s423LxQGr1GWoJ05e2FYJIitjvA=;
        b=eeGyepJiXrtBJc2Xs1SQuSWeqtsSdPE7JBH57QJXCP3QCmZGUSGjiJrf6hXZalH0bZ
         XYqPXhJ6hozTgKJ/ApsEXUSwzCz0ICzDXMbGiszAJZ9jGaRzdJhB482HIGmRQUn6Wrk0
         TsbI7WNQsdOqk2XfQTye0bJSYvq7+qC2L+s8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356773; x=1750961573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVUfHvZ0T77u0t+3s423LxQGr1GWoJ05e2FYJIitjvA=;
        b=qGEi3wyZj9yBdteWxaVzr5hcSAOICOBs85ef5emOyAKbV5cQZU2rVQZtVXWplDjPf4
         i2VqDFkN8ch07Narx6mFZkBVkETSS8LbNYovKF2yxDrkrcpvRVwHDaNOlToiHSk0uPs/
         8tVKIoTYOufbrZt81kese2KhJMf+UJoTfQvQjZCaTwMlSor/Xcx0QQhltFrf5CV4ZDPw
         meoKDYwQn9xTZ5f8VPH6ioaEeIRnE02oS3Qg17fWm+MqOXzTWVXsPKfc3XNl0VZ9SFhi
         4Q8Ob7wCMjfJd2rxNtpW0rpPIzMqoW5IjKmp7MYesQJw9A2OadNkbzdww5Ah1YempsBg
         QCCA==
X-Gm-Message-State: AOJu0YzSwkGpUFNX5g/aXQXFm6VPShdHkgVASCoapVt0A2giumx0G2Rq
	E/cCl2afH0Aw2LuxK91boX6bqo7EdYzXxeLvNf/bsN/KQQqS41fPLok7a7LDc3baRdghkXEKG5M
	q5d+o
X-Gm-Gg: ASbGncu7SbBKHU44nywZEAeBY1gNPVyy6ZdxP7OMGjlGL5S3PfWWNX6LeNMbEkI8sUf
	eJkj1bPuOzyI/FaG0ILvPu36g0uh+ngu0lModCN3PXRcIv49lSCsTOZK0kHLlwrzWOy1lLspWsD
	5TV0scuwLgU2N/XxN38kChxRQpsSLZimpvxXEkPT5/1ZB9T19WJWvp4qH8fhfn+T3G0n41C3UD/
	5go9xwTaLq/q3At+I45aGxsrI00R0hDkFWNWNBK7tdEVO1t0X74KG3Y4e9YB/XUak8haP9LIUfk
	q92iWoT/vKV0BMKxwBCIE4vg41cD8FUBT2rTTCLocei3qHNg98UDOUKWKl0PGJUv8ZX3G0yt66K
	J
X-Google-Smtp-Source: AGHT+IHUv/fzsnxWKegCL7niM19KQXwci5b8mENwNKoWMuCucKCLLxZwed7YoTdxifRlbbyf3ikcsA==
X-Received: by 2002:a17:907:da6:b0:ad8:9b5d:2c38 with SMTP id a640c23a62f3a-adfad355fc9mr2125399766b.26.1750356773413;
        Thu, 19 Jun 2025 11:12:53 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e80862sm26048466b.35.2025.06.19.11.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:12:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-multidict: Upgrade 6.4.4 -> 6.5.0
Date: Thu, 19 Jun 2025 21:12:49 +0300
Message-Id: <20250619181249.4090191-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619181249.4090191-1-leon.anavi@konsulko.com>
References: <20250619181249.4090191-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 18:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117955

Upgrade to release 6.5.0:

- Replace internal implementation from an array of items to hash
  table. algorithmic complexity for lookups is switched from O(N)
  to O(1).
- Builds have been added for arm64 Windows wheels and the
  reusable-build-wheel.yml template has been modified to allow for
  an os value (windows-11-arm) which does not end with the -latest
  postfix.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-multidict_6.4.4.bb => python3-multidict_6.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.4.4.bb => python3-multidict_6.5.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb b/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
index da8403af40..7b34169105 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "e77793a006e8c27ee96ae8b638a38c6413f87b9c"
+SRCREV = "df5b5dbb6e3e262b9311755cf130c669e121eb81"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.39.5


