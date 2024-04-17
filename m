Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFCEC10F15
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2763.1713318109224925241
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qfe92+yk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318110; x=1744854110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PXNCQspyZoOFAIZZ/bAvrH1G/4Rx3M1x/9TRHEZH0HA=;
  b=qfe92+ykj/OLAn9nH1GQjBx6UlvDTNvr2EMh+rtMniD+pg8dyf2GDBYJ
   x1+EAQLDPTPWfQNjIfwmmVMpTATfMFSoobCyBhFd//T6z0ZToJT5c6K6A
   Xkc9IeA67qV4in2mlDoUzaCe+Z7GIDLQdrublTBUmSd+IN5EWFwqfPk7Y
   go29IQn1leIjVUuP0VqXk6uDPC9lgNWZfQefwpHA8fgVFyl97Fw/PoWOZ
   vAjte1VhUFCWeX7DkJv4Wiitsv2CXdHizC1bFt667BqDR82b7JqsKDULY
   pm0zYT+SUIf8B8MLFWV850ugLZX2BWfmGyY49GDHHWE1CVMjhRLTQ1B3d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135163821"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135163821"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 48055EB323
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B313FD907
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C66A92007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 732CA1A0002;
	Wed, 17 Apr 2024 09:41:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 44/49] squid: upgrade 6.8 -> 6.9
Date: Wed, 17 Apr 2024 09:40:56 +0800
Message-Id: <1713318061-17128-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-3.206900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrmSLeIgEDej+6FTbg6ndROXBK
	HBsAePqAHzOBK74HCIughdqjkPMyFvc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQ7m0
	K7bkUDKL/KVtfZiSDprhoT5wPbMMX8+6Zd6ThxTq5x7uAXGEprQFA6pSxaDHmD2veI3/hwm/X7Q
	qxdrFbPuLzNWBegCW2U9w4XVXDWCYLbigRnpKlKZx+7GyJjhAU04cMF3rbZQqjD0iI6zP3KxzYU
	fs4ARCpJ4D9fBQLj+nR25AWJlUFGhE0hBoIaN21EKVGBzerksbgO8/tdZpC3sS3sVCZGc+E7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Regression Bug 5349: basic_nis_auth build error: unterminated #ifndef
- Bug 5069: Keep listening after getsockname() error
- Bug 5360: FwdState::noteDestinationsEnd() assertion "err"
- Reduce stale errno usage
- Plug memory leak in handling cache manager requests
- Fix error: template-id not allowed for constructor in C++20
- Improve release packaging automation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/squid/{squid_6.8.bb => squid_6.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/squid/{squid_6.8.bb => squid_6.9.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.8.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_6.8.bb
rename to meta-networking/recipes-daemons/squid/squid_6.9.bb
index c8370eaba..f0663a5e0 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.8.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "11cc5650b51809d99483ccfae24744a2e51cd16199f5ff0c917e84fce695870f"
+SRC_URI[sha256sum] = "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \
-- 
2.34.1


