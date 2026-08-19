Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55252C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3343.1787132201099261204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZTbXbE4h;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132205; x=1818668205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+pEeOAa54vi1ucrIKTHzNIPEoUIELeiZibgG8TMqbJ0=;
  b=ZTbXbE4his9fp9wfQ7pm0l3G5y6jDGyRFfaf6hGusJKRqgfv6rX6QabC
   qGcRpWaXdfICokH1Bvwd86kvArJ6ZsQ435vcU1ign90NSlujv2istjjoZ
   jlzG44fhrwWCKV+89MZCmkIf3DD5TdxLbAO4D1/EMu3NhkiAkuz37jHNp
   dEXCt77KRFw1FvR1qrsVOxOCfmMIkYDDwC3rqfEuzS0+LzAG89UPw634v
   Bv469UXmvAFmroecyYLnLom23FASBUkxPnTN3MsVh5rfdSpE8K5P+CBpo
   iTbHNxHRNJoX0DXYlHHR69we7VNN7M9piye8BZqnxhpJm1tbZyKrMivzo
   w==;
X-CSE-ConnectionGUID: NpU0P3KST7Cd5vuXq5Tx1A==
X-CSE-MsgGUID: EKH+ke9HRjK3CuTmUAO1IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507899"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507899"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 898E11C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:39 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 39906C01EEB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 72F911801C11;
	Wed, 19 Aug 2026 09:36:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/70] python3-pre-commit: upgrade 4.6.1 -> 4.6.2
Date: Wed, 19 Aug 2026 17:34:49 +0800
Message-ID: <20260819093514.1101-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129315

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix language: node hooks that contain "scripts": {"build": ...} with
  npm 11.x.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pre-commit_4.6.1.bb => python3-pre-commit_4.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pre-commit_4.6.1.bb => python3-pre-commit_4.6.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pre-commit_4.6.1.bb b/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pre-commit_4.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
index d1b8cb5160..2691fdc469 100644
--- a/meta-python/recipes-devtools/python/python3-pre-commit_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b53a93744e3ff841e5fc9a934da8e1c8"
 PYPI_PACKAGE = "pre_commit"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "03e809865c7d178b9979d06c761fcbfe6808fdaded8581a745bb110e52050421"
+SRC_URI[sha256sum] = "8f5d7bfb021ecdbcd9d49d89847082dd24172ccde534390081a679ad046e2441"
 
 RDEPENDS:${PN} = " \
 	python3-cfgv \
-- 
2.43.0


