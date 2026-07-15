Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271DDC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3413.1784111975501937191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RQkXT1J9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111982; x=1815647982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hJUI/chXreKXS0OFsEv12FluZob43miz3i6Vv3juo3w=;
  b=RQkXT1J9l7xUD3DC1Qu26YLaQ707zfaaHzlTZUXGAD5CaKIJaY0PUSxq
   tOOxM4jOth8TveEaeVKJG0sxGO+Ylw09cmReZgL+UOB5GB5EjfbqwO+Kz
   M/o+EAqnvL5KUw1Ns7ux/C07kxSPFekK8Zt3GERv4RCL55UeoDQ9QCb5O
   mmXMmgIITHAOwCBbrlm48JKxXVzoT30CMx2NdHeQ0QfZHWRWb92YvNEvs
   5pWmWZa20OqAVAosmw2tlCzFMQ//dsONrAW6nLg6lFdK0bTbKllWgULVw
   hKfoRlC694MFJuxtSxBmR7MxhqvgfhgBH2XPEtY4oOxXXXow3XoKDpjuS
   w==;
X-CSE-ConnectionGUID: 1dC6sTLuT8SIafxm3MvqUA==
X-CSE-MsgGUID: o8gJG2mOTfSZsl83MjocJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440356"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440356"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:42 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3C5831C01699
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:39 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E13CD148CE49
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0F95D1802733;
	Wed, 15 Jul 2026 10:39:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/44] libdbi-perl: upgrade 1.649 -> 1.650
Date: Wed, 15 Jul 2026 18:38:34 +0800
Message-ID: <20260715103914.2120-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128177

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Set a hard limit of 99999 on '?' placeholders (CVE-2026-14739)
* Fix out-of-bounds read in preparse of SQL that starts with a comment (CVE-2026-14740)
* Fix code injection via Profile DSN attribute or DBI_PROFILE variable (CVE-2026-14380)
* Update dbipport.h to Devel::PPPort-3.73
* Require Test::More 0.96 (tests will otherwise fail on pristine perl-5.12)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{libdbi-perl_1.649.bb => libdbi-perl_1.650.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.649.bb => libdbi-perl_1.650.bb} (95%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.649.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
similarity index 95%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.649.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
index c25d5d63a6..47f9e06c90 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.649.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
@@ -10,7 +10,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a1138dff61f77bbc3d8782caba6758d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
-SRC_URI[sha256sum] = "98897cdd06adae70e5516042e47ca08d623db2139fc58fd95cde208adf85c697"
+SRC_URI[sha256sum] = "a807b817c1cfb0fe6ecccff1d9ddeb293c317d518f5ab2007dfb9d3bccdbcf83"
 
 S = "${UNPACKDIR}/DBI-${PV}"
 
-- 
2.43.0


