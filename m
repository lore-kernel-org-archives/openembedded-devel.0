Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04725CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 10:52:42 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.17350.1761216760736869724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 03:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRljMrDq;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso517998a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216759; x=1761821559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8fXsMwnmUe67E+hnCEVhhkb0toDwqlgHOpmidedGcg=;
        b=QRljMrDqm7urRu4nGelisR+W5mAcJF8sIM3hnkDsh68kJ7h0c0Ge07J6swKfGBPhFY
         odTyvxYGC7MB5zCxyCzdfeUd9FIC7ALn0srvirBJKV9tYHWZc2ANVDEd+8SDORlWhbDu
         Krk6qdCLHGNa1miT8iFFUlsdkv+e2rpc+ysrEWtTm2xGFBmhL0L5FQ3KJM7lgaitakID
         jCzajKYa/S28DDEkBa+0gNtzYrNe6wgwJTuVM3s3NknLS3x+6lh6bjZdShnhIZsEVMmO
         yrkTcXpr1/RWhUt3rRKqi3KuXwH9JZfASMVuUrEmtLBcqszh/VeMfLSdIgxW7CuhAfPv
         D07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216759; x=1761821559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8fXsMwnmUe67E+hnCEVhhkb0toDwqlgHOpmidedGcg=;
        b=la/wHVxOmZNNQ5uoYeCiiHD69CYmBB8IhkpHKoAHXtOIYG26btqiYzSpOdF1PY7It9
         AlocmUgOJnEJGr5LnymGeahLh8HaNk4ykdVv13Q3XJXEe9NZdG+x8+AekWOdTPmA0SQz
         eI1oE4BC38dXxT60KpOSrvA5BWwskR+JBsNhnyLkANAdDS1Gcr8CFVL3pMM6dZL8dOuR
         qpKcNAWVjSQUHtj5319tlWzkmXnfaupc9yInXhKrFqQkLlaF37Nxc9+Lj3BgC4X/N7WN
         S9OMpHgd10Y2A4dX5qB+YC2A3vyVp/01KkZg+HGf+nXbdl7EG/RXUzeR6G9qYJ7EOd8P
         3ijQ==
X-Gm-Message-State: AOJu0YxEaT4Eb6LYaRgCOLk053B9UBWJmA6Tv1HP5Jkq8pbW4deqSYmH
	Z8wW1M/V5lFItj+UdI7b9JKoIpWFlfArZ34ejYW+OptPkCZJjD8mn52KzdN7zA==
X-Gm-Gg: ASbGnct22TCSEeeS70ZALPUpXLcTiENm8COqNq/XwCgW0hVGT5f24snRX+2tji8PYJY
	tFQMolM1vjdH8bX+RMd9naVmkuFOd43V1GjyCG7pY3YjGOQdTCxmRvwQhldxPeYII3fFySHony0
	UFzmc1aGeqaJ+yy8ALNcj7stEhNxMv0lmV52nm3EAId/KFi45eMLkX9mTF7bJLKvxgBaXxTfAdj
	TnodQ6NlsWdgb6fazU/tqZtIlJBPQLbKql0A+Q41aKTwyaqPmBEyMkZ+rSycGx3+tPXTfQSyofj
	gt1YTdit5y7bhvS/7WVfu9QBmjfP0eexpcCSTFGxXjUYvJLsTDswFP61mgxHG14EWv1XM0t8H51
	N7irAOX8JQnC9JKn/o/Rppn9eHsneFB1/NOzIDP52xZE+KytJ+LLGwON+icN5dpHZ0eZj7VsilV
	JPE3sJUCEshRq92w==
X-Google-Smtp-Source: AGHT+IFWhMjoI5dEJA3ikcYEWG7bIx+tk5R8JANqUImIDXeGde6Vql66ajqL56W/am6H1BIHT4O8Ww==
X-Received: by 2002:a17:902:cf4b:b0:27e:ed0d:f4ef with SMTP id d9443c01a7336-290cb27eec7mr306423285ad.41.1761216759495;
        Thu, 23 Oct 2025 03:52:39 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2405:201:a438:60:7f43:36dd:a0e2:5aed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de105b1sm19622795ad.49.2025.10.23.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:52:38 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nikhil R <nikhil.r@bmwtechworks.in>
Subject: [meta-oe][scarthgap][PATCH] inotify-tools: add ptest support for inotify-tools
Date: Thu, 23 Oct 2025 16:22:31 +0530
Message-Id: <20251023105231.688693-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 10:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120932

Add ptest support for inotify-tools by introducing a run-ptest script.
The ptest verifies the correct functioning of inotify event handling
and related utilities.

Test coverage includes:
 - File creation, modification, and deletion event monitoring
 - Event handling and command-line option parsing
 - Basic consistency and behavior of inotify event queues

The ptest completes in under 20 seconds

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 .../inotify-tools/inotify-tools/run-ptest     | 21 +++++++++++++++++++
 .../inotify-tools/inotify-tools_3.22.6.0.bb   | 16 +++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
new file mode 100644
index 0000000000..f3b23d86f0
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+# run-ptest for inotify-tools
+
+set -e
+
+# Run the test binary and capture output
+output=$(./test)
+
+# Print the output for logging
+echo "$output"
+
+# Extract the summary line
+summary=$(echo "$output" | tail -n 1)
+
+# Check if any tests failed
+if echo "$summary" | grep -q "0 failed"; then
+    exit 0
+else
+    echo "Some tests failed!"
+    exit 1
+fi
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
index 8a0ae17ad7..3629ce45b2 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
@@ -10,11 +10,12 @@ SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
            file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
            file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch \
            file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
+           file://run-ptest \
            "
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools ptest
 
 EXTRA_OECONF = "--disable-doxygen"
 
@@ -25,3 +26,16 @@ CFLAGS += "-Wno-error"
 PACKAGES =+ "libinotifytools"
 
 FILES:libinotifytools = "${libdir}/lib*.so.*"
+
+do_compile_ptest() {
+        cd libinotifytools/src
+        oe_runmake
+        oe_runmake test
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
+}
+
+FILES:${PN}-ptest += "${PTEST_PATH}"
-- 
2.34.1


