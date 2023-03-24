Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7120EC74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:38:23 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.90090.1679618298282076898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mOr2wZpI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679618296; i=@fujitsu.com;
	bh=s8wbPsphvkHvZqi4qa+1s9NtLm/fJqZHu6C4vkeV2UQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mOr2wZpI0m5MJ9LBJGcGRVOs/DH+NJvhjJ+TfmkXdaIvMu8iraK8Y5VOZtWH+5ZTH
	 ye24UTTukGuyyijxQjFT8SBY8gQEyaBv7g8WyamaL9sosGJv18lVndHPWPMu7BVn9P
	 CUAfvDUo/0UheIStIM4YmK2gEA5/5ew8ty6RXSRh2GzpsAgmkD/xdubcccobWpg/4a
	 XZkew2G/IPS1Z6NXNpR7xBweAeTqQkDX1Ga3OcKiCV0lRP6C9H9icS2nd/Bo1KesIl
	 lIjB7u/Xp3YqChmxC9XtwbG4w71vuclpnRT8f2vq9MvvfLbm4lKac0IeKUf8GtomeY
	 vk6QsaqEX1jpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpPv9g0y
  KwcwbUhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8betUtZC3p4Kn50TGNvYOzl7mLk4hASeMgo
  8WvpFnYI5wqTxNHdXawQzh5GifMXLzF2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKzHn6newGhYBVYk/b2Ywgdi8Ak4SD/88ZQWxJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eMEPUKErMvtzMAmFXSDROP8QEYatJXD23iXkCI/8sJO2zkLQvYGRaxWhWnFpUllqka6aXVJS
  ZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREYjinFCY93MM7r
  +6t3iFGSg0lJlFciVDpFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv5zcyKUKCRanpqRVpmTnA2
  IBJS3DwKInwHjoLlOYtLkjMLc5Mh0idYlSUEud1BUaUkABIIqM0D64NFo+XGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnz+r0DmsKTmVcCN/0V0GImoMXONWCLSxIRUlINTLa/35ecrjI8ljz
  t5afTp8OOSfrKKhj0pP6v7/qq9WVu9U1PN5kGY3cLkRlm/EeXRJ08EGIa2lMrcWpq8fGIeU3R
  f2o2Pvu8rjHtgHeGT1obK28nX3mpieCuHpkuMfavfS3dC92iK8X017w7uZhx5ZOfkb8uKqxR/
  /H5flfF0tsLJhjY3ngz4XxCwJ0iluTzibvcTRc5cgq9edP4xDh39XfJgPX3J/2+nDEnd8f7CK
  lP/HLat71nv9lff/j9xa4eDcN2lZ53O7cUdHU26Hqe3FnkeSRr86ZdbQY6dmeyd2xZecvruP/
  ZW3+0F54zSYvK1VLPCrNI4a54YnnNJfR/9MQNV6/s3d83K2tyY8jx7UosxRmJhlrMRcWJAKxX
  odpCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1679618295!252494!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1248 invoked from network); 24 Mar 2023 00:38:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:38:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CC75B1B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:38:14 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C11D81B0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:38:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:38:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-system-monitor: upgrade 42.0 -> 44.0
Date: Fri, 24 Mar 2023 08:37:59 +0800
Message-ID: <1679618280-27430-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101698

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Updated translations
* Code improvements
* Fixed help overlay shortcuts !56
* Use WMClass for application !62
* Don't reset the graph when toggling smooth draw !63

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nome-system-monitor_42.0.bb => gnome-system-monitor_44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_42.0.bb => gnome-system-monitor_44.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_44.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_44.0.bb
index 32ecc90eb..dfbfd7882 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_44.0.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "13239d22032201a22bd29833c575b684816700d2de168a1530223577c5c075dc"
+SRC_URI[archive.sha256sum] = "c2bab7eddba92827c4c8de44293e7e3c84c9e5076f31985887ff8969cec45e6e"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.34.1


