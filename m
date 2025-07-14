Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D562C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:10:02 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web10.76639.1752494995767471860
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Kn5lkqLG;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752494995; x=1784030995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=52GJ6Zj/dsXvYsLnAttmurfyBLieGmB4IxsfsSEcpSs=;
  b=Kn5lkqLG8RcoXIYsmHu+tn/U7UbK6dfp+hwK+Gkv2bFcdvWwAamQEIkf
   /tsYfVl7jNb+tqYKnNuwvhDcVU7eJmjflOP69RSalph6I1MUzlppFz9b8
   Yr7quI9GWGtU03NN/OOhNyqFtQchhvrIOhdn1m6xabt60/ggGgC34S58q
   k=;
X-CSE-ConnectionGUID: XETyB0ebSmG1NXhV/Q51Qg==
X-CSE-MsgGUID: 6nd4j1gYSxWmjwkXfm5fSg==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 14:09:53 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
 14 Jul 2025 14:09:52 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 14 Jul 2025 14:09:53 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.200) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 14:09:52 +0200
X-CSE-ConnectionGUID: lLqQo2HJTlqeyLD5eKJPpg==
X-CSE-MsgGUID: KCf2BTZAQnCWkcviL3YFEg==
X-CSE-ConnectionGUID: k+pVt+uXRdyn8saNlMy5Eg==
X-CSE-MsgGUID: CmT++7MWS/iYNxCvcfkfdw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH] sysdig: Allow to build with CMake 4+
Date: Mon, 14 Jul 2025 14:09:41 +0200
Message-ID: <20250714120941.179160-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16g.europe.bmw.corp (2a03:1e80:a15:58f::1:149) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 12:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118529

The latest release seems to have support to build with CMake 4+, but updating
requires major changes to the recipe and so far I haven't managed to get a build
passing. Thus, apply the 'minimum policy version' override instead and backport
one patch to unblock builds with CMake 4.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...Only-add-dependencies-when-we-bundle.patch | 35 +++++++++++++++++++
 .../recipes-extended/sysdig/sysdig_0.28.0.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch
new file mode 100644
index 0000000000..93593b6269
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch
@@ -0,0 +1,35 @@
+From ed35037e3ba575d9b0d1ef4cd5b6ab9111136922 Mon Sep 17 00:00:00 2001
+From: Moritz Haase <Moritz.Haase@bmw.de>
+Date: Mon, 14 Jul 2025 13:57:30 +0200
+Subject: [PATCH] update(cmake): Only add dependencies when we bundle
+
+Only add dependencies for valijson when we're using the bundled version.
+
+Fixes
+
+| CMake Error at falcosecurity-libs/userspace/libsinsp/CMakeLists.txt:184 (add_dependencies):
+|   The dependency target "valijson" of target "sinsp" does not exist.
+
+when building with CMake 4.
+
+Upstream-Status: Backport [7d850bad002b56ca5e85fffb1f69b4b1cfeddd91]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ userspace/libsinsp/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/userspace/libsinsp/CMakeLists.txt b/userspace/libsinsp/CMakeLists.txt
+index 9794a697c..a82f8c0c1 100644
+--- a/userspace/libsinsp/CMakeLists.txt
++++ b/userspace/libsinsp/CMakeLists.txt
+@@ -181,7 +181,9 @@ set(SINSP_LIBRARIES
+ 	"${JSONCPP_LIB}"
+ 	"${CARES_LIB}")
+ 
+-add_dependencies(sinsp valijson)
++if(USE_BUNDLED_VALIJSON)
++	add_dependencies(sinsp valijson)
++endif()
+ 
+ if(WITH_CHISEL AND USE_BUNDLED_LUAJIT)
+ 	add_dependencies(sinsp luajit)
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
index b60f9c643c..c988b0af59 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -24,9 +24,10 @@ RDEPENDS:${PN} = "bash"
 
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sysdig \
            git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs \
-           file://0001-Add-cstdint-for-uintXX_t-types.patch;patchdir=./falcosecurity-libs \
            file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
+           file://0001-Add-cstdint-for-uintXX_t-types.patch;patchdir=./falcosecurity-libs \
            file://0001-libsinsp-fix-build-with-gcc-15.patch;patchdir=./falcosecurity-libs \
+           file://0001-update-cmake-Only-add-dependencies-when-we-bundle.patch;patchdir=./falcosecurity-libs \
           "
 SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
 SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
@@ -35,6 +36,7 @@ SRCREV_FORMAT = "sysdig_falco"
 
 
 EXTRA_OECMAKE = "\
+                -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
                 -DBUILD_DRIVER=OFF \
                 -DMINIMAL_BUILD=ON \
                 -DUSE_BUNDLED_DEPS=OFF \

