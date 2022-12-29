Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83278C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:29:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.55584.1672716552072918455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PR3Jsm3O;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716550; i=@fujitsu.com;
	bh=yv3pB+DFuXdqfvfcZeu3p/pqWQ7mvnn+51iZ5nWMsw0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PR3Jsm3OlY7UD1g85omyIAODerh1Nz6cp6Gwh/LIUHeMrIVl6Pfg7cloXFLq+KQeo
	 7OcKQIoiAisl5GMzjGsWAiQ+o2/j9Jdfd6vPWteVNOoWZESQrMDSweMkdtKCzFkafc
	 at1CckgPHROZrSQKyke+1pIon01MLWy35p2/42gWRgeaEG2n14dr4a9naSI4OCj7RX
	 mdF7CeUiTS5zErk/S72dMS62BiZqlZGsRfktHcRXBsbhNKb560X3MCqLwYUNYi/G2Q
	 2otCW5WuEe4Yc9FOZQeO61qm8BI67+i5BaKozrnT7O67Nh4RsuT91OmQST0kWJhvP7
	 BlAsSv+935zBw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWZd14eZ
  kgzU7FC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow/J94zFuyQrdg5dyprA+MsqS5GLg4hgYeM
  Eg/6zrNAOFeYJFqbnrB1MXICObsZJbZd0gGx2QSkJG7c/w8WFxHQl1g6ew8ziM0soCLx4ncPO
  4gtLGAnMef/PlYQm0VAVaL563ywOK+Ak8SxW4vBbAkBBYkpD9+D9XIKOEts7/0AtctJ4tyFP8
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0TfWSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQKDN6U4wWkH45Rlf/QOMUpyMCmJ8pbv3ZQsxJeUn1KZkVicEV9UmpNafIhRhoNDSYKXZ
  /7mZCHBotT01Iq0zBxgJMGkJTh4lER4D80DSvMWFyTmFmemQ6ROMepy3F24dy+zEEtefl6qlD
  ivyFygIgGQoozSPLgRsKi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdz7IJTyZeSVwm14
  BHcEEdETSmo0gR5QkIqSkGpgCmvL2SZzOS8pLZ+Z7UaBrtDRGv+/KSdfiC62vv/0UllpVe+aB
  Weh/VrmTgdNceSKTFilFnQzaN1fe8dusv3lPDv9xmKF+XUbwKQ+XbJ13QMzaZ98nXo30jY78+
  vtUDXOwgPmUUsW1AeEWy0xPPXCal2vIzbR9zm5Z933S97pMFvVE//62pWBh1f/ZPgG7C23c1r
  wOUnuqyHUsRvFVRe3xopnqfds97e/8f3jfZ1f768eeTG7fNZglrJbEWt67ocuz1nuKouH9Vyv
  3LWyIfeBryL3EdU1UzxXj8q/8saVzrWJSLkxSKZ37eeklnqTTk6YVrTCc/L2e9VvMKn2uyVa9
  57ST/2pt8uhOW7bb57ASS3FGoqEWc1FxIgA4dqnzZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1672716549!870857!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31752 invoked from network); 3 Jan 2023 03:29:09 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:29:09 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 01433152
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E8DE8151
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:29:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] flashrom: upgrade 1.2 -> 1.2.1
Date: Thu, 29 Dec 2022 12:45:31 +0800
Message-ID: <1672289132-16078-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
References: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100348

From: Wang Mingyu <wangmy@fujitsu.com>

0001-typecast-enum-conversions-explicitly.patc
removed since it's included in 1.2.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...typecast-enum-conversions-explicitly.patch | 45 -------------------
 .../{flashrom_1.2.bb => flashrom_1.2.1.bb}    |  4 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.2.bb => flashrom_1.2.1.bb} (79%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
deleted file mode 100644
index f2302dbcc..000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 3a0c1966e4c66f91e6e8551e906b6db38002acb4 Mon Sep 17 00:00:00 2001
-From: Angel Pons <th3fanbus@gmail.com>
-Date: Wed, 27 May 2020 12:15:51 +0200
-Subject: [PATCH] libflashrom.c: Use casts on enum conversions
-
-This allows flashrom to build with GCC 10.
-
-Change-Id: I2166cdf3681452631ef8e980face2924e9a6c81a
-Signed-off-by: Angel Pons <th3fanbus@gmail.com>
-Reviewed-on: https://review.coreboot.org/c/flashrom/+/41775
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: HAOUAS Elyes <ehaouas@noos.fr>
----
- libflashrom.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libflashrom.c b/libflashrom.c
-index ab7e364..c20d9c7 100644
---- a/libflashrom.c
-+++ b/libflashrom.c
-@@ -188,7 +188,8 @@ struct flashrom_board_info *flashrom_supported_boards(void)
- 		for (; i < boards_known_size; ++i) {
- 			supported_boards[i].vendor = binfo[i].vendor;
- 			supported_boards[i].name = binfo[i].name;
--			supported_boards[i].working = binfo[i].working;
-+			supported_boards[i].working =
-+				(enum flashrom_test_state) binfo[i].working;
- 		}
- 	} else {
- 		msg_gerr("Memory allocation error!\n");
-@@ -226,7 +227,8 @@ struct flashrom_chipset_info *flashrom_supported_chipsets(void)
- 			supported_chipsets[i].chipset = chipset[i].device_name;
- 			supported_chipsets[i].vendor_id = chipset[i].vendor_id;
- 			supported_chipsets[i].chipset_id = chipset[i].device_id;
--			supported_chipsets[i].status = chipset[i].status;
-+			supported_chipsets[i].status =
-+				(enum flashrom_test_state) chipset[i].status;
- 	  }
- 	} else {
- 		msg_gerr("Memory allocation error!\n");
--- 
-2.25.1
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
similarity index 79%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
index bdc3ca084..b2592d294 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
@@ -4,13 +4,11 @@ HOMEPAGE = "http://flashrom.org"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
-           file://0001-typecast-enum-conversions-explicitly.patch \
            file://meson-fixes.patch \
            file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
            file://0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch \
            "
-SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
-SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
+SRC_URI[sha256sum] = "89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 
-- 
2.25.1


