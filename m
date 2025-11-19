Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA88CF58DB
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:00:41 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16410.1763582430824148002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSmPKCzR;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso104259b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763582430; x=1764187230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFSF8AgIqE6TmtxW27cZ7Loaq2k05Jhd96VqQPjm5qw=;
        b=bSmPKCzR2Sw0VpJmWbwDHGpOsBdBzrZ/z7kwFXCd0czNLklGjdctGX3YR68rdPwvIr
         6bnSWF8KEE28Gayi1X/UernET9lYYZcm1nq6kr5uxIrQXnpmc1c1PSUJXAvjIIQPR71q
         C3lnYa1Fy8SMCFIBYVIDvfu29l4BUdSA1XvqMCaiKWVf5PU8WXpSQTrEafzfEjON8/5t
         8qQ+3eEyV9wiXF3x3tCYUm5za5eQ3bofZz2RKBmJpTzaUS8OVMqXD2HFnxQJGx/VHH+d
         Dua2Jx1+NPHPi/SWZ4SS6Y3s8SDKAv9G2HOMDQ66oH+1edObXPvq6uk2Bf8nuYFmWj7j
         0DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582430; x=1764187230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFSF8AgIqE6TmtxW27cZ7Loaq2k05Jhd96VqQPjm5qw=;
        b=ULfiTdVP30FKav4krPRXQez28kepjy8eakKjAJOk5LUL+SS2e6Card9wkzGDabrv8y
         U/EKWaIhziL0LbxmeuqKNSnZdDE1uYv+jehfZKAc4nTA02Bj6orC5vmFcoXtQU+J7qWg
         sBugNTrMfh7jY+0IFGr+ejlIU1EH62RghDZj1Xxh+we1p6X6I4L65DKHMDSfEC9IJr+h
         O/CrLO1l8DI+2fXygBCWN0wUHLii/UDn7R1OY/t+S6n5b6UxY+TuPgPfrl35l6nad1GX
         aP0M/dNpgZjLBKfLNPBqPe6/Mzb9u6fNQlw3xMo6v8kHOplZ2KRLIv0Exf5kaoIuzrUw
         6nvA==
X-Gm-Message-State: AOJu0Yyg8c/QRTFiwWO+QLdJsmhdIhkYTbvMuyJ7BfQ5Yi1eXXJZByEG
	dWKPid8KOXrK0Ny/KZSIMyQYijH8ZwEsQ7NtzswDs3xY4Q8Hr55gMBbKC5083tzgbBs=
X-Gm-Gg: ASbGncuEvfxBDEgPCSL8Y2sxu5g6XukzXJOgMqb9CroiASx9hgSZ05tLJLcJ/AGrWla
	gfTmNBnwjP0A6UlqjjLddu95f9Kw1dVtzJP2mLLv7aUSTXJCqKAXu7vJQvyAnrl9jk3rq6nwrRc
	X8kaCbq98TrnJKwgsUm9sp/juUrJEcVYBEcAz1YyTfKXWqfW+8UMFkZ+2PQpungNDKxzhdchwo8
	JYq9vBEmiXAemnjoWHvwb14Vcz0+ysOsEKjYH+05q9tqNnIpj+qwF1Wo+m6OSMe+hHY7RMVsrIj
	PJ76wjm+ltwD4s9XUxPjTQzbtyFkWo0W1ElfbLJK58saQD8goaZb2UCSXEjE4TCBYXPPNg1Q8LO
	f03shhTMlwako7M0sz90jfTdCkXX5w/vUcrjYMZbt6VeZCPJYAqy2LpSJyFrsts4St2M9JC9GzW
	jo4A2AQgSStnQkWQIBH5Z5O63IL8WGWvNI5e5/dEyfaxSdWhg3hfacJ6wJnYNZV5psgPStToF0B
	uxRRtlidGFYC+sEcBvFBBayGbs/UYQTFHl72OqW9w4=
X-Google-Smtp-Source: AGHT+IF4CAn5nwJT7VnWXidXRfoMoqI+6gYn4xPIJQbI7DbyTzAKZb7/VLYAhwZoL4R07YsqAYLm3Q==
X-Received: by 2002:a05:6a00:2da1:b0:7ad:df61:e686 with SMTP id d2e1a72fcca58-7c3f16549e9mr321328b3a.16.1763582429587;
        Wed, 19 Nov 2025 12:00:29 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37824esm207487b3a.18.2025.11.19.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:00:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] lkcp-tools: Fix test_1_to_1_recvfrom ptest failure
Date: Wed, 19 Nov 2025 12:00:23 -0800
Message-ID: <20251119200025.35128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 20:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121915

Build it with fortify disabled to get the intended behavior
of the test

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...le-FORTIFY_SOURCE-for-test_1_to_1_re.patch | 47 +++++++++++++++++++
 .../lksctp-tools/lksctp-tools_1.0.21.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-func_tests-disable-FORTIFY_SOURCE-for-test_1_to_1_re.patch

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-func_tests-disable-FORTIFY_SOURCE-for-test_1_to_1_re.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-func_tests-disable-FORTIFY_SOURCE-for-test_1_to_1_re.patch
new file mode 100644
index 0000000000..965bcef490
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-func_tests-disable-FORTIFY_SOURCE-for-test_1_to_1_re.patch
@@ -0,0 +1,47 @@
+From 824fc568c39a682f180a34a6f581c6255f8cfc95 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Nov 2025 11:49:10 -0800
+Subject: [PATCH] func_tests: disable FORTIFY_SOURCE for test_1_to_1_recvfrom
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When built with glibc hardening (_FORTIFY_SOURCE), recvfrom() is wrapped by
+__recvfrom_chk(). The test_1_to_1_recvfrom test deliberately calls
+recvfrom() with an invalid buffer pointer ((char *)-1) to verify that
+EFAULT is returned.
+
+On fortified builds, __recvfrom_chk() sees a buffer size of 0 and a
+non-zero length, treats this as a buffer overflow, and aborts with:
+
+  *** buffer overflow detected ***: terminated
+
+This causes the test to fail with SIGABRT instead of exercising the
+kernel’s EFAULT path as intended.
+
+Compile test_1_to_1_recvfrom without _FORTIFY_SOURCE
+so that the test can run to completion and correctly validate the
+EFAULT behavior, while keeping fortify enabled for the rest of code
+
+Upstream-Status: Submitted [https://github.com/sctp/lksctp-tools/pull/67]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/func_tests/Makefile.am | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/func_tests/Makefile.am b/src/func_tests/Makefile.am
+index 54e1627..e001d17 100644
+--- a/src/func_tests/Makefile.am
++++ b/src/func_tests/Makefile.am
+@@ -160,6 +160,11 @@ test_1_to_1_events_SOURCES = test_1_to_1_events.c
+ test_1_to_1_threads_SOURCES = test_1_to_1_threads.c
+ test_1_to_1_initmsg_connect_SOURCES = test_1_to_1_initmsg_connect.c
+
++#
++# Disable _FORTIFY_SOURCE for this test so that the EFAULT case works
++#
++test_1_to_1_recvfrom_CFLAGS = $(AM_CFLAGS) -U_FORTIFY_SOURCE
++
+ #
+ # Specifying objects rules for "v6test"
+ #
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
index 407194792f..3ad436724d 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
@@ -12,6 +12,7 @@ SRCREV = "37d5f1225573b91d706a5e547d081f79963a9deb"

 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git;branch=master;protocol=https \
+    file://0001-func_tests-disable-FORTIFY_SOURCE-for-test_1_to_1_re.patch \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \

