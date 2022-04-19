Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F182BC4321E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.1587.1650409828448232018
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 16:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BT0wpFgK;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id bo5so222038pfb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 16:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IITIFatQ4+f6VEYBCftxVMY9uF88Hq52Jn6OY38oDhE=;
        b=BT0wpFgKWGj4+jXAQGnnBv7BelcJmxD0GIoV/D7YMATdPW/q2N404DAtoDNssL97P5
         qNg0jOAlsEyHvqaL3gYymZhw2BvuiPo7CwbYZjCoaKa3GtumwnXSlCcdbsuc7Jawa26I
         Ujlp+GB3DBsZCyfpNeTWKPZxTBTb2oE/P4OT8BuzGTSmianOHd5gBHs7o4U/vcXh/oCU
         rOv3VK3Bgw9CktNJ8owLs4cumMQt7hY7bgmRf2ozSTENeP+IDNz68tYZI7essjbgLbVW
         0gwf3wDTN74VgipImBOdu4whw6bsSb3GbfCBVtyT/0rnU01YgSKPSihFG1Z9aA+mxFFd
         PVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IITIFatQ4+f6VEYBCftxVMY9uF88Hq52Jn6OY38oDhE=;
        b=qeAGJtaFOqu7Z/rMsERtZOHAwq0s09IDIpO/wZOqnUffo+9Nf6IssUYIHnrKK+crwg
         rVOUtSJo9tF7vYvLgG0P+nTTksyEX3KyMDWvdhvB8UwI/NqjR8Qy3DfxqALwXoRk2PzU
         8HRCw3YkjKnhEDE2u/cA2EYDzxTn/r+1ZjV3tj8WsPGSbKEd9RT3xztc2clDFi6qoANX
         9GrL6A87mbVq48mfoJOyotJnUM0mwf+ddNv4Hzw5a7E3RcqGdokcyp7kfChuOlH9aZ0J
         CvvRsHX567xnTZ8vLmHiQ0phJkbyXSn7M5Cq6ooEMpk4r7yfXpNvigjuZmUrzq7yy+yU
         NQLQ==
X-Gm-Message-State: AOAM531ikYs2ev+vxcflBCv9swrLyMZmBZcBJWoTocndrFWWbNiiyvHa
	uqgB6TRCRLraI5cOPMncSYoWDK466q/S3A==
X-Google-Smtp-Source: 
 ABdhPJxWnhhVeSBeRyNnUv1UydvUF+fxcmGp1xpKn8XnI2pepGqVH0KVekYig7iWUKt3WqlbRLsEJA==
X-Received: by 2002:a65:6181:0:b0:39d:871:2199 with SMTP id
 c1-20020a656181000000b0039d08712199mr16521758pgv.521.1650409827518;
        Tue, 19 Apr 2022 16:10:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 k13-20020a056a00134d00b0050a5867dd73sm13649602pfu.157.2022.04.19.16.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 16:10:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] dlt-daemon: Fix build on rv32/rv64
Date: Tue, 19 Apr 2022 16:10:23 -0700
Message-Id: <20220419231024.283373-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96705

This is seen with gcc particularly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ake-Link-with-libatomic-on-rv32-rv64.patch | 45 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.8.bb           |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
new file mode 100644
index 0000000000..7b40b7a67e
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
@@ -0,0 +1,45 @@
+From dd2d42a7f877d292f86e421dd9651f4b7c2abf18 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Apr 2022 14:57:58 -0700
+Subject: [PATCH] cmake: Link with libatomic on rv32/rv64
+
+Use of <atomic> needs to link in libatomic on riscv
+Fixes
+
+undefined reference to `__atomic_exchange_1'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/CMakeLists.txt b/src/lib/CMakeLists.txt
+index 3293376..65018be 100644
+--- a/src/lib/CMakeLists.txt
++++ b/src/lib/CMakeLists.txt
+@@ -37,6 +37,12 @@ else()
+     set(SOCKET_LIBRARY socket)
+ endif()
+ 
++if(CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv32")
++    set(ATOMIC_LIBRARY atomic)
++else()
++    set(ATOMIC_LIBRARY "")
++endif()
++
+ if(HAVE_FUNC_PTHREAD_SETNAME_NP)
+     add_definitions(-DDLT_USE_PTHREAD_SETNAME_NP)
+     message(STATUS "Using pthread_setname_np API to set thread name")
+@@ -44,7 +50,7 @@ else()
+     message(STATUS "pthread_setname_np API not available on this platform")
+ endif()
+ 
+-target_link_libraries(dlt ${RT_LIBRARY} ${SOCKET_LIBRARY} Threads::Threads)
++target_link_libraries(dlt ${RT_LIBRARY} ${SOCKET_LIBRARY} ${ATOMIC_LIBRARY} Threads::Threads)
+ 
+ target_include_directories(dlt
+     PUBLIC
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index 014c773584..2cea50dfb0 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -17,6 +17,7 @@ DEPENDS = "zlib gzip-native json-c"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
+           file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
 SRCREV = "0138c00811c86eab4ff6bff3c6528163885ade19"
 
@@ -24,6 +25,8 @@ PV .= "+2.18.9git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+LDFLAGS:append:riscv64 = " -latomic"
+
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-console ', '', d)} \
  udp-connection dlt-system dlt-filetransfer "
 # dlt-dbus
-- 
2.36.0


