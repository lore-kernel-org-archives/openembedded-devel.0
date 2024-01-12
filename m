Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15596C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:09:46 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.7341.1705097383587106263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3608e1d27ceso21545435ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097382; x=1705702182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dwKwv9ds64CjuKYGsLlTKi5zVBlImfjgOZcRWxXzbA=;
        b=xCLfQoQtQnK1cvFadOb669LTnQ1LeKizaqB9iFWakiJQriE+8Z97GHhXwg1ZFndiJr
         meurG8nfCfmqHwyMuXTHMG6OmqreLTxhIHYQwqDbzPgpVltuGwmoXa4WcYZvENhnn2S8
         ILtA2PJR4O9w72rNPp8svErlBbHtleTMtTC3zxrSd9K4XMxn3f3IsluU0OCPqErtquOg
         nvfY2h5bQhPtnJGHZsktpUix27Ptuh1LXxkIreguusLTYtcL0n/FY6+c6RIzcMIHLT7f
         x5BIQWGmEvCingBZZMfUzP99h5KYYl54Z62F6CO2NdP/YM+f76br8df0WiYhnDfUP7cz
         Grfg==
X-Gm-Message-State: AOJu0YwYwpctvghVmBaabRrtxx7fdWRcNnAWJgHJlyNaCj600/WfMZpz
	lVEzXdVW1g+uG9SVA/PSwUUN00GjcYyBgg==
X-Google-Smtp-Source: AGHT+IGCqRkCh3L7JX5g+1Tt4QfXKgsK8t0UEdSJCgtv5//0UgG1hPTExCZ8HafiSUS4G5wiOewWyQ==
X-Received: by 2002:a92:d784:0:b0:360:5cd9:a73e with SMTP id d4-20020a92d784000000b003605cd9a73emr1919695iln.6.1705097381940;
        Fri, 12 Jan 2024 14:09:41 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l9-20020a056e0212e900b0035f72c470adsm1201270iln.15.2024.01.12.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:09:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-protobuf: update to version 4.25.1
Date: Fri, 12 Jan 2024 22:09:35 +0000
Message-Id: <20240112220935.3035070-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108257

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-protobuf_4.25.1.bb => python3-protobuf_4.25.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.25.1.bb => python3-protobuf_4.25.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.25.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
index 3c770e41d..5333d306b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "57d65074b4f5baa4ab5da1605c02be90ac20c8b40fb137d6a8df9f416b0d0ce2"
+SRC_URI[sha256sum] = "fe599e175cb347efc8ee524bcd4b902d11f7262c0e569ececcb89995c15f0a5e"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


