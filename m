Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD450C6FA90
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:18:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.7314.1663640278407881670
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=abVliMvv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640276; i=@fujitsu.com;
	bh=keBvxTb1nNC+9Mz8Q5w7Wi7yYSqsswjl2E9sOl4fHKc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=abVliMvv1uj3k0Uhi9aJd+4A+9rfkFxDwdvC4jyW+I5Nkl/GNVK2k4NS4u/Epugez
	 m3HD7GNXGenX3bG6aQt/6vhQxOiSTegHBUhamEYBcc58FF8Z7HlQZ1kiEv/RUIX6Ls
	 Kn2BEheKUjIbDBHqxocZtevvo/MVjgeCAuDS70vfk/tJaj7M6hI1Y0zz7y3uSWR/3W
	 n+7o40zzqXI9QndLbb+nVm1rDQFIPj/tlxNP4Xlk7u/na3MyZv3sMDQhqWEE+WZ0Ym
	 bTfKds/hmWxKKwqtR1KM09Dak8t6JMc7T4C+Py2di/1B1QyC3qRAqsJ9efrMal4gjR
	 mJmvtlEWRAqtQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWfeKkma
  ywdkH7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0Q1NYCqZyVsz/+JG1gXE9RxcjJ4eQwENG
  icUzVLsYuYDsK0wSD6c3MEE4exgldq/7xghSxSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAo8ShLfPAbBYBVYkPPVOZQGxeASeJR08XsIHYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJBqnH2KCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrROKspMzyjJTczM0TU
  0MNA1NDTVNbbQNTI00kus0k3USy3VLU8tLtEFcsuL9VKLi/WKK3OTc1L08lJLNjECwzKlWO3K
  DsY9q37qHWKU5GBSEuXlqtNIFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBay+omSwkWJSanlqRl
  pkDjBGYtAQHj5IIL5sUUJq3uCAxtzgzHSJ1itGYY23Dgb3MHDO/th1gFmLJy89LlRLnTVEAKh
  UAKc0ozYMbBIvdS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEecPlgKbwZOaVwO17BXQKE9A
  pN1TUQU4pSURISTUwlfVJWAj9DZ7xcPnBeY8OVr84ksI+e5ZGw+8zN3Y/33dqFcd1HnFNfUmJ
  iPcHbl9yfPOp5+4RI85pQb5eL+b/yvU+pJluLVgZVbIyYUvtP8HUyxECqXN1PywtOxtr9/nL1
  h0VsnKvW8P3PPUxDA+YzmrlvmnFnJdKQVcf/P7Ke5ZryyyLJ29iw5iTrgZV1icozXVd0NZlME
  8rW2tnh/FXPuWM37kLTVgX7p8a1zj5jqgmf76NjPe+iNbqiZdXHJliH2YYqPaHIfQsC6eBa0v
  sB+HO1qPzahxZ9q74ETt1+vk/Iq3iq45v238lnLnx24Qu4Xeyf3of2aS17ys5Ev64qXbG0W8V
  O4QV1t1cFiXTrcRSnJFoqMVcVJwIAA87Zs1YAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1663640276!50719!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21251 invoked from network); 20 Sep 2022 02:17:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:17:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CC306157
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:17:55 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BF249152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:17:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:17:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] setxkbmap: upgrade 1.3.2 -> 1.3.3
Date: Tue, 20 Sep 2022 10:17:41 +0800
Message-ID: <1663640261-27242-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:18:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98877

add dependence with xrandr

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{setxkbmap_1.3.2.bb => setxkbmap_1.3.3.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{setxkbmap_1.3.2.bb => setxkbmap_1.3.3.bb} (75%)

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.3.bb
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
rename to meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.3.bb
index 30fbd1b8de..18fa63ead6 100644
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.3.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5feafdbe6dfe9e2bd32325be0cfc86f8"
 
 PE = "1"
 
-DEPENDS += "libxkbfile"
+DEPENDS += "libxkbfile xrandr"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "93e736c98fb75856ee8227a0c49a128d"
-SRC_URI[sha256sum] = "8ff27486442725e50b02d7049152f51d125ecad71b7ce503cfa09d5d8ceeb9f5"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "b560c678da6930a0da267304fa3a41cc5df39a96a5e23d06f14984c87b6f587b"
-- 
2.25.1


