Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3274EC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:34:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.22613.1647419664090027101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Kn0dZ6sQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419662; i=@fujitsu.com;
	bh=Z2Vce12Lqf0HgeYaA/MaFL4koROT1Ioick8clrMq94g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Kn0dZ6sQu8YfkUB5SCT+cqNPABI9YBggxXeZlqYotWGKom9DpAh0HblrM40s3p3dY
	 J/cvmIeSb0BHNxO5azumkUY52GQaVcjT/dJluu2VHqZdbXIL1t9/iZ+5I5T4ZmUCxM
	 hIaxSK0yKjCRtMA7YgQ5Bzp9krTrsaXDqWK3BQwCckE1p8iZaVevzpJ45OR3lK1x5P
	 k4jgTfBKetZHYvh61iRGsFu+45kE09TUX9h23LuyOnCIbA+LseKUMPRz+YAl9MWVtz
	 uLcnnTCvGe6V4Eag+uhJun5gLYlV1aQxsZEZAcw3OdcusMVnfQfqaMj3yNmqQMUbCb
	 iFXxV3qODbsLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqMu30DD
  J4KeixcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCasav3LHvBOa6Khbs8GxgPcHYxcnEICTxhlNh0
  bDFbFyMnkHOBSeLIWjOIxAlGiTW3JrGDJNgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxuwesR
  ljAXqK5awpYDYuAqsTis1/AhvIKOElMOHAULC4hoCAx5eF7sF5OAWeJLXfaGSEWO0l0d+6Eqh
  eUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGRaxWi
  VVJSZnlGSm5iZo2toYKBraGiqa6BrZGiql1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGMApxQzXdzBO7Pupd4hRkoNJSZT3/EzDJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  LvnAOUEi1LTUyvSMnOA0QSTluDgURLhdZ0HlOYtLkjMLc5Mh0idYlSUEudlAOkTAElklObBtc
  Ei+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6bGUBTeDLzSuCmvwJazAS0eJ60HsjikkS
  ElFQDU0hgmuuSrqUPHp2Nny/bqTRRQq7C/cHWB/0SV/vVORq3h3Rle0TOE+Yp19RLT5+mZfqR
  Y6vukWz9pNPhnD83R661jc3iqgxYb/v9cVfaneB9tlZx4nPvfGd3ZbpUGDPj50HX5MLu/ftWJ
  P0Q3Plu/4UrX1mFmp/fkDWT6Ni7bbNMx2KPtQd/1utvLTSRarsxSy0qIeburiKZ0sk7dGfJ3d
  ykaPRWoPf5HAaGByI3dRpLpRM+WH1dZFXA9XZer0riwaK9VbveMx31sPYsFv+52mTmxlO75PK
  Y/q302HpdWba8vq6EUYL93fcuPUafa302h6LDmwr9nt0zcUk322DT/D7J8rHmiw28tnJOm/SU
  WIozEg21mIuKEwERfq4OWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1647419661!26413!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12017 invoked from network); 16 Mar 2022 08:34:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:34:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 851B91001A5
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:34:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 78645100196
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:34:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:34:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.6.0 -> 2.6.1
Date: Wed, 16 Mar 2022 16:33:59 +0800
Message-ID: <1647419641-81593-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
References: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:34:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96011

Changelog:
=========
Noteworthy changes:
------------------
Decreased logging verbosity, now freerdp is much less verbose by default

Fixed issues:
--------------
Backported freerdp_abort_connect during freerdp_connect fix (#7700)
Backported improved version dection see docs/version_detection.md for details
Backported various rdpsnd fixes (#7695)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.6.0.bb => freerdp_2.6.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.6.0.bb => freerdp_2.6.1.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.6.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 9b97413409..ece2f56960 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "8a5c034d547c428c512b0a4b840d3a8a4762f989"
+SRCREV = "658a72980f6e93241d927c46cfa664bf2547b8b1"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.25.1


