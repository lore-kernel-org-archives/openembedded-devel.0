Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE70C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:39:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.153515.1672123134639873908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sUtdnl5h;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123136; i=@fujitsu.com;
	bh=AFLNp/buyixFyQ2Hl5jDnff+oxnBfDRYGeK/XOBq6cs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sUtdnl5hilkXgmuXbSBP7rg+3V8qfAszqzDODfuhzFHwdLVAAJ9X0TIjBzLrTqp26
	 HCmNUsQGhlxeyrvTZk9vo6mOMxsp1HNV7b6pdiPgoABqQnTO9Sa8SuMMImiaDHBYPK
	 0ySAS1Us/2y9/verGrgeOkx2QDhjpObOdSfZUyJTFQQZqDv9n5yjZwkIuw8GOdpJT9
	 bP7E3tTWTYYvHDlhYFkXEXHRK5osUmz1Unk/Yp48zJw1DwCbq0tWr7jsJ+WlVKkXFc
	 P8kpPQxABSAUSNEXo6X84uAyEsqZnYJ6Taqa55/EvB8dhb92nH6RiUx5FLz8+nDOkO
	 dbU3W17vS75uw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqPtv0qp
  kg8X3+S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyDbfuYCk5yViy4eYKpgfEuRxcjF4eQwBNG
  iTWtf9m7GDmBnOtMEh3fEiESexgl/h1oYwVJsAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1izsECwRNfXGUA1HBwsAqoSM/dzg4R5BZwkXs6dCdYqIaAgMeXhe7BWTgFnic6Nv1gh9jpJHO
  nsZoGoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRroZdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi6KcUp7jsYjy/7o3eIUZKDSUmUV6p7VbIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d5SYDQICRalpqdWpGXmAOMIJi3BwaMkAtHKW1yQmFucmQ6ROsWoy7G24cBeZiGWvPy8VClx3k
  SQGQIgRRmleXAjYDF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrzrIKp7MvBK4Ta+AjmA
  COuLDoZUgR5QkIqSkGpjqt/VnxE3++G7NpIU6i09HRso3LHg4MXiHXPqSCCZN9S1ef1acdfrQ
  9bhnTplq4typUgcMw4rmZ1/on3NYs/X/+/OTnUoW8BR1KDpqHIj3FHLjd9/2rujY662VJ4x90
  jZeilWPmXBcoPX2awXfRVzTPCLDH1sl1FsfmPJloc7Z21xzPB+o7HHrdVF2eLEqUplHQfmO4u
  NcmRLG9UtC/iV/fnPjpaduVRlnY+WGFT0FRw5/WFw144295i35jzlXT6R9CekvuCHb/3NWKUP
  hGQVHhok/XQ4e37W8R2u1e8StMzs/6oWvq0xKaVh69NWeNE/H0uaSnr69Vxye1Cvdmfoxfo/E
  sWdBPRXz8qa6X1VTYinOSDTUYi4qTgQACVNE6GQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1672123133!449401!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30030 invoked from network); 27 Dec 2022 06:38:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:38:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AFA89100192
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A1FED100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:38:52 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.12.11 -> 2022.12.18
Date: Tue, 27 Dec 2022 14:38:15 +0800
Message-ID: <1672123098-31844-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
References: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100261

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.12.11.bb => xfstests_2022.12.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.12.11.bb => xfstests_2022.12.18.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.18.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.18.bb
index 136fea8adc..cc0a097cf4 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.18.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "87ab8bdf20db7308e7ecc2ddcdce530ec1f08f1f"
+SRCREV_xfstests = "e263104046712af5fb5dcc7d289ac3fa5f14b764"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


