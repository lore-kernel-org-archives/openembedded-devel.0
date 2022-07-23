Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CEDC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:35:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.2598.1658806530720272526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Omn+Ruex;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806528; i=@fujitsu.com;
	bh=FYGK/h3ZziUS3RECUouN8x2TwufhXhMzxWORuHQ1nZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Omn+RuexaVs7eTZ0JYTb32rRetv9bIJSLswdz/PCh/5Y2xxiCxi6xkeCwSaNPaXsh
	 24bR0TNSugf+kAXyxK2kSZsGDM7ehmuVCNUtcnsYvzjvra9MGZV2jlpvBn++N0yYKd
	 HDqwNtQrDn/qjsnTE6zxfam47lxG6BttF9RN05LNzGwbKH0fxy+y6/Tfe11uuxnGik
	 0AZthxoMEYmDLg3HT/Ilpp6uJcyu1C+F1GiLnJIE6e/24z1LLO5tROE7r6y2bFkMf3
	 kU8XUEwNFNHqGDaT9C+/xTY6bcXmbPEF5dRrtwg6U7edhcT7p5kII6ecufXnXAgF3B
	 WmKsz8BRiCPnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWZch8X6
  SwfNrohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bC019ZCtbxVPTtbmRqYHzH1cXIxSEk8JBR
  4uCbmSwQzhUmiVeX97F2MXICOXsYJVquioPYbAJqEtNv3QCLiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCSaFqwBmgQBweLgKrE/4XOIGFeAUeJpZMfMoLYEgIKElMevmeGiAtKnJz5hAVijITEwR
  cvmCFqFCVmX25mgbArJGbM2MYGYatJXD23iXkCI/8sJO2zkLQvYGRaxWiVVJSZnlGSm5iZo2t
  oYKBraGiqa6hrZGCsl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGJIpxYyn
  dzBu6vupd4hRkoNJSZR3S+e9JCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvK/j7icJCRalpqdWp
  GXmAOMDJi3BwaMkwlsaA5TmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ47wqQGQIgRRmleX
  AjYLF6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb2o80BSezLwSuE2vgI5gAjrik/YdkCN
  KEhFSUg1MjQ3LlZwEQ9XaL617wpmtp8l9X2FKuEbLit2b5eesUujcElZjzSLklHkvbm692dEJ
  D15M2pL24FII+4UDdbI3jpZsiC6OYbRTOrbrotTRt98P3HC0WFDHMPOhvuflnPaGiv+5JZsut
  yzSLl0m+0B8j8CtZy5fbv7kWX1k644Gd1bhngPZR69/1yp5oxMRa8ejoJ/cw7U1+qBdwT3vB3
  zprfvPLWYtzy/t4ThWw5bwel5t7sopZiGSZjPWaT38aa113Zmxtc5sxjKdAibWxGcJC08alj2
  eP/FegXK/nLDFFabDEsyCy9I1nBaY6Amu44goPGV0tyJw0ouNIcXzRSbNO3ZzUwrHxze2kdaf
  Tb2VWIozEg21mIuKEwGkT5euUAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1658806528!99888!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26423 invoked from network); 26 Jul 2022 03:35:28 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:35:28 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 00ACD153
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E890E151
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:35:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.3.1 -> 3.3.2
Date: Sat, 23 Jul 2022 13:40:45 +0800
Message-ID: <1658554848-9357-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:35:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97983

Changelog:
==========
  * Avoid redundant queries in TrackerNotifiers proxied through
    an D-Bus connection
  * Do not attempt to rebuild non-existing FTS tables on parser
    updates
  * Convert values to the right type when propagating insertions
    over superproperties
  * Fix test to handle SQLite >= 3.39.0
  * Fix handling of nrl:modified after opening existing databases
  * Linking fixes to CLI executables

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.3.1.bb => tracker_3.3.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.1.bb => tracker_3.3.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
index 42f44863ba..eaa0e065d1 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "5ad6f5bc97781ebf55ecd6947cd4ae7ff4192516580d10bd8380f1dd47196ed2"
+SRC_URI[archive.sha256sum] = "0ed2b98918956d6f16429c607dd8a14c84f4da0a48970fd2eb8c93aba3cf9913"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


