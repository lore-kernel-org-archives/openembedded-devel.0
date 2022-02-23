Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14461C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 06:49:46 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.4647.1645598984035522544
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 22:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CZIYoqdE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645598982; i=@fujitsu.com;
	bh=t1GL5TpI9kiNCJtU4hmuYeOtK/69prBazGfZaYNAb30=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CZIYoqdEpflnj3X2QNAgUhf3O3madbrERexqqWyKWs78+nGU0pu+pUhJZWM3Pso32
	 5/M4cjPrij2nsFA6D1z1pbo9aa5Fti2UPjzbwbWiKqYtq5VzN8TnB7F/RIgVvv+uaS
	 QkYL7hyM2U09m9NonFLVa9LVBJ3FmveRIcK5kuZmBofHXO4t9i15mRQhpZaEBxHAR5
	 ro3RaNzHmll9IPzTSLJwZT8tZZNHc2R0h8cmHyBYeCSR6lZCU576lU+GabT1nn6xbg
	 CJkLNrY18D3F24f5Bwo3ZR4nO7QGDEDzHPlUEAHbGupRsTMbS5+8LaY+7CZhFOK+Jq
	 ctRF9yl2mbf+Q==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 01/C3-25243-509D5126; Wed, 23 Feb 2022 06:49:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSZf1pmi
  SwZvtihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0brzDPsBXM5K3a9/sfYwHiMo4uRi0NI4Amj
  RHvPPyYI5wKTxO05/9ggnJOMElsbNzJ2MXJysAmoSzy++RrMFhHQl1g6ew8ziM0soCrRfXENO
  4gtLBAtsfblVbA4C1B82+bbQDYHB6+Au8Srk1ogYQkBBYkpD9+DlfAKCEqcnPmEBWKMhMTBFy
  +YIWqUJE6s+MgEYVdIvD58CSquJnH13CbmCYz8s5C0z0LSvoCRaRWjXVJRZnpGSW5iZo6uoYG
  BrqGhqa65oa6hsbFeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhYr7gyNzknRS8vtWQTIzA4U4rd
  W3cwXu77qXeIUZKDSUmUt/CIaJIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7wa0A5waLU9NSKt
  MwcYKTApCU4eJREeNOuA6V5iwsSc4sz0yFSpxgVpcR5l50FSgiAJDJK8+DaYNF5iVFWSpiXkY
  GBQYinILUoN7MEVf4VozgHo5Iwb94NoCk8mXklcNNfAS1mAlo8JUsIZHFJIkJKqoFpf4J0SFP
  fh3OuR7/9nxDI9cHSMPDMuu6tApPk7CqXhm3Sm62t/ezOlbO/+/YEFwSpyXtbeezs7GvsjRLu
  ut9ZNJ8zuYRF+c3rbKutL7t/Wr2z26pbIOl4Z8dH34wbqp3bj00sVX5bef9JtPd7fW49uUOJD
  d+WHblpInGbJXDhDs7nL4/76jAvEtOxOhGyvffOjLbG030l0sq/xNmYZlctuqutkfRhbVGEoX
  T37FXT/rr7ak5MfqXybNasRFnv95Zfv1l9XnJCVcmuOYKDqcZpe5bFMsafPxZOWKe4Ok2Bd5n
  LnNXZ1pI1z86Yfkt/XW3Csy/zkO3Ud8qX5mTvrcoRPSv4k8d4ue4mLdPzstuVWIozEg21mIuK
  EwGUvBDbSQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-532.messagelabs.com!1645598981!39838!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7503 invoked from network); 23 Feb 2022 06:49:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 06:49:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1204B100450
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 06:49:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 052CA10033B
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 06:49:41 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 06:49:18 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/2] [oe] [meta-python] [PATCH] python3-autobahn: upgrade
 21.11.1 -> 22.1.1
Date: Wed, 23 Feb 2022 14:49:55 +0800
Message-ID: <1645598996-15716-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 06:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95468

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-autobahn_21.11.1.bb => python3-autobahn_22.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_21.11.1.bb => python3-autobahn_22.1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.11.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_21.11.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.1.1.bb
index 857862d31b..f149b1221e 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_21.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "bd6f46315419ca0a5be4109f737410208ad5f19718f67ca6a4a674cc66ca9b18"
+SRC_URI[sha256sum] = "17e1b58b6ae1a63ca7d926b1d71bb9e4fd6b9ac9a1a2277d8ee40e0b61f54746"
 
 inherit pypi setuptools3
 
-- 
2.25.1


