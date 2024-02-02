Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9B9C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:41:36 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.3237.1706906487381377414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-363b37b6799so2413365ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706906486; x=1707511286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gq4R2TyBfx9RHMydRqfr7XqiMp0OUKNqhJg71b6eTl0=;
        b=SeS03X8em97hezO2Y4jCKBb49VFYwWBMOD6664oluNCebm73B/mo7zNJk5S+6F0iNb
         XaMp5mKbZErdry0xENemKqRbMQFXvTBbD/oCHqXWRmC0b9nk8E4M+5oCP3dB6Lvx8sDw
         /3sxHYNiSNSr1l47fe0cQtaxSgnOlDVPSzDYn7WqdgVrJEdzshr6cN6ZL+CTJzOZzRqv
         Rg14idCU9cSyN6Sc4IVk03CUDv7fsb1fxM+UBXyO0Onx9ZRCvUKatE9KDLw2hCIOt35a
         dXfMUYbgEgPsn1vciSHv7QQd3h9LJVTcR6KovORHjt5OV8WGHlGVxDZyq7DoAojIBjHF
         i8sA==
X-Gm-Message-State: AOJu0Yx/Gtq3H5jVjS9EB0tv78IptDZ1/i580EJVvzcl84voupS8lSYM
	89DTmZfIa5DGIjwA774mXjhHTUmsFJGVNBMfVo7vbvv7hz5WkdzgeqELPMKriLtw0w==
X-Google-Smtp-Source: AGHT+IEG+wunOTsMoksNZnYSzaKPsIBGLUjU/GXglYmSF2YpbKuSWpFBCxTmxPTlnfgB6TSyPBGwNA==
X-Received: by 2002:a05:6e02:1c88:b0:363:a7dd:a04d with SMTP id w8-20020a056e021c8800b00363a7dda04dmr202731ill.14.1706906485781;
        Fri, 02 Feb 2024 12:41:25 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id v15-20020a92d24f000000b0036385c93e5esm795484ilg.56.2024.02.02.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:41:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-dnspython: update to version 2.5.0
Date: Fri,  2 Feb 2024 20:41:18 +0000
Message-Id: <20240202204118.1580244-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108545

Update inherits to use hatchling

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-dnspython_2.4.2.bb => python3-dnspython_2.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.4.2.bb => python3-dnspython_2.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.4.2.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
index 1ebd2aa94..6b7212b9b 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "8dcfae8c7460a2f84b4072e26f1c9f4101ca20c071649cb7c34e8b6a93d58984"
+SRC_URI[sha256sum] = "a0034815a59ba9ae888946be7ccca8f7c157b286f8455b379c692efb51022a15"
 
-inherit pypi python_poetry_core ptest
+inherit pypi python_hatchling ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.34.1


