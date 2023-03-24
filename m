Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426E3C74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:26:23 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.89842.1679617580324216380
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IvX5msmh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617578; i=@fujitsu.com;
	bh=nsk3fXARcem15CpIWpEWVl1RE5ogca4JJ9rLeo0lR0U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IvX5msmhZWH0dLv7sxEbyn7/QdyWdoBXxB6L6J3yUrfCDkhTk+45oU8f1xz+Vs/P8
	 7TePl8OnoBAtOetqSCmnC0fz9uyQzeWDf7tW9R6XI6hdNToefrTElfAxRP2XY3wmux
	 gtlIZgxavfG/x4PXA6J/ItjV+RDD/90B51PgEbHt9H8MwKfJBRkteVHGjvEVgVbp2U
	 O3ZYR3b032PHoEoWsq9d7tY4/NgVny/1ZN9yuWRsZdY34Fh4ZxsO7VqUScT3bYHQ5g
	 t0ZlOWTgh/un1q64fEIk5Gy6p+X5amWibOLfoedDuUo6HPdqLN9h6Pf+CNfsX4/nFQ
	 jApDMCcBGcd4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpKvxTib
  FYOtUE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPezPWsBW/5K16s4mlgPM/XxcjFISTwkFFi
  6+GdrBDOFSaJqZ3fmCCcPYwSTxvmsXUxcnKwCUhJ3Lj/H8wWEdCXWDp7DzOIzSygIvHidw87i
  C0sECJx+F8/WJxFQFXiU9djli5GDg5eASeJpe88QMISAgoSUx6+ByvhFHCWuNI8jwmkRAio5M
  7hdJAwr4CgxMmZT1ggpktIHHzxghmiVVFi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkaz4tSistQiXTO9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAwE0pTni8g3Fe31+9Q4ySHExKorwSodIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4P7+RSRESLEpNT61Iy8wBRhFMWoKDR0mE99BZoDRvcUFibnFmOkTqFKMux9UrV/YyC7Hk5e
  elSonzPgaZIQBSlFGaBzcCFtGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz7nkNNIUnM68
  EbtMroCOYgI5wrgE7oiQRISXVwLSi86I7o1CKqIpI+1/9jr7rfyZV/b1scDxy5rLvPx6+5otc
  95lze/FeEQuhk5py9kb/zt1/8N6Kybr/xPTGeavFj4dMaDDYe3uSYQvLyhzFFKXpLYs+Pu23T
  DqxmOkEj+o26211cYlTixcFMWtOen/A++HvK0+PHtzuq53BnHRU78qUW08XrAya+vfopYfm7Z
  IuEzZZF4i8+K+3bC/D54uNr2b8YtM9o1cVP/fpurdcaV8mletGXMvnm1a59tPV1d/ZiycIzGJ
  l8f2fc+bbo3KLx83ap2qkX0XIb9NTX6bbveeG8lPFXFmunjMBff2n1nk/yBPrbqhaMe8zK09H
  4g+l166cj/SdVki8FPpkfnOREktxRqKhFnNRcSIAbwi0cGMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1679617576!20933!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17174 invoked from network); 24 Mar 2023 00:26:16 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:26:16 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3E4E81B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:16 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 32F271AF
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:26:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcompress-raw-bzip2-perl: upgrade 2.201 -> 2.204
Date: Fri, 24 Mar 2023 08:25:33 +0800
Message-ID: <1679617536-27169-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617536-27169-1-git-send-email-wangmy@fujitsu.com>
References: <1679617536-27169-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101674

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Cast isdigit argument as unsigned char
  https://github.com/pmqs/Compress-Raw-Bzip2/pull/9
  967696b4fa91768fa4d46163f46982bc063a175e

* Use GIMME_V instead of GIMME
  https://github.com/pmqs/Compress-Raw-Bzip2/pull/8
  54e3c1e18b61f0892056925240bbc80f76e2f038

* typos
  12496575c17829506cc9c9fa325e31aab1fcd1c7

* Trim trailing spaces from bzip2-src
  https://github.com/pmqs/Compress-Raw-Bzip2/pull/7
  8728d405e8d805cb88685b82a5e5493b62288046

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...zip2-perl_2.201.bb => libcompress-raw-bzip2-perl_2.204.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.201.bb => libcompress-raw-bzip2-perl_2.204.bb} (79%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.201.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.204.bb
similarity index 79%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.201.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.204.bb
index e7cc6a1699..1dc077d67e 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.201.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.204.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Bzip2"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=3cca53585f3090f28fa8401bf1db9179"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=85ab0f65a47c4c0f72dd6d033ff74ece"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6204b270806d924e124e406faf6bbc715f7bb461dfdbea722042325633be300a"
+SRC_URI[sha256sum] = "ee7b490e67e7e2a7a0e8c1e1aa29a9610066149f46b836921149ad1813f70c69"
 
 DEPENDS += "bzip2"
 
-- 
2.34.1


