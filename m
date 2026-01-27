Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178ADD2D8C9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7122.1769507033379415289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JltnMiRw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507033; x=1801043033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Op+11Z8JUnB9mWnwzmQP0XcIVgP98qQ5fQS7/UsLcA=;
  b=JltnMiRwMKLLTz8SVD5yN0+pnmI/0QPl+JQzMdD46uOtVPyuztj7Lsbf
   Rv9enm1gyqpeyz1QWlLA6OxD/4v3BJIZAakyTxxcGWzl8oLELYPIcgxKL
   NpiIwjKxau41TJkAbRZhwt1Hz5p4JeifTXOi1iqCdKaT8NTilmQkH5HcC
   RSzSRcpvoud+DgDtwM9VYvOkFKsP1epHaXUlDPj7PJw93w9dwf0uys08v
   HFonfOS8yIv5OAC+l/By2ctqgb3cQ5+qKFH0rgQoH0zIc6lfEOIKC0Jne
   YpZ2UAarLpcKvw//csIuICLFA8v5JaCxY/lVlxd0jZ1/+7hLqNWPOcWLP
   A==;
X-CSE-ConnectionGUID: dq62aQkATDqjYWNKLkBJew==
X-CSE-MsgGUID: oigzeLjVTPOgYJamj3YZ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206239783"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206239783"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:43:51 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 9236E1002BBF
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:51 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 3FFB5C0118D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A0F9B20000E3;
	Tue, 27 Jan 2026 09:43:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/25] exiftool: upgrade 13.45 -> 13.46
Date: Tue, 27 Jan 2026 17:43:17 +0800
Message-ID: <20260127094339.1081-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123915

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added a new Pentax LensType
- Decode some new Canon tags
- Renamed a newly added Canon tag
- Improved identification of Canon RF lenses in edited images when an extender
  was used
- Changed description of FocalLength35efl to add "35mm Equiv"
- Patched -validate option to recognize DNG 1.7.1 tags
- Patched to remove maker note error/warning when writing files from some
  Google phones
- Patched to improve warning for corrupted HEIC files downloaded from
  heic.digital, and added ability to delete this garbage when writing
- Fixed minor error when writing some DJI DNG files
- API Changes:
    - Added GeoUserTag option

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_13.45.bb => exiftool_13.46.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.45.bb => exiftool_13.46.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.45.bb b/meta-oe/recipes-devtools/perl/exiftool_13.46.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.45.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.46.bb
index 9feaeb10b1..36b48354cf 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.45.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.46.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "6219b531484ad790d7fcfa5732d5a9f42ff9e5b7"
+SRCREV = "b717b450787d53ed3e97ab3245b21cc2af04d1f7"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


