Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB5CCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17461.1777546232639185052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pOoDJGn5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546232; x=1809082232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NhiyHYAKcpLuO/tLPCCTpzlFfNDAlY54O1Y1HqNSf6o=;
  b=pOoDJGn5tThQ9N91fFZM2m6OnIgEDh4eVNaCRWOyeFOIxZFvxuTImLVS
   NfjctzxGmeEST4eyiaHufzb3BF/aOz1ER4yzqk22ZTLbCjKmdzF6bSo9i
   r9RowX1ZB3Zv5QDcjaZ0iMzUAwawVUCUfTXO8Xr9wH88ohzbSay70lY4x
   tnsxmPsjj99k91ImewnhXrmEl+yuw0+Qb+386WnV84fjZfO68uIvGjQ+n
   K/tEfC2F5Gjv1vcqSrvxBsjn0cCPdQWhtR5vT+x8NrcJUypEFkx6FSuJH
   VFRaWff3+XD0cCo204YFAZbK5vHbjW8YmL9hniy2OLJLjvT2QZHQolbda
   w==;
X-CSE-ConnectionGUID: w2fLfhR5R26VWs0m1DTZ8w==
X-CSE-MsgGUID: /3wzLkIWSPuiSXb62qxCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238566118"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238566118"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:31 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2ED451000142
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:31 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CECE2C0023E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 52637180113E;
	Thu, 30 Apr 2026 10:50:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/64] python3-inline-snapshot: upgrade 0.32.6 -> 0.32.7
Date: Thu, 30 Apr 2026 18:48:58 +0800
Message-ID: <20260430104924.1106-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126709

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed snapshot comparison for dicts where keys are dataclass instances (or
  other custom objects used as dict keys), which previously caused corrupted
  snapshots - either collapsing multiple entries into one or appending duplicate
  keys on subsequent runs
- Fixed tuple snapshot updates to compare elements positionally rather than
  using sequence alignment, so existing expressions (e.g. 3 + 3) are preserved
  when elements are removed from or added to a tuple.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.32.6.bb => python3-inline-snapshot_0.32.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.32.6.bb => python3-inline-snapshot_0.32.7.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
index 1bcd3a457f..57a1b4965f 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "224a96eeb86c4b2831d274239d3468dc0b7819264f608f595b2f9d01f79a6e38"
+SRC_URI[sha256sum] = "1a97a50420de32b86c422cceadf950f1f343ba03a28b878a757ee492b741c093"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


