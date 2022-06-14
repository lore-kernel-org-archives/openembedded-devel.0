Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068D5CCA480
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 04:35:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.2394.1655181338313568774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 21:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VMD5XuGW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655181335; i=@fujitsu.com;
	bh=arSod4GOkVZ0V5eVSR1OqgHmvFr+rRFYc4G3W2CJc6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VMD5XuGWyUiZQNZTKBI3oy5XdR6PdloEN970yREX16y73SVfvmjfsyKRpqHN7zDVM
	 wsYEssEDqB72bThFnzxfaYu9HEGL2HyN7iEOAAG552CuD8H2FwmOXyQOfGagr/bb6W
	 hh1QT3i0NtLo9on7YUWrSnOyILsM2Qh8s+LzhuHKtoQ+8QpgCfFdAcNSNgnY6oH42k
	 rMJwTb8u5G9Es8RrUygwrMavGEQ2ZvHhTOOxPSAAp9gI/uyYVYL2Ume15LG2N0HfRw
	 qfzaEST1YLMnCADEKYnQQxwrCmHEmNyaL5mLBuB2wnFhLP+vACboF1oRSVTYTKLnx7
	 Xbs6BmZ1Z5iMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORqCsusCL
  JYNsScYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPXNc+C5+wVW84dZG1g7GPvYuTiEBJ4wiix
  uO0MI4RzgUniWe9WFghnD6PE5OeTgMo4OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxuwesR
  ljAWuLDtj4WEJtFQFWibeYpsBpeASeJifs/MILYEgIKElMevgeLcwo4SyzbcJIJxBYCqun6cY
  sdol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbLpKLM9IyS3MTMHF1DAwNdQ0NTXWNdCzO9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAEE4pZg7bwfin96feIUZJDiYlUd5Lu5cnCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgbeFckSQkWJSanlqRlpkDjCeYtAQHj5II7+J/QK28xQWJucWZ6RCpU4zGHB//XNzLzHH1yp
  W9zEIsefl5qVLivOr8QJMEQEozSvPgBsHi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7
  vfEBTeDLzSuD2vQI6hQnolI0nl4CcUpKIkJJqYFqhu95yw50dE1VOPKgV1S77skjhiWZemsCz
  uI2hV4N5TX+XfHxl5+PrPCPfuGJ1svZc3c83Xx0tmmc//ejtJqkTydtO8fqynZ5y70HeCu/g4
  tLAFcKnZEN3q2i+L17r8+Z9jvaSxsp0nmhX1+fF5hK1fTxxTYc+hBRN/POpbOIv4dqSSwY6c7
  S0Q8S6H5h/7nmyaUrr2UtMjzbUm+6xyqx/yPEzc86t0oOWPcHOwWvmKan+jzSZ1FFxn/m0+Bv
  OluAnV0rvRF7bds32/Z6zFdM6Ol07rO7+aBBemKH1q+5z/a1ozvcmh2z9TpucvbRrntKjCo7t
  P9Ky16i/T3p85jpzPgfPdscjS932namYv0qJpTgj0VCLuag4EQAv7o00bgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1655181335!25604!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31028 invoked from network); 14 Jun 2022 04:35:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jun 2022 04:35:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DD2EB100181
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AFC55100188
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 14 Jun 2022 05:35:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pyxdg: upgrade 0.27 -> 0.28
Date: Tue, 14 Jun 2022 12:35:05 +0800
Message-ID: <1655181307-30868-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
References: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 04:35:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97498

BaseDirectory: Add support for $XDG_STATE_DIR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-gnome/pyxdg/{pyxdg_0.27.bb => pyxdg_0.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/pyxdg/{pyxdg_0.27.bb => pyxdg_0.28.bb} (87%)

diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
similarity index 87%
rename from meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb
rename to meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
index abc1c2327..0c9599a49 100644
--- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-SRCREV = "f097a66923a65e93640c48da83e6e9cfbddd86ba"
+SRCREV = "1d23e483ae869ee9532aca43b133cc43f63626a3"
 SRC_URI = "git://anongit.freedesktop.org/xdg/pyxdg;branch=master"
 
 inherit setuptools3
-- 
2.25.1


