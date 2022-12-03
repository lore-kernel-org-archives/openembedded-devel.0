Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B03C4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:16:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.101766.1670066214140610408
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uWSLLc3X;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066212; i=@fujitsu.com;
	bh=lXPj2y/iFb/n2LzbtUXnzA2oGE/+yYf95gRGjKZPkyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uWSLLc3X0T3kMIAO1Flg3MM2VHUWnfxOeXvPhHSnqgznNorPyh6I+kZuDnc0upgzk
	 wq4BoexVnU/dZedsVniZ3KajNNxERvmU8Tug9hYL0TdmkY4dEgo2674ppSRuUa9rrM
	 rZlOCl3SkyIIZPPCz3TSOEcvehpbXZVY+L2jZgapQ97hF9UTAyi8fSXlXvAH80T+pC
	 Oru+lJxWK06C32qXB8vujfZ0HyAxQUs0TiW2OAEwQSxcLTDtHvF5pBJ7A5gb0xK42h
	 C+ztGJSwU2lIQUjiMlR2MfTkIZ2kTF++YDMPzrKvSK9KUv1VGw6mc5maAaTr/AT0f3
	 ScV3WDoZjBEdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSVfZoDv
  Z4MBlTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP0/1eMBQs4Kjad+8/UwHiEvYuRi0NI4Amj
  xMaG+awQznUmiYkb5kE5uxklNl3ewNLFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICzRM/qjWA1LEDxXy9mgcV5BZwkTk7azwhiSwgoSEx5+B6slxOofk/vTaD5HEDLnCTe3h
  SBKBeUODnzCQvEeAmJgy9eMEO0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhanFpUllqka6yXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeX
  WrKJERi6KcVs1TsY3y79o3eIUZKDSUmU91hYV7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5A/
  e5kIcGi1PTUirTMHGAcwaQlOHiURHi7VIHSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5US59
  2kB1QkAFKUUZoHNwIW05cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOKgUzhycwrgdv0Cug
  IJqAjNvJ3gRxRkoiQkmpgWj/D09T9t+zEm7rffp26f2GrRYCr8x3WtRPPPZiw1qk7rVkrcpeh
  /w3D61/2RzS67JGLUe/pWVN4+mPcoc4q7WTf08t/iiiorFr9svvxB7sdC94zfty7wth6TYf5j
  cj55ve1eA5/OfzwYainl4j8hLLPP+/V8fZOtPp6YZrN6rnRx3aV3Xt0M3vCwrd+bDtKG+KiH7
  gr/yrRWbXtQYsY4xuLC0ICCkvrdrXe3ifqlVA54ZHfok61HWxn2Zd0fDjwXlRLXdN39sTPuTx
  K4veLKm7kOH/ZamfEnHmoPNdhQ05egPLzhW3r72c2mnlnZ0wt33w7r+eeXcbD8HvqDyS+7jvj
  X/TE7NAtvT9sh+uZPZVYijMSDbWYi4oTARhMyO5kAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1670066211!42250!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31287 invoked from network); 3 Dec 2022 11:16:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:16:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4F0C11000D5
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 41F311000C1
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:16:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] python3-apt: upgrade 2.3.0 -> 2.5.0
Date: Sat, 3 Dec 2022 19:16:16 +0800
Message-ID: <1670066176-24685-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99930

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-apt_2.3.0.bb => python3-apt_2.5.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-apt_2.3.0.bb => python3-apt_2.5.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb b/meta-oe/recipes-devtools/python/python3-apt_2.5.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
rename to meta-oe/recipes-devtools/python/python3-apt_2.5.0.bb
index ec1539b44..57da3b34d 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_2.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=main"
 
-SRCREV = "6145b6484d220685edfd922d364afbf065127efe"
+SRCREV = "adf41e6f4088845dcb9e85de0436e25e8d32da25"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


