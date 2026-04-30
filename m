Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA04CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:52 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17247.1777546243832757177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k/lx069y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546244; x=1809082244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JALwUCJZH1TxjN/rWVFKOIOzzgYUmW0RwRp+QWrOQsQ=;
  b=k/lx069yMq5BsRlqoKW2rbWi/A8HHdYmgSkKHXdJ5t6LdW9l7//kY9si
   j4+LeQHt99zyjwUSMGxiSE8XFgAGzukO2m2s30kddbAvm2iVi5BjPVR+7
   4XL7elJSeF3yGR+eSNQssWsNXutYrIr4Yf5nKMRyuHczeffW1A4yEkUVp
   ceR0Azs4H1Wfur2rn/XQODbBxd4rqOx/US9biy9CBcvfS+mrPFXeGZIlw
   gmmbp3cVJ9njJ+yxoyzRmledWtems1QdRdtnb2re1hSvII5jTkZWKV82S
   +NdHTKzws0NXpRGNkd7siDR98KQTNwpJ1SrjtbK1pB2Ep/my/4gmwA4D2
   Q==;
X-CSE-ConnectionGUID: j5QZKrJpRUisMa30hnAAdQ==
X-CSE-MsgGUID: nv9R4TwxQlyfiROeR0KJ8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552732"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552732"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:42 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4B0458203D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:42 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 072EB18002C2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9CFD2180113C;
	Thu, 30 Apr 2026 10:50:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/64] python3-pytest-codspeed: upgrade 4.3.0 -> 4.4.0
Date: Thu, 30 Apr 2026 18:49:05 +0800
Message-ID: <20260430104924.1106-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126716

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix: fix segfault caused by multiple activate_stack_trampoline
- fix: Exclude setup time from benchmark in walltime mode
- feat: collect Python toolchain information via instrument hooks environment API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-codspeed_4.3.0.bb => python3-pytest-codspeed_4.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_4.3.0.bb => python3-pytest-codspeed_4.4.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.4.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_4.4.0.bb
index 3fc2715102..efab39fd5f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.4.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
 DEPENDS = "python3-cffi-native"
-SRC_URI[sha256sum] = "5230d9d65f39063a313ed1820df775166227ec5c20a1122968f85653d5efee48"
+SRC_URI[sha256sum] = "edb7c101d9c50439a42cf02cfa9c0ac92da618841636bbebf87c3fa54669442a"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


