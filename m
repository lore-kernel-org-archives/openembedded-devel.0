Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B43FCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21211.1780394884280178988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SiViAnsP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394890; x=1811930890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KRn47TFf8uTu4TFt4Das8ZNphR7CSCG+hyY05h/to4A=;
  b=SiViAnsPyAdzCdtFMBnPREIepmfmKUyL3hR46aQHAx9Boq7H/PvLuKwa
   6RVQkD5I7/HpNU+tQQaTtKFPB08Cx9ASzptKIlKbqwAhtAEcbkaG2PGPd
   a+YS5+rniNkN7bUbTi5UZE5Pli9Ev8qDI5/UTadO9hT4Rv7omITFLcxPc
   HDgjNhbjwNJoHO2R0cKDDxjOxNVgFkRu/AdUTbXWWyYHJQykJOE3odscR
   0YuS7L4T+K5cwjnS8lXBClSnf/pE86yKwdvuSVANuIjEDwK+iHZuRL3Ha
   ng6EfekxKsddCY1GjD/xjIi9wjorIhjomMN26ws466YCln2V5AHAO6RpY
   w==;
X-CSE-ConnectionGUID: 2ggn6x2STyWq9yQf8p3p5Q==
X-CSE-MsgGUID: U/OiFzNHTo2bYX4SKcjgcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="245981261"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="245981261"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7F33B42A335
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:09 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 374D8C013D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4FA5E1800107;
	Tue,  2 Jun 2026 10:08:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/38] exiftool: upgrade 13.58 -> 13.59
Date: Tue,  2 Jun 2026 18:07:20 +0800
Message-ID: <20260602100755.2117-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127326

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===============
- Security update
- Added NewUUID Extra tag
- Added a new Canon RF lens
- Added config_files/novelty.config to the distribution
- Decode tags from the Sony ILCE-7RM6
- Decode a new FujiFilm tag
- Decode a few more DJI protobuf tags
- Decode a new Ricoh Pentax tag
- Issue Error instead of Warning when writing XMP with some problems which
  could cause loss of data
- Improved error message when reading wrongly encoded CSV or JSON file
- Enhanced -config option to allow piped input with "-config -"
- Enhanced -validate option to do more strict checking of EXIF-for-XMP tags
- Patched -sort option avoid inconsistent output ordering of same-named tags
- Patched Composite SubSec date/time tags to specify the EXIF group for the
  SubSec and OffsetTime tags upon which they are based (avoids non-standard
  XMP tags from being incorrectly used here)
- Fixed bug in -diff feature when finding differences for specific tags and a
  specified tag was missing from the source file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_13.58.bb => exiftool_13.59.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.58.bb => exiftool_13.59.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.58.bb b/meta-oe/recipes-devtools/perl/exiftool_13.59.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.58.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.59.bb
index d22b5a55cb..224741cce4 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.58.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.59.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "38bdbace3037a89d2c332664fc60bddad118958a"
+SRCREV = "2200871d9cef988051d2a99d67df3bda6cbb30a8"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


