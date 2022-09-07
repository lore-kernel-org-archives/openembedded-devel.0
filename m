Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E365C6FA83
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:24:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.6512.1662549838571954515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QgnZQzku;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549836; i=@fujitsu.com;
	bh=gcXYTQVEi3sSn83tODjok+FfC97DXXSPE+iF55bhYBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QgnZQzku/76JDJlrT5L7A+Dv1NX1AGxkLIsWXcs4qPjWuiV7HMHNxKGres8dGnCfK
	 aAyoujxNl9Y7JNOcEwAwOx4kPs35UiqWEZwcfotXpCWw5JaVa1T3vGnApWG3WRdIMA
	 YCN/TCtNqUzfaHz5KQ37gtqPKLGiDS+F4/0W+1pRprL9CifrOYcxSJARdp2bmFD7Yd
	 RsXrWTw2x3LV6MnsD5icwI9WnJdNr4aYubNmii1eHpWyRYrl1ww2PQfLf6eZuNBowj
	 anZDBa6TUTB1xZBejAiLwCcHYPZxL9pIkHrx6d4wGnf/tfhXqFLjvzKjhKC00LcbdW
	 gd2ZxnlQJ23/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpOtTL5F
  s8GmDosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvG95Q5LwV3uih07X7E0MJ7j6mLk4hASeMgo
  ceDJHXYI5wqTROei2cwQzm5GieYJ+xm7GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhYIkZhwbhETiM0CFD9w5yeYzSvgJHFl5RSwGgkBBYkpD9+D9XIKOEtsnfufDcQWAqo5Pm
  E9VL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbrpKLM9IyS3MTMHF1DAwNdQ0NTXWNjXUNzS73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK
  3OScFL281JJNjMBATilW3LyDceLKn3qHGCU5mJREeeO8JJKF+JLyUyozEosz4otKc1KLDzHKc
  HAoSfBK1QDlBItS01Mr0jJzgFEFk5bg4FES4X1WC5TmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn
  5eqpQ471mQIgGQoozSPLgRsAi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYl6EOaApPZl4
  J3KZXQEcwAR2xNVAc5IiSRISUVAOTaPU+PqV7u4R38s3jWPT62q27Sb8nu88+1FzF4dv6IMqX
  /+GWm9wS9oYppo/zpItjczyNFl2/YmB3vN//ntVb0xvfxNLP/ihb+O5X/EWXoFPB7ZGml25FK
  pw7LnB/OdOlZ//+xYTZ76ntuLq0hrdku8JJlW+Mew+I576bO6Hy7xGGp0tXRvzWWDCdz+DDj4
  S5F3oCPYXEnmo3KWqGqm+eFX1Nm/+1j8aaEMEZd9qNdnWGbVETflyrxuN+7OTnV8Hf9OzyeSd
  kr3rz+8iJ8CYZmSK3PZM9L7yYn9mnsc1phfIk34UsCqF71leLLTj+syvn+IuWO9+O77mXv7n4
  x44rVsY5kidt2yqvbdx9cy53nRJLcUaioRZzUXEiAG0C0ixrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1662549836!143082!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14465 invoked from network); 7 Sep 2022 11:23:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:23:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 450CA1AD
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:56 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3A48D1AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:23:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.8.2 ->
 2.10.0
Date: Wed, 7 Sep 2022 19:23:18 +0800
Message-ID: <1662549799-17908-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
References: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:24:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98684

Changelog:
============
Features
--------
    Add 'strict' to flatten_query_params to lower-case bools (#433) (83678e9)
    Make grpc transcode logic work in terms of protobuf python objects (#428) (c3ad8ea)

Bug Fixes
---------
    Require python 3.7+ (#410) (7ddb8c0)
    Restore support for grpcio-gcp (#418) (8c19609)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ogle-api-core_2.8.2.bb => python3-google-api-core_2.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.8.2.bb => python3-google-api-core_2.10.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.8.2.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.10.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.8.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.10.0.bb
index a2df7fb48a..470bc7fc50 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "06f7244c640322b508b125903bb5701bebabce8832f85aba9335ec00b3d02edc"
+SRC_URI[sha256sum] = "1d053734f14591939e7764e99c31253fed46bf2578da0dcd82821f17a6dd991c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


