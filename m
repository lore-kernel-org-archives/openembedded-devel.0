Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC537FEB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 02:48:20 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id u63so648659pjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EpxNRPuSc4LrM7cZxedskdMT6VpgwrY3Q8EeD4RnG6M=;
	b=C4QJyVlCD2J0fTTU5XJuUE577LSDFoNh3ZrEsbIkfOuJrMciFLqjegj5Lc3PQQ/+cW
	bpbtZJnFXovXp9tvF6MoH7K3MKZVW+FBE53Qfio7sZGkEw0Y/ZcQvWEuOTErsV0UA2G8
	o81t3ouA0piuCfbkqpwYZQkUOH5IadghU7EThx7hmhX4jXnkgoJZB6Vv0VrE5a5P9+y6
	1MU/7IfWSPhHQaDznqRrJ5frFJcC9k+59PKVRaAd/y3OmUkNQb98AEOXKCin4iuMMlBP
	IQ2sKHWV/12AEDYxwUfT0qCqVGvHJs7hlocGe6R9DALrv77rEoTa32MRzKf2dYCwtrW9
	m6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EpxNRPuSc4LrM7cZxedskdMT6VpgwrY3Q8EeD4RnG6M=;
	b=jS+8M/7suGBPakOizmtqhAv3Htww9v8ODa8iQ/fCg27aJr+4zEQqSvbSAkOA5hFFJK
	webrbOLZrT8Iqvo7vM0qa2LED3UdIrgNrKQ3dDI6jLrKagp+SlHm533PJlVrRrS4d6RX
	RdDHBE5WkFdPQZq4jf4GM+Y+wUwAs0dHcoX4vS+gXkG2qZMN1nb4+ekBvikQh64GuyTM
	yU57p0yJC85cYnQQY8Vm4fN/QCbPX0455nOg7dRavSUPu4FgAOaLqZaoKzoHukrkDwaU
	6+DqgMb3rSClRwS8+q6KBNZz3KikfHB/xFBrPpn+nku7FRbw2c9VgjSUqRKPrPJl6/tO
	tHag==
X-Gm-Message-State: APjAAAW812QRVN2e/wggUJR6ZdengV3r9O49cVltZNOtPCHJdpM6lLyT
	vwDJw4+FUFfoRj/mF9WjbD+dFpBiLKw=
X-Google-Smtp-Source: APXvYqwrkl2iMBUu8cGWbFWGRWL+OP5QObXPEKTkCfPuW2KFiBVe9MvTpQXzrRYoaXPq7kczUTUCgQ==
X-Received: by 2002:a17:902:bf0b:: with SMTP id
	bi11mr4807plb.282.1576637300914; 
	Tue, 17 Dec 2019 18:48:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id o7sm506370pfg.138.2019.12.17.18.48.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 18:48:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2019 18:48:08 -0800
Message-Id: <20191218024810.2874990-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-multimedia][PATCH 1/3] tinyalsa: fix installation libdir path to match multilibs
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
X-List-Received-Date: Wed, 18 Dec 2019 02:48:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes
ERROR: tinyalsa-1.1.1+gitAUTOINC+8449529c7e-r0 do_package: QA Issue: tinyalsa: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libtinyalsa.a
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/tinyalsa/tinyalsa.bb   |  4 +-
 ...L_-path-instead-of-hardcoding-bin-li.patch | 46 +++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
index 8b86f82430..062096892e 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
@@ -7,7 +7,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
 
 SRCREV = "8449529c7e50f432091539ba7b438e79b04059b5"
-SRC_URI = "git://github.com/tinyalsa/tinyalsa"
+SRC_URI = "git://github.com/tinyalsa/tinyalsa \
+           file://0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch \
+          "
 PV = "1.1.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
new file mode 100644
index 0000000000..6f9c39996b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
@@ -0,0 +1,46 @@
+From fe4f3c2a37a81201f463ff962364f014f50c9896 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Dec 2019 22:58:41 -0800
+Subject: [PATCH] Use CMAKE_INSTALL_<path> instead of hardcoding bin/lib/
+ install paths
+
+Helps fix build/packaging issues on machines where default libdir is not
+lib but say lib64
+
+Upstream-Status: Submitted [https://github.com/tinyalsa/tinyalsa/pull/143]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb31c58..1cc4a85 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -41,12 +41,20 @@ add_util("tinymix" "utils/tinymix.c")
+ install(FILES ${HDRS}
+     DESTINATION "include/tinyalsa")
+ 
++if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
++    set(CMAKE_INSTALL_LIBDIR lib)
++endif()
++
++if(NOT DEFINED CMAKE_INSTALL_BINDIR)
++	set(CMAKE_INSTALL_BINDIR bin)
++endif()
++
+ install(TARGETS "tinyalsa"
+                 "tinyplay"
+                 "tinycap"
+                 "tinymix"
+                 "tinypcminfo"
+-    RUNTIME DESTINATION "bin"
+-    ARCHIVE DESTINATION "lib"
+-    LIBRARY DESTINATION "lib")
++    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+-- 
+2.24.1
+
-- 
2.24.1


