Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A1BC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:19:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.3069.1663064391675744264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JrXkMfrq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064390; i=@fujitsu.com;
	bh=Wip7xNAMvTttHsvAjaJufsZ521UA145sPrXqMf1LRP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JrXkMfrq5GyRHgmy7TazQ8b0yxT9m31djriEFnYXQFvVMyvGwosffUi3msrQVDLAz
	 l2ebDWWg6KpvnTQRif4GtKIOVbwBbcm0JE2qYqrC+rbMRnBDxky7+GyfNMWxncaZsT
	 +zd1hrmKhBu7qTB0g3T4leOSiW1HULjNiIIsz94PbmpbEn8cEYkgMR+WeITzo6IcWk
	 A+Ah8ORH7mU/XR7GAl1T+Ya7ZXpSWsiVS3yN7i8bWq8nA9lSykRJqhxXk7ZHV0dczW
	 DFSFPKNBB7O4eiTVA8o/jj7KzkbsccUtnnbPQBPzgkIUq/gKK4XHwQ0oigoostXlGY
	 YuH1voXbolCeQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSdc1UiH
  ZYOd6dYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP3/cOMBV85Kq50TWJpYFzA0cXIxSEk8IRR
  4sKnuWwQznUmif+z/jFBOHsYJfpPL2TvYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQEfia62HqBmDg4WAVWJ5TvlQMK8Ao4SC78+YwSxJQQUJKY8fM8MUsIp4CTxpdMeJCwEVP
  J95lsWiHJBiZMzn7BATJeQOPjiBTNEq6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxWSUWZ6RkluYmZObqGBga6hoamuga6RibGeolVuol6qaW65anFJbqGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgSGcUszweQfjgr6feocYJTmYlER5I70UkoX4kvJTKjMSizPii0pzUosPM
  cpwcChJ8MaHAOUEi1LTUyvSMnOA8QSTluDgURLh5QkGSvMWFyTmFmemQ6ROMepyzPzadoBZiC
  UvPy9VSpx3pjdQkQBIUUZpHtwIWGxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMKxEGNIU
  nM68EbtMroCOYgI4wspYHOaIkESEl1cDkvkrbuv6+9RFN9vNPBR5mXORXtv7Lah/40/LCtY65
  nbnXX2Y+u/TEvvrno4xfb9Zws4YfPeNw63hhQu8ZluVWz2U1Jgu2e4abnvBQPnrjrNCT2Ju/v
  +gf3Kx7d8uqN2FqNZt7nrDy6C7+/V/zssfRH11Pf65tfi5/ZmWVwEej2SFH/Th2nzNo/nHTPO
  h/UNnGk5PmcDxudua2Wm/c+euegT/n+sJz55fWZtzg3F2qWiTk5yLxpPCpY7pvw+py9VeLWn/
  +1Fc5d1TWct6anRybFQRu3Py1We10NcOOkjcB7/w1trWlP5/0u9vOSqVvXpyr8tVnsx6+nhdw
  em700pdWugvurFT1yfa4eXfishD+AiWW4oxEQy3mouJEALei7UBoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1663064389!115801!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11682 invoked from network); 13 Sep 2022 10:19:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:19:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 443A11000CE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:49 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 34AD3100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:19:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-oauthlib: upgrade 3.2.0 -> 3.2.1
Date: Tue, 13 Sep 2022 18:19:03 +0800
Message-ID: <1663064344-3276-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
References: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98780

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-oauthlib_3.2.0.bb => python3-oauthlib_3.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.0.bb => python3-oauthlib_3.2.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb
index e7f7f0b47b..8cc30489bf 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
 
-SRC_URI[sha256sum] = "23a8208d75b902797ea29fd31fa80a15ed9dc2c6c16fe73f5d346f83f6fa27a2"
+SRC_URI[sha256sum] = "1565237372795bf6ee3e5aba5e2a85bd5a65d0e2aa5c628b9a97b7d7a0da3721"
 
 inherit pypi setuptools3
 
-- 
2.25.1


