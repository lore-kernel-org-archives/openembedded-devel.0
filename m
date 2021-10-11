Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73302C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2734.1633977713229454870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GIr9m85j;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id o20so58924379wro.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gbdy4ikt1nxmNqHLc5ZQrD9WrfTunii0c5U3x0AZWBA=;
        b=GIr9m85jLdrS9D6Jv6WvP4IuSF+g+2umKJAsTSEN8U284ODka+U0fWbxfUVQo1d5lK
         ltKOfaCah1HaLcQHgfvhHXl/QqRcKmEG5eiHGzYDekQlZJzrywxYnp+U/ecNQV0/qGTA
         gA0peGvsv8R/u6aHDzQdoWW6baEV8075efAIlmIZ4YJerS1bun+l9UMs4AlA/C7rRjSk
         6VGsDdCokU19IlnJQPaQ0PF09BisHmzcZ/sh4JBoJqyto/lyE5Jhqq+hdE5bYA4w5g30
         KX7Z560hEgPau4yj7LlM+IOirUaKOSefJu+/BF6/p3gC9dqvLVop1ORlxwL1jXNBEG++
         9DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gbdy4ikt1nxmNqHLc5ZQrD9WrfTunii0c5U3x0AZWBA=;
        b=fhCp66eRYdjdv9QxodF73lYf7S3+gB1Rns3aQSd2Nh7niML5MqEynPQrqV+SeWXwKo
         hECFBg09z2F6yUrJh38YWGG+qtTdpVY4i4S450Y/a5+Vkoc30OnB0ECCQeyoqHTjXHK4
         fjizAQcwX1fh538rzQst+8S5CFSl4MTdhJ3c6iDzo2hkQ7WPAhcuPCqfmGdA7F3kUqi/
         TmS8Cx5JW3+BI8+1uJkC7OrUzOHYYfpWj2oFw0KpXjHozY4nov/jqTgNIZmBUdqS7qFP
         wiY01gSV16GKgF0sqbay6F0YwDBKGUHuPsHn/e2Dh3flskq7oXfdWz9b2fkwbU8KK4LF
         lM6Q==
X-Gm-Message-State: AOAM531Ja9kKc0GKpTRWJc4oq8vFTA5Aqtl+bjh7BpLWqocZc1TiuX5D
	B7y1vpBa1PD0luefhIdRyeiVS+X8iNZHTg==
X-Google-Smtp-Source: 
 ABdhPJzceQceif6/BFP0rAHWEHQMtHoxF9wJrMFQBeLPLay9WtHeSyAVbDP52iMgp9nT1pcajAvy8Q==
X-Received: by 2002:adf:a289:: with SMTP id s9mr26690751wra.260.1633977711818;
        Mon, 11 Oct 2021 11:41:51 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/24] netplan: do not use -Werror
Date: Mon, 11 Oct 2021 20:41:24 +0200
Message-Id: <20211011184140.653609-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93221

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Makefile-do-not-use-Werror.patch     | 23 +++++++++++++++++++
 ...-t-fail-if-GLOB_BRACE-is-not-defined.patch |  7 ++++--
 .../netplan/netplan_0.103.bb                  |  4 +++-
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
new file mode 100644
index 000000000..ddc44c3ca
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
@@ -0,0 +1,23 @@
+From a06c77557ed951249d5b344441ad6ec57410e63f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 3 Oct 2021 21:52:16 +0200
+Subject: [PATCH] Makefile: do not use -Werror
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8645aee..50fc0da 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,7 +7,6 @@ BUILDFLAGS = \
+ 	-D_XOPEN_SOURCE=500 \
+ 	-DSBINDIR=\"$(SBINDIR)\" \
+ 	-Wall \
+-	-Werror \
+ 	$(NULL)
+ 
+ SYSTEMD_GENERATOR_DIR=$(shell pkg-config --variable=systemdsystemgeneratordir systemd)
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
index 0fa6ba48a..c7d371dfa 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
@@ -1,16 +1,19 @@
-From ceb4111af317ecc54d97bb21878dcccbfdb2983e Mon Sep 17 00:00:00 2001
+From e0df1f07d1707d5daf0358cc60b30f06121f7e60 Mon Sep 17 00:00:00 2001
 From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 11:41:43 +0900
 Subject: [PATCH] don't fail if GLOB_BRACE is not defined
 
 Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+
 ---
  src/util.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
+diff --git a/src/util.c b/src/util.c
+index a4c0dba..fd4542d 100644
 --- a/src/util.c
 +++ b/src/util.c
-@@ -24,6 +24,12 @@
+@@ -25,6 +25,12 @@
  #include "util.h"
  #include "netplan.h"
  
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
index 682a6b611..3527bceeb 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
@@ -15,7 +15,9 @@ SRCREV = "51c872d856db80281ea810ebc02e05c09d5310fa"
 PV = "0.103"
 
 SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main \
-           file://0001-parse-nm-fix-32bit-format-string.patch"
+           file://0001-parse-nm-fix-32bit-format-string.patch \
+           file://0001-Makefile-do-not-use-Werror.patch \
+           "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-- 
2.20.1


