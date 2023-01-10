Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4790CC54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 08:38:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.99465.1673339887881936613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 00:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vPVPcuRN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673339886; i=@fujitsu.com;
	bh=+vUTz+nTKiY1Yv66K2j6tJ8hUgAwHsiQIQDn/tFr/dk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vPVPcuRNxoIMrCN3zg2N/SGsS7kPeWRmYiDYaYqjHXaxP0CSo9AtAQ88iB7loaG+C
	 wGgPAOPhqya6P/n6RT4jSPfmPpYbg3j2doY9Mpw5x9kTVZfcKs0BhrW/6MmbZTCl85
	 VL7uA2S7NBTn31jhU/v7FvzO66t/Hib4ScPafCk0y0oNGaNDdBRj7KCCauGcC1EqDa
	 wbOVZ8vrWdptVQKdUtSRz228sUsBgw/VBX0bhNVaLiqECiKFJITeOTobGIKKQdAQwU
	 04uJhQIPGR4Cuy/RSwpK5pqpY1zJl0DHUvob/qXcDKUCvm+XpZjBZ6YWRdqBOBEN2j
	 0D8zMoIoG/mTQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqPtWeW+
  ywearWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anm49YCn6yVzTe+s7YwLiIvYuRi0NI4Amj
  xOrNL5kgnBtMEhd/PYbK7GWU6L58grWLkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFniRcffrGA2CwCqhJNffOYQGxeAUeJN/eOgNkSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCslWqFmSgioSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGtopJdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGI4pxUrNOxj/Lvuj
  d4hRkoNJSZS36NOeZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvCZKe5OFBItS01Mr0jJzgLEBk
  5bg4FES4ZWQA0rzFhck5hZnpkOkTjHqcly9cmUvsxBLXn5eqpQ473GQGQIgRRmleXAjYHF6iV
  FWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb5880BSezLwSuE2vgI5gAjrix9SdIEeUJCKkpBq
  YNvAEiK7cMGV6/+rJCcKTX+y0nKGSe+cuO2vN/ENX1LftyglM0MqYve24qM2Zk4XSlasW/j+9
  xeeD6rffU3+pRMTxGRRnJjVOPNHAt//tm6RKRtH0q+99dfwWz/z2Lv/NJ9EdfOki/puWt/Pue
  y3zSem6msm6sCuXJD7dneO9wknT2efP47Ui+fz7w/d1Clxac+nfqo9/LvBc2d5kOMdRaNqSx9
  OXJm2LE7X74Gd2dmar20LDkHefzy9o7QoOPzzB3bmpUqUuhy/8m2db+jH24Hu/ZbZMtEp6kbm
  x6fOTHh/tcpc1xomTOazy0r6UBkm9Cmm2n/WT933pzPsfnJ/12wo8FPyRpLczfd2tNI6FW5VY
  ijMSDbWYi4oTAVnfsA5OAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1673339885!818080!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9002 invoked from network); 10 Jan 2023 08:38:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 08:38:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 62278100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 08:38:05 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5528D100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 08:38:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 08:38:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] hidapi: upgrade 0.12.0 -> 0.13.0
Date: Tue, 10 Jan 2023 16:37:52 +0800
Message-ID: <1673339872-6406-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 08:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100514

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hidapi/{hidapi_git.bb => hidapi_0.13.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/hidapi/{hidapi_git.bb => hidapi_0.13.0.bb} (88%)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_0.13.0.bb
similarity index 88%
rename from meta-oe/recipes-support/hidapi/hidapi_git.bb
rename to meta-oe/recipes-support/hidapi/hidapi_0.13.0.bb
index 4aa58ec7f9..460eda5276 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.13.0.bb
@@ -12,6 +12,5 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
-PV = "0.12.0"
-SRCREV = "76108294092c023a4ece99eb3219559cea0d5066"
+SRCREV = "c3a6150d8801f79a59034045275176e9738b13e4"
 S = "${WORKDIR}/git"
-- 
2.25.1


