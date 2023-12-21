Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DEEC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 16:57:11 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.56064.1703177825178879421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 08:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7b7fe0ae57bso42660739f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 08:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703177824; x=1703782624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4vbflDwL07//+COjxUPqUB3sJE0SR2z3AanuqS0Odk=;
        b=cQDiVveg/x48ZxoN0QQs7puEU5WcHoY6wmm+keIThg5D2FVqJvSYmqUUaKvVGkMDhL
         NcGzUxdohZjrAl9k4DScE8PUxccmQ/4olKDovxZgaPBvshRxmNsxfS9CnXb32XewWHrw
         e8/GCrwzrJEx7g6c5vBsHTtG+Ki20DOB8q+XmYhtPfbChDEwbr0epIbkNuAWz4hikL8g
         vkbF+w878dMDD3Kz2GBf/jnDP7pW3pPLMqEsN2Nh9S4lcOzhrv/fRjCJIJWQ6UJA/bkB
         1POj5qg/bOOjJlSYea0zHvqy0U3IqkPn4jJdXFcrtXYE3pRrWwDAmbzwM8+ADWkIpYeP
         QXFA==
X-Gm-Message-State: AOJu0YxEvbNAJWk4DK2K72W1UEBnPA8iQ7b4SN/1Al1b1vUwxOJ2Amap
	F6H5v/DgRasNeNXBbXvjoznrITDFN+w4Uw==
X-Google-Smtp-Source: AGHT+IEQzmGTm3pfA3yGiJNiUXzY6Kes4B2I7Kjgr9Ffw2wWzMoEuxSeScex5qZnXzJkPWJ5VjjSgA==
X-Received: by 2002:a05:6602:b16:b0:7ba:86da:fae2 with SMTP id fl22-20020a0566020b1600b007ba86dafae2mr21277iob.40.1703177824007;
        Thu, 21 Dec 2023 08:57:04 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id t11-20020a056638204b00b0046b4976c3ccsm560670jaj.138.2023.12.21.08.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 08:57:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cmake: update to version 3.28.1
Date: Thu, 21 Dec 2023 16:56:52 +0000
Message-Id: <20231221165652.3899771-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 16:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107723

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-cmake_3.28.0.bb => python3-cmake_3.28.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.28.0.bb => python3-cmake_3.28.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.28.0.bb b/meta-python/recipes-devtools/python/python3-cmake_3.28.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.28.0.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.28.1.bb
index c31161e8f..a6a7b6c4f 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.28.1.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "cb16c350eaa8543afcb1a9b142809b075f5ee8d94fa07b7c769fbd827c985dd0"
+SRC_URI[sha256sum] = "0d4051d101d151d8387156c463aa45c8cd0e164f870e0ac0c8c91d3ff08528e1"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


