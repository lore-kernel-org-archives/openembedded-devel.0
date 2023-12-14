Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A424C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 04:53:45 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.15252.1702529617652423206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 20:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b783ee485eso51923739f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 20:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702529616; x=1703134416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swXvEJlNYuuJrGguupPfhlJ3kfoRAR+X6N8WzF1oG7g=;
        b=Gv6viLerbI+iCViCSd95/Mr2kPN3xcrqcgG7ctnDDXNtSFm6l+coc4P9J2qvbcSJWL
         25Py/iM++FlNuAsQXtZ1ukvAtBtMbon5qDzI9BzN2XWgLM0GQ2W04NnpJBmzvKUcO/ZY
         ODq2aWy3p6Kc7T5wK6RoKfmCDS0P7cYDEmzKiwAYZ7RwPk4IUxwNWqyyCVD3ca/eoqL0
         Q5DjyuP+AYdd4BexFb4BIEFz5UBYueAxrNaFvUprjZfS3gdoWINcty5reBQe4lUfg6PG
         McLI0MhmMTSH4nh2iLsgZyqDkYS2FLRoZv87h8/3qFXmIb7jGRpHAbRC1Q7eSezw63rs
         bbxg==
X-Gm-Message-State: AOJu0Yx+InqVk+3ZGlvjMLTtDcQzQDPkr0vDYejPtmeJzlzxfM0rgVvB
	EXd4NshjmVJKCwlkj1m7ZJn2t+Uc1dmucw==
X-Google-Smtp-Source: AGHT+IEWQFmOhzFR8ssw4g0u8GCUCsRk78JT0xTjicw8v6IvJsUUXzAWFkK6feftxz8ISvKq9w05oQ==
X-Received: by 2002:a5d:8247:0:b0:7b7:4b32:7984 with SMTP id n7-20020a5d8247000000b007b74b327984mr4744559ioo.21.1702529615910;
        Wed, 13 Dec 2023 20:53:35 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id v25-20020a5ed719000000b007b39670c070sm3589215iom.52.2023.12.13.20.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 20:53:35 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-tox: update to version 4.11.4
Date: Thu, 14 Dec 2023 04:53:17 +0000
Message-Id: <20231214045317.1187049-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 04:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107409

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-tox_4.11.3.bb => python3-tox_4.11.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.11.3.bb => python3-tox_4.11.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.11.3.bb b/meta-python/recipes-devtools/python/python3-tox_4.11.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.11.3.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.11.4.bb
index be42c4b6f..62c15a7db 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.11.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "5039f68276461fae6a9452a3b2c7295798f00a0e92edcd9a3b78ba1a73577951"
+SRC_URI[sha256sum] = "73a7240778fabf305aeb05ab8ea26e575e042ab5a18d71d0ed13e343a51d6ce1"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


