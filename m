Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B10D29FAB
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.40136.1730874686379590766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MhBrG8ZH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874687; x=1762410687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wX6QrimVGn209UmySPdeIYH3Q1pKzSnA6wOeGnM0tkg=;
  b=MhBrG8ZHtylZqCeTSc7J8l6mZ6RzJbjlSD7VL6P1VyJLphSDDA1xBU3Z
   IlEngUnSrpQsr5+9iyYrA9Bx2eFVEigVvn19XJFPoQZmjE1BWVNUZHnRY
   Klv/TcafzRwUPzMwE4cUwoTPa4+oF87lgvE69sht9Cd24h54yXwt6RY0r
   fXsMo+ETE6OuY0rxTAao/C461rKevDPAB0dsAJcRI84F5ydJC01IPXfAD
   ln+Q9mL1kckmOnD8XASZNSQROsi1/AfuK4VsQsNfTBVhap5tFWVNMxhOR
   DxB4slog5lky8NM8EDJWOMhyHwP3VNeirtcHzo8hQoxy07o/ibh8lS3Vz
   g==;
X-CSE-ConnectionGUID: 74Q3dsu6S/2h0MRClvuA1g==
X-CSE-MsgGUID: iSJ2XR7ARA6MOH1kmdsklg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="178487343"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="178487343"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:25 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 760C4E8526
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A71D6D50AA
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39F8320071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE0211A000A;
	Wed,  6 Nov 2024 14:31:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/46] python3-gspread: upgrade 6.1.3 -> 6.1.4
Date: Wed,  6 Nov 2024 14:30:41 +0800
Message-Id: <1730874660-2364-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-0.432900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrMVx/3ZYby78lr/X7qYoEs76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uYJA
	+HBwSFifoHOpl9ZcDR4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6GPHzzQtazPGS3
	LdISHNMNXZMkYqMUYF8fyidMvtyRmlwgXpRUNTn8ycCywrPwKopefyIb9ENZb/PE0NJBleuJ25I
	YESSl7siB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113712

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Remove dependency on requests-2.27.0
- sort imports
- import JSONDecodeError straight from requests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.1.3.bb => python3-gspread_6.1.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.1.3.bb => python3-gspread_6.1.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.3.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.3.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.4.bb
index f88c58058..9e74bd8de 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.3.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "cf03627f44e9e03a0a3de241d1748709db22af4fc8c11a13aa389d0bce6053fd"
+SRC_URI[sha256sum] = "b8eec27de7cadb338bb1b9f14a9be168372dee8965c0da32121816b5050ac1de"
 
 RDEPENDS:${PN} = " \
 	python3-google-auth \
-- 
2.34.1


