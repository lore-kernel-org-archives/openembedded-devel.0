Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18191C77B61
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:04:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.26465.1679886252535311787
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sBpleODd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886250; i=@fujitsu.com;
	bh=znBk9EGo7miv4SkV9z4vObCryQMjzrmSxyOXaX/NtHI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sBpleODd4F2EJfwmS5C9h01jL1RgZ8xmKajx9RCtREQrFQmTg8p1136ms/yLI9lqN
	 52ZQwrTUF91osPySEzL5u6ss+6j5ukSWcDIydK2Rh/7RUYLeML+RfHJ5zN8mRmPEnv
	 HrHS7SdWtszN6Ek2PesoCyOtPXms888B29ll3CRB2Ek5UUvCHCqdEr0dUYuMVqx1qN
	 YQqso1qaLJzaq/HMpwGdm5csudyawpKil6N/bdZCKLH1krtHGjuZzJN4YRR3CEHD7w
	 gdEbo0ziBEs/2wR6L8XS6Ea/psGwMlhE/OLoMqW7ElKh88nRJ6t38xc60Xr5mJbpPS
	 2Kf5XDA9jDpbw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLuSXTH
  F4OtjS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePOV4eCaxwVfydtYW9g/MvexcjFISTwkFFi
  Z991RgjnCpPE9i8boZw9jBL3rrWydjFycrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4C/Rdv4OC4jNIqAqsXn2DyYQm1fASeJE7z+wegkBBYkpD9+D2ZwCzhLXt/eDzRcCqjl69C
  EbRL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRrPi1KKy1CJdC72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDgTSlO/rGDcVffX71DjJIcTEqivNFu8ilCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhd2
  BRThASLUtNTK9Iyc4CRBJOW4OBREuFd80shRYi3uCAxtzgzHSJ1ilFRSpz3E0ifAEgiozQPrg
  0WvZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO2gkzhycwrgZv+CmgxE9DibwVgi0sSEVJ
  SDUwz+F+yHt4cc3FK9fbmRXkzCisTN9beslI4tWPNn1ITJe8zXrP0Nist2nTWO/jNPun05xOP
  z9w9lVlMWrLTV2dvvF2Pq+/KsDTt7AUVcZNrDJ5VqB+LcG68ty9AJbJP8x3TkqRFvkF2mgGzw
  ybx1N6zEpm4wPPm3W0rDc9cmbB2bmyu0co7Ht/Wd0rPOvl0usWZK/fd+3XrE6I/5X36/bEu00
  azKHyVy+u5lqK/a1zv7Ytb8tpZ5VJZvIfKun2L/5RxzND4Yy++/U5BBe/UrWqsF77d2Lf0wTL
  9F0HroplC+z1KAoxmz2fjePpGUnqayt2yjvvB7Wd0z2zYzmT6n0VIsVTb6JHQg76KfdN2ZP5T
  YinOSDTUYi4qTgQAbEOwXVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-745.messagelabs.com!1679886249!845451!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12465 invoked from network); 27 Mar 2023 03:04:09 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:04:09 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5469F1AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:09 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 49A201AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:04:07 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230312.0 -> 6.0.20230319.0
Date: Mon, 27 Mar 2023 11:03:30 +0800
Message-ID: <1679886213-20913-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
References: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101755

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230312.0.bb => ctags_6.0.20230319.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230312.0.bb => ctags_6.0.20230319.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230312.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230319.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230312.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230319.0.bb
index eb6dbeb16..feee721ba 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230312.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230319.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "457ed6ad02423e5bf210ad2bfa655125915a39bc"
+SRCREV = "6e720ab5591d24cd401b720a63110bc224780f6f"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


