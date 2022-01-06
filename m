Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71F8C433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 09:52:48 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.6744.1641462766886992118
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 01:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iPDGuBTU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641462765; i=@fujitsu.com;
	bh=N3ZUbvYSeeVUZUwNtQQTPiwYGEAsRKVMMNt2/Jd9NvE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iPDGuBTU0Ym2xodYe8Nh2zD9HfXcMECyKmzdiawuwWECuyYhnSH5o/X9HDGOb/sEy
	 v23RZpIgyCwoSNcv53n70MIjoRj8zEkF0B2TpMlR6SUgR0nmV8vXk7rmQNk3y0JMVs
	 LFUMllp4kDhnAXAwgyzEUrXgNsODKIbi5Z7Dwr3BHnYwKhHIw67QcVxQubBFbHSpML
	 xqo6Z4igsMH9rZg4xXsk06FRQzBxmlYMGaizpRYzCH90EtyzZk0H+xXrg9+qeLXHjK
	 4Z4V+OHwS2y3h2APcQqsSTz1vSRPKq31o3W0xQK40CO72MzPEjH73BLmUYIKc76Fn0
	 PJm44SPHS0JTA==
Received: from [100.115.70.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 49/8C-31213-CEBB6D16; Thu, 06 Jan 2022 09:52:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSffN7mu
  JBv1t6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a8o/wFNzkrNn85y9zA+Juji5GLQ0jgCaPE
  pZezGCGcC0wS87u3sUA4Jxgltj66wNzFyMnBJqAu8fjma0YQW0RAX2Lp7D1gcWYBVYnui2vYQ
  WxhAW+JZ1OngcVZBFQkFv76DhbnFXCXmLzsPZgtIaAgMeXhe7AaTgEPif7+NlYQWwio5uT0j6
  wQ9YISJ2c+YYGYLyFx8MULZoheJYkTKz4yQdgVEq8PX4KKq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJdUlJmeUZKbmJmja2hgoGtoaKprZqlraGmql1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM5pRi18M7GHf3/dQ7xCjJwaQkytuldS1RiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgRv3Q6gnGBRanpqRVpmDjCyYNISHDxKIry/NgKleYsLEnOLM9MhUqcYFaXEeftB+gRAEh
  mleXBtsGi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdxbIFJ7MvBK46a+AFjMBLT4ndxl
  kcUkiQkqqgcl4t8tO65OV3Yv77vxZzhJ3cFNMeN7TXNe1NrFv6g/5L9HRXTRx/d4TvUE77Axj
  cqx8jrloONz6H6irJu+9yvZ1V9iUjzUqEjXLQmZxLXs5o+rKC2bnmdFB9o9Znnv3NkyryNrSx
  rVE/pfYzc3LC2ZG59b7lLX9dRT0e7HK4dcPp+qID27/5pyq7OBufy47f7lt7Xmt7LSdVj8Cp5
  lGf9l9Iv7Y7b1fsnnPbfvzxJP3xif1VZVqxjseqphHbBDbepBv3/q522Ub5Ju19Nb8vrhpXq3
  ud9dmvyVPP4hVHGM4acRlEuynsOd7ne207c8Ep6ZKHmnhtZv49+Du8+8rA07GtPy+N9tuSZAg
  +4JNfXlKLMUZiYZazEXFiQCmFnSLYQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-545.messagelabs.com!1641462764!3997!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2994 invoked from network); 6 Jan 2022 09:52:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jan 2022 09:52:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2FF25100446
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  6 Jan 2022 09:52:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0FCC1100354
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  6 Jan 2022 09:52:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 6 Jan 2022 09:52:41 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-paramiko: upgrade 2.8.0 ->2.9.1
Date: Thu, 6 Jan 2022 17:52:24 +0800
Message-ID: <1641462745-19071-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641462745-19071-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1641462745-19071-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 09:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94668

From: Xu Huan <xuhuan.fnst@fujitsu.com>

See changelog: https://www.paramiko.org/changelog.html

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-paramiko_2.8.0.bb => python3-paramiko_2.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.8.0.bb => python3-paramiko_2.9.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
index 1942a1d6c5..8cf004aa34 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "e673b10ee0f1c80d46182d3af7751d033d9b573dd7054d2d0aa46be186c3c1d2"
+SRC_URI[sha256sum] = "a1fdded3b55f61d23389e4fe52d9ae428960ac958d2edf50373faa5d8926edd0"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


