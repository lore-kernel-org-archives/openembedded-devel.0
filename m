Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BE6CCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:21:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.12865.1760700067900303801
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aC/Cxxgv;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so16938525e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 04:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700066; x=1761304866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5aSI8R0YFUVZ7NzFPKCrnISRqiRFCzRJED+Kapik6UE=;
        b=aC/CxxgvkXmO24o/3+CCVjFWBbBIccVNnzrNM5deaklcLEHnBQXnip/zaSivQ3nCs/
         dy+aspWC4EbtjncUGQRf3RKmNVYvRTUk88hGNKlbEVX3Gn9Rv+cCztylEjpcBzdG8Uua
         V+Oh3ISwgaVYT3NN8BzrG0pxFDHhaK2N22TVhtBVu9S0SoKOHwahjXCfvFN6fP/Dg+XH
         YrR5DPTFABXlDHrYQpaMUPt+eXFcmLwO8buGxpjVur7buL75gbkIIlno6kX68GIHxD5d
         YUVzF1K7rEiy0O7U3cL84lMaWrtQSYDGgpVbeTLLtaYy1hITxrd98wZ1f5o/Yg4JFgyg
         1IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700066; x=1761304866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aSI8R0YFUVZ7NzFPKCrnISRqiRFCzRJED+Kapik6UE=;
        b=WMjqDDJXVpW4KpjJQCkShI3UmNUDMVVFH9lPNtAgtu4rV1nkb/gdHXCgmXOX4Gkual
         YiTAiZSIHpZrWHKBUuI4E4p6MTLt1XWaFcCeksUifbPHyKhEJo4g1Y4DYcD39YltGoge
         v5GUYjwW2fKIZM9TLCYTQgzXAZQQC9G5eK4mdSc3epYGW0bR+qjb4xc53DY9njxVpmQV
         12O4QkfwEcEuAUizccquHAzgjXB+4+fRuFFNbwXnvfw4LsL5f0b/705agU5hBC5i3WGZ
         lkScan2Iuu7IUSji7nMU4gXo+I5aPd+4J0H1wMFnuEgXOcvsLusAr1Pg8jI+Wv+uZCLL
         cWyg==
X-Gm-Message-State: AOJu0YzoKQ0Qn9LAOE+6/5leB5GXN3a/Lk8NbV320aP+GMzC3Nb25/5n
	W37lTmXsWXjZoJ3hKhdiY7fRJL0vLWax/XcHGDXqgNEqQBILnXugpOXkIsnOiA==
X-Gm-Gg: ASbGncut6iNdOt27lvDULUiwMk9MfA5hyAtcDy2HT2b5JnRerBpHI7UQ63vJKIKaACd
	8NeFSmp5ZQGeWv4O1iBGio9WZheytH0AiXAO/1e5I8Hai/MT96JjvLFOiUSjykgXQ/KroII/9iU
	/oI1Zwas7SqNRF/2darvCbWZlAH/UzJxN+S2ZeI7hTqtdNhLlJidSyOU31XKSg20tqRJ8PU1dxV
	JOAG0ERJUUMWPhC6qYSU7cWmzCPqxrXUns5hB6YAXvyTHUHkehkDQNSIJf2UzkNy2D1nrVlQRzs
	wOHPimOQRfJxqXg36JK2yV45R4Ul1OJjDQ5lTAfR7vg86Kmg7+zzttLDbBg2trcTGhIKCd0e++j
	mS/VedajsV95VAiYXNkFzSUEoA8A8gIjFDngtA2cgUbjswwL+sJxICYG9kFWN2XJORSJWtgPDig
	==
X-Google-Smtp-Source: AGHT+IGmbNeEQPZi277HU3uFeCLFSoCmhEDERmX5zUNjziiGmum++x6swRxe16Q+9+YpJi4wj9wc+w==
X-Received: by 2002:a05:600c:458b:b0:46e:39da:1195 with SMTP id 5b1f17b1804b1-471178784d9mr24785165e9.3.1760700066180;
        Fri, 17 Oct 2025 04:21:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf6b4sm40616574f8f.25.2025.10.17.04.21.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] cli11: fix ptests
Date: Fri, 17 Oct 2025 13:21:04 +0200
Message-ID: <20251017112104.2389343-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 11:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120757

The recipe inherits the ptest class, however it doesn't install
the actual tests, nor executes them.

This change installs the tests, and add a run-ptest script to
execute them also.

The tests are fairly quick, it takes single digit seconds on my
machine to execute.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/cli11/cli11/run-ptest |  5 +++++
 meta-oe/recipes-support/cli11/cli11_1.9.1.bb  | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/cli11/cli11/run-ptest

diff --git a/meta-oe/recipes-support/cli11/cli11/run-ptest b/meta-oe/recipes-support/cli11/cli11/run-ptest
new file mode 100644
index 0000000000..ef37d44783
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+cd tests
+for t in `ls ./*Test`; do
+	./$t && echo PASS: $t || echo FAIL: $t
+done
diff --git a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
index 7de3335abd..c8a2f7358b 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
 SRCREV = "5cb3efabce007c3a0230e4cc2e27da491c646b6c"
 PV .= "+git${SRCPV}"
 
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=v1;protocol=https"
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=v1;protocol=https \
+            file://run-ptest"
 
 S = "${WORKDIR}/git"
 
@@ -15,3 +16,11 @@ inherit ptest
 
 # cli11 is a header only C++ library, so the main package will be empty.
 RDEPENDS:${PN}-dev = ""
+RDEPENDS:${PN}-ptest = ""
+
+do_install_ptest(){
+	install -d ${D}${PTEST_PATH}/tests
+	for t in `ls ${B}/tests/*Test`; do
+		install $t ${D}${PTEST_PATH}/tests/
+	done
+}

