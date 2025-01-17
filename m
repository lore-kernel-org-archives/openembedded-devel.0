Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ECBC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.4849.1737145847923316378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-84cdacbc3dbso198736439f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145847; x=1737750647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcUDlxDqV9b3kAAsOTwU8HhASAOhA4/q329rPwy8lyU=;
        b=tWbPdbU/Ra/jYaugwO2uDkU37TtAa301VQ8frCB1+tiMfr0Gdi5LYdbDgQWEbFxqS7
         as5z90FRizTBdA2CrdNhUxwDNgwoHTgrnhlFI/RDtmKnkxpMrADu3lhYLi2GjnuPW9VM
         3iek6VlnFBx+P3t5mxsWOuXeOQV4psjj38OoBylquqQMY0F8gBas5kFMzrIqWigzaQgG
         v8i/SNYis4PLS4P2CnL0hh/haN+zAuk1w0UXv42wKxG6435l4cVG0IpJTMum8iWSYPAS
         Ih7ljf4XFDCnTYtqOj7adCGI8+XUyzxeXVcM6VqoP0RhKIQbwtNTrRXSqxp3x4cYRl0H
         Q+iw==
X-Gm-Message-State: AOJu0YwWjTNXAvL/LeyTBsoZ4t5sjlFr2qGhoCoC0XtClii9ZXsdP2I3
	JVMP43W2y7/3lTJn5nyNog043pNJoCd1WWKx7z1vAc4vbVwH8AsggcfOvg==
X-Gm-Gg: ASbGnctzTaX8b0tnXzm9TrHlOQkl2ToOiQpv3cTIR6GmHPyQ30V5BKMUxQndFoP9jLX
	6OsNOzyX1qv2YC+Y1ceWGACVbtX3lYYmo44QRuU0v9HFJXyLXmO8bNGmdkuzNoMd6a0hBBbA3J4
	fvKa3ye2Anc2Ewv3Q6hWO3x7sqfXwW8RwPdBa49UVrcQEhZUP5gd0WcvhxPlChJpbKICxYztY3v
	eHLvGlCyothVwDHE/dDv0uKN9/tg2g0J65/QloWAN+29tKTgqe+YfVHsHP+WPnAHAHTJe4IAQnv
	xcy509FeQlr0cBrx1WmFxYS+cw==
X-Google-Smtp-Source: AGHT+IHK0tV09kxz9ZbswOHvU0GHZWoY3XMwsZzP3I0xWZm4wNwDZzXiZSlJIKiudlW2ss+5IcmRdg==
X-Received: by 2002:a05:6e02:1608:b0:3ce:7e5d:6292 with SMTP id e9e14a558f8ab-3cf743f7c3fmr40253925ab.8.1737145846761;
        Fri, 17 Jan 2025 12:30:46 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/10] python3-py-cpuinfo: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:25 +0000
Message-Id: <20250117203030.3648575-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114938

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-py-cpuinfo/run-ptest               |  3 ---
 .../python/python3-py-cpuinfo_9.0.0.bb                | 11 ++---------
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest b/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 2d59a99b1..8aef266e3 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2379ecb0d7a8299101b1e4c160cd1f7"
 
 SRC_URI[sha256sum] = "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
 
-inherit ptest pypi python_setuptools_build_meta
+inherit ptest-python-pytest pypi python_setuptools_build_meta
 
-SRC_URI += "file://run-ptest \
+SRC_URI += " \
             file://0001-test_cli.py-disable.patch \
            "
 
@@ -21,15 +21,8 @@ do_install:append() {
     done
 }
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN}-ptest += "\
     python3-compile \
-    python3-pytest \
-    python3-unittest-automake-output \
 "
 
 RDEPENDS:${PN} += "python3-core python3-ctypes python3-datetime python3-json python3-io python3-mmap python3-multiprocessing python3-netclient python3-pickle python3-pprint python3-shell"
-- 
2.34.1


