Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26568C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:41:51 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.49046.1681717308234796190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uMi3lpn2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717306; i=@fujitsu.com;
	bh=JI6SDY30JW6XTLGt/1cV6yPtgezkWh9TnmXxUxhUxt4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uMi3lpn2Y+Ujbavfz+tWLOioWRq5DA/Pn0gnNifAdFa1I3Oh3cPryK6Rt9Lv2VL/a
	 uMhX6SCLa7O5EYpPOy4zBFCwf9K5X9NjgvR0FhZFxaXW2llNVTzggF19d/7rAkyUrV
	 wBHT6mlBJtK1AR2AtC00AwWj4QfaLZBg3HH4w/U3QYubF+myZnB29Gf8gnUUqnq1eg
	 vSVhkTvp1Nwc/BGWatsxuNvSGim4C0CGyQMQytpWrN/9ehujnj9IyDNoCeVVVP1yqD
	 b3ppBzaruvvsSyRyUYFtIG/8TS+Bz989OrIvyW8rASKWKJvkVrQX4+PX/X9dYkxsHZ
	 iAoSi9gjviMLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqGv5wyb
  FoPuRhcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtGz+wJbwUvOihXLLjI3MP7n6GLk4hASeMIo
  8f/XelYI5waTxPme3UwQzl5GiXsLN7F3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsECgxL8Ld8FsFgFViZkre8DqeQWcJP4cWsUIYksIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25mQXCrpRo/fALylaTuHpuE/MERv5ZSNpnIWlfwMi0itG0OLWoLLVI11gvqSgzPaM
  kNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAYU4qZ+3Ywfu39q3eI
  UZKDSUmU90WqdYoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7z32xShASLUtNTK9Iyc4CRAZOW4
  OBREuE1fgaU5i0uSMwtzkyHSJ1iVJQS5/X/DpQQAElklObBtcGi8RKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYd43INt5MvNK4Ka/AlrMBLRYTglscUkiQkqqgYnxoNvx5Zs8/mVO3hB3bGu
  KQtU1CSVT7li22Y8v81+MuTNNJuRB8rE9L46lhsa2rGCu8TKv0r14e/F/8xmx9fF7842SPf75
  m03Pbby99HzG1o9OVhf0Xc5rSmifDFwp8ueiWtA3qe8iPx2q+S9WG/sxFmpFKzDE2ETppn5Re
  dp04bjB9PJFlQ4bg6r+n3tzX+P9csU7k/1elt/432i033Kq/YVJyhqq/LePVql/0iupiQt88/
  7HUq3/Joq3kifdvhT771/P1zrVrTcrfp0pOCmi5njFiWu++g7G7oXfLK7ckLhmLitfrXFpk/+
  r6s6l3uobq7c17W1Z0av3famYwz0fhl9+VTkK90UeXeNjY1ViKc5INNRiLipOBABHK41WQQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1681717305!149229!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8628 invoked from network); 17 Apr 2023 07:41:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:41:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8B0B21001A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:45 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7E788100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:45 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:41:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.17.2 -> 2.17.3
Date: Mon, 17 Apr 2023 15:41:28 +0800
Message-ID: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102112

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
=========
    Add useEmailAzp claim for id token iam flow

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.17.2.bb => python3-google-auth_2.17.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.17.2.bb => python3-google-auth_2.17.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
index 42f84087a..a767710ea 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "295c80ebb95eac74003c07a696cf3ef6b414e9230ae8894f3843f8215fd2aa56"
+SRC_URI[sha256sum] = "ce311e2bc58b130fddf316df57c9b3943c2a7b4f6ec31de9663a9333e4064efc"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


