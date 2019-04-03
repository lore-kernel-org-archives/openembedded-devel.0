Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 52AEA7D2EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:28:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t17so8324053wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MVQ0hku8IeB7VMq/GAkgd5147no5WNDV/rqO25qw5qI=;
	b=lnM5BTloLFZow0O1CxsBv7vpLCrnfn3pv43hzeRCcd3wyHFOGwCt293kSJOR+emG6Z
	9RQNYRL3IVft6soIs3wwyjfXAg0Gz9DV4ElE6JZleJMmQ45gPhCeHw/xt80nuYvpy13f
	pTTCIy8Jf+xdL0NUUb7nRTqWEAzhKRyLP5srs2SPfVDHV90bFxzTtKb7lQT6b/yIe+DV
	n4num8geFZMYGIcvdpu26L222slR8G4cPsXhxm/U4AOjJepV1BN5i84LFx9pJnWosBEG
	2/aZWEbssn7YVi1Jl+/wLg/aWqDGm80VGu7gkiJSuPiRyxO04p7dGPPpHsfE4Km4SVGC
	gpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MVQ0hku8IeB7VMq/GAkgd5147no5WNDV/rqO25qw5qI=;
	b=YWc+3BFQ3gPETRMJsGA35By2Ht9jEjoiu9LkWJQYcpf8my6YvXDMTS0OgW3ThrTMxI
	d+Y7ms41ORxQtORs43ByvXlub2nSrW2S83kAp1kfWpIehBCzJ738VXxgRxprj5IwgSYN
	QWsR+fpXUt8/z5E1aQSuJJwl9lc5OJXj4TvAGLaJWcYYlByQ056n/t4+OrWiTz0bMeOM
	i/+9FozSZwpu1gRMI6hwC7kiGK4DVLBYI2tx4Te0uM2tBK1OMy+0+bcw9F1kmydo8dp/
	35509a7KKydvgg+IT7QF+/7m2kYIxBOZzHOhhYJ6/wxOCYYxtUzcK07n857BX6Dxaf9d
	BerA==
X-Gm-Message-State: APjAAAVISdTgmqLBfdierrlvHuNv/FHbaTcQVckXSPkHmeR3OJH4jQjE
	+KfRh8VISvUT7tEXs/HQXodaaAkhK2ULSw==
X-Google-Smtp-Source: APXvYqwQ0wl3QS/alaBC1LNCepQM8aSwav7z//BknqshycmhCkQeUey+0rwK2tPOMZmnriiO6dpOow==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr4274830wrm.207.1554298113788; 
	Wed, 03 Apr 2019 06:28:33 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.155.216])
	by smtp.gmail.com with ESMTPSA id
	g13sm13221490wmh.11.2019.04.03.06.28.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Apr 2019 06:28:33 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com
Date: Wed,  3 Apr 2019 15:28:15 +0200
Message-Id: <1554298095-26709-4-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554298095-26709-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554298095-26709-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe][PATCH v2 3/3] czmq: bump version 4.1.1 => 4.2.0
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
X-List-Received-Date: Wed, 03 Apr 2019 13:28:33 -0000

Also, add curl and systemd to PACKAGECONFIG

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
Changes in v2:
 - Remove unnecessary 0001-Problem-out-of-date-with-zproject.patch file 

 .../zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb}        | 18 ++++++-------
 .../0001-Problem-out-of-date-with-zproject.patch   | 31 ----------------------
 2 files changed, 9 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb} (56%)
 delete mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
similarity index 56%
rename from meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
rename to meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
index f2db004..4ec1c04 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
@@ -1,15 +1,13 @@
-DESCRIPTION = "C bindings for ZeroMQ"
-HOMEPAGE = "http://www.zeromq.org"
+DESCRIPTION = "High-level C binding for 0MQ"
+HOMEPAGE = "http://czmq.zeromq.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 DEPENDS = "zeromq"
 
-SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz \
-    file://0001-Problem-out-of-date-with-zproject.patch \
-"
+SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6d3a6fdd25c2bb29897c53670dce97bf"
-SRC_URI[sha256sum] = "f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0"
+SRC_URI[md5sum] = "7e09997db6ac3b25e8ed104053040722"
+SRC_URI[sha256sum] = "cfab29c2b3cc8a845749758a51e1dd5f5160c1ef57e2a41ea96e4c2dcc8feceb"
 
 inherit cmake
 
@@ -17,14 +15,16 @@ PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
 
 FILES_${PN} = "${bindir}/*"
 FILES_lib${BPN} = "${libdir}/*.so.*"
-FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir}"
+FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir} ${datadir}/cmake"
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 RDEPENDS_lib${BPN}-dev = "zeromq-dev"
 
-PACKAGECONFIG ??= "lz4 uuid"
+PACKAGECONFIG ??= "lz4 uuid curl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
 PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
+PACKAGECONFIG[curl] = ",-DCMAKE_DISABLE_FIND_PACKAGE_libcurl=TRUE,curl"
+PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
 
 BBCLASSEXTEND = "nativesdk"
 
diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch b/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
deleted file mode 100644
index 5f5702c..0000000
--- a/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d155ffd33630f80b23c31b3a6e01da221dd9bd13 Mon Sep 17 00:00:00 2001
-From: Luca Boccassi <luca.boccassi@gmail.com>
-Date: Fri, 30 Mar 2018 16:36:22 +0100
-Subject: [PATCH] Problem: out of date with zproject
-
-Upstream-Status: backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a3b81722..4f203461 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -38,7 +38,7 @@ if (NOT CMAKE_BUILD_TYPE)
-             OUTPUT_STRIP_TRAILING_WHITESPACE
-         )
-         message(STATUS "git workspace root [${git_result}]: ${git_root}")
--        if ( "${git_result}" == "0" )
-+        if ( "${git_result}" STREQUAL "0" )
-             set (CMAKE_BUILD_TYPE Debug)
-         else ()
-             set (CMAKE_BUILD_TYPE Release)
-@@ -608,7 +608,7 @@ add_custom_command(
-     TARGET  distclean
- )
- 
--include(ClangFormat)
-+include(ClangFormat OPTIONAL)
- 
- ########################################################################
- # summary
-
-- 
2.7.4


