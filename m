Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2EAC43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 09:00:45 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.3637.1655110843907031198
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 02:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wA9NOtZi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110842; i=@fujitsu.com;
	bh=YeGGbOM2NEcP9QmfeRfCPI4L7d7diSftPGVTA/KMCnU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wA9NOtZiXx0heZGcSzqHihK44t6Xo87ogcJSXXu+mwS0fTfvoV0BGOLDWd/cT/blh
	 V6p75vpMnDdakoIXOPX8SbEn92da7CTxiNcbWfq7DC442MiRslv2dOlr5JVc34LQX6
	 tUSa9xLuFDyk39s3MgDmmvV9yEMATxZMPbFD7C/DDLwHnMfkjJ7xdfSfz6vet1k54z
	 kBIJj/sKYk5E7R1Cw4ms3ThFU2m/x38nKqL/UAV1SVmRjxcJNcyUNV4wNdKhbi0Dge
	 e4xcF+cNTD5pqQiHvycxVWU5vkCLlaK063L9s0ndkiY5ypRgK9iBDsG9s0IgE55/de
	 hd86V5CC0cWtg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWXfnn2V
  JBgcWaVlcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkt80oKHnJWzN6o3sD4laOLkYtDSOAho8Si
  fc/YIZyzTBKnJ6xhhHD2MEpc6nwMlOHkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHrAaY
  QFbiSPzbjKB2CwCqhIrO/czgti8Ak4SL97dZQGxJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eME
  PUKErMvtwMVV8hMWPGNjYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUMDA11
  DQ1NdQ10jA2O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAkEwpZjy9g3FT
  30+9Q4ySHExKorx7vyxLEuJLyk+pzEgszogvKs1JLT7EKMPBoSTB6/ALKCdYlJqeWpGWmQOMD
  5i0BAePkgivHTBGhHiLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc677jdQkQBIUUZpHtwIWK
  xeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMexVkCk9mXgncpldARzABHbHx5BKQI0oSEVJ
  SDUz6pjOdt+W8f/Pj2LniBA61urzlr5iuxli//n9dIPHOnYzMnF2V304Vr92WtCflVWP15E1m
  PZnxv2XOLlgRs2Hb6e6Nbrsd+Znv/yvlTo0/s/DZjuWZq7eHT+6YcXmJ43tzhcL/5g7ddvUZk
  +ZvmsjV63pT92vHi95NNf533h1Zv6fKRHdn3JWn30Ui7BQ5b+/4yhbwIevr/WP35uRs7y2Pvr
  WW71ar3YL5MlMuHpqyNELz1qktPQZewSr++1c7lBStbPG0CF1QVpO7gi0nbM71M0dKrkdtmzc
  7bGdYb9Ot90zqIYeuntX7cHWjHLPNXGWGuWG/FT9uWPRW6EiZq5J35dGjNQdsfm3t/dJ957eO
  ixJLcUaioRZzUXEiAKjL4dxQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1655110841!183482!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27613 invoked from network); 13 Jun 2022 09:00:41 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 09:00:41 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0DC4B159
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:00:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D4FE714C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:00:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 10:00:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] irssi: upgrade 1.2.3 -> 1.4.1
Date: Mon, 13 Jun 2022 17:00:16 +0800
Message-ID: <1655110819-25250-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 09:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97485

Changelog:
https://github.com/irssi/irssi/releases/tag/1.4.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../irssi/{irssi_1.2.3.bb => irssi_1.4.1.bb}                   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.2.3.bb => irssi_1.4.1.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.2.3.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.4.1.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.2.3.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.4.1.bb
index b0fde5ed1..40ce935ad 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.2.3.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.4.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "381d3af259ad15d658be50c0a01f0c28"
-SRC_URI[sha256sum] = "a647bfefed14d2221fa77b6edac594934dc672c4a560417b1abcbbc6b88d769f"
+SRC_URI[sha256sum] = "6a7692741bba16f3ba6f97cf7246421ac57055dcedcca9a4d21663f8efe47501"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1


