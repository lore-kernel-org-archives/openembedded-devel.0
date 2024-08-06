Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559B6C54734
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2881.1722934014816930232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q3YSLmS8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eOhPO7NyBIXRbt6/TXSLgZBfGsV5c+XRomiosUf7c4c=;
  b=q3YSLmS8RARpOWj0ESnVbampBvfkfT5LASsftszlmtABCjpD3hCBtC4O
   BogwOoBAEQu+cup2bt/GntnlFJoENbjXquL393UwNEJKw4ASa+sENrBob
   6Q+hUhBx4HkTNlq++GePIq11F9GBuMQ6l38Gzypl5VTh3vbPzemIMVqGg
   3sgoUogoBXuBwKMnyHnm10lvIle78lq5/xdsx6jJrkeC6GrvfskKNB8u9
   GoYzMeaZqfpsYLJzhXGlvbgxvUVhs5dr4fLQtmTwEBm8D/kJa5NkfiA8M
   RHVEuYr/4oXZR6AHlXy+CeaYiLmhY9TjJ+ymaf+T53sy86B2DKSXbhNN3
   w==;
X-CSE-ConnectionGUID: 06DTyfcJSeGZsvhzdQqYkw==
X-CSE-MsgGUID: dFw0Ei/6Sdqw0Vi87v+Wmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="170035569"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="170035569"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 664B6D424E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AAD23D753B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B7CF401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EEBBB1A000C;
	Tue,  6 Aug 2024 16:46:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/60] libtracefs: upgrade 1.8.0 -> 1.8.1
Date: Tue,  6 Aug 2024 16:45:55 +0800
Message-Id: <1722933994-32549-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--4.190800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorSqU
	3RD+dVC4hjf50HClX+Dmn3xyPJAJopGZilTi8ctStw+xHnsmQjPzndiJkHFMhEgxSQxzSLAbGeK
	Aa5WpyDs36XKBc/den7PcYXvL4RFOlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHaxYgI6H9XncGGsFeI5GPBGFbx6YUi1zy53ss82YHiz4XYMufP5RVvWO/AlyA2ABKzydJ
	cE7MKnHhhrfczS7zH4D3+vvz8LIivIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111537

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtracefs/{libtracefs_1.8.0.bb => libtracefs_1.8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.0.bb => libtracefs_1.8.1.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.0.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.0.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
index c90ac19fa..66869b29a 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.0.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "67f3b2ab9f836e6c9c70c94db7aac3251119a263"
+SRCREV = "417c2e3aa21af670cc5c13db633dd35292f2d0fa"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            "
-- 
2.34.1


