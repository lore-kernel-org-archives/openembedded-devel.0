Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD74EC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:20:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.8545.1664266827390911248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H7U11d/m;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266825; i=@fujitsu.com;
	bh=TRcM5Eu6uWgMO/emHp6Il3lGwM/rpw+XMeETNCuCH50=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H7U11d/mpUYlIQDrfA4YXPMf0ffkwAgvNNI+KQ/W8LyJuqNg8JsoC+bMk2h/Ue9NK
	 9tIPN2XGkdF74g9ScQzh4//Y5CbwA8Zub9cB7Ym7PMEEu9puoaaVX6Q0qLqaH6h35E
	 IcQdcw5h/zjLXAXuVy4PJbQX8QuHQ5qyW7reDXZHNO4035YE8eyIyTxmNxCiq2XjHo
	 Dao5FzkFM+EAFIHJ8TBIMSQV3nC65YKEcotpbBEIDlHFtb5G4puzAAs6csmN24/8Sl
	 GAVsdZ8TBATbpE/wm2YyOWvAQvQCQOyOEGDt9d4EASW0w92KU42usCHELCzInZfByZ
	 xsfC68SailaDA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqOu5ySj
  Z4Ph2aYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP3rUMsBe+5Kmacl2hgvMPZxcjJISTwhFHi
  9rn6LkYuIPs6k8S7NRuYIJw9jBLvVy9lB6liE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAUeJpg37mEBsFgFViWd/z4LV8ALFL186CRaXEFCQmPLwPVCcg4NTwEni5PIwEFMIqKR3iT
  5EtaDEyZlPWCCmS0gcfPGCGaJTUWL25WYWCLtConH6IaiJahJXz21insAoOAtJ+ywk7QsYmVY
  xWiUVZaZnlOQmZuboGhoY6BoamuoaG+kamuglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibn
  pOjlpZZsYgSGb0qxAt8OxuZVP/UOMUpyMCmJ8tovMkoW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MHLtB4oJ1iUmp5akZaZA4wlmLQEB4+SCO+6JUBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpU
  qJ887cCFQkAFKUUZoHNwIW15cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMuXQs0hSczrwR
  u0yugI5iAjrDj0wc5oiQRISXVwLTeIyfD/vqRoMbkE2Gc0yXrpdJd6iLfZvU1LFsZELl5kwzj
  3y3c+qIXJ14vu7fj/KeEtTZG7xm2KhfP47Bc0Fajf73Rfuvu7cfzf/Bf/dR87N5l+w3CF/fYX
  iqd2MKVnXryC1fe32th/LosXUw3vzt93H0vqnxP9Z8KA97vW0wPxBV4LmuTPT9BQED6133Www
  liGUEbjx1bGWI42e2Ikbo595IPYd0HTSwK0zt12nV2qSxSktR46BLQzG/eteZoHoep0ptritk
  Z0ceE2VuCteodNhm4Xftwpp1tp2ap6ZznCnOktl9cw/R8kktwR9oczTMcBpqzWx+/vvqySGb6
  rxb3Fzqz52z25n7/JYnfTImlOCPRUIu5qDgRALoQwIBmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1664266825!489226!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23989 invoked from network); 27 Sep 2022 08:20:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:20:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 286FC100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1C428100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:20:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libpeas: upgrade 1.32.0 -> 1.34.0
Date: Tue, 27 Sep 2022 16:19:51 +0800
Message-ID: <1664266791-2194-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
References: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98963

Changelog:
==========
* Resource-based plugins are sorted by module-name before loading
  to aid in reproducibility.
* Sorting of plugins with dependencies has been altered to improve
  sort-order with more complex plugin dependency graphs.
* Translation updates:
  - Hebrew
  - Georgian
  - Bulgarian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpeas/{libpeas_1.32.0.bb => libpeas_1.34.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.32.0.bb => libpeas_1.34.0.bb} (88%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.34.0.bb
similarity index 88%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.34.0.bb
index 944b21d1a9..1bf6752e87 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.34.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "d625520fa02e8977029b246ae439bc218968965f1e82d612208b713f1dcc3d0e"
+SRC_URI[archive.sha256sum] = "4305f715dab4b5ad3e8007daec316625e7065a94e63e25ef55eb1efb964a7bf0"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
-- 
2.25.1


