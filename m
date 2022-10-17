Return-Path: <sebastian.suesens@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614F3C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 06:19:11 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.37992.1665987544049186620
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 23:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5T4xyQH;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: sebastian.suesens@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id w18so22509871ejq.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 23:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNGKRNM+LACfnXAPWrAqOgVPbuKfkaWXkeMz8JO1Z9I=;
        b=d5T4xyQHQ/0ZYq8Le1fQKFveb6cyG6//nhFJpUoh6OzfXjtqTnMQ1/YoW/JPursoxV
         ocGUCbK39eSetQdeV26Yxwx/MGDLTjZkQmqo/UxCYQOl3lbiRwvjqNiazfV4uM31mU/N
         fQFnAPW7oTr10FDPSWQe781lif69ySbiw6UkCN7ik1Cra0oObkhcUNTv93f1loVhTDVe
         0UjvvVfBsCZ5lGzJfIG05IF25PAi5ZOgC34q+tmGp1mFGGcEgH6iFqnGeWsegk75469X
         04JIRiKJTv6QAc5LzAY4qR3ch3o2qA7UI+hBKMZFqiQP47yhEdE14lrmI/WnvU5Wa9iR
         Oxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNGKRNM+LACfnXAPWrAqOgVPbuKfkaWXkeMz8JO1Z9I=;
        b=PvjKjD7duhJtWy6+PgFspIPKDiLSQ7CONDJ8dE6zuucTKPYOGhSPk73tts3vcRHSvx
         ALQnWZ2lwS79nFTT3jsVKrbLilJwSD0k5aFYMipiejF6oZCyA6VKzemzBYemfCTwgkKv
         rCTsx/Az1PJotN1BWRRcxVEAEqR6rZA/57jnYV5rh/r+opbbhyzyOdP7WK0VDfw5E27+
         m8MmJYrHmAWeH5skHnghW/yAVa9Lnn8MmYKKffZVSJUHppwaDL/uLAL8upC6CK1SOOfR
         kRHYctCk4lTx874kOr9A3bnIZk2E5MyHcSJzMM57+StTociq9fC3VWH92qZP23nFLWfn
         WSMQ==
X-Gm-Message-State: ACrzQf0kUCkIodqVcrjNOAwrjJzBKTJpmkYBawmlTAthRnF94jeJMhLn
	7AAHZSt8kdgcINUZzd0o4wRbNq37qec=
X-Google-Smtp-Source: AMsMyM43s0AzCy+yuzpx4GedzHgRGmAKWBkGx0eVFH7IgysZzNwj5UPw1ScaWPG/J5O1O2T+8L1lUg==
X-Received: by 2002:a17:907:1de1:b0:78d:9919:38cc with SMTP id og33-20020a1709071de100b0078d991938ccmr7249441ejc.311.1665987542508;
        Sun, 16 Oct 2022 23:19:02 -0700 (PDT)
Received: from DENM-LSVR0-A070.basler.corp ([185.12.91.67])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906308f00b0078d4e39d87esm5523206ejv.225.2022.10.16.23.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 23:19:01 -0700 (PDT)
From: Sebastian Suesens <sebastian.suesens@gmail.com>
X-Google-Original-From: Sebastian Suesens <sebastian.suesens@baslerweb.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sebastian Suesens <sebastian.suesens@baslerweb.com>
Subject: [meta-oe][PATCH] double-conversion: added double-conversion lib
Date: Mon, 17 Oct 2022 06:18:59 +0000
Message-Id: <20221017061859.2168842-1-sebastian.suesens@baslerweb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 06:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99190

This provides binary-decimal and decimal-binary routines for IEEE doubles.

Signed-off-by: Sebastian Suesens <sebastian.suesens@baslerweb.com>
---
 .../dc/double-conversion_3.2.1.bb              | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/dc/double-conversion_3.2.1.bb

diff --git a/meta-oe/recipes-support/dc/double-conversion_3.2.1.bb b/meta-oe/recipes-support/dc/double-conversion_3.2.1.bb
new file mode 100644
index 000000000..cc54dc648
--- /dev/null
+++ b/meta-oe/recipes-support/dc/double-conversion_3.2.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Double conversion libraries"
+DESCRIPTION = "This provides binary-decimal and decimal-binary routines for IEEE doubles."
+HOMEPAGE = "https://github.com/google/double-conversion.git"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ea35644f0ec0d9767897115667e901f"
+
+
+S = "${WORKDIR}/git"
+
+SRC_URI = " \
+        git://github.com/google/double-conversion.git;protocol=https;branch=master \
+"
+SRCREV = "af09fd65fcf24eee95dc62813ba9123414635428"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
-- 
2.25.1


