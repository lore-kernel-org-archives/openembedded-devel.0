Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFE5C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 01:24:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.12666.1701393860395168516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 17:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PppQeYch;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40859dee28cso14147155e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 17:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701393858; x=1701998658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/XE4YV0hV8gaAx37wnRs65Mzt6qU7MEImQINt+XRvI=;
        b=PppQeYchYm/6R4S8JlnUK9/yfi0TqBWIWwcqGG45BnP8V7SRiG1GegtMYRXho2F//D
         hnwbMJR7KD/v1Gravcj/baPoCVppkjP5td6XneeKsgiki27ws4NpyCxkRChDZcb+ylRt
         ov6PnT1fJdDx84BsHcfoE69sQTYU0+5eTOf5UZ0iQ0zrJVtlK05kQ6rOCEWKHV0ZwIBs
         XRIerJZtYY05rnqERDdsbLqmBLzf3qa25/GX5wcCYuCMdJvA2tosmcAIJyo51LAbNoov
         GXGKQJhzxA6HfWGa3srvV1wl1EbAJNaba5e/QOFpl/4Pyu1/wP5InKCLZdbYBLrguqug
         tiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701393858; x=1701998658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/XE4YV0hV8gaAx37wnRs65Mzt6qU7MEImQINt+XRvI=;
        b=i6s37az3jWYuTxsI1uwK+nc3MCGD8ChiRRnuPTdIJM1a30jbSlWU5X9geuRtJY124R
         AaEJKp7VNMkpIsKRa6EVuMlPa0SSe6Od2vNl7GqygIhXm7wcPNZTIhlXcg4G3zOTKWnv
         YsuvYNntb2agnY0b3LOvrFLcUBD6gn7/JL9pX3su5d6l/vY1JxYNd7SPBHxAOr6zhUiZ
         fP9iYKURnf+axoz3wOZ5qPDIqD+3fUIm/SNQFjGVvKpS2Wp1etuvJZBuBqRmnrnwGybB
         aqlpCj1fpnCxQiwutxj8Ea0N4rEvqrRcQqq0qjmUVjnvNjznkZVpcm6hxU+mrEdetDES
         BV3Q==
X-Gm-Message-State: AOJu0YxXVX2UjxaQhCqF+58xjaqtL0bllQqUtwU82IuhrNxZ2VcURlaZ
	ysDYHRGxNCjDF77w7OFCNIxU80iHCIU=
X-Google-Smtp-Source: AGHT+IEl74vzS01+wJ5gX2y3N8nd7dqzz3r9oBbLIzEiVka+N9l94bPrLEBQAf6c4gBQtvchj6TlZA==
X-Received: by 2002:a7b:cd8b:0:b0:40b:5e22:970 with SMTP id y11-20020a7bcd8b000000b0040b5e220970mr186554wmj.95.1701393857740;
        Thu, 30 Nov 2023 17:24:17 -0800 (PST)
Received: from localhost.localdomain ([2a02:8440:d20f:725:81a3:348f:7a7a:fb9a])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b0040839fcb217sm3737452wmp.8.2023.11.30.17.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 17:24:17 -0800 (PST)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-devel@lists.openembedded.org
Cc: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH] monocypher: add crypto library recipe
Date: Fri,  1 Dec 2023 02:24:14 +0100
Message-Id: <20231201012414.46811-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 01:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107182

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

Adds monocypher, an easy to use, easy to deploy, auditable crypto library written in portable C. It approaches the size of TweetNaCl and the speed of libsodium

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 .../monocypher/monocypher_4.0.2.bb            | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
new file mode 100644
index 000000000..899638161
--- /dev/null
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Monocypher is an easy-to-use crypto library"
+DESCRIPTION = "Monocypher is an easy to use, easy to deploy, \
+auditable crypto library written in portable C. It approaches the size of TweetNaCl and the speed of libsodium."
+HOMEPAGE = "https://monocypher.org/"
+SECTION = "libs"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6a251155d943c8531e01a139f3fc531a"
+
+SRC_URI = "git://github.com/LoupVaillant/Monocypher.git;protocol=https;branch=master"
+SRCREV = "0d85f98c9d9b0227e42cf795cb527dff372b40a4"
+
+S = "${WORKDIR}/git"
+
+CFLAGS+="-pedantic -Wall -Wextra -O3"
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'CFLAGS=${CFLAGS}'"
+
+do_compile() {
+    oe_runmake library
+}
+
+do_install() {
+    oe_runmake install-lib
+    oe_runmake install-pc
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


