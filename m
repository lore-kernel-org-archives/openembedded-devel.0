Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324E3D3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:29:51 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40568.1767000588015981355
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IFOg6k0w;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000588; x=1798536588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TngFd90xbPY2RyWOnSH961n8kgwTrrMkH/rVwuuX7t0=;
  b=IFOg6k0wAltKXEqravSWEoAU+wY0nAhezQWWk6krcy4dBzk8lVm/8hRl
   9lEQLZRax/86XMSqqUqBCRuQ2Ny0kpuYsj02pagwCFXnOXFvYT2QNGOTA
   kPz/K69K97opwxzBuBJXIhtLqUm0fGEDJiSayUpXDquU4CnMRvLP/jzQY
   +9CmQtN842641SDhpN4Dvj1PAnA31GS6lPObCJKPViPyC9lG5W/J9FbOD
   h1VD9LPXKGPQCNt5dDTRMeFEKm9s3XH35Fi1JaJ4hvGZPvUxUhfGwoaWp
   OIzgI943VfRyQFlbFbL+2ohaFUTtPOmeVhAL9n+QAcjVmfwDhFmW2jPfJ
   w==;
X-CSE-ConnectionGUID: gRlzeJN9To6qOcJeAajsEw==
X-CSE-MsgGUID: Rk8xubIrThSBSZQiY8FRMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="224264995"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="224264995"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:46 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4067E42A311
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:46 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id DEDA218009E8
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5F13E100036E;
	Mon, 29 Dec 2025 09:29:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/10] fluentbit: upgrade 4.2.1 -> 4.2.2
Date: Mon, 29 Dec 2025 17:29:28 +0800
Message-ID: <20251229092936.1483-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122966

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- packaging: script: Use rockylinux prefix on package testing script
- security: Update supporting timeline
- out_cloudwatch_logs: increase MAX_EVENT_LEN to 1MB with tests
- aws: Implement simple_aggregation operation
- out_kinesis_firehose: enable HTTP debugging for AWS client requests
- http_client: add ipv6 bracket if missing from host address
- lib: updates 20251223

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fluentbit/{fluentbit_4.2.1.bb => fluentbit_4.2.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_4.2.1.bb => fluentbit_4.2.2.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.2.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_4.2.2.bb
index 4ca8c5ed77..d042293e3d 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "909b1a917b4f46c40657a73821541fa03581a823"
+SRCREV = "ddfef360d7f3ac5268942c47ccc9b01864424a05"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.43.0


