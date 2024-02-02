Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A0FC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 17:16:18 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.786.1706894171780251923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 09:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-785515724b5so58334085a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 09:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706894170; x=1707498970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzTEvInGFEUs1Y/sHb5kquCjX4m+nua5BY4Gwg1/Vig=;
        b=by7v3ujW/UvV461FQvu/knQCrXYE9gr8VxJMq7/X13O8/SOyukwtxQZHJbshtLtaxa
         Oj+B20VBd9ymx7IisVBctEa6aoK1quPXKjEe1a+4h2yWYHmR8/RuwUVtE/0NSh5Pj0Tg
         Stz19XrWAJUvMX16/ZSm4WXyrlIFf4xwzGiLRNzrcj+8Js5OPg2O3woYVypnxK6Didf4
         EA0x8uOkhLnwyxUYDP/X8H4Qy1kOxVYjsOz+piRWU7setp4P293tApE2gNCOwh3Jrqra
         1Wa8tOurjGztLiy5aAytlO+N8FyFfUgCOWcTe65S+rfF516GL9d0tFFf7tmc06x2Ev6R
         Y+fQ==
X-Gm-Message-State: AOJu0Yy5VShv+l0E8k6Y4w2oc0A4ZB8MuyO5mSxab6FoAMHVIu7HHKF5
	OQXHn5xfCznGSIkCacodwjy1PfgyGeTwrJ0KutX5R2TT1RHbTzl8XH6g/h7FBTS2Xw==
X-Google-Smtp-Source: AGHT+IGRhuA4Ujgd3ulaUrJGcNy61y5518O88LRED0nugNmsc0ox1aRwxSvC+yONgqAVppvD2kjZjQ==
X-Received: by 2002:a37:c24c:0:b0:785:3f73:5f30 with SMTP id j12-20020a37c24c000000b007853f735f30mr2980477qkm.33.1706894169858;
        Fri, 02 Feb 2024 09:16:09 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k20-20020a05620a07f400b007840bab5897sm823136qkk.111.2024.02.02.09.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 09:16:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pdm: update to version 2.12.3
Date: Fri,  2 Feb 2024 17:16:00 +0000
Message-Id: <20240202171600.1450470-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 17:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108530

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pdm_2.12.2.bb => python3-pdm_2.12.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.12.2.bb => python3-pdm_2.12.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.12.2.bb b/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.12.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
index b0849d13b..3361bb833 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "b3ca4ab107ad65b57fe1312e4360e1f7b3d7c5ed81a841b6ed48b3777862ed57"
+SRC_URI[sha256sum] = "53cdab727c1469fdc196efd8d7ff8404a3ca91ee43c0a5714736f2020d0a5ddf"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


