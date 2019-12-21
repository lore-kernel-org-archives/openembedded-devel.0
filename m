Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 39B8660291
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:54 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q10so6085118pfs.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WyndIC6jNPS/ejACvDc+WbJoSO81LH2FnlxhLSHMw5Y=;
	b=CvhorsGiJWwKSLObYsa5Ph3eOaxN9cwGKlcz/8NStF69HvChw2SIQV9gBpwDhNlFOz
	3MjS07WnbVcKnq/yWJI5QwMHzmCwLydOSwtbQFgk3hmiGyh+1j8K8iZP5+QxgmA6/UG+
	FWf3ZMXwq4iwaDSMCv3dyYWo9nVLkmb594KqTpSWwf2bJVtZ8vH+aXyYs+83r+XPMbph
	hP9baiNcIrkvyUUzyV+ePZIfh2CgQMDPqrQZsITF5UyIdDPq1Ajj6HDMof/T/aTEwXlu
	mfANY7dtSfBRxM+PzuzX/7lNat7o5FgX4EoJgqsucnya3vssUQrFkwJsceFb7bcuerPq
	6t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WyndIC6jNPS/ejACvDc+WbJoSO81LH2FnlxhLSHMw5Y=;
	b=uH6cmukcPVwstnsrWpmH7MaI+SuVOZXyRXrMpZKkLRR/De/x0+VgKhhxGfgXkdBqMg
	oDTNNHSpTq3SxdhMkE+WYN25Cwq4gsw+GjgIJPJ469CU72Ns8GMTh6ixl62DKUZMqaET
	bSaiYHqekjfoRiAo+VE0JhafUshjRZUqysppCpAb6/aMf9eAiAzm4lo/c4EO7i29CIQL
	Gb8rGLeTSNdjh1Ko3bJy7sxraf6eE1PXK654D449swqe9FO67f7INOfnADjB119p0W71
	6Ab7TKReqJlnj4li2aaRCEceFWB1Sra5yWwYgX0ruzOVmTWK28hdGBeE8ShIrsHEYkiD
	miTg==
X-Gm-Message-State: APjAAAV5c/3mzCpDpfe6iE1gk6dmCReJWYf8jnDvn/m9K7bKGgKvK1ln
	G1sPN5tWMimB3goXcmY+Q4w3YeKWZqs=
X-Google-Smtp-Source: APXvYqzOHrnLmAEeuh3t6jgCKinU3rNVRgiyZjgNCCkjIyKRQ+CIbltiARUEp2huzlM9V8vw07hthQ==
X-Received: by 2002:a65:640e:: with SMTP id a14mr16360740pgv.402.1576886814905;
	Fri, 20 Dec 2019 16:06:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:23 -0800
Message-Id: <20191221000635.1573390-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 11/23] websocketapp: Fix multilib build
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:54 -0000
Content-Transfer-Encoding: 8bit

Fixes

ERROR: websocketpp-0.8.1-r0 do_package: QA Issue: websocketpp: Files/directories were installed but not shipped in any package:
/usr/lib
/usr/lib/cmake
/usr/lib/cmake/websocketpp
/usr/lib/cmake/websocketpp/websocketpp-configVersion.cmake
/usr/lib/cmake/websocketpp/websocketpp-config.cmake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Use-GNUInstallDirs.patch       | 35 +++++++++++++++++++
 .../websocketpp/websocketpp_0.8.1.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
new file mode 100644
index 0000000000..0ef2e12375
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
@@ -0,0 +1,35 @@
+From 771d79eeb0ac5079482a4b3a131bbda744793e7d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 20:07:11 -0800
+Subject: [PATCH] cmake: Use GNUInstallDirs
+
+Helps install cmakefiles in right libdir
+
+Upstream-Status: Submitted [https://github.com/zaphoyd/websocketpp/pull/854]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2786aba..080be3e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -39,11 +39,13 @@ endif()
+ 
+ set_property(GLOBAL PROPERTY USE_FOLDERS ON)
+ 
++include(GNUInstallDirs)
++
+ set(INSTALL_INCLUDE_DIR include CACHE PATH "Installation directory for header files")
+ if (WIN32 AND NOT CYGWIN)
+   set (DEF_INSTALL_CMAKE_DIR cmake)
+ else ()
+-  set (DEF_INSTALL_CMAKE_DIR lib/cmake/websocketpp)
++  set (DEF_INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/websocketpp)
+ endif ()
+ set (INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 551621708c..05f14d2f42 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -8,6 +8,7 @@ DEPENDS = "openssl boost zlib"
 SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
            file://0001-Replace-make_shared-with-new-in-some-cases.patch \
            file://0002-Fix-missed-entries-fix-testing.patch \
+           file://0001-cmake-Use-GNUInstallDirs.patch \
           "
 
 # tag 0.8.1
-- 
2.24.1


