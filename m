Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6937ACCF9F3
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:32 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.27237.1761696929984963551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cDADg+Bl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696930; x=1793232930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6154uAjGEoBY7c+ua48QA9WX8bRPLlz02M7Z/p0VsPI=;
  b=cDADg+Bl/ZcN4TCEfqnZh2hP0OTNw3d3sGt8UZEdynRAsvq1tINvW3GQ
   I5565J9+aDITNvsX7ncheDhEPgDGw4gBwUpDBp/vdIAcZO+7vzrtUgKYs
   C4kOuxkvhk/dj8ocz3q2qKHkjZYT9fibFi/vW1xoS6m96yS1snPg6gYX3
   5wVVPxDklqM02z0S3d44JYm95vwjzXcfasjEUS9TEFKQKdRCgggPlBVFj
   G8szVoshqMUgP+1lj5DMiRqW2WhYVxv8L7aVSp4pXm6jOaj1ocdAm/TsW
   g+TlUzLQQ4vgO8vjS6RpnklE1xu6ti0WgikEYheuvItilRSfoN14XWD9p
   A==;
X-CSE-ConnectionGUID: vQf/4qBJQ4a6OI1zOiCv1A==
X-CSE-MsgGUID: iPQSgz/0SBa2vS0X5iwjHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216775272"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="216775272"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:29 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4E0471C1C727
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:28 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0A9921400606
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 490EA826FD0;
	Wed, 29 Oct 2025 00:15:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 07/32] libcompress-raw-zlib-perl: upgrade 2.213 -> 2.214
Date: Wed, 29 Oct 2025 08:14:40 +0800
Message-ID: <20251029001505.528-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121113

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-zlib-perl_2.213.bb => libcompress-raw-zlib-perl_2.214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-zlib-perl_2.213.bb => libcompress-raw-zlib-perl_2.214.bb} (78%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.214.bb
similarity index 78%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.214.bb
index 0c6a1070cd..b4de5d499a 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.214.bb
@@ -6,11 +6,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=1bb3479faca6bb2086c05a33a934f62a"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=a57e80ea8cb4e0305995c08035c77138"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "56b21c99cb3a3a7f7876a74dd05daa3f41fc9143ddd4dc98f8e46710a106af45"
+SRC_URI[sha256sum] = "5eea0c05c7b01dc93b620f04c89176eefb5002586ca0bebae3b8c2e70920e62e"
 
 DEPENDS += "zlib"
 
-- 
2.43.0


