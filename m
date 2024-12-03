Return-Path: <deepan.shivap@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6CBE6C60A
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 05:50:32 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.12900.1733205026155689579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 21:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: deepan.shivap@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 3 Dec 2024 14:50:23 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: deepan.shivap@lge.com
Received: from unknown (HELO deepan-shivap-deepan.bee-live.svc.cluster.local) (10.185.60.35)
	by 156.147.1.127 with ESMTP; 3 Dec 2024 14:50:23 +0900
X-Original-SENDERIP: 10.185.60.35
X-Original-MAILFROM: deepan.shivap@lge.com
From: deepan.shivap@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "deepan.shivap" <deepan.shivap@lge.com>
Subject: [meta-networking][PATCH] ot-br-posix: Fix Musl build error
Date: Tue,  3 Dec 2024 14:49:56 +0900
Message-Id: <20241203054957.1925390-1-deepan.shivap@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 05:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114179

From: "deepan.shivap" <deepan.shivap@lge.com>

Mistakenly removed musl-fixes.patch in previous commit.

update & Include 0001-Musl-build-fix.patch based on latest upstream of ot-br-posix

Remove CXXFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare
-Wno-error=unused-but-set-variable", as issue is not reproducible with
current SRCREV of ot-br-posix.

Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
---
 .../ot-br-posix/0001-Musl-build-fix.patch     | 27 +++++++++++++++++++
 .../openthread/ot-br-posix_git.bb             |  4 +--
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch
new file mode 100644
index 000000000..108ed76b3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch
@@ -0,0 +1,27 @@
+From 502aa4ab4bbc790fb2999ff2b5f10dabd7085190 Mon Sep 17 00:00:00 2001
+From: "deepan.shivap" <deepan.shivap@lge.com>
+Date: Mon, 2 Dec 2024 23:12:17 +0900
+Subject: [PATCH] Musl build fix
+
+usage of getaddrinfo_a creates dependency on libanl, which is  specific
+to glibc.
+
+Upstream-Status: Pending
+Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
+---
+ src/posix/platform/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix/platform/CMakeLists.txt b/src/posix/platform/CMakeLists.txt
+index b4ac241f5..7b2028e45 100644
+--- a/src/posix/platform/CMakeLists.txt
++++ b/src/posix/platform/CMakeLists.txt
+@@ -175,7 +175,7 @@ target_link_libraries(openthread-posix
+ )
+ 
+ option(OT_TARGET_OPENWRT "enable openthread posix for OpenWRT" OFF)
+-if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT)
++if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT AND NOT OT_TARGET_MUSL)
+     target_compile_definitions(ot-posix-config
+         INTERFACE "OPENTHREAD_POSIX_CONFIG_NAT64_AIL_PREFIX_ENABLE=1"
+     )
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 8183f5203..f4c193a8e 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -19,15 +19,13 @@ SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=m
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://default-cxx-std.patch \
            file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdir=third_party/openthread/repo \
+           file://0001-Musl-build-fix.patch;patchdir=third_party/openthread/repo \
            "
 
 S = "${WORKDIR}/git"
 SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
 
 inherit pkgconfig cmake systemd
-# openthread/repo/src/cli/cli.cpp:1786:18: fatal error: variable 'i' set but not used [-Wunused-but-set-variable]
-#    for (uint8_t i = 0;; i++)
-CXXFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare -Wno-error=unused-but-set-variable"
 
 LDFLAGS:append:riscv32 = " -latomic"
 
-- 
2.34.1


