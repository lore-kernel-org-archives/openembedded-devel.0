Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B06DCF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:19 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.49314.1727682256625942134
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AJRFjZAV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682257; x=1759218257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ev333encnVKRyrjrRviPNG6mdr9stifYQeSTV/h2i+o=;
  b=AJRFjZAVI7B31GvpMyc7OllaLHkbL+hjV+VvPTZGgocsqy4exWA/Lj8X
   wUauZTuhblWjSDqxbr5BdqdBw/qzClICCj39T2cccrYfu9GyyrxZgMdxG
   wAohYCw8zwBqnYW1DoUWExxh1DFnKdRJbIsOzA/ijRqyTpW1La13J+TN8
   ywu5sMX8jTz4iGmptzkH1neGMwPksyKt3BCrTASeobW7bwUZVeg2J/MwJ
   Mp2ji3j+ogLmEEqImyx1EprpJeOOilI1Hh0wWOMogh/c5pn9qNGqODZR2
   Qo9bx6LR4OvSKvl1nqJJpPWAP52R1fl1XWYx5To2QwiAgB9ewff0kiuJf
   g==;
X-CSE-ConnectionGUID: GFhkrsLDSzCQ8RdByJRcvw==
X-CSE-MsgGUID: y+iiXLqdR+mivOA32CcXEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175232423"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175232423"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D196CA1E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E433D8BBE
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B75E2007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C102F1A000A;
	Mon, 30 Sep 2024 15:44:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/40] python3-zeroconf: upgrade 0.134.0 -> 0.135.0
Date: Mon, 30 Sep 2024 15:43:03 +0800
Message-Id: <1727682185-12664-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-1.823700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrtg1zuDHEymSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8Jlr1xKkE5uYMNZlevXKUzaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFF5uemc2KvBlRhBaqOFyBGC8JK
	d3pxTsvgRT8BUUq+L857BMbKqMb+qHyY9CWWCIs6uyyW0OtYaYigo6bECPxBa8F89+KAxy7ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112598

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Improve performance of DNSCache backend

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.134.0.bb => python3-zeroconf_0.135.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.134.0.bb => python3-zeroconf_0.135.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.134.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.135.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.134.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.135.0.bb
index b1b1a2e4c..e72e12512 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.134.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.135.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "5be2c3a61cc81eb1bd4684bbdee19d708522d94bc8ac60dfe001a0fde4421092"
+SRC_URI[sha256sum] = "9424551ef5a8d91fa8296bb1791e83b31afcd17a336a071928d4a978d7b96b72"
 
 DEPENDS += "python3-cython-native"
 
-- 
2.34.1


