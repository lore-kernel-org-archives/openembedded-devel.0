Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C94C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 17:14:34 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.1295.1737998065805629559
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 09:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hPLpUSDN;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e46c6547266so6886851276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 09:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737998065; x=1738602865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayWRUO1xvf+GsboGJFjdNExZYDRVnIEnPw/ddTNgNBA=;
        b=hPLpUSDNMjteZqGP+Q/LgRehH4Cee84kiWLIJr3AVJGju+NIgh6Qb3zmvDAV5slvJl
         FwyGWNa5n4qSDbShv0fMkCf61VD8TwmeNWC++KayKWAFkGAJj+t5DrQqmVBgwWIpkkop
         +4aXAT9fxlh7H/lpKq4U6LuYIUOnG5BOjz3CrZnwfH9LoYEyN0GSsDliv7Z1xl+0vFet
         SeMUaAqrJfqpxhh/O+mCRKY9tKJt1yPONOkjgPft2JDAoBHBqpwqpRA48ueXwQ56BdtQ
         enVhsCdWHMPH3Y2Cm9DMWhof45B/LWuLyq2GJXbpmhhasIwv5AtTgvNt177ZPoqq0G7e
         hXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998065; x=1738602865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayWRUO1xvf+GsboGJFjdNExZYDRVnIEnPw/ddTNgNBA=;
        b=CZA8GO2c0mLDhbN1Lczv7a1pTxjEe9hMWtwb9rzk36qgAPDc1g+dViuJaeHBIMu4aM
         4J01TQi/4kiQFFs4sx24gtmr0+yRUFt3Ak6f/AAnEeWACQfPU6mjLn/zNrN+dSyWUTLV
         7lIrPGo6lDnCGpvem0PzXq2VxY3E6l9a0taV2eGW8pQp4ZUv0Siy/KJI+wmiy5tSXG7g
         xbnc8nI78mXsToYl4bZoHUia727Vwq1uXKLOVAcWxvtge7tQdIfu8cHIrObao0SyJsiH
         d3HvG0WOLgUhHwEwk/IV5Nr//yJDGlj7n3HhzE29/oe+MQ8QdFm/KaAuMrt1ohO37045
         XhuQ==
X-Gm-Message-State: AOJu0YwGNP+fbaV0XjisgkHq8FJDvBGCbbgGLdNrxbBG+3OVcW5ZiaUf
	3keHisc6CKywTG+gDWNRyHH2TMwV/Jgj5maA8IhjZHLmcwbTA9h7nqAi2i/g
X-Gm-Gg: ASbGncvKPtdcvWAM+E2iNeGcWebBU7pupuXeC0Qu1wqhDfeypCtHUK10GtwVqbDy2zv
	SZ6yoY3NdTaJmZ5UtBfer8eubShf4lok+l/BvmtlzA351QidbZPRa3jUdZ3uO1cod9LwdGJBwPq
	o6bIUX5lXUuSEtpl4fb0gcIutLyoFpZpabWPk5e2pJB9g267pAot8RgaO0jC8ooP8f5IUyJS4c/
	f9e7oZp32vsGtU88C2krZFRaVJ4Iq7yj3gdX4UYPYwfaGIyz4orgA9OjuhoIS5nzFC3kLk3W0mX
	9pGIyMMdYU5+ICwxbgAoyt4tM5YjTn7yb6sZenY=
X-Google-Smtp-Source: AGHT+IEBeWuS6VAfkZ+Ehm25i/5NrXoziy2VxZdScI0E/HeyyfYrmxulsgKsfRubIBzmtJL8EQSk2g==
X-Received: by 2002:a05:6902:2605:b0:e57:f6be:2ab2 with SMTP id 3f1490d57ef6-e57f6be30b3mr24087296276.33.1737998063329;
        Mon, 27 Jan 2025 09:14:23 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e583b862558sm1688457276.43.2025.01.27.09.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 09:14:22 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.32.3 -> 1.33.0
Date: Mon, 27 Jan 2025 12:14:07 -0500
Message-ID: <20250127171407.299528-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 17:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115110

License-Update: Still MIT licensed.  Just removed a header from the license file.
  https://github.com/c-ares/c-ares/commit/595cf2133488d2e02c6389577a1b511971dba1ba

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.33.0

Features:

    Add DNS cookie support (RFC7873 + RFC9018) to help prevent off-path cache poisoning attacks. PR #833
    Implement TCP FastOpen (TFO) RFC7413, which will make TCP reconnects 0-RTT on supported systems. PR #840

Changes:

    Reorganize source tree. PR #822
    Refactoring of connection handling to prevent code duplication. PR #839
    New dynamic array data structure to prevent simple logic flaws in array handling in various code paths. PR #841

Bugfixes:

    ares_destroy() race condition during shutdown due to missing lock. PR #831
    Android: Preserve thread name after attaching it to JVM. PR #838
    Windows UWP (Store) support fix. PR #845

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.32.3.bb => c-ares_1.33.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.32.3.bb => c-ares_1.33.0.bb} (84%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.32.3.bb b/meta-oe/recipes-support/c-ares/c-ares_1.33.0.bb
similarity index 84%
rename from meta-oe/recipes-support/c-ares/c-ares_1.32.3.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.33.0.bb
index 8bc22f9970..44c5834695 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.32.3.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.33.0.bb
@@ -3,11 +3,11 @@ SUMMARY = "c-ares is a C library that resolves names asynchronously."
 HOMEPAGE = "https://c-ares.org/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2047e36c793a8e9c3d3f4b66f8934a19"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "5f02cc809aac3f6cc5edc1fac6c4423fd5616d7406ce47b904c24adf0ff2cd0f"
+SRC_URI[sha256sum] = "3e41df2f172041eb4ecb754a464c11ccc5046b2a1c8b1d6a40dac45d3a3b2346"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


