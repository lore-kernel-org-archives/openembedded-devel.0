Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A69C83F22
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:28 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.56137.1751879237138472344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fGNbk/MJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879240; x=1783415240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YdTbru2Agbl1cBRhV82B3iZbyiBnboLixAJ+05HyPts=;
  b=fGNbk/MJWP72DC/t+6xXSZogE+fD2PcMr8saEu/Ns35TZEmEMfi7cksn
   n+dE9DPgm6/mir0Np8kv1aj/axEMDwW0xzykynJhC+v7si0+LSsTnk4il
   TlQEYDyvXD5pzIWX0Ax5zPysX2xaZzHJMATCzfR3LMCD4d6d+fun74mPo
   FCqcPlV+OKuhZb/jicBvQEosyqZn+6gjiRnoOcqm279AZ9Q2nrIg6lIfj
   YeFvEu5PW/qAf+TYWdGCFt8PPfEoX1KZ2P5tOWA3Gqq6XvEU3Zw1PraLa
   iZ5DGPYio5B8t/3BnHt2AGoZCojaY2AYnwWDJVIY0yqDMUoilcafbrG+B
   g==;
X-CSE-ConnectionGUID: gwxQIwrzSLajSLyolXczyQ==
X-CSE-MsgGUID: utpIWnVfSWOJaFG2fBR6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="206006888"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="206006888"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:20 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B5F8E1000363
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:20 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 31179C00D62
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80A18D4F46
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:19 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 21E601A0071;
	Mon,  7 Jul 2025 17:07:19 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/35] python3-txaio: upgrade 23.1.1 -> 25.6.1
Date: Mon,  7 Jul 2025 17:06:53 +0800
Message-ID: <20250707090656.1216-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118277

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-txaio_23.1.1.bb  | 12 ------------
 .../recipes-devtools/python/python3-txaio_25.6.1.bb  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
deleted file mode 100644
index b14e353818..0000000000
--- a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
-
-SRC_URI[sha256sum] = "f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-twisted \
-"
diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb b/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb
new file mode 100644
index 0000000000..460c0cd0f8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
+
+SRC_URI[sha256sum] = "d8c03dca823515c9bca920df33504923ae54f2dabf476cc5a9ed5cc1691ed687"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-twisted \
+"
-- 
2.43.0


