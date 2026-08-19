Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761B1C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3276.1787132130327445985
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CGtShOqZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132137; x=1818668137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5I9YoB9dS8gTeXRSy7EyxShduK+yh/RmfeMY+KcDx4s=;
  b=CGtShOqZmjmjYWC5BTx74qw9YuP4B7HxuPQHM+C/ny9QbMWntiQhJ7/5
   t6CVUF4cp6YDK2yMT6ho+ZJkRD7eSL8ygr3ffpsOcQylb7Ax6m2wbpWaR
   vGRhpanswfZM2FomINPUJ/Fzsa8hHtChi5ujXCVSQyD5RV1db0wucAlYD
   QRuUeB0eA1Ym4eY6XT5omQ/nmJVbdRUWPxNSyMV0NKqkpsCyzytnylPNJ
   rgF/wttmvccP9lAN5IUZMos7RHNhMNr5bZtq3pm3bj5JsuHNTM9XdJCXS
   JpaMOtJCd0N8Q4lVXr+dnk/bNjDhLwcWdr0/yPSbuFbP8nMwbKYu27Kx7
   A==;
X-CSE-ConnectionGUID: Wr/oJXHWQoyFxmbJGp55dg==
X-CSE-MsgGUID: IpyBqCrLQTezoaJSsZgJXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330783"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330783"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:37 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 488781002BA6
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:37 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 04E6C181ED58
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 13F051801C21;
	Wed, 19 Aug 2026 09:35:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/70] libcdio: upgrade 2.3.0 -> 2.4.0
Date: Wed, 19 Aug 2026 17:34:14 +0800
Message-ID: <20260819093514.1101-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129280

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Note incorrect field name 'min_rate' should be called 'max_rate'.
* Apply timeout in MMC command on GNU/Linux
* Fix no MMC data returned when buffer size is divisible by 256 (skr4n).
* Deprecate obscure MMC set length macros
* In eject programs on GNU/Linux, cdio_open needs access mode RDWR.
* More ISO field validation in RockRidge
* Validate bounds in disk images reading
* Validate UDF File Identifier Descriptor bounds
* Change references from MMC-5 to MMC-6 Draft 2g when possible.
* At URLS for MMC6 Draft 2g and SPC-3.
* Administrivia: Error when help2man not found in maintainer mode. Otherwise warn, and tolerate builds without help2man.
* Correct the way MMC CDB allocation length values are set
* Correct XA attribute flags
  - Add '*SYS' values of the XA attribute flags to represent the other/world user mode bits.
  - Fix it to use the '*OTH' values instead.
* Use thread locals in recursion check to allow multi-threaded use
* Correct macOS workflows
* Fix '-Wdiscarded-qualifiers' warnings
* Fix 'udf_read_block' docs; count blocks, not bytes
* Go over grammar and spelling in docs.
* Go over doxygen formatting. (More should be done though).
* start to use clang-format to format C files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcdio/{libcdio_2.3.0.bb => libcdio_2.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_2.3.0.bb => libcdio_2.4.0.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.4.0.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.4.0.bb
index 20ffbffd98..7d345e2455 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[sha256sum] = "53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed"
+SRC_URI[sha256sum] = "8e6a305f81e45a78b41ce696d34497cc208d97075469d7304c11a6d44bf006ac"
 
 inherit autotools pkgconfig github-releases
 
-- 
2.43.0


