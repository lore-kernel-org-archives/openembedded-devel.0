Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AEECAC593
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7939.1756890232276940491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z1I58cGP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890240; x=1788426240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5AF6GZ0i1rbegCArPgXV60ql/j7OIukfENeLMGB+is=;
  b=Z1I58cGPXFFzXdCR39bXzI4eHFLTGkJ8+BDqCN1XLjTriI7fXknaAsxE
   74iEoIi1VkBOLO1EKuCKGX9CAThfRCE0/zgTlNG6UiOcd1u0gIS03gXGS
   DCMPhKBFOYVI9/LfAPkufHuI92bhcSbxKFNFnyBNF0BSztic0NHKYD50i
   VkO8nWbL+FqJqZG4wOVbM3iD9iZXTcuCPNJJmFDvoaWYV8YTCaO6b8qj3
   EXd6W25nPZk5AMX2ZRf3ksI74f22uLGRwMK2vuvnWRFrmmp38tCq6hIok
   3cLdRyfLBr/oc1Nx/kUh+sC9GsTHWkLq1W2bcpO2rknhQv5U+ybwpT4WF
   A==;
X-CSE-ConnectionGUID: pmTdYeloQVePtfDktXXz1Q==
X-CSE-MsgGUID: impQIoujQWuBnhTvgLuzrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199987494"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199987494"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 83FED1C00094
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:59 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3B4281C2C20B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 12CD210023F8
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2ECE11A0087;
	Wed,  3 Sep 2025 17:03:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/56] python3-supervisor: upgrade 4.2.5 -> 4.3.0
Date: Wed,  3 Sep 2025 17:03:13 +0800
Message-ID: <20250903090317.2002-52-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119248

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-supervisor_4.2.5.bb => python3-supervisor_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-supervisor_4.2.5.bb => python3-supervisor_4.3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
rename to meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
index ca6203c755..ed5f5d22f2 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/Supervisor/supervisor"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
-SRC_URI[sha256sum] = "34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed3ebc12"
+SRC_URI[sha256sum] = "4a2bf149adf42997e1bb44b70c43b613275ec9852c3edacca86a9166b27e945e"
 
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
-- 
2.43.0


