Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880CCEE49A8
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 17:34:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14109.1692466436336685201
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Aug 2023 10:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=L8vFOlrg;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bdcb800594so13344705ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692466435; x=1693071235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jq5MxgWVlQIGZg02HGT8/PlUIFp7k45nEkjYAXQxFuU=;
        b=L8vFOlrgK0/4ssT9TotG3B9jzmvzJHrQ1nay2k8HQbFDrR94o+Mq4T9wtgJ5GiQHeF
         IamCimYYQkeZUNBn3IplkRgNNUtPVblnoddqzmBAllujNyqHGzMFo2bgzzpCb371zKMB
         OhspzLr7IV/ET+meWbtdVoQozeGTVTs/zXCa0IFvcWnlZ01eXOYxw4+D23nppnmVvtTh
         5+SDNEKiJU6jlWI04yF//sJ/Ov0/0pLDd1s/+wznmkFVzcFtQjnWrnmBxRdeBbEUWS+B
         4ZmXsn0tgKxac/JN7Yn8h9kaAey5V5THuXq1MBb5RgyCsTvsubPLQgC9tDrQTrHGax+r
         bDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692466435; x=1693071235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jq5MxgWVlQIGZg02HGT8/PlUIFp7k45nEkjYAXQxFuU=;
        b=bwtM0b6WMIDa3VYILpACSx/CyX3Q3A88uQQwo6DDDTPm+m+U74r5r1KC3Vz/NGWpBy
         zYqiuCeODzOFI5bbS/3fpgRqBI3lS5ALPMjTplQe5H95MjjSnpBSYpkSlQdgcTusn4nk
         K7ebKcBtfJ8KwQiE8At6ldLhAIS1pej46t5iaHZbk56hndCMXlKRXYS5JV4wyyNnO6UQ
         /xYAHe4D/dfhfeQZf255mobzhzFywVtLG2fBXQEGYMg1F9cDrPE4fD2VkbjvrLUR5RK8
         1YCOSo7Ev879PZpEIZc+uwi1zg7hwBQeiv04CutefpPbdVxKEAnKDRsGleXDvw2xSZRK
         A8ug==
X-Gm-Message-State: AOJu0YwAC1fmT/EJdHnYY95We+nFhMiKda+uSwgLKZOnHxJ/jVjgc/qr
	5oow40KYXPj/XeC2x9DoPTsrkJm/syS6oQ==
X-Google-Smtp-Source: AGHT+IHYGDgFYy22l3DzoRMGEsUcwBs9i9DMXGrHcK2t67mImyoAoPm+vXxi/Sl0SnsPDmS+eNTsLQ==
X-Received: by 2002:a17:903:442:b0:1bf:63c0:ae79 with SMTP id iw2-20020a170903044200b001bf63c0ae79mr861298plb.33.1692466435287;
        Sat, 19 Aug 2023 10:33:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::e31a])
        by smtp.gmail.com with ESMTPSA id r21-20020a170902ea5500b001bb99e188fcsm3913295plg.194.2023.08.19.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 10:33:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] librelp: Fix ptests builds on musl
Date: Sat, 19 Aug 2023 10:33:51 -0700
Message-ID: <20230819173352.113882-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 17:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104498

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-tests-Include-missing-sys-time.h.patch | 50 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch
new file mode 100644
index 0000000000..9316f51ffa
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch
@@ -0,0 +1,50 @@
+From 5c32487a9c127f37141488d416cdb5d5bec6aca1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 Aug 2023 10:24:40 -0700
+Subject: [PATCH] tests: Include missing sys/time.h
+
+This is found when building for musl C library systems where sys/time.h
+is not included indirectly and select() and timeval structs are used
+
+Fixes
+
+../../git/tests/receive.c:64:17: error: variable has incomplete type 'struct timeval'
+   64 |         struct timeval tvSelectTimeout;
+      |                        ^
+../../git/tests/receive.c:64:9: note: forward declaration of 'struct timeval'
+   64 |         struct timeval tvSelectTimeout;
+      |                ^
+../../git/tests/receive.c:67:2: error: call to undeclared function 'select'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+   67 |         select(0, NULL, NULL, NULL, &tvSelectTimeout);
+      |         ^
+
+Upstream-Status: Submitted [https://github.com/rsyslog/librelp/pull/261]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/receive.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/receive.c b/tests/receive.c
+index f376cb4..e20861e 100644
+--- a/tests/receive.c
++++ b/tests/receive.c
+@@ -33,6 +33,7 @@
+ #include <limits.h>
+ #include <errno.h>
+ #include <signal.h>
++#include <sys/time.h>
+ #include "librelp.h"
+ 
+ #define TRY(f) { const int TRY_r = f; if(TRY_r != RELP_RET_OK) { \
+@@ -68,7 +69,7 @@ doSleep(int iSeconds, const int iuSeconds)
+ }
+ 
+ static void
+-hdlr_enable(int sig, void (*hdlr)())
++hdlr_enable(int sig, void (*hdlr)(const int))
+ {
+ 	struct sigaction sigAct;
+ 	memset(&sigAct, 0, sizeof (sigAct));
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index c64eaf2c48..705452734a 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
            file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
            file://0001-tests-Fix-callback-prototype.patch \
            file://0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch \
+           file://0001-tests-Include-missing-sys-time.h.patch \
            file://run-ptest \
 "
 
-- 
2.41.0


