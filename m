Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F97C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:11:34 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.7267.1663639886912088205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hvxBEdwJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663639884; i=@fujitsu.com;
	bh=YWknOZpEkl4Md3kSoT5W6X1O7Tm+ZwShsBgn6zVdhrM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hvxBEdwJwV/LofzqJQ9SjM3OLeKJu2Yo9VRRQtIzUHX/XVqsFjOmi5eP+w0k8Q5NC
	 bASWP+oplcSojM8h9k/e5wO0/EQI12qA9tUYVahPrCuPbs20/7K76vPT4YceyPFF98
	 LEgJmwqsCN08eByWsORXYM2zg5pzgGNRBT0SFA8ZuYU1kARc8xlGGm+7lW2YaYLFHu
	 d3kfsqH5ek6C1DsCC1geuyb8ts31ih5xO1ioZvVP1keRkqrLf8Ch9PVJ0UPL3E5laR
	 YkliD21qZgZht6o7mkcNLSkcfOpFxmeSzLawsA7c/l+4u7KofTyL+0Uu+0yhAMXrSl
	 OfAjkKzAFMetQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORpOutqJl
  ssP6ascXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjGtZztbwVWOirtNwg2Mv9m7GLk4hAQeMkqs
  fjiPEcK5wiTx6u5GVghnD6NE44z9QGWcHGwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43QNWI
  yzgKtG0cDVYnEVAVeLXknlgNq+Ak0Tv/vUsILaEgILElIfvoeKCEidnPmGBmCMhcfDFC2aIGk
  WJ2ZeboeorJBqnH2KCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRNKspMzyjJTczM0TU0MNA1NDS
  F0JbmeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIGhmVKccnQH47F9v/QO
  MUpyMCmJ8nLVaSQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC1F9RMFhIsSk1PrUjLzAHGCUxag
  oNHSYSXTQoozVtckJhbnJkOkTrFqCglzpuiAJQQAElklObBtcFi8xKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYd5wOaApPJl5JXDTXwEtZgJafENFHWRxSSJCSqqBqdYiMV1g8zq3Vs3equN
  Gy/c8Wh97/uga39z9M6T1In2+f1vEkLDgsML2bIPn4ndnqXBO0wxXsTx5duV/9pw9Hqd8tzRL
  m+7aPzP69u41E6zmZjx/H3J1kZTWnp1zTH8XTUicLKt2hb/yWMRzoSk3P6iqL2TlM9LN0Vmvo
  Nn1QVfjeNGnDzu+MyyuaORTa//j1a7r4S9stFPEdqG6F6ftgkLJ+99SOIVuKPRHmL/cp6nmHK
  Czd8mM6XVdLh+l7svOOJxuzm3KF6EZI3/zdfbqS5JLOxS/Pzae2Rb0afv+a8nrVD4fmc/T8EP
  LMH/GfsVnv6ftXTAn8/c/FuOFX2Zor/hgNvPSycKt3xW7DxVtcVRiKc5INNRiLipOBAC9E8EE
  SAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1663639883!33676!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22713 invoked from network); 20 Sep 2022 02:11:23 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:11:23 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 47D9D1B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:11:23 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3CB381AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:11:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:11:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.1.5 -> 1.2.0
Date: Tue, 20 Sep 2022 10:11:10 +0800
Message-ID: <1663639870-26912-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:11:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98870

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.1.5.bb => libadwaita_1.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.5.bb => libadwaita_1.2.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.5.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.5.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
index 297cd9f0b4..7a1f86a73d 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.5.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "e170a658b5a83226912ecd90ba643015c8d2b8bbd6ea91ebe336dfebb584bb33"
+SRC_URI[archive.sha256sum] = "322f3e1be39ba67981d9fe7228a85818eccaa2ed0aa42bcafe263af881c6460c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


