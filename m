Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59605C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:29:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.90500.1679617781413523552
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T13Kbthg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617779; i=@fujitsu.com;
	bh=SrMCrRtrdSPgLF1FJDaNj3z5A+lZ5HCe2lizZ2dKSVM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=T13Kbthg+fMA6UYr8IcKCG3aNgFdQo08aPrzeINstjT2l21AlHG+tO76slfXyPRGO
	 Lroov5NomKYvV/nLwJ7vOFFNackiEvWEdliH+fvJFtAymY/2ATb4tZuHZT/zSJYiio
	 2pXRl9JYI6UiZUhm4mndvS25aLgm7NNwHg14CU05vD7R+MbAnMNy8m/dZpV2NwKgzt
	 2tpZf1OgPzOZBi2MeNtBgOA/AuR5qlKCNUQnskEvzUtVq5kUift+iENGnd3vQLVVe/
	 Js+juy8i4dUbQIfIifcJDQ1LVvCWaToXyvTAkc5Hx5ucySyI91ewAyZBrhe0u23Lnj
	 XhpAO/OnAO8Qg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqPvpnUy
  KwbrZVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bfaTvYC2byVBx8dYqpgfEbVxcjF4eQwBNG
  ib7vu9ggnOtMEnt2nGCHcPYwSvz6eo6pi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBZ4nW6y/AbBYBVYkNT7YC1XNw8Ao4STx9bwgSlhBQkJjy8D1YK6+AoMTJmU9YIMZISB
  x88YIZokZRYvblZhYIu0KicfohJghbTeLquU3MExj5ZyFpn4WkfQEj0ypGs+LUorLUIl1LvaS
  izPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKU4+u4Px
  aN9fvUOMkhxMSqK8EqHSKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeD+/kUkREixKTU+tSMvMA
  UYGTFqCg0dJhPfQWaA0b3FBYm5xZjpE6hSjopQ4b+JboIQASCKjNA+uDRaNlxhlpYR5GRkYGI
  R4ClKLcjNLUOVfMYpzMCoJ8woDY1uIJzOvBG76K6DFTECLnWvAFpckIqSkGpgiBYJ+v+Kzus2
  WuPv34aMfOeRff9j5bP1nWb+czEOdz/6tsKr9k5daNW3FvPe9UT9+3lQsk76W/qDi9/6OS9+M
  Ht1O/SgkXR2r/n+tnGVVZ/fU39u3SL1a16KUc9WA0SGQ0y5Bvrop7NPXc3c/1ltGLjiTImxRe
  qxvWt/v8HBf4fjWbdH3bjSr9bX0z1Prdr/s6Tj9lF+dSyfL+8g1fpX8WxLF3u7/+CJzY+5Rtf
  7Hd/Z1nNc8e9q54J/m4Ttvc1Qi9xdXFJ3eXPDsh03Yo2UKZ37yNyhN7uS+5mRmyqhxYfquD7F
  pmQkvNndkXrnSq+dfIrd/w0H1xSwTY3nkE7idCy4zBUWa9i3yEkjtVlZiKc5INNRiLipOBAB2
  1mI+QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1679617778!253279!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27226 invoked from network); 24 Mar 2023 00:29:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:29:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 54D4410019F
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:38 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 48D9710019A
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:29:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] consolation: upgrade 0.0.8 -> 0.0.9
Date: Fri, 24 Mar 2023 08:29:20 +0800
Message-ID: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101683

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:point to COPYING file

Changelog:
============
* Resync with libinput 1.21.0
* With libinput 1.21: New option --enable-dwtp
* Add new option --disable-mouse-reporting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{consolation_0.0.8.bb => consolation_0.0.9.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/consolation/{consolation_0.0.8.bb => consolation_0.0.9.bb} (86%)

diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.8.bb b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
similarity index 86%
rename from meta-oe/recipes-support/consolation/consolation_0.0.8.bb
rename to meta-oe/recipes-support/consolation/consolation_0.0.9.bb
index 0936b1ae19..17981b6e9b 100644
--- a/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
+++ b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
@@ -6,7 +6,7 @@ software include gpm and jamd."
 HOMEPAGE = "https://salsa.debian.org/consolation-team/consolation"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=73ca626e1d9048abfc7d599370650827"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7df9eea2f4dfdda489c116099e6fc062"
 
 DEPENDS = " \
     libevdev \
@@ -15,7 +15,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master"
-SRCREV = "4581eaece6e49fa2b687efbdbe23b2de452e7902"
+SRCREV = "5ef08f0cd6ede62de14de477b74fc3611108c676"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


