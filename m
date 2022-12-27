Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BF7C3DA7D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:45:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.153563.1672123499492335339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AcnnESFG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123497; i=@fujitsu.com;
	bh=7W95Ub6+Ghok+Nrl6tyB0JzdFxci7US9QrvnY+KDCg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AcnnESFGiXccK6VdrmMliHkm4MPbgt3iEW9vbPNvziVPqB3zpUJF1JEnXj468owr6
	 6EwLzzDq4b4P8MV1j2ZNGQNWhkEJWuKGV0JrBUm77SxdmBxaxYt5oV0yVeGwvzmVsM
	 /T2ho1TPTk5C54Hib+k9I8I9luVH1zJt33RoVWh2NajVmKd2RJpuc5xGuku+Rz+vb0
	 kqdSMZdoPTeb7g67JY9SrwAnPGrwRVgMRjn7PL4bgEYpuXG5tWhCd9tdvk0L9OwCB3
	 yRTyrG8tkCP9Yn5xlgpXGTKL8sUx4an2uDcDAwyD0NQ6QyFZBNgHDAQYIK2RZevvFO
	 jGBpFE0zsZPYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqJs5ZVW
  yQcNqJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePFnrKCbu6Kbw/msDcw9nB1MXJxCAk8YZRo
  eLeLDcK5ziSxtuUfM4Szh1Hi7soLrF2MnBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC3hLvNj0kgnEZhFQleh5+IMRxOYVcJJombIeLC4hoCAx5eF7sF5OAWeJ41vug/UKAdWcam
  pjgqgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtUGNVNN4uq5TcwTGAVnIWmfhaR9ASP
  TKkaz4tSistQiXUMzvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pVty6g/HGsj96hxglOZiURHmlulclC/El5adUZiQWZ8QXleakFh9ilOHgUJLgL
  Z0ElBMsSk1PrUjLzAFGEkxagoNHSQSilbe4IDG3ODMdInWKUZejc3/XAWYhlrz8vFQpcd6vID
  MEQIoySvPgRsCi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV51kFU8mXklcJteAR3BBHT
  Eh0MrQY4oSURISTUwBexzuTwrcM6L4L5noZzdF8Q8vFb7nRAr879T8T9w0cbdjbafTvh2BATl
  lVpYnu9ynPIxumiu7IEEN/7pt5d9SZuiz3A7Jnmy+b70ykCvyU5rWOzT/i4UbHinpsk0ofbtk
  7/PshRbIla/X/Jt/w5DPfGWjx9iPscqXtgeono4u3R9kRXzdu4mhz+mh/MOy3J3V69cUNN8oV
  RtaaDNmW/nHgTVb9W0T0s8fbpYaJ9df5RQ9mphUZWw/rYvpnoP52+pey3elWx0TvW08f7bD9S
  +/dy5svat4P+yrzdlI0LlN38p5SvflOz31TGosvXFM/7LMbdO1a68FN077akHe6EXL8P2XZtM
  M7PS2/KiSgqUWIozEg21mIuKEwG4O6HbZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1672123496!419252!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32270 invoked from network); 27 Dec 2022 06:44:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:44:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B9310100192
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AC3F8100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:44:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.11.3 -> 5.11.4
Date: Tue, 27 Dec 2022 14:44:13 +0800
Message-ID: <1672123453-31906-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
References: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100269

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fixed #2038 (again): stop installing documentation files to top-level site-packages
 CI: only run release workflows for upstream (#2052)
 Tests: remove obsolete toml import from the test suite (#1978)
 CI: bump Poetry 1.3.1 (#2058)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_5.11.3.bb => python3-isort_5.11.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.11.3.bb => python3-isort_5.11.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb b/meta-python/recipes-devtools/python/python3-isort_5.11.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.11.4.bb
index 4b99c1755..3ece22c38 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.11.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "a8ca25fbfad0f7d5d8447a4314837298d9f6b23aed8618584c894574f626b64b"
+SRC_URI[sha256sum] = "6db30c5ded9815d813932c04c2f85a360bcdd35fed496f4d8f35495ef0a261b6"
 
 inherit pypi python_poetry_core
 
-- 
2.25.1


