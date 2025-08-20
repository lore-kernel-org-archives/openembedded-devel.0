Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BACCA0FE0
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.15254.1755679203851170396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VpGfuxnd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679207; x=1787215207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uZmqq/9gcRrwIcffBsalpP70VqktHYV8iJEpSmOCiow=;
  b=VpGfuxnd2FGkXEw/jBKwBXQQ1X0rVtwW7P5a3aR11qLUlr349jZ9zS5N
   qla/28eeP5vud1+Bua3K2iSg6nNQOsDhds/UKkxHuJGbkmLnsmF29lzY8
   BfVxScqyF1q91k0tFdYCmZyB5BNCuzYAFLHxLgU1xncRMrazBfd5/y5hJ
   WHxR1uFJ6fueM2wF5AJnyP27mAzLmYAKRT7NiKAB5aj/7aKIo4ASDvIw+
   IlhWkpns32enaQP8SZUH1qsGOxHXTCxgNXTgGm89FPjZP+iS2KRtnbN74
   sT+Rd/TSqZEL/j0LIKMCILRm72YVOq5WHzy+eFxjHjN+0sH4snOauA0+3
   Q==;
X-CSE-ConnectionGUID: DII2Vh1nSx+1rdRsWKE/pA==
X-CSE-MsgGUID: 5gUH0JnUSEq5rat/BtanYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210032885"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210032885"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 85EB58203CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 42849C0714C
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 4C7191400BC7
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D09F1A008D;
	Wed, 20 Aug 2025 16:40:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/26] python3-can: upgrade 4.5.0 -> 4.6.1
Date: Wed, 20 Aug 2025 16:39:38 +0800
Message-ID: <20250820083945.802-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119031

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-can_4.5.0.bb => python3-can_4.6.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-can_4.5.0.bb => python3-can_4.6.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.5.0.bb b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-can_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-can_4.6.1.bb
index 8e32cee622..04ce22346c 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "d3684cebe5b028a148c1742b3a45cec4fcaf83a7f7c52d0680b2eaeaf52f8eb7"
+SRC_URI[sha256sum] = "290fea135d04b8504ebff33889cc6d301e2181a54099116609f940825ffe5005"
 
 PYPI_PACKAGE = "python_can"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


