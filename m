Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ED7D11701
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4464.1764669107437629253
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FvwHqD6R;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669108; x=1796205108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NDnGpIwIJ6zZ3mAn+fzTosPpwrdgCronr1RFSl8750Y=;
  b=FvwHqD6RcdKRXZljSrEv3hLnyAXX8TTt56BrULFN1Fq05wZctT/mTYKz
   +cP789bt966hXEv/YVsr8vd3lCzhhXOuDAicitRZ9Rk4sZOglE3+tVnIN
   AQQw/+TdRzFuZkT9mFTDcorGpHOS99uf0dnss0o4ft5wXqRaXcDW0Km5B
   GHoIHrCoz1ZZP81wccx1nCRu6xE+8M2J+NZIGQZrxvmCFAdrGOavddixR
   jFW9yhGI440HDRkPG2Cr+zkd6Tkm9GBF3YukzBrPk+bnkjj8NYEDwJSy/
   JHMrHmIHZrXvO6SV3REbUZlWoqftPNVFVqCQZP4z+NGc4DGTqEqO1xT4V
   w==;
X-CSE-ConnectionGUID: +8Z+UwulSl2yatVZ8QEhJQ==
X-CSE-MsgGUID: KNtuyDvOSWGIbg5p3mzaXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="221224201"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="221224201"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:46 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 737798203C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 298ECC0183C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AB7B4101A432;
	Tue,  2 Dec 2025 09:51:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/25] libnice: upgrade 0.1.22 -> 0.1.23
Date: Tue,  2 Dec 2025 17:51:11 +0800
Message-ID: <20251202095132.652-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122237

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Add SPDX-License-Identifier for added clarity

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnice/{libnice_0.1.22.bb => libnice_0.1.23.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libnice/{libnice_0.1.22.bb => libnice_0.1.23.bb} (88%)

diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
similarity index 88%
rename from meta-oe/recipes-support/libnice/libnice_0.1.22.bb
rename to meta-oe/recipes-support/libnice/libnice_0.1.23.bb
index 4b932029ee..bcdcf0ad7f 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Conn
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"
 
 LICENSE = "LGPL-2.1-only & MPL-1.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=963cc62096d5412ee9580043babb8b60 \
                     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
-"
+                    "
 
 SRC_URI = "http://nice.freedesktop.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a0073faed5417ad7e"
+SRC_URI[sha256sum] = "618fc4e8de393b719b1641c1d8eec01826d4d39d15ade92679d221c7f5e4e70d"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/libnice/libnice/-/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


