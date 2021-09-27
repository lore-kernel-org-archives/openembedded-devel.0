Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A609DC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:54:29 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web09.30734.1632747268215996873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Bz3VYJ9G;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632747266; i=@fujitsu.com;
	bh=lwdqWXrQtizmSHiK6131jJV5/Vad3BrYqBwS1izyo0M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Bz3VYJ9GWkHQl0zUXIIVegMnsli9ZuL68nEWKFVOiMQhARcZ3KCo3Wt5m0XoDxJYa
	 bhhHaVtToQjBkVmvHNcSCfPE0MtMR719WseYMnyWtL03GVA/gWomrd69QrO+IQ84AJ
	 47lWfkG6+a0x6EhIIsAL/GfZRBj4+qyL4+iJND/75PZVpSWfr4ajHaS5rGUONy8rIl
	 rDeQ2uGNTJ4FaXvU0RCx85MSlN5FLrzawIaozG/EJlduF/bIOvIM5gHXFDGEJkfWX7
	 sa03xMc91/p6e8gXwk1IeBwFIDfx2l7r+N+wF+3NrxBK9p8eMKvuOudu/QkqNZpx7O
	 X2BSoW1SWlXSw==
Received: from [100.112.192.69] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id F5/E8-01625-20FB1516;
 Mon, 27 Sep 2021 12:54:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MRqsu4PzD
  RYOU/E4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPH5i72gjmcFWcnTWNuYNzE0cXIxSEkMJtJ
  4tzrFYwQzglGiWW7t7F1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSzgKXHy/
  m4mEJtFQFVixZ2PYDavgJPEhCfPWUBsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzBA1ihKzLz
  dD1VdIzJrVxjSBkXcWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQEYhMTvcQq3US
  91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAAEspODBhB+P+1x/0DjFKcjApifKGrA1MFOJL
  yk+pzEgszogvKs1JLT7EKMPBoSTBO2MPUE6wKDU9tSItMwcY7DBpCQ4eJRFe571Aad7igsTc4
  sx0iNQpRnuON2uXLGLmaLt3F0jOXHBwNTPH/fZDq5mFWPLy81KlxHkNQNoEQNoySvPghsKi8x
  KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5skCk8mXklcLtfAZ3FBHRW7aQAkLNKEhFSUg1
  MMx6sn9UU8Zi56qhhrF6KugPfohUB6zst6kzWbNYpDgrh5GU76/WzP90uR6y/PV814GtHitjN
  eZLJKtu/e2hHbOZKyVunYb77XP8jK62tnvs0f3XcaeK70mt/pX32WWfzJ5VaRcE5tuXPFY7d+
  615tjd0acLiWRrHq8/OFJzqaBVVNd8q/ax3o3tVSF+qUuFmq4Vnos549VxZfunMTP3N2WyOZ9
  f5mWQ46E9PXbrVuPzYoqSTX8/XXX2q0SrVvEffMXBfJbfuD+WWSZ46CfI1pVe/MLvNvO3Hnyy
  gXuPJ7HBDLjFZ7tzTBLNJXRM5e4Lyqvf/OyT17IDOr7YQ+xPL+R9ebez9svO0+lG2H0osxRmJ
  hlrMRcWJADIkahpJAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-271.messagelabs.com!1632747265!416771!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26428 invoked from network); 27 Sep 2021 12:54:25 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 12:54:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18RCsP7v006518
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:54:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 13:54:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] unionfs-fuse: upgrade 2.1 -> 2.2
Date: Mon, 27 Sep 2021 20:54:14 +0800
Message-ID: <1632747255-70836-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 12:54:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93146

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unionfs-fuse/{unionfs-fuse_2.1.bb => unionfs-fuse_2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/unionfs-fuse/{unionfs-fuse_2.1.bb => unionfs-fuse_2.2.bb} (91%)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.1.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.2.bb
similarity index 91%
rename from meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.1.bb
rename to meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.2.bb
index 3dd5c82ee5..0cc02983d1 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.1.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8a
 SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "8d732962423c3ca5be1f14b7ec139ff464e10a51"
+SRCREV = "b0e3805d3d84d44ddf3e4e5238ae0332145d8157"
 
 DEPENDS = "fuse"
 
-- 
2.25.1


