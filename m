Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E1C35FF6
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:52:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.4450.1741985533457889545
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FF3nyppk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250314205215d1e7b505179623eb88-auo963@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250314205215d1e7b505179623eb88
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Mar 2025 21:52:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=d7eqyQIm60NraOLU0W/wTxvfUCUsUjE+H4lcPyQzuwM=;
 b=FF3nyppkIyNT+xYe88Fg8gggKMp0rHSIuK1AVqxEQjvdmFqSdTHnr8C4fMe+UM7ar9/2u/
 E1YhAcpruZjkau4RIs2+XPYgwJqr/4c21OyGdY9CHx1wbzp02Z7bgpYGO03yqOmNKQ5nJfhJ
 66yzCJsvLk3FkZ4A9PQUazEVOKJsWlU4c0Q4k+rhsjbatjOHQ/pknGgezWAQzZ26uzoHaZGQ
 j+abMwF+Rl/r36r7sYG0WiVLDV1xWpgVp5nLUEVnM6tk0hbpfoTl063tCVNsGi6DmAWmYIZw
 b2bJ9q6nlWIWyJQ94CL34LazfPx/Y3F0Rhp6SFm9VEfAR7CCCKBHV74Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 4/7] fluentbit: fix valgrind package config
Date: Fri, 14 Mar 2025 21:50:32 +0100
Message-Id: <20250314205035.386919-4-peter.marko@siemens.com>
In-Reply-To: <20250314205035.386919-1-peter.marko@siemens.com>
References: <20250314205035.386919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115991

From: Peter Marko <peter.marko@siemens.com>

Add valgrind dependency to fix:
fatal error: valgrind/valgrind.h: No such file or directory

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
index 94fbed0962..cd4cba6a14 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
@@ -97,7 +97,7 @@ PACKAGECONFIG[tests-runtime] = "-DFLB_TESTS_RUNTIME=Yes,-DFLB_TESTS_RUNTIME=No"
 PACKAGECONFIG[tls] = "-DFLB_TLS=Yes,-DFLB_TLS=No"
 PACKAGECONFIG[trace] = "-DFLB_TRACE=Yes,-DFLB_TRACE=No"
 PACKAGECONFIG[utf8-encoder] = "-DFLB_UTF8_ENCODER=Yes,-DFLB_UTF8_ENCODER=No"
-PACKAGECONFIG[valgrind] = "-DFLB_VALGRIND=Yes,-DFLB_VALGRIND=No"
+PACKAGECONFIG[valgrind] = "-DFLB_VALGRIND=Yes,-DFLB_VALGRIND=No,valgrind"
 PACKAGECONFIG[wamrc] = "-DFLB_WAMRC=Yes,-DFLB_WAMRC=No"
 PACKAGECONFIG[wasm-stack-protect] = "-DFLB_WASM_STACK_PROTECT=Yes,-DFLB_WASM_STACK_PROTECT=No"
 PACKAGECONFIG[wasm] = "-DFLB_WASM=Yes,-DFLB_WASM=No"

