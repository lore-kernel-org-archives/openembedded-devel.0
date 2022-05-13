Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AFEC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:33:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.3724.1652409231579266696
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 19:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GPDmUlR2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652409229; i=@fujitsu.com;
	bh=oNirHFoRCRiC8bWDXVvlJqYsbCywsvygu5ernWc/sJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GPDmUlR2xGgNS+HKKmqc5yLdpvOwoEd6gb8tE5vIFxPrYGiol4H0TV4lUpR2gaNVC
	 K/doG8XKNPQyCla2TuVUwmI7ux0DpPqjC2b7DN/s9oC2+fuigDhT+w64EAbaTsASUf
	 Dooirk8qoK77VMmDailQPymC3gpO+IM5yGyfeJh7e7uqzMUWTVzPBSSSZEQtht5kvD
	 5UgfkmWFqyLhMudGyUG0ivZVUp3OnuCTEY2g6pX0tMDMiIi10uEEa1QUnCIBQEe6He
	 /xCNsPC/0MGlScyRNBwDsjIGjsVsh76dzqAEtYAGdbY97HD2SoWIsqk7pRdvtJkKzG
	 yUYUDVapbTYAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSbfncG2
  SweXtOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bGh2uYCk5zVmyfsYy9gfELRxcjF4eQwBNG
  iU0bW1kgnAtMEhNbtjNBOCcZJRa/WMHYxcjJwSagLvH45mswW0RAX2Lp7D3MIDazgKpE98U17
  F2MHBzCAkESjz8UgoRZgMKtrd3sIDavgLvEyYnzmEBsCQEFiSkP3zODlHMKeEgc324HEhYCKp
  m9eiErRLmgxMmZT1ggpktIHHzxghmiVUnixIqPUGMqJF4fvgQVV5O4em4T8wRGwVlI2mchaV/
  AyLSK0TapKDM9oyQ3MTNH19DAQNfQ0FTXzFLX3EQvsUo3US+1VDc5Na+kKBEoq5dYXqyXWlys
  V1yZm5yTopeXWrKJERjIKcWuXjsYj/T91DvEKMnBpCTK+ya+NkmILyk/pTIjsTgjvqg0J7X4E
  KMMB4eSBG/rIaCcYFFqempFWmYOMKpg0hIcPEoivLsOAqV5iwsSc4sz0yFSpxgVpcR5PTYDJQ
  RAEhmleXBtsEi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdyLIeJ7MvBK46a+AFjMBLY6
  3AltckoiQkmpg0rbZ/WxZUUTi/ejqjvWVlhu/B6/nFc0PzjCqUpy5ZZpiZvaBhCo3l0KnYIUl
  DQyCPUsZXK/m/w3+fZzHYdbiVdvZD765GGJQ+dzo7o1rP8J420XTDoppnZEoYJx2psO1M37ng
  4rIOt8DBUxJR29Wup3TmJUk9ktf7peC2LSSB1WOzh1vI9V9frF0nkl+E3/8yOwXNoEcAsqLLy
  7o5wzc96Lxmnv+xMoliU+zNVW3Tbqt/uDjy2adz3POTe0uLPnc1iG3xXSRrctkkaU3P2n86Vt
  UZXP0dOD/WrfMlaekuEquFDp8vjCV9/NP95SOJ47WB8vS9hyastSjlFHP83/Ry9ONXawWH7dP
  ShZ78+OdEktxRqKhFnNRcSIAJmxhk18DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-545.messagelabs.com!1652409228!821935!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6717 invoked from network); 13 May 2022 02:33:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 May 2022 02:33:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3CCA9100456
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2DD561000FD
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 13 May 2022 03:33:17 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.45.0 ->
 1.46.0
Date: Fri, 13 May 2022 10:32:59 +0800
Message-ID: <1652409184-13282-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 May 2022 02:33:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97089

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...n3-grpcio-tools_1.45.0.bb => python3-grpcio-tools_1.46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.45.0.bb => python3-grpcio-tools_1.46.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.0.bb
index 1e919dd3a..9569e8ec9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
-SRC_URI[sha256sum] = "a016cfc21e0d91b3b036d3d4f968d1fdea865dfa03524cb1fbeca84719fd45a2"
+SRC_URI[sha256sum] = "9295bf9b1e6dd5bcb260d594745fa3d6a089daade28f3a80cb2bc976b5359b7d"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


