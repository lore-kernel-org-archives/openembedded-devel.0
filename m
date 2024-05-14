Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88983C27C41
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.10758.1715677843301773887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FR4LKsLx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677844; x=1747213844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PlxkaGeTo9AKITv0TljGgbqgUBMgn5vvb1bdhqlSijA=;
  b=FR4LKsLxXkZSVgHSxO6ELXI5gmRRgLYoq04DJ2D4TDbbqdAdnZg6FjNq
   YICDxXD/rcpo+VTHuhfo2te6pW4Ja+8resLavtEtv+/vKkkBfyNs1+WnY
   LVrv+lXYaLz/F46N89O2nmdYOF1FUcwQQGsR3PXmFF+eDIM0mO+gSWhu2
   UIVkOXRHS0fQ/R0WBy996VxbEMa8Amn5afuKCPIuYsOFbxTd+Z5sgPPwo
   chqOuSoCBSsldj6mNGWsPjY1XwzmlI3LEguWfNnYYIpzePM53NKy7Fhhu
   jtV1tYszW9HW90R00KcICo0MYiKMVXe/2dNG/Z3a8NBRPymcPvvxL2UAy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="157675054"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="157675054"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B698D6482
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BDFED52E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB09B20076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 86B331A000B;
	Tue, 14 May 2024 17:10:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/44] python3-tqdm: upgrade 4.66.2 -> 4.66.4
Date: Tue, 14 May 2024 17:10:09 +0800
Message-Id: <1715677817-2223-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--1.272300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrxZpjHSMI6w5+t76NMQUPPRxq
	dt22rdOg1jypNY0wtaa130KPLZ1jhdjTzYyhzXBGA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf3PhwfmFb3pg7Cl8sx4HBG1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZICwWsa0vb6M5UPQOpCnH2e8B0xPlVVpYCg24radhPybTTRw
	+4yjQkUvUHUwoZiFjgn36/NNB3CixzC3Lu5pHNhDxg0hWi6COBLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110382

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- minor framework updates & code tidy
- fixes CVE-2024-34062, GHSA-g7vv-2v7x-gj9p
- Fix: Add display() call to close() in rich module

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.66.2.bb => python3-tqdm_4.66.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.2.bb => python3-tqdm_4.66.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.66.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.66.4.bb
index 77d26f54b..485d24f52 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.66.4.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
 
-SRC_URI[sha256sum] = "6cd52cdf0fef0e0f543299cfc96fec90d7b8a7e88745f411ec33eb44d5ed3531"
+SRC_URI[sha256sum] = "e4d936c9de8727928f3be6079590e97d9abfe8d39a590be678eb5919ffc186bb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


