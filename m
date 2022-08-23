Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC03C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:52:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.29112.1661244715289595208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ixYqaaZU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661244713; i=@fujitsu.com;
	bh=T1EJiSxgGsovK4kHPk9GjfCOJqR9d2vA0LBzqlHRNBU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ixYqaaZUccgmw9NLoC99I5Zy1wNwhbJG4m7mXJkL51/FCwJ2Xxe0gw85+MHnLDZo9
	 IkQGJ6qpPOWmuNaZ3MLhTltVlqjJkKm6u8xKjgqo5GTatGvE8aVX2feoqD0UyK4RJw
	 pIcbkmCdjbEl6ZTw7C3QnCInqStgElSDAcMHXYjwTakYF5hltP/HMKBngbSk9EJYs2
	 /Cdz4DrXQQYLTgglAE21N42Lp6zcpTOvNUWBsWvdL7Mnc9gCI1+edDuvpRLxTIC+mY
	 GvDeEo4Y221UggfTOJUYxbq5Sm8rTvUSwjyjBB79zGoYy/YAZwG5//4PTqt9cVJCYM
	 316maghzV4dvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSVdzKku
  ywZaZnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aGJcdYCn5xV+y/1MjUwNjA3cXIxSEk8IRR
  YsrqxWwQzg0miReL1rJCOHsZJSa37WHuYuTkYBNQk5h+6wYriC0ioC+xdDZEnFlAReLF7x52E
  FtYwFVi776XjCA2i4CqxK2f38FsXgFHiZfz14DVSwgoSEx5+B7M5hRwkrjSvo4NxBYCqpkz6R
  obRL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtSYs+sfiYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRqukosz0jJLcxMwcXUMDA11DQ1NdYyNdQxO9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAME4pVuDbwdi86qfeIUZJDiYlUV6HepZkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8wpOAcoJFqempFWmZOcCYgklLcPAoifAeBUnzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVU
  qcl2UyUJEASFFGaR7cCFh8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsIZApPZl4J3KZ
  XQEcwAR0RtJsZ5IiSRISUVANTnPV5aVfpneKbV5aeV7zn8PZh+b/697M542p1f1Z3nFCOz/a9
  uke8v/DT8fQWDp1fol5LTmmZxhy1vXxbWc9ZP3uRwuIM/uDDfz6bfU70m8Ly+6fGzkXbjZc/X
  qufNSVvm9sEi/mlRl3/mfQXTiiKrN+8uGBmRL2D69WZwkl2Dsant2XfaZVp2nclS/540cvsqj
  3pU62eGFtzMx8s9VYJYzm4aZ9Uz4sKg4fzJgtY9D9S16y3mdqS2Pu9L2xDipVM3qV7O+tY959
  OXFfMFx1SMUf6B2vxE42dmx3/mHGcnPxnddHVO9yTr8ffUDl58T8/8+LiOUnz21Ye7b73qWWF
  J+ezM16HopjuSAMT/Q0lluKMREMt5qLiRABuLgOJagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1661244713!390540!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4575 invoked from network); 23 Aug 2022 08:51:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:51:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D04C31000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:52 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B80841000C0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:51:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libsdl2-ttf: upgrade 2.20.0 -> 2.20.1
Date: Tue, 23 Aug 2022 16:51:29 +0800
Message-ID: <1661244689-4766-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661244689-4766-1-git-send-email-wangmy@fujitsu.com>
References: <1661244689-4766-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98387

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl2-ttf_2.20.0.bb => libsdl2-ttf_2.20.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-ttf_2.20.0.bb => libsdl2-ttf_2.20.1.bb} (88%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.0.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.1.bb
similarity index 88%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.0.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.1.bb
index 4728022a27..b8732b4c86 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.1.bb
@@ -5,12 +5,12 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771dca8728b18d39b130e19b36514371"
 
 SRC_URI = " \
-    git://github.com/libsdl-org/SDL_ttf.git;branch=main;protocol=https \
+    git://github.com/libsdl-org/SDL_ttf.git;branch=release-2.20.x;protocol=https \
     git://github.com/libsdl-org/freetype.git;branch=VER-2-12-1-SDL;destsuffix=git/external/freetype;name=freetype;protocol=https \
     git://github.com/libsdl-org/harfbuzz.git;branch=2.9.1-SDL;destsuffix=git/external/harfbuzz;name=harfbuzz;protocol=https \
     file://automake_foreign.patch \
 "
-SRCREV = "f5e4828ffc9d3a84f00011fede4446aecb4a685f"
+SRCREV = "0a652b598625d16ea7016665095cb1e9bce9ef4f"
 SRCREV_freetype = "6fc77cee03e078e97afcee0c0e06a2d3274b9a29"
 SRCREV_harfbuzz = "6022fe2f68d028ee178284f297b3902ffdf65b03"
 
-- 
2.25.1


