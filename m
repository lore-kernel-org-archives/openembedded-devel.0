Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112B7C54F3B
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.7520.1649906746927709635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QHH2Jytm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649906745; i=@fujitsu.com;
	bh=apk4tIizcbsHthu0TttbvUHfx/3urpUPkyFjh5bjVz0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QHH2Jytm3DsZcsdRkpghTsqm0+JeN9TM/dDcuFpYUDPrX3H0GrExrCVJBgrobxzdc
	 TAZHpEW9UHJlNstdayygfzh9ken52Cj4t5EQMrL3mcH+l0vUNc+F2raOXVVV1McXh5
	 4pUBH59awqlo6adxbRuo8C+j92Fyt6kNu7DI8G/MMbkqEGOOldPx1GWsEYxb3gPr24
	 dEz/g6dQt9xNf0VkrJXl7AAYmlNtWlkrWFKJhls0SwgmjTR9phE7drEYDbGh9tEcvn
	 jklNC6rRsvfOXbir142HyRnfg30GzxcL2hbNGj6ZqwO27Ay+hkZqJ8slDXsLg/pn1m
	 iOJo8XHZ08MoQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSddiSni
  Swb3rwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b3lpUsBTuFK1btWMrawHhGoIuRi0NI4Amj
  xPuWi0wQzgUmiVv35rJAOHsYJTZ8/sLexcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgKeErcWXwOzWQRUJd7tb2QCsXkFnCR2zvnPCGJLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19D
  AQNfQ0FTX2FLXwkgvsUo3US+1VLc8tbhEF8gtL9ZLLS7WK67MTc5J0ctLLdnECAzLlGL1oB2M
  31b81DvEKMnBpCTKm2UYniTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdpIlBOsCg1PbUiLTMHG
  CMwaQkOHiUR3q5+oDRvcUFibnFmOkTqFKMlx9qGA3uZOa5euQIk/376u5dZiCUvPy9VSpx35y
  SgBgGQhozSPLhxsDi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY12ky0BSezLwSuK2vgA5
  iAjro26pQkINKEhFSUg1MRgG8B9LPO5h3a+2ZLxrjwuRX0aT+5eDF0/I13yy2a37Q+bbceIeB
  7e2yb8HZqSyJkf5pT6/+bbv7Sf9nnXtqpHqY+LJGqWyt93Yfa1/pXGRN3eLPK6uUc2WHrcOCj
  +kyR27qSaww9Vk2e9L8Taf3Oj4waz6ZLPCz/t2Mdr4Oofn1/32jt+sr7lMJOGErc+zFe+5k5x
  mddy/pPN/38sc8Q4+5p14Y8RSZs/f3JSSFe23nPcqgxinAOJUxb4a9QaD08fMLz1xovjStbWm
  R+esZm/q2/prM9iX7h/CKf84eO3b9W2F+2Vzi2Z5zE6Q+qWl8vfZq6W/lr3x2gc5LJp0Iunkv
  Qcp6omLPIvv02iOdSizFGYmGWsxFxYkAzmPYOV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1649906744!57829!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7260 invoked from network); 14 Apr 2022 03:25:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 03:25:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F322E10046E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 04:25:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E431C100445
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 04:25:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 04:25:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] squashfs-tools-ng: upgrade 1.0.2 -> 1.1.4
Date: Thu, 14 Apr 2022 11:25:17 +0800
Message-ID: <1649906719-18151-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96642

Changelog from 1.0.2 to 1.1.4:
https://github.com/AgentD/squashfs-tools-ng/blob/master/CHANGELOG.md

License-Update:
- COPYING.md
  Add exceptions to files under **GNU Lesser General Public License version 3 or later**
  Add description to examples
- zstd.txt
  Delete blank lines at the end of the text

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uashfs-tools-ng_1.0.2.bb => squashfs-tools-ng_1.1.4.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/squashfs-tools-ng/{squashfs-tools-ng_1.0.2.bb => squashfs-tools-ng_1.1.4.bb} (89%)

diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.1.4.bb
similarity index 89%
rename from meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
rename to meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.1.4.bb
index 580c53a323..c57324d89c 100644
--- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.1.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "New set of tools for working with SquashFS images"
 SECTION = "base"
 LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later & MIT & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=5789fb0572753ed69014cd90a445cd74 \
                     file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
                     file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
@@ -9,9 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
                     file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
                     file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
                     file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
-                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
+                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8 \
+                    "
 
-SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
+SRCREV = "7667b84cc34707c28ca0db8d24f046ec34e8c25d"
 SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


