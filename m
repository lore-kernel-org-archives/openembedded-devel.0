Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9944C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:02:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.65445.1680512538045634568
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XmO1YaTo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512536; i=@fujitsu.com;
	bh=L3MGeOUtDhwiWz0GZs1jU6K2WA/ELQIYWMeb/GD5xto=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XmO1YaTofhyn3yEcZKf4fqZU8b4y1ih043PZI4znAmSJwf4mlHCQmVFMqKys7upax
	 k43I7JS719OV342vx3HKmpyV5rtSbgO8g4WzynsXKyavcFS2G8b4IsHWUb+WB+LQ9K
	 lPx7x9bjlnubgxm0nXUhx9KrPaLxMVW8mdpFf5FauWPD/JbOoEFY8sYeBNx066jIRo
	 8T79Na50x1BvixfKSnUnM/grl5QAvNw/hDCW0lf91ka0iHnfqFPHELOtfyINSEYI8F
	 R5nnIveto02usP0soFl4RbZ0bLOBPSqsCRXcmJmc5S9tC1hlJIdEj3lHDhnLjf8l/P
	 Mx22HOrDkAqEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSVdimla
  Kwc0p3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aB2U9YC65xVSzZvYWlgXEBZxcjF4eQwBNG
  iQvrG9khnOtMEsfub2eCcHYzShz8c4a1i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBa4m215uAbA4OFqD4lZ8xIGFeASeJF5fns4DYEgIKElMevmeGiAtKnJz5hAVijITEwR
  cvmCFqFCVmX26Gqq+QaJx+iAnCVpO4em4T8wRG/llI2mchaV/AyLSK0aw4tagstUjX0FQvqSg
  zPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAYU4oVJ+xgvNj3
  V+8QoyQHk5Ior2C9VooQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6DE4BygkWp6akVaZk5wMiAS
  Utw8CiJ8Ab3AqV5iwsSc4sz0yFSpxgVpcR5/aYAJQRAEhmleXBtsGi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmY99VEoCk8mXklcNNfAS1mAlrcGqUBsrgkESEl1cBkojDxgP6hswXP+R3
  iNLUWRucuUS8+GLZ4341tPJZf+U5Mlnyc8Dq7n13HoaZ4R3CU3rPJv7fKi+yQTL086e5aD/UY
  po2PerQ/vy07ftZgWZnwRoNFf/bNPmuzmT/0bAznOi0vxoywD0vMk5QCX+Z4/5SV6P9hfZIh+
  VrHo9JJK2M+vbq5U/Q7i4aCYsiNA9XfTts4eq27tJO3S5ap4tNSZ5fL+Z8rV12M3ZOZWN74cP
  /3+Vccz9g0tl8Kq4nIfsp5OLHq3VvNwJz5T//t/CU+0St5Evfp46bbWZ4uu79MUl9Q6MkZO/1
  z5yQ/rF/8T+FsYed5yW7bdcYJV+rL7xVUpHgcP/Gme4506wu92CppJZbijERDLeai4kQAqFaR
  FUEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1680512536!189917!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2583 invoked from network); 3 Apr 2023 09:02:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:02:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D397010047F
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:15 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C6B2C1000EE
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:02:14 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] links: upgrade 2.28 -> 2.29
Date: Mon, 3 Apr 2023 17:02:01 +0800
Message-ID: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101902

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Add "#define _GNU_SOURCE" to the configure test for memrchr
 Implement strike formatting
 Fixed a bug that image was sometimes displayed with too small size
 Fixed a bug that webp images from local disk could not be displayed
 Support AVIF images
 Updated Polish Translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/links/{links_2.28.bb => links_2.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/links/{links_2.28.bb => links_2.29.bb} (79%)

diff --git a/meta-oe/recipes-support/links/links_2.28.bb b/meta-oe/recipes-support/links/links_2.29.bb
similarity index 79%
rename from meta-oe/recipes-support/links/links_2.28.bb
rename to meta-oe/recipes-support/links/links_2.29.bb
index a36393f1c..e3a15d181 100644
--- a/meta-oe/recipes-support/links/links_2.28.bb
+++ b/meta-oe/recipes-support/links/links_2.29.bb
@@ -8,4 +8,4 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-libtiff --without-svgalib --with-fb \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
-SRC_URI[sha256sum] = "2fd5499b13dee59457c132c167b8495c40deda75389489c6cccb683193f454b4"
+SRC_URI[sha256sum] = "22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998"
-- 
2.34.1


