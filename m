Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DD7C27C50
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.10752.1715677833910753373
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KstUvQQg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677833; x=1747213833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hnAGMfStKFdrIFJuG/90ZTHDuYla6POMFXvPkUEG4zk=;
  b=KstUvQQgLuUMpH6FdTd3X9fCtN6fiQ4rnYDEgPHTR2dN9ohAUn/jGG9K
   0oVRf+T0bdHqJzsqU9QYEcAUkRGXUPqf7UDxbI/OsKqQMX2SIqgxjQolM
   /570o1Ucfqj1nyyrV97jkahU1WRj/XrwTTDwr6VdgYhaA7SggQxQTAK1V
   /4Tla78sxN7LSDwIA/3q76SLzycxKL+Q7Y2pb98nqloh5Y97ySEy5wt3C
   BFNCmbMoTDV3wt+C7nRkiUOLCrsIQNSuIw1tdvjWoqfSmuuyID47jKxGY
   ph9r0YDpfbPIe3eWSmseVhS+MBVvJKZRxU2sgCn5Pqz/YftDbIb1FzZg2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146230417"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146230417"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 45850DB3C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D4E9D45EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 259A520076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C029A1A000C;
	Tue, 14 May 2024 17:10:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/44] opencl-icd-loader: upgrade 2023.12.14 -> 2024.05.08
Date: Tue, 14 May 2024 17:09:45 +0800
Message-Id: <1715677817-2223-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-2.884800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJou+DE4VrL3yYaDCzqDR7DPb+nFx78OJTaoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXK06rtG6TQUhkt340g4PYcSyOC+SvnAGnvLCH
	fsSO4yLSmAs2JI71FrEP63hVEstpL9FyEh/n0Nsz5FAxo3ccQNE69FR4i1Zxv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110360

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Synchronize with OpenCL v3.0.16 specification release.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...icd-loader_2023.12.14.bb => opencl-icd-loader_2024.05.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-icd-loader_2023.12.14.bb => opencl-icd-loader_2024.05.08.bb} (96%)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
similarity index 96%
rename from meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
rename to meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 146ec6e47..38db7a245 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -13,7 +13,7 @@ RPROVIDES:${PN} = "virtual-opencl-icd"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "229410f86a8c8c9e0f86f195409e5481a2bae067"
+SRCREV = "861b68b290e76d08e7241608479c16431f529945"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
 EXTRA_OECMAKE:append = " \
-- 
2.34.1


