Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EBAC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.88294.1723221146392509628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBelsrSj;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso16589195e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221144; x=1723825944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA54v7Wi9V6lErUWAeqZ2jb065qL80sKhkcuyb9bLDE=;
        b=EBelsrSjzv1/7MHMrapyBGS9KU2bD56ge4sF0VjgOJRxgF8KAUbjyHFP3p2omBtq8/
         8C48fDNa+3jE8wrPfPieeyyVFHxhlnP3gf5KxYVTFCEYHBo3n5MX5pgAEol/fCvONi9O
         jZ4utpwsWJqxYV3cWtfpDFkltWTDB6ZOgNT6zjzufXPEmP5bSrCZ/ehX+hoQJ5BZelbo
         c3YRWKl3w871rY/zEEdz3bMeoiNlzFj10ZwIz4wpldefkhWhd8J3yUZ/7NzBDXz+pflS
         i+yj9aucV75evIQSBQ1XXu6X2U5K51Sb7MXZ/7sjyjUQFyr2t9yyh+YWphni1qSM9Www
         7HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221144; x=1723825944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aA54v7Wi9V6lErUWAeqZ2jb065qL80sKhkcuyb9bLDE=;
        b=byxb2w6g5Pe3Ir8LxdmGaR493JKeYGy2LEVgew1tlkSpACPKwSKV95hIWROmvrOnav
         UQ+AcdIZz+cm+gVxq108cHxPbQ1CmTr0DfysEEKXyBu5tffZ6x+6/74K7lCDilevk6SX
         WK1BatjH/9IS2Q4TAAA7N8rwh1IVynAVGqwCTw+IsjMTY9YIRpuOYtDUFvSyfVhBIrJE
         Arg9Kut5twxUkrwT4zyA1xzGiRld/t9Y0T8miKL/Gz8nI54JK4yvO1MjhTZdsypATavU
         nAiwrYNnSDMQbscjuHiBPfDRjMTG2ug7ALPJ31lDIyok79YMwPK0PXAQbI88ilGtzY8g
         Y4Pw==
X-Gm-Message-State: AOJu0YyiYnLq3hsC7bK8iFRJEMGT9gYFbDlnJhCEFNO1pxABasSJOKte
	wS6SvLQWzgAt1FRwV/TiZYPuWSgiGd6/eTTVC5f+M6X4Yhacz48lW2GgoI+j
X-Google-Smtp-Source: AGHT+IF/KMQ8EZbYgjbflHNv7vV5uZLoxWIkUAMNXpQh/m42IiZDfidsiqLH4U7eHgCq4ODQWlF8uQ==
X-Received: by 2002:a5d:5f81:0:b0:368:6633:c550 with SMTP id ffacd0b85a97d-36d612f0e19mr1534091f8f.52.1723221144327;
        Fri, 09 Aug 2024 09:32:24 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:23 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 11/12] python3-greenlet: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:31:00 +0300
Message-Id: <20240809163101.8416-11-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111722

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- python3-greenlet was supposed to be native because of the python3-gevent build. It's python3-gevent's dependency.

Fix:

WARNING: python3-greenlet-3.0.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
index abd6c49ca..a79db0049 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
 
 SRC_URI[sha256sum] = "43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


