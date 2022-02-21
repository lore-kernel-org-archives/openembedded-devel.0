Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49164C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:22:41 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.10726.1645449760247313110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=owOcoPRg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449758; i=@fujitsu.com;
	bh=/3rDcNSYaU0lt/7hqK7g2QJeqXo4S/zXcQ+/OUgiwqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=owOcoPRgWVE4ThbkfiZS4KNeyp19HN4RtbPH2uRWjWpJehgpx+PE0ZnxXRrzKnqzk
	 W+B4R6RM8vnLGZnw4qfwekyjevNViQnsFi0yoQ2yVy2EW/z2gsCKgOZtJr+uYeoBB0
	 YDtL6eCThK8+ITaRPJRfV3mrHEBqoqVPaI1IuLam/Uad7lPAjoYIw42wKyXVhL+g9S
	 /K54kjAYkw6whaNq3kER5vmdp3xZZSq9idpKZ0OJo287SRp6Ygkdm8geiGS2YhMgJe
	 MtYR/ylYIkKK35HK2Ds3QI/9bQ2CJugEfL5L6DXtnsxUY6vKYcBSI2Jall+e+GVDU5
	 nOcQlbabDum4g==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id E6/D5-21232-E1293126;
 Mon, 21 Feb 2022 13:22:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqCs3STj
  JoPMwh8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF+2x+WgstiFVunP2VpYHwo3MXIxSEk8IRR
  Yub1GUwQzgUmialrzrBCOCcYJZbfv8HcxcjJwSagJjH91g1WEFtEQF9i6ew9YHFmARWJF7972
  EFsYQF7iV8LvzJ2MXJwsAioSpye6wgS5hVwkrh5ZTlYiYSAgsSUh+/BWjkFnCXOdzxhA7GFgG
  rOtO9hgagXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVolVSUmZ5RkpuYmaNraGCga2hoqmuia2RsqZdYpZuol1qqW55aXKJrqJdYXqyXWlys
  V1yZm5yTopeXWrKJERjEKcUs73cwNvX91DvEKMnBpCTKW9sunCTEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgle4HygnWJSanlqRlpkDjCiYtAQHj5IIb3kzUJq3uCAxtzgzHSJ1ilGXY9OaG3uZhV
  jy8vNSpcR5BScCFQmAFGWU5sGNgEX3JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvMEgU3g
  y80rgNr0COoIJ6IgpWUIgR5QkIqSkGpgYZN+v0H7H6HljJq+JRf1L0ckGV6qf7zQ/N60xyppN
  4QJP4rsZYVGbV14PVBZgeSoz89KKz0/W+nyKmGV7N/1ijEHImU/Tehu+MYa/2HEv58OENyXX1
  lnsyD7979kD70m79x8JZz4oVDprnbhCX+A0loxFKjtDz6iYRS6Keu9Yd2S2XlU6Z/izWdevxT
  WylXB1r+S7kPHjLvvfwwZ7/I7GHF4tG2c8ZdtZ/SrD2N8z2ypvGnyq/vBK4b7HhperOn9JXjP
  SEIg+usb7mULIdKXZkYKsdTv8Zm1/sEzAkvn2Id89H2zuiDyNWLzbMn9O5GYrzZQDQg0WZT5m
  jZxO0Q1nRQ3uCX1/6PM6do8Fv7u7EktxRqKhFnNRcSIAe9dTgmkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1645449757!8460!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26354 invoked from network); 21 Feb 2022 13:22:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:22:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9E78510019C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 91E59100185
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:22:20 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gnuplot: upgrade 5.4.2 -> 5.4.3
Date: Mon, 21 Feb 2022 21:22:07 +0800
Message-ID: <1645449729-23271-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449729-23271-1-git-send-email-wangmy@fujitsu.com>
References: <1645449729-23271-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:22:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95412

Changelog:
=========
NEW "set pm3d border retrace" will use quadrangle color for the border
NEW "nogrid" flag for plots to opt out of dgrid3d processing
NEW option "above|below y=<val>" for "plot with fillsteps"
NEW "set style histogram nokeyseparators" suppress blank key entries Bug #2473
CHANGE always allow palette color for non-plot elements of 2D plot
FIX contours were incorrectly allocated space in the key even if "notitle"
FIX evaluation of unary minus in front of ternary operator Bug #2468
FIX arm and s390 require "signed char" Bugs #2467 #2450
FIX range errors if "smooth csplines" applied with x-axis reversed Bug #2465
FIX handle various corner cases found by fuzzing
FIX textcolor should accept "linetype N" Bug #2459
FIX Windows: handling of Window messages for piped input Bugs #2204 #2412
FIX aquaterm: auto-configuration use of Frameworks Bug #2419
FIX qt: pm3d quadrangle borders for transparent surfaces
FIX png/gif: gdlib auto-configuration issues
FIX dumb: limit enhanced text markup to single-line vertical displacement

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnuplot/{gnuplot_5.4.2.bb => gnuplot_5.4.3.bb}  | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_5.4.2.bb => gnuplot_5.4.3.bb} (86%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.2.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
similarity index 86%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_5.4.2.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index 5504515e98..087b69faae 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.2.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -11,19 +11,18 @@ inherit autotools features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=archive \
-    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
-    file://gnuplot.desktop \
-    file://gnuplot.png \
-"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=archive \
+           http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
+           file://gnuplot.desktop \
+           file://gnuplot.png \
+           "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
     file://0003-Use-native-tools-to-build-docs.patch \
     file://0004-Add-configure-option-to-find-qt5-native-tools.patch \
 "
 
-SRC_URI[archive.sha256sum] = "e57c75e1318133951d32a83bcdc4aff17fed28722c4e71f2305cfc2ae1cae7ba"
+SRC_URI[archive.sha256sum] = "51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
 
 # for building docs (they deserve it) we need *doc2* tools native
-- 
2.25.1


