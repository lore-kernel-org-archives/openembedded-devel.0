Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228AAC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:14:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.111397.1669616058377333934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CjiDCWws;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616056; i=@fujitsu.com;
	bh=9uF44MJDf2odoRur7wz2vAe2gEL0k/kGhKO5F6MQSDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CjiDCWwsMk9UKfqSqmKo9Fxu7/DfU89A4ct1DdrYxes20aRgMDomzmOOR4aR7I12p
	 zGacUs20GHgt/CJRjLjrB2FpOZ+wtb2R8csVpVy44K2HcayajTe18lCI3aTzhyqcPg
	 NhkqZE59cokAmzDIDKcRQERQL9j4z4/ffNS88JG+60SM2aBzmjdYzKofg3Gh032SG6
	 z0BU8jmliSSAx8RPwLpmqdkjAbrEVlXR6pT+7eC49lzLJJLKTmLeGndx4+mBaw4fdU
	 FIiXQJNF2T6FETeco5NSya1dQ5jiFOtfNCFmAlIF0metFIOy9OHXJ7gAZE63ya0dzw
	 BgxXNFy8Ueeug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSXd7YEu
  ywdlLlhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bE3WdZCtq5KnYuPMjYwDiLs4uRi0NI4Amj
  xLbzL5ghnOtMEjd/PWaEcPYwSrzqXMjaxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAkMS37sVgNSwCqhJvt3aC1fAKOEn8W/wJrEZCQEFiysP3YHFOAWeJ23uPgs0XAqppfn
  2YBaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka6JXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg8KYUq3ruYPyz9I/eIUZJDiYlUd6Fl5qShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwr
  vdsSRYSLEpNT61Iy8wBRhJMWoKDR0mEd7E9UJq3uCAxtzgzHSJ1itGSY+rsf/uZOZaDyZlf2w
  4wC7Hk5eelSonznvMHahAAacgozYMbB4v2S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebe
  BTOHJzCuB2/oK6CAmoIM2KTaBHFSSiJCSamDqk7+cv0cu7kTI3jZxl+618nuvO0beW2469WRu
  /5uXaV9kZecmPtfYmJFYWZKyeuYe2buOfe2iV5gj7At/e6zhD7W/8HSfwyuOU3t7Jm8X+Mycr
  cJll7irZt6090d4fokI+JZ2Vs44xmX5KHuB4gf/zj0uM5/G3OG/v+ntluWzpH5Otj++7vY6v1
  3rYpZ/YzGySePhWmSYvfxNX6d5apdL++EGqRcHTHnO1O8IVskXTE9PuvZOSSF862xllolH2uv
  /8mxZNmv//LgNTmll1U7p3XE5LxyVdSLPZ+2uW6OvOan1qVJE9lylN9v+7GWrtl912OLf1u1/
  wopaetbPnXA6NbvrlY/1mu+hLm/MvvMqsRRnJBpqMRcVJwIAMDKtoXEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1669616055!291251!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19777 invoked from network); 28 Nov 2022 06:14:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:14:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A34211000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 971F01000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:14:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.3.1 -> 5.3.2
Date: Mon, 28 Nov 2022 14:13:43 +0800
Message-ID: <1669616024-13194-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
References: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99804

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
   Deliver callbacks from different namespaces #1909
   Fix documentation typos #1881

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-flask-socketio_5.3.1.bb => python3-flask-socketio_5.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.3.1.bb => python3-flask-socketio_5.3.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.3.2.bb
index 50e820ba3..b7ba80991 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.2.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "fd0ed0fc1341671d92d5f5b2f5503916deb7aa7e2940e6636cfa2c087c828bf9"
+SRC_URI[sha256sum] = "11d1d78b8805cda351b27828a110b88c74a573be62b07f7f5a519fb67fae0a58"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1


