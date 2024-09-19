Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A3CCCD1A4
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11425.1726716751774462316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FC520/MD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716754; x=1758252754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ugm6X/RZhTjwxOCW8uUkIQidzO432p4Eck5TzUkEaqk=;
  b=FC520/MD12k/HtGJSfe0dcqdzKarTVuyQrjKTRzU3RHBteZXBENLaCEx
   Y8hDCkbDzVoS70a5s0pmAJYBST6OeKNlZ2jFbkASmN3fhcyhn73mvTkfU
   0I63n6yGGyOqu5fNj18Ng0hAFsWq6A5+c1Z1/D3hz94Ypx7425tM/EzLJ
   cXqtabPE9Y1kulg9GDxYOjoqHsOmz1WW0I0spfzcPhygjZ9jv0OIqa0QZ
   EUsJDAJ7XCwmy3v0e23xcLEg9mlcIcoypl/SSNLlarx7Zkd7s+2qahN1C
   QA7KIro4QkokJ/491YHWdfaPAAUJyVCm1IYhP5b4656SXb26rkyF1E17g
   g==;
X-CSE-ConnectionGUID: DX38MXMqSS6oyVqAmaFWgw==
X-CSE-MsgGUID: UKVUigm1QVO40UbJKodJdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174296122"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174296122"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E144AC9443
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33596D9689
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4D3B228921
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C94E1A000A;
	Thu, 19 Sep 2024 11:32:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/28] python3-elementpath: upgrade 4.4.0 -> 4.5.0
Date: Thu, 19 Sep 2024 11:31:53 +0800
Message-Id: <1726716733-14548-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-2.750700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv85LGH6Xi15L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMcOGwsKoQ+YdD4ngAvkO2n4Yt
	9EgZ2kuW6omv15PFfZNL1ZlJiWsqEty9FWCJJj+6nNcELCIt0Vib9lLkHdbOfdYSY3RORU7ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112366

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix and clean node trees iteration methods
- Fix missing raw string for '[^rn]'
- Full and more specific type annotations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.4.0.bb => python3-elementpath_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.4.0.bb => python3-elementpath_4.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
index e095cb8a3..937d96860 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "dfc4b8ca3d87966dcb0df40b5b6d04a98f053683271930fad9e7fa000924dfb2"
+SRC_URI[sha256sum] = "affdc8de95af1a4c10d1d2ed79c6fa56b59c26c7fce64b73497569e9dea46998"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


