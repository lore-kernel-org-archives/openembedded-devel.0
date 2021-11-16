Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089E7C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:38:18 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web11.5207.1637033896814695794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=puTknJ6W;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033884; i=@fujitsu.com;
	bh=S+7qNkwQZZ+8qZJmutFjzs0TuCos+E4SsMuPpclUEJ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=puTknJ6We9IzJMHri6LdtPw3V1AJ4oKVFcd8qM3qqBevUs9ckOxpQNXByuB16qkOq
	 bo/oMpkXG44z7T0AXKDs4uvSrFBor5D19aff6mfCn6AlRTVqAAgrU0g4emfYwUNPRQ
	 rtrXHvb9sUv7ADDAqZWJQdyc97LAJ0RMmzj+3S9fSFhOYDX9v2aMN4yX7BsJnoLLoX
	 EUTYw2olX8NirT5lvzJzN7aYiFdFkZK6xbdcdhsGameJ9se3OpWVBf9HGx6uNLTRJX
	 6i8/pzkCia1M8EtrVKzOI8rK7GBO9vRi2ekdrra4e6PEGRtSsGjI0EzJ/7lMjghpWl
	 dtdk3occ+FJ+w==
Received: from [100.113.3.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 59/F0-15394-B9723916;
 Tue, 16 Nov 2021 03:38:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqDtbfXK
  iweIp/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bLt1msBTM5Kx4cOMvUwHiUo4uRi0NI4Amj
  xLdbJ1kgnAtMEh2PO1khnBOMEh9+zWDsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggQOLYsfcsIDaLgKrEofZ3QL0cHLwCThK7f/GDhCUEFCSmPHwP1sop4Czx6WQn2HghoJ
  Lj3fPBxvMKCEqcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9ll
  I2hcwMq1itEgqykzPKMlNzMzRNTQw0DU0NNY11DU11Eus0k3USy3VTU7NKylKBErqJZYX6xVX
  5ibnpOjlpZZsYgQGcEoho/EOxoOvP+gdYpTkYFIS5Y1bNClRiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTvI5XJiUKCRanpqRVpmTnAaIJJS3DwKInwXlYFSvMWFyTmFmemQ6ROMSpKifNuVQNKCI
  AkMkrz4NpgEXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvD8gUnsy8Erjpr4AWMwEttr/
  XD7K4JBEhJdXAlKx0NG6u6kPt2z7FfqLvjA8/en6s1/v+6St7zlRcFzl9sLBrs8hH29sF5xjN
  JcRvXc2u09hgIHXsUVK9Cev7+unB95fePOL0Q6XXpUXl1Ka9mvNWFf+czmh6q7V1doiEG2NEe
  Nrs0KOMPJPX/6zqTziYpGfMdTrj/8XuchEn9dCimROr/p8skTK9IPX3v9LMqWt0Vnuo3WjzTd
  v4rdRF8Pdc0YjVeubp9deUc8PUUy6IikjLX3u49fcqZqvYXuE5y/5zzZ7493/L9AO3FupnROX
  snlBWp3fr/IKOt/6fPQ6bl6SmbeTo0EicXfy66Gy53V89P0+TZ91bU1Yr7GuaFuukyd2+o3CS
  zeY9ezkeKLEUZyQaajEXFScCANjhI0BbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-232.messagelabs.com!1637033883!545472!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30287 invoked from network); 16 Nov 2021 03:38:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:38:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B925A10023E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9CA38100230
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:38:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.26 ->
 1.4.27
Date: Tue, 16 Nov 2021 11:36:40 +0800
Message-ID: <1637033801-81290-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637033801-81290-1-git-send-email-wangmy@fujitsu.com>
References: <1637033801-81290-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93969

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.26.bb => python3-sqlalchemy_1.4.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.26.bb => python3-sqlalchemy_1.4.27.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.26.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.27.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.26.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.27.bb
index e00015629b..3dad546fb2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.26.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.27.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "6bc7f9d7d90ef55e8c6db1308a8619cd8f40e24a34f759119b95e7284dca351a"
+SRC_URI[sha256sum] = "d768359daeb3a86644f3854c6659e4496a3e6bba2b4651ecc87ce7ad415b320c"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


