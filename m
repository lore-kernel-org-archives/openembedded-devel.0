Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47ABDC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 12:05:30 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.19119.1646049928297672560
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 04:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tp+jcI20;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646049926; i=@fujitsu.com;
	bh=iLJg+jxReqhs0tbfBa/1lG6Z9WCIvzgsFy2oX1nz7BI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tp+jcI20J/VUWlJbWUf+Tl68jAF3Xv0wRMHTqKK2Klu/mr+6VujvuQGIp1Jkqdvoq
	 GXKsN5+2GAoBB7sO6M43v9MGptm0Ft6DwH+zFHE96XwTKbu7vVQxzT39cNDreMdF2U
	 tsA0SeVcHlXuejr8WQrSjGYnRllQI0BoKYvTNwSlbdSL2GvYHUZ6nGUIh+4R6ACFeI
	 RaHC3HX5WWGUdAWwS7SkLIqSqbDctDXCyY77upbOkLK48WT6kvfSj0a2HxKOF5eMxo
	 jzkCPU291emftViCs4SOvUAj2D3e/mT3ehQ1m29+3HOq1CQXRW54K6jpXCRuk3iAEF
	 EcCqARS+1ejBA==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 48/40-12292-68ABC126;
 Mon, 28 Feb 2022 12:05:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSbdll0y
  SwYsNnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ahlTeZC9p4K75cm8zSwPieu4uRi0NI4Amj
  xL15y9khnAtMEt++vGTrYuQEck4wShy8ZwxiswmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQItH65CgLiM0ioCrRfr4NrJ5XwEnicMdVsLiEgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm6HqKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SirKTM8oyU3MzNE1NDD
  QNTQ01TXTNTI00Eus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzKlGK2SzsY
  5/b91DvEKMnBpCTKy9klmSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgldtvUySkGBRanpqRVpmD
  jBCYNISHDxKIrxNPUBp3uKCxNzizHSI1ClGRSlxXqedQAkBkERGaR5cGywqLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5p0KMoUnM68EbvoroMVMQIv/BkuBLC5JREhJNTAFyrZInrfYtOb
  aOvUDf/7sPH+DZ/W7nqgoptKcaae9For8f/jFpTn4XJza7Q0BsSsW3NJK+Vc56eX3Rw8l3H5E
  yH97b5mpf2iaqNRzMx25VO4io9rKFuY935S//ZwiyfrlsMPkcom3/x1SmxUXzNgyrUb13rJCV
  n5rpQtz115zTHmgfitG9un+R7EaO/+vsFipvM5ghY53S2q3hG/AISb5JX/3tbKtWvsyYbFGg8
  KhY2Yxj85P2FU7SyG4M9xKaVNwK+ezCVkFbo/f2i6QY6ycZS8QK3jqPNeT1fujAxdveBOjMHc
  ty7QLkxm2TORp+2xqO7Hzb8qvSTGPK0PtU4Oj9az2sUuvEYrcfTHv+5YTSizFGYmGWsxFxYkA
  4tjlsEUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1646049923!20098!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22126 invoked from network); 28 Feb 2022 12:05:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 12:05:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9F006100047
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 12:05:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 90C7B10033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 12:05:23 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 12:05:05 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.2.3 ->
 1.3.1
Date: Mon, 28 Feb 2022 20:04:54 +0800
Message-ID: <1646049896-35695-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 12:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95567

License-Update: year updated to 2022.

ChangeLog
============
- Fix 10 year old bug and improve dispatcher handling for run_forever (#795)
- Fix run_forever to never return None, only return True or False, and add two
  tests (#788)
- Remove Python 3.6 support, EOL in Dec 2021

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cket-client_1.2.3.bb => python3-websocket-client_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.2.3.bb => python3-websocket-client_1.3.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.2.3.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.3.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.3.1.bb
index f85657a221..166dd0355c 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.3.1.bb
@@ -5,9 +5,9 @@ This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e401d789b93b47e65e852f16f2907aab"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "1315816c0acc508997eb3ae03b9d3ff619c9d12d544c9a9b553704b1cc4f6af5"
+SRC_URI[sha256sum] = "6278a75065395418283f887de7c3beafb3aa68dada5cacbe4b214e8d26da499b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


