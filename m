Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E21C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 18:08:15 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.34792.1743358092402688763
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 11:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xkxw0FR6;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6efe4e3d698so32475167b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743358091; x=1743962891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWWdSBXfj4rZ/iwFr1LLO2P15j2viQe6UrsFvI1qpww=;
        b=Xkxw0FR6M1yNH+fKBKqcNN5ouVZljR9FKMXodj3VI8K7WnLdNsirurhDf93KzfEIip
         BFPg35yth/8/v4KJr4TgW1ThSzMFdy+g/75R7PYiK919mXu2QTg7T3FWCzkfhIhy3uk3
         gbRoKvftAo0/mHGG+QevClB14ZByVBFmltMZPuljcNNi0tQ3XDhxvDVz3yO2UqnnjlYA
         454XKJTgAuHm3m+QArEsv4FQVYkoLfJbuQ1qV7DDSRTFpuN2KlWAh2rM6J/ffHU2dvb+
         qRP7NvEKKRGSKOvnbWq5T/H16LlxwPi4aw8m30ux1M0dr9z33twKwAs3UPM2M2Dq/yN1
         ihOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743358091; x=1743962891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWWdSBXfj4rZ/iwFr1LLO2P15j2viQe6UrsFvI1qpww=;
        b=b0kE8dlQjrV26s8Nw3W25uYw8S34r/tpc22AQWoRBB/5VaNx2Qnxmk1bhcOcz39eUM
         vcd211orvr/5wq3uqTJVOcsppEF9tTD8y8uP8hPjTAjXw9OZmHPe00RHETdP6tBCMgQ1
         m52WFm9KyNylcVFmW97q8paG0lA+zikNbe1NiR7uPmIxUzztRhRLMeFZ2ISOF8hyfEXV
         PJZR7znvKd7FAacI2nvJLWgNZ3eichIt4gKy4R2H8esGIRqBopAdNEdOnt+CcK68LWYl
         61vMU5LNb2O7ZRvFAJxnQn5NUhDzGsWcAold9kIqyxQKwE35+uHwAQWBqpLMcPTZfM77
         S6kQ==
X-Gm-Message-State: AOJu0YzbTDlagd3xtes8AdgkPvhKH1yEUaIp2mzpT+zRaKmecBM4+tTk
	DdAPrRhu6AVFhM6whjKB+aNh3C05Yp0vXOqeRZb8jNDSe4IGIONg3CyrsiAe
X-Gm-Gg: ASbGncuebKqM7BKr1OmTZDaaGifgBB2g04nH0hSvcGa5fXPW+pxNhpqoJG1i/+RU4ta
	bngn+azMKxv04QUJDSKpGZ2QC0JVSN8opu30WArOXGYHLuZRxkmhHTNhzrYvEt+OwCNqayD0d+G
	AvAu0JSIdNaw4bnmujIFIAHAmcRXqr80AjhzC95ugjjH3biGkhGw3VGDIGgr52yfSOjAR3Trdjq
	oc5iEpUCa+LqVg8c81JtgrXnqxJ/TFWiKZDWDC8raLuVxWHmjCOtEQu0/hs0237LDYcdc+bvGMQ
	mxVhL/MS6hoBAlTG9OKSYlmmRx6I0GwvOUtWmMr/lGzUexaltQ==
X-Google-Smtp-Source: AGHT+IHWDlDqfF7wy0w0Qh3BeNWyQxOySY8mwziPjcAYNIo44c7MUhIdrqAVcLHZ3w0JhrCkJf4vKg==
X-Received: by 2002:a05:690c:e05:b0:6ef:4fba:8153 with SMTP id 00721157ae682-702570b7691mr101741127b3.10.1743358091116;
        Sun, 30 Mar 2025 11:08:11 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a98a23dsm17716137b3.71.2025.03.30.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:08:10 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.33.1 -> 1.34.1
Date: Sun, 30 Mar 2025 14:07:55 -0400
Message-ID: <20250330180756.376357-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 18:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116390

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.1

This release fixes a packaging issue.

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.0

Features:

    adig: read arguments from adigrc. PR #856
    Add new pending write callback optimization via ares_set_pending_write_cb. PR #857
    New function ares_process_fds(). PR #875
    Failed servers should be probed rather than redirecting queries which could
    cause unexpected latency. PR #877
    adig: rework command line arguments to mimic dig from bind. PR #890
    Add new method for overriding network functions
    ares_set_socket_function_ex() to properly support all new functionality. PR #894
    Fix regression with custom socket callbacks due to DNS cookie support. PR #895
    ares_socket: set IP_BIND_ADDRESS_NO_PORT on ares_set_local_ip* tcp sockets PR #887
    URI parser/writer for ares_set_servers_csv()/ares_get_servers_csv(). PR #882

Changes:

    Connection handling modularization. PR #857, PR #876
    Expose library/utility functions to tools. PR #860
    Remove ares__ prefix, just use ares_ for internal functions. PR #872

Bugfixes:

    fix: potential WIN32_LEAN_AND_MEAN redefinition. PR #869
    Fix googletest v1.15 compatibility. PR #874
    Fix pkgconfig thread dependencies. PR #884

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.33.1.bb => c-ares_1.34.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.33.1.bb => c-ares_1.34.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.33.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.33.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb
index 51b73a978b..877e29d9f2 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.33.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "06869824094745872fa26efd4c48e622b9bd82a89ef0ce693dc682a23604f415"
+SRC_URI[sha256sum] = "7e846f1742ab5998aced36d170408557de5292b92ec404fb0f7422f946d60103"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


