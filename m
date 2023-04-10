Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC90FC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:33:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.39512.1681115629934735352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FGqFB/pL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115628; i=@fujitsu.com;
	bh=r1KWKTapNtNX5kW/gomAdabZSCD5Sq08GPiPw71CP6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FGqFB/pLuyakzMwQFKsHmkfQVfv7KrVv16d8p1bHYjZRo7/OkPD4EPA+7OxjThx2o
	 K7rklzOBHq8DNulzz9glBG2Y96fHt2hxIZpuLPVIObNWcBZzyzKrjh+mZClvbaqXgo
	 XrkWe+kq953MReeVS785pU14r2/bgQ3himBV6XCnvvwqsvCVStCjTmWRlQPDW6r43M
	 dBf7QCVDYmhlA/dVgt4QPJFZ2aHISJHGhXkOlitpazSOu2ERUBcWGqL5m/xk5pO6XD
	 W3MRwmMD7mCCjBbLX78hkjQizgPn9jthOFJ4YAXEJSXje8otFrA3SlMNJwFC70YDqD
	 v8r8jt4bmh40Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqPv6pHG
  KQf9jc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPn/Af2gj6uiikP+pkbGDdxdjFycQgJPGGU
  uHrhHTOEc51J4s3B6awQzh5Gibczuhm7GDk52ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwkzj/awuYzSKgKvH+31Owel4BJ4ldO9+CxSUEFCSmPHwP1ssp4Cyx68gGsBohoJpFv5
  8wQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3pRitV07GCf0/dU7xCjJwaQkytvFZZwixJeUn1KZkVicEV9UmpNafIhRhoNDSYJ34
  QGgnGBRanpqRVpmDjCSYNISHDxKIrwVx4DSvMUFibnFmekQqVOMilLivK0ngBICIImM0jy4Nl
  j0XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLvtMNAUnsy8Erjpr4AWMwEt5nIxAFlckoi
  QkmpgqulSZveWdTBQKj+puqXOnfFxuliZko0b8xTugIzSq3cu6p1g9TNXt3GbdnjK9Dl/bvka
  /C1PbdrJUT17v6eYowfnFa5Z7urPytSflkWm6hzd8qdqR2b4hFM9VrNZrpS4rnkiKNptIHSnR
  Oh04+aG07mTD6Rc0i58ptSQdNNzW1D25wu37+zJmXvpqHn1WYFTWfctXuTr7ynOX7j2wYsHi9
  xProj/edW8dXP5+YXlWzdUPGSYYns1uKBDY9HJB2+P5BdfDnmywNLZOq/aa82/u5fvxLeq7A6
  c17xvaePx5IY/DS8/7nZ91m7x8lG3dd6umNbECd7Piu5ciNuhzxqyZutEttWn3Wxm8zO8kMr2
  UWIpzkg01GIuKk4EAHwRBstZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1681115627!289502!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6647 invoked from network); 10 Apr 2023 08:33:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:33:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 976761001B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:33:47 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8AE6A1001B0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:33:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:33:45 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 2.0.7 -> 2.0.9
Date: Mon, 10 Apr 2023 16:32:11 +0800
Message-ID: <1681115532-24518-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
References: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-sqlalchemy_2.0.7.bb => python3-sqlalchemy_2.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.7.bb => python3-sqlalchemy_2.0.9.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.7.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.9.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.7.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.9.bb
index 2d1cc5ed3..743d76afc 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "a4c1e1582492c66dfacc9eab52738f3e64d9a2a380e412668f75aa06e540f649"
+SRC_URI[sha256sum] = "95719215e3ec7337b9f57c3c2eda0e6a7619be194a5166c07c1e599f6afc20fa"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


