Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62BFCAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ZglyFD5s;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628689; x=1790164689;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cLKNdSDU93zQA9d41V+noXqoVtbqjldZIgAOO16X76c=;
  b=ZglyFD5sr/PvoMZTUGhCj//NVQAQP+Z0df/Je+2I69ZPMgi4WN7uWDTG
   MrAe53VL0yBNjaVoPn7oJjwP4JKjRioO32UX4E4T9cnA5Je0En2B0u8X4
   i0VzKpWFsOY0vtbqbD6Je43l+mZN42STov/9q7Bp56yjfVyUc7c9jOW9U
   EexAuozMaJxSuFTFZ6xodSeU22thdS5YoGToXiiInEhEiA9HPf9pJLo8g
   FErc/oc4gU846HWnR5OXOFYDslW7Oi0Vw3YErZxL6QWhIV/ha70+HvmKO
   NvSASX+qSE7/e8WnbekrEL4abp9BSHYeZ4FGNQp2FBFsAtOT5SBYXJxoS
   A==;
X-CSE-ConnectionGUID: hNq1wYu0QAWNWBFSMMAQQw==
X-CSE-MsgGUID: UtRrzzIQQTCmW8ZumpgVaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821812"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821812"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:08 -0700
X-CSE-ConnectionGUID: qxCZh5cERtmrlKdmwJqN/Q==
X-CSE-MsgGUID: CuIVCYJWTqG64RRyk7HdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875238"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 18/24] libvncserver: fix generated LibVNCServerTargets.cmake
Date: Tue, 23 Sep 2025 19:57:21 +0800
Message-ID: <a05db3fd5c75e1b7df7a65422c04650d7fc7f178.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119707

From: Marc Ferland <marc.ferland@sonatest.com>

The currently generated LibVNCServerTargets.cmake will include the
following 'set_target_properties':

    set_target_properties(LibVNCServer::vncclient PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
      INTERFACE_LINK_LIBRARIES "systemd;/usr/lib/libz.so;/usr/lib/liblzo2.so;/usr/lib/libjpeg.so;/usr/lib/libgcrypt.so;/usr/lib/libgnutls.so"
    )

INTERFACE_LINK_LIBRARIES here points to absolute paths which hardcodes
the library paths. From CMake doc [1]:

    Note that it is not advisable to populate the INTERFACE_LINK_LIBRARIES
    of a target with absolute paths to dependencies. That would hard-code
    into installed packages the library file paths for dependencies as
    found on the machine the package was made on.

This breaks krfb build (kde desktop sharing server) since CMake cannot
find these libraries. Removing the absolute paths solves the issue.

Note: I also added a 'inherit pkgconfig' since libvncserver uses it to
detect libsystemd presence.

1: https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_LINK_LIBRARIES.html

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 215694286716cf83bf9e52c5e61b4cbc861098fc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index ce01593b8b..6f271ee0d3 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGE_BEFORE_PN = "libvncclient"
 FILES:libvncclient = "${libdir}/libvncclient.*"
 
-inherit cmake
+inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
 SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
@@ -52,5 +52,5 @@ S = "${WORKDIR}/git"
 EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
 
 do_install:append() {
-    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/LibVNCServer/LibVNCServerTargets.cmake
+    sed -i -e 's|${STAGING_DIR_HOST}${libdir}/||g' ${D}${libdir}/cmake/LibVNCServer/LibVNCServerTargets.cmake
 }

