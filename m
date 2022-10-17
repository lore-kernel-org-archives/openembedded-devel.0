Return-Path: <sebastian.suesens@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E400C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 06:17:41 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.37832.1665987453350197573
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 23:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EUyOKHm3;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: sebastian.suesens@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id 13so22570893ejn.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 23:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMsuFrpjPC0qZxPO+AZVPIm6QkzitHQOW9ozUZMjo5g=;
        b=EUyOKHm3uOOUvArgPgVi9qfgbU6RA0c9FX9rLIo4Br9NRBIvhVStLbwl2KOmRQHWyS
         8JnsH9AocKEqorhS0/Q0ngbu7zJZtP/J3BOeeW7C0l38BVh/4NyLi5e9PX7T6CzO2CLU
         9h5hDIlc0LjJQnWC5jXbS6yPqbQyDf47QJpFlhQZQW/BI4HTJhJRUSBfrmQSIBDgXuq4
         dMZij9Y5K98V5X9SfE5emp+PNyy4kZQ/6wijqJ0r8bXvFKeJ+daKqghv4F3isxBD5MHj
         WsKWPrKcsluD5NY+fUGZCIdP9FeNLfkAcwi3nfh4F4UOPTutEFwclzJLWXcLwUQEfy4s
         aRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMsuFrpjPC0qZxPO+AZVPIm6QkzitHQOW9ozUZMjo5g=;
        b=1mhPaeFHNxqefywkzDFAiOAs1YTxyve5z5NeYIffR8AArEKarB/f3ZhCGhRhEsP6v4
         KE9f5y4aKO1xyyqBIaYXCIeKvsIQnKJoYtde9hsZaKO9IAotqbE4VJ/B8XigP5ZF3OSg
         iUItHOc6Bb+V1LUWiGOmNX/YVanCuPHJNhFYHCC3TTFs8p7OKEFd0amao4KaLQg7an/b
         X7Hma6X+eePYjxoIYEcoHvBzUBas9YIRfXmtaFSwOvZQSs8p95xcyg2pB7xiHTdFqBcO
         PzpwR6Ug4Jkd+36/NFcpGMRfO8Zrc68RE/GFNZ2S8Xmuo7owUS2Hrl4RySC2jxmqRfFS
         1Dyg==
X-Gm-Message-State: ACrzQf3dcFyuHW1rbBcrn/vkjKLDFgumAE/Wn4nvpZEQPXGqsgVO1x+J
	XtP9mblZ3ViR1OfR2xd8a1JzLC4ha/A=
X-Google-Smtp-Source: AMsMyM48TCKp5HyKJSMkIMkObxxGNgCfP1Dh8Gn0KQqYsTUfgTEiCjOlfa+BgU1lC7pZpLTQ7oA6OA==
X-Received: by 2002:a17:907:161f:b0:78e:11b3:8962 with SMTP id hb31-20020a170907161f00b0078e11b38962mr7601485ejc.0.1665987451551;
        Sun, 16 Oct 2022 23:17:31 -0700 (PDT)
Received: from DENM-LSVR0-A070.basler.corp ([185.12.91.67])
        by smtp.gmail.com with ESMTPSA id ss5-20020a170907038500b0073c80d008d5sm5452803ejb.122.2022.10.16.23.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 23:17:31 -0700 (PDT)
From: Sebastian Suesens <sebastian.suesens@gmail.com>
X-Google-Original-From: Sebastian Suesens <sebastian.suesens@baslerweb.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sebastian Suesens <sebastian.suesens@baslerweb.com>
Subject: [meta-oe][PATCH] md4c: added md4c lib
Date: Mon, 17 Oct 2022 06:17:29 +0000
Message-Id: <20221017061729.2168166-1-sebastian.suesens@baslerweb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 06:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99189

MD4C is Markdown parser implementation in C.

Signed-off-by: Sebastian Suesens <sebastian.suesens@baslerweb.com>
---
 meta-oe/recipes-support/md4c/md4c_0.4.8.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/md4c/md4c_0.4.8.bb

diff --git a/meta-oe/recipes-support/md4c/md4c_0.4.8.bb b/meta-oe/recipes-support/md4c/md4c_0.4.8.bb
new file mode 100644
index 000000000..fc3dbb3ae
--- /dev/null
+++ b/meta-oe/recipes-support/md4c/md4c_0.4.8.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Markdown for C"
+DESCRIPTION = "MD4C is Markdown parser implementation in C."
+HOMEPAGE = "http://github.com/mity/md4c"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7e0fbcf3701aad22f2d2e0624a703795"
+
+
+S = "${WORKDIR}/git"
+
+SRC_URI = " \
+        git://github.com/mity/md4c.git;protocol=https;branch=master \
+"
+
+SRCREV = "c3340b480e5232711858108be07460a9836c8ab5"
+
+inherit cmake
-- 
2.25.1


