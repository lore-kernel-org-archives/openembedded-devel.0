Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22923C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:31:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.29555.1652085065015072629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iLlIuSng;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085063; i=@fujitsu.com;
	bh=YDSS0CKO1gEa1TyRcl39ABQwmZRrWCU1W9WTNM7Bgp0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iLlIuSngJuaVVJBDhWhKqtNFAk+v0Q1v1RczS4e5BxlSuOFepoSXaY0ev1RuRPgMH
	 VrabnrwKfiLruQJT0RzD3CWtuRuVyDRPLH3dtklhyLKjpgA2VwXc0D8Qrtn89aej1I
	 Z2kO+n9O8NGT2D5SVr1m5JIB496FWE08B74SIcEOINadxC1QqKdkt5UeXdkxxtZHk+
	 j0W57LO9/zSlym82PJR9Dts5f53Hc9kpUPWxzT0PHQS/8W6kiHyhKsNBhXmtihl8tu
	 BUyBfwZG88A5J94px/hH/JbMLo+PYR+qcYdmCGdXY4/49IjIThbhgDtYoK/kyhBLoz
	 vrzfJ7IyatnWA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORqOt2sSL
  J4MwnfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePSmn9MBTN5KnZv3MLawLiUu4uRi0NI4Amj
  xJ6dU5ghnAtMEocvz2KCcHYzSiw+9Iiti5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBX4lrKyeD1bMIqEocfLWIEcTmFXCSuNgzG6xeQkBBYsrD98wQcUGJkzOfsEDMkZA4+O
  IFVI2ixOzLzSwQdoXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWM1klFmekZJbmJmTm6hgY
  GuoaGprrG5rqGZkZ6iVW6iXqppbrlqcUlukBuebFeanGxXnFlbnJOil5easkmRmBgphSrLtrB
  uH/VT71DjJIcTEqivJVNFUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhDzgHlBItS01Mr0jJzg
  FECk5bg4FES4b17AijNW1yQmFucmQ6ROsWoy3F34d69zEIsefl5qVLivLfOAxUJgBRllObBjY
  BF7CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwry+F4Cm8GTmlcBtegV0BBPQER8DSkGOKEl
  ESEk1MPHm+/HVV7l4H730y22bZifP8cnXHT/61N4RcW71CeFI8b1fe3jn1biJ2VOY0s157n+5
  fV7XZ2dN1kmZifvftq+NPKOok7Dl8sLvP4tuuurO2vKggoMhplJ3X1wgM9/d5dv939aW/hEPM
  /5Ut47vybvAw9obW2Jfzv25I3CL2kaNyls3F/8SS5xw9Nghs509TaqbtYqecn8X5l+wf83NGy
  kXtr39v+fD2eX/OpyqAxmeKl52mshiXn3bwG3JxIe1JfGl1SsZfn5N5dAr+/lFS5qxwmD7uap
  Z959+0Di6IWKrdNmhQ9yzr1/tv9oRu5D9954jLjd361V+T7qxa2/bvC+5yyJYznFL7Zr5x2OF
  zMU2JZbijERDLeai4kQA0AOX61MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1652085062!174072!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26417 invoked from network); 9 May 2022 08:31:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:31:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 53B87100195
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 45E5F10018C
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:30:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] phoronix-test-suite: upgrade 10.8.2 -> 10.8.3
Date: Fri, 29 Apr 2022 16:13:09 +0800
Message-ID: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97002

Changelog:
==========
pts-core: Workaround Ubuntu 22.04 apt-get crashing the entire process on dependency installation
pts-core: Improved TTF font file detection
pts-core: Minor random fixes
phodevi: Apple M1 detection on Linux

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...onix-test-suite_10.8.2.bb => phoronix-test-suite_10.8.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_10.8.2.bb => phoronix-test-suite_10.8.3.bb} (91%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.2.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.3.bb
similarity index 91%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.2.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.3.bb
index 825f7024e..a4d586ebc 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.2.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.3.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "459c3c45b39bb3d720ddc8ba5f944332"
-SRC_URI[sha256sum] = "86681343d20415831ab16ef6c3d1c317e2345e771925e0698ae920a03a9eaab6"
+SRC_URI[sha256sum] = "4b742e28a9542fe2b57aacb691159d69d3e1c77d95da6d24b7867889ce84ba80"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.25.1


