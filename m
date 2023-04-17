Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF6FC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:48:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.48491.1681717696142265765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vlIj8m8T;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717694; i=@fujitsu.com;
	bh=ss3tKRznQw5ia36pdevhLJ9TWBiLdWzIAMm1Fth8UHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vlIj8m8ToSD7VmefJ2mp5CuRVgaY6+YTP5IntZxfOZE88jAk2qjBBQ67zHR/JXD1P
	 iUcKGkCjoUimfUVhlUO/wFLqXkWScVyU/qMbYUEEsfnaEL9xek/8g5/yz9EEs9UBUX
	 Jyke1Mwl9rE6pHexP2D+n7WIV14MYhvjcHW+tbmFmZTksXsVVCMEH74s06vGO4Oa0d
	 SR0DyhikeP1J+yyz1Rgo7vz4p65U2mWY0otMokhAry8zH3X5ZmW5ppIuFt65H8hJEm
	 3lA5rflM5U1p7JeC/ncBg+OAUy5p/+2+gYLxGZMFYT7tR0mwa0vMV3gtNn0Ab+coMk
	 HEEO0YbPFXMgg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLvvp02
  KwbkjfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8alV2sYC7q5Kn49esXWwLiMs4uRi0NI4CGj
  xJ7NZ5kgnCtMEo8vf2aGcPYySrzvP8fYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAn8S284vB4iwCqhLdLR+YQGxeASeJ5k03weZICChITHn4HqyGU8BZYvGr72BxIaCaD9
  M3skPUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXUSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3pRi5Yk7GFf0/tU7xCjJwaQkyvsi1TpFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv+
  W82KUKCRanpqRVpmTnASIJJS3DwKInwGj8DSvMWFyTmFmemQ6ROMSpKifP6fwdKCIAkMkrz4N
  pg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvpB9AU3gy80rgpr8CWswEtFhOCWxxSSJ
  CSqqBqUv1YUv9Je1bCy9mWDNF7avQ0H93wEfbaY1YmdZzXe3LyVsnzLziX5j/d4fBZe/z514c
  6Fj5/aDM0aA7eV2iByZdjrN74/S6xeXKF+/TR7xP7YxouxmVsezCw72HfXTKVHOa/d377vk4z
  bhy/Y7vFu9OVR+/qk1PjdcIrZ3f38hfvaw65/6myu1Cly8u9jFRiN5lnVLkZZRydbd8054ipV
  sZu2dZ2E42FZfdKcbYPa326fLr0U/P3int9674nBNyyXTx5a+b0pct5b0Q6foh50ncUht/syV
  /V6dx3uudqmj0vvzY4/m7Jh456+gW5b7XL6fZVpmF02FP2Up1/7iY1UZ2VrcNX966rCP+5OmC
  qUosxRmJhlrMRcWJALchLXVZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1681717694!405762!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9527 invoked from network); 17 Apr 2023 07:48:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:48:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EA9C51AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:13 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DEBC57B
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:48:12 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.55.0 -> 0.56.0
Date: Mon, 17 Apr 2023 15:47:42 +0800
Message-ID: <1681717665-19231-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
References: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102118

From: Wang Mingyu <wangmy@fujitsu.com>

Feature
==========
    Reduce denial of service protection overhead

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.55.0.bb => python3-zeroconf_0.56.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.55.0.bb => python3-zeroconf_0.56.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
index 83027e5fb..20dc96219 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "f919c0a1989af87c1c4a8786a3bcd8e78243856237cef27dcb762a7e69e4b32a"
+SRC_URI[sha256sum] = "d21916e98de8d4cb822134b25746dcf321531b8662757a7da402798ba627062e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


