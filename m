Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74113C64EC7
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:40:48 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.7901.1676878844603452303
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YoRoFaec;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878842; i=@fujitsu.com;
	bh=WwY7pek6PwzH6bwOWlFYj8Ti6CCaV/9orLFDoCZyobk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YoRoFaecTeo2gXqwGWrV2v2xiNc0a4yP4Rer2hwjM/ZCLmS9BKHlnqHpjTG8aC9NX
	 53Bxm77GHtAzd6QcRaikH2BpRxuUdoE+Alenn+v9Nqg35g8qjqD6ULMdUpIkw4Hw91
	 cqa59K8cA3FGb8XxB5zTNkbBu0L7c3SSOIWDqmAnQJeXCyGn1rmY2tXQi+xaOBHcN7
	 UdBK+4V7y2Owqj2Xz+MGKu0xQQHRlSkhPzKIezSQAgPUTGAl1LKX46Cp2PthbidzPc
	 M/8EqCdkZ4tgFs1GIAy8LP8E/nMZJuYetZWg+bq2lhRHsCmRxsfWAxNPQU19KuTbaM
	 TBv6gEvn30KFw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqPtL+XO
  ywbPfAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ba9f9ZCtZxVKw59ZOxgfEqexcjF4eQwBNG
  iUvz/zFBODeYJGa3PYJy9jJK9B55ztzFyMnBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhASeJif8fgtksAqoSH36/ZwSxeYHiW94tZAGxJQQUJKY8fA/WyyngLHF40lKweiGgmpZ3d9
  kg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzdDzamUaP3wC8pWk7h6bhPzBEbBWUjaZyFpX8DItIr
  RrDi1qCy1SNfQQC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1
  ZBMjMHxTihmTdzBe7furd4hRkoNJSZR3k/DnZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvFWKQ
  DnBotT01Iq0zBxgLMGkJTh4lER4paWB0rzFBYm5xZnpEKlTjLocV69c2cssxJKXn5cqJc6rAI
  xMIQGQoozSPLgRsLi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zjIJTyZeSVwm14BHcE
  EdIT7jw8gR5QkIqSkGphCOV2LL+lu3NXnvSjw4pHDrZG/H6vu+TrtctW1B7fimXK/7MuyeXNn
  D5/Z7k0XJ3xOV+Iwnmwndmpl+EJGDYZY0djnMxSPabHd6FA669opk6Dmevvk1Tr9D0tLX1dnx
  02Ywad8XbYxV38tj6r2b6eJ53zmhCyO77ev3SLzyn2npPk8d7b+6a6TEy8umHOriaMxYbXw9f
  JQR9F+yykeuvMfbZpxUsWA6aTnjafHnlheiTA18jlRPKvf5ZBhyJkl4vzXvKQOxyQ8O3zuYpT
  Nku8b9tSWNi7vZHY2SK/69v2O2R4z7fsdHgaTb1cz2f0+6yq+/Uv1RrZJYavsFp+SeLJULuQC
  g9b+0jTP9Vs7LjEqsRRnJBpqMRcVJwIAv8Uue2YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1676878842!381250!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1950 invoked from network); 20 Feb 2023 07:40:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:40:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DC64A100191
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:41 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D059D100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:40:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pcsc-tools: upgrade 1.6.1 -> 1.6.2
Date: Mon, 20 Feb 2023 15:40:20 +0800
Message-ID: <1676878821-15492-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676878821-15492-1-git-send-email-wangmy@fujitsu.com>
References: <1676878821-15492-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101158

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.6.1.bb => pcsc-tools_1.6.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.6.1.bb => pcsc-tools_1.6.2.bb} (89%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.1.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
similarity index 89%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.1.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
index 6a2e1b2e0..26faade5d 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.1.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
 
-SRCREV = "63e532cfa97932aac76ca5f7473d1ce11602a139"
+SRCREV = "b1018b83346f8a3bc3d42c96f2ed4dc62147cb24"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


