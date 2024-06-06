Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D33CC27C79
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9829.1717664820887808637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VhO9ZKXw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664820; x=1749200820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0oolgdrT1T0x4bHfsBXANBdYupxisFGgEJFoBlTKe3E=;
  b=VhO9ZKXw1Ap55qtcZTTTEOZ58Mub8HM1gjTqsNatlSXfY+0Va1ONYffc
   9xr7O+dYX2qIXsbhwcamVdkqt+Y2LLvdSmZl4aXQQ8Q0o2adReQ46bbOm
   0TMjQYEoXZ28j0g9t0rkujthkj+jHVjPBGwUY38qsJPE4r9zuG/nr2tv2
   dYhTACmTxGp3Gqs1WoyqkENU2AlFPpAxqD5KLkiXt3SvRvrsW1Wj4346h
   OQehTgLOVc++9l6+DEVqWzGtGbsUAsy5kGtIRxJXa+ozVQSIqNGozoxsK
   KO/g+4YzdigAbdvLYFd1Hz3ZwRlg2XnDWAFKXDCldm4hG80Yp2ofiAOXg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141239183"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141239183"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A27DD9224
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DF803D72AC
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50D3920081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F17051A000A;
	Thu,  6 Jun 2024 17:06:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/36] exiftool: upgrade 12.72 -> 12.85
Date: Thu,  6 Jun 2024 17:06:08 +0800
Message-Id: <1717664795-13902-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--4.185000-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrWtDhCHcVAp53de2OoBqgwpYv
	gWqjMEzaEwQkgC1US8bb9dCKvDUCVs4Cn0fUiJuC/9mRo9wUk+VReWnUUdhI9Y5V1ACIyZtnpC0
	eXDBJ89Hx79muHEGAiylowBbqmU946knlg1XZOnYLwUwfdPoXvhokPBiBBj9/2vch1fMqmI85xj
	+OQMYqIkb6CBce4CcIa6PorOYxdNw9d1nHWxkekD9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frluwNZPp7AoN3cwvSs0UvZH/67Kv+wYXRsgngIgpj8eDcBpkajQR5gb3tIvbPveav8XdgkR
	R8OiM/8nRE+fI6etkiPf8FnW6kQxpv9Xqrw1KAD/0FT4Gkiz785CUD5e8yPs5p79kCxr5EyIL5E
	SOCLtH8xkYSj2Gts2Qd7kVPnWnEBY0E/8vwrFeku/kTKv9giuqwOHO1Fdn0Kb4tj0DvxRUIs9ro
	6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110724

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added GeolocationFeatureType tag
- Added read support for Nikon NKA and NXD adjustment files
- Added a new Apple:ImageCaptureType value, and changed another one
- Decode a few new Pentax tags
- Decode a few new Canon tags
- Decode some Ricoh Exif metadata from MOV videos
- Extract ID3 UserDefinedText and UserDefinedURL tags by name
- Make $advFmtSelf available for user-defined helper functions
- Documented API GeoDir pseudo option feature
- Tolerate pad byte at end of HIF file when writing
- Raised priority of FileName, BaseName, Directory and FileType tags so they
  don't get hidden by other tags in the file which may have these names
- Changed decoding of QuickTime Rotation (irot) to correspond with
  EXIF:Orientation (previously this was oddly reported as degrees of
  counterclockwise rotation)
- Fixed a typo in the print conversion value for a couple of DPX tags
- Fixed problem writing some QuickTime tags with very large (> 16 MB) values
- Fixed bug in build_geolocation utility that resulted in incorrect population
  numbers when run under ActivePerl

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_12.72.bb => exiftool_12.85.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_12.72.bb => exiftool_12.85.bb} (92%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.72.bb b/meta-oe/recipes-devtools/perl/exiftool_12.85.bb
similarity index 92%
rename from meta-oe/recipes-devtools/perl/exiftool_12.72.bb
rename to meta-oe/recipes-devtools/perl/exiftool_12.85.bb
index ba3e3fdf7..66e9a3b71 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.85.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "fc4f6614ff0c19bb5f332a9c464dcef7267931df"
+SRCREV = "405674e0c477931b60b10a78828483ef54761385"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


