Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5888FC54753
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8717.1724833536738925702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YLgmCTLe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833538; x=1756369538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZSxQVxIYentIziaqPNMsQxqw9SiUa13smQH3MaIYW4E=;
  b=YLgmCTLevlJXXDwCn8UAHes6fF0vLZvsjhtdXLqzlGVyz8Kufv3W+1rZ
   Hict2Ay7zstOTRic7NU1RdCb1DyXQHFbW58xmJ8peaVhbmFB7sl9NaL6D
   m81VGRfJbk4b5bLhNzWXc6M5WAxAdW/92yBjMzUvfHMRiLK78LQTW7bai
   rolyku/n3c1nFgciPczw1anEVDYlTEmW+zP0eE4vRsK3dSemiVTQUtV//
   yD6Dqvj64uwG6pwA3tiVFbRWGUpDK/wc/K0OjtYjvKnFwpMNUZDnBJuBY
   J/CiySFzlTYly6PMnTJaLq/WQZiP2kBoF0ggbQ2q6l+9RYlPfURrWZbCI
   A==;
X-CSE-ConnectionGUID: o3l8eP4FT2eyJXzLaHfyEw==
X-CSE-MsgGUID: inItDqHIT1md/I7JPStTqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171131373"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171131373"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA77AD29E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 12527D7487
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FC196BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2BB731A0002;
	Wed, 28 Aug 2024 16:25:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/46] libbytesize: upgrade 2.10 -> 2.11
Date: Wed, 28 Aug 2024 16:24:45 +0800
Message-Id: <1724833525-2162-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-2.766600-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrMVx/3ZYby78L62xXB+Btq1YM
	JR3dIrh2B8zq9B6m7mt1VEmx7sTk/+xqcgb67CyaP0HVIeixJdD1q+x7zkhJWlYf/5ufRQSUCMm
	WJ6tUT+fKReTY/Wa34AJnwAZkrQBmRI4jmK1DSKn8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DfZL
	rUlw8Hxzo2a10XPZVUKJ7Meso5c2o3KXWd30Ii3RRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs8HXc
	ldYuuuppJ5C5S4OIhtz/w9TVPoQLm49grbNW6KTgqIkKRShbR4aSIJWKlrB04Bv9MNXT4rNGyfk
	CzeeXJrVlNa6A4uBuIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111982

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- remove dependency on python3-six and python2 crumbs
- dist: Fix release number in spec
- Squashed 'translation-canary/' changes from 4d4e65b..5bb8125
- ci: Bump actions/checkout from v3 to v4
- Rename 'master' branch to 'main'
- ci: Set custom release number for Packit
- ci: Update CentOS Stream repositories for Packit
- ci: Add dependabot to automatically update GH actions
- Update translation files
- Translated using Weblate
- infra: bump actions/upload-artifact from 3 to 4
- tests: remove unnecessary bash dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbytesize/{libbytesize_2.10.bb => libbytesize_2.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.10.bb => libbytesize_2.11.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
index daa01bfc3..214c2b284 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "6e83cc6f6dff4f126fc79284e0c3c1c50123380d"
+SRCREV = "9da72b2732508b0ba0ceed27f5e50bc276ef31f2"
 SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
-- 
2.34.1


