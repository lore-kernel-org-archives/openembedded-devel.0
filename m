Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DB7C41513
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:59:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2441.1718161137738864048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dqd7KWWR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161139; x=1749697139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jC/YE0Sexe2olM8yYiT4DEozzNQ8/w+rjgP2WKXAFK8=;
  b=Dqd7KWWRIZDZOjv3jKgQzb6PfK1NbfvB8Bx+lt/Vpf4S5rzdPGBQKlk6
   WVaYLaWeww2bfKAJpaxPmS2MUvoBBk79frjnOKW7vbQ2eUwUE7ZbqP7+p
   JyAqHZ/dnMSL8rj28a6L+k8CV4AbT+jV+lbTYRMbvyxIdM94a0+LO/Yk7
   FgliyVcSxRMg3dxFvzkaavyVJqQLIl5YCBE/xh5gEB2QAwWqVfEl3o2Xu
   GL9Mh+P/pgaHee/cEmH9MX7S3e24HfkjnmjE9+9EFa3dRZx7Bt9xH4ovh
   VQquk54ng0V/SRoTr2XVf7WKtuERAj/mIAK+m1GAUPGc5/IPYY3GSDRuB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="161975310"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="161975310"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10E54E8529
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5838AF741
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E087920071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 509DD1A0002;
	Wed, 12 Jun 2024 10:58:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 40/43] sdmon: upgrade 0.8.1 -> 0.9.0
Date: Wed, 12 Jun 2024 10:58:13 +0800
Message-Id: <1718161096-29710-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-4.297500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyohlnMbn2V9PjA
	2IXz2gxcjMeR830In2w4jMHxU2kK0GUlOh2o2oTOHuEs048UVaKrHFhHKqXuS8PfQ0aXzqBy7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiHY/bzRmIaZG5x7uAXGEprZiQDIJsDspXCzkaVcXrvbOjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcjpvcTaWwfhAd+cA0OLHo4aFXXKbmL4MR9umL
	OnIniV+QeMIjBHYFyNZXhQ/4nFht4to65mriak7jSgafaV4MSbhyCN6YfrEGP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110877

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for Adata cards
- Merge pull request
- Fix type warnings
- fixe types and count
- Add support for Innodisk cards
- Modify Adata code
- Move SB code
- Merge branch 'master' into J-Twin-patch-1
- Fix Maximum erase count for Transcend cards
- Fix Maximum erase count for Transcend cards
- Merge branch 'master' into master
- remove "Z" from local time timestamp
- merging changes from FreeBSD support
- Merge remote-tracking branch 'origin/master'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/sdmon/sdmon_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes-support/sdmon/sdmon_git.bb
index 522539a67..81c8033c1 100644
--- a/meta-oe/recipes-support/sdmon/sdmon_git.bb
+++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/Ognian/sdmon;protocol=https;branch=master"
 
-PV = "0.8.1+git"
-SRCREV = "ef1aec457f04a50721f0259651cca9c946f11390"
+PV = "0.9.0"
+SRCREV = "4dff9b690e8d4454fada6abfbb6b32fcb794968c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


