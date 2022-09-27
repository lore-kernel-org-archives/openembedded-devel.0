Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD3CC6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:23:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.8435.1664267014890270751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BjPvYpXZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664267018; i=@fujitsu.com;
	bh=D0kWptCe6ZiJ9dJ3jGYngxf2y4daFDVoKN3+ziy/qbM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BjPvYpXZZzxdddquNg43Z43yKrCLHfEkJysUfbJNH4XiCgNOSKOeLyDLcZIoOtETA
	 8hdPKxzBxIDKPXDimAOsePuVHZbQFuPynLTT+FkBIwQfDj4q7nF1Wgo3mHk8O63ZQ5
	 MisHUD5tzcQgMphgWwhaaGyP+Z7Av/0QjX3pVNzHjYtu5FMRoeL+6g+9o2+Dz0qD5X
	 /fwW1hy05oO3YUO0rCQHFzQzhkvl+bTZ6b1fTEifirZHPk01nuZlXi4d58v774DUG8
	 aq1aIdigLckvcgimCvn61nX18EyfwUHUSFyLAwJDY2a37Ipf/bPrL1nP9gv81pYFE1
	 sk1aq2mzMg5Dw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORpMu52Sj
  Z4GSLgsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHtzAe2gpscFX9mTGJtYHzL3sXIySEk8JBR
  Ysoq6S5GLiD7CpPE3tsLmSCcPYwSV39+BatiE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAUuJJYc/gtksAqoSjZe7wGxeAUeJWae+sYHYEgIKElMevgfr5RRwkjizYC5LFyMH0DJHiQ
  3LRCHKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSjdMPMUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6Boamuoam+oamljqJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnFKsfLUHYynV/3UO8QoycGkJMprv8goWYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IEL9N6oJxgUWp6akVaZg4womDSEhw8SiK865YApXmLCxJzizPTIVKnGI051jYc2MvMMf
  Nr2wFmIZa8/LxUKXFeoU1ApQIgpRmleXCDYJF+iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5I
  wrwzIFJ7MvBK4fa+ATmECOsWOTx/klJJEhJRUA1N30lPT+kUVyQo8toKWXk4XzgicOTGvQqxk
  csuE1QmS2uVNuvOOeszxCz54WjGh/ZvQ0xpvQ/bLJRefRBma/vP2v/tJpu6Fuvu0KxePNC1/8
  tWGsW+6G2saa/0zd/6IBbPEqy/mLjpxe4PZgZWGPcJeugcPqdh28fgePPReJWytZuHUG8Z611
  Zsd7ZelRN1gXVm2bQXP8JvaZuGdpokcTG6fU7+EPL4sHwG2+/5L5Minxa8cXrq8Ot84XO+KTa
  XPlkFfn14svbjv8WP/571fqBTuaag6er7e/2x889VGTm8//1gJlPoVyul1PsB888bT7QwPbLS
  /PDEzWU3Ok6enMk9T9Vc7/fFM28tP50T2JKrxFKckWioxVxUnAgAXB7hWW8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1664267017!446474!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7246 invoked from network); 27 Sep 2022 08:23:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:23:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 371A81AF
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2C3681AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:23:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 372 -> 373
Date: Tue, 27 Sep 2022 16:23:21 +0800
Message-ID: <1664267003-2293-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
References: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98971

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_372.bb => xterm_373.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_372.bb => xterm_373.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_372.bb b/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_372.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_373.bb
index 3e1e9d7042..7e36f475c4 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_372.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "c6d08127cb2409c3a04bcae559b7025196ed770bb7bf26630abcb45d95f60ab1"
+SRC_URI[sha256sum] = "deb0989473a63908b5a8d44dfeea8301c8710f6ce01fb57ce8c30002375746b6"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1


