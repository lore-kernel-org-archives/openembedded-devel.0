Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569ECC46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 06:58:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.76164.1703573919799561889
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 22:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="123938779"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="123938779"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 15:58:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F1AA0D772D
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:58:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E751D67B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:58:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3DE72005932A
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:58:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6E5F61A0072;
	Tue, 26 Dec 2023 14:58:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] exiftool: upgrade 12.70 -> 12.71
Date: Tue, 26 Dec 2023 14:56:14 +0800
Message-Id: <1703573774-12625-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10-3.081000-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrYjDXdM/x2VMtferJ/d7Ab2+K
	wJ0+j/Ty7Eg/Zm3AVvcSRxY3TKQCqf9HU1IxzaoJ/9mRo9wUk+VNLPQl0QAltMNn70cjmctskrI
	9/WPu3jc6Ei55HXJC+eTTSPeVC/59WuiZFrpf1HwLwUwfdPoXvlQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaJMQJnusYux1DsKXyzHgcEbDVR6LU77r+vBILqohnmeSaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrbVMgOlEoheQL6m8/WVte+1ZoAHTvC30fkYWbDiQ3qGYR9e3
	BGhdEp77Uz6I21OMQbF5iCqENnAUuVZ6zC0r3h6SR+MZg+UPfx0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 06:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107786

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added a warning if there was an error reading an alternate file with the
  -fileNUM option
- Added the ability to write QuickTime Keys:Encoder
- Added a few new Canon LensType values
- Added a new, obscure EXIF tag
- Decode real-time metadata from Ricoh Theta videos
- Decode SpecularWhiteLevel for more Canon models (github #232)
- Decode Canon DualPixelRaw tag
- Decode a few new Nikon tags
- Decode more FujiFilm M-RAW tags
- Improved generation of tag names for some JSON tag ID's containing colons
- Fixed "Undefined subroutine" error when writing makernotes as a block
- Fixed missing ID in family 7 group name for ID3 tags which are not valid for
  the specified ID3 version
- Fixed bug where some tags from alternate files (with the -fileNUM option)
  could show up as "not defined" when used in expressions even though they did
  exist
- API Changes:
    - Added NoMandatory option

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_12.70.bb => exiftool_12.71.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_12.70.bb => exiftool_12.71.bb} (92%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.70.bb b/meta-oe/recipes-devtools/perl/exiftool_12.71.bb
similarity index 92%
rename from meta-oe/recipes-devtools/perl/exiftool_12.70.bb
rename to meta-oe/recipes-devtools/perl/exiftool_12.71.bb
index 58b5e5139..7d8d6b69f 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.70.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.71.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "bec8a1bff8a97ea8f2895e7e5c5e396e0e48d419"
+SRCREV = "7cefbaaa9057231b6e9b5765934f06e75994420d"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


