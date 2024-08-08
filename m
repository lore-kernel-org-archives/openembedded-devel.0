Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5B2C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:23:17 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.58566.1723119788415253862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tVmOjA5l;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so1078756a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723119786; x=1723724586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+xJJfJ8gyOG9MTYssiuslSojoIsHXzq567lZFntCTU=;
        b=tVmOjA5llWOt7HdQ13rJTmDriN00zsMzcXvi9MYbUmXnvD0ZuwdpzeYJNhTIsEv38x
         ovdaREy0D7y0AOfqi1RkhVmjsWo+UM/XOb8MU2J4d0gYpDIyf0/SDEazBbKQX0T046jb
         R7pGxK40vNRc27befqSaYyh8mkuzi8E55QWSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723119786; x=1723724586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+xJJfJ8gyOG9MTYssiuslSojoIsHXzq567lZFntCTU=;
        b=BtGwa9LB6iIbFx1yKlMLY2e4t0/9F4c29ctI3E3AgRygDqG2VnAn5iQTolK8V2XjcF
         kyOzwyGEzJyxeuRt7uJBJEPTI3tk/5ktfj3j5YajwN+KnJmi1E9IoOJ+7N6t0hkvYopS
         ceX78JyfoKTrwAdM+Jd6/KJ+EsxXX7f3OVb+IqwhGJbz2JRW0AuIKzHwoOOaFMtTGDAG
         Y+NJ9FeMHKtyunUIIcqfq7B6xCrcBjoTNhUD4Aw2kc6dP3IM9QrkMlcmMcvdT0LALBMQ
         fWwYTdG1kj3vAnON/e4Tz+mwC8QSWg9gnXejm2I+Auc1TVMC9SpKt5V9Vuv+oVZwBC4n
         ErQw==
X-Gm-Message-State: AOJu0Yymd17ezbVAzCzc5tKUR3vLCSGjvX0ROgAXefdDSQOEr5GuS0bV
	u7lV7Sj6lwy84fKsu3ArYqKwGZajPGVZMY494fQ3I3sOOx1CNYgs/U6fAa8eFZl3O8JKzY5ej9G
	X
X-Google-Smtp-Source: AGHT+IE5aMsuTZmioXu372Z61FSAWtVA9oYIOx8qZDlA8v/TBgx9y0OQm84T4aSxeHQNl1sW0XcirA==
X-Received: by 2002:a17:907:f767:b0:a6f:4fc8:266b with SMTP id a640c23a62f3a-a8090c21fdemr110963666b.3.1723119786272;
        Thu, 08 Aug 2024 05:23:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec886esm736135366b.203.2024.08.08.05.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:23:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-aiohttp: Upgrade 3.10.0 -> 3.10.1
Date: Thu,  8 Aug 2024 15:22:59 +0300
Message-Id: <20240808122301.2271346-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240808122301.2271346-1-leon.anavi@konsulko.com>
References: <20240808122301.2271346-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111657

Upgrade to release 3.10.1:

- Fixed WebSocket server heartbeat timeout logic to terminate
  :py:meth:~aiohttp.ClientWebSocketResponse.receive and return
  :py:class:~aiohttp.ServerTimeoutError
- Fixed url dispatcher index not matching when a variable is
  preceded by a fixed string after a slash

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.10.0.bb => python3-aiohttp_3.10.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.0.bb => python3-aiohttp_3.10.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.1.bb
index 68494a05d..f9f007d08 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "e8dd7da2609303e3574c95b0ec9f1fd49647ef29b94701a2862cceae76382e1d"
+SRC_URI[sha256sum] = "8b0d058e4e425d3b45e8ec70d49b402f4d6b21041e674798b1f91ba027c73f28"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.39.2


