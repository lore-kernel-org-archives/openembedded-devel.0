Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA76BCD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19351.1779190902465708295
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SdhvidXr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190903; x=1810726903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EA/KZds9PqImHK966H/Jf5ruMsWh2AaIBdz5deNWc8c=;
  b=SdhvidXrUElJ0q8CrF53MCYgL3jow4DXdrNk5O2QL8HchNBWQzkFyUur
   AzEM1ZBj6i4J7q5O9QOmFmn5myBK6ufG9ylddUfoj+jyf5WMSSuJo9WFv
   QIQv93B9DhG1Ge1xIVa4eaqgxmbywWisXH5pKoAnQMzSY6wOvQb82A15B
   UWGR3gkyCti2mZV+NT5zqSkVLfF7rJjYgLZhz10KIpUK7/O8Bp8TkAuE2
   Uu+0K/ZybDd3ESjLWZvdMXrIhdjTbx7naPi1Mpd2Fa1wl9gno5tJmghOU
   8o80oC8fcmA1B0Z17OMvPUCu5LC3WF9GmKTrJmM9YWAWwhhWSekRks0ZH
   A==;
X-CSE-ConnectionGUID: R2G2k8S9RESV0qnddeR8Ig==
X-CSE-MsgGUID: nRxX7WZtRNyGsg7owpHD7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241060365"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241060365"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:42 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EB430100035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 95FC0C0373A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 11FC54066E2;
	Tue, 19 May 2026 11:41:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 38/38] xfsdump: upgrade 3.2.0 -> 3.3.0
Date: Tue, 19 May 2026 19:39:21 +0800
Message-ID: <20260519113921.655-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127100

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsdump/{xfsdump_3.2.0.bb => xfsdump_3.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.2.0.bb => xfsdump_3.3.0.bb} (95%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.3.0.bb
similarity index 95%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.3.0.bb
index bca7e7471e..d02fec5ea5 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.3.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
            file://0001-include-libgen.h-for-basename-API-prototype.patch \
            "
-SRC_URI[sha256sum] = "2914dbbe1ebc88c7d93ad88e220aa57dabc43d216e11f06221c01edf3cc10732"
+SRC_URI[sha256sum] = "9ca3e91055945f8a70bd4d465d5464f631630c65462896eda479d7371fd61db7"
 
 inherit autotools-brokensep
 
-- 
2.43.0


