Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17A5C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9401.1788344999262133477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DjVVIPQR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788345003; x=1819881003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K1glaiGgIEiIw9cS2YJL3IsVD15zHUSHr3MTEw3dW4M=;
  b=DjVVIPQRtqQECLwv/nVbbArxGzZwXNXozIseT5OFSFmAUfwERrYQjHDj
   0+KkuTjVeo41+h4soaEaKCwbkw5/HTzC59BWTpGP2z0/9ojVrMewLrLPU
   v0EcTFn5JUqLJmDV2+84fZtNq0bbzs/TMJ56qHDUri6SsPIB16i8psTdc
   AmZRfyeK1CbNQAHKTtevIF65dXTMOxJ2ZulE7ENiQVcLYDaF3CB8/REUY
   4wOPHj6MXYIRrW0lutwOyNmTOTsV67hbbslU/8G+8DuN6P67IWYfXACG2
   BorOxSciSHPikWJSd2hAu+8b1JxMSU5iM14qtUqJgQiyoIQOmmcL2UK0P
   Q==;
X-CSE-ConnectionGUID: sEzGsNPsQxy6VPBbqg5WBw==
X-CSE-MsgGUID: CePgj4YKRQG3sM2VC681Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="239767271"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="239767271"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:30:02 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B0988C00227
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:57 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6472A1800261
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 6F3702000224;
	Wed,  2 Sep 2026 10:29:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/34] python3-websocket-client: upgrade 1.9.0 -> 1.9.2
Date: Wed,  2 Sep 2026 18:28:54 +0800
Message-ID: <20260902102900.1296-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129687

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cket-client_1.9.0.bb => python3-websocket-client_1.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.9.0.bb => python3-websocket-client_1.9.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.9.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.bb
index 87f25db0fc..3be6e09069 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.bb
@@ -5,9 +5,9 @@ This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b8d4a5e03977c68fad62beee8185704e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=69c77173fe8892e9fdecd46557b957ad"
 
-SRC_URI[sha256sum] = "9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd1bc7e08a46ec98"
+SRC_URI[sha256sum] = "0fcb57545848be86992e128218fd96dd87a6769ffdb1a968dff79632b85604d0"
 
 PYPI_PACKAGE = "websocket_client"
 
-- 
2.43.0


