Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AE6C87FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.49380.1753918176394027557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fYYO388e;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918177; x=1785454177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+g8pOa18B2Xgj079N1x8AONLSy4/sX/QRdPWJNXb2yo=;
  b=fYYO388eJiEZ3qOm1rGhdPB5hiF3E1GhqpvwArc4n5SobdhpAs/J+5rz
   8Y22t8byZLh03IvoeFiZfTuRL+yFTAYeVdv8czhTyuXNvsN+jnEPcTeeW
   HgNDUWaxT057aKOryZlTYOUPzoz5JJP1/CMbu3fYUJU35rxKFOH9ozVJh
   cMhBltSzsgbvFsiZnofK8iSiobxnD8o8mubxOsH9nqAco/lEw5DfgGUM7
   lojphmXBDut9ie6GBv+T42UrSO0TROZ2QaRbNEqmBGad3zQuW64K0gr0J
   4eto3Qcc6WeKO5gFSC5Uu2LYJ5oHPU/xECsNBrNEdgIakwl76jbAdy2eB
   g==;
X-CSE-ConnectionGUID: k4XQzoGcTG6mgnj4ZFdB2w==
X-CSE-MsgGUID: 1d1UP6CXQSC+QdezTyd0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="207893553"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="207893553"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6E7741000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CC6F51C000F7
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4518B1A009A;
	Thu, 31 Jul 2025 07:29:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 35/40] qcbor: upgrade 1.4.1 -> 1.5.3
Date: Thu, 31 Jul 2025 07:29:18 +0800
Message-ID: <20250730232923.522-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118811

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: The last two lines of the BSD license omitted by accident are put back.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../qcbor/{qcbor_1.4.1.bb => qcbor_1.5.3.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/qcbor/{qcbor_1.4.1.bb => qcbor_1.5.3.bb} (80%)

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.5.3.bb
similarity index 80%
rename from meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
rename to meta-oe/recipes-extended/qcbor/qcbor_1.5.3.bb
index 00cae11c4e..014aa1776e 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.5.3.bb
@@ -6,11 +6,11 @@ DESCRIPTION = " \
 HOMEPAGE = "https://github.com/laurencelundblade/QCBOR"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=498c298542365dfcfe29948c72a5849b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9abe2371333f4ab0e62402a486f308a5"
 
-SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master"
+SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "4487f10e1bf258434fb8a39e4f59c29e31910ad0"
+SRCREV = "4ace4620d549f22c1163c5b00d3ae0c0dae1d207"
 
 
 inherit pkgconfig
-- 
2.43.0


