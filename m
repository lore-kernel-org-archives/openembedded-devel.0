Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC726C369AB
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.47777.1743412320556201685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DRoQw1aP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412322; x=1774948322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZxB7JP0RDuAwtVtjZNCUk0cO/XyT+OwcWrsCxcPwHRs=;
  b=DRoQw1aPnhaoQF3QGnsVBzndWeXx/qRJ6qTkoOc2EkEQXD+vGS9M4zNu
   twR00Y1WcSLlptmmSVxzZAlEX9PhIjDVDtM3QJ6oE1VCM37LLZFtNxHeg
   YrE3YRQP+cOdaaBHkG418v6TIbhhshcA3wmvCgnXcYGl5JlHOTL9YtFJQ
   xQcSqLLAgWxCMm8Z3OVPUXLx0YOubUrmvggcP6Dwf+qKvzc38BStPtUFr
   3Mfu35HwvdY7pOOB8zHASAr4oU3vJfOOUfgs6dCXjdRzEfGsCBN9BNIyF
   gEgBsAWJcr6waP+m917WARqiEqxqQRxPwzkpUJdMNPbjOvGhZxJlolUxK
   Q==;
X-CSE-ConnectionGUID: OGd1CotHStGBC6bLOI0bRQ==
X-CSE-MsgGUID: F7sk+PdmTZ2CJE4l1luYfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950082"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950082"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C72C1D480D
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90708D4C3A
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 29AAA1A009A;
	Mon, 31 Mar 2025 17:11:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 04/26] python3-alembic: upgrade 1.15.1 -> 1.15.2
Date: Mon, 31 Mar 2025 17:11:26 +0800
Message-Id: <1743412308-21887-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116401

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.15.1.bb => python3-alembic_1.15.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.15.1.bb => python3-alembic_1.15.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.15.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.15.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.15.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.15.2.bb
index 1ce840336b..49bf054ecd 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.15.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e1a1c738577bca1f27e68728c910cd389b9a92152ff91d902da649c192e30c49"
+SRC_URI[sha256sum] = "1c72391bbdeffccfe317eefba686cb9a3c078005478885413b95c3b26c57a8a7"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


