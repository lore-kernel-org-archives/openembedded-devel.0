Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C68C25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:07:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.94.1717096062180126832
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HqKMLVf5;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35dd0c06577so97610f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717096060; x=1717700860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVfSSaaisuE7E6MBVXMf+M/jNWNSIere3VzXZCvRGBA=;
        b=HqKMLVf5emXtE9VtIP1DCLO1WFQm6A+QA+Ob9duyT+Y6mRU5gI5KA2PZtDk0STxiPo
         1DCyxxspMc0QwALXhmaBs7/p8t1mjq2JWXo73MBFMlPrjDFGoZYpJAV5QN34ZgncQeld
         PVY5Y3m0rXqXjXK5gX69jiWwPvEpdyUxgyNVXpNPoa5ntjnqjqHJtOyGcLYWXaDvcR+W
         EJfFNbrtq3XVAwAjN6nGC3AYvrconpXtNgbt1mev2kVVAJxIZDq1amzDG11IFtdNE6ix
         +WNvLrovu9naut6KiKQfE8q/e9/EodyIyVMMhQJIvlVAdqAALxEbiAZ7EViBcL/O+ua1
         6n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717096060; x=1717700860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVfSSaaisuE7E6MBVXMf+M/jNWNSIere3VzXZCvRGBA=;
        b=cNccnJISSE3aij1nAXPF/zo6lwDivXtgVjXDrV3aXtlX0RkfrEU3yttG7z8U6Ui1se
         nEKetArO0hUjX9umvR1HXnX+nTfsbYjmWigmnBvgAWRPxRuJBGtMdMDiifwWz1bl1V3R
         CY1pyLXch4Or53STppfZOfc+u3gQhR+TGOErnkqm5i2uGdkPQvuqx4kuSSmjWZsst1QX
         VuGB1ZHFd2qFgEYhWFFKabsjoBlX0gDgdCw1j0Fte3zOLuHLcjCKFGrpM+CvK7Tfkvl6
         YxAJ9aq1Gt+iHY/GoumWBtBKcxuctfkAuCysDzV+6N+w3BXkAQeo8oCdphI3RiFVM+iG
         KaoQ==
X-Gm-Message-State: AOJu0YwYrAoHw3nOubJW9tE8mvlUHQgZIyMLrvxOCZWtsjABvoAnmZPr
	9NyBlTADuFLsS+aseQkQ3mavJxU5R5pUY6mJvK1xZGJM37EpMpN8k9EzHw==
X-Google-Smtp-Source: AGHT+IFVklnm0gMmSlMuBtC5tfopXwjuK8nZ3SX+POxU5DH9poo5QF4lG3Jk3cj/9NL0YiknsaUW5Q==
X-Received: by 2002:a5d:6888:0:b0:355:2ad:cca4 with SMTP id ffacd0b85a97d-35dc02b7b97mr2126617f8f.55.1717096060105;
        Thu, 30 May 2024 12:07:40 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c89sm170275f8f.60.2024.05.30.12.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 12:07:39 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-flask: add ptest
Date: Thu, 30 May 2024 21:07:33 +0200
Message-Id: <20240530190733.693155-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110641

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-devtools/python/python3-flask/run-ptest   |  3 +++
 .../recipes-devtools/python/python3-flask_3.0.2.bb    | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-flask/run-ptest b/meta-python/recipes-devtools/python/python3-flask/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
index 300ca99dd..99524b437 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
@@ -8,10 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
 SRC_URI[sha256sum] = "822c03f4b799204250a7ee84b1eddc40665395333973dfb9deebfe425fefcb7d"
 
+SRC_URI += " \
+        file://run-ptest \
+"
+
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
 UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 
 CLEANBROKEN = "1"
 
@@ -23,3 +27,8 @@ RDEPENDS:${PN} = " \
     python3-profile \
     python3-werkzeug \
 "
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.39.2


