Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.8451.1619071129911865816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B9HlKPSa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619071118; i=@fujitsu.com;
	bh=eUnbNhZQVVuIVe46bm39uU6WDxzpC8+DVRhVl7SKEl4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=B9HlKPSaBeQdKavomqjW7yNB+ErhO3ZN9EcUj/fvANMFaU6cq794I8ceubY9u+Q4S
	 7Vgs1fqs3u3am4e2Oae/DaROCcu/UjKZdjO4aC0ljasSIppV5/kjgco3D8CH9NKsme
	 SHfD0sosp1hWi6rqf3qva+7+ZzDuvu9sJxoweIvjF6N52bI/Ms2XOCutXp8GbXA7Uy
	 aRONtHO4Yy8Q/nUuaCTz6O7BT+gGN/QNjJuMRae2haUPkXwBAwsxHKRBDwdZb94ouQ
	 xzZYbhxI+ZDf2I7aR+NzEiLNDIVrke0iMXjFxa3xwC9hF2BXJRzHFosiCpAj5AYHHE
	 8enVTZ/bcD4Og==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 60/77-53635-E8011806; Thu, 22 Apr 2021 05:58:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MRotsn0Jh
  g0DiNxeLi4aXMDowe5zauYAxgjGLNzEvKr0hgzbi1dS9rwX6uihv/V7M2MN7j7GLk4hASmM0k
  0TH1JBuEc5xR4s+vbUAOJwebgI5Ex4tuFhBbREBfYunsPcwgtrCAq8Seqa+YQGwWAVWJQzO3M
  YLYvAJuEke294DVSwgoSEx5+J4ZIi4ocXLmE7A4s4CExMEXL5ghahQltu88A1VfKbF92lnGCY
  w8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hJRCbmOglVukm6qWW6panFpfoGuo
  llhfrFVfmJuek6OWllmxiBAZSSsGBCTsY97/+oHeIUZKDSUmUdyFfY4IQX1J+SmVGYnFGfFFp
  TmrxIUYZDg4lCd4jIDnBotT01Iq0zBxgUMOkJTh4lER4f/MCpXmLCxJzizPTIVKnGMM53qxds
  oiZ4y2YbLt3F0i2g8mZCw6uZuaYBSbvtx8Ckg9ApBBLXn5eqpQ4706QbQIg4zJK8+CWwaL2Eq
  OslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3rMgU3gy80rgbnoFdC4T0LnaU2pBzi1JREhJNTD
  Vpf9Uvux4JtaBpe9UH3+s/87ypjl2JknyYrlrP56eX/x3fkrkamsOo6jkyzV5d3dtmjL7cOHn
  8LogkeKm3jmeL2y9NB+fTKvas+DTwbWvPzDMkbSfnfo9TMTU+tE0uXzbQ23Oej1sZy4YLngvV
  rCdrfyAQUxG7uSApsQmUWYZRi+96OzlD6U2Ovbu4urlVpWaF7Ri0fWkaSu7VCftZmxRqN0Wa6
  vKkWOWMNG/pvF9xZrKaY8OZ8z8PH9T98EH21jPt8l+t/vVetL8jNija9lhIRuPGDHse8W24kb
  rju3Ob/6w+jNOSPD73cB/tk7of5nxwSv8l7qrBK238M24+cdDksFWqelHc80TFok5rEosxRmJ
  hlrMRcWJAOOrU7VVAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-265.messagelabs.com!1619071117!271940!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2296 invoked from network); 22 Apr 2021 05:58:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 05:58:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M5wb6g032448
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:58:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 06:58:36 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libwebsockets: upgrade 4.1.6 -> 4.2.0
Date: Fri, 23 Apr 2021 01:58:29 +0800
Message-ID: <1619114309-4929-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{libwebsockets_4.1.6.bb => libwebsockets_4.2.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.1.6.bb => libwebsockets_4.2.0.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
index 6a3eb917f0..89c98fec02 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "736f0739ed8c75db0e29c7678b5a9194e957c347"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.1-stable"
+SRCREV = "1367c11e1ee44d9e19daa50e1d015365bae17354"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1

