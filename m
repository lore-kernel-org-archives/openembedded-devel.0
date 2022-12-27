Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85388C3DA7D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:47:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.153585.1672123627278838935
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Kq+twmeo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123625; i=@fujitsu.com;
	bh=aZ972YN5scTLhM+gilyoeoXfXBy3hsivym/PIFLU7pY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Kq+twmeo3GO4f1imDpyQxIPYfKzkPPwWB5HF40kj5QWdMUjJFW6eMpOqq4a3eUosh
	 Ec0fyQ6lWM1/LV4Ofy46IT1bzk9qXNN4zQwCRunEJbsOpr6XLx9Oj28V+HfCp4c8Wa
	 AqAmJpoR2xXEKZCU3nrbEethd0/U4Rb8OwFeEsUFqfcfRGDwhYR3JgUUMbmH6aLWHp
	 57Bo/3kCASZ/f1D/RQLvGPgRvbMwqd+hf9SeuPvMErk63wkH4PfSshncTcv/yR9XYV
	 ohFuZr4KiA7wmuZcajoUk/6n9E6H7qi+cvhwH/gBfYXkpPH6yvmotP3cJaVLJHBF34
	 h6I1xT+tiJmPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWffllFX
  JBpNbOSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owPt68zF3RzVvy/LdHAuIaji5GLQ0jgAaPE
  tZ03WCCcy0wSRye2MHUxcgI5exgl9q2qBbHZBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFgiQuHR6BiOIzSKgKrHlzl4gm4ODV8BJommOBEhYQkBBYsrD92CtnALOElf2dzNCrHKS2L
  vqBCuIzSsgKHFy5hMWiPESEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRrDi1qCy1SNfQXC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHBTihUTdjAeWvZH7xCjJAeTkiivVPeqZCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvKWTgHKCRanpqRVpmTnAKIJJS3DwKIlAtPIWFyTmFmemQ6ROMSpKifN+BekTAElklObBtc
  Ei9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV51kPE8mXklcNNfAS1mAlr84dBKkMUliQg
  pqQam7usBVxYmPucQW3dtcshMHs11ol+m75PS2nw4MepgY/60G6u098tFuO2O/yPWcur86093
  XpsrLRScvVTnNf+ENbvlTB4ypW+89yrO7sPF6axvWXvPnVtp8TNWfWHIjBZrw2OTrOYuezv3/
  Ipdjud//r2yzrn6SqlVkPdflsULPweaa9+YU+J49YCgWOrvE9PKTPNUz/lwHRQV89ZLP8iu8z
  j4SfnxRwdSJDiF/X32a0aIPFJ8ry996k/Z1In1s3VWfq3Wv2BYoRV/a1qt+KryaluGhMiX4im
  sr57t67kv3exqo+Gjk3JSdXae5dEWPo6e7abGd3pD2Satn1gwacKryxmiZUJLevPXXq5+InHa
  S4mlOCPRUIu5qDgRAGZf8cBXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1672123625!260245!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7218 invoked from network); 27 Dec 2022 06:47:05 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:47:05 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CF8657B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C351473
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:47:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.12.0 -> 1.12.1
Date: Tue, 27 Dec 2022 14:46:24 +0800
Message-ID: <1672123586-32004-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
References: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100272

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix link errors to OTel spans (#1787) 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.12.0.bb => python3-sentry-sdk_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.12.0.bb => python3-sentry-sdk_1.12.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.1.bb
index 455faf8a5..00b14ed1a 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "dc0fe6ef2f77a3853b399c75c97d87be7666098817c1c314f8fcdf68a6865914"
+SRC_URI[sha256sum] = "5bbe4b72de22f9ac1e67f2a4e6efe8fbd595bb59b7b223443f50fe5802a5551c"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


