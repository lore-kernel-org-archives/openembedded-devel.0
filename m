Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ECBED7BB3
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15982.1776163214916307199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sjEgzXEf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163219; x=1807699219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S1bmhhOBhRe4vAgAbOaOe6s3ck3Z1DZfv6YnVzjQ3gM=;
  b=sjEgzXEftvt87TBr6aIL/TznKIWdZWROvM50vsxWG4nvkm2MadbKV4rP
   bkoDQsOkjk5a9t4Tw2GiOEvC1jDenmWKf6A6XxRRyWFjbOI8CMmGfrTc8
   5T6HEUFWtDAwYi20fS/RPmlEE4GZSpak0abs4QcPCW7Tz2O7rHA6UwztR
   zpm6VIHrvLdU7rpKcWxO9dh6LI62p/0Fik9vCZRMWxx9644yZOR6Pm8zg
   SyurjcBXwV8mjkfRcPJVmTTrhjdfE9kBvGRgCJ9uirCWv1BGmiZ9NTxMH
   xzNO5ihUnAn5UpD4iWBO44yfSd4Qv03IFJge4S/aGQoGPCJYpdWvU7bU4
   w==;
X-CSE-ConnectionGUID: Nd2s3b6BRlCz2pX7R93SMA==
X-CSE-MsgGUID: /+Y0hiFdT/SCEwXh1b8TxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236851671"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236851671"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:19 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3CB1E2B88
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:18 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DDA341000276
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 55DEA14000E2;
	Tue, 14 Apr 2026 10:40:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/32] python3-greenlet: upgrade 3.3.2 -> 3.4.0
Date: Tue, 14 Apr 2026 18:38:30 +0800
Message-ID: <20260414103845.1728-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126321

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Publish binary wheels for RiscV 64.
- Fix multiple rare crash paths during interpreter shutdown.
- Note that this now relies on the atexit module, and introduces subtle API
  changes during interpreter shutdown (for example, getcurrent is no longer
  available once the atexit callback fires).
- Address the results of an automated code audit performed by Daniel Diniz.
  This includes several minor correctness changes that theoretically could have
  been crashing bugs, but typically only in very rare circumstances.
- Fix several race conditions that could arise in free-threaded builds when
  using greenlet objects from multiple threads, some of which could lead to
  assertion failures or interpreter crashes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.3.2.bb => python3-greenlet_3.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.3.2.bb => python3-greenlet_3.4.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.3.2.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.4.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.4.0.bb
index 21d6d620cb..728c2b7940 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.4.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "2eaf067fc6d886931c7962e8c6bede15d2f01965560f3359b27c80bde2d151f2"
+SRC_URI[sha256sum] = "f50a96b64dafd6169e595a5c56c9146ef80333e67d4476a65a9c55f400fc22ff"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


