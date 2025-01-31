Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB689C0218A
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:17 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.10330.1738287609994904993
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e173ed85bso771790a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287608; x=1738892408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PO2yMYYCAEFtafn7GC8yOyAnN+xxGx7RQUA9B2dzrtI=;
        b=Lpa5IAioGtL41MnJMBB2o7tp8/+TJnCMKXX7IfIMyvWBKvf1im58jIKudTAWE0ZZnq
         i3hfCUetSdGPkwzlGUK8ixrDveZJpIRZqM8AUDVcDM43ewxVgEJFDqUFJUC8NtrA/A9h
         uFbMv3hc126WdouZLhDkfVpjjt7POCElvxHhSebOFrTLlfGNTnQCEl4H3am401F192hC
         RMrXyA+micR3U4N8Eb/aOmVdJWoyoVfJem94vkZMjAOE1jBEtq/9LiMp86G4ZufmbTHH
         Ncvp6dLx8VdXztonS3uSZa9xzgzocej2JIaCZrYXYrRQP9sS3A1UAbgCkqbgtT89JTjg
         wtaQ==
X-Gm-Message-State: AOJu0YxbomwN6nkD0rZegXRh3IMBSkV9AiHxCad7jR4dX4TriRwop2yn
	LOAwbzGAu07KedgPDJKp+gVPOFw9IEmbt8WNWHsjfKrGwwala5UMQvDM4mXv
X-Gm-Gg: ASbGncszGH1fz8EMrT+nhewUm5HmN9/hHQeIKrxYG+OHNzWzLvkJpEz/pNVixBrpcJH
	gpbgGzBeW43z08l/7/5HuiC1LfZOL48ZBnulxlT8J9wVlfbn4i4WJ05orNGM1x7DLzRsh9x5gwr
	4RCwJEAbRWrlQcw1oCq+VaH3qKRj7l/IVo5tb97GyJ9Rh74LM0nEFBmpep9fwlb9FFDvFuzxdgI
	4UtexID9ee38HFD2FVjFTfxcFbXEnrNUfDJ8LR7ahgOH3RtsuZpGmV4Nb3UYOFsUwALJI/hjf7O
	TVSUps28KO1J0RmanUzEgBVpdfxyuOIRixTpDmYyrkz0KUu7K6ZoXI85dnok
X-Google-Smtp-Source: AGHT+IH5Q4tl53KPaBzn1paD71dZ2W/ZkGsyteJRC3BjcYb6FT7FbuLFFGgxbgJdsZNNqxzRD80c1A==
X-Received: by 2002:a05:6830:6788:b0:71d:4ec6:8600 with SMTP id 46e09a7af769-72656778fe7mr7083896a34.13.1738287608479;
        Thu, 30 Jan 2025 17:40:08 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:40:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/11] python3-inotify: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:33 +0000
Message-Id: <20250131013935.3714521-9-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115186

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-inotify/run-ptest                |  3 ---
 .../recipes-devtools/python/python3-inotify_git.bb  | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-inotify/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-ptest b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-inotify/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b/meta-python/recipes-devtools/python/python3-inotify_git.bb
index 582599bca8..f7df716654 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -8,26 +8,15 @@ SRC_URI[sha256sum] = "974a623a338482b62e16d4eb705fb863ed33ec178680fc3e96ccdf0df6
 SRC_URI = " \
     git://github.com/dsoprea/pyinotify.git;branch=master;protocol=https \
     file://new-test-inotify.patch \
-    file://run-ptest \
 "
 
 SRCREV = "9be6a51d1660991562eefaaddefa757ca0e0e00f"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools3 ptest
+inherit setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
     python3-logging \
 "
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


