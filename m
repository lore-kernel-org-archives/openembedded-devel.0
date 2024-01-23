Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8602C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 00:48:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.167.1705970892704488270
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 16:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="134570683"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="134570683"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:48:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 78C5FD6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:48:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3B79CFBA4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:48:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BD8B1EA80B
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:48:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A8B071A006A;
	Tue, 23 Jan 2024 08:48:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] btop: upgrade 1.2.13 -> 1.3.0
Date: Tue, 23 Jan 2024 08:47:53 +0800
Message-Id: <1705970873-24263-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-2.144800-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mrh6nwisY6+c14YeSlHZYFonCY
	NJeKvSCj5JycdpKDCe9bEyZZsI9kWBJ8EINAmcWbSCtgxgcsrMqXBPRemiwRNcnb9Hgg5W80nW9
	y3u6VT2ZyhEbsob8Ka0FCXXISkKEjTl6egUCE6WgEClJgjzpjqHhKwaDYNA5igoLCSomnT4AIpj
	Lek0l1pVfk7+g08q3smH0xdtEzEFw7mT8/EEC+/vCW/PNRRp/ZN5dqZcIK7VgwcMedHxxRAiFLS
	h+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRsAtH/ey8zRp50C6WJNXTpiDG+R
	jKM7C1RbJcQH3furV3k48PxckV+kHxPMjOKY7A9qHXONfTwSQsRB0bsfrpPIcSqbxBgG0w6c4j3
	lV2XbDHlmKbofolFhJnGOZJoZx3s8rv80bTFTvpCTGm5bFZMbw5eQliJgFnm3f9sdrBIVi6KGQZ
	gRjzMZdnk10ZXg0PyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 00:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Added Gpu Support Linux
* Added platform support for OpenBSD
* Enable macos clang
* Fix Apple Silicon CPUs misprinted
* Cmake support for MacOS
* Elementarish theme: color update according to Elementary palette
* Add alternative key codes for Delete, Insert, Home, End
* Fix scrollbar not clearing sometimes.
* Add keybind for toggling memory display mode in PROC box
* Minor string initialization improvement
* Made disks statvfs logic asynchronous.
* Fix signal list on non-linux/weird linux platforms
* Add option to accumulate a child's resources in parent in tree-view
* Add CMake support for Linux
* Horizon theme
* Fix short conversion of 1000-1023 *iB
* Fix integer overflows in btop_collect.cpp
* Support compiling with LLVM
* Fix getting zfs pool name with '.' char in freebsd
* [macos/freebsd] support gcc13
* FreeBSD swap info
* Create adwaita.theme
* Try get terminal size of "/dev/tty" if stdout fails
* Refresh rate program argument
* Improved error handling when determining the config directory
* Use native POSIX polling syscalls to read input
* Conditional compile on Big Sur and up

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/btop/{btop_1.2.13.bb => btop_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.2.13.bb => btop_1.3.0.bb} (93%)

diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipes-support/btop/btop_1.3.0.bb
similarity index 93%
rename from meta-oe/recipes-support/btop/btop_1.2.13.bb
rename to meta-oe/recipes-support/btop/btop_1.3.0.bb
index a944fe7b5..f20d1a8ec 100644
--- a/meta-oe/recipes-support/btop/btop_1.2.13.bb
+++ b/meta-oe/recipes-support/btop/btop_1.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "console/utils"
 
 SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main"
-SRCREV = "9edbf27f1b6d5844a97325fcda732762ba086a99"
+SRCREV = "36842a3bccfb78f5c27642435bff387b42f7d13b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


