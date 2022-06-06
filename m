Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC4ACCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:19:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.31157.1654517989619762439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pS2DgLEz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654517987; i=@fujitsu.com;
	bh=Zog+yombK1FL+v2sDwaAVv1z2vRfdQVPx4WlxmA+lXY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pS2DgLEzL9Byu7y6izGq8rVcAQjx8Fxu66obGkwbdAGrzFvCDxRBie26ywvpVQoWH
	 3CMRr1Of/VgekdEpICN1W9vvAE7Pj4uOgOTp7sTmpb2egZ7txTDTcXLF9REWBDutbt
	 umrV8M3juR9jjuTG5+iOn2ZRxNF9sysdNyCqmtxv4MDnRcON4F07DHtof3N7YkgVBh
	 nt9u0yctW9KL2NIAU/tcC8KKamc7Nv0pk7PcTp/N6bDuVtDizmOq22s+A8jf+9Hu7m
	 Z1g8eed9aNcrV78KutJX6n9h+QAMalx8hvAKFGsUj5jta5seYf/GRKZ3ISnYmjCiZ8
	 TpVuMngTeZytg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqPv4w9w
  kg+/7hC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owdb5+wFExir9hx+RdLA+NWti5GLg4hgSeM
  Eke/PGDqYuQEci4wSVy7qA2R2M0ocebTP2aQBJuAmsT0WzdYQWwRAX2JpbP3gMWZBVQkXvzuY
  QexhQVsJJou/AYbxAIUX7DoIJjNK+Ao8brlLhuILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmFgi7QmLGjG1QvWoSV89tYp7AyD8LSfssJO0LGJlWMVonFWWmZ5TkJmbm6BoaGOg
  aGprqGhsBmSZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBYZlSrJCxg/H7
  yp96hxglOZiURHntr81NEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBWwcMdCHBotT01Iq0zBxgj
  MCkJTh4lER4rd8BpXmLCxJzizPTIVKnGHU5rl65spdZiCUvPy9VSpz31nugIgGQoozSPLgRsH
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtxhkCk9mXgncpldARzABHeHzYA7IESWJCCm
  pBqYzsq+PS7iILv/X2vPgdER+l+PEmZcnxS6rm2f66oXvvttfNwodDDx05M4DxsieJI/lIrUd
  Rucj+uL6onIZdz3rrl2bZlMzo0FHlJO5/+P+FWUxbj+8g0XSC+6+XfhQVe/AbL3PF6LWykmsW
  nKg6vNhzqWSrl7Nr6/LBKm4BC9/VJFSdX3iEuXDoRdSvynpzPC1OXyiLeWxdeHWqgusxc/zw9
  0CzltPcze/UfvuXvARJ2/2Bbsk3xjvU+nL0Zgu5Dv934Gs//XiNhNjojkCWW64lode2rKnwbs
  kJYzry6Xw289+lxwBpjfWadOfdaz7Jr6mcIa/rsrJEu+Zfg7MGZEN5U6MIkLV83dyP9P5pMRS
  nJFoqMVcVJwIAHT4k65SAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1654517987!344141!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31254 invoked from network); 6 Jun 2022 12:19:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:19:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D67C010018D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BBA2E100184
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:19:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] htop: upgrade 3.2.0 -> 3.2.1
Date: Mon, 6 Jun 2022 20:19:05 +0800
Message-ID: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
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
 https://lists.openembedded.org/g/openembedded-devel/message/97418

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/htop/{htop_3.2.0.bb => htop_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/htop/{htop_3.2.0.bb => htop_3.2.1.bb} (96%)

diff --git a/meta-oe/recipes-support/htop/htop_3.2.0.bb b/meta-oe/recipes-support/htop/htop_3.2.1.bb
similarity index 96%
rename from meta-oe/recipes-support/htop/htop_3.2.0.bb
rename to meta-oe/recipes-support/htop/htop_3.2.1.bb
index 12b110ead..233a1eeb5 100644
--- a/meta-oe/recipes-support/htop/htop_3.2.0.bb
+++ b/meta-oe/recipes-support/htop/htop_3.2.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
            file://0001-Use-pkg-config.patch \
 "
-SRCREV = "c7413fd6771b65388bea14ef42863444c6eaa419"
+SRCREV = "4e6ec4a0873c56ca9de63eadf730c5bd677bd8da"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


