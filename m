Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868EFC46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 22:44:11 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.6938.1703198648473945178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 14:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b7f6097355so46464339f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 14:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703198647; x=1703803447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fu0/GwOwwbM7ob+0gzPSrzr+OG3sXjIuq9nezWcg3+E=;
        b=EKqzGgIomngHBkvIK7FsyVeGwOP0qAJbVQXYbxEoSFpETZnh7TaokN6bcO1qYssFND
         rap0ekM80/uVvfwrLw8Z12sbjz+sopxlJbo51OYzLwZQBTENo8xCVod+TfiDP2Cp8oP7
         Bv7e6iT7i7P78rnkSrmU46e/36ceR2t1YL80juejhho3CSfC9eOSKU4M4hQZ9tLApjin
         4CR9ZvEukvpD/n1oWR3WDBPzscw+N6g4wI10Q4SNZaOw8vmiBkiQZvzR1btYXWuLRBhB
         bZBkg3Z5R8CMIoCfitdFy0zlquicgyU93ST8/3YprWX2bhOO9M30tD+e699FkYh7TRQ+
         Qudw==
X-Gm-Message-State: AOJu0YzXskurZlbR26zH7cxolWpLvfJnJNE5EIshgsWBw3x0vmcqXjSz
	oyUzpSa5YCZjM5qAO5/04OPcdI7vP6OQfg==
X-Google-Smtp-Source: AGHT+IEuIF8Yf+yfSNle0WT/izs8lHA2IlBq4cu2vDSj3YLMpfLKliSHMfWPu4qLPk6TCkCjNw+R1Q==
X-Received: by 2002:a05:6602:158f:b0:7ba:961c:b3e9 with SMTP id e15-20020a056602158f00b007ba961cb3e9mr676946iow.13.1703198646725;
        Thu, 21 Dec 2023 14:44:06 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id e13-20020a02a78d000000b004665c64c356sm732388jaj.144.2023.12.21.14.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:44:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-mypy: update to version 1.8.0
Date: Thu, 21 Dec 2023 22:43:59 +0000
Message-Id: <20231221224359.3939073-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107738

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-mypy_1.7.1.bb => python3-mypy_1.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.7.1.bb => python3-mypy_1.8.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.7.1.bb b/meta-python/recipes-devtools/python/python3-mypy_1.8.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.8.0.bb
index 90301f3cc..2e6c7cc07 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "fcb6d9afb1b6208b4c712af0dafdc650f518836065df0d4fb1d800f5d6773db2"
+SRC_URI[sha256sum] = "6ff8b244d7085a0b425b56d327b480c3b29cafbd2eff27316a004f9a7391ae07"
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


