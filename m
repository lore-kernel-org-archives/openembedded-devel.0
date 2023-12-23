Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F3CC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 12:29:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5430.1703334546545582742
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Dec 2023 04:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gpE2nc7i;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d51510536so810985e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 04:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703334544; x=1703939344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2NmskMmFlMdV4R7j1Hg+4rlx9Vx27GZyErnsvOem/o=;
        b=gpE2nc7iz8AZgSs48sQTAJi52vhFfZcfsxCmaGl7ODxCXubdaAuhtA95oz/XdwAKrq
         ZQbRJ4lRj+vNj6+k2bsZffmn862jJ4rO6XJ0oZ6ArlbwA2QNh8QW4Bt9fC3jJZ85OTWl
         J7i1YpDtv4o3lupTkbCjziEyUGOY45PTqNC0MN+ZxoxfVYPnPpTuqoWikf+cgYcESDE4
         T8HRjrjASVTJhT+hQO0Ze/1TqPRHnik5KBetUxVvYLHIOkKXVr4d6j2h9Vs/jL0MIcG4
         l/3yvXhkGuJ1Y6iIyaK+MMQkPokD2tmSWEP2TnXxvIw2odoEV2IuCMfiOBGOx5AE/BMX
         PCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703334544; x=1703939344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2NmskMmFlMdV4R7j1Hg+4rlx9Vx27GZyErnsvOem/o=;
        b=YpKXdytJ0Btbc6neNqtqaM3K11hB6SuxlNpUUxdNAPSr+E6ico3p76R04BH9wn0NdX
         RlZvf32EsLd2CxfUDculjrzrDrqsJeIh+ksjEwz3LQjBcjWwdmaciXTx6KVk4wQufSAO
         tnv+HF9wrePRixRxxhH0qqQjWZ5px/jc2ge3tMBbr3QDw97uNGYRNgZZFDrluvOSwzNw
         K33bIP1eneuwx5oUTfvDkoe36tKhzBLlnN0Fjjm3YgU4yBh4Vy2jz8G8FAP8AZxGlzQ1
         CqLFVrED/d79eAiX+88Vnbn2LDILklnl70UBlGdskQ/miXE6M12dl5v/QdFAUzIf4QYL
         J/VA==
X-Gm-Message-State: AOJu0YxAWsoNCgLk99OZlsjIvbcMmptbML/KzFKblXk7WaZ5+alIXWja
	UpW6S49iDG9cY8/eC+9bLbeQSRR2e0U=
X-Google-Smtp-Source: AGHT+IHZaxVSk7CyPBZpBpigrgHRul4WaNyYM6mRmBY9NBB/WsrY/gcBZ+GBLiMq5YtqHE3M0Ab49w==
X-Received: by 2002:a05:600c:a004:b0:40b:5e1f:c387 with SMTP id jg4-20020a05600ca00400b0040b5e1fc387mr1560003wmb.29.1703334543956;
        Sat, 23 Dec 2023 04:29:03 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d9e2:102b:56b1:9620])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b0040d2e37c06dsm10198199wmq.20.2023.12.23.04.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 04:29:03 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v3 1/2] c-ares: Move to tarballs, add ptest and static support
Date: Sat, 23 Dec 2023 12:28:59 +0000
Message-Id: <20231223122900.20077-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 12:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107770

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3:
- Filter out "Live" tests which fail inside `runqemu` (there's no
  resolv.conf)

Changes in v2:
- Use relative path to arestest

 .../recipes-support/c-ares/c-ares/run-ptest   |  7 +++++++
 .../recipes-support/c-ares/c-ares_1.24.0.bb   | 19 ++++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/run-ptest

diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
new file mode 100644
index 000000000000..46572111b5cf
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if ./arestest --gtest_filter=-*.Live*; then
+	echo "PASS: c-ares"
+else
+	echo "FAIL: c-ares"
+fi
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
index 2171002aa95e..3b3b2b83febc 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
@@ -5,14 +5,23 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "972f456f2808b4e4b1730c90ab506f6af5f4c725"
+SRC_URI = "https://c-ares.org/download/c-ares-1.24.0.tar.gz \
+           file://run-ptest"
+SRC_URI[sha256sum] = "c517de6d5ac9cd55a9b72c1541c3e25b84588421817b5f092850ac09a8df5103"
 
-UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
+PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[tests] = "-DCARES_BUILD_TESTS=ON,-DCARES_BUILD_TESTS=OFF,googletest"
 
-S = "${WORKDIR}/git"
+inherit cmake manpages pkgconfig ptest
 
-inherit cmake pkgconfig
+EXTRA_OECMAKE = "-DCARES_STATIC=${@ 'ON' if d.getVar('DISABLE_STATIC') == '' else 'OFF' }"
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}
+	install -m 0755 ${B}/bin/arestest ${D}${PTEST_PATH}
+	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
+}
 
 PACKAGE_BEFORE_PN = "${PN}-utils"
 
-- 
2.39.0


