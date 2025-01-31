Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BFFC02193
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:07 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.10328.1738287605167693635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71e2764aa46so945854a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287603; x=1738892403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucmlG1BZ0PDJNGS5L/MUkEIhXY+NS5hna8MxXuQ15ws=;
        b=SMGJwwSBzNlfSaIwiedEMOkFVl8OWNOSIHIuRzNSJNfXlyiN0Yn6n+FyBs3uHQMyia
         AN2gGs3FICO2d6xBU5422FZ7Pj0uHlMeFItV4AMOom3+D8Nfmphwgo4217wKvuhzotFK
         PWq59cd8yWI+yG+PpoIUFNyla+0ApXoeVNqwpzqVnIFwFh4KmTRykW6PhLj2tDo3uEla
         JMPg3XLna3SZe5Yk+pSXz9NKwlKxf5amxqyvwdfAAKjx9kmVHg38s/1mAZX8YXAdaR11
         BIcgXx+wwK2sfShs/7KIDqtsHPppglqc+bc2Ywh63GOmi3P8Bfa3GyWd1sPHoLgJURa0
         tv/g==
X-Gm-Message-State: AOJu0YzH7dKIvRk5A9aJI1NB4NXj5Xi3vmN68v+ULQOGYP5sR7vC8wXx
	iakVND8brNQDmWh06YwvSgavr78R9LwBnDmBwFMAfLa2knpWJIz7kpPd/n61
X-Gm-Gg: ASbGncvI/PHizS0H8j5XtFlROsNf8eeQ6hVUniYg0AiLcPNVx6cb71T66b4k015DH5i
	GJyag2o+1AN4EsBkhmlVPRo8ULBZGLkYhQJrECUywfMsopM+N26rpsVsBe3LfmNqH/7f9o7Y8ZT
	S+g18vWHw8i7+gHIVYtIn4Ura6CbJ6NRw/7zZFowEtYAW/qJEGfE6pzUrQT5ypadujR+u+ASwr/
	Flg6MnmirUY733P8j1KWMWMHadsuaHSeE5foGulNKdcl0WiKKzU5sKwMiRF50JbZYBDtaP+I3XY
	JGDIXqg8tK/NTpSt0TXK9H2Z7mg+g+xnOqh+VGXggXxOUqc0qsnhwCWUB2TY
X-Google-Smtp-Source: AGHT+IGqGR6jQewpatZnvoH0i/RWzG1eDll8i3CwdksA6QNi4gph2uk4xzQAYojYOfVBlr/ygFwOEQ==
X-Received: by 2002:a05:6830:6819:b0:71d:fb64:b601 with SMTP id 46e09a7af769-726568e9d9dmr7203602a34.27.1738287603520;
        Thu, 30 Jan 2025 17:40:03 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:40:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/11] python3-cachetools: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:31 +0000
Message-Id: <20250131013935.3714521-7-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115184

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-cachetools/run-ptest          |  3 ---
 .../python/python3-cachetools_5.5.1.bb           | 16 +---------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cachetools/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-cachetools/run-ptest b/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
index a652d2d333..6c49844f3e 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
@@ -8,26 +8,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
 
-inherit pypi python_setuptools_build_meta ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 SRC_URI[sha256sum] = "70f238fbba50383ef62e55c6aff6d9673175fe59f7c6782c7a0b9e38f4a9df95"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


