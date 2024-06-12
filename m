Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16086C27C79
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2491.1718161125267143248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hkK4HkfN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161125; x=1749697125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tb2REhql9+6IMoz/Z81t0Hm2SzADrmY0h0gwukUOk6w=;
  b=hkK4HkfNgnqjiC6SFwi38Hik7QvLJ3yrigyih17HwJs5GN7jpO8DJEES
   UrRLwTza5THRPrMfUipAsv8Ylsq41vzAYBdC5OSEL47VY2LCwqFj+pBVv
   8/8zZeFxe9Fuw6WM7+CDbFa0P+M1HqO7JW/PMn+xVVd5m3UxUwe5BZAC3
   jecuocTfwKTMBUf/f9zitoDliKQtDP6Plf4LEhYAS2dyu/5p4LS1zXXSv
   Rn3rDMTfEaQNdTfhgoh+znMXfPBCmsWooPzkxJVJMVVD8kNYiFJN8QGQi
   cP5ds6AHe4QlSSGQv3n9yvheah2L7clj3dEQY9R/DQzQFm/VLa8goGhFf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162818305"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162818305"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:42 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E89CC68F0
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CAEEDD3F1B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F70E20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D4721A000C;
	Wed, 12 Jun 2024 10:58:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/43] python3-netaddr: upgrade 1.2.1 -> 1.3.0
Date: Wed, 12 Jun 2024 10:57:49 +0800
Message-Id: <1718161096-29710-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--2.800200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwEsSjupltTflYM
	JR3dIrh2e6Lyil1V/JbeSoWFkyQLjoYM3GbKHhDEkYD8wAZKsSBUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiT46WBWMXju+5x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJnP3eBLdQPo8TqtQR1kw09shNR+xow0uD45AYZP3p/R/N/V
	nNK3PQJuaRdRjXVUHn+o8jt24V2HVGQ3MM71o/BDN82WPFcdRNLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110854

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add partial address expansion in IPNetwork via the expand_partial switch, this
  enables opting into pre-1.1.0 behavior
- Fix running the test suite on musl systems
- Fix IPAddress IPv6 parsing with ZEROFILL enabled
- Fix handling of the NOHOST flag in the IPNetwork copy constructor

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-netaddr_1.2.1.bb => python3-netaddr_1.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_1.2.1.bb => python3-netaddr_1.3.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb b/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
index bedf0dab0..b8a772566 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=8afa43eca873b71d5d85dd0be1f707fa"
 
-SRC_URI[sha256sum] = "6eb8fedf0412c6d294d06885c110de945cf4d22d2b510d0404f4e06950857987"
+SRC_URI[sha256sum] = "5c3c3d9895b551b763779ba7db7a03487dc1f8e3b385af819af341ae9ef6e48a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


