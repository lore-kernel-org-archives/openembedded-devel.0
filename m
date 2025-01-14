Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A71C0218A
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.40585.1736843349905349176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hX6pi+PD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843351; x=1768379351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nnUgz3stjlMPGsr0kMex4WJFQeBomuz2zm3qqGK9Ua0=;
  b=hX6pi+PD9Ao4RHjQsJjVcoI7GqMmMmgRVpQ6q/6NYTEP4JcHnQmomJy6
   riXVVUaTas9iQzrFPWAQaIXHw0pmm1l6O9mnD4K3rKKgEJMT7epoAjC8z
   erDIy0KYqtdtPO9y63kOwpvJgxXJ5FTEy87CHy4yX4IKESlR9kXdGjbTF
   CnlE4qq2Qx/4SNJsWjWpV2/7vxIK+2lq0tOMro/XpVpSJl3ujPQPfpQwZ
   3UTmkVNLRexKA6r0BiostV65cpIO7Vae25vBRG6dfBnvMs+fjNN0Q4/xa
   Thx3La/8faEn2+qGInpa3sxP+/WhRZBaBwpc8aV1mS3Tvw0CSL+Lu2mtw
   Q==;
X-CSE-ConnectionGUID: U45y/U+0Qa66gICctgpqpA==
X-CSE-MsgGUID: sASborFcQ6K82cS0vsdsoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="185663965"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="185663965"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:09 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C307DE8523
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 94910D5093
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 152296B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B85B21A000B;
	Tue, 14 Jan 2025 16:29:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/30] pugixml: upgrade 1.14 -> 1.15
Date: Tue, 14 Jan 2025 16:28:33 +0800
Message-Id: <1736843329-4131-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--3.404900-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhEbV
	C+F4n057hERFxtSZDQ8u5ed2FW2K2RDAodjg5c9wOWUWxTQJdI9K4f4Z+CZAZ0jINjnv2/BMqJw
	LqmHixa2Mx5HzfQifbI+yv+qprnC3P5XLmDCBzG0c9jA4mLo8uTMf18p8qrK7PJ29SD5V9Ka+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+ARmX+fjJ/dgYWUQesxIFNf+cDD
	zKnTzUsmC9V+Kp7YA7MPn2KUVfvBJh5qFk2poYLA34KY0g5BTfhKQh1LCmGBpsoi2XrUn/J8m+h
	zBStanuJKGioYsvn2gtuKBGekqUpnH7sbImOEBSZCC+K/3RdhOXO2ilQS12vvI5wdOCRNl7H8OM
	j0ViIP7/Fa+5e+9lpR+2L9z0AOEVexzx40l5N4HbIQ8NQI+LK0OFl+1kS5mzsfZ9V6Q6rCZgvUo
	iYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114857

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Changelog:
==========
- Many xml_attribute:: and xml_node:: functions now transparently support
  std::string_view and std::string when C++17 support is detected.
- Improve pkg-config file generation for NixOS
- PUGIXML_BUILD_APPLE_FRAMEWORK CMake option can be used to build pugixml
  as .xcframework
- PUGIXML_INSTALL CMake option can be used to disable installation targets
- Fix clang/gcc warnings -Wzero-as-null-pointer-constant, -Wuseless-cast,
  -Wshorten-64-to-32
- Fix unreferenced function warnings in PUGIXML_NO_STL configuration
- Fix CMake 3.31 deprecation warnings
- Stop using deprecated throw() when noexcept is available

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pugixml/{pugixml_1.14.bb => pugixml_1.15.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.14.bb => pugixml_1.15.bb} (87%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.14.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.15.bb
similarity index 87%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.14.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.15.bb
index 19207883bf..457fa59435 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.14.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.15.bb
@@ -7,10 +7,10 @@ data-driven tree queries."
 HOMEPAGE = "https://pugixml.org/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=ad370df61d83846cf9e4726244671201"
+LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=5dbb98bbc2e5051c26ce32508b4f703e"
 
 SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2f10e276870c64b1db6809050a75e11a897a8d7456c4be5c6b2e35a11168a015"
+SRC_URI[sha256sum] = "655ade57fa703fb421c2eb9a0113b5064bddb145d415dd1f88c79353d90d511a"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeux/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


