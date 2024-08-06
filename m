Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E816C52D6D
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2881.1722934014816930232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ql1EUfn7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934016; x=1754470016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ke0dLPqYV5L5ESiT5lHuHv7y8Ez2g1H7TLxrvzclwVU=;
  b=ql1EUfn79ddEDSczTeAwEYPGFAHRSkSFOMtF/6/iLVtZIwwS5erYpQzd
   U2kHoZyLhkKAaSRGVkplZLxycqf0DlkM1UUFGZzPDHpuTTcQXoE4h+2Dh
   PlYg2Nk0T5vMuPrFXF2GE2b8vRThhyHBU1RXBPV7Uj/YUlDxnRHwPtT8i
   BT03e+MHtLd5MqT/jf1oJXJqWgO/WjuShGxoHfSxPlhcaZwkDbTCQyFRF
   JVCRW5Yscldg2xMcU5Cgp0QeDyS9YHwCPOgPtJxpMDfELDlH8C8CSYxYI
   F/uyL7/k7DYlzH+sY4qH/RhsRm0Cfnfn/+gar3dgyUrdr+5KFhvEeb2+E
   w==;
X-CSE-ConnectionGUID: lCQCYDweQji4wndcqvTkAA==
X-CSE-MsgGUID: wujwXP6HQVK6oqymiuV3TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="170035566"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="170035566"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB0F9D8008
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DC4DD4C11
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B75AE20076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 829991A000D;
	Tue,  6 Aug 2024 16:46:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/60] googletest: upgrade 1.14.0 -> 1.15.2
Date: Tue,  6 Aug 2024 16:45:44 +0800
Message-Id: <1722933994-32549-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--2.758600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorbD4
	LI9c0YeiUR/tFfIsq4Tmn3xyPJAJopGZilTi8ctSOwpfLMeBwRtSHjB5Y+o5ZDBL58qLX4iuREf
	fVh/puQ7zflyoTkWhRYAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzRoTN+17DK738Yz
	/yAPKRNr1oJnJYTcRQvKoROAN2KM5c1YBCLckFFFCe3fZmW8KlCUNqknllT8UKRgricHyztY1sQ
	ybVrdeuiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111524

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../googletest/{googletest_1.14.0.bb => googletest_1.15.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/googletest/{googletest_1.14.0.bb => googletest_1.15.2.bb} (90%)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb b/meta-oe/recipes-test/googletest/googletest_1.15.2.bb
similarity index 90%
rename from meta-oe/recipes-test/googletest/googletest_1.14.0.bb
rename to meta-oe/recipes-test/googletest/googletest_1.15.2.bb
index 654684571..bc479268b 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.15.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "f8d7d77c06936315286eb55f8de22cd23c188571"
-SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
+SRCREV = "b514bdc898e2951020cbdca1304b75f5950d1f59"
+SRC_URI = "git://github.com/google/googletest.git;branch=v1.15.x;protocol=https"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


