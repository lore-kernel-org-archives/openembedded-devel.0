Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2859EC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:33:29 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.22604.1647419592253135776
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Bmc2WggE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419590; i=@fujitsu.com;
	bh=Ueel+rI6X6+pkfmC47S79+dNyeH5MlwMnWbHToR7QlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Bmc2WggE9S6k8yJ2KicSaV+DYuXM56dA6IAINGxQJhorH/4va2JX8nINy0qhpVxAG
	 OeOd8ZaSdYX6hhd4jMIoD7ly4uL9IJ86zoUna1rH6raAKmDoVlKInvTJEc/6hOcmmQ
	 8qY4IhTdLSHH7+96aXjCeW2hW/THdGkypYjY9yYaMxMLIKuLh5T+Tdby3gFyuToJJv
	 LhksJkEA4kXNHiuXKqWjWsMbGNh7BJ1Ii6xeZZQ/7xwSBLQ6YpNuWWIzF13HGC0NBu
	 cnaZfKe5QOXDu7RL2rNP7WN5IB3DVfNIr6MNCl9A//sP8BT1+awSp/2hEQAQKkLaQn
	 /Az60ltmpcDSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqHt0gWG
  SQd8ya4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNqYzd7QQdPxfyzp9gaGKdwdzFycQgJPGGU
  eLnlCjuEc4FJYu+cn0wQzglGie6m52xdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwtESPx9cxesnkVAVeLApbNMIDavgJPE7TlHwWwJAQWJKQ/fg/VyCjhLTJqyhxHEFgKqmX
  r5KzNEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNqiZahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiUVZaZnlOQmZuboGhoY6Boamuoa6BqZGOslVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgSGcUoxw+cdjAv6fuodYpTkYFIS5T0/0zBJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTv7jlAOcGi1PTUirTMHGBMwaQlOHiURHhd5wGleYsLEnOLM9MhUqcYFaXEeRlA+gRAEh
  mleXBtsDi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY12YG0BSezLwSuOmvgBYzAS2eJ60
  HsrgkESEl1cCUxfqNpWMZ99mS5VvSSs9sPdhfuf3w7c8/LL9/f7ek6fTr8h01IXY7l575dP5q
  96NUhQML106e4TpnS7QFU8PJi/c7he68ke6IKZjoNls/4j0X63Pdq35WK5V3f3ha01I955PMm
  mvvmbs7q+34jgnUyj9WCrqmM4FP9dzplw0daanbWk8FPIhncDn375uQ42Vz/lKxmX8Taq98DB
  A4t+xhZYTOh4ey7JPMmjap7P7/OubIob8BRrmP5ecL3IkMfrHt2KbF2vYzYt+rzv+a87ZY1Ob
  301n3F1Yuct+5hsVt7Unr3W8WcT1ff4prsm3jTUYeJ6OGzXMyKhjvP3lll//o67wGVRe+E7pM
  SbJlnnySi5VYijMSDbWYi4oTATiI8FZeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1647419589!7666!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27979 invoked from network); 16 Mar 2022 08:33:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:33:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6AD6E1001AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3E2FD1001A2
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:33:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager-openvpn: upgrade 1.8.16
 -> 1.8.18
Date: Wed, 16 Mar 2022 16:32:40 +0800
Message-ID: <1647419561-81555-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419561-81555-1-git-send-email-wangmy@fujitsu.com>
References: <1647419561-81555-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:33:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96009

Changelog:
==========
* Gtk4 version of the editor plugin is now available (for use with Control
  Center of GNOME 42 or later).
* Update Catalan, Croatian, Czech, Hebrew and Slovenian translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nager-openvpn_1.8.16.bb => networkmanager-openvpn_1.8.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.16.bb => networkmanager-openvpn_1.8.18.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.18.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.18.bb
index 8951d9cd17..1d0c38e035 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.18.bb
@@ -10,7 +10,7 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8920de09c7ae5f1f520c83f844455db8faec31427350268fe2dd95b860f91fb5"
+SRC_URI[sha256sum] = "53dfb0acf64478adc728074f162f62e60bff62a605bd897eb88b267e7057927a"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.25.1


