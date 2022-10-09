Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38472C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:37:16 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.9660.1665275834287626444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LqgvqJlh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275832; i=@fujitsu.com;
	bh=iTaboLLaQf/nNe43GNs7stoeFveOWiLWDi4zVDvurhk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LqgvqJlhMraUw2qvPDYsxT+BPXN2A0fa8LwldehzOtnNmamXYNhkuK/+/VDRN3fnI
	 o9iy4muwcS5CN7MV5tZNBrC8WFi1tYxEZ7FUDu2TpFG1xCvzZTvMsxr82zwV8+y5l8
	 ZKMre2fxnnJvCZSSSHZ6aejl9NOVa0p4fgvYtFf/7aig5ayVvxgyODMPuml+XTSrci
	 6Kg3lgXpR8TR4NR2t9uyaavzS2ILdzdImCu5SyEWFluPEyX6xHWmiJ6oTgFS6VWbvH
	 aNiCtyRm6D3Si0RhvmuKxjlEtwzYT+1NTa8mO7oa3Q0/tqIgAdk5Gy2CQvHsWuY3YX
	 1zLnU3bbO9BfA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSXeHuFO
  ywduJzBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bTA1fYCrq5Ko5O3MvSwDiLs4uRi0NI4Amj
  xJLuhewQznUmic0rfzJCOLsZJQ5vvcvWxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAq8T/n/2MIDYLUPztym9A9RwcvAJOErumuIOEJQQUJKY8fA/WyisgKHFy5hMWiDESEg
  dfvGCGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRKqkoMz2jJDcxM0f
  X0MBA19DQVNcEyDLUS6zSTdRLLdUtTy0u0QVyy4v1UouL9Yorc5NzUvTyUks2MQKDMqWYJXUH
  Y1/fT71DjJIcTEqivE+3OiQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB1YndKFhIsSk1PrUjLz
  AFGCExagoNHSYQ37J9jshBvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5Y4WBZgiAFGWU5s
  GNgEXrJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvB8EgKbwZOaVwG16BXQEE9ARVg/tQI4
  oSURISTUw+Sf9LZgZzamne6X2j2/WuevhpjvDA2yvdxyvOSz5zUtC2E3S0q9vZt0Peat/s02M
  2M6IummzF/7Vyqy5frKT21Xw2GzX4rb1t/1f1D/4+H1+dMjzTbeWCZ1jc2tQyBAQaWup9c/pk
  JO6tH5C3PQm9xkpQkoyF+ZnL1vT8EI7Pb4n2i3pQ8Im9VXTJb/FCunyt3O3OrXWunb8PLN0d9
  /8nsW7rPh/b/u66qF3kWC9wFlhk6n+zTWrPad7yWZ2tLyLcAiyq7N7ckR8dfLjVcVrXmW4WXZ
  pcx/TXcvxOb1G6uwc/pMH11Q+buY9e5xv/nJhm+8h+x2aFzPemqvLvbP+1Ckzh60x9yK3Xj/3
  jVeJpTgj0VCLuag4EQDIrUpoUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1665275831!105749!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17495 invoked from network); 9 Oct 2022 00:37:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:37:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AE4011000CE
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A1B601000CD
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:37:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] metacity: upgrade 3.44.0 -> 3.46.0
Date: Sun, 9 Oct 2022 08:36:54 +0800
Message-ID: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:37:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99104

Changelog:
==========
- Fix crash minimizing parent window. (#31)
- Fix fullscreen for Wine windows. (#33)
- Updated translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../metacity/{metacity_3.44.0.bb => metacity_3.46.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.44.0.bb => metacity_3.46.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.46.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.46.0.bb
index b6708552ac..2760d73dff 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.46.0.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "19c3c5d79d2171f45baa0f632cc8995f8607bf1231a16014439bac9ba165a7c0"
+SRC_URI[archive.sha256sum] = "4ba777e938547bfccbf9acca0967574c46643022e054c93a033419cb3cc7c1ec"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.25.1


