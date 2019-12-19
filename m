Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9D15B7FD87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:44 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id b137so3290897pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oBVRsaGhpXfYxxRbBRUTkS4xJZe3Dp6maLRxDev3II4=;
	b=PkDHrV6249hZhgPe9QDjdRNbsAeiVRg7C8mr7i/lPDaUISqVOdBCFlP5R+aHeJ1pJh
	87u42iH1Hxl9xg+EQ0jnOmIxpKVzpyvJmuDvSzhdwEb0PfyYo4a183AinkiJ6Fzn7XIq
	s8Sj+7NMdhNcTrz9vT4NBZX6grxvCLYa2mPIFdr7uYTQQ36JcWtNuxzM0ARDhnjRuIDW
	wm6VqkacblALauqQqVj160a2hrdjTRoWQ1o/4dj9dlDi28abamN5PlEgedRZG9/IUHw1
	vhEM54wJq1xjov9A+qvfDV+2yva+VPmzCHxlJraOos+S9MH3gqSeubZntEfdnPfEN2bN
	VyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oBVRsaGhpXfYxxRbBRUTkS4xJZe3Dp6maLRxDev3II4=;
	b=qadg+0Leazh98rPSsxsIiMX92xAtzbKQ7ufBmlKRLvRbHlg3QyFoo5QdJGy5KNcFGx
	PqD7oW64rSBa4HEMUsy3GiTTPzEJ8lCEob/tE51s5bplljzZxnTT9KlW3cFdwu4Etk9j
	Rg0G8SqBA5IJfz/I5bqEBFSLH6CsUuNAMpPyy/hqM2YQdPMzg/O8aj2aod9wZCEBKZVm
	2x9X3cn0JQJPpiU5d+fjxzL9KKcQTWp9hJBlaa6oosCRBdo3Mxuh+Gm8NdeXKJe/BP2k
	lFDSEulscTMMG+hipQJZCPqGwV5eCJopSGh6K+KREE32Oo7nqKytYvowttAaEsd/BLqq
	v/mA==
X-Gm-Message-State: APjAAAVZSZix4PaJewvecdBXbXja9bAp943vm9qJinvuC6uBfSAKhfl8
	0Ee1GkNSTTwjT2ChYg1Shdp+eTTo9bM=
X-Google-Smtp-Source: APXvYqysIhuvZJBrJkTj3Q0cYPZ/5K3sZuhXOA13LvQiiSkpH0DvAaFhPKhroFVTrrlWD50HAvpWEw==
X-Received: by 2002:a65:4206:: with SMTP id c6mr9685963pgq.46.1576769145225;
	Thu, 19 Dec 2019 07:25:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:29 -0800
Message-Id: <20191219152529.725879-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219152529.725879-1-raj.khem@gmail.com>
References: <20191219152529.725879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 8/8] libcec: Fix multilib build
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
X-List-Received-Date: Thu, 19 Dec 2019 15:25:44 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: libcec-4.0.4-r0 do_package: QA Issue: libcec: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.7/site-packages/_cec.so
  /usr/lib/python3.7/site-packages/cec.py

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pport.cmake-Do-not-hardcode-lib-path.patch | 42 +++++++++++++++++++
 meta-oe/recipes-extended/libcec/libcec_git.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libcec/libcec/0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch

diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch b/meta-oe/recipes-extended/libcec/libcec/0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch
new file mode 100644
index 0000000000..3ecbfce250
--- /dev/null
+++ b/meta-oe/recipes-extended/libcec/libcec/0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch
@@ -0,0 +1,42 @@
+From 95d4df3b713925e2c4894a2e4d50b06df861d9ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2019 23:37:40 -0800
+Subject: [PATCH] CheckPlatformSupport.cmake: Do not hardcode lib path
+
+Using CMAKE_INSTALL_LIBDIR ensures that we can build for multilib env
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libcec/cmake/CheckPlatformSupport.cmake | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/libcec/cmake/CheckPlatformSupport.cmake b/src/libcec/cmake/CheckPlatformSupport.cmake
+index 2d7102f..55e78f8 100644
+--- a/src/libcec/cmake/CheckPlatformSupport.cmake
++++ b/src/libcec/cmake/CheckPlatformSupport.cmake
+@@ -224,16 +224,16 @@ else()
+ 
+       if (${PYTHON_MAJOR_VERSION} EQUAL 2)
+         install(TARGETS     ${SWIG_MODULE_cec_REAL_NAME}
+-                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DIR}/${PYTHON_LIB_INSTALL_PATH}/cec)
++                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION}/${PYTHON_PKG_DIR}/${PYTHON_LIB_INSTALL_PATH}/cec)
+         install(FILES       ${CMAKE_BINARY_DIR}/src/libcec/cec.py
+-                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DIR})
++                DESTINATION l${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION}/${PYTHON_PKG_DIR})
+         install(FILES ${CMAKE_SOURCE_DIR}/src/libcec/cmake/__init__.py
+-                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DIR}/cec)
++                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION}/${PYTHON_PKG_DIR}/cec)
+       else()
+         install(TARGETS     ${SWIG_MODULE_cec_REAL_NAME}
+-                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DIR}/${PYTHON_LIB_INSTALL_PATH})
++                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION}/${PYTHON_PKG_DIR}/${PYTHON_LIB_INSTALL_PATH})
+         install(FILES       ${CMAKE_BINARY_DIR}/src/libcec/cec.py
+-                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DIR})
++                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION}/${PYTHON_PKG_DIR})
+       endif()
+     endif()
+   endif()
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index eaf6b9b437..8d5a82455b 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -13,7 +13,8 @@ PV = "4.0.4"
 
 SRCREV = "3bbd4321618503d14008387a72fabb6743878831"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git \
-"
+           file://0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.24.1


