Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D47CCD18F
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:48 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10915.1760433580531233113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KUASYQ6v;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433581; x=1791969581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U5ru6Q+IQAoAhJs5Z8097VLHHeRT/lxhVwPBb7xJzi4=;
  b=KUASYQ6vWQR2mNELp+Kr89qatl7QlZY/Bf2MXt70fE0nx3EEWCZ4T6Nb
   UnfyGG0y6VBQ3oRurViBKE6fF1Oehfd8pZAtU4w7bizdtosp5zrnrWmTH
   DrD8w6t2lNkPleuiUH9KLkx5IqZF12ni0ql21kcmUwHOKAui5o3kC1vXv
   kzldmKWGGRbe6dzHL1hKK18p1wj1EJQrukkGYNxS1a7pesCO8NsNq5/b4
   +ObwdzGy00BBncp0EJFd2/oaXpxOHJWw/5Om7CMtWzR7QYUhy1Mffv1Vx
   t8KpRRPBMK2zPvB+130yAZmNKTv4jnzMXcWn4JaIUZCdxYVZhT9sTyC+q
   g==;
X-CSE-ConnectionGUID: LY21u3AkThKuua3h7WQofg==
X-CSE-MsgGUID: 7Oyh/eZOT/2EWWiDf6cIXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215838917"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215838917"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:39 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A7B521564
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:38 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6464AC01290
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E34F9101BB7B;
	Tue, 14 Oct 2025 09:19:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 03/44] bindfs: upgrade 1.18.2 -> 1.18.3
Date: Tue, 14 Oct 2025 17:18:46 +0800
Message-ID: <20251014091927.493-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120559

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-utils/binfs/{bindfs_1.18.2.bb => bindfs_1.18.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/binfs/{bindfs_1.18.2.bb => bindfs_1.18.3.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.2.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.3.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/binfs/bindfs_1.18.2.bb
rename to meta-filesystems/recipes-utils/binfs/bindfs_1.18.3.bb
index 63e5ac5aa6..1c32f443ca 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.2.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "fuse"
 RDEPENDS:${PN} = "fuse"
 
 SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master;tag=${PV}"
-SRCREV = "755e0895040bbd43a8e2f3efc7f32f366160a408"
+SRCREV = "91fbfa48427c67f59c24e84f3855507531ba972c"
 
 
 inherit autotools pkgconfig gettext
-- 
2.43.0


