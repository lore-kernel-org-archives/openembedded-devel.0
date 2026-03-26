Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6B910A1E98
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46411.1774526228175921692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i/hq67F7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526233; x=1806062233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4I5tCIDhzzAwYG9M+q+qMirCRpthMXmMX0ThFF+8T84=;
  b=i/hq67F7UzIow3zyjQSZpOGYH+s/mtFcyuil4H4oyLeYscwa1f3o7HJ2
   6ILcM0YvkKfzI4v8dItCRQJrauksYf1xyy5tw1j8G0Wo9hgf+7iRrzJLb
   HfV+yFnk4n/CKYSsLxPiYK91CkVuC5hMEk17resoy6bamd+shjMJzq7OT
   ux42ZDFhS9IM27nfybccrM+lrtjRbezAG2lUL8tgA46kicdYf9wHYa1J2
   xeff6gQ0izDW3fGGjxMZRvml+LrP7b6tvr6pm45hcfn9+dk9n586Gi8bA
   PiDyxy9ec/jeEleloVDxelkHZ4BNYQdcf33yHdBEA7rlTGqKMbvQZgEGe
   Q==;
X-CSE-ConnectionGUID: Fka0Q9STRdCx5ibIkdmKhQ==
X-CSE-MsgGUID: 1jJm8NfLR4iobMMaZgOqCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420859"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420859"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:13 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 458B442A313
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:13 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E97EB1800EB8
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 52F65180714B;
	Thu, 26 Mar 2026 11:57:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 20/63] libio-compress-perl: upgrade 2.218 -> 2.219
Date: Thu, 26 Mar 2026 19:55:50 +0800
Message-ID: <20260326115634.1199-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125675

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibio-compress-perl_2.218.bb => libio-compress-perl_2.219.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.218.bb => libio-compress-perl_2.219.bb} (93%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.218.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.219.bb
similarity index 93%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.218.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.219.bb
index 027788ce69..ef05e69460 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.218.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.219.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b617
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "596bd413513b5151af645eef1a718470e0ac9c2233135a0428eb1ffc2995d95f"
+SRC_URI[sha256sum] = "d3f509c4ec2f75d3ea6621b96aef61329a23711c11efb2222c837db1370433e9"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
-- 
2.43.0


