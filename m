Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F591C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:19:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.111481.1669616364555081538
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BK42J1fN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616362; i=@fujitsu.com;
	bh=avxUtqt6wOy8cdmmBAxgFk64bVkF2FbY7F1SwaK1QBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BK42J1fNZE4wgKH72rm9+Q29Vaqzd4qxjkYHqqAO/nJkgIZoGSvUzl2nl8znazBI7
	 FKgPsmVVbwT+gdxz7eDthyv3bIMTYeKNda9M1j2Va8WrIorcrSd8iAxSojypYc5UaF
	 xkCaRSh11Trczb9Tj9Eu9cr1F7Zy15izAy0aDD04hYIB1cqd+F6MCSVAXiIKPwxMZG
	 CG950Ogay8MSijggJDqlRIw3Fpkn6z0Db1mumraXhSLelHZfera9fcqVchoyB0pYJ2
	 TB74kNQHTV35d2C54MnlK89dKt4JXCVpnqFhbVktZMCJweWY4Vd49lDbfk/o34/tjA
	 WcEaF2YSK9YZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpPsqqCX
  Z4NdBbouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePwlr1sBee4Kybv3cXWwLiPq4uRi0NI4CGj
  xI3ly1kgnMtMErtm3mTtYuQEcvYwSqw/kgBiswlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJbFp6gywOIuAqsTtY7+ZQGxeASeJK8vugtVICChITHn4HqyGU8BZYs3V8ywQu5wk3l
  3bwgJRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bQ4tagstUjXRC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHRTitl8djD+W/pH7xCjJAeTkijvx8CWZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  HNBcoJFqempFWmZOcA4gklLcPAoifAutgdK8xYXJOYWZ6ZDpE4xKkqJ84aA9AmAJDJK8+DaYL
  F7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw72WQKTyZeSVw018BLWYCWrxJsQlkcUkiQkq
  qgSn6mK6TwPxzu5ocU3wm3toQ5ZjG8Elq9xIm2bO/jWZc31D52r/pGnfzX6W3vJNvL+FeU32g
  NmT+yVkFyqv+plrkhMzyX+/TOffQvISPvhX7xEMOSUXtWfvur8zRX4uTAt/ypKWXraxxN5XtP
  3x23/zD9k2PwvaemqM4K9TVcWXcLxkb6yM1AlaXd08K6hGS+RC//h33Ky9mx921E16UM/5WF3
  3nKniDeePHvVHataGqx47J/9q7RY6ljGmHR1GmyFwuz7Ktof6xudziz17fcp7V8PXM5QUNy6p
  9BMx7DNXF7seXXetY7Vj6f0um+/zPWd/sDhYuFdwo1fzgigifnbyGkM8kJUldvWP/rh8QSFFi
  Kc5INNRiLipOBADGW+JDWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1669616361!201027!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1228 invoked from network); 28 Nov 2022 06:19:22 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:19:22 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CD0F61AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C25E67B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:19:20 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jedi: upgrade 0.18.1 -> 0.18.2
Date: Mon, 28 Nov 2022 14:18:49 +0800
Message-ID: <1669616331-13256-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
References: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99808

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Added dataclass-equivalent for attrs.define
 Find fixtures from Pytest entrypoints; Examples of pytest plugins installed like this are pytest-django, pytest-sugar and Faker.
 Fixed Project.search, when a venv was involved, which is why for example :Pyimport django.db did not work in some cases in jedi-vim.
 And many smaller bugfixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jedi_0.18.1.bb => python3-jedi_0.18.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.18.1.bb => python3-jedi_0.18.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.18.1.bb b/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-jedi_0.18.1.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
index fb582c54b..41063d2ad 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 PYPI_PACKAGE = "jedi"
 
-SRC_URI[sha256sum] = "74137626a64a99c8eb6ae5832d99b3bdd7d29a3850fe2aa80a4126b2a7d949ab"
+SRC_URI[sha256sum] = "bae794c30d07f6d910d32a7048af09b5a39ed740918da923c6b780790ebac612"
 
 RDEPENDS:${PN} = " \
 	${PYTHON_PN}-parso \
-- 
2.25.1


