Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F7BC83030
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.35163.1751274794890034422
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qHgfufnf;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso3133548a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751274793; x=1751879593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWbFRuaJ41PFjbxX8y9e6IhMjGVvUa9dJmut4pGabw8=;
        b=qHgfufnfKf5w8WU6YDC+IaiKLOCSXTRyZzQfq5hmzh7oHVIjQps+19js13pXUM1lRD
         tFCcFQPz9pL477v3XsqzoFN5t1RMNfrXVwunNDZArly4SHWjAfcSmqRIWycDUtJC/Dz/
         qjLXvPkf+NRNL3UOXsrk3PvkHf0+fp9xVtVe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274793; x=1751879593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWbFRuaJ41PFjbxX8y9e6IhMjGVvUa9dJmut4pGabw8=;
        b=pglyyckP7V661RYv+AJNdG/+mfdUWv0udDjNycNfKKLmfQ7ojvmKCwNPaL1/UXCb/4
         2GJEtaNiMTZ+AsjKwFTXBVFAcJpeAY7Ir5/pMggpEP3AxQ3Q4CJ+6kTeRqOX+fF/0H0b
         T8KuON/43chsEWqV4rj0CLEk8sgttF0ZTt6iDQciUSvqh29+7aW+UVIKf4ZqevF+fD0C
         2fCSqfqvV6jOtz8WbRligr+GJHIcnRbTt9h51BsRp7+TtTGaCfBGLJjsENZTl/3o7RJS
         BUKiJkfg5wBJyp1O53V655JQo7QTOQxzbfgoZ4/8VFLNiLU8yyiBXnADNqBvkLoKQWTU
         yupA==
X-Gm-Message-State: AOJu0YweW+WsVDdpc2vNJVGOZc1+gP+3ma+WIl/biRXbezm+Y4ZZ+dTP
	4PcjzTUCZQtT18rMqElFCcimTOjaXHxKeEi7J/BJB3z56x+T01aDbC4wtVnDpNO+Bmm6D4bFutr
	hUz7M
X-Gm-Gg: ASbGncs3pRSTRS/bq+E+vcSFBq2jajC54aVKsC0bqb9Dx2sTEniR5qe9lyS6yBAl+Bv
	wTFuy/6d2hfHpc82Q/4LzdOYZP1j7IJmYlo6tQLtXR6NoJNEhuhozTXbfNzRlp6C6R8p444i60K
	MOjP1YWfFs8UDi2hfX//u+2evLU1Xva95XNKdKZ2UU6MGBlaYdp8k00PrvrBzCgigc9GyyPOxII
	VE7B430xl6018f8cY5ZMqSh0A6ovDMiIfKU2hIbScuda6eHdMA/BUrwZD5pvTso+uv1aBrCoZHO
	c5gyqcBPMhtrJ5vEQzR5tlgOIe2Gv2Wbf8oNrjwwWkoWFweLe1HHNJYTXXx+CW7rPFRYRwQ0cyP
	Z
X-Google-Smtp-Source: AGHT+IEUiT8KZzK2PbT5rfwmeL7xGwds4nQAy8Lb1xxIqet77fbd/nuHOeL28tHqWfnd8+eme6Lyuw==
X-Received: by 2002:a05:6402:1e8e:b0:60c:403c:ab77 with SMTP id 4fb4d7f45d1cf-60c88e7307emr10148271a12.19.1751274792891;
        Mon, 30 Jun 2025 02:13:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290eaefsm5478268a12.34.2025.06.30.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:13:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-cmd2: Upgrade 2.6.1 -> 2.6.2
Date: Mon, 30 Jun 2025 12:13:08 +0300
Message-Id: <20250630091310.3785059-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118168

Upgrade to release 2.6.2:

- Added explicit support for free-threaded versions of Python,
  starting with version 3.14
- Restored code to set a parser's prog value in the with_argparser
  decorator. This is to preserve backward compatibility in the cmd2
  2.0 family. This functionality will be removed in cmd2 3.0.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.6.1.bb => python3-cmd2_2.6.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.6.1.bb => python3-cmd2_2.6.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.6.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.6.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.6.2.bb
index 4cb8305fb5..a4b98860a8 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.6.2.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=26efe44f9946f43292f90070d9d5590c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "650a5892bf29b233d3d6775b5e3cc813648cff0d79134f707981f66baaed9f42"
+SRC_URI[sha256sum] = "bde128c0b6dba9d2d9179a1c7c8fe92ab930473d0ddf46f2bc19cb789f942e4d"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.39.5


