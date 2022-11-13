Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E607C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:19:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.313.1668309560031524574
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ki4YxtTt;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309558; i=@fujitsu.com;
	bh=xMc6egQb2ZBzV2KttbM8mFXs9ogmClhWncpaMRCkl20=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ki4YxtTt3p3L3boq638d49V9ZEN0KpMkVBVhVsrsIzCb8FtzTB5VfFeHzcGi6ZXxX
	 JIspnqMKSWU+RKJXzOQRO/Hc8yIM4JE+QFeF4RiOFPub/mX+bFmIog6av4pNWgQCDO
	 TqfghR91hsnKfFpnKVMYFSgyVPkoSY4ayRVxokIJog0m0w4gz1kivcrV//NAQOlXNv
	 PpeKpfWnYCu9oTB3F9rWU1rOxo/FM0aKRkhh1vid/FT4Uf61a6jDQQrTwSujeubqhG
	 GBKPV8OQecRvsyhl3OOcGcNQf9zK12gibq+MDLwhQqoFna+LuTkHBeSeEIMd9O0/Xv
	 JJ4wCiiEEGwnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSdckqSD
  ZYP1beYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP76j6Wgn+cFS9fH2BrYFzM2cXIxSEk8IRR
  orNpDjOEc51Jom3xIVYIZw+jxJ62FWxdjJwcbAJSEjfu/wezRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC/hL3HnTDlbDIqAq0fy4GayGV8BJ4uf5HlYQW0JAQWLKw/dgcU4BZ4nmOWfA4kJANQfm/G
  KDqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2iol1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvinFagE7GD8u+6N3iFGSg0lJlDften6yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne3
  5EFyUKCRanpqRVpmTnAWIJJS3DwKInwVtgBpXmLCxJzizPTIVKnGBWlxHlnJwAlBEASGaV5cG
  2w+L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3bTTQFJ7MvBK46a+AFjMBLf4emQeyuCQ
  RISXVwCQ4y/Nl0vRSpfzZl9z7mR3Wri0OXGwS+9LU5jxPUsIim7jcBdPOvzm04iMXi7PImcCA
  ba4BDfWJJzl3X+/7wHa/4ILdx3kXRAXXS0vKLVBJLJThLrX5NsHL5RHbVPcnL9y5fk25Mf8B7
  8KaBb3//FdYrDOczchV3Xz30LWHu28l+Su+CFJcePHMr1v1l26ZiotUXzP/ez944bW/RzLbb8
  mwP/zwNzTB9E5V0DTWKcyL5QL6rs32L94h36prUVH0Svmj/vz88kCOK6X1YskLb89y/Rb2cGf
  FBO3ZH3gibx3ZpOybub/+y/cboReFl/0simFOEUmR8tP+8Nr71rtVr+/s/blVuOmLwaqqZR71
  v1SUWIozEg21mIuKEwGrVhQKWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1668309556!403051!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3843 invoked from network); 13 Nov 2022 03:19:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:19:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3E4421000E7
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:19:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 31F3A1000D5
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:19:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:19:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycocotools: upgrade 2.0.5 -> 2.0.6
Date: Sun, 13 Nov 2022 11:18:55 +0800
Message-ID: <1668309535-15518-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309535-15518-1-git-send-email-wangmy@fujitsu.com>
References: <1668309535-15518-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99578

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pycocotools_2.0.5.bb => python3-pycocotools_2.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycocotools_2.0.5.bb => python3-pycocotools_2.0.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.5.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pycocotools_2.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pycocotools_2.0.6.bb
index 234942bfe..16d7721ee 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb5
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "41d1fb062df5bab5ebc3e92971455aa089479e7cd10553278ca54628b9dc9bf5"
+SRC_URI[sha256sum] = "7fe089b05cc18e806dcf3bd764708d86dab922a100f3734eb77fb77a70a1d18c"
 
 DEPENDS = "python3-cython-native python3-numpy-native virtual/crypt"
 RDEPENDS:${PN} = "python3-matplotlib python3-pillow python3-profile"
-- 
2.25.1


