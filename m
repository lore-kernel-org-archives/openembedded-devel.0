Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A050C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:27:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.17277.1707208027106575453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=chacVhWl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707208027; x=1738744027;
  h=from:to:cc:subject:date:message-id;
  bh=0DmCMsxADBgyp+hn0mu1tk/I06ApOiTAjgQehYTm2H4=;
  b=chacVhWlIegRCosUG37RcoIJvBu31xvO+rO9qM6YPd4qJW81HvwLVouZ
   XWfMMNNp0XSMz3U1qw02AcpSsdKEt4cBop60D15jgmHQhIG7eq247jZ/V
   /pj6TqqvJq+29iQMkMNbFcHA4aV/rxRtfUJORzM+Wqx9d8z5m5MrmTVW5
   1FBKAUbzGGjER3VmcNnqxA2tb7PHO9vLFiKgImWDj9nr1tttPu1i1SsNX
   iII0QJAI+VC2gur6cq1DLCh/BgIODO2jOXhFPQ4QVmBcgX64QbMn9ZZOX
   fypnOQqiIhLRSRFeqPaAbK+Xm8KLUxvz/jKRwTNGQHAuAAN8wO4uZQG5p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148823406"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148823406"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:27:04 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 572B8D2AEB
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:27:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E9D7D6217
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:27:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F0DA20096423
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:27:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBC6A1A006A;
	Tue,  6 Feb 2024 16:27:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.42 -> 0.43
Date: Tue,  6 Feb 2024 16:24:08 +0800
Message-Id: <1707207848-5548-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.959000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuOEENgsUAuYrWO
	DdZ1PDmECC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0bKeTtOdjMy6uxW
	P7AlD8NOBkESMI05d4iiOf1NDnCI+TvHzGcGqiIKeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNasm3JXyNGl2dnTLRZHaO50iZDPoEiMog8/rBecPKxN+PikXNo+gmYYzSG25gQD/kCxzD
	l6wjEOdW2F7oBm9vkyPlHwLRSu9DKoEGG3M+VOyU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108608

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix test failure when using clang

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.42.bb => satyr_0.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.42.bb => satyr_0.43.bb} (94%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.42.bb b/meta-oe/recipes-support/satyr/satyr_0.43.bb
similarity index 94%
rename from meta-oe/recipes-support/satyr/satyr_0.42.bb
rename to meta-oe/recipes-support/satyr/satyr_0.43.bb
index 62cdad6fb..9e6d701c7 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.42.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.43.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native python3targetconfig pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git;branch=master;protocol=https \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
            "
-SRCREV = "23483cebb238df86cda8b6529e3c58080dc2029d"
+SRCREV = "5891618d6a95afc4cde6757374485adf9bf0e9a5"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.34.1


