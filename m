Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 25BD86D561
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:07:02 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k3so5738983pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fvIh6d7gGMRC2ahwJ485WlF8T+HhvDfn5I3bkGWViPo=;
	b=SL1jG5INUTLQ+1oTHiAnCFteM8mwibKqJO6Se4j/1FABqh6Plyiy5w00bCaz7ixOi6
	BB8vy+J1UVzUGTgIWGYfXbqRzNImLr8PtcDe3yp8a8X90ofP/wPMEYvLH9zTg9XksiEK
	bONXt3LyX1xPixLzSwdvmfG1wg1n0GeNUeLoS/lm3nluekQ6IvCKDbofeGcG9YZhxSQ2
	u2p5XSh5lnH7ZI0pV5cBpr37RoELj/D6QmmF7PaSGW1qIitAfCTTqMg0q22qNgB6I8mV
	SMKCmDqcwc+xnZtA87IvdpwfXT84ZxweUw719LJvzvOuJQrVr6NpBPyYgsntFFL3805h
	oJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fvIh6d7gGMRC2ahwJ485WlF8T+HhvDfn5I3bkGWViPo=;
	b=JBHoOx52wg+e7mw7iSE12A7dzd/2qm71Pq6mlF+N9Juy53GbGHBrgo6D4HhQ2fQ4es
	pwBa5SjHbPV8HrYUdNsNIu1InxQ8ry6b8GOgvUj+ujhDs7tTACQUFDMGzy+ZvfO2oMnA
	Hlf5kOjlYc3qEoaUTVh577M1mvB3AjOm6JOwIQFt//Cqv1vo4Wl+VicDdM/J80mBN30S
	eyibi6GK8d/qP3lg6wwn4d4lAsJVhAIq55iqtXHKZTYVi9PbPhzIu4V9fCqXbqeWGMWH
	PhFw3H8DteY4owZqN5ihhHYJuA6JVGgGz6L40zKJYbC+rHO0LVI9uGjtYYWHUDtGVX2P
	HREQ==
X-Gm-Message-State: APjAAAVDGxAWKUnDOuMQJImmSLtrv/u7q19a4QCd1WQhLD7iyqJRJfGD
	Bimdfm61crAe5MukOUowNAYHEjbs0Cg=
X-Google-Smtp-Source: APXvYqx8yrYfc50Uij4xy5WCbAG9X3hHa7Ovf8VEKmsm6ZE6pjMKEFlOt6reMofyj2AzNImbDvC4YQ==
X-Received: by 2002:a63:30c:: with SMTP id 12mr17722798pgd.276.1576886822727; 
	Fri, 20 Dec 2019 16:07:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.07.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:07:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:32 -0800
Message-Id: <20191221000635.1573390-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 20/23] liblightmodbus: Fix packaging errors when using multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Dec 2019 00:07:02 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: liblightmodbus-2.0.2-r0 do_package: QA Issue: liblightmodbus: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/liblightmodbus.a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tallDirs-instead-of-hardcoding-lib-p.patch | 37 +++++++++++++++++++
 .../liblightmodbus/liblightmodbus_2.0.2.bb    |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch

diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch
new file mode 100644
index 0000000000..321b41289d
--- /dev/null
+++ b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch
@@ -0,0 +1,37 @@
+From 066c49158a71ea77598c9e1ae16bba63d6ac6bb5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 23:41:35 -0800
+Subject: [PATCH] cmake: Use GNUInstallDirs instead of hardcoding lib path
+
+Upstream-Status: Submitted [https://github.com/Jacajack/liblightmodbus/pull/12]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ce6cc88..bee83aa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -242,14 +242,14 @@ if ( DEFINED AVR )
+ 	)
+ endif( )
+ 
+-
++include(GNUInstallDirs)
+ #Installation
+ install( 
+ 	TARGETS lightmodbus
+-	ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/"
++	ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/"
+ )
+ 
+ #Install headers
+ install(
+ 	DIRECTORY "${CMAKE_SOURCE_DIR}/include/" DESTINATION "${CMAKE_INSTALL_PREFIX}/include/" FILES_MATCHING PATTERN "*.h"
+-)
+\ No newline at end of file
++)
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
index 1e35f08c0f..7fc5997983 100644
--- a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
+++ b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 inherit cmake pkgconfig
 
-SRC_URI = "git://github.com/Jacajack/liblightmodbus.git;protocol=https"
+SRC_URI = "git://github.com/Jacajack/liblightmodbus.git;protocol=https \
+           file://0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch \
+          "
 SRCREV = "59d2b405f95701e5b04326589786dbb43ce49e81"
 
 S = "${WORKDIR}/git"
-- 
2.24.1


