Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87826CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:39:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.15247.1755679196640782156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IuCjg3kp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679197; x=1787215197;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WycGGaz20bv3kDZ7eRcHm4va2+atdHI8W4FKmC7hHXI=;
  b=IuCjg3kpqGwCN4a/NX7bBqbXRYKvqzMcNYajQrKbGCFwnQkWxkrh5d2H
   I3Yc9J49zGAI/RRUEct+sZuBEe1sooZYu4zqAYf0Xs1gj7kCvcnq4y/4m
   9BrYHYH36Gy/tINRwkl1yRnvYmNzQIF8hV13+RkFDwWPMT1/ns1TQNrUj
   d4TWcZaH1Ohk5r8TP7+5mGntIXTlDaxx4o0t6RWdBOI1dj72xnlUBg1Mu
   aGaJWKvLSygERgDxumAgjHmUep0Ya7HUhfPYMJaO5VuBYKkbfbYp9wT4N
   ouBXbW5E5H/k2SkgUOcZYgJ2IIMs+NIdTJc0ed1KUfbNUJwmNsB1F4Zis
   A==;
X-CSE-ConnectionGUID: RRwuu+ufQmuADs5UGOQ3eQ==
X-CSE-MsgGUID: zHi18rHeS9Wc3ekwhwsPrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="213396771"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="213396771"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:39:55 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CC3B81C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:54 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 873F51C0831B
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:54 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 7CE1420000B1
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65BA41A000B;
	Wed, 20 Aug 2025 16:39:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 01/26] bindfs: upgrade 1.18.1 -> 1.18.2
Date: Wed, 20 Aug 2025 16:39:20 +0800
Message-ID: <20250820083945.802-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119014

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 * Added '-osubtype=argv[0]' to prevent some systems from auto-unmounting bindfs when the network goes down

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-utils/binfs/{bindfs_1.18.1.bb => bindfs_1.18.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/binfs/{bindfs_1.18.1.bb => bindfs_1.18.2.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.1.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.2.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/binfs/bindfs_1.18.1.bb
rename to meta-filesystems/recipes-utils/binfs/bindfs_1.18.2.bb
index abb7dceaa7..63e5ac5aa6 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.1.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "fuse"
 RDEPENDS:${PN} = "fuse"
 
 SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master;tag=${PV}"
-SRCREV = "70a663b3476c0b9b21b626473c00c68a3dc97b92"
+SRCREV = "755e0895040bbd43a8e2f3efc7f32f366160a408"
 
 
 inherit autotools pkgconfig gettext
-- 
2.43.0


