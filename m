Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B6BC83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web10.75974.1752492420037243291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=fsQ/qlxf;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492420; x=1784028420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zJIXgGMTRdY5MZFRYXh9sebfSbwaeb/irBUXnN3O96o=;
  b=fsQ/qlxfd6sjZhct2o0HGuFIEWSSbY6HrqbC76D4+b3QweXp/Gslr8N3
   3bWkTWQUD7ICQLV5dzG/nOgF3kPg7boHrq+TdcHZt9GXU5SbrrXnvaVK2
   U0ZQwA/ubnrj+umEwh+ksyBBwR15opUgz9gAFdm3HnHQA2TIG685EM+c3
   c=;
X-CSE-ConnectionGUID: eSQumiq5Qp6sN64FPQnEAQ==
X-CSE-MsgGUID: KoSBzr1FRS6uyUfJCvUN4g==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:57 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw4.muc with
 ESMTP/TLS; 14 Jul 2025 13:26:57 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 14 Jul 2025 13:26:57 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:56 +0200
X-CSE-ConnectionGUID: Hv7bsHcVTbCSvR1mxZd8lw==
X-CSE-MsgGUID: Mer/7XbyQvyMFpjFuMgw1w==
X-CSE-ConnectionGUID: n1QZWdHiRxCBSWqO7kDRUA==
X-CSE-MsgGUID: WIoV8++KSrK5pz/bW7AwwA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 10/10] minifi-cpp: Backport patch to support builds with CMake 4+
Date: Mon, 14 Jul 2025 13:26:35 +0200
Message-ID: <20250714112642.121146-10-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714112642.121146-1-Moritz.Haase@bmw.de>
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118527

There hasn't been a new upstream release yet that ships the required changes.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...MP0065-OLD-removed-in-cmake-4.0-remo.patch | 42 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.99.1.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch b/meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch
new file mode 100644
index 0000000000..3e916a8081
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch
@@ -0,0 +1,42 @@
+From 905676309a407b9a50118b31370b73ec411a6f8b Mon Sep 17 00:00:00 2001
+From: Marton Szasz <szaszm@apache.org>
+Date: Mon, 31 Mar 2025 14:48:01 +0200
+Subject: [PATCH] MINIFICPP-2553 CMP0065=OLD removed in cmake 4.0, removed
+ override
+
+Signed-off-by: Marton Szasz <szaszm@apache.org>
+Signed-off-by: Gabor Gyimesi <gamezbird@gmail.com>
+
+This closes #1957
+
+Upstream-Status: Backport [26aea0d8280986713b441cda3fd3858c80d21f65]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ CMakeLists.txt             | 1 -
+ minifi_main/CMakeLists.txt | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 70c94c2f..6673e331 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,7 +19,6 @@
+ 
+ cmake_minimum_required(VERSION 3.24)
+ cmake_policy(SET CMP0096 NEW) # policy to preserve the leading zeros in PROJECT_VERSION_{MAJOR,MINOR,PATCH,TWEAK}
+-cmake_policy(SET CMP0065 OLD) # default export policy, required for self-dlopen
+ cmake_policy(SET CMP0135 NEW) # policy to set the timestamps of extracted contents to the time of extraction
+ 
+ project(nifi-minifi-cpp VERSION 0.99.1)
+diff --git a/minifi_main/CMakeLists.txt b/minifi_main/CMakeLists.txt
+index 62eb234f..1a2e9e0e 100644
+--- a/minifi_main/CMakeLists.txt
++++ b/minifi_main/CMakeLists.txt
+@@ -69,7 +69,6 @@ target_link_libraries(minifiexe spdlog libsodium gsl-lite argparse ${LIBMINIFI})
+ 
+ set_target_properties(minifiexe PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
+ set_target_properties(minifiexe PROPERTIES OUTPUT_NAME minifi)
+-set_target_properties(minifiexe PROPERTIES ENABLE_EXPORTS True)
+ if (WIN32)
+     target_compile_definitions(minifiexe PUBLIC SERVICE_NAME="Apache NiFi MINiFi")
+ endif()
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index 04f2488a61..16dc46275a 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0005-generateVersion.sh-set-correct-buildrev.patch \
            file://0006-CMakeLists.txt-do-not-use-ccache.patch \
            file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
+           file://0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "

