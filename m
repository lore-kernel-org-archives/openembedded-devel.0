Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388E1C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:40:31 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.49027.1681717230391976807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yRcBi+H2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717228; i=@fujitsu.com;
	bh=O9A08LsC/wF5P5yqCxHKRrwYKYqQQMkU79Je19Fo/vQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yRcBi+H2VpMHu5m/0ELOOeZn/vlTeuGlneWgV8i8IG6bp6SgRMbIhaJvovPm8zH3/
	 cFrS+9NwdkCvVTzYoGNMhxiDAiBtX9RWtLzsX5lis2hx8yFgA63bZ+RsAf+v7QzO8U
	 tasmd7jvV/0VwI/DzgkKB6ObuJxRL8J92f+bdscHvIRF3v/6yoP1SqDw/RrjabfBjL
	 6cl6DrZo6M4b/gv+DYD1yExRZ79Ugg+PXUP71beXb4b+oNzsqGGr7JG6ZMaBltPwLX
	 lIxCdK5uxeHeMEzJl+z+PXekceJmbXHe4cNnXvCl7FaQ4OX6pxoClvJFP6nY2kiUwL
	 qFrEkOsp/tHFQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORqPvmu02
  KwbFZMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b7Y++YCtZwVjw+O5mtgfEKRxcjJ4eQwBNG
  iddvM7oYuYDsG0wSPW3z2SCcvYwSlz5eZgKpYhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAV+Jg32swm0VAVWLN+ecsIDavgJPEy99vWEFsCQEFiSkP34P1cgo4SzSsfwYU5wBa5i
  TR2FIKUS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bQ4tagstUjXUC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHBTipUn7mBc0ftX7xCjJAeTkijvi1TrFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  Oe/2aQICRalpqdWpGXmAKMIJi3BwaMkwmv8DCjNW1yQmFucmQ6ROsWoy9G+vesAsxBLXn5eqp
  Q47x2QGQIgRRmleXAjYBF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7xuQKTyZeSVwm14
  BHcEEdIScEtgRJYkIKakGprLmrLq326qkbC+vedtt6rTq1AeNvZOPF59dIsKdcWX5ySVTeX8y
  rJrnc3tlZ5DV86p3/lP2njvA2xks801S2Id/x8YpW8SzY2dHRVjGlj3YaLT5wQPWBS+nLam/P
  uutPSPHjkv3nR/d49uT+3BdxZvAb7u2/qo8mtZXwpa5nfXpo31fjtrec7HgzVhusEdJRP0lr3
  XZ4l0Fh15oVaTsFL1aXum7XsLzd8TSHo/n2QXay+RyctsXqu6cMPvrUheZS1N8FHdLherYMcq
  rr842731kYflu8Z64W4KOH+Y2Hr0X+vDPSQlLqTO9r+5NbjtxbEn1sePBSoor+Y7f/Lpi4dmZ
  MaU3Jt6vk3p79XHiLZYYJZbijERDLeai4kQATfVMrGMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-571.messagelabs.com!1681717228!404580!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32179 invoked from network); 17 Apr 2023 07:40:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:40:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2A3D21001A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:28 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1DB551001A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:40:26 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-diskcache: upgrade 5.4.0 -> 5.5.1
Date: Mon, 17 Apr 2023 15:39:55 +0800
Message-ID: <1681717197-19108-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
References: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102109

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-diskcache_5.4.0.bb => python3-diskcache_5.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.4.0.bb => python3-diskcache_5.5.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
index 84d42e572..50e3c12d8 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
-SRC_URI[sha256sum] = "8879eb8c9b4a2509a5e633d2008634fb2b0b35c2b36192d89655dbde02419644"
+SRC_URI[sha256sum] = "8685515584cc110a463d0728d98beaba56c7e2803b60a19cb8983a4c9e341d91"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.34.1


