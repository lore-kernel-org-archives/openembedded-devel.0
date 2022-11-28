Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E519C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:06:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.111329.1669615592692446291
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tvz4Uwxu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615591; i=@fujitsu.com;
	bh=q99cClJxMBVSshjAVZ81vJeaigeWFrF1jidltnqFWOY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tvz4Uwxu/ZO0veW2/9u14xbu6Rjsvtg79V+qgXQYeIozhmpC/8Nm2P+d0DE3zZmZH
	 UGgEYMy/Fdnl72Zr2n/6Kzo6qzMQ+/foqpQvYLECLGlOFpQ5w8S1M4FC917M+Gjpz3
	 54qHtb4RgOC2yfdRaT2QYVctIZh2yok+QrbkhdzKoyEqsdrBZOeJYEKjsksvhJV7KV
	 ZKVKrugtIomzrxhNiCkNDB43vhRdKCibpvPSfPobzgJ4G8fzhfDaWctHstm/hb2oyb
	 8eNA3RBTK0DVUJf4SU0N/X7qxszOym//Plm5VNnq3lE5nH81cplPUEg6RghjJokMtd
	 7Cb9NqSH9XpUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWfeZf0u
  ywdl1OhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bvGs6Ch5wVy5ouMTUwnufoYuTiEBJ4wChx
  +u1xJgjnMpPEk5vvWSCcPYwS2y4fZ+1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBO4u/zu4wgNouAqkTXt9NgNq+Ak8TJ+Y/A6iUEFCSmPHwPZnMKOEt07TgOZgsB1eyd+J
  wVol5Q4uTMJywQ8yUkDr54AdWrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo1lxalFZapGuobleUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5e
  askmRmDwphSzC+xgPLLsj94hRkkOJiVR3oWXmpKF+JLyUyozEosz4otKc1KLDzHKcHAoSfCu9
  2xJFhIsSk1PrUjLzAFGEkxagoNHSYR3sT1Qmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4r
  xz/YCKBECKMkrz4EbAovoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeQZApPJl5JXCbXgE
  dwQR0xCbFJpAjShIRUlINTBqsVZaaSwqXvJ0gdeDivgk2FzWfh3yNXv1E8gKDm/Wids0ry4/w
  xJfPcYzx67ZZzma+gFPrnPLl8lKjLULtRXuSG7zOHrBL3CA1IWZnQ+kFr+Yfs9Ukkv9fE5G+O
  1N7Vsafg/7cRwKqRYsCbtRVnltVzXBAceqSEr2511dMCA/I/CC1IleTMcu5YoHSTSZmMY0974
  7qMse8mbw+6tFigW9+/yNji/kb1Y7p1RpIXH1itmZLq7z6ufcLF24sSpn4tKU5wv/E0TSpXK4
  qlu9vtkVm665S95o6w95dSNtuX6LaoRkuV7gjm4tD0/KvhST0nY+ZKZpYuHa7WAz7I2m2K4vO
  nsvd//h/8fmlN1aLKbEUZyQaajEXFScCAEO9s3tlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1669615590!222689!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13539 invoked from network); 28 Nov 2022 06:06:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:06:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5BBCD73
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4F2887B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:06:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] colord: upgrade 1.4.5 -> 1.4.6
Date: Mon, 28 Nov 2022 14:05:50 +0800
Message-ID: <1669615552-13033-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
References: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99788

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bugfixes:
 - Add missing copyright notices
 - Add Spyder X entry
 - Document where to send patches
 - Don't use exact floating point comparisons
 - Drop option for removed reverse engineering tools
 - Drop references to hughski.com
 - Fix a small memory leak in sqlite3_exec()
 - Fix typo in device-removed signal documentation
 - Make introspection optional in meson

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/colord/colord.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 41962cd63..0ae1a30fe 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.5"
+PV = "1.4.6"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b774ea443d239f4a2ee1853bd678426e669ddeda413dcb71cea1638c4d6c5e17"
+SRC_URI[sha256sum] = "7407631a27bfe5d1b672e7ae42777001c105d860b7b7392283c8c6300de88e6f"
 
-- 
2.25.1


