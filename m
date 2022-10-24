Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D529AC3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 05:55:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.16324.1666590898226912075
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 22:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vSx9Q9bh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666590896; i=@fujitsu.com;
	bh=cgabT2y+JjjklzKEGDh3wldbgeQr0TMKTq+qOBtQmL4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vSx9Q9bhzBS3I74HZbmbbvJEtSYCQEwifscsgJR/Vp9UkyITX0LrR28h6vinnILWp
	 SpH5rmybBDh1aDJJgU7xw2pxFkIqHhRs3hZDZNc+xkHeQB+h7793D0EiS6ymtRQg2y
	 zJScTtJFR+qJffUMJionojjfiARMbtiSzNaoDdP7tPZu4NJuoeuPuOzJPFq9uvFAHk
	 JCHBMqC+lFxEsWP69t1/ry97DeT0yHhRWRwoFViKAgPxm/oa8Vo+v8l0M9gZFB3R8E
	 +UxGe8hPLQN+F6MBMgdBivzmfFws6mLvzXxQUw3iLgw0io7316mgYSOPqdg6qPJNA6
	 GjyJsVoBY8mNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSXe9Rli
  ywZW58hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a6/d+YCn5yVjw+epepgfEaRxcjF4eQwBNG
  iebF35ggnOtMEoePnWWBcPYwSjx//p6ti5GTg01ASuLG/f9gtoiAvsTS2XuYQWxmARWJF7972
  EFsYQEbieOfWlhBbBYBVYnLT28A2RwcvAJOElPnyICEJQQUJKY8fA/WyisgKHFy5hMWiDESEg
  dfvGCGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRtDi1qCy1SNdcL6k
  oMz2jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwFFOKGXN3MO5c
  9kfvEKMkB5OSKC+DeFiyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneV+pAOcGi1PTUirTMHGBcw
  KQlOHiURHj/qgCleYsLEnOLM9MhUqcYFaXEeX3UgBICIImM0jy4NlgsXmKUlRLmZWRgYBDiKU
  gtys0sQZV/xSjOwagkzNunCjSFJzOvBG76K6DFTECLL60IAllckoiQkmpgYmKdW3pv3n8zzof
  9jKfvm0ZzvRS7enBeO3ey/nGl6LL/nn1XHR80c2+USlzuryEUGb396FQpDpVN+t82/poTdmCB
  2vNVnaqCh84cVrH4N/vZn1V3qiMZJofPMFdOCFmfkv/iaP6R8joJTZHKA59zHK4WczvNm3bh8
  Mz1PnHt29uEdrEW+n6c19X2p/3hXuFHLIKB9jVOzhEMl/WjtU/PWfxI0kpwq6/GmnfG59XWtE
  wRSE39mlms8zdRXq/T5OdESRvWDL79Fj++aT12q9wWF/iWd11tdvCPfSWSpzzfHPYKO8b0OFR
  U32/q/vT0gGfGtefmP95yT8HJ6Xed/+TySWEuMa/X9+7uM8rjSeNQYinOSDTUYi4qTgQA2kIi
  ikADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1666590895!193823!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 569 invoked from network); 24 Oct 2022 05:54:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 05:54:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 285001000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:54:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1BA2E1000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:54:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 06:54:53 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fvwm: upgrade 2.6.9 -> 2.7.0
Date: Mon, 24 Oct 2022 13:54:36 +0800
Message-ID: <1666590877-27966-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 05:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99266

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Bug fixes:

  - Fix handling of configure's --enable-mandoc/--enable-htmldoc
  - Fix crash in FvwmPager when desk height or width is 0
  - Added DoubleClick time to man page.
  - Fix to FvwmIconMan to disable a SizeHint warning.
  - Allow for reproducible builds.
  - Increase the number of supported mouse buttons to 15.
  - Tweaks to configure.ac

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/fvwm/{fvwm_2.6.9.bb => fvwm_2.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fvwm/{fvwm_2.6.9.bb => fvwm_2.7.0.bb} (98%)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
similarity index 98%
rename from meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
rename to meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
index 123af4d3aa..8daf38a0ba 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
@@ -36,7 +36,7 @@ SRC_URI = " \
     file://0001-Fix-compilation-for-disabled-gnome.patch \
 "
 
-SRCREV = "88eab6dc16da6e5dd25fe97fbb56b96ef0d58657"
+SRCREV = "7baf540e56fb1a3e91752acba872a88543529d46"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


