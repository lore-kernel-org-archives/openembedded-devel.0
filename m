Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23BDCAC5B7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8322.1758704444729047245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k9Bf5L8k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704445; x=1790240445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jcHuGtj8tsD5CrG+15SZx6tRZd4W69fmGmOk3uAnybE=;
  b=k9Bf5L8karzXxmNMyQDkvx3Nl2abSLgTbCafcM2BuB3eQLWrO2SuwxXV
   bKRPf3Ej6eUrB27E3GUlLTNcwuQtxftpS0bfuPkSdN9yO6/4ebaClH81O
   r0Oh8a72glM4+fOlTGHcowHeepyCaH9Dx0AhmdH3yfH/JeoPM4v5O+HeJ
   KcIYqV3h7ZSl2kLYE4NtpUCQHIPnD+S5WHRZGph9UTWMWn+Kt5lDkMxXd
   CPqPs65A/zKgZglXlW4EGrbanlm2XjpnvRWWp3G3N0FYAgNE7hmvj88BU
   be8ApdouS/62sFCDGlm/c1o+gSoVt62FqQelzqzKanEtMhC0Mn6KNIKjE
   Q==;
X-CSE-ConnectionGUID: D/lxlgdjRhyrUnErZwqNKg==
X-CSE-MsgGUID: yPckMQQETJ+Exd1tb/4hJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="214326379"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="214326379"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:43 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id F02A8C00416
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id AA177C011BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 05C05101C3DB;
	Wed, 24 Sep 2025 09:00:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 914E41A0097;
	Wed, 24 Sep 2025 17:00:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/29] python3-dirty-equals: upgrade 0.9.0 -> 0.10.0
Date: Wed, 24 Sep 2025 17:00:18 +0800
Message-ID: <20250924090029.1786-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119784

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: add "to present" to Copyright

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-dirty-equals_0.9.0.bb => python3-dirty-equals_0.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dirty-equals_0.9.0.bb => python3-dirty-equals_0.10.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.10.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-dirty-equals_0.10.0.bb
index 5fa86e1d8f..6aa4d53cdc 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.10.0.bb
@@ -8,9 +8,9 @@ into its own when writing unit tests for applications where you're \
 commonly checking the response to API calls and the contents of a database."
 HOMEPAGE = "https://github.com/samuelcolvin/dirty-equals"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aa97bb3778992892e226b4504b83b60c"
 
-SRC_URI[sha256sum] = "17f515970b04ed7900b733c95fd8091f4f85e52f1fb5f268757f25c858eb1f7b"
+SRC_URI[sha256sum] = "623d7a07c5ba437f1a834c6246d1e3eb97238ca70331c61a499d9aabd757b899"
 
 S = "${UNPACKDIR}/dirty_equals-${PV}"
 
-- 
2.43.0


