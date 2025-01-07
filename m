Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402EFC02181
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.16530.1736240519393926078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=osZvk5tJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240519; x=1767776519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LrzgD72spkkZ6up5dQFygbCIm00X+VZFDWGxOipUS/Q=;
  b=osZvk5tJvRXnK8corLp5pVvL0B9u9la8qgUKY07O19Pqe0v6VdQikeMd
   NZ36d7XHdC5MENQTCMBsRAu27PT0E0/hX5Hrhv0Q3r3BSbvDZ81b5/tVW
   gobrX0ikGZQgEuKM4bvqjFfJtGfnMltTQ0sHqULg8acqNfGuMjy07E6RL
   3MAHMrCpOaQ9JcgzsfgKnAEGo4DnIKB4cKJ2rvMc2zskboMzedLBwFYPV
   aTWRUR0UZeHLT2xZ67QQaynFgqPgSuPlEJPA3EI279/4xYmrbM1o767Fd
   hMgOx7tDz4WjETj6i+1comOebe1DUPtRd02YyP7b0DomfeMgAgSIc5rei
   g==;
X-CSE-ConnectionGUID: 0Sr4hVMrTIWEfOCst+zynQ==
X-CSE-MsgGUID: 2AQj1ldTTpG/I9mptqNSnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173144576"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173144576"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7462D500F
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BDF2DCF7DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5527541185
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B9C01A0071;
	Tue,  7 Jan 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/18] python3-grpcio-reflection: upgrade 1.68.1 -> 1.69.0
Date: Tue,  7 Jan 2025 17:01:35 +0800
Message-Id: <1736240504-5315-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFZH0YXYnbGozFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTt8fx
	dFDBKE7sqMqaBhifSsIBU8v7WRMBxdTt/lg25xn9xTuths/ooIdh/dmaHVwhT953R7Z3cmEYDAc
	3OeCmSNhbTU4j1ULce53QLF6z8EY7yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114686

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.68.1.bb => python3-grpcio-reflection_1.69.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.68.1.bb => python3-grpcio-reflection_1.69.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.68.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.69.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.68.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.69.0.bb
index 3c0d5be812..7720ab2fa7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.68.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.69.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "cffcb33c4cbdde771a06fd55ca6fe149c6f89ec330c9a4010730bb2998597982"
+SRC_URI[sha256sum] = "3474aaedfb10d8da5503135a2fb9fbb4e1f72044ad7ee2d0bf22090934e80908"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


