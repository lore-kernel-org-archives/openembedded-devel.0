Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ACACD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16922.1779875303171871910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gCk1BQO0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875304; x=1811411304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=paUZMJRblvQ3GzixMkPrWgAPK6FyP9D/gu1vsjgOn6I=;
  b=gCk1BQO0AVsloD3zEoXrVpq9ELZ8hSlXAUNygZesKOC8ztFqX5B4Tr0y
   r23gsKv1OT0DPdhC9IgbDf4Q4ZCz/9d7UMOnh9xi4Ohb8AsK1U4p9+/iJ
   a49Qsi0uuwsjKPMPPL1YjaBd2CeTcHZ3gLJNpmZedA7xGnAKQrSJlGKfj
   BBNMLIDe699q+++32qwI0nZxWW+uZKYdt5uCGmiPL88RB1rbr9hfwJdGG
   LH2Ri3d9r2alPu6/gtwZTWfrKXya27tqE9BRcOg/sG0Q0qfTlMNlT+bZ7
   06FjOvaJic8EBxASD06twWZ4b0VFObk1oOS7IRcKHi4v/qMTW+dyK4b9p
   A==;
X-CSE-ConnectionGUID: 3Y+XB3l8RXiJGc0vXPd9+Q==
X-CSE-MsgGUID: pzFfl+8aQ4+LIJChwiANDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050061"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050061"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:23 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8ABED1C1C717
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:21 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3E5AD8319EF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 453FA82A2C9;
	Wed, 27 May 2026 09:48:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/56] fluentbit: upgrade 5.0.5 -> 5.0.6
Date: Wed, 27 May 2026 17:47:12 +0800
Message-ID: <20260527094805.2039-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127210

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- release: update to 5.0.6
- env: add bash-style default value operator
- lib: cfl: upgrade to v0.7.1
- out_kafka: partition OTLP logs by resource
- sds: general fixes for sds_cat() usage
- in_forward: handle unpacker allocation failure
- tests: prevent port binding failures in concurrent OTEL tests
- engine: ignore duplicate STOP to prevent shutdown spin
- out_azure_logs_ingestion: Plug SEGV on termination
- packaging: add support for Ubuntu 26.04
- config: storage: Add total limit size of DLQ
- http_server: harden listener and architecture
- tests: runtime: wait for tail truncate output
- in_tail: fix file append cleanup on failure
- in_tail: reconcile files after missed inotify events
- github: workflows: Restore ok-package-test trigger behavior
- security: update policy for 5.0 and EOL 4.1
- sds: fix handling of cfl_sds return buffers after cfl upgrade
- tls: omit SNI for IP literal hosts
- http_server: spawn internal server in threaded mode

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fluentbit/{fluentbit_5.0.5.bb => fluentbit_5.0.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.0.5.bb => fluentbit_5.0.6.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.6.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.0.5.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.0.6.bb
index d9df95e45d..c7583bc369 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.6.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "05121015a78b81ab59ceaf86e9fb935b71f48ec5"
+SRCREV = "7b3a43645dcf41fce38ac4e72b1e9e2f7641b027"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.43.0


