Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF6BC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:14:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.3106.1663064050763723160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EJwK6Efg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064048; i=@fujitsu.com;
	bh=ECjKoyIr7iuQWhwTKfvD+od7VJChogWZIzAs92KBBO4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EJwK6EfgzVBuilUWDfJe6FgN4locB2sRqgsDUfCn4LUvG1lO/4IAFT1ZLaRPf4TQx
	 Rbh82ItoefVJBcmS4zA6d7Ym5TPIP7p1CIpiOp0sktIlZ3MtoFAgR3WkwnEcvoXHMy
	 Gspq+96v5hqKGx0bmafdYA/FLfexj6493MoH5I3T48f8cNj8lmSmb4rd2X2R0Xdi8Q
	 lyWsowZ+ItjSmg+JDdYTXHwkxs/tdjcIajkwcLV4J0NDrtre6gC7U7jdCs9iv2dQZp
	 95B7NZuFJbfLRufr1KxzlVvSnPuJZFbAhDI8TSjBIpJSTVddXiW62gB4ZkzuTwI705
	 PyDsVbKJI2AZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWfdDuEK
  yQdsLQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePr8h2MBVN5Kl7vecHewPidq4uRi0NI4CGj
  xMot31ggnCtMEodvnGHsYuQEcvYwSiy9ow5iswmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  3sXIweHsICHxK25fCBhFgFViYknH7GD2LwCjhI73rwGK5cQUJCY8vA9mM0p4CSxY8omVohVjh
  J7ni5mgqgXlDg58wkLxHgJiYMvXkD1KkrMvtzMAmFXSDROP8QEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWibVJSZnlGSm5iZo2toYKBraGgKpI11DU2M9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL
  9Yorc5NzUvTyUks2MQIDOaU4vW8H48Z9v/QOMUpyMCmJ8kZ6KSQL8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuCNDwHKCRalpqdWpGXmAKMKJi3BwaMkwssTDJTmLS5IzC3OTIdInWLU5fhw6MpeZi
  GWvPy8VClx3pneQEUCIEUZpXlwI2ARfolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK9EGNA
  Unsy8ErhNr4COYAI6wshaHuSIkkSElFQD086qqOI7/vvyHjMq79Y/EMsX98p0XsOkFa83hIut
  cFNljll25Iz/9wfx7ac3N8YX6Vn8uiR6YF7VK7/m+TpPK14l39p6aOkju8MvhW1DPTP/1XQsC
  rv4xkPavv5KwaYrV1bxSzm/7LKQcLkxW2lFz4+JrfP2hRrpvTNYcKtzOVfOj5hYyWM+56ZcVF
  vi8ShjgX3nokMNotu+OacW19Tbryj7+i1+qWbuHI3tdbOzvpvvv9W+ViPc72JpfNoixvJXlZ6
  TojxCw1l3G2nrGc34ciJw7szb3rmstwIZKqUSs0VWT7ly7dVFpy2bzYy0V87pmFh01SvY93Pc
  ixKR0I7/M5euvcRr/Gxv7irdo+a/tiuxFGckGmoxFxUnAgCb9g7oawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1663064047!15325!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29704 invoked from network); 13 Sep 2022 10:14:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:14:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B1EBE155
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:07 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A54EC150
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:14:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 42.3 -> 42.4
Date: Tue, 13 Sep 2022 18:13:51 +0800
Message-ID: <1663064034-3136-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
References: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98758

Changelog:
===========
This version switches the power state API added in version 42.3 to be backed
by the experimental PowerState property in bluetoothd. The API will not show
transitional states if the version of bluetoothd is too old.

The battery API now exports the battery information for all Bluetooth devices
listed in UPower, not just the ones re-exported from bluetoothd.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_42.3.bb => gnome-bluetooth_42.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.3.bb => gnome-bluetooth_42.4.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb
index cf73f823c8..75e1244f8f 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "c37a2a07f77d4816b261e6c2086a056ed9767c3881dfabc826f4f82f6e1aa302"
+SRC_URI[archive.sha256sum] = "1d6fcf1cdb6cc9923ab334a2c0bc37a2c1bba9d18de153d484eedc04f3c0bcdc"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.25.1


