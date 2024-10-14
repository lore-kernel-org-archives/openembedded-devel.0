Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25892CFC523
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.50351.1728896186753350115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b9ZfeFPq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896187; x=1760432187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g7tfOFDGEZ9GPXjfA+Cq+R+Os4BhAb73ao7MHM1R9Rg=;
  b=b9ZfeFPqGB0Z+g2VGL2u80Mqxukl0tGP7d07qw/XVrySAGScqISBTlsv
   fjxxjwSGqkXWrHG5bZhEonn7yWMV5mV1XctUX5zns411lsp/8eCRiwv2r
   uLvWjOE4VD2GaL/cpLJ6pxAu5BvC6KZG09UfIzn6/Kwn02MY6D6llLUDB
   Lyykivv3hJScvjDg4SCOULilhjgJLkXqLdsXzZTgXPAe6Aiy4iAO+nSAh
   IvDKBveAL27DLx8CdOtGt46brmRmJUm2FJ5eOsshAgyIIF2pyYNdgJ25H
   RGFLCLwZ8tOcHAUS77JB2KuAIpLCF8sxhAz72cI+woGFJn+rJWpyjcqOB
   Q==;
X-CSE-ConnectionGUID: /+iOhXA7SEOwimaZEPazrw==
X-CSE-MsgGUID: csHVZ13bRhW5PwqRlddFvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155665625"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155665625"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D7CCCD6DE
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B3376D5085
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B4F3200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA75B1A01E9;
	Mon, 14 Oct 2024 16:56:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 53/54] xmag: upgrade 1.0.7 -> 1.0.8
Date: Mon, 14 Oct 2024 16:55:14 +0800
Message-Id: <1728896115-2944-53-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.394800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrBMdp5178zSNJEjJjpEhCn9yx
	bsqlEfBsmC+wH+KoDcpeC+9qSyjST42dik73t/290e7jfBjhB8cL//VMxXlyEyVN8ZdeT6XzuF0
	BEedRtW0dxc3Wl+HcgbKwxc3xyHYmcuVmAqiAh/w/QdUh6LEl0DeXamXCCu1YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3i64sVlliWKx8fE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDsAf0
	ILYNSUpnF82AKBwkxR0X62itokPl3igNx9/G6HAffDrsOwONfIAdo1fZK1e8BAekDLHBKSYyVWY
	wvxJto3QOjJrddh8mYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112903

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Use double for all floating point numbers, not a mix of double and float
- Quiet 64 -Wunused-parameter warnings from clang 13
- usage: add noreturn attribute
- Fix -Wmissing-variable-declarations warning from clang 13
- Fix -Wself-assign warning from clang 13
- Fix -Wshadow warning for Display argument to Error()
- Clear 9 -Wuseless-cast warnings
- Add -help and -version options
- Print which arguments were unknown before giving usage message
- gitlab CI: stop requiring Signed-off-by in commits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xmag_1.0.7.bb => xmag_1.0.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xmag_1.0.7.bb => xmag_1.0.8.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.8.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xorg-app/xmag_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/xmag_1.0.8.bb
index f3dac5345..1589f9ae6 100644
--- a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.8.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3413fe6832380b44b69b172d2d1b2387"
 DEPENDS += " libxaw libxt"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "009936cc5a2706084079127b26cf55c713767650a34cb69e5682d60e33ce7461"
+SRC_URI[sha256sum] = "326d3c583d795bb53ac609d144e7f7fb1499baba7eaec14b8e6cd232ea069532"
-- 
2.34.1


