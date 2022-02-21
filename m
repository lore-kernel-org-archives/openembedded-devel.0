Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF7BC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:20:48 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.10698.1645449647476422673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vk+Ejy/k;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449645; i=@fujitsu.com;
	bh=lr0FtSdvQ3uPkaBVHe+uenGsMFj+mqLvF9hyXT2whcs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Vk+Ejy/kkt8V4Z+Z89EmSRz/EJldmB86uiqml2s/T9WAUXtl1wIWjg2pbFiUvLjFX
	 W1dcDeoAP1Kd68oi4qPLWj1WCXaaBhh8DULzKYouuntwoUrG9fpH+tvRZ/Mg4aO7OD
	 +q9d4Zc915UWXmPUmoGcn6YZw2gumjQ2g7L9yIYoCbh5vMqVC9ZNkenGSpJadij4Lw
	 s69q0fsBC2dxxQMG/rvHWA8bK8chArZ8r7uGZ1LUszSheDNg8E/X/rExW4JCdZi0Eh
	 Cu6ebfHYnMgtcyXvvL9ksKa6sADzN1goc6q55/tinYNKxq21r+KaLuHOm9iU3fojcN
	 Ur9lpG4nWmTbg==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 2B/01-25243-DA193126; Mon, 21 Feb 2022 13:20:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8MxSXftROE
  kg18nhCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxZm9ML9nJUTNi9nKWB8Qp7FyMXh5DAE0aJ
  D18+skI4F5gk5l69yQzhnGCUOLqpgaWLkZODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFHif0fNjGC2CwCqhKNk26B1fAKOEl8a7sH1ishoCAx5eF7sDingLPEjOtdTCC2EFDNoy
  VbWSHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iUVZaZnlOQmZuboGhoY6BoamuqamesampnpJVbpJuqlluomp+aVFCUCpfUSy4v1UouL
  9Yorc5NzUvTyUks2MQKDOaXYedkOxnd9P/UOMUpyMCmJ8ta2CycJ8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuAV7gfKCRalpqdWpGXmACMLJi3BwaMkwlveDJTmLS5IzC3OTIdInWLU5VjbcGAvsx
  BLXn5eqpQ47yeQGQIgRRmleXAjYFF+iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr84EoCk
  8mXklcJteAR3BBHTElCwhkCNKEhFSUg1MjbzTavqm3ywNeJKy2ODY5aMrC/dWHj468chRWb6k
  VVve/Kzp1sl1N1kStNhgzz7B+2KbPivzK188e3nVrsz+8BKN9Zb5y4K69D7bLmkx3bfP7Zusm
  zVXTvEp9W4rvSfVXnPuexQ17PKcJd5xaWXko9PLNjgtszx73cXym3qvbo35nOvXTB12LnQ6dt
  Vh5pupfxcWG/y6zLQi4bLhdW2f7Z2RS5fPZnN9kLJiluXCa9+fTH51kVH4/p9Nb5d9f+b47Kn
  zjYJ+vZxXq195rew6vat9wwUDvsre8H+ce6JOmq3ReNf8bL56YqDusX03ooNzxWPXlBksFrcQ
  /ngqgW0Xl0zstH0TM0vvfdQ89Mz3qZgSS3FGoqEWc1FxIgCJcUewbQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-528.messagelabs.com!1645449645!25971!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14433 invoked from network); 21 Feb 2022 13:20:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:20:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C8E53100353
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:20:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BC18910033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:20:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:20:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libwnck3: upgrade 40.0 -> 40.1
Date: Mon, 21 Feb 2022 21:20:01 +0800
Message-ID: <1645449601-23151-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449601-23151-1-git-send-email-wangmy@fujitsu.com>
References: <1645449601-23151-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:20:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95410

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwnck/{libwnck3_40.0.bb => libwnck3_40.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_40.0.bb => libwnck3_40.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_40.0.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
index bfb52e5bbf..6c9e631e11 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
@@ -20,7 +20,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "30cb79a839f90cd66f3e202f3f98cb5166fa0cd9b92eb571ad9c470a43021d83"
+SRC_URI[archive.sha256sum] = "03134fa114ef3fbe34075aa83678f58aa2debe9fcef4ea23c0779e28601d6611"
 
 # libxres means x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1


