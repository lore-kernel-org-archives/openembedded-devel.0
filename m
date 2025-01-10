Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434C6E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:58:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.25863.1736531900410691678
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=n3BWQNbB;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361c705434so17651365e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 09:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736531898; x=1737136698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQmqMn4lWR5H6wKdWOxnx1Ve+J48tLe3/K9T36PZVDQ=;
        b=n3BWQNbBxIYf9vszDWY+lRrcZseL9cN3gr8ltk2dEYe49iY126Zje2+xjZWzyN5H/8
         YnJRLPuXj8/WVkBRLuI4tIAnX6PV0k3oAFlRt3vHfowIk5Xmv0WFHulGFWFmcd2AEaQ3
         puRenho7LAmTkWZqacoWviepfjBdGeeaiGmZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531898; x=1737136698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQmqMn4lWR5H6wKdWOxnx1Ve+J48tLe3/K9T36PZVDQ=;
        b=XX8mlk7AE/OSrfgFmSRVXrYLLHVNBTHWFUpg7CK/1hs9SYcBdz6Gdxza+I4/6taN2G
         1oxu6z7yxWklZnvN0+kAGqUGmntVn6iJwacKqeGmw4SP1fV7ugNqY3QTCOFBVcEIZjG9
         Ptn4SbDT3oAYmLCNEJ2x4o0+9GapHYLCqNrnBPAbliYc5Dr0Wn3GyAgZcY3HNxvPcvXc
         X+t6Futsn2uoBxaWdFrvQCUA7Mo2ql0NGcqzmptLF+jHcbmnD7ChD1mAwCb3qLUTfj2S
         88XQ7Yo0pD742flbCWVMGjTYKm0faweGQP4spIW09ZpXAjasOD/7Ul18xER7Iz2jK0YE
         wgzQ==
X-Gm-Message-State: AOJu0YxMZHsy3VBCqxZAJBNfTv+KULWkQ+R/iJ6LPR5qpOqPCXRWPA2a
	biGg5vod3kDgSUSsCIIlfYSF+oQWs7CkyBg7NS15zNZK3jcMLFwKBbeIRjtO1ON2YdO4xyy88eG
	J
X-Gm-Gg: ASbGncsJCg8rR5jFfDCbPkyEQkOEcQ6ONkB3pyYduKTZHy5gnM7jeQtQXKjT0w3XI9O
	HNGpUj8Y4P5nBKMWGJUOjddDDE/lAO6FblBqICpzimbz22jYiLpN/41l6h8cmTCJHYSJKktLal+
	J7/qWD8BeeNpa+bUv3nVyi+XltejDAnHdwsqwD2iiCgOHBgFuE1xgD2ZakxdFZ6Nwg7/bsMQLu6
	QdPLuehU5HARL+EJqfAoMJm+Ml7kqlIUNSo74OUPle77gkSfzrx2V+Ff8ByHjXDZHug800=
X-Google-Smtp-Source: AGHT+IH4jRzt2JnTstmrSyU44hU+VMtutnAY2V2wgLifbR1kxKFskoI4UbjRHkfjV6aQVh3KJ8WMyA==
X-Received: by 2002:a05:600c:510a:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-436e2696db5mr115461985e9.11.1736531898460;
        Fri, 10 Jan 2025 09:58:18 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8bea5sm93116095e9.31.2025.01.10.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:58:18 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-icecream: Upgrade 2.1.3 -> 2.1.4
Date: Fri, 10 Jan 2025 19:58:12 +0200
Message-Id: <20250110175814.3601819-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 17:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114785

Upgrade to release 2.1.4:

- Changed: Drop support for all Python versions prior to Python
  3.8, now long past EOL. Notably, Python 2 is no longer
  supported.
- Changed: Update the 'executing' dependency to >= v2.1.0 to
  improve source code analysis and support Python 3.13.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-icecream_2.1.3.bb => python3-icecream_2.1.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icecream_2.1.3.bb => python3-icecream_2.1.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb b/meta-python/recipes-devtools/python/python3-icecream_2.1.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-icecream_2.1.4.bb
index ec3a4b90f1..e417564fa9 100644
--- a/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gruns/icecream"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eca5ce1610d64ed40920efdce85ff8d1"
 
-SRC_URI[sha256sum] = "0aa4a7c3374ec36153a1d08f81e3080e83d8ac1eefd97d2f4fe9544e8f9b49de"
+SRC_URI[sha256sum] = "58755e58397d5350a76f25976dee7b607f5febb3c6e1cddfe6b1951896e91573"
 
 inherit pypi setuptools3
 
-- 
2.39.5


