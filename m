Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E41EC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:15:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.301.1668309351264017800
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jsdtGh+b;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309349; i=@fujitsu.com;
	bh=+DZoM25xs17DBjX5eZZW6PfrRN/Kb/bHbSDPoQLRkrY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jsdtGh+bGL3y2OT875SCbyOyje6B/ApLJE2i7OFvNCgGSD6C6IImA9gEqqS9ogjKG
	 +LOIwI7XWDuIJLafpVt4yQbXWJdS7RJjYttb7EcMlDTh66hY0UzD1/8POa8lsmfmti
	 N4PySaKbWodW27SHYR1MI+p1FkfKOQxVNlYvwoDiPubXLstMaRPNyZ2tOCLez/1I2Z
	 xSAKYUQKmhUr7fVPqRyGkfk2EivhwgEHOJrW78gHvp9sFlaavPE5lbM6XzaWt2Gg4A
	 udRW7Ro/dSYmlpZh7th+tfhiGtNOPeUqimqb3cXRYxzR/YEqOtXhYMlyICkU+bPfeW
	 2Myu1uLGwIkUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORpJuSWJB
  sMPuHvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFz7UnGgoU8FTvnnWJvYFzI3cXIxSEk8JBR
  4vPDViYI5wqTxL7z71khnD2MEu9PrGHrYuTkYBOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBE4vvG3WBxFgFViUl3msHqeQWcJK4smwRmSwgoSEx5+B6ohoODU8BZYsIhGZCwEFDJ1B
  knWCHKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhanFpWlFuka6iUVZaZnlOQmZuboJVbpJuqlluqWpxaXAGUSy4v1UouL9Yorc5NzUvTy
  Uks2MQJDN6WYnXUH44slf/QOMUpyMCmJ8qZdz08W4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7O
  7IgWUiwKDU9tSItMwcYRzBpCQ4eJRHeCjugNG9xQWJucWY6ROoUoyXH1Nn/9jNzLAeTM7+2HW
  AWYsnLz0uVEuednQDUIADSkFGaBzcOFuuXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzro0
  GmsKTmVcCt/UV0EFMQAd9j8wDOagkESEl1cAUfCPvm97HqCVnH/NHLAlYW/Riz0oFpVc3yjyU
  bXLzeFt2WITn8hUFeEdOLdqqsad6/dW4R5tPHYk5UOLdaRlbIsxUdEaEPzDL6taUaLNZOTOtj
  zwqZpJ7HB1QypjJs3Oq1vuOvFKj1evdbWY8ULTRWb158kc3S5sw3U6+xGPZU3lvPDwxl3+y25
  YJQeILUh5JePhUxO1ftujRXYnNJ5TD1AWsdHZeuZJV7xPCEPXjYOTdRQvieNZ5mDcbOUqsEMl
  7ffJ3/faqstL4HXe8ZrZ675H6t7xB4F5AVG+bQYDO5YT4tbsCDxfwu+T1rc94s/jOnOOTYsTr
  NmXvmfnui63K8ftC8ftXbV0q8DXvaI0SS3FGoqEWc1FxIgDr57LzcAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1668309348!854609!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28440 invoked from network); 13 Nov 2022 03:15:48 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:15:48 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2BD471B2
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 20FFB1B1
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:15:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-u-msgpack-python: upgrade 2.7.1 -> 2.7.2
Date: Sun, 13 Nov 2022 11:15:16 +0800
Message-ID: <1668309316-15398-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
References: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99571

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022

Changelog:
===========
  Fix hex formatting of data bytes in Ext string representation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ack-python_2.7.1.bb => python3-u-msgpack-python_2.7.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.7.1.bb => python3-u-msgpack-python_2.7.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.2.bb
index 3f26ba011..7231a5195 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.2.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer written in pure Python."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31e3e7e79c4e2dafffffdd0b4d40c849"
 
-SRC_URI[md5sum] = "8691cea6bc7b44bce6e2115260a54323"
-SRC_URI[sha256sum] = "b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551"
+SRC_URI[sha256sum] = "e86f7ac6aa0ef4c6c49f004b4fd435bce99c23e2dd5d73003f3f9816024c2bd8"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


