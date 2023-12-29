Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B499C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 17:13:09 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.153577.1703869987800642404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 09:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7ba8c218fe1so364383139f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 09:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703869986; x=1704474786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBAtsXgxGmuYpavBhspqX5Guko0FFaOuLCu2waZ6U98=;
        b=JZU3fVeWm6a3C2sRlFQNrqVq6dtXZ+UWQeXX0cN00YJ2QECqBM0PBx6X6klbeg1vbd
         dIlQULcqSLaSNIUHqnPWyyPUM11KYi2uptN2suBO7oH1K7//29qxZ7lcG6dzx+q3vRyy
         iRG+h4e4cGiAcFgjZ7Z/UifKeAyO8LNe1ZVVKs4zMMVKxql3xzuvNV/YEADg8ozrDsmc
         AgyBYTE4uvbHG8yN9uxPnPlIat+70gCx+B7o+bG67anXA2mEXvKIHJoWj0DZVKs6sRnc
         Sevz1rcXI/0Smx+azJbD2RaweNDIu7cRWr/3hpUuW58dhCQDTzIVL+St6m37N40WZiFF
         AnjQ==
X-Gm-Message-State: AOJu0Yxm2QCzy+VfzcHrBE9x75ccPqysqxsX9sZrqwVR+h1WQbXqnHRv
	3CKsGpTRxYoa7Gf1dfT4pYTcXe5hhHt5nA==
X-Google-Smtp-Source: AGHT+IHFt7eNQW7Jii4/sHZ02J6+8yWfMwzwuHp86t9IsK8VGev0uMgsWJSBXl4bnWO860hoXh5BvA==
X-Received: by 2002:a6b:d90a:0:b0:7ba:73e8:5edd with SMTP id r10-20020a6bd90a000000b007ba73e85eddmr9784593ioc.32.1703869985977;
        Fri, 29 Dec 2023 09:13:05 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k2-20020a023502000000b0046d45e51709sm2418381jaa.35.2023.12.29.09.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 09:13:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-dominate: update to version 2.9.1
Date: Fri, 29 Dec 2023 17:12:35 +0000
Message-Id: <20231229171235.2649336-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 17:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107880

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-dominate_2.9.0.bb => python3-dominate_2.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.9.0.bb => python3-dominate_2.9.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dominate_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
index 2234e541b..3bd9d8754 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[sha256sum] = "b15791ebea432218543a1702d76ae45d2ff95ff994e52014b8686a69dad772fd"
+SRC_URI[sha256sum] = "558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31d19dc4"
 
 inherit pypi ptest python_setuptools_build_meta
 
-- 
2.34.1


