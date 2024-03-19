Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DC9C54E7B
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:47 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8159.1710827206450089136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LT3USXwd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827207; x=1742363207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mJBPpS6THMNU3Xk4A/oD1CUoArv3nM2nHxIgFykz4CI=;
  b=LT3USXwdvK8JkwiL48qbUHe2gX7OBxcCzSIOnPHxcKRpAyw/Yc7wMS3C
   IfBs/1AHg0riekySF3BjAwaV1D85gfo/w492h7PrYIbQFfT3J3nB+Yoei
   DS9jjgbgQDcLeB5zVbdZATO8wOs25EhwvCEWUWQcccPQWIXsM4s5iWIjg
   V3bGUJv6ZG99gOxwedU3EJEbOTMCguPjDrpml5iJFhmYLDulbk0yPuby+
   JZVszHR37d3p92XDKtViSYq6tt8y3fSuMjpRm3zEVEWrxnkfwvQf0cS4k
   XdJwLdHArbWsap3kwB+lnqnZ/fEplyDoybmja7IugDycqToi0Zhtv7S5b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152674075"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152674075"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:45 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68ACF141206
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C453D561B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39E362235E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D415B1A006B;
	Tue, 19 Mar 2024 13:46:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/50] python3-grpcio: upgrade 1.62.0 -> 1.62.1
Date: Tue, 19 Mar 2024 13:45:21 +0800
Message-Id: <1710827139-30056-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--1.321500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrczQnRrpmbEkkt9BigJAcVoqu
	NMLv3wJowWcQ8CMGxhHbHihwcxI1hO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQCmL
	ENVLWzfeUTVij24f8RdTDT167hvRYS62nMBX/dwPdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtQuH66c74hjqdauQ3zMsO4kvZw0DXU4Rc2SPk1XOzUoz1WPO7WcbdMzwrl
	O0ZkRVf4fniIal54pu+czuKv3pQtIxwGmb94c+HHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109449

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Enable affinity_session_drain_test for cpp
-rm invalid assert
-Make C++ xDS Interop Client and Server Responsive to SIGTERM
-Fix readme
-Backport #35973: Make Bazel requirements installable directly via pip

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.62.0.bb => python3-grpcio_1.62.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.62.0.bb => python3-grpcio_1.62.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.62.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
index ceb22f0e2..6efde8da5 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            "
-SRC_URI[sha256sum] = "748496af9238ac78dcd98cce65421f1adce28c3979393e3609683fcd7f3880d7"
+SRC_URI[sha256sum] = "6c455e008fa86d9e9a9d85bb76da4277c0d7d9668a3bfa70dbe86e9f3c759947"
 
 RDEPENDS:${PN} = "python3-protobuf \
                   python3-setuptools \
-- 
2.34.1


