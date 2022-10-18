Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B5AC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:08:26 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.1818.1666055302193724652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UHO+Wdt2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055300; i=@fujitsu.com;
	bh=fNhG+LghY4D4JeYXcdtDY44GM9bINoNofOlV5ED/AZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UHO+Wdt2Kf66BzVM17KVPYW5BAsPRclIROPQQQolU7cmiwkSlHiwDjdN04SNZnon+
	 8DuBDP3A9qanx9RC7csifG/LUV2qqmw67QX4xnYnYmNb41a73pD+ZXkA+r/cmCnMka
	 l1zGPeRV9eHQDipjnN1jm4HGqzTlrqa/tQtFXpeIcJlRIwnU5NBgoGTT4X1S/Jgqer
	 9eOIFqZNdyFzgzKUq8TBKWc1fia+n2c21rxW5+0Z/AbLw3T/kGk7HlEXp4tfyj9P6O
	 SD2ExJUNw0NU4KB5YeMzhRLM96xJGh3xftIy7W8MfWZRog8o/6Il9mOvBgPuX7teWM
	 iIAgc9eD962Mw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWbf5j2+
  ywfXHMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Zf92G2gl2cFcdb3BoYN3B0MXJxCAk8ZJTY
  u/wgO4RzhUniy52ZUM4eRonJTbeYuhg5OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWcJb4dXwjI4jNIqAq0fZ8JZjNK+AocfvuW7A5EgIKElMevgfr5RRwkni6cwHYTCGgmtPzz7
  BD1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNaoOaqSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo2lxalFZapGusV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5q
  ySZGYOimFLNV72B8u/SP3iFGSQ4mJVHejhm+yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeDt+A
  OUEi1LTUyvSMnOAcQSTluDgURLhjToDlOYtLkjMLc5Mh0idYtTluHrlyl5mIZa8/LxUKXHe07
  +BigRAijJK8+BGwGL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tRfQFN4MvNK4Da9Ajq
  CCeiIjP1eIEeUJCKkpBqY5gpyP45fs0NtY3T1tz+PpRlUp/FkPi2unzVTUOIuc4GCiEuDtXjT
  1PfqHqGB53NZSrTDV71si84/nNK+Q/x6BYPLT8fgOcr3vtRU3lzabP68wrZOrOr2zBQJxYQ/v
  UdDGadPPMwzqzp2ZquHd/WiYp5k+U9JAuKXj2vx/1rJcPRKm86u3ztKwhNCpM6WrG0XPJdmde
  LK50arprtR53O3ZFX2704/Pjns04F6iRD1/gj+dzlG+x+7Vx/q+aXxxeDn4Z2yKtbHDqQxpKm
  aZwbJHnI7O//SBR/GWesNFk2XTfzwXO5xkBlXYXLAvVfGYTFXzGKneXhwuDi0t1Y+0zBYfPlG
  YWCX6u6FtbFfriuxFGckGmoxFxUnAgCpeOPrZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1666055299!280840!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20419 invoked from network); 18 Oct 2022 01:08:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:08:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 217C7151
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 14A2F150
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:08:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libwacom: upgrade 2.4.0 -> 2.5.0
Date: Tue, 18 Oct 2022 09:07:53 +0800
Message-ID: <1666055276-8042-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
References: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99213

Changelog:
=========
- New Devices
  - Cintiq Pro 27
  - Intuos Pro Small refresh
  - Dell Chromebook 11 5190 2-in-1
  - Dell Inspiron 14 7425 2-in-1
  - Fujitsu U729X

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_2.4.0.bb => libwacom_2.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.4.0.bb => libwacom_2.5.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.4.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.5.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.4.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.5.0.bb
index d690df9229..a290d95b71 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.4.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.5.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "9fd28747534ef776ffecc245721a4faa43bdd89b"
+SRCREV = "c6c1b26ad149a88b22ff790dae377fcc935b7e08"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.25.1


