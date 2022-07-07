Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A54C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:55:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.3058.1657180500308252961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lqvYNl9+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180498; i=@fujitsu.com;
	bh=xfDbkRrAcSx6XwBdx9CqM/kig9V4VKzMXISJEElUG9U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lqvYNl9+CrEFNQrgrHXb1YW/19W/pGmZS61HifZrZct49IlqWelCv1c+9vj+1euxN
	 YrDZPPlgwTiYa8HQd6KRmbb81i8/uQey2CG/maJ4AAWyMt4TUbNH+fpVy/3SRSv0Ar
	 +GUj05nuWyummiZkYmjapPpYIQDJY6uBmDdwKcylg4E4ubB7GKqBcx2cUTZNDzlt4K
	 ASwVYZhQBWhyehIiwDrhc1JGHB+msjSS09lFefUCkIxu0vCvVxtSeQx4O4lRTcuwri
	 cOpHPW8B1BpGfkiOusd1B7n4kpgPzVwSU9lDN15HcXVskaE9L6GG+KMQepZK+N720q
	 Dow7aUS/qabCw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqBs08Vi
  Swc397BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aelc/YC+ZxVTS9WsDewLiEs4uRi0NI4Amj
  xPPv69kgnOtMEg2v3gE5nEDOfkaJ6R2cIDabgK7Eix+LWUBsEQF9iaWz9zCD2MICPhKXTvWB1
  bMIqEj0rfgNFucV8JCYsKadFcSWEFCQmPLwPVRcUOLkzCdgc5gFJCQOvngBFOcAqlGUmD1dHq
  K8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYzWSUWZ6RkluYmZObqGBga6hoamusYWQMp
  QL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMPhSitXydzD+XflT7xCjJAeT
  kijv6p5jSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeA/3AeUEi1LTUyvSMnOAkQCTluDgURLhX
  QLSyltckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcV75fqAiAZCijNI8uBGwqLzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZi3CWQKT2ZeCdymV0BHMAEdsSz/CMgRJYkIKakGptDzV4r2vD1
  TaKlw4bGMiZa47Kc1KRaGZxLKbKr/Pn8m9GbevRcfmhr0avZc2+z8tE8m5Vilsl5w79HjZ19u
  bE8VXSZ+YdN9KX+G9/vtuD5cn6Huw7Ai2b7kW/bNmZbbNsca/bTj/68acyhUMWs+V8+a+NZZP
  Zsqz91P0XzNky3aeObC04DTTdJuFpJX58kv1ckskCne/v15YWCH9XT9Zp77Zot2Zvzz/Lt7S8
  9KOZOSj9O2tM38HfnL7PLpjBc1bvUX9t20Z53hX3jdXG9btP2ElH5/1hnOf/SUD4k5d63usp7
  GcMvZPuutQMRrsaKATZ0VAcIxDMpnIiZMnbjT5BhzpqLVdY5i78hphi/XKLEUZyQaajEXFScC
  ACsYJZxFAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1657180497!89128!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8049 invoked from network); 7 Jul 2022 07:54:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:54:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C6B2B100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:54:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BB1A1100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:54:57 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:54:56 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.3.2 -> 4.3.3
Date: Thu, 7 Jul 2022 15:54:45 +0800
Message-ID: <1657180485-23835-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:55:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97750

Changelog:
==========
Handle ASGI lifespan when running with a secondary ASGI app #284
Update deprecated usage of asyncio.wait() #281
Better handling of queued WebSocket messages in uWSGI #256
Gracefully fail to decode empty packets #269
Only attempt to set an async signal handler once #276

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-engineio_4.3.2.bb => python3-engineio_4.3.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.3.2.bb => python3-engineio_4.3.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.3.2.bb b/meta-python/recipes-devtools/python/python3-engineio_4.3.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.3.3.bb
index e9891bc27..1a80a556e 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.3.3.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "e02f8d6686663408533726be2d4ceb403914fd17285d247791c6a91623777bdd"
+SRC_URI[sha256sum] = "18474c452894c60590b2d2339d6c81b93fb9857f1be271a2e91fb2707eb4095d"
-- 
2.25.1


