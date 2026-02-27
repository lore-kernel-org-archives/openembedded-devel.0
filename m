Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53158FD7F75
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92748.1772187308186854081
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GixaXyxU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187308; x=1803723308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZgqskxW0wsuM5Ie9HrYT4TybHodwAF/y6ykdA32jXkg=;
  b=GixaXyxUjBOe/6Pa/AWAuGnpCxCIkRYMscq7/wIfiKWFCA+AJ1DhCr9+
   N254wRDDOgH+PSwB4bNFnlZe1ObPuRDJ/bHT3G+T/PoPMutuDx9TX4/Lb
   TPG4piCS9L20+xtzzfTyHmNclE96ho51VT5IpfdHPUz7Re9Uxx8HGKL2P
   qpXjBMbB8bnYRXhmEpAgVKVj1RoIUPE8BdK3KUsiZw+IKscy2v1ZBZtGD
   OyYSkbo6j1GWZUzB2XYWRu62h8A8bWOZ1tFVj6TKCEg+bwgKGoo66U8F/
   mcaFhC/ZFPNa38Ze5YnKUJTGxNOI8wFyO8uwkz6VJrbiDKyXdz70m+bZH
   A==;
X-CSE-ConnectionGUID: pq4ALkeoRIyxD5KQ7sk7yA==
X-CSE-MsgGUID: TGMd6fHVRn29LcMfq//xYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740608"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740608"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id B98021C1C702
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:06 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6CD22180ABD0
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8DEBA180059F;
	Fri, 27 Feb 2026 10:15:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/52] python3-sqlparse: upgrade 0.5.4 -> 0.5.5
Date: Fri, 27 Feb 2026 18:13:07 +0800
Message-ID: <20260227101327.1432-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124732

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix DoS protection to raise SQLParseError instead of silently returning None
  when grouping limits are exceeded
* Fix splitting of BEGIN TRANSACTION statements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-sqlparse_0.5.4.bb => python3-sqlparse_0.5.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.4.bb => python3-sqlparse_0.5.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
index 9f358d40f1..03c032c49e 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[sha256sum] = "4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e"
+SRC_URI[sha256sum] = "e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e"
 
 CVE_PRODUCT = "sqlparse"
 
-- 
2.43.0


