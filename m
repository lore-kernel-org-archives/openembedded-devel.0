Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5014FC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 01:28:29 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.3346.1646098107287233758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A73cDoJU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646098105; i=@fujitsu.com;
	bh=fDqP3TsCzajkBqBS+r12lZb9+ZW9I/sRROdQidsQWfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A73cDoJUmO0Fu4hCf90nBpsOJx/K+C/8l3fTss7AmhWYhRFryU+Zei0LpuRN1o4Mq
	 Gw2NDHIA/SXV6BODPNiX4bxo7xjYFIyexSjPyFZ66+9vDnnMvKlkxqljUXlTpR5UqB
	 Bj8pygdgHMYN3HrZkFDDThxh3UdUb5wYatesiUMNAXE/8hYAhMALXXllGdA+PjCn9w
	 YVrpb/ogbkMUYYxNCRlHSuznFNq8UI9oXsxPQ0JKTJn+8T0lp1A45J4PDWLfnj4lPo
	 DZSgDmem9XK9GCG+91+U+oIC9UKjjNeaLtrxy2ShgMn9ZZmSwfL4kpSV07DRJm9Le4
	 1/SqXM7F7O60g==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 6A/FC-12292-8B67D126;
 Tue, 01 Mar 2022 01:28:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORqLumTDb
  JoPWjvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH9+iWWgmWcFVufN7A1MB7j6GLk4hASeMIo
  8W/HDkYI5wKTxJr915ghnBOMElPunwNyODnYBNQlHt98zQhiiwjoSyydvQcsziygKtF9cQ07i
  C0sECbx9OUfJhCbRUBF4sjCSWA2r4C7xJ/581hBbAkBBYkpD9+D9XIKeEisuDIZrEYIqObX8w
  4WiHpBiZMzn7BAzJeQOPjiBTNEr5LEiRUfmSDsConXhy9BxdUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrRKKspMzyjJTczM0TU0MNA1NDTVBZKmJnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIFhnFLMMGsH46y+n3qHGCU5mJREeed6yiYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uBVKwHKCRalpqdWpGXmAGMKJi3BwaMkwitbCJTmLS5IzC3OTIdInWI05jh85cpeZo6HG2/sZR
  ZiycvPS5US5+0pBSoVACnNKM2DGwSL9UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnngkz
  hycwrgdv3CugUJqBT/gZLgZxSkoiQkmpgcuetCHigvLvW1Oi/wRv3pWzZZy98U9ORb5TcxLOj
  q9vJwbAjwWJdc+4U3w6HlQWxnux25hI9T2seTat1V/9X62bwSOSWdlWFp5HcrZUCd/83z/d6c
  PYqEy/T4psPZogrPZjt1LXh+9T/herr1mS/7y7ZLa2ZPPNk2pyn4R4CvPXVqnL8+ydETohNOH
  L6Ho+sesi0uQvPSc8/Kr+XJXX5SpEKu2l/HS5+WT7js9iH7Sn1D52l9UM3O23Z+DPlo3mvzEY
  tMTnNbq6rGVPXt/+xTZyTuHtO58Z8rp8TODZrXJTuv5y+5OP8pG+7dHcun8O94hyHs+oabrlj
  J7xYT2gePs9/6KSruawx69kCll0blViKMxINtZiLihMBO+kIP3ADAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1646098092!10228!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31611 invoked from network); 1 Mar 2022 01:28:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 01:28:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 083A810018E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 01:28:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E509C100186
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 01:28:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 01:27:57 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/2] [oe] [meta-python] [PATCH] python3-mccabe: upgrade 0.6.1
 -> 0.7.0
Date: Tue, 1 Mar 2022 09:28:33 +0800
Message-ID: <1646098113-11465-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646098113-11465-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1646098113-11465-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 01:28:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95615

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-mccabe_0.6.1.bb => python3-mccabe_0.7.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mccabe_0.6.1.bb => python3-mccabe_0.7.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
rename to meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
index 513a5a9f2..a2c72fcc9 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f"
 
-SRC_URI[md5sum] = "723df2f7b1737b8887475bac4c763e1e"
-SRC_URI[sha256sum] = "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
+SRC_URI[sha256sum] = "348e0240c33b60bbdf4e523192ef919f28cb2c3d7d5c7794f74009290f236325"
 
 inherit pypi setuptools3
 
-- 
2.25.1


