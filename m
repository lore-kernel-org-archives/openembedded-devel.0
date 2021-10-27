Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC7BC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:25:06 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web09.7742.1635312305716312944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fPlmKFyJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312304; i=@fujitsu.com;
	bh=AZ9kISz5IHHb4XvL1y+lysWFkcyLzNlAsIuAboPc7Q4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fPlmKFyJmkEOpF1aTrVzTJjFK2/AvUorAB1zEeyZ08+Vuwdi4U1PphwIDu31IfMez
	 q/w3Q/eLUgn6WcmDgValm4WN5Sz9kvhTvvZGGXvnqQSAGvi4xezX9plOBS85S6eXiE
	 YiB2wN7gJMjW2quzqItIgv/KwX36lCmbLFu1T4/Ne4k+UzM8Ed/dHIpAqpmroLfNzw
	 rX4UVCntTZJlz3cZcWMFTZubSenIMkkv0wTuj+QK89hwBz8MChPS4M6eo8fMM5noLd
	 e0EEyfyTUGxo/07BknLy58YbRnSyBcKE0SAo72OO+fLVH+6A4oxWMM5q7WNfscDoMN
	 YPGhP7F8zDC/A==
Received: from [100.112.196.227] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 3A/1A-20159-FA2E8716;
 Wed, 27 Oct 2021 05:25:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxSXf9o4p
  Eg/5dwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b6z2fZCi5xViw4dIO5gfEHRxcjF4eQwBNG
  idmTu1m7GDmBnAtMEicbvCASJxglnm69AJZgE9CR6HjRzQJiiwjoSyydvYcZxBYWCJFYf6yfD
  cRmEVCV2PhuFhOIzSvgIbHpyGMwW0JAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gUzRI2ixPadZ1
  gg7AqJ14cvQcXVJK6e28Q8gZFvFpL2WUjaFzAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNc
  1NDbXS6zSTdJLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMvJSCo507GH+9+qB3iFGSg0lJ
  lNd3W0WiEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnepHtAOcGi1PTUirTMHGAUwKQlOHiURHgNH
  gCleYsLEnOLM9MhUqcYFaXEee/dBEoIgCQySvPg2mCRd4lRVkqYl5GBgUGIpyC1KDezBFX+Fa
  M4B6OSMO8/kPE8mXklcNNfAS1mAlrMrAS2uCQRISXVwCRswSz5gTnxTNH2YN3YlKf/lI+fdWm
  fYsRg/axwhdKc0+c//Pb+kdj2MWfxll0ntza+DGL/8lyq9jz3tTNJi7U6f4fEbHebL7MmucT4
  tt/y4+4rxJh+NPT+W9v9+Uz9ZsYwpRmqqiu+rD/c0/6o4+ntZlbXCwEancsrl/Q9fFnbqSeXm
  H4+dyb3z8jUS7K1B5+/US2b+2/zxDt6whKL9PMX2PL6p9cp/zyic7Ts06pqIZun6WGL3pnxK3
  pYqzr/M5t0OMxEwd/Mzd4/2WDLa5crx7xu8XHa/JkcVvOXxb2gXlx0k9l+k71C2p8Ud6lE/W/
  Q2y50eNWO/m/x4RzZ3UaLtNWLGFXSX2Yd6RKap8RSnJFoqMVcVJwIABS0rk03AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-291.messagelabs.com!1635312303!227424!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23029 invoked from network); 27 Oct 2021 05:25:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:25:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E128B10044C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:25:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D4947100441
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:25:02 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:24:41 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pytest-asyncio: upgrade 0.15.1 ->
 0.16.0
Date: Thu, 28 Oct 2021 01:24:37 +0800
Message-ID: <1635355477-112196-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:25:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93618

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...ytest-asyncio_0.15.1.bb => python3-pytest-asyncio_0.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.15.1.bb => python3-pytest-asyncio_0.16.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.15.1.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.15.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
index 1c7df2c72..1dfeab633 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "2564ceb9612bbd560d19ca4b41347b54e7835c2f792c504f698e05395ed63f6f"
+SRC_URI[sha256sum] = "7496c5977ce88c34379df64a66459fe395cd05543f0a2f837016e7144391fcfb"
 
 inherit pypi setuptools3
 
-- 
2.25.1


