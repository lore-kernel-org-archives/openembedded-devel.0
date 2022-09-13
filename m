Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB4BC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:17:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.3052.1663064247059747511
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ctogxlrc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064245; i=@fujitsu.com;
	bh=l7tlLKgtl3N20cV+7xiWwa9sJSbtFqztA967Zs2Cszc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ctogxlrcpnNt0kovkEjZufDnCuC6JRddJUG+4ZJ7LmJ9fwWdKoEQuCWhET2IpeSCO
	 Aa85RyYRjBZNjdVly10GsM/KZDWMrJhWipHGYM32fU3UuP6nYK5g+kZ6VKBVGsMQsO
	 asbHmniBQXI15Wgj4/J8w/k1hOcyGD4WIdps7IvAnnt5wDR3rWYxfINXFZMXpjhLk0
	 quG87AecSLLV9J9UCZSoA2c2LP3xS8TpI+oLlun0LspfZos+mL8s6ccBWqP/sSm5yD
	 WL7pukeYS+ysZgOHo3wD6nyh+tqZahxq9KJIBf5vSnI6BG7d838iwRk/sx3NEsLZue
	 XUaSZjJ5Sv3gw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqLslQiH
  Z4MMUXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPTrefMBR+5KnZ1t7M3MJ7n7GLk5BASeMIo
  0fvTpouRC8i+ziTx8eZ9dghnD6PE7fZZbCBVbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA
  9TAwSEs4Cmx+Z8MSJhFQFWiY+JtFhCbV8BR4sGRHYwgtoSAgsSUh++ZIeKCEidnPmGBGCMhcf
  DFC2aIGkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxitk4oy0zNKchMzc3Q
  NDQx0DQ1NdS3NdS1N9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2MQKDMqU4
  MW4H48N9v/QOMUpyMCmJ8kZ6KSQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCNDwHKCRalpqdWp
  GXmACMEJi3BwaMkwssTDJTmLS5IzC3OTIdInWLU5bh65cpeZiGWvPy8VClx3pneQEUCIEUZpX
  lwI2DReolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK9EGNAUnsy8ErhNr4COYAI6wshaHuS
  IkkSElFQDk89yAcl1DZvrt71xsVQNu7Ez1sJ3rU7aFMYu5rOSt24uzGoN2etlELN1qUVwWF9r
  YkXn689hyz7812jJXitRfyog9WnN1COBTxqu3f80n7P15ImAeTqMbBd3bZCsrTF6phlks/zgx
  eNS2f9vVeQtYvmrLu8iWXVerP3gv2a21UJRyy2Wm2eol++N3MAXsvx26fWTf6JLJq2eHrDCQV
  g7S2DVRiHprGvV3a2tBYUMi6VieNjt0sROPGd9paAS9MFWmK3rmoyr+fLJQsESb3d17rKLmud
  S4fVe7+rbvTclEl2yl83qlrEy2brAL+DB2rATkvL9PeeqZrktkO/ulHCTZo089E7h9M3IK93M
  or+UWIozEg21mIuKEwHy/faqUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1663064244!463529!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12617 invoked from network); 13 Sep 2022 10:17:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:17:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 28FE1100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:24 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1D0EE100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:17:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] open-isns: upgrade 0.101 -> 0.102
Date: Tue, 13 Sep 2022 18:17:09 +0800
Message-ID: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98767

Changelog:
=========
 Enable meson for building open-isns, deprecating autoconf/make (though the current build system still works)
 Add a package config file for libisns, so other software can find it
 Fix some compiler warnings and spelling errors
 Make IPv6 default socket type
 Fix isnsadm parsing of some arguments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../open-isns/{open-isns_0.101.bb => open-isns_0.102.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/open-isns/{open-isns_0.101.bb => open-isns_0.102.bb} (96%)

diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.101.bb b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
similarity index 96%
rename from meta-networking/recipes-support/open-isns/open-isns_0.101.bb
rename to meta-networking/recipes-support/open-isns/open-isns_0.102.bb
index f2a084d635..24c520901d 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.101.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/open-iscsi/open-isns;branch=master;protocol=https \
            file://0001-isnsd.socket-use-run-instead-of-var-run.patch \
            "
 
-SRCREV = "0d86dc31fae2e2d77a082ccea5aba95426b40c3c"
+SRCREV = "c0e6d9fedc5a7041260de477fe1a8455fa074113"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


