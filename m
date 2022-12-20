Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CEDC4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:15:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.48601.1671538510767823614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OU0zJpAZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538509; i=@fujitsu.com;
	bh=MkFW9oCB+n/KW064FxW2qyC4r/or8VDHz5sAk3xE1TI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OU0zJpAZwb88fTm1fCAKtXdHMEY151BpHr19UFr7F1lKI9UXJQI2y2CekQCBD5ERS
	 wvqfnt3Nz0k08MQh6pYyyeHQgY2EERDi1QFFSBt3wYY0RmAqjg/bau4H33SB5ZRfjr
	 VZQIua8QYnxiXCnUOTGdnD8DClLeXytdZQ71ZpKpUEnJZV2XIeSJeRWLTkuiQC5Ul4
	 Ry4648f3Xbmugnbs+8VpYmg7BeL0NnrBZjAKs1O9pF0XkTK3WScQMBy7Ta/y2x3Hft
	 RfRpMr08qKlKCmcmAb0cqbrODd7xb6OlpaIWL22w50ni3Px/1M0FQWdLX6sIQJI8Ds
	 Ib7hIqa5oFMHg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORpOuzfGG
  ywZu52hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8brjtXMBZ/5K1q37mZsYOzi62Lk4hASeMgo
  8eHHXHYI5zKTxJWJS1kgnD2MElOmdgA5nBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC3hL9Bx4zAhiswioSrT/fQ8W5xVwlOiafhesXkJAQWLKw/dgNqeAk8SKjetYQWwhoJrZR9
  cwQ9QLSpyc+YQFYr6ExMEXL6B6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNTTTSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM35Ripuc7GM8u+6N3iFGSg0lJlDcsfGGyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneG
  YuAcoJFqempFWmZOcBYgklLcPAoifD2zAZK8xYXJOYWZ6ZDpE4xWnJMnf1vPzPHcjA582vbAW
  Yhlrz8vFQpcd6GZUANAiANGaV5cONg8X6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBv11K
  gKTyZeSVwW18BHcQEdNChS3NBDipJREhJNTAxcF6/yOD/Qfb6pOQzynsv23JNU3jGbHDJarpo
  eNOfKzlJKlv82+I9P5xeu1RL4qFI31cjYYtfXlNizk0RCpiZXi3azXj44C9vFUXnOIkWXXXVh
  oNByy9dZK/4ucn88+ptZ37t+3/QN1TlZGKfSZaKS320+bOMW/bcZ4xcOy4fixBJ8I91MIhfXL
  qs46+c82bOE0LLMxQLnnc1F0+cpHg3eCnL21d2YmyvRfb88i1r5LzEr16ikpy7Vep4Y+y83C0
  nTZ3nf7x1ymV1aZWUDseUhJ8H5fhztk6YMfPvW8asfFWL1d5GX7wOx8hN0HVifnTu/YKnT/YE
  Lk/J/rHfR3nS0UqtWqWeysqC6IUVLEosxRmJhlrMRcWJAB3/BoxyAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1671538508!386723!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26392 invoked from network); 20 Dec 2022 12:15:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:15:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4EB581AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 435E97B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:15:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.8.1 -> 1.9.0
Date: Tue, 20 Dec 2022 20:14:27 +0800
Message-ID: <1671538467-7143-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
References: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100139

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
feature
--------
 [feature] [commands] Added new Alembic command alembic check. This performs the widely
 requested feature of running an "autogenerate" comparison between the
 current database and the MetaData that's currently set up for
 autogenerate, returning an error code if the two do not match, based on
 current autogenerate settings. Pull request courtesy Nathan Louie.

bug
-------
 [bug] [tests] Fixed issue in tox.ini file where changes in the tox 4.0 series to the
 format of "passenv" caused tox to not function correctly, in particular
 raising an error as of tox 4.0.6.

 [bug] [typing] Fixed typing issue where revision.process_revision_directives
 was not fully typed; additionally ensured all Callable and Dict
 arguments to EnvironmentContext.configure() include parameters in
 the typing declaration.

 Additionally updated the codebase for Mypy 0.990 compliance.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.8.1.bb => python3-alembic_1.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.8.1.bb => python3-alembic_1.9.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.8.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.9.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.9.0.bb
index 3e3115883..071c60705 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.9.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5a8522010db1a393833988dbe2c7f0b"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cd0b5e45b14b706426b833f06369b9a6d5ee03f826ec3238723ce8caaf6e5ffa"
+SRC_URI[sha256sum] = "6af6792fe699730b27480382701b16028ebbaac6bc5cd4f06daf5fa3e4690364"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


