Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCAAC4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44630.1784715885056522786
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s4fbKMA+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715885; x=1816251885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQ163WiY4H2kiCa9pJqaGiMrvIc+uckseG3OP6QhBqg=;
  b=s4fbKMA+sv8IE5BnioTn5BAC6mI6zF6jswuCfZhy6BjNoF7Fx3gvjVNu
   CS/ZTDjOSa7xtRpTSUa/ju23raS2Gvct7+UM3+M4j4mtH4ySqrmJ/2mFT
   hZv9p8wnOlM7jiXefG+jY9hKuLSVhHVa8LXBqHTX2mpqvxfDl/1KqoQiZ
   UaxCLEqkPb5gubOu/qka8KVA0RQK8lvM2YQlmdOTHtEyue4KY69uahOZq
   wgguQ2w6vSlulkvujEvAzfi0qxzP5GbPGWmwR5KAMp/smHJMvkGgoZLkL
   rAn5/G6qN3l4T+PogdKjYI8L2h7Aoo1JQNrQK7xlFaXDpFeDJ37O9Je9Z
   g==;
X-CSE-ConnectionGUID: Co4nnTH7RESzgeHVyBJawQ==
X-CSE-MsgGUID: yUJgjlvNS6uYjDtjm+2KlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="234395344"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="234395344"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:43 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8430B100034B
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:43 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3360E1C00153
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 407244046B3;
	Wed, 22 Jul 2026 10:24:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/37] python3-tox: upgrade 4.56.4 -> 4.57.0
Date: Wed, 22 Jul 2026 18:23:13 +0800
Message-ID: <20260722102320.1019-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128400

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Surface the org itself in the FUNDING config
- Replace prettier with mdformat and yamlfmt
- build: use test dependency group in internal envs
- feat(python): match free-threaded and debug interpreter builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.56.4.bb => python3-tox_4.57.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.56.4.bb => python3-tox_4.57.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.56.4.bb b/meta-python/recipes-devtools/python/python3-tox_4.57.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.56.4.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.57.0.bb
index f310db3d28..37dd27ebd1 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.56.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.57.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "d49e371119ebfafb15054ad7ccff3d03027ccb65195fae3ac656b431b5524055"
+SRC_URI[sha256sum] = "b2f758011dfbad7be4b4cc39d2cae21deeb3c3c186e6d7a92d7630eade4218cf"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


