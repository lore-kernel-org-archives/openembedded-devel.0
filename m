Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A53C43219
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 06:22:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.17065.1665555767875088618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 23:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kShICiFh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665555765; i=@fujitsu.com;
	bh=jbgmnqAjmuHqzYT5qneK9eS8L8WjAhY7DCGOqid4huo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kShICiFhySdlufuQR6OgrpO14Zua+1L6XvrmOdHWhIQfQjHuekdkeNzMhSvUNGPMP
	 o4vcYORWc70XykUzXVcDeKOhl35tE1adznahSpE+YgI5YGtBIVyA5ymU1cwinPJzmw
	 9UrUUvNhDJFERh/BZfRdDaIkCqMAQjcB3UzJZVqi96mV0b0g1OVbPlHu+xLBo+QAgF
	 OZ1qqVNfUYsrwo9SAS4bo1zTRAVPVa66uJicxXvz54jxL1uWwWT1fKtQV9kmo7gDt7
	 ZnQ0toXjup+MrHGeen63YRAFBA0OtQLiAhTr+iLvSVeREPVCl2RiVWGp3Bq/JonDv+
	 HZTEtTxl5Mfcw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORqGsa65Z
  ssG+OgMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF+y062goOcFTM/izcwnuXoYuTiEBJ4wijx
  5sR3ZgjnOpPEwd0TWCCcPYwS647PBHI4OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWsJWY+HEOWA2LgKrE6Y5HjF2MHBy8Ak4Sy9qzQMISAgoSUx6+B2vlFRCUODnzCQvEGAmJgy
  9eMEPUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWibVJSZnlGSm5iZo2t
  oYKBraGgKpI2BtIVeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYGCmFKeX
  7WC8uu+X3iFGSQ4mJVHesBC3ZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvP4gOcGi1PTUirTMH
  GCUwKQlOHiURCDSvMUFibnFmekQqVOMuhxXr1zZyyzEkpeflyolzpsbA1QkAFKUUZoHNwIWsZ
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMyRANN4cnMK4Hb9AroCCagI05edQI5oiQRISX
  VwCSgcTs57rtoydIvk5af9C1RzL6s9Td/96Lkwzv87ywWit00tbzcwrPwU/PyP6Y3vue4KszZ
  fTXZ0/367aXP8/dHOM/xfmOTu++8oMTLnP9zz6YVsH2VPMS95omqzIbdMp//LVj8/7ujdcCxO
  05fFZqP251JrX87r7yxaXvd5DOlHBOmhGQdbWbirr8vNUPqguaXPdMEbU23BN27GFWpXmtUvW
  wJU3x03YxDZz2jtWw3v/+pXJY8hePAp8JnK7dM/fWWtf57+TWz/it3JV7v++MhfSD1dt+j8mM
  xihx7Z9V9Sy5xSFQ+sUW3NVUy0udglcWJX5r21jeZD7WcWbqwl6Wdbcl1O+Wy3S8kWPt+nEtW
  YinOSDTUYi4qTgQA8jLQ01MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1665555764!171517!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20036 invoked from network); 12 Oct 2022 06:22:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Oct 2022 06:22:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AF01410019E
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 07:22:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A2F20100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 07:22:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 12 Oct 2022 07:22:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tui: Add nativesdk
Date: Wed, 12 Oct 2022 14:22:29 +0800
Message-ID: <1665555749-24339-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 06:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99143

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index f170b9f824..9f961882af 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "bac88927b253cdcfe0d06ac7dc5afb876cd2d996"
+SRCREV = "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
@@ -42,6 +42,6 @@ RDEPENDS:${PN} += " \
     dnf \
     libnewt-python \
 "
-
+DEPENDS:append:class-nativesdk = " file-replacement-nativesdk"
 BBCLASSEXTEND = "nativesdk"
 SKIP_RECIPE[dnf-plugin-tui] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
-- 
2.25.1


