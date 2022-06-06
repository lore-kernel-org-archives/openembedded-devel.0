Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7DAC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:19:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.31212.1654517990078216477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=E9f+ZmUE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654517988; i=@fujitsu.com;
	bh=TQdNThrBp0vljeLu/2ovpbHvwD6Jnj5RxUUPTwLXZLI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=E9f+ZmUEA5W3JMMaiufeMyEy4yWEagw6qUayJ/JvmUPYKN4v+YDwPAqAMjTCr4g5K
	 1j9CcAONNW6oL4qKrXxC3sPc/DMRjOH/961vrJvKO5u6EGzVWfTfjgqL5FQVEFcOmP
	 D5mS8AfQR2Bzldf0vm85ZTZ5OqCrCcqmFus3iqB1bOwvyJ8wJU1Zly+rPREiu/k1dG
	 06rjuBF15cRL1Z9XvLfuOppjkXRjG+nt01gO9+f6T75aeWGsRjm81OzWOMf7hgDlrL
	 I5Zs1Dbj5yzydeyx+vJ0W4ve9IYdTGv6ZbJCm2s3RmI8uZyhEFy0c2iQqMRrBvJFSP
	 hR5mCBYKBIqBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORqPv4w9w
  kgxd7VS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyOA+3sBX/ZK1rP97M3MC5n72Lk4hASeMIo
  cepiJ5RzgUniV9MnJghnN6PEtUkgZZwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA1YjL
  GAnMXF9KwuIzQIU33RyFxuIzSvgKPFi4kewegkBBYkpD9+D2ZwCThI75q0G6xUCqtn+9QhUva
  DEyZlPWCDmS0gcfPECqldRYvblZhYIu0JixoxtbBC2msTVc5uYJzAKzkLSPgtJ+wJGplWMtkl
  FmekZJbmJmTm6hgYGuoaGpkDaSNfQ1FgvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMJhTitNm7mDcsu+X3iFGSQ4mJVFe+2tzk4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  B5/A5QTLEpNT61Iy8wBRhZMWoKDR0mE1/odUJq3uCAxtzgzHSJ1itGY4+qVK3uZOWZ+bTvALM
  SSl5+XKiXOG/QeqFQApDSjNA9uECziLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5i0GmcK
  TmVcCt+8V0ClMQKf4PJgDckpJIkJKqoFJ7sGZ6Y6KR/w2LZffXpR68fC3yq3XZpUzXLpvx140
  58Ynk7ffPIKuPrjY861Ub+eKj52yha/2b9wpczhRcO8qPhth7pAN2W8OZ8Yu3S0R0BGuIG1e/
  b8kZterYyHWT2Pe/rHglBX/vkXY9OqtEI+FIq67g26aGXywefxp8jah15bLBHo3yT3oEpqyUU
  dA5bN2ucIRRteUdU/9rvEYs014erbtIseZDScvbK7TTDoYKHFAUGw3/zOzq3GPYzk82/SWqop
  yswhqM3dcbvxzc9HMgK2vtes2FF/ftzOj8dq8e/lTGjqDVnst137ovlPrc9PLHMc7nEuWvjaS
  vnx864kbG9f+XT236tcrTf07v+dUSiqxFGckGmoxFxUnAgDQk8JFcwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1654517987!103932!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5266 invoked from network); 6 Jun 2022 12:19:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:19:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DE02F1001B3
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BF064100194
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:19:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.359 -> 0.360
Date: Mon, 6 Jun 2022 20:19:06 +0800
Message-ID: <1654517949-9033-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
References: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:19:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97419

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.359.bb => hwdata_0.360.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.359.bb => hwdata_0.360.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.359.bb b/meta-oe/recipes-support/hwdata/hwdata_0.360.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.359.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.360.bb
index 35648541a..b395409c6 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.359.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.360.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "bf3322565b3bf5c35c90e42ca6cf4928f2f2d481"
+SRCREV = "5e1a17e536de5b2888ecb7ae58ded885a53eddfd"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


