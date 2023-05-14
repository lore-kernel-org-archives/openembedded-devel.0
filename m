Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3A8C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:07:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.66083.1684069649193603508
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oj4v+z5I;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069647; i=@fujitsu.com;
	bh=1w8hDFPOh5scORFBEjySfn4PMipT2B0Zd1J6RRNY/FQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=oj4v+z5IHUouai9Sz3xmo3JfEVYeW43Ho6ts/X1x13hk55bUkhB3u5lxBphwLkF0o
	 63W7ovzd76cWgK0ySBNOJCMqKN6e2gtx3nikNOpB8lXibTbbHipFNAfiKTTd2kwiDC
	 VWndif1qTEcB3z/1LFkGGDI3LcZwEax4PM43Pk6Wb5p+OUk20imp/eDG3iQ0qK54ES
	 8Jnp63fVGBz91500RGozfR5piVr4I8ZyaoC0YSrdOE4cg/f1wilIWslZGQeMV22pZW
	 QJPypPW6rHVL8WKu4KZ7kz5jGWPlb9INuNOF3x8bKNYmIMGpQlU8flIztlqRKZ4nQp
	 gfBXIJlQOqYOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRWlGSWpSXmKPExsViZ8ORpMt3NyH
  FYPEieYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePhhHb2gjnCFb/eT2NuYLwo0MXIxSEksJFR
  YunFF0wQzlQmia43T1i7GDk52AQkJKbvPckOYosI6Ep8/DCXEcRmFlCRmDH5CBOILSxgKbH1y
  gKwOIuAqsS+RcfAbF4BJ4kvrw6DzZEQUJCY8vA9M4jNKeAscedWJ5gtBFRze/k3ZogaNYmr5z
  YxT2DkWcDIsIrRtDi1qCy1SNdEL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+
  4Mjc5J0UvL7VkEyMwJFKKlTp2MF7f+VfvEKMkB5OSKO+1krgUIb6k/JTKjMTijPii0pzU4kOM
  MhwcShK8OjcTUoQEi1LTUyvSMnOA4QmTluDgURLhjbsKlOYtLkjMLc5Mh0idYtTlWNtwYC+zE
  Etefl6qlDiv+h2gIgGQoozSPLgRsFi5xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYl+cG0B
  SezLwSuE2vgI5gAjri1p54kCNKEhFSUg1MDq9ZE9cl1Wyen6IuZzp5y2b7aT+1wnsEzeW/em8
  8z+55+FPQHh9bRyGG+md84S2qU6rnT1qs7SV07eg5zU+VCatlbzecfbvVe2LL24iZzbelnkxP
  lzcRFmrV2+n25VO37+RTs7ZKy6UE3jBZ3Wwe5fxBXD9aY5bHd86KDadt932zM2S/KJRX59v5u
  PO2769l39VDTR8zh2wu+pBZpfKyWKr5dOTqrYJWF9tLBd5PNd94vdFK6eQisSVtER6vEkS0eb
  V0X7KctQl80iJUo832bM+FnKk2ByZd4Pq24EHgdbk9k8xvR0260Mctumh3xn0H5k0T+Hhtws8
  37PKe+/jO1p7yHpUPURO+Ce7PY2JWYinOSDTUYi4qTgQAwdmHRRADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1684069646!468448!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16196 invoked from network); 14 May 2023 13:07:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:07:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3D5DD1AC;
	Sun, 14 May 2023 14:07:26 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 643597B;
	Sun, 14 May 2023 14:07:25 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 379 -> 380
Date: Sun, 14 May 2023 21:06:57 +0800
Message-Id: <1684069617-12375-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
References: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102585

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- simplify the change for sixelScrolling from patch #374
- add xterm+focus and report+da2, update report+version building blocks in
  terminfo, from post-ncurses 6.4
- drop the -title option from uxterm and koi8rxterm, because that interferes
  with deriving the default title from the -e option (Debian #1031837).
  Compensate for this by using the -class option to derive a default title.
- improve description of readline 2003 mode in ctlseqs.ms
- other improvements to status-line feature
  clear status line on DECCOLM
  ignore DECSASD if no previous DECSSDT
  allow DECSSDT 1 immediately after DECSSDT 2, i.e., without switching back to
  host mode.
- adjust RequestResize to avoid shrinking screen when using DECCOLM while the
  status-line is active
- disallow wrapping before the beginning of the screen, to the end of the
  screen, for cursor-back sequences (Redhat #2182357).
- modify makefile to install the 16x16 xpm files
- update test-package to reflect resolution of Debian #906901.
- change default of showMissingGlyphs to True.
- improve handling of double-sized characters when those happen to be missing
  from the bitmap font and/or are fullwidth.
- pointer/overflow fixes
- configure script improvements
- fix a typo in the underline cursor thickness derivation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_379.bb => xterm_380.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_379.bb => xterm_380.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_379.bb b/meta-oe/recipes-graphics/xorg-app/xterm_380.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_379.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_380.bb
index 1c32b5d5b3..377c2758b0 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_379.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_380.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "a7ddf274ee84b97fb1283675009d53ca2d02a0ffd5ce5a5118dafc3623ebb310"
+SRC_URI[sha256sum] = "0c1dc1fa800fa64b5c58d16ddb905e700b27ca538a65be8c03b2ba5761106c38"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


