Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0748C433FE
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 00:46:12 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.25867.1665881163725212278
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Oct 2022 17:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=azWMKMcD;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso3933649otb.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkq/RvaLqmZLDJVxvoKG2meLczmBzRJAKNqaPMyy7jg=;
        b=azWMKMcD30cEpc3bbB0J/ZiHGf8m9hYs8qopr+bYnj4J4ZAQiYQBQwMsLPjIkUu46w
         /yMHR/7XHcaTevbB2A2g7PTXJb5jyjkr/XL/CRcZlM+CW/BhAcOCVGtcHK/Py0RTjy4B
         ptSpv4nlzDPZekP8KdJQgB7zvv7+jEqh5sWKX/3wOtrFNzFBDp/aR45rUDKZz8jV/n2T
         wCPO91+qnDyu+SGerZ8lzIF9M+JdWWbylLxhQxoJgSpj7qceKiIMkWBATsaV9UwC93BL
         jLAgdo6598E6P4C6Hu2Z1K0bkIPJFc0VyQj0JXI98gdyUKwvnX0Axx0D3K50WYQoTzX2
         xRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tkq/RvaLqmZLDJVxvoKG2meLczmBzRJAKNqaPMyy7jg=;
        b=0licYmL/nhy8OlINkVZYzfbmCKrB6L1iym6Yp3V1xZFRuqg+f17xGgcbMDrDlYVdT7
         cm/jqZXLie+3KB3tUP0bqRtL+nO+PSExn0FJoRS3UZ9GtlmnTTpebnXyce5JcU0669qd
         xgIsHA8Iw3fh6YJiTWv+YsIusRllxclzidLYGlvvUaw/OmEnznSi62+SpuvLr2KQqA/V
         DdF8jxuvyH15+Ko7cgTTPYW2UBOmxHCmXzW2PFj38ZuNVDSzmIEpSKSQgr3DcsBNJehm
         /GtxQs9beL6AURBlI6oJOtMARTI9286Veg4K7QR1jE7QQtBZKgM6NquFh4sbezLfHanv
         tROA==
X-Gm-Message-State: ACrzQf0jVIxjniT2WVTdtO1bMpuagZOD2AXIq9y2qo4EosszF52dYgtW
	ZEiBadYFjklforHkCgv1kGyt5ZCbbh4=
X-Google-Smtp-Source: AMsMyM6D87YHC4JP45joszwSrqAHbKpKpIYqLL9mENg/UUhIQ/P/oC6SgiuqaqYHjKU8RcYdhfq5JA==
X-Received: by 2002:a05:6830:1cc2:b0:661:dc05:41d7 with SMTP id p2-20020a0568301cc200b00661dc0541d7mr2043153otg.294.1665881162695;
        Sat, 15 Oct 2022 17:46:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:3b23:a638:a18f:7de5])
        by smtp.gmail.com with ESMTPSA id nw16-20020a056870bb1000b00132756f2c94sm3107135oab.12.2022.10.15.17.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 17:46:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [meta-oe][PATCH] crucible: Add recipe
Date: Sat, 15 Oct 2022 21:45:55 -0300
Message-Id: <20221016004555.3163258-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 00:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99179

From: Fabio Estevam <festevam@denx.de>

crucible is an utility that provides userspace support for
reading and writing to the i.MX fuses.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../crucible/crucible_2022.05.25.bb           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/crucible/crucible_2022.05.25.bb

diff --git a/meta-oe/recipes-support/crucible/crucible_2022.05.25.bb b/meta-oe/recipes-support/crucible/crucible_2022.05.25.bb
new file mode 100644
index 000000000000..73856d5704b0
--- /dev/null
+++ b/meta-oe/recipes-support/crucible/crucible_2022.05.25.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Utility that provides userspace support for reading and writing to the i.MX fuses"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a64ced9463b8c81d08335d41966e0592"
+
+GO_IMPORT = "github.com/usbarmory/crucible"
+SRC_URI = "git://${GO_IMPORT}.git;protocol=https;branch=master"
+
+GO_INSTALL = "\
+    ${GO_IMPORT}/cmd/crucible \
+    ${GO_IMPORT}/cmd/habtool \
+"
+SRCREV = "837bdb65a20de240f92ea57727385352e06b977e"
+
+# Workaround for network access issue during compile step.
+# This needs to be fixed in the recipes buildsystem so that
+# it can be accomplished during do_fetch task.
+do_compile[network] = "1"
+
+inherit go-mod
-- 
2.25.1


