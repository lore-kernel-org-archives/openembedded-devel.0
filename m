Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.1117.1588743206423492576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 22:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=TzXN/TL9;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588743206; x=1620279206;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EziQlGwPRYI7lcbTIZ3O7Q2o6EUOpbPhIcH1FKyTt24=;
  b=TzXN/TL9uf437hAtPtezHGJQKo3RD08tBj1YlclonaSTa8oGUDg8skuQ
   hZhA/wViVJXRLqrOZDhILCdSHmaCz/QKmDMXhvM3I8qBmPWoaENbB/FW8
   c0nY9Nu0Ewd8NAU9FpdFoTeleOvDjm/Vl2TSGYG0SZsAhfx482iK9xNww
   Wmu9jpmFX8TAl51hlm0g9JjGhZuryJZuRURKH86G3By2Sc1O9cIU0o6hL
   jngicXxOuwsN7gO/iHaciwRdYY1Jb47FbJlscj7hdzHap1RpSYhVY/y4c
   Im7BAjERDsZKv811N4s6Km4RMfe0056lywze38WCYb7D4v3a07uGdE/AG
   A==;
IronPort-SDR: CGYna8hMaiun8ha2HDCMnV9vX51z2qNgign1HzMWSCa7y/5vck5KIr1gwDRgwbitWWSajir8A7
 vdlWBchFkuIcitt07Lhg9uwZkKnu6+wS7mJbmkuwbyd5hUFF5izLETSbG3kIKnSknJiubP9VdU
 fVg/Qi42NvAIYnqHeOfUoOJWqzel8XhaThQZ2iV9k0ByxBroPwkKi5A37DnmT0nIGROPMuTKsR
 G8bjVbcQoXuySZwDTngd6wAIBXHRKl8aVHarLbrJJQ3f5OFLnCiRIOyElfwL6T39LABE15Qsnm
 BEk=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="24181745"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>, Jacob Kroon
	<jacob.kroon@gmail.com>
Subject: [meta-java][PATCH 1/2] openjdk-8: require GCC >= v6
Date: Wed, 6 May 2020 07:33:11 +0200
Message-ID: <20200506053312.251699-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As nobody should use older versions of GCC anymore this patch drops all
version dependent workarounds and requiers host gcc >=6 for building
openjdk-8.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Tested-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 README                                    |  2 +-
 recipes-core/openjdk/openjdk-8-common.inc | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/README b/README
index d28da02..f97378d 100644
--- a/README
+++ b/README
@@ -133,5 +133,5 @@ BBLAYERS ?= " \
 
 Build host dependencies
 -----------------------
- - gcc with c++14 support
+ - gcc >= v6
  - libstdc++ static
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 5228338..c78bb2a 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -170,20 +170,14 @@ EXTRA_OECONF_append = "\
 "
 
 # Since v6, GCC sets the default C++ standard to C++14 and introduces
-# dead store elimination by default. OpenJDK 8 is not ready for either
-# of these changes.
-FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
-FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
-FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
-FLAGS_GCC9 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
-FLAGS_GCC10 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
-
-# GCC 10 defaults to -fno-common, but OpenJDK 8 is not ready for this.
-FLAGS_GCC10_append = " -fcommon"
+# dead store elimination by default.
+# Since v10, GCC defaults to -fno-common.
+# OpenJDK 8 is not ready for either of these changes.
+GLOBAL_FLAGS = "-fno-lifetime-dse -fno-delete-null-pointer-checks -fcommon"
 
 # flags for -native, and for bits that need a host-tool during -cross
-BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
-BUILD_CXXFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
+BUILD_CFLAGS_append = " ${GLOBAL_FLAGS}"
+BUILD_CXXFLAGS_append = " ${GLOBAL_FLAGS}"
 # flags for -cross
-TARGET_CFLAGS_append = " ${@openjdk_build_helper_get_target_cflags(d)}"
-TARGET_CXXFLAGS_append = " ${@openjdk_build_helper_get_target_cflags(d)}"
+TARGET_CFLAGS_append = " ${GLOBAL_FLAGS}"
+TARGET_CXXFLAGS_append = " ${GLOBAL_FLAGS}"
-- 
2.26.2

