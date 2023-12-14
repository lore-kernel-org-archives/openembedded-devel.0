Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A748C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:14:05 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.15440.1702530838270789369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b783ee485eso52438439f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702530836; x=1703135636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPiZa+xfBILJdUl5vkfQzre6I/1owVcg/V4Gb2dLkHc=;
        b=DOfHFDSAeOW1NFvi6t336opnbfMdotavVxJPXuWD6xUReRSzz5AH89cQXVPvP4uccE
         XlmCBersCdtIYL7gy1+H46lh31E/IEmO5lQFXZzxLwxcDbZFntkZbRR7Uz6QO/gWVUjU
         WfgzBHi4rKHeMQCWNAVimArdIOYPNiknCn7DWZbEcxBwvHXWTUOWgr/ToA6MVfxpI+ud
         +QNbT5m61zvDE4J9qk4r0gAI2fSAPTYXk6E5ml+oHGmeIAcsro8NzM2cPvfyfRYggEdx
         MbI7JApM60i4Yh7TyEVKe0WCwAUzaueWRsT/c0FcrqNNnzoYn58NyIUEAVJ4pDjUe5pf
         9m3g==
X-Gm-Message-State: AOJu0YwkvWbEU+zmfVyqAkr+qtuQi6cRbmo8e3eHLpkWg7S9ylYOrPLP
	ArDjYo2QC+4ZCATa5Wsi7VzVy+k1j475rQ==
X-Google-Smtp-Source: AGHT+IHTeER8JEL4hk7JPxVOHy1qPaEBX7rV+KTAPe5DZ5JLJeTrAgSRg6sf3Vz/TEELmaL9bUJPtw==
X-Received: by 2002:a92:ca07:0:b0:35e:6bde:d139 with SMTP id j7-20020a92ca07000000b0035e6bded139mr8635930ils.95.1702530836493;
        Wed, 13 Dec 2023 21:13:56 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k4-20020a02a704000000b004690cd4cedfsm3353578jam.40.2023.12.13.21.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:13:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pymongo: update version to 4.6.1
Date: Thu, 14 Dec 2023 05:13:43 +0000
Message-Id: <20231214051343.1192287-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107414

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pymongo_4.6.0.bb => python3-pymongo_4.6.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.6.0.bb => python3-pymongo_4.6.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
index 18e29a17b..2704637d3 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "fb1c56d891f9e34303c451998ef62ba52659648bb0d75b03c5e4ac223a3342c2"
+SRC_URI[sha256sum] = "31dab1f3e1d0cdd57e8df01b645f52d43cc1b653ed3afd535d2891f4fc4f9712"
 
 inherit pypi setuptools3
 
-- 
2.34.1


