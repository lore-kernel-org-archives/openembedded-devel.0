Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 53DD760291
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:07:04 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id az3so4769623plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VaUOH27HEY9bE668oi8LtBJsOdJTbcvTFFN5lrmilYU=;
	b=TxqgKHV+Dheh3k6DMfmwoORDGd1UttZT0g1K9MhGQXUIpfeJcpSws5ptVVdNf/2xg6
	eTC5pQHC7Zo41qXVPTZg5snxJS17//8Er1B7vRWKVfOhJjUFYsK3OrmOHyOM1RI/l0/R
	59V7dCgS4RAESN0BMODBWxt8SR9OaLgWf3BMIzgxwcZ7jKqAhQWr5hg+beDbW+ZTBGfF
	0Q4Q+qK634PsH0BluHwwrEtH7WPrS1+2N+LXtPfOx5lnd53u6bWBiIeYgL77Zym+cAGD
	OtP+wAccWwL7x5PPmlDZAkMQMTBiPqUm/n20pP4dhcxQ1pmoRZ2CBL12U7X9aWA9/jhk
	supw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VaUOH27HEY9bE668oi8LtBJsOdJTbcvTFFN5lrmilYU=;
	b=ZOJxzRw3MAbtdLu6w1tsXf1hNTcuI2/8+C/Vtp/AJp1snPF/5cpviB1aksAPgyt0By
	eQUNzvsMOE1C8EtqDiU332BDhbhE2lG6UO0h5uWckFsGpsOUXM9W/OhPj/pD2e88h6Oe
	cgcuYqq7VXuS5YkZm1ySh6oocbh7d3wjhqkoi1ixjqQq9aZ4C3wAHmLSAf/bBUczDLih
	ev+keBaEediySjHyyYOSZUQuJnBVxlBZeYRGfBtrh5vckEJY+d1Vto4mrWrKK4l/lJhg
	B0vv3GYcN7U13o2G6CK2MI9YeUipoJ8wZQ9Fgc44HhbOObYzDiIedtd3cbIbA9NKHMnL
	jgtA==
X-Gm-Message-State: APjAAAXJvO7yDDDIBG+VypFReJgilul5LI6btdlvqmILtiRp3kb2iVkM
	0+xCfnwszWtuPO2y79nxHK4J9JtDQdw=
X-Google-Smtp-Source: APXvYqyUiBKJ4YIv+AvAuFZCplZWIK4swRyDcapeWT+3h5QWBqu2UJ3pn5asXAxP6YIb88aJMGShHg==
X-Received: by 2002:a17:90a:d804:: with SMTP id
	a4mr13932644pjv.11.1576886824855; 
	Fri, 20 Dec 2019 16:07:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.07.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:07:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:35 -0800
Message-Id: <20191221000635.1573390-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 23/23] spirv-tools: Fix multilib builds
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
X-List-Received-Date: Sat, 21 Dec 2019 00:07:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++++++++++++++
 .../recipes-graphics/spir/spirv-tools_git.bb  |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch

diff --git a/meta-oe/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch b/meta-oe/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
new file mode 100644
index 0000000000..5d37da8fe0
--- /dev/null
+++ b/meta-oe/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
@@ -0,0 +1,35 @@
+From caf59c46ea5dc49e4dbf756c642b03e52c1b5468 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Dec 2019 07:02:24 -0800
+Subject: [PATCH] Respect CMAKE_INSTALL_LIBDIR in installed CMake files
+
+Upstream-Status: Submitted [https://github.com/google/effcee/pull/36]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt        | 1 +
+ effcee/CMakeLists.txt | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+--- a/external/effcee/CMakeLists.txt
++++ b/external/effcee/CMakeLists.txt
+@@ -27,6 +27,7 @@ endif()
+ 
+ include(cmake/setup_build.cmake)
+ include(cmake/utils.cmake)
++include(GNUInstallDirs)
+ 
+ add_subdirectory(third_party)
+ add_subdirectory(effcee)
+--- a/external/effcee/effcee/CMakeLists.txt
++++ b/external/effcee/effcee/CMakeLists.txt
+@@ -14,8 +14,8 @@ install(
+   DESTINATION
+     include/effcee)
+ install(TARGETS effcee
+-  LIBRARY DESTINATION lib
+-  ARCHIVE DESTINATION lib)
++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+ if(EFFCEE_BUILD_TESTING)
+   add_executable(effcee-test
diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
index aae11dffcd..49a91b0053 100644
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -9,11 +9,12 @@ SECTION = "graphics"
 S = "${WORKDIR}/git"
 DEST_DIR = "${S}/external" 
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
-	file://0001-tools-lesspipe-Allow-generic-shell.patch \
 	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
 	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
 	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
 	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
+	file://0001-tools-lesspipe-Allow-generic-shell.patch \
+        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
 "
 SRCREV_spirv-tools = "167f1270a9ee641b17c016a545741e4aadfabe86"
 SRCREV_spirv-headers = "4618b86e9e4b027a22040732dfee35e399cd2c47"
-- 
2.24.1


