Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED73C7EE26
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:04:25 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.66544.1684069463206664297
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M9jCZLOn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069461; i=@fujitsu.com;
	bh=wuvrYyonDZGQNS8GV2iVBAxUxBc01bEnyCY1pJZIOcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=M9jCZLOn9ccLVNxN6O3MvurN83gUCaZXcoroATFYWNdv7wto6k0qena4MxHYHT2jG
	 dshNtLHs7J3nVrV+Z2km5mWo+coSKqCBWU1/o78rJ+00r6I3htix16z+Vic+q4iza6
	 kxdbthSwPPEqG7oh96JyPCrAwiRQqqx+5+rpgqlxe4NfZbdjDEbxiEySgpRp330xID
	 PtTOntTcN21eRX6lFL5zYy4QQozCJfzI+5fKiDQ4+BZKvP+Vrg0KhClBVLZnffmjl0
	 pqWVjBrK+xrgVyoma0e1/6BYciubVkmV7TbVneiyrf7T3OzfhNUtsCbXZSf6EOssS5
	 G4QT9Fo0I6TLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpBtyJyH
  F4GMnk8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF3fwdTwR/eikUXprI2MF7j7mLk4hAS2Mgo
  cWXCHTYIZyqTRNP150AOJwebgITE9L0n2UFsEQFdiY8f5jKC2MwCKhIzJh9h6mLk4BAWcJf4s
  EQdJMwioCqx4uNmFhCbV8BJYtqHD2BjJAQUJKY8fM8MYnMKOEus2naQFcQWAqlZcJsRokZN4u
  q5TcwTGHkWMDKsYjQtTi0qSy3StdBLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7
  WK67MTc5J0ctLLdnECAyIlGI2px2ME3f91TvEKMnBpCTKe60kLkWILyk/pTIjsTgjvqg0J7X4
  EKMMB4eSBK/OzYQUIcGi1PTUirTMHGBwwqQlOHiURHjjrgKleYsLEnOLM9MhUqcYFaXEeQ+A9
  AmAJDJK8+DaYBFxiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL88NoCk8mXklcNNfAS1mAl
  p8a088yOKSRISUVAOTtOj1GZPqnAPkV6/tM+G4mvc8nr/z96yA1dYtn1PP1jhFPNTMYnzxLLP
  cueTtyeWHE7+5zJZ6cpnfjG/LjsevFnprn11f/OL/+j0lWdHr5Lat/qYulszoszctnE/xyFvD
  6G2+3xh88tkPXfnN1CaXdCxQqMdF8Y11vN1Tw+c/q66fb2Wz2SvgnxMadmzOZs6+smWlM00uv
  ej2mHDRXaf46M+0+vtTNOod1u+dxFkk8S5LOMNDuEnx0vJzB1c8tf55hHcp6/xd9Wl+e9N/Pj
  Vbca3zWc5E245D9kLuq5c/u/k7jaPVVM5g/oXQ1B9aM2y8T01zU5yQfbKXO+GiQdv6KeKLVna
  1iMrEFt2IVp2nxFKckWioxVxUnAgAZWIVGwMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1684069459!585824!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9763 invoked from network); 14 May 2023 13:04:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:04:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A95661AE;
	Sun, 14 May 2023 14:04:19 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CF8887B;
	Sun, 14 May 2023 14:04:18 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libdivecomputer: upgrade 0.7.0 -> 0.8.0
Date: Sun, 14 May 2023 21:03:59 +0800
Message-Id: <1684069442-12244-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102567

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
New features:
------------
 * Add support for new backends:
    - excursion: Deep Six Excursion, Crest CR-4, Genesis Centauri, Tusa TC1, Scorpena Alpha
    - screen: Seac Screen and Action
    - cosmiq: Deepblu Cosmiq+
    - s1: Oceans S1
    - freedom: Divesoft Freedom and Liberty
 * Add support for some new devices:
    - Aqualung: i200C
    - Cressi: Donatello, Michelangelo, Neon
    - Mares: Puck Pro +
    - Oceanic: Geo Air
    - Ratio: iX3M 2
    - Scubapro: G2 TEK
    - Shearwater: Petrel 3, Perdix 2
    - Sherwood: Amphos Air 2.0
 * Add support for parsing the decompression model
 * Add a public api to configure the depth calibration
 * Add a public api to configure the clock synchronization
 * Add a basic Android build system

Removed/changed features:
---------------------------
 * Migrate to Visual Studio 2013 (or newer)
 * Move the Visual Studio project to the contrib directory

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/libdivecomputer/libdivecomputer_git.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index 2f67b12a8d..87778c6314 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -8,9 +8,9 @@ DEPENDS = "libusb1"
 
 inherit autotools pkgconfig
 
-PV = "0.7.0"
+PV = "0.8.0"
 
-SRCREV = "47cbed5355ffda7b952193a770a9a9fa9f89b25b"
+SRCREV = "db9371cf9f38b5a3b2f6e4fae3f92eb052d2d929"
 SRC_URI = "git://github.com/libdivecomputer/libdivecomputer.git;protocol=https;branch=master \
           "
 
-- 
2.34.1


