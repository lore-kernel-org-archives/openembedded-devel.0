Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D26AE7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:57:52 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.1815.1736542665467042127
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844e12f702dso76082339f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736542664; x=1737147464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhZO/B527WN5WyArGhZ5FKuWVfW108cGHDcAFiMzll8=;
        b=GiNw+9leXrv+ztR4+Vvbr1rpmFFT2/bjHbPT/HbCfeJnq7p+p+v6nUDJPREBXDL3ek
         Hh3537hidYcRUyIdDw5+qXlD5CYUdo2w/9FoMSFp6P04bXKMOyPwArv9A+S7Qf7nDIZ/
         zkhDc5xh8TvUikjGqEVlWvK+Jconfc4l3x9qwI76OmhnXBPxqy7XMSyynd6aLQOtzhNc
         sVqUZN9PPqgJLrHEyEsp8Bh0JspdfSp3RPG6VYEyDAGiLjC8StsB8ToPaFsTQcd+uvs+
         YDzzbJQ3fsdko1Poupodl1B3sG2ABcix3h2L8KeMgXqXiDvah1KChpyAwjf8EZA+8cMj
         bHmg==
X-Gm-Message-State: AOJu0YxqeGBkb4G1pnxKxX7LEYtB/JYVxjx1gqMsD2Ll8V98+B/i4Uxf
	Q4Op4C7REaclPf1KG48EfJ6L62QeBWjNN+tZ50SEGxpk0idVK5Q7YDFF6A==
X-Gm-Gg: ASbGnctAx2aCi4O9OH0dHjD/REqNK4bHaFAoAtCr8D/h5cJg2r1X1NEkRJZVhs+aBjP
	p8QFkvNIofUsEr0PNRMHl5uJC3qWoZ0rWcVfDtgx5HpOnEzPIRvyC/uRBpwpWcgr21aqPTYqFUX
	0YmN6KDLxfNmOQklkY61kNOirwQ3/4sGW3vhctSQGwxtvgLxO9hucS7CQ8m9Z1OT1kiTuzzl0it
	rf7rMu/KqgOyj0xwi9KqBbN+TJ3iLt2+vJrx90yvzIRlaSJaZAiDAI/F36ubo1evxnpkLhDOzDv
	Lt+jXLeMB9wO1SkCSMMn7hm10g==
X-Google-Smtp-Source: AGHT+IHDMJgOTkyTIdRkpemcIHr4uxJ3KIn70qdiTvZ0WLg0sYp/i4GIR57pWgB+SSwiQf7+jJCS7g==
X-Received: by 2002:a05:6602:3a03:b0:835:4278:f130 with SMTP id ca18e2360f4ac-84ce0229e5fmr1063093239f.13.1736542664288;
        Fri, 10 Jan 2025 12:57:44 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d4faee16bsm106960939f.4.2025.01.10.12.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:57:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/3] python3-tomlkit: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:57:27 +0000
Message-Id: <20250110205729.4088028-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114805

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-tomlkit/run-ptest                |  3 ---
 .../python/python3-tomlkit_0.13.2.bb                | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-tomlkit/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest b/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
index 9fca14540..8eeb9d760 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.13.2.bb
@@ -5,11 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
 SRC_URI[sha256sum] = "fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79"
 
-inherit pypi python_poetry_core ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
+inherit pypi python_poetry_core ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-datetime \
@@ -19,14 +15,7 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}-ptest += " \
     python3-poetry-core \
-    python3-pytest \
     python3-pyyaml \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


