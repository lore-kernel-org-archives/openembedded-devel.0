Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC66CF64A4
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.49311.1727682245224444877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QnecDaro;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682248; x=1759218248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gxZZ6iVG2PZ3AliS3/kJIp9MBWm4oFTYucSn+Hfrwrw=;
  b=QnecDarosqQYwbRvRssFjoDqTDJNtDrSVkWXeSRssZEBkWjUeOFqd1G6
   8eu0TfFZMa4sptYBGcThxd+z7ErDhCtJLr8WxLs2eMqMOf0zccPd/BD+P
   Efb747sr+lN85O0mYdjhNlhq1NLnZaf4ZigO+9USIxUajg1vRRO0dILHD
   1CSbua8ZUODwp34FELZUBtPrCDgCtzoJjBZ1mZNOTGI3I/n40jysVrLGE
   N/MLUCyAZ+fmysBPJLXudVSjqNlshCjAlfQrKBlkVljirT20wHpwg/hWe
   uEihrmyvBnn/tMCzu6AYhkjoTU9bTZWKzxwYjyz5HFlznAM0IRIUCgrMS
   Q==;
X-CSE-ConnectionGUID: Dp0pSvACSUaih0tLpJ/36g==
X-CSE-MsgGUID: HYadOjSpRCewXAIYh8TdLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154209974"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154209974"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A20B9D4F54
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D78DDD39C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F7742007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E9681A000A;
	Mon, 30 Sep 2024 15:44:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/40] python3-yarl: upgrade 1.11.1 -> 1.13.1
Date: Mon, 30 Sep 2024 15:43:02 +0800
Message-Id: <1727682185-12664-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--3.577200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrSExHL6o3BeCF7G1bHV1SIRNh
	u03caeD7z9YXdGTB0gPVeptTRKjYpWlPvrjnIT0ZA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY5gZGm/RVVHG5x7uAXGEprfOd2ImQcUyEW1EpqtJXzRujxY
	yRBa/qJShNCXvA0fw+jaPj0W1qn0TGVuWouVipctw47CkWtQ47F9gfOSa/HgOoIlSauJrjXSFEM
	LoaVcyHFvKwf+EUdQgiLwcgK2ALkTbYrXtrCNFgNK6j1AWdg2o2JeFlgl8Z2f6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112596

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Added :attr:~yarl.URL.path_safe to be able to fetch the path without %2F and %25 decoded
-Restore decoding %2F (/) in URL.path
-Improved performance of processing paths
-Added :attr:~yarl.URL.host_subcomponent which returns the :rfc:3986#section-3.2.2 host subcomponent
-Started rejecting ASCII hostnames with invalid characters. For host strings that
-look like authority strings, the exception message includes advice on what to do instead
-Fixed IPv6 addresses missing brackets when the :class:~yarl.URL was converted to a string
-Improved performance of calling :py:meth:~yarl.URL.build with authority

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.11.1.bb => python3-yarl_1.13.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.11.1.bb => python3-yarl_1.13.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb
index 37d77b718..16708fd1f 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "1bb2d9e212fb7449b8fb73bc461b51eaa17cc8430b4a87d87be7b25052d92f53"
+SRC_URI[sha256sum] = "ec8cfe2295f3e5e44c51f57272afbd69414ae629ec7c6b27f5a410efc78b70a0"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1


