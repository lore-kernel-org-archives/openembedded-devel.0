Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83E0C36008
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 05:58:51 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4586.1742623123795924635
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 22:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACbu6Lic;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso4739713a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 22:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742623123; x=1743227923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYDTaTNVxqbs9kr6VUbhQLWoJIh3TWrF8vHv3AiUBIE=;
        b=ACbu6LicpVpK69z+3MuLE45YtH9MSvmtheAnx0kzR1YLN+QHXLRIEUAx1S24TF+F93
         vfsmM3JB2Qrt6p1P9xrIOq2FuUfvG5ZOl/PfKQN+L9YRX1itySVpagRRVUS/W8r0jB4Q
         HiKyXUIEsKuVMw7U05fSl5KafjOt41qBU/vzV3wTQ1x7jDcppQgyNR2dRVEVvi5fpCUb
         nBz3WWIr0fLG7kZa/oMqbyj7ubDsxOkk9RfpwB4MAZHzsk7jYT5ORf0Xhwob4w5LFZ1h
         q4cEX8uzzNmlhlNpfRI4Yt4JsuR/eO3MMn4PwhXTFcpnKcV0ljue2wihinDjDKT7yAvc
         z6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742623123; x=1743227923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYDTaTNVxqbs9kr6VUbhQLWoJIh3TWrF8vHv3AiUBIE=;
        b=oQzrKwBckKbgPiE6zcEOsCm40xkvG8hY3Ppt6GK6ic8GAwQD7bOuO8TgUfypu+rqKz
         9ZC+o55S58dzPATCuCepfgAYnf5NAIrLUn1fauEPeAMy7g0X2+DOBOlX3K5prSCR23KB
         LN+LRM+3HGMmx/Ld2/uldlY5WniouakWYluC2jTZhtnBPVLMX4KK09G2cNsK2LnAgwdG
         i2hY277+4qUfOLH99srRbjEUPTwSOWBTEaxuuW64zlzFiwT/GNQSPJcKKVFij+YcJM07
         Zq9sw3IctdnKwurX2UXpp7TQg2W5q1MgvalxaWwiXFtMSny14Fkaah4pTZZy7F4GvUod
         zMqA==
X-Gm-Message-State: AOJu0YxtLeiJVBl05CiYmE8/sRn7q71i9jOLr/k7jh4UI7+SDc5MlAMI
	wqlbDyADCKCh9lTCxoLj15e1YgqRmP3q8sevUKASoTceS/+UWLnD0Eicf/76
X-Gm-Gg: ASbGncvB1e5xH++0GQHiOFNCohs962BOMVuIxlMNl5yv4K0wfkXotbv82DRR9VB7WH7
	Wv8X3x2teYkSXl6fkPh/CPwvEJ3aXGRiEgdiHl8odLlxUVJDyUaTeWiqX1y30MIS3R1Ho3CgaYW
	Rfal8YHAojB5iOx3SUldUPc7mGfuKMnZ5BEFAUnBH62tLFMt87Ngup3aD8R7ECapekca2PsBixN
	eg8RgNEhD8qNc65Bpiz+qngc5BDB/amHWj9VVfwQq8kA8UreLyqBSc5ouIKX0WobrWZANDjMEH8
	+LNiIqvv2wigbR3j+vCaYwVLo8ahqleQvL6W
X-Google-Smtp-Source: AGHT+IH6VzUgYIiM4hw8DbAtwkMs3hHLzm4dU4T6TSB5VmUQbdllMAu2eSRyvIv6zDtjghxXDlV8Cw==
X-Received: by 2002:a05:6a20:9151:b0:1f3:47d6:aa05 with SMTP id adf61e73a8af0-1fe42c6bce5mr11746819637.0.1742623122546;
        Fri, 21 Mar 2025 22:58:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a282be07sm2885136a12.34.2025.03.21.22.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 22:58:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pybind11-json: Specify -DPYBIND11_USE_CROSSCOMPILING=ON to support pybind11 13.x
Date: Fri, 21 Mar 2025 22:58:38 -0700
Message-ID: <20250322055838.1164459-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322055838.1164459-1-raj.khem@gmail.com>
References: <20250322055838.1164459-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 05:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116197

Add support for pkgconfig
Use python-native during build to avoid host variability

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d4df929bc9d0882298fc1f85ecf589456ff6.patch | 59 +++++++++++++++++++
 .../python/python3-pybind11-json_0.2.15.bb    |  6 +-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch b/meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch
new file mode 100644
index 0000000000..c216ce66cb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch
@@ -0,0 +1,59 @@
+From d72ad4df929bc9d0882298fc1f85ecf589456ff6 Mon Sep 17 00:00:00 2001
+From: Daniel Lundberg Pedersen <dlp@qtec.com>
+Date: Thu, 23 Jan 2025 11:48:16 +0100
+Subject: [PATCH] CMakeLists.txt: Add support for pkg-config
+
+Create and install pkg-config (.pc) file for dependency detection.
+Upstream-Status: Submitted [https://github.com/pybind/pybind11_json/pull/75]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt      | 24 ++++++++++++++++++++++++
+ pybind11_json.pc.in |  7 +++++++
+ 2 files changed, 31 insertions(+)
+ create mode 100644 pybind11_json.pc.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c0ef675..a92240a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -133,3 +133,27 @@ install(FILES ${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}Config.cmake
+ install(EXPORT ${PROJECT_NAME}-targets
+         FILE ${PROJECT_NAME}Targets.cmake
+         DESTINATION ${PYBIND11_JSON_CMAKECONFIG_INSTALL_DIR})
++
++# pkg-config support
++if(NOT prefix_for_pc_file)
++if(IS_ABSOLUTE "${CMAKE_INSTALL_DATAROOTDIR}")
++  set(prefix_for_pc_file "${CMAKE_INSTALL_PREFIX}")
++else()
++  set(pc_datarootdir "${CMAKE_INSTALL_DATAROOTDIR}")
++  if(CMAKE_VERSION VERSION_LESS 3.20)
++    set(prefix_for_pc_file "\${pcfiledir}/..")
++    while(pc_datarootdir)
++      get_filename_component(pc_datarootdir "${pc_datarootdir}" DIRECTORY)
++      string(APPEND prefix_for_pc_file "/..")
++    endwhile()
++  else()
++    cmake_path(RELATIVE_PATH CMAKE_INSTALL_PREFIX BASE_DIRECTORY CMAKE_INSTALL_DATAROOTDIR
++               OUTPUT_VARIABLE prefix_for_pc_file)
++  endif()
++endif()
++endif()
++set(includedir_for_pc_file "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
++configure_file("${CMAKE_CURRENT_SOURCE_DIR}/pybind11_json.pc.in"
++             "${CMAKE_CURRENT_BINARY_DIR}/pybind11_json.pc" @ONLY)
++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/pybind11_json.pc"
++      DESTINATION "${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig/")
+diff --git a/pybind11_json.pc.in b/pybind11_json.pc.in
+new file mode 100644
+index 0000000..da5bfde
+--- /dev/null
++++ b/pybind11_json.pc.in
+@@ -0,0 +1,7 @@
++prefix=@prefix_for_pc_file@
++includedir=@includedir_for_pc_file@
++
++Name: @PROJECT_NAME@
++Description: Using nlohmann::json with pybind11
++Version: @PROJECT_VERSION@
++Cflags: -I${includedir}
diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
index 3667ba872c..bb2ccae794 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
@@ -3,10 +3,12 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
 
 SRCREV = "32043f433ed987b2c2ce99d689ec337bcbd4ba95"
-SRC_URI = "git://github.com/pybind/pybind11_json;branch=master;protocol=https"
+SRC_URI = "git://github.com/pybind/pybind11_json;branch=master;protocol=https \
+           file://d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch"
 
 DEPENDS += "nlohmann-json python3-pybind11"
 
+EXTRA_OECMAKE += "-DPYBIND11_USE_CROSSCOMPILING=ON"
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake python3native python3targetconfig

