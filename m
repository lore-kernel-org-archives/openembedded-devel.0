Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAAECAC58F
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8057.1756890228384009348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cRmn/jle;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890231; x=1788426231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rbl4CIf4A7SvOB4/Nx3d7uGOhqt+I906Y2buZoWokvo=;
  b=cRmn/jleKuZFJQvVaUnhLNfa53DmnwnptGcyyKvzF1bdgUUoysPUU9oS
   aVh9A5GtUettwP7WuTnqyzjColMTM1fZp+/EzkbkybH0JefBzQAIANba2
   EutQXlvdYpdxzldwdgjj/p9sMkqjyvtKheSU/biWt0borxf057B/ivCtb
   ynBv42LX4ub84098ruyqNozlVyxHKPL+VO11DxjMKmrEMJfoyzh/Jk5Ju
   tCT8sVA8PeDRB2PzJAruJK+PBPPcPgluk8tADDm8V3LKtrF3sHjwAwqg9
   uH3FANnTZsrh3i91wLvD9UnXn/nqFdRvXjSxv5jEtKrDKTfuTf1B5miqq
   Q==;
X-CSE-ConnectionGUID: 00b1wGZJTQ+vq/jjmxJH1w==
X-CSE-MsgGUID: jb/hhaOGRYm8s7dkhml3Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211487615"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211487615"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:51 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1FD201C000BF
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id CD3771150724
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id BF7261805CAD
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C04051A0071;
	Wed,  3 Sep 2025 17:03:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/56] python3-eth-utils: upgrade 5.3.0 -> 5.3.1
Date: Wed,  3 Sep 2025 17:02:48 +0800
Message-ID: <20250903090317.2002-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119221

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_5.3.0.bb => python3-eth-utils_5.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_5.3.0.bb => python3-eth-utils_5.3.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.1.bb
index 84db8b32b3..481e5081c9 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
 
-SRC_URI[sha256sum] = "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"
+SRC_URI[sha256sum] = "c94e2d2abd024a9a42023b4ddc1c645814ff3d6a737b33d5cfd890ebf159c2d1"
 
 PYPI_PACKAGE = "eth_utils"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


