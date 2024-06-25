Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E8EC3065F
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.166844.1719305817793011588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r5KfOzwt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305817; x=1750841817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=b6lLvU3F/N4jhnY5896o/QKGWa459U6vsIbxavwD9OE=;
  b=r5KfOzwttKLaPP5FsrCewaVP736jySsuqVHsiqBYnmzWVhGzPcF8HrbW
   ndrOpDAKGQB4Gv88lbSM9V+9LZCselJeTzm+rwWBeYjbIh8zH6s1k8IFc
   R3vw5TTnEBmfk740gdF+QCsNx8VMZzq4sv6ss8eg2q9u3xzeG1JjIHtkA
   00UaTZoHCDUkIkFd+WThVw4TLxyc9MQAqHFt+WPKoHDMYrvNlnBauzHzM
   F3Di201GonR+anByMBoNroKZAf6faDP/wFvdkZDYjGT3aUF0gAl10QdsI
   9bRyK4Y3opOuEwPjDpQ2+4OlxKxoIhkzs0modd+qw+P1gU8OsQLwRjQEN
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164960028"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164960028"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:54 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B291EC9444
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 088FCCFAB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 920992007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EE981A0002;
	Tue, 25 Jun 2024 16:56:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/57] exiftool: upgrade 12.85 -> 12.87
Date: Tue, 25 Jun 2024 16:55:38 +0800
Message-Id: <1719305790-11484-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--3.523100-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrn5nfR7I2dFNkmInFtzPDn3mZ
	taEC/Mk8p3Z/y3zTL98OZjjua7Kv2L2xlZTrH0CoqE8Y3Eo2VXAJlr1xKkE5uXd17Y6gGqDCCeW
	hs1FY/qVJRBY1Y/2gLBRzO3D5QAVJcXyA8CxIt6EdZEkR8Y/meVn4Ir4HFD2TEzBS/LIYH/cJuf
	Ck+KONddEy/dcTW6Bf0XHbHXcuQtEaPxeMMHjQbjz6L+U/pejxVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJokxAme6xi7HUOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNdp7S6pz2tVNgMhBO6beZvs+gr7//bLnuoHrdCoeg1QPNwsCIfIqlO6o4Dh
	vuLmy1I5wYLDLGlMOS+t4ZIC+OQzCv97/cfVzl5ltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added ability to write Google Container XMP tags (using the namespace prefix
  'GContainer' to avoid conflict with the Google Device Container prefix)
- Decode a few new tags for the Canon EOS R5
- Decode battery information for the Pentax K-3 III
- Decode RAFCompression from FujiFilm RAF images
- Avoid reporting FileSize of 0 for pipes
- Updated Geolocation databases from current geonames.org files
- Skip over Matroska Cluster if necessary to read Tags if referenced in
  SeekHead
- Changed conversion for Matroska SeekID (now in hex with tag name in
  brackets) and SeekPosition (now returns an absolute offset)
- Fixed problem writing XMP-Device:EarthPos coordinates
- Fixed typo in a value of Canon:DigitalLensOptimizer
- Fixed decoding of Matroska VideoScanType
- Fixed misleading error message when -o option was used to write to an
  unsupported file type
- Added a new value for a couple of Olympus tags
- Improved handling of ID3 user-defined tags
- Decode all JPEG segments from RICO box in Ricoh MOV videos
- Decode a few new values for some tags written by Canon EOS R cameras
- Patched some Olympus WB_RBLevels tags to allow 4 values to be written as per
  some newer models
- Fixed issue when writing IPTC date tags with a date/time value containing
  subseconds with 4 or more digits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_12.85.bb => exiftool_12.87.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_12.85.bb => exiftool_12.87.bb} (92%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.85.bb b/meta-oe/recipes-devtools/perl/exiftool_12.87.bb
similarity index 92%
rename from meta-oe/recipes-devtools/perl/exiftool_12.85.bb
rename to meta-oe/recipes-devtools/perl/exiftool_12.87.bb
index 66e9a3b71..1f9bf7759 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.85.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.87.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "405674e0c477931b60b10a78828483ef54761385"
+SRCREV = "30e6ca0b462591262c6ac39f0261e6528262b142"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


