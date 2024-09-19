Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27095CDD57F
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11278.1726716756978988954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ecRM9RN6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716757; x=1758252757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4rnPUsYjgfopwKlor+hDUeezw9TAyT1n7/jHMjuFRCM=;
  b=ecRM9RN6YoPzPRWiVd2uQY/dITMZNfv2HbwxFOdNhYsdyU6dgudWlapH
   mFhfvC1jXuojTMszwYp6gZxbIXL1DJQC3lOVLUZRmzRvq2gFsZPamLpT7
   rA3UI53S5EE5j3HczvILgcO98QH38MMj7ikpmzO1mCDS7VuQbFmn6Jbpg
   vS5ynIDWzsVOTHLWt/E50hIQoraJWIxVMDeSK7aG3jQZd+Qrm6K+m1yVG
   1g4ZETqYi/1isyL6wdwAExng4KsdClkYyY9pq/sEBvs1YRf6UsXusf9lo
   aK936YTzRtkIHMkPM5IAYglu48vDVJelux3wmL6jBVdXXRHU/KR7nZ5rt
   w==;
X-CSE-ConnectionGUID: Eah8vdeySimWA+E7m7tVBA==
X-CSE-MsgGUID: pBHw5UQeQhe31W7gRyWK1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="161515747"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="161515747"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 626D1D4F56
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADCCAD9683
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4880F20086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DAAD01A01E9;
	Thu, 19 Sep 2024 11:32:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/28] python3-greenlet: upgrade 3.0.3 -> 3.1.0
Date: Thu, 19 Sep 2024 11:31:56 +0800
Message-Id: <1726716733-14548-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-5.680400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrB8N4SAwGIo5VW5LVJV/so9lP
	Af1ZyTTTt+ki9vYAWeYNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu4as+d5/8j56whO5Ye8LOPHjG6
	S9mbIHYG9LK86WCz7MvsAW11/LJIMl4DO63oWGb76bfDsLglMYWOexnUAVi2oKIgZR1kUHZ4Aha
	WgxOjOJ
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Adds support for Python 3.13.
- Greatly reduce the chances for crashes during interpreter shutdown.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.0.3.bb => python3-greenlet_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.3.bb => python3-greenlet_3.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
index a79db0049..11e8a76c8 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491"
+SRC_URI[sha256sum] = "b395121e9bbe8d02a750886f108d540abe66075e61e22f7353d9acb0b81be0f0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


