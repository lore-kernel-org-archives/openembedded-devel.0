Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8BCC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:59:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.15900.1700647219396651195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DFnxuiy4;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: wen.yan.tan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700647219; x=1732183219;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EX6q+F+Ixk51k+/KT2ysCmoBbVTihImD65451KxPCLY=;
  b=DFnxuiy4RtxL/0Mw68el3gQNlAnyJYOx704QZ4EuTyGRNnLe1MupEZB8
   oI3G0tV/SQCpXB7RL1Uhkxar+hslj3vy1OnOMqQzNWSR5Mh2Jz20POBpr
   73BrvWA0n08wVQ8nrDibJH4TbgP6BiYXxFrxqGeE5Ku5hstXBvYo89bHl
   pmnDABj9dMDP1cixEfy37n6tvaBy4K4U0xdgDwGq302sT9rrWTNUR+QU6
   z+OqHf3G2pZs5JLui+DO/dDg2i+6TnEYpV9VgecC/IQNQTawLIGZEB+8r
   tETEHwdjKFdslfNs44/F/sTWjDupyH1AgFVGL007YiRsLDNORGZngKm9Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="377053292"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="377053292"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:00:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1098342502"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="1098342502"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:00:17 -0800
From: "Tan Wen Yan" <wen.yan.tan@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [mickledore][meta-oe][PATCH] gattlib: Upgrade to latest tip of trunk
Date: Wed, 22 Nov 2023 17:40:26 +0800
Message-Id: <20231122094026.2377479-1-wen.yan.tan@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 12:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107011

From: Khem Raj <raj.khem@gmail.com>

License-Update: Year changed [1]

Remove build directory from include directives in generated sourcecode
via gdbus-codegen

Upgrade includes fix for CVE-2019-6498

[1] https://github.com/labapart/gattlib/commit/5c87eda925c597e72107b5026c6b8d490ce76d62

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tan Wen Yan <wen.yan.tan@intel.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 1ba7dd4af..aec41edf7 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Bluetooth library with attribute support"
 SECTION = "libs/network"
 
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=71fdd2be76b4e95fe28324a70d4981c5"
+LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=a87ee154f005a6f035b8b34ac2191f3b"
 
 DEPENDS = "bluez5 glib-2.0"
 DEPENDS += "glib-2.0-native"
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https \
            "
 
 SRCBRANCH = "master"
-SRCREV = "fa54ae42ccb3d8f911e00b02ed1e581537e47f79"
+SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
 S = "${WORKDIR}/git"
 
@@ -28,5 +28,12 @@ EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 
 inherit pkgconfig cmake
 
+do_compile:append() {
+    for f in org-bluez-gattdescriptor1.c org-bluez-battery1.c org-bluez-adaptater1.c \
+        org-bluez-device1.c org-bluez-gattservice1.c org-bluez-gattcharacteristic1.c; do
+        sed -i -e 's|${B}/dbus/||g' ${B}/dbus/$f
+    done
+}
+
 FILES:${PN} = "${libdir}/*"
 FILES:${PN}-dev = "${includedir}/* ${libdir}/pkgconfig"
-- 
2.37.3


