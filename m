Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2608C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.49377.1753918173711608602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qukxcmin;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918176; x=1785454176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ox+ySIjqxSYA+HLnUY4Rsr5wTTHcdVieRumUIH7aQZs=;
  b=QukxcminJMnJGNlXOCospRtclqDsd+Uvo7fzGEpwvwVKSvbYVHrYuI1U
   QBV++Xyk56uNhFc0ZTxqA0Q25kbVcVSZ02sDx2pYytrJO6jowvvxQ1RP0
   SlMhrt5IvPKrM5wbqadJLGU+WovZxNddGqoxR6x17+sdDSgkQ+t9U5HZq
   2+tr6/WdfVl/CKDs6gAMm3ADWqs4t2JzwDZoCbFrDGDlYLMRtMAWOv79R
   wzJJKEy8zbksq/NiWZbsYD9x08lPU/Ij+cb9F470yiyJtf7THhlm2jXy9
   EOpWvuMBe8I+iJelW5Ts0OePfh08+o/eqPXZEmNiISSasIteWASpbEw7W
   g==;
X-CSE-ConnectionGUID: lRKouznpTmeseVRiUUYI+g==
X-CSE-MsgGUID: MyRLPLykT2OyL2koZwDxkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="207978902"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="207978902"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:35 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9C5A21C00085
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id ECA69C03718
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 887551A0074;
	Thu, 31 Jul 2025 07:29:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 40/40] waylandpp: upgrade 1.0.0 -> 1.0.1
Date: Thu, 31 Jul 2025 07:29:23 +0800
Message-ID: <20250730232923.522-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118812

From: Wang Mingyu <wangmy@fujitsu.com>

0001-include-missing-cstdint.patch
refreshed for 1.0.1

4576426020932ebc481ae35c15f644af2f17e88a.patch
removed since it's included in 1.0.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-include-missing-cstdint.patch        | 40 ++-----------------
 ...426020932ebc481ae35c15f644af2f17e88a.patch | 23 -----------
 ...{waylandpp_1.0.0.bb => waylandpp_1.0.1.bb} | 10 ++---
 3 files changed, 8 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc481ae35c15f644af2f17e88a.patch
 rename meta-oe/recipes-graphics/wayland/{waylandpp_1.0.0.bb => waylandpp_1.0.1.bb} (83%)

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch b/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch
index f2169c43c9..d4f95e16b4 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch
+++ b/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch
@@ -1,4 +1,4 @@
-From 5e3243b163aa5d50083b4036c21f84c1204f2023 Mon Sep 17 00:00:00 2001
+From 2ef1bca4c35377c00ff6dc7e37d8ad75727d5607 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Jan 2023 23:25:05 -0800
 Subject: [PATCH] include missing <cstdint>
@@ -10,24 +10,11 @@ gcc 13 moved some includes around and as a result <cstdint> is no longer transit
 Upstream-Status: Submitted [https://github.com/NilsBrause/waylandpp/pull/75]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- include/wayland-client.hpp | 1 +
- scanner/scanner.cpp        | 3 +++
- 2 files changed, 4 insertions(+)
+ scanner/scanner.cpp | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff --git a/include/wayland-client.hpp b/include/wayland-client.hpp
-index a3f782b..4598a0e 100644
---- a/include/wayland-client.hpp
-+++ b/include/wayland-client.hpp
-@@ -29,6 +29,7 @@
- /** \file */
- 
- #include <atomic>
-+#include <cstdint>
- #include <functional>
- #include <memory>
- #include <string>
 diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
-index bebd71e..c25746a 100644
+index 37cf7ff..85f9e92 100644
 --- a/scanner/scanner.cpp
 +++ b/scanner/scanner.cpp
 @@ -15,6 +15,7 @@
@@ -38,22 +25,3 @@ index bebd71e..c25746a 100644
  #include <fstream>
  #include <iostream>
  #include <list>
-@@ -1106,6 +1107,7 @@ int main(int argc, char *argv[])
-   wayland_hpp << "#pragma once" << std::endl
-               << std::endl
-               << "#include <array>" << std::endl
-+              << "#include <cstdint>" << std::endl
-               << "#include <functional>" << std::endl
-               << "#include <memory>" << std::endl
-               << "#include <string>" << std::endl
-@@ -1125,6 +1127,7 @@ int main(int argc, char *argv[])
-     wayland_server_hpp << "#pragma once" << std::endl
-                        << std::endl
-                        << "#include <array>" << std::endl
-+                       << "#include <cstdint>" << std::endl
-                        << "#include <functional>" << std::endl
-                        << "#include <memory>" << std::endl
-                        << "#include <string>" << std::endl
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc481ae35c15f644af2f17e88a.patch b/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc481ae35c15f644af2f17e88a.patch
deleted file mode 100644
index 5011f05f3d..0000000000
--- a/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc481ae35c15f644af2f17e88a.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4576426020932ebc481ae35c15f644af2f17e88a Mon Sep 17 00:00:00 2001
-From: Alexey Sokolov <alexey@asokolov.org>
-Date: Sun, 4 May 2025 14:38:52 +0100
-Subject: [PATCH] Fix build with cmake 4
-
-Upstream-Status: Backport
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 866477b..8e9d2ad 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -21,7 +21,7 @@
- # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--cmake_minimum_required(VERSION 3.4)
-+cmake_minimum_required(VERSION 3.4...4.0)
- project(waylandpp VERSION 1.0.0 LANGUAGES CXX)
- 
- # packages
diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
similarity index 83%
rename from meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
rename to meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
index 0e53807cc7..576b416975 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
@@ -2,16 +2,14 @@ SUMMARY = " C++ binding for Wayland using the most modern C++ technology"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3aae28cc66d61975114c2b14df215407"
 
-SRC_URI = " \
-	git://github.com/NilsBrause/waylandpp.git;protocol=https;branch=master \
-	file://0001-include-missing-cstdint.patch \
-	file://4576426020932ebc481ae35c15f644af2f17e88a.patch \
-"
+SRC_URI = "git://github.com/NilsBrause/waylandpp.git;protocol=https;branch=1.0.x \
+           file://0001-include-missing-cstdint.patch \
+           "
 
 DEPENDS = "pugixml"
 DEPENDS:append:class-target = " waylandpp-native wayland virtual/egl virtual/libgles2"
 
-SRCREV = "4321ed5c7b4bffa41b8a2a13dc7f3ece1191f4f3"
+SRCREV = "4f208c416f37ea093e4a70a1407abd7d93c889f9"
 
 inherit cmake pkgconfig features_check
 
-- 
2.43.0


