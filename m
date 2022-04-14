Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111F1C54EFE
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.7431.1649906747247288623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dfQumLnR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649906745; i=@fujitsu.com;
	bh=eHhu2K730obDyR49W92DENdXfrBMbkS0DGoXUo1HVhw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dfQumLnRfdzfGa2Ho3T6YCPZCUI3cZfDV8bDe7l5FBPE74HNr3gXlCqJa3vAWoPWL
	 x583ICByRPSngksW9C8cgOJTM9/IjEhwNGojOUoN6mOxIhW+HiU9Lr5WJwp17wkjJO
	 ZPUmG3oDBru0Pkv+W5Af6RxfaziCmoBqIkupX0GQw3hCCor2CmpJzPkjAre40WkxMg
	 T5g+Nexd/XUgKKxl8l1RgE/TxFhiefv48aFecS2oxBO9JMJBuiS+WsTjGazXcbGkGg
	 ryr+Y4vpgWkvIj4cDLBlLAZodd8ls+9edYt9o7uZnZ061/rJxUBExTLsL8JE5Y0Oeu
	 +GRr6dQDCsbrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSddiSni
  SwbEJMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bdtZdYCqZwV3y+dJSlgfEnZxcjF4eQwBNG
  iTUbPjJCOBeYJNZNec0G4exhlNjeOoW1i5GTg01ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQEPicmL9zN1MXJwsAioStz+JwkS5hVwkvjf9BqsXEJAQWLKw/dgNqeAs8Ta7XcZQWwhoJ
  qD588zQ9QLSpyc+YQFYryExMEXL6B6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrRLKspMzyjJTczM0TU0MNA1NDTVNTPXNTQz00us0k3USy3VTU7NKylKBErrJZYX66UW
  F+sVV+Ym56To5aWWbGIEBnNKsfOyHYzv+n7qHWKU5GBSEuXNMgxPEuJLyk+pzEgszogvKs1JL
  T7EKMPBoSTB6zQRKCdYlJqeWpGWmQOMLJi0BAePkghvVz9Qmre4IDG3ODMdInWKUVFKnHfnJK
  CEAEgiozQPrg0WzZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM6TQaawpOZVwI3/RXQYia
  gxd9WhYIsLklESEk1MM0UE/m2zPKc/qJYtS+hz7OiZfzvJf/PONUyQyP1FttCgWfmRtM3LFNg
  Oy404STTyutKnzZZzms62cmouG8Z6+Tv+oL/7XidZQVdhF/vFs/LWG2t/2tLd3TL/psenss0t
  E885j/wWOufmm7YGflEjjtbV/5YtGXDye/cJz0Wa/P8THbNPCu57d3dbbcSDik/yXz9ieG3oR
  ffj6PC/SK2NWuqQ5KXJ1wSzUot6G0s6fBj43Hyk/YLP9ah8GL2kbKWI4pHT8UuFfh4uE2r75D
  r1A2JvpJFxyyZfthPaNg7R9zhyBJG3icuy+yPpi9dfHPLBcO2T+2SjLrSrEH9NZtnzvX4t9qU
  KTH5R8aiLTk5rUosxRmJhlrMRcWJABg4/xphAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1649906744!55114!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20814 invoked from network); 14 Apr 2022 03:25:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 03:25:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0546E10046F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 04:25:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id ED119100466
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 04:25:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 04:25:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] smcroute: upgrade 2.5.4 -> 2.5.5
Date: Thu, 14 Apr 2022 11:25:18 +0800
Message-ID: <1649906719-18151-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649906719-18151-1-git-send-email-wangmy@fujitsu.com>
References: <1649906719-18151-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96643

Changelog:
=========
### Changes
- Revert extraction of version from GIT tag.  Incompatible with systems
  that do 'autoreconf' on a dist. tarball

### Fixes
- Fix #175: Parse error in '/etc/smcroute.conf'.  SMCRoute fails to
  start on interfaces with 'mrdisc' disabled, when built with mrdisc
  support and '-N' passed on command line

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smcroute/{smcroute_2.5.4.bb => smcroute_2.5.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.4.bb => smcroute_2.5.5.bb} (90%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb
similarity index 90%
rename from meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb
index 649e6d4e8e..b0b96bed8f 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "9b6e397595a154c84a329c55bed21e0c43e89ee6"
+SRCREV = "9ca7441add4427a91fe90c34ae4a178ed9a50553"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


