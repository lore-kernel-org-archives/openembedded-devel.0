Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B1DC636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:34:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.5812.1676536491261488733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=thpj8fbn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536489; i=@fujitsu.com;
	bh=T/h87sjJvO41uYvp75EKdVamOnRBQoqj31Bl9JElqqU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=thpj8fbnILT4aufHLUv6/8zc5PkmrTVQgU6N9Cpu0jlNRZDMPXYDZlq/6EM0Fb+LP
	 qQV7P2sBIandANcfSerTDvjqsP193OUCam17y6q8z5a773RwH5Z7Gq26B2rTJgDp3z
	 sQpF7xu1WteQvOT1UCNXRbypMivnvwGZ+V6ynuR/KyOWtYftyo2VUlaJSTMK16Po2o
	 llgmap9HvaLeP3spQAAvwEFHVDf2bjrzyegKUzk+++TryDMlWOdWHTfu/URBMA7X3a
	 WkmwXJ8nvtoKMiaR5TgwjbTcLkr+0tmJYe2U3EzctHnHSvkehD7BpbuoxTotdnQ7K+
	 X+3GmPYluw5oA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8OxWXflq7f
  JBovPMFtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkdV3eyFyzlqFjw6TFjA+Mp9i5GLg4hgQeM
  EtvevWSBcK4wSdx90sYE4exllNhz+T1QhpODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQE7iQMr94DVsAioSmy8eIsJxOYVcJLounIWrEZCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdqVE64dfULaaxNVzm5gnMPLPQtI+C0n7AkamVYzmxalFZalFuobmeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgQGZUpx0Zwfjzr6/
  eocYJTmYlER5i3XfJgvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4N3wDCgnWJSanlqRlpkDjA6Yt
  AQHj5IIr+AVoDRvcUFibnFmOkTqFKMux9UrV/YyC7Hk5eelSonzLn0BVCQAUpRRmgc3Ahaplx
  hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80aDTOHJzCuB2/QK6AgmoCMWMIMdUZKIkJJqYJr
  z6+ibxS8fuMpLLlqb9enHhr8dqcmHFFRyiqZvW3T30zS524YBHDty2t9syuuu3OD7UuqE16M7
  pzMCX81WDFA4YP7VX1XxicHCV5xaTpfWfbnGJ2mUd+etClutoFFK74Luf2aszYZ53zaVf2XN2
  dUY8O3qskP/2t8t33BQb8/Brx8brBt/HS5hb03ek98mmxaayOkUuGr1VL2lL+Jneb434ij75X
  TRc2uNauiqpnXT+PYYRb2x0Pp5detBxSnri7bz3l76Ql6KdU/novUGOZo9P4w/nNZx/zn7zda
  v1b94Ptlei01tfOaY8qtCRO+Q5rYixdyWtqoyIe4j9tFKyV9v3tzmaqkakML8Y8lc20IlluKM
  REMt5qLiRABgnGaDTwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1676536488!89389!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32108 invoked from network); 16 Feb 2023 08:34:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:34:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 877A57C
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:34:48 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7B7B27B
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:34:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:34:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.366 -> 0.367
Date: Thu, 16 Feb 2023 16:34:36 +0800
Message-ID: <1676536476-14487-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101095

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.366.bb => hwdata_0.367.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.366.bb => hwdata_0.367.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.366.bb b/meta-oe/recipes-support/hwdata/hwdata_0.367.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.366.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.367.bb
index 4cab9b0fb..9d2783363 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.366.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.367.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "2fa514ff86da425726dea8629bcf4ceac9d8e7ff"
+SRCREV = "15c9d3bc939848e5f8b86cf9496f991de48c861f"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


