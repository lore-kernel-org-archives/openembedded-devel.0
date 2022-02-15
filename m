Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73694C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 08:08:14 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.7103.1644912492594058480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 00:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PigxyXxt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644912490; i=@fujitsu.com;
	bh=YlNTfO7TdrrdyE7m4vvukYk1WVwF5zVNu9q11e5VnpY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PigxyXxtuyAHwqWTlKcCVLNMXb7aGRTQaKnqc7uscTIx2pi2V35b6U4mqnRfECDDI
	 1Y9l2lIB+1tzoNYOTNIbDJfwzWChPne9egA4C2oxejcAIU1ygDM7rW2KPGtcMjLkRQ
	 QrNzHKORXUWBZBI0EO2zgZWVh2EXjAnW5TckK8ZIc6LZ40/Kd6MHoPkroo/0vZov4a
	 FcBhKEggY70PVolQPex9gqyvSMyAZ0wslGs6HL25PRmfppTFvx3LD8FOCjPqBVyb+/
	 dO1BZVKTfIuhdWL9MlxM9WelCkSNQxIQRYFiVek9DstPdirHg45nY1MeOlSwn5jLDu
	 Z30RgZTadSdTw==
Received: from [100.115.70.56] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 29/A6-30582-A6F5B026; Tue, 15 Feb 2022 08:08:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxSTcrnjv
  J4PNKEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP2zQusBZ84K/bcOsrcwPiZo4uRi0NI4Amj
  xI2ri9ggnAtMEuf2XGCBcE4wSsyecJSpi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBT4nGLy+B6jk4WARUJZrPGoCEeQUcJS5sOwhWIiGgIDHl4XtmiLigxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKka7pKLM9IyS3MTMHF1
  DAwNdQ0NTXXMgZWChl1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMzpRi
  t5wdjB/7fuodYpTkYFIS5fXW504S4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7LwooJ1iUmp5ak
  ZaZA4wUmLQEB4+SCG9eLFCat7ggMbc4Mx0idYpRl2Ntw4G9zEIsefl5qVLivOJxQEUCIEUZpX
  lwI2BRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8yyBSezLwSuE2vgI5gAjpCsZEL5Ii
  SRISUVAPTUfGJSgVsVTcnzQp44XxHdHNS/0Sla087b7Y+LQiLkmB8+NUypfla7eP8GxMMlVlV
  3svaMb+4kPO/5G7GUvG519OOvDlc8+Tf3S6l22cZYvxOvt+56HNA9xKeRzkm1p6d023crrj9r
  Dr7h5VfgyN10p6iXNVTYZaKhm1reHYKe81rvlE39bWG7JRuqdYJ0RyHovqUVa8xZvKunLRgzk
  /fkJsdMoeeH1w6KzDpdX70nl6XvT53Qu/c/OLGaMo41+hjbfLHJYFTc5bNNLK9fOJY0ceLHly
  rYn3Yrq1yehv7MUDqR9PE7KVTjV1dXt16cprhUat4YFSutrfVAqUtSZPmOr95HNcw/TZ/eLe8
  +/UvSizFGYmGWsxFxYkAjiO/BlUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-545.messagelabs.com!1644912490!6663!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8959 invoked from network); 15 Feb 2022 08:08:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Feb 2022 08:08:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C1358100446
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 08:08:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 861C9100458
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 08:08:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 08:07:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfsdump: upgrade 3.1.9 -> 3.1.10
Date: Tue, 15 Feb 2022 16:07:48 +0800
Message-ID: <1644912468-5708-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 08:08:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95314

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsdump/{xfsdump_3.1.9.bb => xfsdump_3.1.10.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.9.bb => xfsdump_3.1.10.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
index 3b06730b70..3b80fb5b0c 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
@@ -14,8 +14,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
-SRC_URI[md5sum] = "086f7582875b14c17522867ffe3e202b"
-SRC_URI[sha256sum] = "55aeede6232ddce6c9e79e2af88d6f808534df1552eb2bfaf7fb85b92add6dd1"
+SRC_URI[sha256sum] = "9aab7a53aa05cd46edc97269ebf1456aab2b60ab8c1fffaaf8aa492f0b5f6517"
 
 inherit autotools-brokensep
 
-- 
2.25.1


