Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9777C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 05:51:57 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.2600.1637733116081907474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 21:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RmxQOtyn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637733114; i=@fujitsu.com;
	bh=QBjmhVzvWwTjJMHTrZe6ipwT+5a4XfByIn9hYKxm5rE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RmxQOtynEkY+HEwdfZpBF6unTpNVkByCz/6V+Gezp1o4Njs3902EU5xn/sSdPhQJN
	 xSSKM0pK8rUZIyw4MLVf5TJxH/dwUCSwr7BRTFi9u6hRamlttpNZz6HmxSVXnUtjqG
	 a2ypg7Ui/onhQcdA8LZewL2L8pdQQnG3nmNjepqep8w/1tEgostrgjXlxLZPIjxL6d
	 4xZ1VcE+I/xt22GjBfvkDtcHX7GHEVBuE6DaBhe5LwqNOgeRJicugyMSidzlWjpdb3
	 rjM4WG1FKhvKh/ZTR62nzkpYZcXv4t4ex0dx9smmiDxP1l7PYSZp3LyWeQndxPw2HF
	 oFlHEj28HRihg==
Received: from [100.112.198.127] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id EC/D1-17294-9F2DD916;
 Wed, 24 Nov 2021 05:51:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqPvz0tx
  Eg7aPQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bP+R9ZCzr5KpYcvczUwHiJp4uRi0NI4Amj
  xMcrrcwQzgUmiZsbLkA5Jxkl1r++BuRwcrAJqEs8vvmaEcQWEdCXWDp7D1icWUBVovviGnYQW
  1jAR+JEWyNYDQtQfNfSd0wgNq+Au8T/iVvYQGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMED
  VKEidWfGSCsCskXh++BBVXk7h6bhPzBEb+WUjaZyFpX8DItIrRIqkoMz2jJDcxM0fX0MBA19D
  QSNfQ0kLXyNBUL7FKN0kvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwJFMKjl3fwXj19Qe9
  Q4ySHExKorzVW+cmCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgXXkBKCdYlJqeWpGWmQOMD5i0B
  AePkgivJzBGhHiLCxJzizPTIVKnGHU5mict384sxJKXn5cqJc6bfBGoSACkKKM0D24ELFYvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmDQBZxZOZVwK36RXQEUxAR/TumQ1yREkiQkqqgel
  wZrr01p/fjF80iRvlPn74Y8ulGubbfxgUGf+VGOgc3Wdw/dn8+fNmVoftlz2ldDL6n7Cw6f9+
  VeYCRi2Fpmnvdj3t8ohsa1PnCbOafON+LJfE1r0vv5mH5nR/7j/ctmlpasYsua/vEzUmZ81pT
  hPujI+YfiNvn9OPPY+0BBnE+jJyp6vofhD7dtSF973kMoVtS9mO/i80Zbrr2jst3WvhzrQHh/
  NKkgwiNvUW1UkxPGRWN21tex4sKfxdsctjmRzHpICtD9xS70/4/fPoqUDz2quBfDbKyxx5tkS
  83HS+WVxgVteOG8/avM1DN2mfNOCrvWTWuT/g61KOmRNKmlI2SlW91t9a8iyi9K+xkRJLcUai
  oRZzUXEiAD7e/QRQAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-291.messagelabs.com!1637733113!476462!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3844 invoked from network); 24 Nov 2021 05:51:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Nov 2021 05:51:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CA967100236
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 05:51:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BF1AD100230
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 05:51:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 24 Nov 2021 05:51:31 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.4.1 -> 5.5.0
Date: Wed, 24 Nov 2021 13:51:25 +0800
Message-ID: <1637733085-16356-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Nov 2021 05:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94111

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Option to disable the SIGINT handler in the client
Do not invoke reserved events on a catch-all handler
Use correct binary packet types in the msgpack packet encoder
Add missing call() method to namespace classes
Add missing to argument to namespace emit() and send() methods
Configure Redis pubsub to skip subscription message
Migrate async Redis client manager to aioredis 2
Update Python supported versions in docs
Document how to get the connection state in the client
Improved documentation of start_background_task() function
Improved documentation of call() method
Fixed intermittent test failures

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-socketio_5.4.1.bb => python3-socketio_5.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.4.1.bb => python3-socketio_5.5.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.4.1.bb b/meta-python/recipes-devtools/python/python3-socketio_5.5.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.4.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.5.0.bb
index bf8ce4c7bf..425dadc4f1 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.5.0.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "ef4e273ddfebb421144a228cbab1e7e27ffe8d372514fa561e57d590ea6627b0"
+SRC_URI[sha256sum] = "ce972ea1b82aa1811fa10d30cf0d5c251b9a1558c3d66829b6fe70854bcccf0b"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


