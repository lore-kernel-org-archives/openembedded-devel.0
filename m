Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F962C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9821.1717664812798199327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q4JhyCx6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664814; x=1749200814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=j2ptd6StTzQ/i352WQ/KHzV/IXlAenjNDNaH9TMJaK8=;
  b=q4JhyCx6u1EPIJVYUByoARZtMGgrdnvcxBTCjuHq+5RfE4asTTtGeghu
   Emp0tSKiSmoiZ7/U7PmXIM8aZvXhiV1Ocq5Mp2xQo0dApsGxly1oIJ6b+
   A0UkiN5i3GiBWFLiOf509gxgQ35KzWvFwZUk+t5BH9aeI5wn80zZkO2ab
   eUQ+YeNqShYEzprfXdhZCZoXULtWasWTbjYuohq9CID300k8fpw5s2EPq
   EcWpXUgk6Pk2G/NL7hlh9DPHoBoILzAfARLKgXES8gJDFHLGfs6ewg9Kv
   pQdwbyY25eCV27u7Y0WKptCCtjMPv5QTRfOvv/wh+nswxHjw8QhpwByMt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="149566618"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="149566618"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C0E99D9224
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F928BDC8B
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2162E2B12
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F5121A000A;
	Thu,  6 Jun 2024 17:06:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/36] editorconfig-core-c: upgrade 0.12.6 -> 0.12.7
Date: Thu,  6 Jun 2024 17:06:07 +0800
Message-Id: <1717664795-13902-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-7.856900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQf/28+P8WCgLbz
	sCQFBqroXoyZmORsN2XTqzyZdKfBmLBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW55/5kb+TlT7upGJSAHQICsRpsoDCmkF1K5x7uAXGEprZiQDIJsDspXCzkaVcXrvbOjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq019nYMoxXFy7i8HSueSEYQtNS9haJExWtMDA0tvBz18D8WH
	A8wy6EIm9YStJQR6BPwiMjsNrUvDwxs72cIONbA1Ml+KOWPyBd+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110713

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix pointer overflow in STRING_CAT.
- Fix a few more stack buffer overflows.
- Add license for FindPcre2 from LuaDist.
- Document and CI fixes.

License-Update:
Add license for FindPcre2 from LuaDist

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rconfig-core-c_0.12.6.bb => editorconfig-core-c_0.12.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/editorconfig/{editorconfig-core-c_0.12.6.bb => editorconfig-core-c_0.12.7.bb} (78%)

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.7.bb
similarity index 78%
rename from meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
rename to meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.7.bb
index 976120b51..2c594d229 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.7.bb
@@ -2,12 +2,12 @@ SUMMARY = "EditorConfig helps maintain consistent coding styles across various e
 HOMEPAGE = "https://https://editorconfig.org"
 SECTION = "libs"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f515fff3ea0a2b9797eda60d83c0e5ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38f617473e9f7373b5e79baf437accf8"
 
 SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "b7837029494c03af5ea70ed9d265e8c2123bff53"
+SRCREV = "fd8cf1e94ecf4e6e4493833f96140cf9bd17578e"
 
 inherit cmake
 
-- 
2.34.1


