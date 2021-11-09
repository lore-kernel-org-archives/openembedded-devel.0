Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D65C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:45:12 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web09.13827.1636472711667980322
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XpcVaUFN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636472709; i=@fujitsu.com;
	bh=gqVM80GyipRkMP6ArZPh59aM0oex/98PHGz8xAJTrpY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XpcVaUFNTqudGbVbE3AEW61aat6V60IABX3XKe7vEVcJnT4diljhR3J0rQBLTyx38
	 esnHOX4XcDlGPZZByDsBVCTImX9+PYExve5ChHaiwZrxebJmDImKPjlbsHwbzlm5RN
	 ckJrutG1r0DjaSfy1x+NAFz75/+yijMYe66YxjkPBNCUwv4tDME4MtgGVOL6OsN2xb
	 Pso7qz36eFuvkWght1jxR7Sm8//lSmFeNasF29ywj9hv1alDQDkUQf/wNZCW5Y7uie
	 U/HEjc1hR6eSGb2c6McjySRaTYmO88OmXp7OysctwzxoDprcP2eMdn2RMkpMortfU0
	 6QuWw3YTF6tkg==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 87/4C-05531-5879A816;
 Tue, 09 Nov 2021 15:45:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqNs6vSv
  RYNpGTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP182eMBSelK37fvMPawPhPvIuRi0NI4Amj
  xOoFc1kgnAtMEls3fgFyOIGc44wSR2fzgdhsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC1hKnFz9Acjm4GABir/56QUS5hVwkrhy7AsTiC0hoCAx5eF7Zoi4oMTJmU9YIMZISBx88Y
  IZokZRYvblZhYIu0Ji1qw2qF41iavnNjFPYOSfhaR9FpL2BYxMqxgtkooy0zNKchMzc3QNDQx
  0DQ2NdA0tgdjYVC+xSjdRL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMBxTCg6072B89PqD
  3iFGSQ4mJVHef11diUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeFdNBcoJFqWmp1akZeYAYwMmL
  cHBoyTCe3kKUJq3uCAxtzgzHSJ1ilFRSpzXGKRPACSRUZoH1waLx0uMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHmlQKbwZOaVwE1/BbSYCWjxwS/tIItLEhFSUg1MjW8XXn2/2X1a3OYZgX/
  /Wjw4ObW6N/5eUrJn46Np37R7Dh+QjPOYucbpZOtHebbyq3oiieeCGKYk1a37onZ0Sm7iAl6v
  redPxPD83vpE6pBypIDFDfHlVz75XWwK9e64n6sdXBEo+yL9SO1sjhbGjNfTp7uo75zje1v7o
  qjGX6Urhkc5ykybj05cLqK9bFpHxn0J5teJRm1fBDepWr3K7tlSX6N++ft0tu7NNWqNv5m3NB
  YzXdzKJVis8c2srk+E476llfjNXW9fBsnNOv7aYsUv1o1Pzd+JLflTPI1LQGG693XfZ/aH2jQ
  aNSwUzs574rl32v0puzq2txu6dJ3pbNt57Pur4791djJXsgYyKbEUZyQaajEXFScCAE96JINC
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-265.messagelabs.com!1636472708!14960!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4140 invoked from network); 9 Nov 2021 15:45:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:45:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A9E9C100241
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:45:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9EC01100237
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:45:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:45:02 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.18 -> 1.19
Date: Tue, 9 Nov 2021 23:44:52 +0800
Message-ID: <1636472692-61319-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 15:45:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93886

0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch
removed since it is included in 1.19

ver 1.19:
  Fix issue with handling OCV if offloading is supported.
  Fix issue with handling SA Query on channel switch event.
  Fix issue with starting FT-over-DS actions after roaming.
  Add support for OWE transition networks.
  Add support for extended key IDs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...6_addr-instead-of-__in6_u.__u6_addr8.patch | 38 -------------------
 .../iwd/{iwd_1.18.bb => iwd_1.19.bb}          |  5 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.18.bb => iwd_1.19.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch
deleted file mode 100644
index a9f2393532..0000000000
--- a/meta-oe/recipes-connectivity/iwd/iwd/0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 36c74f974eba6f276ed4dd04c2077e6f23ebec37 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 17 Oct 2021 16:09:03 -0700
-Subject: [PATCH] netconfig: Use s6_addr instead of __in6_u.__u6_addr8
-
-Building fails with:
-
-../iwd-1.18/src/netconfig.c: In function 'netconfig_ipv6_to_string':
-../iwd-1.18/src/netconfig.c:188:25: error: 'struct in6_addr' has no member named '__in6_u'; did you mean '__in6_union'?
-  188 |         memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
-      |                         ^~~~~~~
-      |                         __in6_union
-
-Can be fixed by changing &this_ip.__in6_u.__u6_addr8[0] with &this_ip.s6_addr[0].
-For references: in6_addr is declared in /usr/include/linux/in6.h
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/netconfig.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/netconfig.c b/src/netconfig.c
-index c748630..ab51c3d 100644
---- a/src/netconfig.c
-+++ b/src/netconfig.c
-@@ -185,7 +185,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
- 	struct in6_addr in6_addr;
- 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
- 
--	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
-+	memcpy(in6_addr.s6_addr, addr, 16);
- 
- 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
- 						INET6_ADDRSTRLEN)))) {
--- 
-2.33.1
-
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.19.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.19.bb
index 4136de84fa..219dffe09b 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.19.bb
@@ -7,9 +7,8 @@ DEPENDS = "ell"
 
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
-           file://0001-netconfig-Use-s6_addr-instead-of-__in6_u.__u6_addr8.patch \
-          "
-SRC_URI[sha256sum] = "0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55"
+           "
+SRC_URI[sha256sum] = "dd65a8795f6127fb1b9e29f2092686b0590a0d3738c2b90c792ccd320deaf966"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


