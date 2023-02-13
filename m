Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38018C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 06:56:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.9167.1676271400726863728
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 22:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XyXVtneN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676271398; i=@fujitsu.com;
	bh=3JD61OkxwTRawkRvKVwVVV6EDGauI2C3UlicD0ssfzU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XyXVtneNoWXogDp7GJ06aQfEFfYNfK7QZmxLpqgL+pF1ZWbgfg8FCDpD2ylZg9689
	 ivDA1Qaq+zwe1rr2X1Nox6P0HuSYEeXxT1tCDEFE43SPBX1S9DdyzDD12YFwoGPd1G
	 XGapP5ZgYY4UpIwQIcwG8mqvnc3mk5lUimccu3CfJ4GYSNqpn/2j/8LGKk5n9ofgQP
	 rEAuQNXfWY0fQEhhA17OePI3Sc7G90Q/nq4E+CVVtUT+acwLD3uTR50mRtVPsicUm0
	 /0W4Ug5lU9msQll+7Ce/W6IpupFTEnWh2MkIcDP4MlAIxYX4FozmSPO77ArBxZofg0
	 RcMy/JB8x2cbA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqKt2/2W
  yweZlLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bnT7/YC65xVHzePom9gfEvexcjF4eQwBNG
  iWmNt5khnBtMEme+P2HsYuQEcvYyShw6mABiswlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgL/G0+wqYzSKgKjH/5RRWEJtXwEni2Lu9YL0SAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCslWj/8grLVJK6e28Q8gZF/FpL2WUjaFzAyrWI0L04tKkst0jU00ksqykz
  PKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzHlOI0tx2Mv/v+
  6h1ilORgUhLlXXj6ZbIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5Lt4BygkWp6akVaZk5wNiAS
  Utw8CiJ8KaBtPIWFyTmFmemQ6ROMepyXL1yZS+zEEtefl6qlDjvyRtARQIgRRmleXAjYHF6iV
  FWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr8ldoCk8mXklcJteAR3BBHTEYz6wI0oSEVJSDUw
  BrToOa9Jkb/wWVPrTv6+f3+Tm8yMv5v4RLE39FW600Ei4NPv23z3dbcLOJ7V3qpTMY5jzW+XC
  qQtLH+x3efN1iwbfdrP9001T/j/dmLDJQfbvy+xft5dZBTPX7NI+vCs4R6xY4EOC/VGOJx7Sc
  s4GAdVV5j37pzx//kb9bFKY27tpBavCfy2b9Kz17qEl/XX2s56sD36nPuWuu7jCwX8FKw/8Zt
  exyBOUN5kut+mU4tL4N5YzM3/9Px+1ybO49Etqz4d3ySeVjx67mbzyhoDKD8NWvoQ1c1/MP6Y
  4IynnPsP5Q0psmeFTzz9c21EUYlIU/tKS80y+tOART0vbzFCXrbn7Ot+1bcqZmbcpti9FiaU4
  I9FQi7moOBEAF/QDeU4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1676271397!664701!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12688 invoked from network); 13 Feb 2023 06:56:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 06:56:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 82D4D100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 769CE100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 06:56:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230115.0 -> 6.0.20230212.0
Date: Mon, 13 Feb 2023 14:56:22 +0800
Message-ID: <1676271384-21122-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101063

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230115.0.bb => ctags_6.0.20230212.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230115.0.bb => ctags_6.0.20230212.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230115.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230212.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230115.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230212.0.bb
index adae87664..8a4977622 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230115.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230212.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c39ff7a753a286d9bd7460a1a1e092746d592fbd"
+SRCREV = "c74bf5a7ce99797dfebda2e1cab65d1086614278"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


