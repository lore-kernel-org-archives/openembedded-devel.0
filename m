Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004F4C10F1E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:15:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.48597.1671538502893700715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e5zsm9ui;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538503; i=@fujitsu.com;
	bh=zejx5+5QCmLqM8wXZcFSwpw+gZxyONLeAJb3k0kE4iQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e5zsm9uiqZDfzXBMBOrNiHS14789SAZJwokdvCngpf2Y3EvsbdOHOoFR7k2Maq/bj
	 Z80fwoou+p7Isw8/ZMD4up3rw2mInrqhZYW7lQd4PhaUT+dnA/SSllvpdiiZQn4YfO
	 Z+ESFcm42uqSSYw+VPM0SZwSiot+KaV3BaCQtDZqR8OIcF3tsfk7Zc9kYYXqeIOk+Z
	 PFstLz2uHT5eaaQjMl0DHfMd2KCptcy/lD3lhC1BICydXw3ZMnKawYod3rl+1StDEi
	 gt+cix8oUwr8lAXMf4zH29FHXgpiVU2xowOaWar8MTUb3Vfwl/fOMQAaQyYj6+ClFq
	 gcA7E/phpyNUw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORqOu+fGG
  ywdWfkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aMI6uZC+bxVPxespipgfElVxcjF4eQwBNG
  ic7pjUwQznUmiSPvjrJAOHsYJSZ0nGLrYuTkYBOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAQuJ2/uNQcIsAqoSW/b9BivhFXCUWPZ3DlirhICCxJSH78HinAJOEis2rmMFsYWAam
  YfXQNVLyhxcuYTFojxEhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0FgvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB4U4oZtu5g7Fj+R+8QoyQHk5Iob1j4wmQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwzFgHlBItS01Mr0jJzgJEEk5bg4FES4e2ZDZTmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17
  YDzEIsefl5qVLivFzLgBoEQBoySvPgxsGi/RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6
  upUBTeDLzSuC2vgI6iAnooEOX5oIcVJKIkJJqYIpJ5Ktm8b7duziEPV0lKoDZQ+7QF71cye+H
  VYN3PtjR++ib/4TXbdGlrMpqxUef+8+4NW+J8v1L0yfN0TF6qpxo9SMg5nRr8OpvDE9CBQIi/
  ZNZHha+kU3S9Vr1+/PzRwr3Da3UyxW+XyiQ4rDal/TJ71b1w7PJu5YymUTymc089HSNiLnnT6
  btjqdZgk+csX1k8vDP/T1XTA8qai9ZMzNs+2ez2nk7fltOPHnl0opPatLefQ0xbYvLz85afFX
  oY7nwA+PcXWWmERd3nQmIm3H2/SrOGFU7U8b5z4R3XOkI5pMPWM05s25N0K5ci7yO29o/tnza
  Hn9z+YEDuyKFhBdmR8zzWff996mHB0Lq2hyUWIozEg21mIuKEwG/BB7pcQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1671538503!270412!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17027 invoked from network); 20 Dec 2022 12:15:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:15:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0D2D110019D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 001BB100191
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:15:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 7.0 -> 7.1
Date: Tue, 20 Dec 2022 20:14:25 +0800
Message-ID: <1671538467-7143-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
References: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100137

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  build: fix compilation when configured with --disable-comment
  bump version numbers and add a news item for the 7.1 release
  copyright: update the last year for significantly changed files
  docs: say thanks to the Albanian translator
  rcfile: report an error when an included file does not exist
  text: upon Enter, eat only lefthand blanks, not any other characters
  tweaks: avoid passing NULL to access()
  tweaks: wrap overlong lines in the Tcl syntax, to make them manageable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_7.0.bb => nano_7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_7.0.bb => nano_7.1.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_7.0.bb b/meta-oe/recipes-support/nano/nano_7.1.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_7.0.bb
rename to meta-oe/recipes-support/nano/nano_7.1.bb
index fe3ed2d34..c60135415 100644
--- a/meta-oe/recipes-support/nano/nano_7.0.bb
+++ b/meta-oe/recipes-support/nano/nano_7.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8dd6eac38b2b8786d82681f0e1afd84f6b75210d17391b6443c437e451552149"
+SRC_URI[sha256sum] = "57ba751e9b7519f0f6ddee505202e387c75dde440c1f7aa1b9310cc381406836"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1


