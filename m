Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0329AC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:01:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.2798.1657177271983230914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jhG0MXUo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177270; i=@fujitsu.com;
	bh=kpYA87AKQSklSLHGARKHFZsxenC4BepssjMNhWJeTu0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jhG0MXUoXXaFBlY6dcAj1sdSBJ7u2y/rMeE2N9f5WlV3ixUxaobegUQluK64OcTYp
	 19VZkArdOUl2LuLwDSPwOwdA4ZCM1hXGfwLexoEnarDBEV3h9wP72B3kUdorrOfoWt
	 T900W1iBQgKHbk6+RLvQrtioWi7kORD3KncDZ6tERVy1d7/dueiqTzz/oCTMPEseXO
	 2ayCuCfQ/SWNuEKLsjdtez5WWJ/Rx3S4cccVVI4nnz6yctG5GC/RZ1D3zyweiW/lmu
	 iFZ3ZGD01zHWbcUhu8K+4YKa6BQNMagsgNzR0lwdy+tLCjgbWLr2nwrMYFFtSlp+2a
	 N46quNNSV7fsQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqLu15Vi
  SwdR9BhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ayS63sBT84KlY/lm9gnMrRxcjFISTwhFHi
  5O12JgjnOpPEvClrmCGc3YwSLacesnUxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAhcXrKciYQmwUofru9DczmFXCS2PTlGSOILSGgIDHl4XuwXk4BZ4kFh66CxYWAauYeXM
  UCUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNVUlFmekZJbmJmjq6hgYGuoaGproGukYmxXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYBCnFDN83sG4oO+n3iFGSQ4mJVFer/pjSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkePmbgHKCRanpqRVpmTnAiIJJS3DwKInwMjYDpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5
  cqJc57D6RIAKQoozQPbgQsui8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubtBJnCk5lXArf
  pFdARTEBHLMs/AnJESSJCSqqBycH3FffqNTO/h2+PKd/Ze79S+eSsNg/TKbxfz+T83eg3y42x
  Ueb9+ePOxccVU4q4Fd8KTmMWi1WtiV/39+jFKUWv0x606pvrR4gwaJzcvbxy7cq7Jf9uHN/mG
  8aRaN3/+u6UM4Zd7zN9+hfZuisYf7h7Rv1R/awptlc/Slb3mbj7daRYOS98yvy/OOZ9o9rS4z
  aXliRdUj23o81F6cT3T8Zna7iWslgHJnpdiE9dMe/o/Rf50i9P3dpimhBqrGjiUFq2L3Sa1TO
  15nWPex/I5vosXf7z6joRqwW5y75sqdty+YZCWl3uhbTpHRXiGgU7H3xMlXpj9q7Xbn7i/wnJ
  vXtm7934rWvmJeMKvZO35iixFGckGmoxFxUnAgBfAmL0aQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1657177269!5138!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18406 invoked from network); 7 Jul 2022 07:01:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:01:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5EEBB100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 52399100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:01:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] netdata: upgrade 1.35.0 -> 1.35.1
Date: Thu, 7 Jul 2022 15:00:43 +0800
Message-ID: <1657177246-28404-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
References: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:01:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97743

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../netdata/{netdata_1.35.0.bb => netdata_1.35.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.35.0.bb => netdata_1.35.1.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.35.1.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.35.1.bb
index 26dc62d29..9decb63dd 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.35.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.35.1.bb
@@ -9,7 +9,7 @@ DEPENDS += "libuv util-linux zlib"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "7981103c4ddd452de3a4565fb6c304454dc4c9adcc1954d716102f14df8ad4bb"
+SRC_URI[sha256sum] = "587f6cce421015f8e0a527e3964a4de8cc17085c354498150bc3ade21606bbf9"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


