Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4789CC4167D
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:25:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.111564.1669616757650911789
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dStEgyZI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616755; i=@fujitsu.com;
	bh=VD2o898a24kvQhiRSVWnbC9K/CtPfUjhd0Kw6a0HmTg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dStEgyZIhGrQVIgGMr2HuodaXBDyxTKpwJEUAEQhndBKqNdcuI6cOPELW4AZRuDpA
	 VIyCKlOZLS4aW5mZDZnE/UQn2+7Luu3JEUtTC30Hf5uW5Dhli5IDjTuE3DNUHXUTAQ
	 /MqPcRHbI8NA3afl2BTaVZ6WANDNEfxBEQQbFuyhkdYU/nHr0hZrw0V+1Z6UCikHgX
	 Ivfyo7zS8vb2QKazRyUXKyy3XM3GZ3L0Y7FgVp9mNMOT0kgjBPx2ND+54p3EYcZdGt
	 zRcGydPUwpZxsADIAXRplxDTOwPHZ25pTksIESQMp/Y5qaaW/amNq9Ol1vQ5kxU+4t
	 5uZORhZZKEHrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqFsc0pJ
  s8PANp8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHsRi97wVPOis6uRcwNjH2cXYxcHEICTxgl
  eu7cYO5i5ARyrjNJzFsnA5HYwyixYsFtNpAEm4CUxI37/8FsEQF9iaWz94A1MAuoSLz43cMOY
  gsL+Ev8WP6IFcRmEVCVWN91G6yGV8BJYtPPVSwgtoSAgsSUh+/B4pwCzhIzTt1lhVjsJLFtVQ
  srRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmqDkVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGhrqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjl
  pZZsYgQGb0oxw/QdjD+X/dE7xCjJwaQkyvsxsCVZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvX
  JCcYFFqempFWmYOMJJg0hIcPEoivIvtgdK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLn5Q
  gGKhIAKcoozYMbAYvqS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEefmCgKbwZOaVwG16BXQ
  EE9ARmxSbQI4oSURISTUwtXziMHc/ubH159Jpp5XfL4lXDPFy3tIpt/uly7Toqd73zpsHnFiR
  uP5LTKKTW25bUtzahx9uGbS59hda2gnGSaz7HCKrYfD8akMmu5ThZBtrxyc554UC7gW01a+79
  jBvVnTqzcUPV5ZYnmrgKb4lV8mnHXd7TdhXh2dc1UIuU6RX7m2p2fRkbtpss2iTafcic6J3mk
  3brb0jrdV3JffFSyvWXtucduF2NM/rc5wV9dKX5019tG/xN9WYuk96ioeENv/n+vbt2oRTHX/
  33eZdrfP3pynTpSPv3FadvP34lbRb+6SludXv3I7ctCuQfty7QJGVL5jrXUVRbMg9zZS7Mqob
  Kg2m51Y3/pw3Y8fTo0osxRmJhlrMRcWJAKQUc/VlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1669616754!132268!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25343 invoked from network); 28 Nov 2022 06:25:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:25:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C6E0A100197
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BAF00100195
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:25:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pywbemtools: upgrade 1.1.0 -> 1.1.1
Date: Mon, 28 Nov 2022 14:25:21 +0800
Message-ID: <1669616722-13377-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
References: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99819

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pywbemtools_1.1.0.bb => python3-pywbemtools_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.1.0.bb => python3-pywbemtools_1.1.1.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.0.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
index e02485dde..1d449cb0e 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "5428169d9704f98519666cc81a33bfbb813612108979d4c9ce10d6202faf621e"
+SRC_URI[sha256sum] = "aacf4bfffa872bb0e3d0c19ee0630e3c0997d4f13553189b63b297787341735f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


