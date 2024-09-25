Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFA2CF9C71
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:33 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.8980.1727245472871096895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRrz5CV4;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a046d4c465so20648435ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245472; x=1727850272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ari/v5iOG1O2mtvcFqKJ7FpNP6CvBnW3QJX7HLhB428=;
        b=NRrz5CV40BKbCy+ashG1K7nFIC4YAWUvT7bqAxgOTFlkROWWCEADRvKGKT4VRljQ+a
         P0R5ezANT466gv+ywHVqx0Tn5z6jnmz8gBHo8bJYYkL5htVPIDb+V5RPJ3zEZ5Hy+qKU
         EsWvmC3YHIRiv9oi2oK8W2u5C+322ulFpGI9y9Em6S3VzyW7zXmFUngHTwXqQsK+TcDN
         R5FCpdyz7XbAoJWUexU0oOu60ccImt5USSvgXb9cEkEzkoqhnuNcUbvkYci25fFHsEuQ
         gjYZwwshsZq+OkpNPCZGS7MVvDb+NVOFBPtbYcXjZEPGQxn3fLJ0cij22DoQpmgvHyEs
         Arzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245472; x=1727850272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ari/v5iOG1O2mtvcFqKJ7FpNP6CvBnW3QJX7HLhB428=;
        b=F9YeJ/JGzDbOcCiV8nr4yeS79JqkcUX5ZdeQq6IjjnHDj3fZLUhRlfHX+TFGI2mQ9d
         GZcDcsaCGJ48M5pqpGYo0OooK9icF3MDFn5QXpQpL+/ulSrEfMiaJXHqRUJILt4Yi99f
         NOWSwwti5R9U4W9/WzhsIhA1D4kAEM8mOpdZybXXQ8+ouHV65IMtE6ju+OEnzBZ0R2St
         NP9mLdFkuRa2vP0knAxWfkhB1oX4UVpGdvozpMN69Ych23bPRzxHLhFoYpz8S8f7yabN
         sIz105h2p4le8FF5rCZ2wlmwYJpKDd2US9hOfI++UeV4UZkEDtmvRJJCZ61se4539qh3
         ShgQ==
X-Gm-Message-State: AOJu0YxBa0OHfjkCHPCzTnnj6JctOqoezQH02s6+7iTh5mnSQB28nMx7
	jLBX5nNVyMVkIClpGEkq7rKjMDTL3s7Bv5INEmEj8LFDa1WfOo7/ruP6R/tk
X-Google-Smtp-Source: AGHT+IEHxprpKIhJj3rSXjMItkegHlgJZCJLgGyzQTIzEvAxL8eMTAc0XY/S/JHwDaA/j2fLN9pURA==
X-Received: by 2002:a05:6e02:1a4b:b0:397:a41d:aa8e with SMTP id e9e14a558f8ab-3a26d5e830amr18808655ab.0.1727245471835;
        Tue, 24 Sep 2024 23:24:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/9] python3-a2wsgi: Fix ptest run
Date: Tue, 24 Sep 2024 23:24:19 -0700
Message-ID: <20240925062422.3146738-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112489

Add missing dependencies and ignore baize tests the module is not
available in OE ecosystem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest b/meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest
index 8d2017d39c..951c73a6cf 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest --automake
+pytest --automake --deselect tests/test_asgi.py::test_baize_stream_response
diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
index e65519ec31..023f227909 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
@@ -20,6 +20,7 @@ RDEPENDS:${PN}-ptest += " \
         python3-httpx \
         python3-pytest \
         python3-pytest-asyncio \
+        python3-starlette \
         python3-unittest-automake-output \
 "
 

