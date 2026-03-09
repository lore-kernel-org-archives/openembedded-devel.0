Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63152EFCD96
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10841.1773050800713938541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=YeI9ykDO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1334352-20260309100639d4b191a636000207c4-rag7_f@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260309100639d4b191a636000207c4
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RKS3g3WljRtedsCdTtpShAYGY8tgFV2OZbb30HqRhWM=;
 b=YeI9ykDOcsEMxTwJLcFf/n+/eswXTNnzrtQy2bB3Jj8UNUBd9rotfyafHTDORVog7v4Xcp
 FUNcs0O5M8Ihh/MIkcW+vMn7yek5iXenGm9YcDtRgq6pjkWo2YL35Q30mP7FfdZN2g/FiYru
 OTPSMWc35ONm0vZEOh1w48g7A1Mx/fBv0UYR/iyEw4e8WsZAWGpRJz8Fyk0GYieO7Bofq7q+
 l4uBmBsAqbN3Rjqxp6WAeRyEhPz8oAj2nxWNba7UWwn8Bg/fbTMQneZ1jjwxWEBKcTQCFp7x
 2CsVivCVW6zP+uGbP6Eo5uMwM6uJGYAXafdu/wsi2IwTsZUP7JA/GKMA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 02/14] fluentbit: upgrade 4.2.2 -> 4.2.3.1
Date: Mon,  9 Mar 2026 11:06:18 +0100
Message-ID: <20260309100630.404637-2-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124974

The tag is not on any branch.

Changelog:
  https://github.com/fluent/fluent-bit/releases?q=4.2.3.1

Changes:
- release: update to 4.2.3
- copyright: update year to 2026
- filter_kubernetes: fix parser annotation leak
- github: scripts: commit_linter: Handle bin prefix for fluent-bit.c
- bin: Handle CONT signal properly under leaks command
- filter_wasm: Handle group metadata
- cmake: kafka: fix OAuth Bearer detection on Windows
- maintenance: update branch and security EOL info
- github: scripts: commit_prefix_check: add config format rules on linter
- readme: update active branch 4.2
- out_opentelemetry: on HTTP/2, read and process gRPC status code
- config_format: cf_yaml: Align the behavior of dirname against POSIX [Backport to 4.2]
- filter_log_to_metrics: fix initialization and exception cleanup
- out_stackdriver: clean up oauth2 cache lifecycle
- filter_kubernetes: Adjust cleanup ordering to avoid use-after-free [4.2 backport]
- in_winevtlog: Add text format for event rendering [Backport to 4.2]
- in_tail: Add skipped_lines counter [Backport to 4.2]
- in_splunk: Implement handling remote addr feature [Backport to 4.2]
- aws: switch AWS Endpoints for European Souvereign Cloud [4.2 backport]
- plugin_proxy: enable event_type specification for proxy plugins (4.2 Backport)
- in_splunk: Plug memory issues [Backport to 4.2]
- dockerfiles: install minimum components and avoiding to use includeRecommended

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../fluentbit/{fluentbit_4.2.2.bb => fluentbit_4.2.3.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_4.2.2.bb => fluentbit_4.2.3.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.2.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_4.2.2.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
index d042293e3d..b476206437 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.2.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
@@ -17,9 +17,9 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "ddfef360d7f3ac5268942c47ccc9b01864424a05"
+SRCREV = "fca8b5bf46416267a4c8de185e4044da09cf0f16"
 SRC_URI = "\
-    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
+    git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
-- 
2.47.3


