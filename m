Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFCAC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 04:35:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.2393.1655181338114965392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 21:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B9geWuaW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655181336; i=@fujitsu.com;
	bh=QFqjQ+6OWFvavQwwzoUhSo3hH2VmVN91aB/uHiukq8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B9geWuaW1AiTM+8o+wgj8+Cd/sCj/uGkqrvxUxohVFuVnV5PlZoLtcDZq/SffZZsE
	 g3ZR2efBowFmLW99Hshi7R+DnZ9cqTMBdBSC+6L6NHtULMt0cQZl+APqraA7bnxYpX
	 16x+5EZEUc6PIlgWl48aL5ncGBIJFJy+/iCuuE0L2ObVEc8K/4LGszxmrXGWMEZHmc
	 Gpq0x7nRLTOCtBqFLcnbXlsGrzPMG8C4EH+202Bm6R5NVzh+doxlXgQwkb5eqa10mI
	 grS628jfi4yxFgeGodLNciLR0Lmiuxm36/ipKwGul/7SNUxy+cuplXkzHRcFQFt+2+
	 lguMqr5Rxc7Qg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqCsusCL
  J4OkxY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNN/wn2gh3iFScvfGBqYJws2sXIxSEk8IRR
  4tb2hYwQzgUmifb9c5khnD2MEoumr2DvYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQF3iZ6eqUBxDg4WAVWJZ6tKQcK8Ak4SD1buBSuREFCQmPLwPVgrp4CzxLINJ5lAbCGgmq
  4ft9gh6gUlTs58wgIxXkLi4IsXzBC9ihKzLzezQNgVEjNmbGODsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrRJKspMzyjJTczM0TU0MNA1NDTVtTTTNTI00Eus0k3USy3VzcsvKsnQNdRLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM5JTihEs7GNft+6V3iFGSg0lJlPfS7uVJQnxJ+SmVGYnFGfFFpTmpx
  YcYZTg4lCR4WzhXJAkJFqWmp1akZeYAowomLcHBoyTCu/gfUCtvcUFibnFmOkTqFKMlx9TZ//
  YzcywHkzO/th1gFmLJy89LlRLnVecHmicA0pBRmgc3Dhb5lxhlpYR5GRkYGIR4ClKLcjNLUOV
  fMYpzMCoJ837nA5rCk5lXArf1FdBBTEAHbTy5BOSgkkSElFQD05TFodOMJr6e/OzYLw2r/N1P
  zHTPXHrlPO2aasyuVH4JmSexqQc+VAsy2v4/+EVOhMFo6tRnwjJfxUtOZE3Z48LKm7tdWVoq8
  iCX94kDU4TDCq/Ixr6Z9vBNeaFO2od+pZ6P53ZbNuc1T9g869/v89sT9z9RmfqgO/rJZNE7Xx
  8fU5STtjC60ytwqT2tbtXObVO69sgn8Bsob7M7dqi3qMtEVk1R7MwZrU/u6jLzEoQuFXVzx0k
  tvm3eqqhVceP4TT2xnZ/vvV1ok/Q4tKj4n1L57NYLb0stQiZ+0ryufD9YiPkD56H42cx223yN
  z52cWF+786mno4XltW3nq+YsYPl7ha/wwg/9U3qfopIZzymxFGckGmoxFxUnAgA9LiW4dwMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1655181335!82925!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3117 invoked from network); 14 Jun 2022 04:35:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jun 2022 04:35:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E00EF10004E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B665C10018C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 14 Jun 2022 05:35:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] snort: upgrade 2.9.19 -> 2.9.20
Date: Tue, 14 Jun 2022 12:35:07 +0800
Message-ID: <1655181307-30868-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
References: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 04:35:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97500

Changelog:
==========
* src/dynamic-preprocessors/appid/service_plugins/service_ssl.c :
  Fixed a scenario where SSL traffic was not detected correctly.

* src/dynamic-preprocessors/smtp/snort_smtp.c :
  Fixed a possible memory corruption.

* src/dynamic-preprocessors/imap/imap_util.c
  src/dynamic-preprocessors/pop/pop_util.c
  src/dynamic-preprocessors/smtp/smtp_util.c
  src/preprocessors/spp_httpinspect.c :
  Fixed malformed packet debug engine output.

* src/preprocessors/Stream6/snort_stream_tcp.c :
  Fixed security zones info in intrusion events.

* src/dynamic-preprocessors/appid/fw_appid.c :
  Fixed URL lookup failure.

* src/preprocessors/HttpInspect/server/hi_server.c :
  Fixed a possible memory leak.

* src/dynamic-preprocessors/appid/detector_plugins/detector_dns.c
  src/dynamic-preprocessors/appid/fw_appid.c
  src/dynamic-preprocessors/appid/fw_appid.h
  src/dynamic-preprocessors/appid/detector_plugins/service_plugins/service_api.h :
  Added support for dns root queries and underflow.

* src/dynamic-preprocessors/smtp/snort_smtp.c
  src/Makefile.am
  src/dynamic-examples/Makefile.am
  src/dynamic-plugins/sf_dynamic_plugins.c
  src/dynamic-plugins/sf_dynamic_preprocessor.h
  src/dynamic-preprocessors/Makefile.am
  src/dynamic-preprocessors/smtp/snort_smtp.h
  src/dynamic-preprocessors/smtp/spp_smtp.c
  src/smtp_api.h :
  Added support to get extra data from SMTP and HTTP into IPS event.

* src/dynamic-preprocessors/appid/detector_plugins/detector_imap.c
  src/dynamic-preprocessors/appid/detector_plugins/detector_pop3.c :
  Added support for login success and failure eventing for IMAP and POP3.

* src/dynamic-preprocessors/appid/hi_server.c :
  Added support to handle empty string for SNI/CN/SAN/ORG.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../snort/{snort_2.9.19.bb => snort_2.9.20.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.19.bb => snort_2.9.20.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
index 26b335dbd..c15c20443 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-SRC_URI[sha256sum] = "b12fc6db72afb58987a2bf1954b8f45bde02047c235513c7663857b9506369c7"
+SRC_URI[sha256sum] = "29400e13f53b1831e0b8b10ec1224a1cbaa6dc1533a5322a20dd80bb84b4981c"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


