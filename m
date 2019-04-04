Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE627D460
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 13:59:23 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id h18so3544882wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2019 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MVQ0hku8IeB7VMq/GAkgd5147no5WNDV/rqO25qw5qI=;
	b=s2JEB+xDLn7hkl//CTKkHNewkyXx+0jDGBydUHBnkDfZ+MerKZq/D88dsxhzXnI9NB
	7zKCn9Cr8FrmZ7For7Ef15CN1d4PYbiA+FhpLxTFAQWDpCWPZ2T05EwuSZJUUHwB0TcX
	EztkUvnr8G3Jhxe1IAbIt5GIsP3gqnq+Mk5FrxMd2/tVAfzIAgKulUhbc4SkH+XwLLto
	tbN3jNnSCzcp+Wb0oW2kzKxWp3MHpiE0Ii/UPp9mLQfxhsV0lVUzKcDYyavNmsrIi2iW
	0GdqXD26DWlOdzIqW8A7qDA7NDrOU31dGn2FBBIIvONLWl3EPw+1UirQ6qSaWVKTN3qe
	3Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MVQ0hku8IeB7VMq/GAkgd5147no5WNDV/rqO25qw5qI=;
	b=NvBnoRMZArxqaDZpK7vTh6cHn3X1/iWbsHlKBZPPIMXzzI8ukWyS5fxsD8CD8gycTD
	1tCQLWxDz7UDrsYnpIOHy3OqnbHLi77wKFDIGQhB9jr/ZmZ9oq4ahAdmv6bqpxqvcbwm
	zK71hVsklprMLAffnZa6iKu8IbzyXznIP9ROjRut4QnyETtE1AlcciRuPFIwldlitcPH
	n4FmxoZTfVlugik9mLYtFYP/sarpZ7G3HNAOxZTswHgqBsVhJGOLqlf4KXEje8qNTEPd
	LhUvG8TGYX+yDXeHQeBXNabuB8tUntDHQ/DPBVWX7uPPNIjNRPaaL7Fd8eIHO0mtyUiX
	DExA==
X-Gm-Message-State: APjAAAWMXuIe7i79cgiyX1lK+mVnzU2d5papOR8Csp7AOb4Wwu09V11o
	2rlVaaa2eJS3ZMIrcbiGHs2wIa47QuU=
X-Google-Smtp-Source: APXvYqzi/FN93o59KaBnRK+0A5cZt9aENBvhPcurxw6o6V0s986jIUEuR8lZCNMZdRvxA8e2Iwh4TA==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr4508753wmj.0.1554386364029;
	Thu, 04 Apr 2019 06:59:24 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.214.126.255])
	by smtp.gmail.com with ESMTPSA id
	q4sm26056547wrx.25.2019.04.04.06.59.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Apr 2019 06:59:23 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com, raj.khem@gmail.com
Date: Thu,  4 Apr 2019 15:58:59 +0200
Message-Id: <1554386339-20076-4-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554386339-20076-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554386339-20076-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe] [PATCH v3 3/3] czmq: bump version 4.1.1 => 4.2.0
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
X-List-Received-Date: Thu, 04 Apr 2019 13:59:23 -0000

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


