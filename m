Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6074DCAC594
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8064.1756890236702565008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NdGILVMy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890240; x=1788426240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P/sIv8VCqHf90GcLMN3zncs3CnF6897kby/KwTXS0mE=;
  b=NdGILVMyp9LxdWTGoUey6iawjt+SoEFFe0oMuXYfX+VxcXzBYWd3is2/
   UYuBi2i4vJc1SyfxpH732xMytbUodoBN2BStIJ5gVwEtSyQpl1ulP5edL
   bPp/nXKRlwOVn3y+8XJgDVSY9/yMxVI7LUyKieKXWCx1Xjo5iACzqIrqt
   qtYO4DNgzYQWmu5HZ+MfIW0dGe/XWyiVQAnFzTI1Gf2RTB++iMEgjvBDS
   S8q9gjGnLt9bWuiHo5Sp1ueu7IlzaiEJnBlumnHIM21mF7LUo+ia2E55b
   VU6uN6JbEQ8EPtCNDWpSfAkVkEYuEqRK1hJefzLp6Wi5EO/n4hVKSCzre
   g==;
X-CSE-ConnectionGUID: ZCdf7aQiTiuK+gtLUOCSuA==
X-CSE-MsgGUID: kcacNktiRRSsxko0jbPZAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190352806"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190352806"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:04:00 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1B925820711
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C5A40C5B450
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 8F5AE101313A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 85B401A008A;
	Wed,  3 Sep 2025 17:03:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/56] python3-typer: upgrade 0.16.0 -> 0.17.3
Date: Wed,  3 Sep 2025 17:03:14 +0800
Message-ID: <20250903090317.2002-53-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119250

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.16.0.bb => python3-typer_0.17.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.16.0.bb => python3-typer_0.17.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.17.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.17.3.bb
index 794e0adaa1..c92ec75669 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.17.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "af377ffaee1dbe37ae9440cb4e8f11686ea5ce4e9bae01b84ae7c63b87f1dd3b"
+SRC_URI[sha256sum] = "0c600503d472bcf98d29914d4dcd67f80c24cc245395e2e00ba3603c9332e8ba"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


