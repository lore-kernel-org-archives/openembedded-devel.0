Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE971C88E40
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:21:40 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6988.1789017698807617445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YbwYaCYP;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so938490a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 22:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789017698; x=1789622498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afWD0+n2/iSfou9BuKcm2nGJ3VlXBIxSvEG3XT9pqWk=;
        b=YbwYaCYPrpzRGg6jLL/aMlvL1YUNbx7Sot4Oye3C8ZBe76FQYaDsdKaf4CiBLG9JAF
         GusyXi8+fUsao1QS8DNGLUUFrGBzrAhuB+wL+70aJ5gXR1Zpv2GVUEPDxXRiq62KCMmz
         KCrqxbwmVsULzJt6QIC9xR/GhqZlCU4HTn4Qijqw5np9mgADj1EQKN7oh5/893I3H/Uc
         dd8WjkBrrFiuMYwPd54p7A3tZqFkU0rSvmuGa97LqsSzX56w9htR3kkNECvnJ6PZ49QH
         +QybRjSoaZ8VgRG9Q9yoFZbi3SeG/39KdD+tyAlp32Vz6uuMKSF0QK5yq6ooKngDLh1N
         LE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789017698; x=1789622498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=afWD0+n2/iSfou9BuKcm2nGJ3VlXBIxSvEG3XT9pqWk=;
        b=ksEnvwOeNldQzogfn29LeTu1gkySTi09yt4N/YBGGszsSI7ETgUwdH+082uQClqDkt
         P3kAiprDQYoCgIGMOETJqQk5SsSlWgurhwkQyA0jOTuVvbzoWRjfy3WMcH8V7c39J3LR
         fsUFpRFwOrMn+WPG1/hxPPW5CF19LIaYhF32ykw3nqSxrZ8tyxaU9dCdfmk5BWyrQYds
         KpnpZsV5wqsoMR/JHfs0KieLtiPu+WeVAOmYzinD/SdFU2n8dwn0SicD+v+OLGPQOPoi
         6Q7kGDJxJ9vdw8S+GO3LEK2ASAN//k6BV5X5RRQeryUDD7R4JKN5N+sQyUnlzmkqu2v8
         XnJw==
X-Gm-Message-State: AFuF++kcCQrVUe9/K7FAlHvfB/H4vxojF4z/E6qkYdBZOEa7AxxF6F4q
	w13zJ9yTNuq4C37tcC2loeoyeI4lMkRyQbls/rWzQnQSYh0c9jT7rDwlK8WLxA==
X-Gm-Gg: AYBFou3c3/Bn7J5VWdiO+bPYaliCVmOemm2v35a2ad3kKML1p7yMBlnLUGmyAIfW++o
	tefk8+rp3ltffuQJzOb/kpFoLyMuiPlflIbIjPWDyiWlfLnaUkzUobow4UCR6eCIPvKZ3RI1aGA
	f6U3OMHHz48iZUILSs5N7ynP2cFMD+5m8aLf6FElSp91+E33giplkYQJVm9huovFkqASYphGuFc
	ddEtVF3Liw8oxNaM8wH2WgBpewCcCvw7Vyama9yBxGqfadEwqeCaiKj3fqd2YObJh64JfNCJI+A
	a2bxXkBIlsTrvKnJO6qcsWtrTGwnTYnGkvJuRyZ5lM0PZOXH/XjnGhxOAV2uGf7SosbebJuFy33
	DTrYWvFqu3F+P8abCCGgB0ED2eoFqXLHRxyZ20Okjs12OlgcyklGSPQq4eWHberfr+MCTa2r/32
	BQd9T/+1RMxCpiMfcaZABoqdBMxk62tvvZE/rWcRASHbM1DBiY3TFNYCSdKGO3FgoSq8J/E9EZ3
	oWA83gXmccA2S8Ro3rulU5LX7fCyx4eVCnsiXXftOfNY7vUs1LT83oAbmAwsqk9zKIDIfYtQuG1
	Hkl18SB5kowGvi8NwwcUiXTp1gnT+3sU4BMDorErt8j7WhxcxJ0stFhOxj4ZKDVjHykzOzbbn5w
	JxRQsM44RekkvkCXPxlSqTsA8YtkyJx4++o0AHkKmOePoDlquh3XterFkV9Onfg+0mKM=
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d70ae1a5emr8565516a91.13.1789017697850;
        Wed, 09 Sep 2026 22:21:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm54554111c88.12.2026.09.09.22.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:21:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 2/2] ot-br-posix: Update to latest tip on trunk
Date: Wed,  9 Sep 2026 22:21:33 -0700
Message-ID: <20260910052133.2153716-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910052133.2153716-1-khem.raj@oss.qualcomm.com>
References: <20260910052133.2153716-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 05:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129904

Fixes build with clang-23, which enables -Wunused-template in a way that
trips over openthread's parse_cmdline.hpp. With -Werror -Wfatal-errors
that is fatal:

  third_party/openthread/repo/src/core/utils/parse_cmdline.hpp:240:48:
    fatal error: unused function template 'ParseAsHexString'
    [-Wunused-template]

Already fixed upstream in openthread commit 30c3569ac5ca ("[parse-cmdline]
make ParseAsHexString() inline"), which the openthread submodule of the
new SRCREV includes, so bump instead of carrying a backport.

Adapt the recipe to upstream changes made since the previous SRCREV:

 * ot-br-posix commit cf4877d68af8 ("[mdns] remove avahi publisher option
   and dependencies") deleted the avahi mDNS publisher; OTBR_MDNS=avahi
   is now a configure-time FATAL_ERROR. Switch to OTBR_MDNS=openthread,
   the new upstream default, and drop the avahi/avahi-daemon dependencies
   the same way upstream did in their own etc/yocto/otbr_git.bb.

 * The advertising and discovery proxies grew OT core implementations
   (OTBR_OT_SRP_ADV_PROXY, OTBR_OT_DISCOVERY_PROXY) which default to ON
   whenever OTBR_MDNS is set, and enabling both variants is now a
   FATAL_ERROR ("Only one Advertising Proxy can be enabled."). Drop the
   explicit OTBR_SRP_ADVERTISING_PROXY/OTBR_DNSSD_DISCOVERY_PROXY=ON so
   the OT core ones are used.

 * Drop 0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch.
   With OTBR_MDNS=openthread src/agent/CMakeLists.txt never sets
   EXEC_START_PRE, so the generated otbr-agent.service already has a bare
   ExecStart= and the patch has nothing left to do.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ce.in-remove-pre-exec-hook-for-mdns-.patch | 35 -------------------
 .../openthread/ot-br-posix_git.bb             | 11 +++---
 2 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
deleted file mode 100644
index 250de4bdd8..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ed60d4605b81c43b9ba9504a37835109c247c6f8 Mon Sep 17 00:00:00 2001
-From: Stefan Schmidt <stefan.schmidt@huawei.com>
-Date: Fri, 1 Apr 2022 21:46:03 +0200
-Subject: [PATCH] otbr-agent.service.in: remove pre exec hook for mdns service
-
-It uses the service command which is not available in all cases under
-Yocto/OE. The upstream project uses this mainly with Ubuntu and Raspian
-as testbeds.
-
-In our case we simply ensure that avahi-daemon is installed on the
-system inside the recipe.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
----
- src/agent/otbr-agent.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/agent/otbr-agent.service.in b/src/agent/otbr-agent.service.in
-index 8314121347..4c97869def 100644
---- a/src/agent/otbr-agent.service.in
-+++ b/src/agent/otbr-agent.service.in
-@@ -6,7 +6,7 @@ After=dbus.socket
-
- [Service]
- EnvironmentFile=-@CMAKE_INSTALL_FULL_SYSCONFDIR@/default/otbr-agent
--@EXEC_START_PRE@ExecStart=@CMAKE_INSTALL_FULL_SBINDIR@/otbr-agent $OTBR_AGENT_OPTS
-+ExecStart=@CMAKE_INSTALL_FULL_SBINDIR@/otbr-agent $OTBR_AGENT_OPTS
- KillMode=mixed
- Restart=on-failure
- RestartSec=5
---
-2.35.1
-
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index d1938e12a1..8c49a30327 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -9,12 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
                     file://third_party/cpp-httplib/repo/LICENSE;md5=1321bdf796c67e3a8ab8e352dd81474b \
                     file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
-DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue protobuf protobuf-native"
-SRCREV = "0700948634b85947e893a65e3d510ed870a5755b"
+DEPENDS = "autoconf-archive dbus readline jsoncpp boost libnetfilter-queue protobuf protobuf-native"
+SRCREV = "cb0bfde934ad7519610a63b75c067f8d7601fe21"
 PV = "0.3.0+git"

 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
-           file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://default-cxx-std.patch \
            file://0001-x509_crt-Zero-initialize-mbedtls_x509_time-at-declar.patch;patchdir=third_party/openthread/repo \
@@ -36,10 +35,9 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DCMAKE_LIBRARY_PATH=${libdir} \
                  -DOT_POSIX_PRODUCT_CONFIG=${sysconfdir}/openthread.conf.example \
                  -DOT_POSIX_FACTORY_CONFIG=${sysconfdir}/openthread.conf.example \
-                 -DOTBR_MDNS=avahi \
+                 -DOTBR_MDNS=openthread \
                  -DOTBR_BACKBONE_ROUTER=ON \
                  -DOTBR_BORDER_ROUTING=ON \
-                 -DOTBR_SRP_ADVERTISING_PROXY=ON \
                  -DOTBR_BORDER_AGENT=ON \
                  -DOT_SPINEL_RESET_CONNECTION=ON \
                  -DOT_TREL=ON \
@@ -50,7 +48,6 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOTBR_DUA_ROUTING=ON \
                  -DOT_DUA=ON \
                  -DOT_BORDER_ROUTING_NAT64=ON \
-                 -DOTBR_DNSSD_DISCOVERY_PROXY=ON \
                  -DOTBR_INFRA_IF_NAME=eth0 \
                  -DOTBR_NO_AUTO_ATTACH=1 \
                  -DOT_REFERENCE_DEVICE=ON \
@@ -59,7 +56,7 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
                  "

-RDEPENDS:${PN} = "iproute2 ipset avahi-daemon"
+RDEPENDS:${PN} = "iproute2 ipset"

 RCONFLICTS:${PN} = "ot-daemon"


