Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D9EC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 12:37:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.10315.1648471058039245349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 05:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MNL9KJO5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648471056; i=@fujitsu.com;
	bh=kMOuQb1wCsLHWNQPaij0uO2njGSmXBkkJYUb/2U5QdQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MNL9KJO5oUN1Db2RXIndAk4Ro5zcvUxc+IeWyVi8eHBfrDM75RkfYi3I0+6EtxGJZ
	 TA0UNd2lrBi47XwWGe7LsFESUsdEk6pttbhLxNFMael0m9Z7af6emA0e6CEbwvMoCO
	 OSJnPIH32j0676eOjyg3YsNFbrkfrnJbmV+Phpg77AV1QccY+K8nDu5OvAUR19JbO8
	 qoRq4hcfi9+8zHA5B/HrTjuwuPzBC+KS0J5Ebi4H0A+SL/zytm0X5uIy5kNL8dT/cL
	 XZNx2Ibqfn7HifavR3A+szLrCpraWePDRIpv0Xti70gVKkj6Kah0vVrAgw1SEuNQzd
	 8Z4CxyTJLYRNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MxSZd/jWO
  SweqH+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aG80fZCp5yVFz7/o+1gXEiRxcjJ4eQwBNG
  ibvPnbsYuYDsC0wS0/fsYIJw9jBKbP79ihWkik1ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYYEAid1zuoDiHBwsAqoS3w6IgoR5BZwk7s08xghiSwgoSEx5+J4ZIi4ocXLmExaIMRISB1
  +8YIaoUZSYfbmZBcKukJg1q40JwlaTuHpuE/MERv5ZSNpnIWlfwMi0itEqqSgzPaMkNzEzR9f
  QwEDX0NBU11DXyNBcL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCRTihlv
  7mBs7fupd4hRkoNJSZT34lzHJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvI0rgXKCRanpqRVpm
  TnA+IBJS3DwKInwBswGSvMWFyTmFmemQ6ROMepyXL1yZS+zEEtefl6qlDiv0GqgIgGQoozSPL
  gRsFi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdxrIJTyZeSVwm14BHcEEdMTad7YgR5Q
  kIqSkGpguqyS8ev7tTobo3OcLFxZf/3Fe+JGb6bdtiz1qt1n8/29zMjzdesZ70dmvPy2zSbRS
  vRH+4WHBs1vsHzw8Ds78//5r/GH+1fvvvD8SY7gga9nJm4s07m8JjFl3c7NQd4a8vPPDvnfLE
  38/KL+7bpdY1Ot3/5h3vle8avZBdUUQJ/e5rRXhEs5Z358UCsfPKvGyOXexJj2bn7e3X3mj/t
  knGu+K/M9JLlsiz+11SLeje4X/w46iZ51iD36ZyIp0Tta2MXGVNzaqip9VfH1Tf8e083Jxu1R
  nS4eptkVMbnyyPXK/2IuXmk8dFn8o335F9rDRGV/NiYE8F+/G3MxU2JxR9lI7kJdP/lXxnNPO
  vXocSizFGYmGWsxFxYkA1RYssFADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1648471055!24675!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26704 invoked from network); 28 Mar 2022 12:37:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 12:37:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4901310033A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 13:37:35 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3C2D51000FE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 13:37:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 13:37:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.155.1 ->
 2.4.157
Date: Mon, 28 Mar 2022 20:36:57 +0800
Message-ID: <1648471017-16736-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 12:37:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96238

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.155.1.bb => python3-pymisp_2.4.157.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.155.1.bb => python3-pymisp_2.4.157.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.157.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.157.bb
index 613a009d43..a900e70279 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.157.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "03dc22f9598e6caae81b0e40ce27bf3f17799f4e"
+SRCREV = "b1892efb6a078d1370cee51c9103f3a591c628d2"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


