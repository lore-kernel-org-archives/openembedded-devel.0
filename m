Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145D6C4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:23:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.48734.1671538982983286440
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=be3jeTh9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538981; i=@fujitsu.com;
	bh=Sp/DuPv+45sIHKJXTSyOgLrrPASOzodqDcY5J10X8zI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=be3jeTh95hDvtrMt3kG/Gxn2mtcjW0KVT89qAUg3pBmzgTMn6iDmjoYXZ6bqdT9cl
	 796GyF8mtJsKgCo3ieB7Nn8tJaRTB5g35Ot+KZWwLSqtPI+B70mhg2EOFZQnYyXB98
	 ew/VqKbdfGJbci6gcjbWHfGjKJmPSYUOOuLEsgHNFIw9KfmZDDJ/nbQOjEZmkiEOBK
	 sDfPrhGbu/7cLP7zrAEv7dfRf6rqchtsBKHi9wizOMZaeOCrCpEv9Sv33HwClyCYCt
	 7BoDbBGxu4ZlmAeVm/vJz23D3RTRyLV5IMBDtEoQpi4OSnTvOnYYwrPEY37CA1uytz
	 DpOrvooP+yajA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSVdl5cJ
  kg6cfbCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxzV06xF7znqrizXqiB8T9nFyMXh5DAE0aJ
  +9+62CCc60wSe84+Z4dw9jBKrGmdC5Th5GATkJK4cf8/mC0ioC+xdPYeZhCbWUBF4sXvHnYQW
  1ggSOLokh9gcRYBVYkXm1eDxXkFHCU6Js5iArElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9
  QoSsy+3MwCYVdIzJrVBtWrJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6huV5SUWZ6Rkl
  uYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYDCmFCsm7GA8tOyP3iFG
  SQ4mJVHesPCFyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeGcsAsoJFqWmp1akZeYAIwMmLcHBo
  yTC2zMbKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXHeF8uBigRAijJK8+BGwKL0EqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVhXiOQKTyZeSVwm14BHcEEdMShS3NBjihJREhJNTDxt7j
  Y5pR1nnhZsuvLc4+Z/vclX5kGM65Ju7M7uv6bzbkepV0tc39nr/fIuxWwTyX4/bWPyUdnXbBZ
  Pfv6oaPW0nz3Pi1ZGzpB+5IG19llFWwvewqfKO1zXRNVbrF/8+Ts1pUch+4JzKuc0ZITvPef5
  ixvJqn8l57v6o65Ctz9/vUh48SY7KSOw2/zKjSvJIuk7vg4/7jlhjwO9XXsf62Oe9+/YyVikH
  bKhdeR28rV9LbKPqs6jo6/FambV9381cW0Y8o1D82cGsuzxuducUWvqAjb8FOAed+ewGnWD5c
  a/9C0a36y/qBkk/yV/7x6JvZaDTcmcWVvm7Mn9y+794lFa94XfPP7UZ5/12/Gk1VySizFGYmG
  WsxFxYkApxmM800DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-571.messagelabs.com!1671538980!370520!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8861 invoked from network); 20 Dec 2022 12:23:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:23:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AFFC81000F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A39FF1000DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:22:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 13.0.2 -> 13.0.4
Date: Tue, 20 Dec 2022 20:22:25 +0800
Message-ID: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100145

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Correct timeout in call to poll.poll (#687)
Revert "Revert "Fix error with select when python process exceeds 1024 open file descriptors"" (#686)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_13.0.2.bb => python3-pychromecast_13.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_13.0.2.bb => python3-pychromecast_13.0.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_13.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_13.0.4.bb
index fb63b3dde..49680c343 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "1b520e477492cd8fe022e4d041e676056d5fffbb6c05b2f4509801a06bc67bec"
+SRC_URI[sha256sum] = "792fba3f31e4968a5e99c19c771774083a2aa7e897ebf6f5e218e308e33a461f"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


