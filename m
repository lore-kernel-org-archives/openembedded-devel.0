Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CD7CCA47F
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:00:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.2761.1657857592489715226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 20:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=goOSHGcf;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657857590; i=@fujitsu.com;
	bh=RPaPcmqcgXRF87UQ87fIcm8ZqIXOsq+6rLlLW0HtQ/0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=goOSHGcfc46xLuBh0EHUG0APTf2PwenHK0voHpkTsSb1EdfORa44gbNBgMKqQRzGK
	 2CRa3oNJ8o1ygEBF3jCyEP5hk/gzF+f4ZYgAnMpmY9rpPjOumCxImdHobURMYs4/AD
	 52HKmJ+T8Q6+pWgPde71yixAznzX20uYNusPvhedIEEPsdHfE3gzjHot0paWJRvHFa
	 bktw12U73du88OrCHddL3tEG2E4QcHtq+zyBWJ72c9lMlLHlB35kT4TtAJ14Y/z41U
	 +PWwJNSDLFSlJO7tD6htJOoVs3jR/haxaZd0zpLx2H7SgyywbtSx4GQUlfVVVCaAY5
	 u1O4b/YTOQ8eQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSdf02YU
  kg6+/dSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owdXyULVvBUfLvdzNjA+Ieri5GLQ0jgCaPE
  xrd7GCGc60wSP1d9gXJOMkrsWnifrYuRk4NNQF3i8c3XjCC2iIC+xNLZe5hBbGYBVYnui2vYQ
  WxhAR+Jd51/WEFsFqD4w2PXwGxeAXeJa4v7wWokBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9
  QoSZxY8ZEJwq6QeH34ElRcTeLquU3MExj5ZyFpn4WkfQEj0ypGq6SizPSMktzEzBxdQwMDXUN
  DU10gaWSsl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGJQpxQzVOxj/9/7U
  O8QoycGkJMp7KP9CkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3mOPgXKCRanpqRVpmTnACIFJS
  3DwKInwOj0ESvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpy3BKRIAKQoozQPbgQsWi8xyk
  oJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZdAnIJT2ZeCdymV0BHMAEd8dAX7IiSRISUVANT+zS
  jio7zh533ia5fHMZ2VLcrTvkZz8r9U/UDot69N34iEF1x1j1N+N7ZOwraX4X3OmTUfdN8Pj85
  KpOH00b1haPB52PrlA3iqo9oPRCQUWKK2/fnW7TgnvBTYoWm/SEbZwu83uctfI53ttX1T5M8q
  jZ352Vv3T513akw544ffWH106ulX5dbfLR1a/rj8D/82ald3i9/3vvoc7r6eWRWg4ZyaNq+RW
  paYepX8yred+1xDZ+X01n4ba3hqZTkN+dyUqb+ePM5cZveHVGrR8+fveK/rJer4aeqonigsPd
  rciGzyd+QmbYJlmtulJ9u6v39d35afXSmmeqhKzbMRZHpW94/CjywWjOffd00zm4lluKMREMt
  5qLiRABUUZK8UQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1657857589!334655!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18841 invoked from network); 15 Jul 2022 03:59:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 03:59:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5928C1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4C2D2100077
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:49 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 04:59:47 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.6.0 -> 5.7.0
Date: Fri, 15 Jul 2022 11:59:35 +0800
Message-ID: <1657857578-19917-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97832

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
    Server refuses connections on unknown namespaces #822
    Do not send ACK packet for unknown events #824
    Fix Python 3.11 deprecation warning #941
    Correct handling of RedisError exception #919
    Update Django example
    Documentation fix for async client
    Update documentation of asyncio server
    Fix documentation typo #948

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-socketio_5.6.0.bb => python3-socketio_5.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.6.0.bb => python3-socketio_5.7.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.6.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.7.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.6.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.7.0.bb
index d76261148..54ea3c2a1 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.7.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "f1f2eabdea500dbcb384902418cacedd98b7fe4d0fed818415ddf8af10e428fa"
+SRC_URI[sha256sum] = "82e3c45baa51f2180f176e5e1c4232a4452f7545a3fe3156d093fa7e5890e816"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


