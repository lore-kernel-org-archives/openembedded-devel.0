Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40300C001DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7470.1687850068489129204
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122377925"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122377925"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A009E8521
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:12 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7654CD3F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AA3C88918;
	Tue, 27 Jun 2023 16:14:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] libburn: upgrade 1.5.4 -> 1.5.6
Date: Tue, 27 Jun 2023 15:12:02 +0800
Message-Id: <1687849939-19941-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-1.715900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyswAYdq1VTXo2m2
	leUHzyoXm+UTNeyODYn7SMNvd0KhY8PAojSM8Z7GA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRnvVbHa5Rs8t+TAXNPNyDOErYTBYmxQ48yUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0gGlEJORGTlJ+gtHj7OwNO0NstCXmf87HDT2M
	+Kncv7VcxBC6ka5/ab10OZ6WWEet293k7E8CXa9bBVZPD320vf0gpSiBE8LGrkhoqR5x7O2NcWf
	kPjYdNSBQ5uaIOS/ZPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103613

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Bug fix: Overburning with cdrskin option -force ended by a libburn error
* New API call burn_write_opts_set_bdr_obs_exempt()
* New cdrskin option --bdr_obs_exempt
* Officially enabled overburning with burn_write_opts_set_force(,1)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../burnia/{libburn_1.5.4.bb => libburn_1.5.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/burnia/{libburn_1.5.4.bb => libburn_1.5.6.bb} (83%)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.4.bb b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
similarity index 83%
rename from meta-filesystems/recipes-filesystems/burnia/libburn_1.5.4.bb
rename to meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
index 4f8c183f59..e0f6664ab3 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.4.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=a91b9b862895b64e68e5b321873c9111"
 
 SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "525059d10759c5cb8148eebc863bb510e311c663603da7bd2d21c46b7cf63b54"
+SRC_URI[sha256sum] = "7295491b4be5eeac5e7a3fb2067e236e2955ffdc6bbd45f546466edee321644b"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.34.1


