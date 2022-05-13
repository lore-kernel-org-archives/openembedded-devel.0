Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C2C4332F
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:33:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.3760.1652409231631737424
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 19:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kfR+/Z4y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652409229; i=@fujitsu.com;
	bh=5dmoFRKwiE6YXJlXi37zWx+FfLFmT4DPG9gGI081Us8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kfR+/Z4yuxJoIi/5OUZOCsoZbrpi6w+RJBTN1LZ7XMBTpm4F+KeIEDiN6hqHhPlNL
	 ORiz5h7WDLv0Kb8h4SiwN+lgPmA8i5y6iMDu39ZdmS4XEF56XKkbXV4NDZPa6EdW37
	 IwCXFjqdsohpkcT7Y8r4rP3iyxs4haGTAP/QMJAKawwD446X4wvjQLQngXpUB9w83H
	 A5scRT4iMTXSxzRvXAHgWe2ouD8MX+0V/+pt+lLCWb4qGOFXvSMwFk0emAnGIEFPxH
	 VW5/7NuEB0FCp2GCB/UtaLlpOuAk3+tUjz4gJQchhut60MYPHtBI2TghmBmpDf1OCe
	 vc6HliP0AyzMg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSbfncG2
  SwfSb2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aco6/YC/ZwVlzb1MrUwPiEo4uRi0NI4Amj
  xObNMxghnAtMEr+6LjFDOCcZJdadeA6U4eRgE1CXeHzzNZgtIqAvsXT2HmYQm1lAVaL74hp2E
  FtYwF/i0PLtTCA2C1B8yqIfYDW8Au4SX5uPgfVKCChITHn4HijOwcEp4CFxfLsdSFgIqGT26o
  WsEOWCEidnPmGBGC8hcfDFC2aIViWJEys+MkHYFRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWibVJSZnlGSm5iZo2toYKBraGiqa2aha2Sil1ilm6iXWqqbnJpXUpQIlNVLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM5ZRiF4kdjDf7fuodYpTkYFIS5X0TX5skxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYK39RBQTrAoNT21Ii0zBxhXMGkJDh4lEd5dB4HSvMUFibnFmekQqVOMilLivB6bgRICII
  mM0jy4NlgsX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsRZDxPZl4J3PRXQIuZgBbHW4E
  tLklESEk1MMVqHs83ezavdWGxzcKaMJeS79MZZQ+8PLXMZsl1C89Nr/7OWdq0Ym7C/XuCBecb
  pn1yPS390f6cVaf9alULn+/sH7tdZsTcXKP6bEv5sqkly/dObQwy/TV/1bIa93uxJe2zp8ndq
  Q1J0H/Ye0xolz+LQ/nMOPPC711L2y8sdbKKnetWsWbDpV8tLC8+ngiJ2uBr/lPnas/RRNn7U3
  /++sLlwiD/KmSXe3fENWmDmjOmWkYhTUdWHlm8M3Bt2859Pvq7Tj9imbU/7nXo9OPCpzuarQ0
  kLkvuzJD8tmtfSPczzvD5H7faTrOrZ7ol9a/RaOtS5q277Y/PdkhWOP5rX8Bvs3OfA2LCws4k
  bf229OByJZbijERDLeai4kQAgxdwy2ADAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-28.tower-532.messagelabs.com!1652409228!31708!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12135 invoked from network); 13 May 2022 02:33:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-28.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 May 2022 02:33:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 40F9B100458
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 340B2100441
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 13 May 2022 03:33:23 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyalsaaudio: upgrade 0.9.0 ->
 0.9.2
Date: Fri, 13 May 2022 10:33:01 +0800
Message-ID: <1652409184-13282-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 May 2022 02:33:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97088

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...thon3-pyalsaaudio_0.9.0.bb => python3-pyalsaaudio_0.9.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyalsaaudio_0.9.0.bb => python3-pyalsaaudio_0.9.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.2.bb
index 862c3d594..e7e706c6c 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.2.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "48c40424a79c2568676a41643d93f1f7"
-SRC_URI[sha256sum] = "3ca069c736c8ad2a3047b5033468d983a2480f94fad4feb0169c056060e01e69"
+SRC_URI[sha256sum] = "e74a66d6c7a6bcceb990df66d3ebc0fe382fc9d765f35f050f9d98c695304b36"
 
 DEPENDS += "alsa-lib"
 
-- 
2.25.1


