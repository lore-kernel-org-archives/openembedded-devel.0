Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAEDC7619A
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:32:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.90548.1679617921107001795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wsF1ZHyL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617919; i=@fujitsu.com;
	bh=9mB4QFEKbwkrNAKU/scsO5WO3Vp11e5P4fE7T4h1Mmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wsF1ZHyLToKa4pSK7oLOr8OG4V+47CLUDAHpt44C+SzZbiZLUEc1Dy1VlO+gjOene
	 LqCajcmCp3Nk2qkdU51s0Abq5Ec2g+d/iljQJ1F0oWeSIvF+ZjTpWGRhFcx6u1qJ5w
	 21P/m1ctKXs5dA08qdpvRfmVwFO4iUol3X6tav4QPQRK59TTBjqgd3Xjutuj8bXoig
	 kdMS1bAiyFWCOl0VIK1n6jJqnq3e2TR+Vdh5PE6BU1cz9ZfmrBV86NtMwWZ85IU9Lb
	 SZvvah2G5UQOH3TIFhNFnpo9OPcGMevdRzMEaWDZhdY0e8erJp1HUAxxQdukDNXtmU
	 N7vv70H6IgjwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqFv3Xib
  F4E6bqsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG27S1LwWPOipWbDzE2MD7g6GLk4hASeMIo
  sfrHajYI5zqTxOOXM5m7GDmBnD2MEsumi4LYbAJSEjfu/2cDsUUE9CWWzt4DVsMsoCLx4ncPO
  4gtLOAoMe3BFrAaFgFViav357KC2LwCThL9a1rA4hICChJTHr4H6+UUcJaY+6gDKM4BtMtJYs
  k5FohyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbqWeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBgZtSzOq0g/F431+9Q4ySHExKorwSodIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4P
  7+RSRESLEpNT61Iy8wBRhFMWoKDR0mE99BZoDRvcUFibnFmOkTqFKMxx82rV/Yyc9wBkUIsef
  l5qVLivH7vgEoFQEozSvPgBsGi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5hkCk8mXk
  lcPteAZ3CBHSKcw3YKSWJCCmpBqaSxz9KJNqlGIXfr1p6xWG2lWqaelDB2QOrP07cIhef8uXk
  vc3bc2PnCU3Yc1zUpJLx/pqXFs8fmAq3pKdsun9NXqEwwfjV6pjPZ4OZvuTwLf2WIqwVHNmcW
  HaTJ9hS58M33RCrk83H+r07Q7JmLn7FWLqjPj/rX23VfJYSV8UznlVZDZ7PlxR1161Ldj7p5s
  hza3eQtpDo00c9jzxP59znebxA2UNZdU/qnxd3PkhN22uzfuPJ/5WMMx3Z4mdry09fdFxYK0h
  K6O48NRXTVJequqtPzPI1soPM+xWmp1hVznzutHHWiqVZWz0s380r+zbVsX3uVNUztefLxC6e
  WczW+O7l3d0yaj1vihe926XEUpyRaKjFXFScCABXP+IJaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1679617918!678338!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32309 invoked from network); 24 Mar 2023 00:31:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:31:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3417D1001A0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:58 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 268DF10019F
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:31:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libyang: upgrade 2.1.30 -> 2.1.55
Date: Fri, 24 Mar 2023 08:31:24 +0800
Message-ID: <1679617885-27327-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
References: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101691

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
type compilation fixes
multi-error validation support
JSON parser fixes
portability improvements
schema-mount support improvements
minor optimizations
other minor fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_2.1.30.bb => libyang_2.1.55.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.30.bb => libyang_2.1.55.bb} (96%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.30.bb b/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
similarity index 96%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.30.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
index 5adfc1d80..7bc8d5f29 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.30.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "35131b9396a965e01f899127763fb4e0871b845a"
+SRCREV = "9a4e5b2ce30b9696116d6e654ee55caab5aafed8"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://run-ptest \
-- 
2.34.1


