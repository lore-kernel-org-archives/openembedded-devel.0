Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8B7C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:36:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.29585.1652085397276748176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FGasPWBu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085395; i=@fujitsu.com;
	bh=hSoItAGNJBS2kwH/9Up+xVCUUYoc+81GfVyVx/wKYzA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FGasPWBuQHEbOwwIWK8t4O9G/lFe7wgwj5usL3+bjiGcPxrozwss9jOywDeSqqVSh
	 lX8wSbrvdcxvppQlsMTNmqEUQ9QbCR8iCgTTsownRejAKVzgJg1oXsSe/ycYxoFvgu
	 oyn0VdFPbnhUCGq2xxQKBgChNSnyIix5VZWXRJ/SJz+19RmogoGB3t9lsBe1MBDKkA
	 SgHWkGdSSfDAe3hwTIf+VaEldfp46/CVMh7qEgrenBX8FIaxs8XiOoTzMvkxK90JS2
	 tG2/y1NWL4irrLyN0+Tz8AjWVoHAFi6S610wTpRLyKXV3usdqOXEqUCugaDvMXP3ON
	 p9/OQcpBKR1/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORqDvpUkW
  SweEGa4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePc7blMBYe4KnquTGBvYNzB2cXIySEk8IRR
  ov1GfBcjF5B9gUni1tVFjBDObkaJE/N3soJUsQmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAscffWXiCbg4NFQFXiyZUckDCvgJPEw+OH2EBsCQEFiSkP3zNDxAUlTs58wgIxRkLi4I
  sXzBA1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVolFWWmZ5TkJmbm6Bo
  aGOgaGprqGhvpGproJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhmRKsQLf
  DsbmVT/1DjFKcjApifJWNlUkCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgDTkHlBMsSk1PrUjLz
  AHGB0xagoNHSYT37gmgNG9xQWJucWY6ROoUozHH3YV79zJzfDh0ZS+zEEtefl6qlDjvqQtApQ
  IgpRmleXCDYHF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb81FoCk8mXklcPteAZ3CBHT
  Kx4BSkFNKEhFSUg1MFTXlQi9uvlfUmutzNmlV1ReLz95ck1ObXQ3e/tU7sm2O20vWrfcTtqx7
  whEmKHM8RGDT4onPOIMq104MZ7hQx1ST8jdn3+rLa3k8LF2/H7kVriHzgvXD/HbL19PWWEulr
  meJfSO4oOvRji/PJBIifybuclKf8VEzMj9/Ip+fpHXDAbE/6SWr1nvqVujdzjatDXXLncogd6
  ngzf4LHP+tDrUtfTkpt5hJYMqV5rzpuxmcly06wpihlrwnxkNYqWlBeG6jxYaV3k1Tdd59n2L
  /nuP6+zXes9uvr/Ne0XBWhDPRRW7LeqYH2cWM+dOmn/zjJj3nxJ0v/1/9n7t8abbVdh6PVYrL
  WG88mtPYZ9vxUImlOCPRUIu5qDgRAKqotkNWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1652085394!173340!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20018 invoked from network); 9 May 2022 08:36:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:36:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8CEE6100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:36:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7FF5210018C
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:36:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:36:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] zenity: upgrade 3.42.0 -> 3.42.1
Date: Fri, 29 Apr 2022 16:18:42 +0800
Message-ID: <1651220322-27610-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:36:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97012

Changelog:
==========
    - scale: Make OK button default (allows pressing Enter to accept selected
      value)
    - Fix maximum width of message dialogs to 60 characters, and make message
      dialogs non-resizable (fixes regression from 3b64d05e)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/zenity/{zenity_3.42.0.bb => zenity_3.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.42.0.bb => zenity_3.42.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
index ba2d4594a..d48eb826f 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "c24c7fe6bb43163ced8adf232d583b2e013d3ba6c28deb5fcf807985e3deb5ef"
+SRC_URI[archive.sha256sum] = "a08e0c8e626615ee2c23ff74628eba6f8b486875dd54371ca7e2d7605b72a87c"
 SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
 
 PACKAGECONFIG[libnotify] = "-Dlibnotify=true,-Dlibnotify=false,libnotify"
-- 
2.25.1


