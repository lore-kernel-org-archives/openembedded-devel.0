Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7A6747FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 15:00:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v13so20005724wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 07:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D3oDCjQtGNolTHBQX3rJ9cg10GZwRKErVKlhCaioFfI=;
	b=qS58NSqSpF4mk5xayHi6ngEp8iUMDNhji1Z3Mmei3df5Lp4Le1FtupZmOJpG7Fp0N/
	PajCf8QVDvto1gEW4EyCtJwlFXZfCgk70OrNoPKQb4dFSNPaWBLEv/yzEi9ro/b0HtUW
	JprMpZr7/3Yq61mIJ1rTZgJo6vbXOP/PNfyQ9w50v3bTEX2j8U8hjhqC+1Wez5kta6X8
	LAKeYcLH4lVz55o0gpcd66QEB+Dfv7RqWkRL3Q0XeqRhWqyzrxuEJrPlAf6MsPypuTw3
	7k9TSHYdv9urTpBCu8NOoeI/+nOIEZOnJANBjryRd0u7S1VNcDmyxmcWm+T10K4Cz9Y1
	HoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D3oDCjQtGNolTHBQX3rJ9cg10GZwRKErVKlhCaioFfI=;
	b=epvvUAZFt93BSv1fDDx4hpv1ShXrX1yzBywLqLCg/oYDYNwbMnLt0cQz7WfoLOcCEa
	LTfYmlYsRdqaleHg1WSHHkIcQ+DSTj6X6FouWDlO3gPmiv9EE051r17R0/dm0rgq/LAl
	KtILCns/FyctT9lsrkpev3o96DsVueAotw6u6WTDLcQRvDqJuWlyvTazj3ARz5NuN1NL
	IBo3gpM99xSBs04AWjKD1DSrIcWdXerVonPK+V1YPOFGHDA2MH+f92ORc22VIuasqyWt
	UxiXKkwbMmAgDGergY2QIG8I0o/rdRZfqdiP5D3t6tEq4byO3ftzgFo8PC3oXIp84p+p
	IMwQ==
X-Gm-Message-State: AA+aEWa8EwL3NsqYiyGVl1m8eS2iSGdgAuBFuQxHt0tTXUvXraWfR4hh
	+ww2X4cAnjmnAjc71ChFXxf4712T
X-Google-Smtp-Source: AFSGD/WdqBTAUdYafvSFIqHYQn2w46Nbk+1WHA4KxlsAMO2DJgwn6ITbILpRV+UyyXIEh0PF/DGasQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr21143182wrv.161.1544022054746;
	Wed, 05 Dec 2018 07:00:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a17sm17803849wrs.58.2018.12.05.07.00.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Dec 2018 07:00:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 15:00:52 +0000
Message-Id: <20181205150052.27047-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181205121357.116604-1-uvv.mail@gmail.com>
References: <20181205121357.116604-1-uvv.mail@gmail.com>
Subject: [PATCH][meta-oe] glog: fix libunwind search in components which depend on glog
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
X-List-Received-Date: Wed, 05 Dec 2018 15:00:55 -0000

* libunwind is not found when using find_package(glog) from some
  other recipe, without this change it fails with:

CMake Error at /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot-native/usr/share/cmake-3.12/Modules/CMakeFindDependencyMacro.cmake:48 (find_package):
  By not providing "FindLibunwind.cmake" in CMAKE_MODULE_PATH this project
  has asked CMake to find a package configuration file provided by
  "Libunwind", but CMake did not find one.

  Could not find a package configuration file provided by "Libunwind" with
  any of the following names:

    LibunwindConfig.cmake
    libunwind-config.cmake

  Add the installation prefix of "Libunwind" to CMAKE_PREFIX_PATH or set
  "Libunwind_DIR" to a directory containing one of the above files.  If
  "Libunwind" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot/usr/lib/cmake/glog/glog-config.cmake:31 (find_dependency)
  CMakeLists.txt:17 (find_package)

-- Configuring incomplete, errors occurred!

* this might help others when upgrading to thud which has newer glog:

mtp-server in meta-luneos layer is the only user of glog I could find
in public layers, it was failing to build with 0.3.5 version of glog
(and building fine with 0.3.4 glog which was built with autotools
instead of cmake and provided pkg-config instead of glog-config.cmake)

First part is relatively simple, update CMakeLists.txt to use cmake
machinery instead of pkg-config:

-pkg_check_modules(GLOG REQUIRED libglog)
+find_package(glog 0.3.5 REQUIRED)

and update the use of GLOG_* variables, e.g.:
-  ${GLOG_LIBRARIES}
+  glog::glog

interestingly glog::glog passes the glog library with whole path, in my
case:
  /OE/build/owpb/webos-ports/tmp-glibc/work/tissot-webos-linux/ \
  mtp-server/0.0.3+gitrAUTOINC+6159f1a143-r0/recipe-sysroot/usr/lib/ \
  libglog.so.0.3.5 -lunwind -lunwind-aarch64
instead of just -lglog -unwind -lunwind-aarch64 which would work as
well, because sysroot is configured correctly elsewhere.

I'm not sure if this is really expected behavior of glog::glog or
another bug in glog-config.cmake.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0002-Find-Libunwind-during-configure.patch    | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
index 15cf67fd2e..4d7642a907 100644
--- a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
+++ b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
@@ -109,12 +109,21 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
  
  install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
 diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
---- a/glog-config.cmake.in	2018-11-20 15:49:07.576278417 +0100
-+++ b/glog-config.cmake.in	2018-11-20 15:52:32.330418489 +0100
-@@ -4,4 +4,6 @@
+--- a/glog-config.cmake.in	2018-11-02 14:02:21.784835854 +0100
++++ b/glog-config.cmake.in	2018-11-02 14:03:16.796935594 +0100
+@@ -4,4 +4,15 @@
  
  @gflags_DEPENDENCY@
  
++# Record the state of the CMake module path when this script was
++# called so that we can ensure that we leave it in the same state on
++# exit as it was on entry, but modify it locally.
++set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
++
++set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
 +find_dependency (Libunwind)
++
++# Restore original module path
++set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
 +
  include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
-- 
2.17.1


