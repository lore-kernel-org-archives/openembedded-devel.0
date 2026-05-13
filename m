Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EE4CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:08:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87.1778645279556638024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=guHVu4PV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645279; x=1810181279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6vs/zxay1hUrR2n/Nn6b2xwqN9DtCKJX8+4r97cXP68=;
  b=guHVu4PVIhvsezSNFJCICvdod0nq9TcUTq/YMlHk2Op2+wBc4I4kXMg9
   bA781Q5pKKpDclW8dn/n0WfRwzYxm2/uUW/8LjL2DlZrv9IEux6J198YY
   +a6kmJ3LuZ4XDhRN3UMh67SyLV4P/PWiQoUM/iB4F+f0LKUaWnWJg5Y1E
   cQmIHbFXY6wkKqn2aGqKxVSkmZO690N1jTwaYm3sYG4PYgvRV7GfkZ/cb
   DB/PRNqSpM4sJG7iDxNbHIwZCqrHfnqDHiKK7QxK8Ko5ZOt87cA2A0Wjc
   wQIFmg0Jb1pN5nL7PGeJHNbiEH6FF5ZB5clNiyWzwqVoUC/W0PN3LrKZb
   w==;
X-CSE-ConnectionGUID: wWUmc7K8Rym0r1I7cGksIQ==
X-CSE-MsgGUID: nydmY7gyRvygbzNe4C5smg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240264917"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240264917"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:07:57 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B117B8204CF
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:57 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 6C093C00549
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 114DC140008D;
	Wed, 13 May 2026 04:06:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/56] exiftool: upgrade 13.57 -> 13.58
Date: Wed, 13 May 2026 12:05:03 +0800
Message-ID: <20260513040555.377-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126893

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added a few new Nikon Z lenses
- Added a few new QuickTime MajorBrand values
- Added a new RAFCompression value
- Added undocumented -eh option (alias for -E/-escapeHTML)
- Decode timed GPS from INNOVV N2 TS videos
- Improved decoding of Canon ColorData for some models
- Changed the name of the RAFVersion tag to FirmwareVersion
- Removed conversion for Garmin FIT DeviceIndex values
- Properly parse XML CDATA and comment sections
- Fixed issue which could cause failed Garmin test on some systems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_13.57.bb => exiftool_13.58.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.57.bb => exiftool_13.58.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.57.bb b/meta-oe/recipes-devtools/perl/exiftool_13.58.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.57.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.58.bb
index fc4ee18494..d22b5a55cb 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.57.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.58.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "dae9b7a86cb47c4d2bee8606455c7c27af8a3d56"
+SRCREV = "38bdbace3037a89d2c332664fc60bddad118958a"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


