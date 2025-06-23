Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F12C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.13876.1750662713949908377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o731xidd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662716; x=1782198716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nGo3eNAZfnz6dEkG4ZuWx4mvnNcctG5btNCocbzOkT0=;
  b=o731xiddh9YDHPh4fQI1o5Pyi/bKyDraT7bWaCbbxFnzwwvHHwUEYoNi
   PIhcDrqZv/AQeyPmdYBv6JEsHTCTEgLS2eq6WXFShH3Kl7ZTKoMU32PYl
   eWxut3gwyrrcL0/GR9rhudnrExJHqFoRBoq4kdMgoPf025tRdzWZjzHOV
   VC1a1yNrmt9hlQKkfSfjEbB+lkZB06r2zWvYvtqvcT/lClKQdCE+G69DL
   rBmBrx8fEYflAt2WA9v6yr3ZiZHYP3fAYVYjWW+0Ej5cVA67foAeTM0Ko
   LNODpQGR+A3M6tLRyfWc58RFosfNKD4F03HuLz7YT6rlfinrbVwQVVg+y
   w==;
X-CSE-ConnectionGUID: odPziZMoStmSe8Ohs1xFlA==
X-CSE-MsgGUID: WNaZRrQmQ2qLOW8h1kjs0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203577708"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203577708"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EF8D7C9987
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A4E20D7624
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 248E91A0071;
	Mon, 23 Jun 2025 15:11:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/30] python3-oauthlib: upgrade 3.2.2 -> 3.3.1
Date: Mon, 23 Jun 2025 15:11:25 +0800
Message-ID: <20250623071138.402-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118046

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 - Removed year from license
 - Refresh wording of license to not confuse tools between BSD-3 & BSD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-oauthlib_3.2.2.bb => python3-oauthlib_3.3.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.2.bb => python3-oauthlib_3.3.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
index 833fdbcc58..80b87c1aa8 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth reque
 HOMEPAGE = "https://github.com/idan/oauthlib"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2699a9fb0d71d5eafd75d8d7c302f7df"
 
-SRC_URI[sha256sum] = "9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918"
+SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
 
 inherit pypi setuptools3
 
-- 
2.43.0


