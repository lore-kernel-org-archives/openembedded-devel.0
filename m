Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67AFE7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:31 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.690.1736539766223378240
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-84a1ce51187so69207039f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539765; x=1737144565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EXOSZYTZ3ZDhkAw8rWBt0NmRTjS0ldd3Bcu/aLyixo=;
        b=ocv3PgI56gYj8v21wsSRy+vxsYha09V2ar3oJ+k39JPuJ2zYxKaq58iyhS6YWp1MT7
         NXCN9Ac5eEECvOl9SLZ/jLwlfKx1RONFV71lbopNz7iku8Sa9WViBYejBbudqwbiuZIl
         A8qF88XY8XCIutgd+eZK+wFa6C2j8qSUfdFpTJp6u1Jm+uwIrHykcqBk9Yh/+wDoEkb8
         0MLxpNz9/OhFNoM8y7C+Wj/lUbwCvUlSPudOQfquLt69L1krVZNm+m7r84CbtSo8Dun4
         bbpIqCElSCTWC+4nuqs5q1pIMWxLmC9nLqNcwVgOpNqmp2KLhT1SFA90yih/yzagLUWM
         UCEw==
X-Gm-Message-State: AOJu0YxdRzRmYa283A+6ou0bngB90RpCjn021Ymj8Rs0d663r9PkiMVv
	YnOZeC4Wcg/leNreKsNQnEr6aGCzhgd6AHOKS9dyUlJ1ZcQYtieDVf8AwQ==
X-Gm-Gg: ASbGnctUMqWWXOg+e4Xyh8UWZ1IjTa9Pq5ojXqVwyi1BT4//IvJn3RN7mvdFZIOacY0
	5BrpduSUZIuB3jZXrxO5RgZ9+Q2S//w0ZgpttENBdzwXkfurpe06Bof4jTOnr/blfpPm+uUGwoV
	IDb4eH34l4aaDZOm0oXAJjDhtObndryxiwwCjoCK0yUXu7OvLzvQz0s7od9YrvFhY5FHd2O+Kv0
	g2kVPTXoCpQod/CbgcL6ZAZ8xEMtiJJF7KtTJFu0i0NKfHfRt7698yTy2jLiT6ahFEaoNuXuGQm
	IvX/6eq5htbHLCzsQxYS1EhYTw==
X-Google-Smtp-Source: AGHT+IF4iTmUI5UZ/miZxsaAsfCGJjIwpyFTWxmAMymhl8caYlI3eYyC7b8xBvrCJ3RJfrY+rYvzGA==
X-Received: by 2002:a05:6602:4015:b0:844:cbd0:66ca with SMTP id ca18e2360f4ac-84ce003c8b5mr1047470139f.1.1736539765058;
        Fri, 10 Jan 2025 12:09:25 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 13/13] python3-trustme: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:22 +0000
Message-Id: <20250110200822.3958062-13-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114803

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-trustme/run-ptest                |  3 ---
 .../python/python3-trustme_1.2.0.bb                 | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-trustme/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-trustme/run-ptest b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-trustme/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
index 69db7e618..e1974f707 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
@@ -6,11 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
 
 SRC_URI[sha256sum] = "ed2264fb46c35459e6de9e454ed4bab73be44b6a2a26ad417f9b6854aebb644a"
 
-inherit pypi python_hatchling python_setuptools_build_meta ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi python_hatchling python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-cryptography \
@@ -23,13 +19,6 @@ RDEPENDS:${PN}-ptest += " \
     python3-attrs \
     python3-pyopenssl \
     python3-pyasn1-modules \
-    python3-pytest \
     python3-service-identity \
     python3-six \
-    python3-unittest-automake-output \
 "
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


