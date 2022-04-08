Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92956C3E8A8
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.25620.1649651027016916244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 21:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vR63P3iJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649651025; i=@fujitsu.com;
	bh=1i2ejv8d9aYVM4Z0nfrVkuAbNt0cSj8chOqVVWjWNH4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vR63P3iJbwpHiB/8Dxy21cNc+vZQvyfwHyLPHf467qxieWsxRYB6Ucd/DCD01kgQ1
	 4s2AQkGIxX0x1qAX+tkH7JBM0X33RbPvmnWgwMl3wmJUg/6UOoiEtkyBLC2skAywny
	 0sSdTQpwHDqGlCqLDshD1C146PVgGbiXAwC+vxG4+u1b/bJ0WQD94QkU4mFM8L6vEw
	 35HOhb2ZA5rDsYN/Rw+IiKIIeYPvhIhIBwdJITbm0V2qmdYzprp/DN4p85bQXctcIm
	 LM4OBEbA66rLOp8IBqql+3h1FgHw+zmTuzry/OeRJDLLFuoAw80TOtymGpEztMGIRy
	 EbcmW6qY7DLoA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MRohuwNjj
  J4OlFVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPrzJvMBU85KlatmMDawPiNvYuRk0NIYDaT
  xORPxl2MXED2HkaJ3d0TmEESbAJqEtNv3WAFsUUE9CWWzt4DFmcWUJF48bsHrFlYwFHi092tY
  DUsQPGXHauYQGxeASeJmys2sIDYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmCFqFCVmX26Gqq
  +QmDWrjWkCI+8sJC2zkLQsYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa6hrZGiul1ilm6iXWqp
  bnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGGIpxYw3dzC29v3UO8QoycGkJMr7PTwgSYgv
  KT+lMiOxOCO+qDQntfgQowwHh5IEr/yq4CQhwaLU9NSKtMwcYLjDpCU4eJREeAOWA6V5iwsSc
  4sz0yFSpxiNOa5eubKXmeMGiBRiycvPS5US5y1fClQqAFKaUZoHNwgWh5cYZaWEeRkZGBiEeA
  pSi3IzS1DlXzGKczAqCfNKrwGawpOZVwK37xXQKUxAp4RuCwQ5pSQRISXVwDS9eaqrxYYfflE
  h3qca0/t2TmFbNNe0Q9eg1qJB/DnTtkm3Tx/WZjjVkMD0cPuZNUeCNTbNrll+WLosbdPRd+zM
  Od+OtUxu/yYhs6qk3cZ0ueTFz3s6dlg891nNuv1hmcl7X8fUYNlGwyk/IzcvfzTVSLHwbNvCO
  f+2JvJ9KVlV03dUujPqfNfZxZLf2/QX8yxZ/zNo4vppX6pWnarsvhh+vvvmI6cny/iqJ9Y/nn
  TqqeWsozfr8n94Xbpx54/bDaUbdo4n2v/4yogqMny1fzhlk6GT3qGCPun7y/6aRDzc/S2J6dK
  ZowvfcB4v0bT/xZpVkn4xtvP121eNL0MDjiSq6t6br6wSckz68OINURVuSizFGYmGWsxFxYkA
  t98lPD4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1649651023!199002!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15454 invoked from network); 11 Apr 2022 04:23:44 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 04:23:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23B4NaLN007659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:23:43 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 05:23:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] haveged: upgrade 1.9.17 -> 1.9.18
Date: Fri, 8 Apr 2022 19:20:09 +0800
Message-ID: <1649416811-29165-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96542

Changelog:
=========
Round bits up and target full pool size
Specify the right kernel commit in README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../haveged/{haveged_1.9.17.bb => haveged_1.9.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.17.bb => haveged_1.9.18.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
index 25007c7773..069fdf7bc2 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 # v1.9.17
-SRCREV = "1ff76272aba9803501e6f473dd5083f0e09289ac"
+SRCREV = "80ee9289569bc13efff4e0b5db3661cb513802b2"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 S = "${WORKDIR}/git"
-- 
2.25.1


