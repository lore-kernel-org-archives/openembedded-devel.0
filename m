Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455D6C7EE43
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6188.1684997789312798032
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105954838"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105954838"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:26 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AEDE8F079A
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DF05FBF3C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 587D02007CA80;
	Thu, 25 May 2023 15:56:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dbus-cxx: upgrade 2.3.1 -> 2.4.0
Date: Thu, 25 May 2023 14:56:07 +0800
Message-Id: <1684997777-2061-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--6.567700-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yTo39wOA02LhQRlUSJjs8Z8H4DTIEE89jHv3
	EJJrdBux1yespxuhfAFCyGE7PA8pRUPkQUli7/eXd9qTpu9VVUtar+yddvGkIN9RlPzeVuQQ1vZ
	7s3YIVDL7tBxFpWhrycYoh/qEF/tV+B5nwXObIkbNgrlT5Ajc7sE5XPQnBzGXR/IzlV+CMbaH62
	gsspfBEVgMBEzGHoYToe/KDVmzFN+UG5QaGlcSvUrOO5m0+0gEGbJMFqqIm9xOBgIz0RJ2p2Nok
	eyvFnLMLLlljSrK0XAlxpiC06F3B22dw0j7ViZrb056mCmF00Z9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO0f/PIv6AGqLByihc8MaX+4TABZulaHDZfH6t/OjdiVZmGvj1yB8wvy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102805

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Include-missing-cstdint.patch
removed since it's included in 2.4.0

Changelog:
==========
- Add ability to switch between big/little endianess for messages.
  This is to support implementations such as sd-bus where handling perfectly
  valid messages in big-endian format is apparently too difficult
- Fix extracting certain deeply nested messages with maps
- Various other compile fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{dbus-cxx_2.3.1.bb => dbus-cxx_2.4.0.bb}  |  5 ++--
 .../files/0001-Include-missing-cstdint.patch  | 30 -------------------
 2 files changed, 2 insertions(+), 33 deletions(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.3.1.bb => dbus-cxx_2.4.0.bb} (81%)
 delete mode 100644 meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.3.1.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.4.0.bb
similarity index 81%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.3.1.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.4.0.bb
index 7af62b741..6294827b1 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.3.1.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.4.0.bb
@@ -5,9 +5,8 @@ SECTION = "base"
 LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
-SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https \
-           file://0001-Include-missing-cstdint.patch"
-SRCREV = "898f6ea8f7ffe454e81a9337002df555728d4199"
+SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
+SRCREV = "ebac3df5beeb4337f65968ae5b265927abb792af"
 
 DEPENDS = "\
 	dbus \
diff --git a/meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch b/meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch
deleted file mode 100644
index 4ad69eab4..000000000
--- a/meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 56e2cce87445d514c9992ecc19d03bb2115c82d6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jan 2023 22:17:31 -0800
-Subject: [PATCH] Include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/dbus-cxx/dbus-cxx/pull/111]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dbus-cxx/enums.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dbus-cxx/enums.h b/dbus-cxx/enums.h
-index 8253a4b..c793fad 100644
---- a/dbus-cxx/enums.h
-+++ b/dbus-cxx/enums.h
-@@ -5,6 +5,7 @@
-  *                                                                         *
-  *   This file is part of the dbus-cxx library.                            *
-  ***************************************************************************/
-+#include <cstdint>
- #include <ostream>
- 
- #ifndef DBUSCXX_ENUMS_H
--- 
-2.39.1
-
-- 
2.34.1


