Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF6CC10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:44:55 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.153562.1672123490866860813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rs43OBfG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123489; i=@fujitsu.com;
	bh=Fc8z27bNXi63aPSZM1NVvYFD5Q2ZHs1rA48TmuT7IAo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Rs43OBfGqh5Iry5kA1D5bRpOM/mgbv/+I4Fe8hs9++DdjG55y6cbWo3lOd8uELccY
	 45XnUdV2xpp5Sa0W/bhYIHrsQ3oCBgXOQyEaOhCxGmKIMNC9b7NlcSSGV5pdS3+dYI
	 SSgELJGyxiJljS9EmN0+Zof5fFhjgZb4WXjZ5dqFhX7ecf/Pl3Y07DWKsj12C00hib
	 38pKmuwTYYbY5Diu9nzGlXbYLJeB2adhPiG763qZcTf8rLeLiaLBbXRswwONQlpuFP
	 h0nx8HTfdQZzWMQT25+oO9atwNp5GgHPKFpWn4uFan9iJsdDMTIheIYGUhIyWWt4Wp
	 5DmVoPVbizmuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqJswZVW
  ywbbXwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bq/jWsBTM5K37sOcDYwHiIo4uRi0NI4Amj
  xI5Pa5khnOtMEvPW7GeCcPYwShz9/5ixi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBf4nzLQ/BbBYBVYl3O+aygti8Ak4SrWcugNkSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1iNC1OLSpLLdI11ksqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMaUYrbqHYxvl/7R
  O8QoycGkJMor1b0qWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb+kkoJxgUWp6akVaZg4wMmDSE
  hw8SiIQrbzFBYm5xZnpEKlTjIpS4rxfQfoEQBIZpXlwbbBovMQoKyXMy8jAwCDEU5BalJtZgi
  r/ilGcg1FJmFcdZDxPZl4J3PRXQIuZgBZ/OLQSZHFJIkJKqoGpO3qr5vwJZ1jr3faFad1e2/v
  +2bE1fwqM5z0U1uO8468dKqt6NKFlnaZgv5BKuL7PHd6J0/30T3+aeavrzHQ247aI3Nu1HJ7F
  AVJtq3X6/GdfjF5fpGD40GGq+qf03WcFopbfWx7snm6xhOPz3WWxCnY2oSpsRm1B/sYZ7nlba
  4vZvxw1Mjv09/ozP5/GKCPBn0wmLPrzOz6uVulm1t1wOHlZlN7FlYJaT65uWfn1RXtLbGWn8Z
  J1V7VnTdPneqt07O3MT5fzj998VPo14SL70tqlcz1mN5QfnPrq/OMv3G+K72w/LXr7juXMsqr
  Grbc/r/nlOz9Y7mhEm4X11gnTIiSk1H/8+WPLc+fO8ltLlViKMxINtZiLihMBDEjDx0EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1672123488!455899!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 967 invoked from network); 27 Dec 2022 06:44:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:44:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E6AFD100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DA5D8100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:44:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 22.7.1 -> 22.12.1
Date: Tue, 27 Dec 2022 14:44:09 +0800
Message-ID: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100265

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autobahn_22.7.1.bb => python3-autobahn_22.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.7.1.bb => python3-autobahn_22.12.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.7.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.12.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.7.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.12.1.bb
index 09957ad00..54f42fdc3 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "8b462ea2e6aad6b4dc0ed45fb800b6cbfeb0325e7fe6983907f122f2be4a1fe9"
+SRC_URI[sha256sum] = "43b4e8b1aeaeb20a0cc0a81572e613dc958057c0ab248a7d6b41b2763270f925"
 
 inherit pypi setuptools3
 
-- 
2.25.1


