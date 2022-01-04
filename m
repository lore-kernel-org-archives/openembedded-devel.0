Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013C4C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 03:41:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.2086.1641267714164730903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 19:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RDPN0iZ+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641267712; i=@fujitsu.com;
	bh=1MOPPanio0W7NPFJ0xOyvrxIOYBFkOPfNgUxA4O51hY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RDPN0iZ+AbuRnIkmv2RlsuHNcb0A+czQRXnIlQ3dzyO7TInNKABmPppT2hxRGg96t
	 mdWURRw3/nbitlSumIira2VnQhKhtU+WEuSIjjasCvgcEmauVR/OYhmbGfaHcBzwNQ
	 spLhYL8euNhW7GkEoUg6xKQmJ0wfMVvHqFu3r65/CVZGpgP6ovmXqq/mNc8X9+hifJ
	 51erc+spxDamS/MRRfn+aqmZqjPErlk+cWZ6eEm9nrjGyTvAsLm1g1zLCps+9LFQ5j
	 MD4Rer3kG3LQN1lf6dxD9Wgc/wJcOy/lGWHdj6IQfG2zJ0MAdxD/jwhcNm1puZc1O4
	 BX6g6T1G+O1BQ==
Received: from [100.115.32.243] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 5E/C8-23453-002C3D16;
 Tue, 04 Jan 2022 03:41:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORqPv/4OV
  Eg1/vDC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owJU3sYC17wVJy6/pe1gfEUdxcjF4eQwBNG
  ib6nSxkhnAtMQE47E4Szm1Hi3/EP7F2MnBxsAroS5x6vBbNFBPQlls7ewwxiCws4Shw7tIYFx
  GYRUJGY2d0KVsMr4CFx+OZLsBoJAQWJKQ/fM0PEBSVOznwCVs8sICFx8MULoDgHUI2ixOzp8h
  DlFRKvD1+CalWTuHpuE/MERr5ZSLpnIelewMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19hU19D
  CRC+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzD8UoqVd+xgbFv1U+8QoyQH
  k5Iob4XV5UQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwL9wLlBItS01Mr0jJzgLEAk5bg4FES4
  eU5AJTmLS5IzC3OTIdInWJUlBLnZdsDlBAASWSU5sG1weLvEqOslDAvIwMDgxBPQWpRbmYJqv
  wrRnEORiVh3jMg43ky80rgpr8CWswEtPicHNjikkSElFQDk/xU/ppEkZO7aj3EXmWVa0h8ux+
  3v2bLAgMFladajceXrQr+KCWWvU3WyKjmnkdryv+dCg67bCud3ydy2ay6F3H56Ibn3Cu+FWx1
  lFG78Czybv2ed7Xti/tulHsHne3nOLnYW+KyS7uV8XaFBX/jV4r+zGsKrKmfPlf59saSoLfb2
  L4e7TbQfnCIU+9EjLBdeNe5nF+i3n2bK1RmvEj99fij3I1ZP50kimUOX1m9wH1X82TGKI9LS3
  wKussiVZ8V6d7fkXYjadkqdmOjReeLZSOYD0WuDU1P3pM69f+26uxrdc0HFKzDZh5o7X7BduD
  WLoNrNysvWh30eXRxpk5pXpXbnSPJU9Zw7DgnJCa4VomlOCPRUIu5qDgRAOtK/rE6AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1641267711!325681!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27421 invoked from network); 4 Jan 2022 03:41:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jan 2022 03:41:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 71B5A1001A2
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Jan 2022 03:41:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 657E4100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Jan 2022 03:41:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 03:41:29 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] pugixml: upgrade 1.11.2 -> 1.11.4
Date: Tue, 4 Jan 2022 20:41:20 +0800
Message-ID: <1641300080-14359-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jan 2022 03:41:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94650

Changelog:
=========
This patch reintroduces pugixml target for CMake when find_package is used,
which was accidentally removed from v1.11.
It's recommended that pugixml::pugixml target is used instead, but this patch
restores pugixml target for existing applications / libraries that depend on it.

The previous patch, v1.11.3, did not handle repeated attempts to call
find_package; this patch fixes that particular corner case.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../pugixml/{pugixml_1.11.2.bb => pugixml_1.11.4.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.11.2.bb => pugixml_1.11.4.bb} (85%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.11.2.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.11.4.bb
similarity index 85%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.11.2.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.11.4.bb
index 09abbd9c3..4e4048f5e 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.11.2.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.11.4.bb
@@ -10,8 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=d5ee91fb74cbb64223b3693fd64eb169"
 
 SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "2d0be30b843eb9d1893c1ba9ad334946"
-SRC_URI[sha256sum] = "599eabdf8976aad86ac092a198920d8c127623d1376842bc6d683b12a37fb74f"
+SRC_URI[sha256sum] = "8ddf57b65fb860416979a3f0640c2ad45ddddbbafa82508ef0a0af3ce7061716"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeux/${BPN}/releases"
 
-- 
2.25.1


