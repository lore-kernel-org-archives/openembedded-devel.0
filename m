Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5271C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:15:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.3034.1663064156825315569
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WI3tPWdD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064155; i=@fujitsu.com;
	bh=YV9Sl6oDv+WPqGrpbeTMx34HIg/lTDRF+D7i2M+V4/g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WI3tPWdDpVp2u4w1Q8DcITWS9qkZJ0EfnsNnuNziKHkVM5/m73IQ1sRalMCM5RfjF
	 l4gVBBXUE5rcad0rgWUS610ZrGL6oll5iiHoppYUGMgRNGOhrwQRXXj/1r8iQJE8mx
	 itUX2gwmB9jbOkdDcEYyjKkQKmWdABK6I2xKH4m7lsMtND4VEE8RzNbLPbQcstPLct
	 oDI7rdad9CIEdbWZiJ0uqf0NC41yt3K7kX1AbkVGLkLhZxHI1w5BSHp7JrKgBJnLgb
	 EnUyYxKiaZQ6T1tZoR0h7t4WnQfOeOBKH9xdc+XCsnV8Nqd5ep/CA6SpH+kU/3wVNY
	 1051kAwcVgbow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8OxWTcqQiH
  Z4Ml9RYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP24fWsBVv4KxZ8O83WwNjK18XIxSEk8JBR
  4vzlv2wQzhUmia5fv9khnD2MEtu/HwdyODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHr
  EZYIEJiwuQrjCA2i4CqxKfXr8FqeAUcJd7f2cwEYksIKEhMefgeKi4ocXLmExaIORISB1+8YI
  aoUZSYfbmZBcKukGicfgiqV03i6rlNzBMY+WchaZ+FpH0BI9MqRtukosz0jJLcxMwcXUMDA11
  DQ1MgbaRraGqsl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERicKcVpM3cw
  btn3S+8QoyQHk5Iob6SXQrIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd74EKCcYFFqempFWmYOM
  FJg0hIcPEoivDzBQGne4oLE3OLMdIjUKUZLjqmz/+1n5lgOJmd+bTvALMSSl5+XKiXOO9MbqE
  EApCGjNA9uHCyaLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5pUIA5rCk5lXArf1FdBBTEA
  HGVnLgxxUkoiQkmpgqpmb9/Re4RWxp5lOXBlHbkaZ/JHfbzWnMTfV/POpkv3Jm3/qiFZEHLi/
  z29fu+j9Dcu7NhwJV2/oe861Uk11rkSINAfjTef9n65VvciceHezCpeV3dan4S7z+lZuORoS8
  XeK+BvjjRsO8ZqYPZZad9pmbpzHi02bwzu2OVgJrWSv1fIu5/Hc6bj/+doPHgGiy4qXBubnbD
  G40FVzXmdisNTqMzlfP1xRWhVSWFXAIrHoL7s7s6nxT8YEzWUcH+WFd26Y7pT17GT7rN8vmAL
  YFrF4pE+UfKiaqOr4gfnQ2sM5+dvkgzVKz3wRuPzqX8XF8o3W8gdabFYdzl997MyJnGs23svb
  ljA/3ff6ycvzSUosxRmJhlrMRcWJAD7mUeVhAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1663064154!307858!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2893 invoked from network); 13 Sep 2022 10:15:54 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:15:54 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ED2D0151
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:15:53 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E0BCA150
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:15:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:15:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager-openvpn: upgrade 1.8.18
 -> 1.10.0
Date: Tue, 13 Sep 2022 18:15:39 +0800
Message-ID: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98762

Changelog:
=============
* Add support for "allow-compression" parameter.
* Fix a regression in preserving the "tls-auth" settings.
* Add support for "tls-min" and "tls-cipher" parameters.
* Include the new gnome-control-center name in the AppData file.
* Drop libnm-glib support, nobody is likely using it anymore.
* Fix importing profiles with a PKCS#12 CA.
* Make sure the plugin object links with glib.
* Dropped dependency on intltool.
* Updated Basque, Brazilian Portuguese, Chinese (China), Croatian, Czech,
  Danish, Dutch, Georgian, Indonesian, Polish, Serbian, Spanish, Swedish,
  Turkish and Ukrainian translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nager-openvpn_1.8.18.bb => networkmanager-openvpn_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.18.bb => networkmanager-openvpn_1.10.0.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.18.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.0.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.18.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.0.bb
index 1d0c38e035..1fcb435395 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.18.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.0.bb
@@ -10,7 +10,7 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "53dfb0acf64478adc728074f162f62e60bff62a605bd897eb88b267e7057927a"
+SRC_URI[sha256sum] = "5745d4107f3398a97afbb93f69239b510c9e45eb7fb62d60d9ed0a7297f4d101"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.25.1


