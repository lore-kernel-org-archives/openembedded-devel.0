Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41D4E7718E
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.30362.1735032443247103847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sWfD53vV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032449; x=1766568449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uaJ7ojfxRPc8YMrS/6UozQnkc3C3B/ILC2XBG+zqgPc=;
  b=sWfD53vVTr5XGB5L2Mk60/YueIoJDgx0Zl36R/UsiO/y8wCuMTnfv6J/
   BJaTlRgrohVW7O73B+IH3rL5Yea0dZcuEZEI1j+ahBmRnwEAyYyq5PXGN
   UUbuhPie7L+HRMlhradLxG0/aK7ZMMkgmwdpp4luHSdqV6V6c/c5d+dhA
   uKomQijAWOsfcwrAbMKSYlYaRtSu07MXqNYOXuA4TxmWimY33TygwEfTE
   6H6gvRJFSf7Nl2Ceypim2WngMgPIAufSt+SK8X717KYajXdwRF6kPAk63
   l+iNpVVw7aV1hwOEK/rRJKMT6fN9w4R2Iq77u603x3w4c5oLyxEHPE/01
   g==;
X-CSE-ConnectionGUID: hc2cUqIASWefGUhqny1q7w==
X-CSE-MsgGUID: +BAtOTFVRG6ZOWKUHQBFzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="187212825"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="187212825"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28ABF96741
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EABCCD5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 869276B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F7B41A0071;
	Tue, 24 Dec 2024 17:27:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/67] python3-pymisp: upgrade 2.5.0 -> 2.5.4
Date: Tue, 24 Dec 2024 17:26:40 +0800
Message-Id: <1735032421-13513-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-2.446000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBZUipC+zHNir6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Hf7mdD84mFnYZ5
	BcymZVqji8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFL5gZ8WOZdZCxwuVSoiqaaVbR9
	RyhUz2xOWpIppU58ANWCk5rRryEYXkKvwDC5yMDN3IloUT/ZZXZZ9MGrwbSixgSyGDJ5MaTOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114521

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/MISP/PyMISP/blob/main/CHANGELOG.txt

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pymisp_2.5.0.bb => python3-pymisp_2.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.0.bb => python3-pymisp_2.5.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.4.bb
index 83b3c82ab8..c644f34581 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "d3bfc7a337e4382026343f05aa442bfdecc3e11a4f3a5479ad0e6087dcde7e78"
+SRC_URI[sha256sum] = "368fef2152d9d276d8b476b0f1c72376e9ead49bf58631e31bdb5d7ed86d603f"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


