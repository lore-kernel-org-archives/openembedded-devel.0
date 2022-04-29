Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9433C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:21:22 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.29354.1652084464332646719
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lVOI7g/d;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084462; i=@fujitsu.com;
	bh=hd6bQYWf6O6PHO9EANyYhMzTkEa3d5xXeNaPBmiIAuM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lVOI7g/d7GfBum3G4eKx+Fv6EU0b6mj9jGIeTFVmdXlHalNSYIhQPy14LzGctXt60
	 vDA4x+tE3WD2JsNNq4oe2syQ0M7ukLqX93QYDIovrDPsqid2T0FN8RfVuZEPV6dgGV
	 KZBjKrSITYdZMV6hH8y63hwZLhEyXEQAmmMs1m721TjYVTpvV6IcZST9M2hXiCQbuM
	 tpuMHNvCC/vTMw2ernh7B52OWzig3COpHVvfHRIdcIO2yVIQpZKnYH8M76qbbos5cW
	 TpHnKUVgi7kff96Zp8OmiEoYi5f+d5YA2S7X258Uu7NsnzpOCEDl00Qaelj60ojOik
	 V967T8iPWcu9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSffduYo
  kg99TBCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozbPY9ZCk6xV+x/u4StgfElWxcjF4eQwBNG
  iQNbXzJCOBeYJLZ+vMsO4exmlOiZ/ROojJODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFbiQ+nOphAbBYBVYlnf5YCxTk4eAWcJHY89AAJSwgoSEx5+B6slVdAUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjVVJRZnpGSW5iZo6
  uoYGBrqGhqa6JrpGxpV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmBQphSz
  vN/B2NT3U+8QoyQHk5Iob2VTRZIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6HU0A5waLU9NSKt
  MwcYITApCU4eJREeO+eAErzFhck5hZnpkOkTjHqctxduHcvsxBLXn5eqpQ47/ezQEUCIEUZpX
  lwI2DReolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8dyBSezLwSuE2vgI5gAjriY0ApyBE
  liQgpqQam4rbFP/vm/GDl/bR3Yqe5fu9rpim3Vxp9WtAyYb6Y+NP3ub/ZWxZ4PDTr+Bz46vi5
  ZXrLHlZEi7s++NR/9N9Lvpw/VjFpc9h9r3713+aVpLM46ee5neFFvbISx/TkzD0887bkCrDqS
  XxnjJVatnT1wvApWst99Lk2nernnPKz/+Bv+b0+j7meis1l9jc4kyoVLZywjslJM2f53W/CJi
  2pMxPbfvXvepezxPdH3akfi292VZplJma+3P/B9255a6Wj9TdNkeqTdvzbsv4x7g7slBQ8HBf
  2oF9xw5bDHvNltlscmdXf8mED5wfLi9uWHpmgnaAfJfbs7KbbiomHJ7nlr5i7t/5ZK2vujMZz
  171YlFiKMxINtZiLihMBDEei4VEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1652084461!155330!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27569 invoked from network); 9 May 2022 08:21:02 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:21:02 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C1BCA100441
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:21:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B4D3F1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:21:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:20:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fwupd-efi: upgrade 1.2 -> 1.3
Date: Fri, 29 Apr 2022 16:02:57 +0800
Message-ID: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96992

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-bsp/fwupd/{fwupd-efi_1.2.bb => fwupd-efi_1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.2.bb => fwupd-efi_1.3.bb} (95%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.3.bb
similarity index 95%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.3.bb
index bcad2416c..b53cabeae 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
            file://cc.patch"
-SRCREV = "8de5918507dcc797e612aac688d6b60b90053f54"
+SRCREV = "36ce593f58e391cca43fd388824496ff98d83480"
 S = "${WORKDIR}/git"
 
 DEPENDS = "gnu-efi"
-- 
2.25.1


