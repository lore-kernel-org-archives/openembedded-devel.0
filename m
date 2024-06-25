Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68860C3065D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.166851.1719305824894098677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IWcrn3Dn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305828; x=1750841828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5C9b56kSnsE7BIYgcgqDdsKpFcVunax2/Vpnd3WZkZk=;
  b=IWcrn3DndIQYGE6Oq8+GX1moE/wo0v4LXdfZZXRbkM5fdwCMtzc5iWD8
   4RSgcg9BpJw5VKedSHNyZHQ5fYi+S1+gmEIuJZPR9JeOhEYa1KtQbJz1I
   P7ulNMKNJzP/ddgD+TXEITR6UZO+crwMw+3A72DtbwYh2qV1jfGsGqciX
   +jBXgteVvb3/uh5n8QPgHgMtcFVIQzPF0SZT8wUrCXPiDwTzhdBWPrfkA
   MXqHB02CE+OmGIqo1ZHlu4qioXDy8g8DI5FcMn32UZpST1xBPGMR6bFS0
   drIVQDrni2eE5/D/kjmfeKc8WZbxLt4toYFz5spij7ByfWFm8d4XrvIeh
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152868266"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152868266"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:07 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F6F3D424D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FFFEBF3D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC66FE2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 87B4A1A0002;
	Tue, 25 Jun 2024 16:57:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/57] opentelemetry-cpp: upgrade 1.15.0 -> 1.16.0
Date: Tue, 25 Jun 2024 16:55:53 +0800
Message-Id: <1719305790-11484-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.662700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSDxtY59xKFYFE89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLn22EcSrQBnRIlVYCqhV5OHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4ODs
	gAm0UFJl+yjw/dVlfxp6dK/Ul3TfOrTTo8g2QAYebLKQeGJ5NFtxF2jGpYrRMZKkd+riMxyGohG
	INOt7kqFPtjWu//JymCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111032

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog: https://github.com/open-telemetry/opentelemetry-cpp/releases/tag/v1.16.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{opentelemetry-cpp_1.15.0.bb => opentelemetry-cpp_1.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opentelemetry/{opentelemetry-cpp_1.15.0.bb => opentelemetry-cpp_1.16.0.bb} (95%)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.0.bb
similarity index 95%
rename from meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
rename to meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.0.bb
index 88033e58c..f559295db 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 DEPENDS = "nlohmann-json"
 
 SRC_URI = "git://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;"
-SRCREV = "054b0dc207c1f58e290d78cdaac5f314bc328b31"
+SRCREV = "fd57e7aa23ffc352f62e504f34fd1c6b7b2ecac3"
 
 S = "${WORKDIR}/git"
 inherit cmake pkgconfig lib_package
-- 
2.34.1


