Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882B0C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 09:47:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.47511.1653990434062940609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 02:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qOiFx4A1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653990432; i=@fujitsu.com;
	bh=n5lIazWDWQAOE/6sXniKMv79TvQShYbrFJ4UYzO4dgI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qOiFx4A1C1dC8F8L0SuzoWFRchZj1EZX8JK2puOnQrEqDu/hh+Ye97SzOGqMhbeZK
	 lJnYwWUf/aU6xfq9r52jy5xMIlyPPFAwBsJkdyg9zXIwiRL05QG2vymMUJkjXuIz4c
	 qgRRbEoUVUMqwvHcgKfb9VQKFCkOsfyA7qVFU9bH4EIGXJ6yb1qbo0W5w3bFJTnyDm
	 S6rMp0STD6F7yrUxqCEr1KoJsf+0vNUGwX/Tkl7v497hfnu/ket2hUb16S9kgtSNC+
	 +frEnb4ICeZR3kUMG7N2rANUHaJAYIQ0KkVRKp7gEZ7Y4qAL+WHPZNgqfvlJdBrC5L
	 EgLH4jUexRy8g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqCv/ZGq
  SwepHehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCG52MBQc5KppmzGRsYHzM3sXIxSEk8IRR
  4m7zB2YI5wKTxPOL64AcTiBnD6PE+mW8IDabgJrE9Fs3WEFsEQF9iaWz94DVMAuoSLz43cMOY
  gsL2Es0T5nIBGKzCKhKnH94D6yGV8BJYtb7d2C9EgIKElMevgeLcwo4S5xvfQ61y0li+e/d7B
  D1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7QsYmVY
  x2iYVZaZnlOQmZuboGhoY6BoamgJpY11DEyO9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwFBOKU7v28G4cd8vvUOMkhxMSqK8wZenJgnxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4F3yGCgnWJSanlqRlpkDjCuYtAQHj5IIr/tDoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR5J18DKhIAKcoozYMbAYvxS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeXtBVvFk5pX
  AbXoFdAQT0BHXvk0BOaIkESEl1cC0xOqEp57X4zMqToVSLwOj5DQKDl6f+MEm1s7g8ek9H0W4
  T3L8vXXSU+Z7fdaUtprlbaFL1T6+/Lrr6uvXS0tkH8T8tzl6Zb5Dqli3yrkl8spHvh+fPO2Wy
  IIvp2Zc2Zpwfc6xBt1ohrtye84nf/EK/VnYo6P2dp/7pydJD4L9BQ/tnbHDyt/DLUM/+ZC6lV
  PEs72/e7dKWFk/2HCsZ8beXOOLdhd27SmY65O4jG/RGVcdH0v+psmRp/cz/Tq/skc1cA9jW4S
  9+arnu3qCmLvK/vNavc/bzlt0/GxG98rP2S7L/Mwcdn4wK2WtkTZTE1RLDI2/YOxkLNqt4nmO
  O2B1uuHhgu8K/7+WarCmtLMpsRRnJBpqMRcVJwIA7tXQQGwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1653990431!222001!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31459 invoked from network); 31 May 2022 09:47:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2022 09:47:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 138A2100194
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:47:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E5CBF100183
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:47:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 31 May 2022 10:46:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.5 -> 4.3.6
Date: Tue, 31 May 2022 17:46:40 +0800
Message-ID: <1653990400-31527-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653990400-31527-1-git-send-email-wangmy@fujitsu.com>
References: <1653990400-31527-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 09:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97347

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.5.bb => ser2net_4.3.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.5.bb => ser2net_4.3.6.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.6.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.6.bb
index 79d54038e..21fbdb684 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.6.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "848c4fe863806e506832f1ee85b8b68258f06eb19dad43dbeee16a2cfe5d9053"
+SRC_URI[sha256sum] = "65515c7e9a5289167ae64c4032450904449a87ce20653241022af4f5db2e9510"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


