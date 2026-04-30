Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09971CD3420
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:58 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17435.1777546187581658225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ieMnQPw7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546190; x=1809082190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cAsRq8DAM8eP3eq104OrmDT1GiuT+lVMzEsBgZ+Ofj8=;
  b=ieMnQPw78rQ8shKhyL5oVLpmGP/lXv9WmrtX7ZbQQwMwnUy4zT30r6ru
   npQUjugeLYMtch5AJdQ/3w1J3Qe5BGJ7tqkXPTmOxfimJbpjzUvQyfCBt
   w66U16/jfqL8bapVuJCq8TRESTT/PNyKDBBWHqZ2Q0w3CuzQEWI14XSlm
   xWE4LyNB2P/COYdwUYeTWjQ0veTUkOY9yMuY36owbw7PU4G3hA8xhgymj
   P/zBkpA0HqWIcLBBnwhYSSbpCtkzyWkL4CEMzFY4vYTfj16In5JA9F+pC
   1TrGTU+DF2wLWBf1x1eu3HrZtjFeFhaFNnHgp15JxXTduk20JAH4+70Ei
   Q==;
X-CSE-ConnectionGUID: JaafApB9TzKTEQY3J9ygDQ==
X-CSE-MsgGUID: SjaBpgaCQASoTdwlsSJjbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116188"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116188"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:49 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9449F1000142
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3DF971801EA0
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A5FF41801130;
	Thu, 30 Apr 2026 10:49:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/64] jemalloc: upgrade 5.3.0 -> 5.3.1
Date: Thu, 30 Apr 2026 18:48:32 +0800
Message-ID: <20260430104924.1106-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126683

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jemalloc/{jemalloc_5.3.0.bb => jemalloc_5.3.1.bb}       | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/jemalloc/{jemalloc_5.3.0.bb => jemalloc_5.3.1.bb} (92%)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
similarity index 92%
rename from meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
rename to meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
index edaaea26b6..a369650ec5 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
@@ -13,13 +13,11 @@ SECTION = "libs"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
 
-SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=dev;protocol=https \
+SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "630434bb0ac619f7beec927569782d924c459385"
+SRCREV = "81034ce1f1373e37dc865038e1bc8eeecf559ce8"
 PV_LONG := "${PV}-171-g${SRCREV}"
-PV .= "+git"
-
 
 inherit autotools ptest
 
-- 
2.43.0


