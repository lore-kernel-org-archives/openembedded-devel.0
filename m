Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F908C27C75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9747.1717664817041498540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rhwvpe9J;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664816; x=1749200816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rg9WizERSIm/DsKJSYXRdSXTwwVEvSs9JlScCRmLjxo=;
  b=rhwvpe9JHJCL/B4LlvrQCAAuY+JGPm/1eDyAg/BT/RA21WVUajZ0SwZS
   PzIjonIftWQlPlrGwRGfVjspSFjZp/vqvbF/O7Pjf6NQkgeyRISSdS5YN
   dVflFX6ZN2Nqd7Ybb0niLu6myZLuUIwwrhmVclTKUwclxUgmIMbwCGtQC
   23pOQXFEGwYax/pTfLxKbY9tgH80b4SRe279zGL/Dt0EOj+mNFn9/Vdzy
   7jDYczFq3wQljEqqGwLTPX/nL7I7J5Zd7tLJ1vLWLC8QCO+2ckdjTXWA6
   WRfo6BSgdX1bS8pNq1BHk3q5wZIK4eY/cQptzvPQ1F69cxs6sPWjSoDzu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141040287"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141040287"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 26AFAD800D
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BB9BD7487
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A110401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC51D1A000A;
	Thu,  6 Jun 2024 17:06:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/36] iperf3: upgrade 3.16 -> 3.17.1
Date: Thu,  6 Jun 2024 17:06:12 +0800
Message-Id: <1717664795-13902-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.860600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jAbo
	TDS3zulASdBPe4BbQO59Srr6VJLZnO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2ENQPReihSEfvwU
	evDt+uW6knQ5gytPTKfDkUADG6q2p7ABo0upccSqfrLSY2RbRpBCE2NlBjIjctE8mz+ry/JTGD0
	/NuzV8C5sZRTBnM41BbonaT6bGf5+R9GF2J2xqMxRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07UXA0
	ioI+iBt0czr6n2VqP9hLMqyfd9JsdcGfVjybHE3JA4GawMP44wP5JOOhMcsUga0hZ/uv7/M8wOG
	Ax3T5LX+FL8l3G7/JniGCotkXYlm8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110719

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
============
- Version number has been corrected.
- No longer signing tags

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iperf3/{iperf3_3.16.bb => iperf3_3.17.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.16.bb => iperf3_3.17.1.bb} (88%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
similarity index 88%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
index 5cec4c687..44fae0255 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
@@ -10,14 +10,14 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9873a72f714e240530e759e103ac7b2"
 
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "f9481e1cd35159929458513692e4a8f9fdd1bd6f"
+SRCREV = "2acfcfe94e928e74542c9f107e02aa6dd4748a79"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


