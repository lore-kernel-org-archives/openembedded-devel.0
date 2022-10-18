Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF640C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:16:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.1843.1666055783528757550
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IbbMaPVg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055781; i=@fujitsu.com;
	bh=OIBsyz6H3rRaUhtXtS1N2RYjf8bxKIIlxW7yEC50+jU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IbbMaPVgXfuhLv5VTBV/+TjRt/bprEUo3wnjqvQ/dDObhms93oHJxJfarppfOA0iL
	 tMwpa2BV31ULxO3ULdUu0mdR7kKJK0BkKx/fXROIXlaiTuVlICKSo7eo6L0YqbEXTj
	 JB2hIbcxkjh2j71rzLcyPNzW2FMv0AavPRdLHt+QKhW0/kS4T3F5V+EAaYhRyPkOyf
	 WgzkorfwhyG0wYxJWOiHiJywS660zIzTgVm4iHg/tVQHP7vU1bebqmQpIwx+QIW5hP
	 G4gryoU60sL+PaeViUaujAQcnjR9WJM8Oe/fERKuQPyEBceEzbxQPlJ27kxgzQOt/q
	 +Ud9uOSGCOSxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqJvyzzf
  ZYPpdY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPK8mUsBTN5K96ev8fWwNjG3cXIxSEk8IRR
  YsWMI4wQznUmiZ9TbrJBOAcYJTY/eA2U4eRgE9CVePFjMQuILSKgL7F09h5mEFtYwFxib9sdV
  hCbRUBV4uLTx+wgNq+Au0TXrXlg9RICChJTHr5nhogLSpyc+QQsziwgIXHwxQugOAdQjaLE7O
  nyEOUVErNmtTFB2GoSV89tYp7AyDcLSfcsJN0LGJlWMZoVpxaVpRbpGprpJRVlpmeU5CZm5ug
  lVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGXUox0/MdjGeX/dE7xCjJwaQk
  ytsxwzdZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSv1h+gnGBRanpqRVpmDjACYNISHDxKIrxRZ
  4DSvMUFibnFmekQqVOMuhxXr1zZyyzEkpeflyolzhv/F6hIAKQoozQPbgQsGi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEublALmEJzOvBG7TK6AjmICOyNjvBXJESSJCSqqByfC0javApcv
  Rk49ksl+MTDacsE604++ld/P2dVr/+Hi4STugYsHT542zxLerZrs8PuCpP+/hR3G3VMHbHHMY
  V7jzh7943OYmuvCco2uK5h4pMysuHe4570+su5sjaeQnO2G/d/yD67MdTOOvKf68a//LxPP5O
  T4JpW+Cbgt7z03NZVBZxPljlk49933OuM3c6axce5iW5PxgjbhbpnW+sWr9V6WQH/tyO6WE5+
  qd2PhliqzpOYGezYqCHqv2/N4ataWVo/POppjuZRPUdy2vFVWRqC0w8Vi4uZ7PNPQZq+Naj3l
  HZK9qvvPJqtJYaim+17VOw+DHx5VswY3KmpXLJfl8FF0+Oi1Lsw+/vCxSiaU4I9FQi7moOBEA
  HEdJa0EDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1666055780!406962!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8429 invoked from network); 18 Oct 2022 01:16:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:16:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7797D100191
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:16:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6B9E910018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:16:20 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:16:19 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] tio: upgrade 2.0 -> 2.1
Date: Tue, 18 Oct 2022 09:16:11 +0800
Message-ID: <1666055771-2470-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99228

Changes since tio v2.0:
=======================
    Fix output line delay

    Apply output line delay on lines ending with \n.

    On most systems lines ends with \n or \r\n.

    Do not print timestamps in hex mode

    Improve input mechanism in hex mode

    Print the 2 character hex code that you input in hex mode but then
    delete it before sending. This way it is easier to keep track of what
    you are inputting. It basically mimics the ctrl-shift-u input mechanism
    that is used to input unicode.

    Add support for sending prefix character to serial device

    Do so by inputting prefix key twice, e.g. input ctrl-t ctrl-t to send
    ctrl-t character to serial device.

    Clean up indentation

    Update example tiorc

    Add bit reverse order feature

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_2.0.bb => tio_2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.0.bb => tio_2.1.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.0.bb b/meta-oe/recipes-support/tio/tio_2.1.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.0.bb
rename to meta-oe/recipes-support/tio/tio_2.1.bb
index 54e448b6d5..1c36bd522c 100644
--- a/meta-oe/recipes-support/tio/tio_2.0.bb
+++ b/meta-oe/recipes-support/tio/tio_2.1.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-SRCREV = "6618642acf28fec6d3e70ed75b50d4ce138ea08a"
+SRCREV = "14fc77ffc13a4c60a98f0bb7e0f431e9ed7cf1fd"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


