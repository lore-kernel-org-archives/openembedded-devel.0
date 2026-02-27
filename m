Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53184FD7F79
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92461.1772187301717272117
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OAV+of6S;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187302; x=1803723302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ahwigqKu0Oyw+OHJJ19UH4dzMyatrtUItmn2FXWmWlk=;
  b=OAV+of6S6YW4Nv4D3k1c5/YIWr+gzJeZ4PgnGVsMnhfRXONB17qByJJm
   Zkrqz3cC+hltyIdUi+pC2OJzVa7zr7z0EZiqubRPViXGma+Jc53lRzyoQ
   4rRowO5H6vEinulECcXJw+ZGCuh8UYtil1pia4qL3QFZ/TswzAlVRBV+M
   z5gVfgBSGu36uaUaCgcZmjjSuVxvqEOj8ElUyi28QmAioUNC5yeD8Om+g
   ow4lLuM2ch9wV2sQlUFJiY95L8AOv0aIDX4FVQMqczYhFcFZ+5ouHAyxN
   4j97n7wvAAknYnhG41F4WlWaK5gtScn0FFqE5L1WcGkh9ar4HCZDlOTSK
   A==;
X-CSE-ConnectionGUID: NlMajR/4TN+9qEWsP03D/Q==
X-CSE-MsgGUID: JcbIdELpS2eLuG14XjK2xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="230730677"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="230730677"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3671842A311
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:00 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DA2F01C00CCF
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 137C318005D0;
	Fri, 27 Feb 2026 10:14:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/52] python3-reportlab: upgrade 4.4.9 -> 4.4.10
Date: Fri, 27 Feb 2026 18:13:05 +0800
Message-ID: <20260227101327.1432-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124730

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-reportlab_4.4.9.bb => python3-reportlab_4.4.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_4.4.9.bb => python3-reportlab_4.4.10.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.4.9.bb b/meta-python/recipes-devtools/python/python3-reportlab_4.4.10.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-reportlab_4.4.9.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_4.4.10.bb
index bd8f33dd0a..57e62893b3 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_4.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_4.4.10.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "7cf487764294ee791a4781f5a157bebce262a666ae4bbb87786760a9676c9378"
+SRC_URI[sha256sum] = "5cbbb34ac3546039d0086deb2938cdec06b12da3cdb836e813258eb33cd28487"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.43.0


