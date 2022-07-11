Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779E3C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:45:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.26312.1657529117664478698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lf0HkYkG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529115; i=@fujitsu.com;
	bh=7KQEQRLlcz/DaLChTpfukdr32OT2HXp0hCHH36nqRg8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lf0HkYkGpDgh2wzTsBQeJWkAOh93zgXmnHGcdlmyf01IwsgZaSHmPpfg4voxxx1Hv
	 YwQi1QRN6LGjPTFJryaCw6j2gUwDVrNa85fnuuU/qfVGdNxkB1Dko9RJGpMEJ7eW16
	 waZ/q1Ff4/gha2RR5uelsevK0uKFME5wHodXMHuti6JoF2tuqN17y/mjiwNHr8AL8P
	 8lX6GX6hhNoLBNgcOScjSOowffDdxOO8M6qqe9exmYc852au+8NlRs44a84PWX7n5T
	 HIXqpv8v/nmKdIUxpItMcipdy23BKY4m5epaGFLPWFhDGI1Ew6Ij8qaGVD3iHEstpm
	 nbhMbuaU0FSbA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqCv2+HS
  Swf9dohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bFr8+ZC1ZzVdy4JNLAuIWzi5GLQ0jgCaPE
  lKY/jBDOdSaJEzvmQjl7GCX+TX7H3sXIycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z1AN
  RwcwgIeEvdW54GEWQRUJWbvuA3WyivgJPG9/RwjiC0hoCAx5eF7ZpByTgFniYUvwKYIAZW0P2
  xhgigXlDg58wkLxHQJiYMvIGokBBQlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVomVSUmZ5RkpuYmaNraGCga2hoqmusa2Gml1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmb
  nJOil5dasokRGL4pxcxhOxj/9P7UO8QoycGkJMorfPJ0khBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJXpmHQDnBotT01Iq0zBxgLMGkJTh4lER4r54ASvMWFyTmFmemQ6ROMepyfDh0ZS+zEEtefl
  6qlDjvGZAZAiBFGaV5cCNgcX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvyCOgKTyZeSV
  wm14BHcEEdERcygmQI0oSEVJSDUwJFbtfy9za8SvQa0+mmoKmw1vrWvYtLDMibjcddNYvOaJX
  Lu/pWrxnw57q5qXxoicYim9rcUWu19nUNnv3Oju7c0H7dqZoHLYKLG/YaR32UO+npqb31Yi/1
  7ZfNZCprrofkhjkLPyZJ32Op+nHSTkcYX/fNAS8Ll1y00z+7euj23rPcb/lPH9SZ9NrD2W78L
  BdjXukX+tVT7B5XanBbmTxv27Teb3lC9/EGG06Yc3KbnfzevP8TWv2mrGs2RGuHdm3QzX36+M
  77yWKLx7+fuVTSJpqWfb0b5M664Ia1n0T0/uUOtGVT3FGbLOW5Kpdrr2FDip/5k6u9pwQu+PN
  Y/PN9m7lxWyigpO2PgjcfUCJpTgj0VCLuag4EQAHfPpZZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1657529110!7083!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29259 invoked from network); 11 Jul 2022 08:45:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:45:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F3D10100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E7F65100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:45:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 42.1 -> 42.2
Date: Mon, 11 Jul 2022 16:44:42 +0800
Message-ID: <1657529083-24142-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657529083-24142-1-git-send-email-wangmy@fujitsu.com>
References: <1657529083-24142-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97805

This version fixes duplicate devices appearing when bluetoothd restarts, as well
as the discovery not being updated correctly in that same situation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_42.1.bb => gnome-bluetooth_42.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.1.bb => gnome-bluetooth_42.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
index 3cc675ce4..c916aca00 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "d9fe5d673f27a40a86a9e23d93cb99367e7b06df51872e8ac5ecc9938e55b5eb"
+SRC_URI[archive.sha256sum] = "8ce8ecfab28272db1830a63f08f9ccb5304734d1be2dbfce795fe4029e629f0c"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.25.1


