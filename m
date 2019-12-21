Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id AE7037FC74
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:57 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id x8so5723120pgk.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6r2PQa+p1moBBAMTohVgZfw0j9Plh4KyiEECOsXb/do=;
	b=pqgvFLkM55ffdYv+dy8jcno0jtfv34doQcThVz+j5Zpv7Y9ocsbAl+Hf71k7z9geUo
	S33NJMWrco4+lFJ1XxqVkZavNBz5BksBRZoSkL8isS/MB+010o+rLB8RbeCGhBZR1Sk6
	Yp4H/KJydIoH3qutxGU2ZLLKV6oANqIEKERMntqFSwG/P/EUl2QRSKu7mDpR4oWSX5eU
	RHNiyY2Q4VPukFhrZ/Iw2ddniOByjOXVPPXFHWmBLugu+Okaxmb2wEK9yEluw7VHijnf
	FOnEGFWMO6v/XCF3tIHzPs0QzVpDOM2AbMQ8COX8xz3CXHNHm6a0Nne95JpPe0hfbpyy
	mV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6r2PQa+p1moBBAMTohVgZfw0j9Plh4KyiEECOsXb/do=;
	b=qepxpdam+hsklxUP0e8oC/ipycuHGv9Aoqq6H1x1Nbe7Dz7neGmwrUozi66GKPkSq5
	wC1oDcRAi7aKto659xoBl/ptvmKFOTTEtXdyOFWEsWE9xDGxwZf2I+dnYamsi983amec
	zz47auGBP/a8HI+grHbkj9dafGOF26KjtbFFg48hRdjo5hcBT2bB092WLa/pG2Zomb9P
	ltsFKSzwAl+sVGolsQpK9q5XYDqvu1DEoU4Ey1bh1sxo1OHbBSMmpbplk2UVMGUWpN0E
	LpfwMwW6j1ciI+bH40/JE9igXm9THciGSOq1n31QIJNZ4mWwbeWnZp19503mjXdACRbI
	IO7Q==
X-Gm-Message-State: APjAAAWA6rzgbvyPNOOZRRbEBy0oe4BQZ0AVofRhBo5xxhEuk+AhgLQD
	DaMhxvloai1LaeKEB4jqzItMSo5fAwA=
X-Google-Smtp-Source: APXvYqxz8f7eC6qw38uJBSceHc7Cd7VfPhZ47+kx/rwiki/hOsZk+N5oqv7T8lnUle6FBKUWp1qnKg==
X-Received: by 2002:a63:31cf:: with SMTP id
	x198mr17499364pgx.272.1576886818150; 
	Fri, 20 Dec 2019 16:06:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:26 -0800
Message-Id: <20191221000635.1573390-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 14/23] gattlib: Update to latest tip
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:57 -0000
Content-Transfer-Encoding: 8bit

Fix multilib builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-cmake-Use-GNUInstallDirs.patch | 53 +++++++++++++++++++
 .../gattlib/gattlib_git.bb                    |  8 +--
 2 files changed, 58 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch
new file mode 100644
index 0000000000..ffe0a00673
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch
@@ -0,0 +1,53 @@
+From 63dc2d0c9384d85482dc4cbb3c179b4b0bb18d4e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 22:32:01 -0800
+Subject: [PATCH] cmake: Use GNUInstallDirs
+
+Helps install cmakefiles in right libdir
+
+Upstream-Status: Submitted [https://github.com/labapart/gattlib/pull/139]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt      |  5 +++--
+ dbus/CMakeLists.txt | 18 ++++++++++--------
+ 2 files changed, 13 insertions(+), 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 12d8d71..ded7239 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -152,7 +152,8 @@ endif()
+ #
+ # List of file to install
+ #
+-install(FILES include/gattlib.h DESTINATION include)
+-install(FILES ${PROJECT_BINARY_DIR}/gattlib.pc DESTINATION lib/pkgconfig)
++include(GNUInstallDirs)
++install(FILES include/gattlib.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++install(FILES ${PROJECT_BINARY_DIR}/gattlib.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+ include(CPack)
+diff --git a/dbus/CMakeLists.txt b/dbus/CMakeLists.txt
+index f5096ce..cef031f 100644
+--- a/dbus/CMakeLists.txt
++++ b/dbus/CMakeLists.txt
+@@ -19,7 +19,7 @@
+ #  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ #
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.0)
+ 
+ find_package(PkgConfig REQUIRED)
+ 
+@@ -119,4 +119,6 @@ endif()
+ add_library(gattlib SHARED ${gattlib_SRCS})
+ target_link_libraries(gattlib ${gattlib_LIBS})
+ 
+-install(TARGETS gattlib LIBRARY DESTINATION lib)
++include(GNUInstallDirs)
++
++install(TARGETS gattlib LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 0e6fce9c91..6b4decce51 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -9,11 +9,13 @@ DEPENDS += "glib-2.0-native"
 
 PV = "0.2+git${SRCPV}"
 
-SRC_URI = "git://github.com/labapart/gattlib.git"
-SRC_URI += "file://dbus-avoid-strange-chars-from-the-build-dir.patch"
+SRC_URI = "git://github.com/labapart/gattlib.git \
+           file://dbus-avoid-strange-chars-from-the-build-dir.patch \
+           file://0001-cmake-Use-GNUInstallDirs.patch \
+           "
 
 SRCBRANCH = "master"
-SRCREV = "c6a33252221dff904cf277e085e2ce70aced8788"
+SRCREV = "5c7ee43bd70ee09a7170ddd55b9fdbdef69e9080"
 
 S = "${WORKDIR}/git"
 
-- 
2.24.1


