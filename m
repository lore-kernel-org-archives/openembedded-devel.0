Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62EEC41513
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10794.1715677849464717020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UyRSrF4w;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677851; x=1747213851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kyhPgJ1B0dOVan57EbblJ/NlFmyzv4/EfYECIzt3/9M=;
  b=UyRSrF4wzE4CfrwOwccsprl9QU3R3JIWM0257rjIabjSOrbrf/u+S9bg
   GVWDP33m6nD+/ylGKLm31eRIS6MtnC9wwSx2/P+6xVbMuy8J0T1hgJKxJ
   XY37LQkdS/C+kyFwVHzM2O8/Jg1qdkKabKAhLQp2lrat7LKA80XJxgf73
   mHZTTcOh1fc9q0wv+DupwmY8MgtFsQwZRI9l2ZiPmxWSDpLO+Icmcj0ZK
   3gIKVXpHId5/YB9tAYgsABvlvkk0os9RR/yzdDRd+djwIi0lzEUma0M8Z
   fcqTMxbkJqVLTGSeTdAz48CWjngRc07ApXuj3XZrmbKMCRk0oGg2xUmah
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="145839699"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="145839699"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 354A4D64AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51201D52FF
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D1CC770BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F2F01A000C;
	Tue, 14 May 2024 17:10:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 41/44] smcroute: upgrade 2.5.6 -> 2.5.7
Date: Tue, 14 May 2024 17:10:14 +0800
Message-Id: <1715677817-2223-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--0.920200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOcEj
	oFgm7EFKmzzMF21UDfkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2lfC
	3WuSrCNSqBK1Fdk793ghBeNJICtc+eBzEkCCpnRloMLOoNHsM9q4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcuK95QmyW6dDtIPucs+6iMqXGFlSxV8lVNNXj
	APxNPhDOs3ykTfyTVGShoCLC1yZOZln9Z5YOkCQoT+xWKiqLijfv8ieZvJgY/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110391

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix #207: crash when adding IPv6 multicast route on a kernel without IPv6 multicast support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smcroute/{smcroute_2.5.6.bb => smcroute_2.5.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.6.bb => smcroute_2.5.7.bb} (90%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
similarity index 90%
rename from meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
index 09752825c..950f6a2e2 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "999bdd724a1f963ac8bfd0598ffdd2a3d651646e"
+SRCREV = "b315d06ddb0dad16a52fe91e5831b4030ce37010"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


