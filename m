Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BBAC83026
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.13872.1750662711571477883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oxdg0M0n;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662711; x=1782198711;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eikf9NFzpDGsTGuoi/8FbKMz9+mtNnO96Wk4+LfLwoA=;
  b=Oxdg0M0ng/6KYDe0oxvurXbgXaCeUMP4ev68FezzVS8/eauJYTRNw/bC
   FNLXdfgxAfZx7Oji8CCWoNa6qBzNIYrvYx3GGTgf0YuQlnpoW32G+zvqG
   FOTmosb9TN9lpmAm3U/7JPoCcmiwRDALm0bXUJw3QlGtxttAxk4OZNgWx
   D6iGWNUgTvcWnyPvriwAjgVVWWXdqZvQrgdiBTvGg/uJ6A6H9g1ya5CiO
   xy8NpYnroeLlaM/BlCXpZ28zHKzBVZgdG8nJMjJL76Bv9Cdt+s+kpaLHC
   TdoKgF11dqmNzzUYEL3z5KzU4rqTNfpK81oj9XJXtZjbBQCz6I8ZqDeSu
   w==;
X-CSE-ConnectionGUID: 1efMo2FbRwKAtJMKFKmJWw==
X-CSE-MsgGUID: FaryZf+FSkSO/gfWNraX0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="206742754"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="206742754"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B2032C68A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DA21D5041
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B3B501A0071;
	Mon, 23 Jun 2025 15:11:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 01/30] bindfs: upgrade 1.18.0 -> 1.18.1
Date: Mon, 23 Jun 2025 15:11:08 +0800
Message-ID: <20250623071138.402-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118031

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Enabled noattrcache by default with fuse-t
* Dropped official support for MacFUSE, because Apple makes it too
  difficult to test without access to a physical Mac.
  There is best-effort support for fuse-t.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-utils/binfs/{bindfs_1.18.0.bb => bindfs_1.18.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/binfs/{bindfs_1.18.0.bb => bindfs_1.18.1.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.1.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
rename to meta-filesystems/recipes-utils/binfs/bindfs_1.18.1.bb
index eda41010a9..abb7dceaa7 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "fuse"
 RDEPENDS:${PN} = "fuse"
 
 SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master;tag=${PV}"
-SRCREV = "a276dbe66faaf7af02d967a648f7598589bf5c5b"
+SRCREV = "70a663b3476c0b9b21b626473c00c68a3dc97b92"
 
 
 inherit autotools pkgconfig gettext
-- 
2.43.0


