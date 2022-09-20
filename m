Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D7AC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:23:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.7385.1663640624569448965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iv1amieE;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640623; i=@fujitsu.com;
	bh=iLgPcr9YdIZ3Usw+iV1gPteiL33F7jGt6iEqG4ypuyE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iv1amieEdQCT60BZZfDVNiv0c1gG2CvaYqflZEcIqoTaAMmvKM1mLg676bo6KwIX0
	 J5sIXJZQY+O4b+2h7bBj3itfWeDPosdjlzDhoSmFgdDvGQG4Iz6YfRSxvMmgfRGSVR
	 koHxv3hf8+cqkVQnEFlPUJ8QR8d2zCH4K+vS3SnlElzehL9SoeSTWA/Hhtg3LCi/L3
	 F/NYPIiDArPsvve0Gzi63P0dqjpuvaSvR5itY5f8G+QE6VbwCq1SBLYnA7woBdwVD0
	 FugGO4s7z3g0v4z+9jhOltnwW/tb43JM2dUUGTYEEpGfSx8h5MlBCDB5DOkqhVHaVD
	 O/TudSmkABZDw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSVdPRTP
  Z4MRWIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePh+icsBes5K6a9f8bUwHiLo4uRi0NI4Amj
  RNfk24wQznUmicaWL+wQzh5GibVrGpi7GDk52ATUJKbfusEKYosI6Essnb0HLM4soCLx4ncPO
  4gtLBAisfbHPTCbRUBVYs3RFWA2r4CTxMLvL1hAbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83Q9VXSDROP8QEYatJXD23iXkCI/8sJO2zkLQvYGRaxWiVVJSZnlGSm5iZo2toYKB
  raGiqa2ypa2Gkl1ilm6iXWqpbnlpcogvklhfrpRYX6xVX5ibnpOjlpZZsYgSGZUqxetAOxm8r
  fuodYpTkYFIS5eWq00gW4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrL6iZLCRYlJqeWpGWmQOME
  Zi0BAePkgjvViWgNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHmdlIGKBECKMkrz4EbA4v
  USo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeTpApPJl5JXCbXgEdwQR0xA0VdZAjShIRUlI
  NTNemmURka77dytNuUSTEyKr2QuJ9y/ssH17HgqYD7nE9s5JZu73mOYRZTEj0/PhueZT0uwpp
  dcsL7DqvOwN3rTqQ9aO9/dTe4EXTv3bPSD5z8C+L7gfOmWzHXE/XbksXOFDgECLdfGGnif3Jd
  reuN0sXT/MNXJuxhONREXvf/Q0PVyYdef57zk4GhpfmL9IeiDGdib85S0x+5dJ5P9yj9gUUfv
  x4Nkpa9nxGYfIadatWdunYX0Ff3XPfLd/LvMs8+V/GPgaN7BvTVRd4Bmp/11bamrrW2+QC59q
  5U1fUHvpgJ1XRc/L5zMwVusEL70i8Dklz2xTR5HN1y3xJ8R9Hpi3e9+hwSfYtiT+TTv8S6lRi
  Kc5INNRiLipOBACTR4PWUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1663640622!319188!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15647 invoked from network); 20 Sep 2022 02:23:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:23:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0AD9B1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:23:42 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F2C2A100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:23:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:23:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cachecontrol: upgrade 0.12.11 ->
 0.12.12
Date: Tue, 20 Sep 2022 10:23:23 +0800
Message-ID: <1663640603-27572-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:23:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98885

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-cachecontrol_0.12.11.bb => python3-cachecontrol_0.12.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.12.11.bb => python3-cachecontrol_0.12.12.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.11.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.12.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.12.11.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.12.12.bb
index fc2b0ae75b..8f7185b8f5 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.11.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.12.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=942a721dac34d073
 # override PYPI_PACKAGE so fetch succeeds.
 PYPI_PACKAGE = "CacheControl"
 
-SRC_URI[sha256sum] = "a5b9fcc986b184db101aa280b42ecdcdfc524892596f606858e0b7a8b4d9e144"
+SRC_URI[sha256sum] = "9c2e5208ea76ebd9921176569743ddf6d7f3bb4188dbf61806f0f8fc48ecad38"
 
 inherit pypi setuptools3
 
-- 
2.25.1


