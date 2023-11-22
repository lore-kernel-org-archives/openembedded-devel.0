Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0826C072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:18:15 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.13738.1700633893209216222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119923650"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119923650"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:18:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EBE52D9D93
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:18:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2801BD88D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:18:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52C0B6B810;
	Wed, 22 Nov 2023 15:18:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] exiftool: upgrade 12.69 -> 12.70
Date: Wed, 22 Nov 2023 14:16:23 +0800
Message-Id: <1700633783-7740-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.005
X-TMASE-Result: 10--0.458200-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrWQ3R4k5PTnCkob0Y35+HFO4m
	rVlrCeJLOPMIjulXWjIEDNde112WEfNM2dvGMGecmE9Jt7idrkysHzm4NPdwpB1VsgYzsXjCbNN
	GUMZTc/NeAO0T1zuuskt6NL8M7oHYdumHfQnEWuc4Rp7n45au/dhQO8CvZj/XvAe75exuTNE5xj
	+OQMYqImdnfHEqrN/MDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4IxtsnwY
	eQAPZ+jN5at2BIGOiZhafan3Io4vU7x8xnBqoiCngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w60VqZ4JexWOIIimk8w64uhPCbL+t/1RniZY7zyyB/ht1m7xamOSjT8+Twq52K9/EvcmsD
	XcedpeYs4ByvN4BHGX+s8tg7F3eeCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106992

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  - This marks the 20th anniversary of the initial ExifTool release!
  - Added ability to read/delete C2PA CAI JUMBF metadata from TIFF-based images
    (eg. DNG), QuickTime-based files (eg. MP4) and WebP images, and read JUMBF
    from other RIFF-based files (eg. WAV, AVI), GIF images and ID3v2 metadata
  - Added read/write support for JPH images
  - Added ability to read Leica Q3 maker notes
  - Added ability to recognize and write FujiFilm M-RAW RAF images (multiple raw
    images in a single file) and the ability to read preview-less RAF images
  - Added support for reading a number of obscure Microsoft EXIF tags
  - Added a few new Sony lenses and support for the ILCE-9M3
  - Added a couple of new Panasonic Leica lenses
  - Added a couple of new Canon RF lenses
  - Added a number of new CPUType values for ELF executables
  - Added some new Olympus CameraType values
  - Decode a few more ID3v2.2 tags (github #142)
  - Decode a few new Canon G5X Mark II tags
  - Decode WB_RGGBLevels for a few more Nikon cameras
  - Extract information from FujiFilm M-RAW header
  - Improved decoding of a few Nikon Z tags
  - Marked misspelt XMP-drone-dji:GPSLongtitude tag to Avoid when writing
  - Changed RIFF MaxDataRate conversion to use SI prefixes by default
  - Fixed decoding of unknown ColorBalance information for some Nikon models
  - Fixed an incorrect Nikon Z LensID
  - API Changes:
      - Added ByteUnit option

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_12.69.bb => exiftool_12.70.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_12.69.bb => exiftool_12.70.bb} (92%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.69.bb b/meta-oe/recipes-devtools/perl/exiftool_12.70.bb
similarity index 92%
rename from meta-oe/recipes-devtools/perl/exiftool_12.69.bb
rename to meta-oe/recipes-devtools/perl/exiftool_12.70.bb
index 09b45ada7..58b5e5139 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.69.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.70.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "d521eba31a3d1753f53ee251cd6879900a0275b5"
+SRCREV = "bec8a1bff8a97ea8f2895e7e5c5e396e0e48d419"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


