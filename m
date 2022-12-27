Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787BBC10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:48:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.152458.1672123694554481696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bkBCnvpb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123692; i=@fujitsu.com;
	bh=conAdhf1Iwttx1YXBPDFLEK3U10tgMalK0yBOm7u8zE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bkBCnvpbi8bFp6FljXLEWh85kORR5XPXp6nXnb+l99n6lgk+xaANmqt5OyHjFGEyS
	 n24y7bH13z+aajXO8tRJ77a2iEaJEK9mVLa2nmfu34smck+b5TfS7hB4Oq7F0FkxDK
	 ltgOROD6qguUCsixyACv7z5ChfsRVLASwVERsaCqA+b/8IYEoXYX3vqInFTON6mXoO
	 Mxb9mt7fcKD8jfryG8HEKsfwyXa+/GJ0ltcXQ8ZU7kDx3MsNdbyM2bkxRVN2pTLLmc
	 a6hqz+7j2zboOiMLBcVudKX1jSwKDDfu+1V1Xy7UdH3ztObB3Pi4QZPALRW7eGw0Hn
	 BAxLZcQ3Aw9uw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpKs1dVW
  ywfGLVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a9x68ZC/5xVOz98Y2tgXE6RxcjF4eQwENG
  ic+rj7BBOJeZJBpXz4Fy9jBKnN3wEsjh5GATkJK4cf8/mC0ioC+xdPYeZhCbWUBF4sXvHnYQW
  1jAXWLzhklgcRYBVYmWc/cZQWxeASeJvjerwXolBBQkpjx8D1bDKeAssbShBcwWAqppObebBa
  JeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jaXFqUVlqka6ZXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJ
  JkZg8KYUsxfsYJy57I/eIUZJDiYlUV6p7lXJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4SycB5
  QSLUtNTK9Iyc4CRBJOW4OBREoFo5S0uSMwtzkyHSJ1iVJQS5/0K0icAksgozYNrg0XvJUZZKW
  FeRgYGBiGegtSi3MwSVPlXjOIcjErCvOog43ky80rgpr8CWswEtPjDoZUgi0sSEVJSDUyzcux
  kZiyvs31ctuTK0oCbu+XXP5j3bapAa8jMV9cYyrJ2/GEXNJvutOyi9YbEZbJ+xY8sxYxPrZL8
  8zj35YaK30ZfOm/X3fW/MPVbehFLyWGVtTmfZM79ea+cMvPrapvsE0XfMz8tKT3u2VE/17/lT
  ECEhIZo2H9+vsYZe/SlnNb/2V63tlUtJDsp+qbEgYMvDquLqqefyHoR+7ZO33XdVdH84y1vbI
  9PXX/K8GnLca8scz6d4M9RPgK7uZ7ZRr851ynXfevy5/z/V7pur+g2v+2umnlUPvZRYv7ujG8
  /Mqf18dZs7HzefaboTHJu8N2Y20nvouMi7a01Dt4rZl+ukFY+o2M+w8P3lrYCf6uVWIozEg21
  mIuKEwGHwkUSWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1672123690!715225!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3343 invoked from network); 27 Dec 2022 06:48:10 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:48:10 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 907051AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 856437B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:48:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.5.3 -> 5.5.4
Date: Tue, 27 Dec 2022 14:47:30 +0800
Message-ID: <1672123650-32043-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123650-32043-1-git-send-email-wangmy@fujitsu.com>
References: <1672123650-32043-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100278

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.5.3.bb => wolfssl_5.5.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.3.bb => wolfssl_5.5.4.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.3.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.4.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.3.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.4.bb
index cef2b1662..9ac859f30 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.3.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.4.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "a7635da9e64a43028d2f8f14bce75e4bed39f162"
+SRCREV = "4fbd4fd36a21efd9d1a7e17aba390e91c78693b1"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


