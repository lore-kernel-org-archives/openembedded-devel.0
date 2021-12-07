Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7327C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 06:48:40 +0000 (UTC)
Received: from mail1.bemta34.sdw.messagelabs.com
 (mail1.bemta34.sdw.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.63940.1638859718584825209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 22:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qo4a+JEz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638859714; i=@fujitsu.com;
	bh=vDWlMzPNRq5BMQ6VVR1SzH1wiDBo1CrvZKzCiBZy5Cs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Qo4a+JEzAJTxe4NZLH+XO7yeuvpUIROli0t0FCFL59HUBDG2/TyieJ1XM3aQMktyJ
	 Pb58NV47vNe29cy7epf0OQQ2JgrdtJ+eSlBcx4ZbgiiX9V38W7H9GM4VjxEIihCV2x
	 CHzn8s30BGE4qdCsR17GiErskkL7q6brxw3QWbvQyvnZ0db1ToPP1/6jXaNUaGi2LY
	 uJ7t713DYfaVYSJ+dqKMyZ4a7xvwxN1WCJSDKRsmsYZxeULYvsgpyhkQrSqI3I2Qs5
	 HmWVZtuBvQbjNg/vSsDlOycQoe03OB0251dAVp4f8nLwN+TU6ivjqBu+B+uPgBhmB1
	 5sC+3CvTCl3+w==
Received: from [100.115.34.229] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 5F/D2-32601-2C30FA16;
 Tue, 07 Dec 2021 06:48:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqHuIeX2
  iwe4jjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5eTPYC9ZwVjScmsLcwHiVo4uRi0NI4Amj
  xNNX81ggnAtMEhP+r2KEcE4wSvxuW8rcxcjJwSagLvH45mtGEFtEQF9i6ew9YHFmAVWJ7otr2
  EFsYQF/ic/Tb7GC2CwCKhKf9j5i62Lk4OAVcJfoOBcIEpYQUJCY8vA9WCuvgKDEyZlPWCDGSE
  gcfPGCGaJGSeLEio9MEHaFxOvDl6DiahJXz21insDIPwtJ+ywk7QsYmVYxWicVZaZnlOQmZub
  oGhoY6BoamuoaG+kaGRjqJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhmVK
  scLJHYy/L33TO8QoycGkJMobMW9dohBfUn5KZUZicUZ8UWlOavEhRhkODiUJXp//QDnBotT01
  Iq0zBxgjMCkJTh4lER4LzKsTxTiLS5IzC3OTIdInWJUlBLnXcsElBAASWSU5sG1weLyEqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVh3nkgU3gy80rgpr8CWswEtDimfzXI4pJEhJRUA1NSUuY
  5/wm3o7yXp0s28Lwq8g47Yb/t3ofM0pZV59XvcdkaRm2/w/lF/tAb2cYYkdQvzuKaPVIaouus
  Z7Y4V8xRj95edkRRfRcHn+ax5Td3L5so6jbl2fpLW3e/t9r77w6zsPfFhT4v9jLmG2eJiCp71
  nbx1u5SldmxbbvRNna7g5ujrYysbj/r2ppyfhJj5Yeue6WiP2Wu77/s6xDk+W7j5iW5c5e7um
  0uOZ5/dZbUnN7vEb5xYben2O6LLXRks5d1OhSQ9taNaV3Wmg5lw33rHgvu2/71vNK9x+1v3nz
  52m05f+Y66UvhrgLLonMFzwSvEX2ardfx2qjstsf3k6/qFLa8Td/1wTJm7daFm/qUWIozEg21
  mIuKEwHaPaT9RgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1638859713!85295!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4596 invoked from network); 7 Dec 2021 06:48:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Dec 2021 06:48:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9F916100242
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  7 Dec 2021 06:48:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9355D100234
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  7 Dec 2021 06:48:33 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 7 Dec 2021 06:48:12 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstruct: upgrade 8.11.1 ->
 8.12.1
Date: Tue, 7 Dec 2021 14:47:42 +0800
Message-ID: <1638859662-19143-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 06:48:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94224

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-bitstruct_8.11.1.bb => python3-bitstruct_8.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.11.1.bb => python3-bitstruct_8.12.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.12.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.12.1.bb
index 49b31971a6..f53f84f83e 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "4e7b8769c0f09fee403d0a5f637f8b575b191a79a92e140811aa109ce7461f0c"
+SRC_URI[sha256sum] = "45b2b932ce6681f5c6ce8cba39abdd423b579b0568c76fa48b1e09c88368ede7"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.25.1


