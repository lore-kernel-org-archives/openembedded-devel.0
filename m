Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5148AC6FA89
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.11310.1662276865171884035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPQflbH9;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id bh13so5607843pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5mEWGvsvBC2ysA6QxmrZ59T5BDDMGkj5wEE+4XWJCnQ=;
        b=hPQflbH9T5SpUdFErmcOwTAHkcSvkKbvOXi7OyFicEbWrZJp1KU69WNrCKxn8u4kvs
         dqzjrUaNcm6jO1NHbtx2QgNqmq9zMoX86yGHcYLD2bnPuZaPaDnvxwaWsydQKre/BtZD
         zad6Boo720Hdk18olOkCY+hkqNKmo6495BImcz6O4Q5CqUkaW3t4h0lUQXmy5BN3YrS6
         YDS9dPiKXfy3yQO6EWLEvqJF2P5fDVmdmZ67S6I6Gr1KColTfhad5azw/BTxUET7dVR2
         kD8xQyh2n3fCEhkrgKSNyDQhNe3xlVCjbYXhy6h18yv00z0vIluvBH6m/KETeYAfzGtP
         I12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5mEWGvsvBC2ysA6QxmrZ59T5BDDMGkj5wEE+4XWJCnQ=;
        b=JiA/mhDMpAq7Qyc4zv7uxeS9hGDm2oY0I6WCq0zcH+rkER/T5+ivcXJ6ks6gqoAlmm
         cbUwF+RRdHgyeJUQJD9JOwDJyaLTYgSoK2kkpbhce0JLTQPkC+AmN2vrLHDLWexL44Xq
         ewYLJ9BbKKq3V+Fg2ryR36B4DR5bMrLmA36XN/CZwSw3TYw/0MACcBOTbrE0i8xYg9Fh
         tQ9ZBK2UATEztrCWUg9OzezgUhU4Bq1xW44oKM4de5SgSH/Vk+LFirpaysIqp9UeJhU/
         amlpJbJZ1T6nSdfeqHDjY6P62aEB0ZOEPaYAC2/v4Xm8lJTGQr7W+fwSS8j75A7IYMgZ
         Retg==
X-Gm-Message-State: ACgBeo3whj9F/EYJVQlRlQ19m89CMUkP0l7OoBxm7Y8bo37dqYc138oB
	c1Iqhcjl6c+0iHcO+v/vZw25HQ30X14JRQ==
X-Google-Smtp-Source: 
 AA6agR5XGZtelWRA5xnM2grezu82hJCqtwrJYV1kprz/5lPj0Ja240XZYoWO9MUKNN8g0EYv4gNoJQ==
X-Received: by 2002:a63:5418:0:b0:42a:d773:cbd6 with SMTP id
 i24-20020a635418000000b0042ad773cbd6mr37297135pgb.106.1662276864151;
        Sun, 04 Sep 2022 00:34:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/63] serial-forward: Correct typo in specifying
 string.h header
Date: Sun,  4 Sep 2022 00:33:17 -0700
Message-Id: <20220904073417.3251865-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98597

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-typo-in-include-file-name-string.h.patch | 27 +++++++++++++++++++
 .../serial-utils/serial-forward_git.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/serial-utils/serial-forward/0001-correct-the-typo-in-include-file-name-string.h.patch

diff --git a/meta-oe/recipes-support/serial-utils/serial-forward/0001-correct-the-typo-in-include-file-name-string.h.patch b/meta-oe/recipes-support/serial-utils/serial-forward/0001-correct-the-typo-in-include-file-name-string.h.patch
new file mode 100644
index 0000000000..f65d2c4bbf
--- /dev/null
+++ b/meta-oe/recipes-support/serial-utils/serial-forward/0001-correct-the-typo-in-include-file-name-string.h.patch
@@ -0,0 +1,27 @@
+From 2897794c337625d1951eb0b402cd8840ae2182a8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 10:33:57 -0700
+Subject: [PATCH] correct the typo in include file name string.h
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/serial_forward/src/forward.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/serial_forward/src/forward.c b/tools/serial_forward/src/forward.c
+index 9fad6f9b..4c0dd9df 100644
+--- a/tools/serial_forward/src/forward.c
++++ b/tools/serial_forward/src/forward.c
+@@ -20,7 +20,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <termios.h>
+-#include <strings.h>
++#include <string.h>
+ #include <getopt.h>
+ 
+ #include "forward.h"
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 2eef1db4bc..fe5cfc0f45 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -8,6 +8,7 @@ PV = "1.1+gitr${SRCPV}"
 
 SRC_URI = "git://github.com/freesmartphone/cornucopia.git;branch=master;protocol=https \
            file://0001-serial_forward-Disable-default-static-linking.patch;striplevel=3 \
+           file://0001-correct-the-typo-in-include-file-name-string.h.patch;striplevel=3 \
           "
 S = "${WORKDIR}/git/tools/serial_forward"
 
-- 
2.37.3


