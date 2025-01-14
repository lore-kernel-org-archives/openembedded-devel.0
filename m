Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60C3C02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.40061.1736843342927529038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PwzkVnJj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843343; x=1768379343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VNLYOTxTRyVBZEdJFPqmL6hQfSx2SdtcqxsKeoFKYK8=;
  b=PwzkVnJjpRKyP86r+rJpZqgaNKScY8jmISV6V/sifgWPwHQDjcAf6pnM
   /oCi617Y8WMparft6tg+vS0EfvUHgTG3KCsOFRb7mDEl9ZAkL9MsrTTB7
   v9/phFdXnidwjA+ZFu81iDIPjP0uGxab5c03gbetgsb/eS8ZxgROeWaFf
   jigi2NkJSV0LOGxuBNF6ZlKkj2dNB2SOjmP6ooEOif8ZMFX5S1JSTPd3y
   wwmdHiQpdF/2if9maSz+AfHZxRUP3VELbnMrZrU4wPCMe/xXZpsU7EdYu
   WMnFiA/3uXLjv63dapMzoU6upRYch/cly9Nj9FSsH613XjpUIC91oOT7M
   Q==;
X-CSE-ConnectionGUID: fDZa/nJLSaK1m4QQ1tpcdw==
X-CSE-MsgGUID: 0F+ucr6BRqeHRqGMrKVgbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="174471840"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="174471840"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 27EEFE8529
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F2219D5093
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8902B6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 379051A006C;
	Tue, 14 Jan 2025 16:28:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/30] doxygen: upgrade 1.13.1 -> 1.13.2
Date: Tue, 14 Jan 2025 16:28:23 +0800
Message-Id: <1736843329-4131-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--3.990000-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrG24YVeuZGmMvPRFFhcWhYJlA
	4IpB7gNOER2BnMPSZWaqXyh18B+tZx2QnRzQMDajkYD8wAZKsSB98faClFOTVPFf8VuRoM0N1XP
	ZHOqZHcEEBblmchCoRZbpyCR4N2ViZxIjhDGB4+eap1C4peSaizexY0PszFIernSumZGjnwTd5v
	bacDwdd63eNJQoCT0IeCsGknvdcWPEE0j2ROR/IAPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmLHBvqhRdA8sjcpdZ3fQiLdFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzDkTw
	xwLA/nIR/CZR9P/YK5Ic6JMn91MXSNK0pIB4ciH/+H7L/7PaoFP8m9CCWf/hSy4WvUH8he2xWRi
	+oBmYd0BA+aHKZyvliB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114849

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bug fixes
---------
- issue #8803 Template class with the same name as existing class gets in the same output file
- issue #11308 SVG dot graphs have added padding
- issue #11309 Markdown blockquotes with lists do not render as expected
- issue #11313 Template class specializations are ignored, which leads to invalid links
- issue #11314 "Copy to clipboard" button broken with XHTML
- issue #11320 Documentation fails to build (it freezes, no crash)
- issue #11322 C++ 20 Modules: Links to global functions, links to modules
- issue #11326 Missing description for a class member of a using-declared class
- issue #11330 Snippet trimleft option does not handle newlines well
- issue #11333 rebuilding fedora ignition-transport causes abort in isExplicitPage with doxygen 1.13.1
- String representation at "show configuration" in doxywizard
- Support for Plus sign code fence directives - GitHub flavor

Improved user feedback and documentation
----------------------------------------
- Adding debug and version information to doxycommentview

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen/{doxygen_1.13.1.bb => doxygen_1.13.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.13.1.bb => doxygen_1.13.2.bb} (92%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.13.1.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.13.2.bb
similarity index 92%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.13.1.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.13.2.bb
index 6f71806250..aa2dc7da46 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.13.1.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.13.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
 "
 
-SRCREV = "cb7d0d0c90e66d1599f3526d46672bddaafc08d2"
+SRCREV = "26342b775ea25e6fefb53220926b20702c56fcb3"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


