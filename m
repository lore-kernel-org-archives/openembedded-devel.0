Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB1CC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:45:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.25448.1646653517045293270
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SUDSQ7Jw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653515; i=@fujitsu.com;
	bh=JorpF7V0Wc6DjUuqKQ9CjzFO8fZR5YcBTsvuizks7fA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SUDSQ7JwPAIw5UmxBd6IV0WL0JZn/wI6QVqfb96kttFU+PgaqPe/BOgdqY9wQJXNT
	 44c6evosz55MSDuhQNlim09GpCeZo47xVKroTxQTOGqU0ysrPEI7j57mUG+iPhu2YI
	 QKbZ2YeB+nOkDYBJToCucpbIp8U07KAMWo9kkBtC4OSr2sR6rYYUbikhFuBOLKLQoz
	 6wIYyRn8BH1Yb5fpkAY497VGdHI/uRWTRb6hZ+w5cZW7FlsD0d7ipueXcJ3TJdFZDa
	 0D42YdsntL7tLttnX3c/RcVfMOxb6+UhCJuDZQwGptSH+YX1dwFwz2UT2mppvs8Zb2
	 S3jCHvJhuchxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSdfrg2q
  SwYNOY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePCjDdMBRc5K+YcmMDawPieo4uRi0NI4Amj
  xON3r5ghnAtMEpPfPYVyjjNKPD16F8jh5GATUJOYfusGK4gtIqAvsXT2HrA4s4CKxIvfPewgt
  rCAn8TmhbuB4hwcLEDx5ytKQExeASeJG4s4QSokBBQkpjx8D9bJKeAs0bf8HthEIaCSp+ubwW
  xeAUGJkzOfsEBMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjHZJRZnpGSW5iZk5uoYGBrqGhqa6Zma6hpaGeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3i
  ytzknBS9vNSSTYzAUE4pdtq/g/Fp30+9Q4ySHExKorwpC1SThPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwfnoDlBMsSk1PrUjLzAHGFUxagoNHSYT3+CWgNG9xQWJucWY6ROoUo6KUOO+1d0AJAZ
  BERmkeXBssli8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubdDDKFJzOvBG76K6DFTECLq2y
  VQBaXJCKkpBqYbHqCmy5r/rsh/X7iDcdan7vOz9mEHdv//ZBeW3pefwfjS19xl5+JbSqfVST/
  cffVFYsu3PIq+9aRxCfOG9ZM/+0o8oTP2rnoXk0VJ9++487LgnsmTlg+zyW+Jbnlh7M+09TYz
  P2nZ1xZxGezP/GDfNyJzxmdSkUtD2SdHP87rDe5veYOB+Pr3+4ZkTu0DB/KesWu534bqjJ9Z6
  x6T1lc7vNbbCt/PH2VN1nh7GQGoctZ5Y07p75590fbXtJPJKFv0Y95jTu+eRgveqizqyy6ecK
  vLVb8k25deuD/7GDj05P+qqFBC3oSeI9NNGpqkXy+uS0/794evlL+/2LmKkkaUQ45wUs+sTlu
  zYiX+DVdiaU4I9FQi7moOBEAgqXWhmADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-528.messagelabs.com!1646653514!15363!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14437 invoked from network); 7 Mar 2022 11:45:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-24.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:45:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5C5F3100441
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4B02D100354
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:45:05 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-httplib2: upgrade 0.20.2- > 0.20.4
Date: Mon, 7 Mar 2022 19:44:47 +0800
Message-ID: <1646653487-55825-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653487-55825-1-git-send-email-wangmy@fujitsu.com>
References: <1646653487-55825-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:45:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95833

Changelog:
=========
  proxy: support proxy urls with ipv6 address
  https://github.com/httplib2/httplib2/pull/217

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httplib2_0.20.2.bb => python3-httplib2_0.20.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.20.2.bb => python3-httplib2_0.20.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.20.2.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.20.2.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
index bda1d1f0b..6d22286ca 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "e404681d2fbcec7506bcb52c503f2b021e95bee0ef7d01e5c221468a2406d8dc"
+SRC_URI[sha256sum] = "58a98e45b4b1a48273073f905d2961666ecf0fbac4250ea5b47aef259eb5c585"
 
 inherit pypi setuptools3
 
-- 
2.25.1


