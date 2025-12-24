Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8E2E7542D
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:13:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117694.1766567609109600995
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ue/aZSDm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567608; x=1798103608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TPPgeGt6ol2r8M6AmjxYdB7FXqy+6Inxk4zRyCREpkU=;
  b=Ue/aZSDm5FQtejBFl1XIvpKd5JwLzrkW72WYLbEC65N5QXt7SWPgnsfS
   GcWr5cbW81lcAkTSLIaxCTiNoG3LdHhHM6zPkQ7Llgi4qV6hYZDHQ7hT+
   U6VjwyBo8Ghf5vr3oCrjr22O692lcemzq5zdyrR3mP26Ifb+gA3LjuQYk
   NH78pFgtbyCg9vHTXXAh7HupRrCHEDZz25MqREmUgg/OYy6zhQY6xNrL4
   es7bMJd0tTdUrmK6HdlWze+XPv/MN4LHCoavUeodBk0m8EtVQZto07rTc
   ULg7kx1hE9UDykCjsgMfkF0hDgEZCKmM07ZsOf+deGQ+zrs1+AfD3UPsT
   A==;
X-CSE-ConnectionGUID: Lyf//zA+QTSkcLIafj/3XQ==
X-CSE-MsgGUID: kVfPltMWRye17mjMN7Pp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="212367767"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="212367767"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:13:27 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 851D21000341
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:27 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 337CB1C00F98
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8EC962000761;
	Wed, 24 Dec 2025 09:13:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/28] exiftool: upgrade 13.43 -> 13.44
Date: Wed, 24 Dec 2025 17:12:38 +0800
Message-ID: <20251224091304.974-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122852

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added read support for Kandao KVAR files
- Added a few new Panasonic tags
- Added a new XMP-crs tag
- Added a few new Matroska tags
- Added a few values related to the new RAW file types for the Sony ILCE-7M5
- Decode a few new PhaseOne tags
- Decode timed GPS and other metadata from Kandao MP4 videos
- Improvements to family 1 and 5 groups for tags in Matroska videos, and
  prioritize top-level tags when duplicates exist
- Assume a default TimecodeScale of 1ms for MKV videos
- Patched to avoid runtime warning when parsing corrupted QuickTime data
- Fixed decoding of ShutterCount for Sony ILCE-7M

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_13.43.bb => exiftool_13.44.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.43.bb => exiftool_13.44.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.43.bb b/meta-oe/recipes-devtools/perl/exiftool_13.44.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.43.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.44.bb
index 5f973098b3..8b5a0319cd 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.43.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.44.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "dbd6def5620f4d7e4ab02d9ee5de498263ea73c1"
+SRCREV = "aa4baf5c71d92e5dc9a077ee24fcc4fd478936c1"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


