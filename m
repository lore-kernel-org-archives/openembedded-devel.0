Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D49AC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:28:50 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.1116.1667809721169636717
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SDVAesVq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809719; i=@fujitsu.com;
	bh=s9cduSZim/Vyr/JhnEe5ZB5Ze5hLYbyOxZdT7PmX3QU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SDVAesVqZLSUg05ekgSq/cd9IFy+1ftRGqToJZEHnpiUod7q/BhMnFzUjoyC1ucCY
	 ZzjQFClw4ue5WJu2PGAeZM9ebIXLUBzCPvm9H0xxiDAQEbkR7p5Roua7hgYQIFJuVy
	 DN+DpmCOMkjhnyMY75NUkQUplqNoMfEoo4JmDdpo811yVaFbnXQs7QJpCFjSP8nZXY
	 pov2cxX82ZrXYpHYHkqWzcBrjcu09Y4p2IJfIHwo1OVUwydWk0IreFbVJvAQJFgJW7
	 LHoMnz/6g+RMVL1QHjyxme2jydLVPI9Vxk48h9+WD1dMBfVtyWnLn4pDm9Hr4LM3QG
	 7k6nuRAj1RIqQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSXf7wYx
  kg6vH+CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyV7xczFXRzVdz/v4WpgbGPs4uRi0NI4Amj
  xKnDx5ggnOtMEr0fz7NBOLsZJZ43nWXtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYQEbiVlLYkHCLEDh6a9ngJXzCjhJzP95mwnElhBQkJjy8D0zRFxQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdITFrVhtUr5rE1XObmCcw8s9C0j4LSfsCRqZVjKbFqUVlqUW6pnpJRZn
  pGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUsxYtoOxe9kf
  vUOMkhxMSqK8v5dnJAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4L2xESgnWJSanlqRlpkDjAuYt
  AQHj5IIb9g+oDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5r+0GKhIAKcoozYMbAYvRS4
  yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZn3AE3hycwrgdv0CugIJqAjqgvSQI4oSURISTU
  wOS1lS1zUvW/Vk75PMlZmmx5fYxfltn4885NksvknlxkCpbF7xE3778TfTE/a8O2rTSpjf7r8
  g4NvLSzULqixtWSyyzgrXlk5weyJ0d9Lu7ttI/2fcfwybZjdoewYz3tu0crb73nmSCi/b5zmn
  HK+xECz/typ2A8yIZUn3H1/vk+aNT1MTeODkoHwJv1ygX/Z/SnLtnx9vDhh4weRw3ePzZz1Oe
  j+b+Pdn406P547duG2acH978bL8tPOlLT/eObIVXarqHTa7ruG3u7T7qtzM7py1Bnruz4N/5T
  wgm1OpYRGwqs7yla3b9o1vBHcXH9jwpQNphJXVWbOtg5wDN/hxLt5rvKy75MuKRz6PEvklxJL
  cUaioRZzUXEiAN9Fl2JMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1667809719!321465!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26422 invoked from network); 7 Nov 2022 08:28:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:28:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D551D1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:28:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C94DC1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:28:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:28:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lcms: upgrade 2.13.1 -> 2.14
Date: Mon, 7 Nov 2022 16:28:20 +0800
Message-ID: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99442

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
lcms2 now implements ICC specification 4.4
New multi-threaded plug-in
several fixes to keep fuzzers happy
Remove check on DLL when CMS_NO_REGISTER_KEYWORD is used
Added more validation against broken profiles
Add more help to several tools

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.13.1.bb => lcms_2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.13.1.bb => lcms_2.14.bb} (79%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.13.1.bb b/meta-oe/recipes-support/lcms/lcms_2.14.bb
similarity index 79%
rename from meta-oe/recipes-support/lcms/lcms_2.13.1.bb
rename to meta-oe/recipes-support/lcms/lcms_2.14.bb
index e018c5bff..eb671449f 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.13.1.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.14.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac638b4bc6b67582a11379cfbaeb93dd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d473e796e7b27c5af01bd6d1552d42b45b43457e7182ce9903f38bb748203b88"
+SRC_URI[sha256sum] = "28474ea6f6591c4d4cee972123587001a4e6e353412a41b3e9e82219818d5740"
 
 DEPENDS = "tiff"
 
-- 
2.25.1


