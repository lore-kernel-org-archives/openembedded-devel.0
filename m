Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 74ACE6FF30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:04:43 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id c6so28614188qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=F2UDnVzPWV1IIJhro961ynftEB6ZZ2uvWphbu1yhLmE=;
	b=FuPMuY92N3yvBrskKtyx/uwFm8jsKZ/DE0oXVYs1yuhVUwjNogDI98a4iKvS4YXtbz
	lV+wxn5QzpaqvaInNrUNnrJRyUYCga2CngHkAnj20+eilIi06p0wqayoW2zAIgoY60Jw
	bVwZ/hr7DjMkKGqtY+C/gv0/2wNuTinUN7My+1CYpDcMCfp8CXhRFlo3IzRAu6JVDI0z
	k3/mRsOnpr1J4CW0XF1Lv2rrV6eCsCO3g11jj/FLAj9UPAcsLNMwlvuH48oIyh2KENAZ
	DeV8dakgz9bwdBTKa9DIy9meeFsvfVHGOgAoACSjpE0Csxt2hnNRlV1EOSDP2qZre+VD
	OUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=F2UDnVzPWV1IIJhro961ynftEB6ZZ2uvWphbu1yhLmE=;
	b=JqwQwC03PlrfI/4+fnnlyw6CMvgQXLzQfkb3NhO542lQhTaaYJ7Az2czxq54PlXpTN
	DfFQE7oMyAStgL2HxTrH2li7jQptdhIGAX1q5E4z3U2nuDThX8JBVs2D7s6iSjksSPVC
	shwVF3A6xRSpdCYS6VirS/ZUb4SfK1s9V7EmkZRHsxwC3W5ZMxOTz2nPJVNjGdMNcybO
	gPVZKtKxWCoSgFrDk5VmwGn6IOnG6jeIpTdhSohOiXeT7V5mxavfZD6psFeSZAEw8Ija
	keTTBP4GH7554yn2oAb3TWksAjcwGLjQfynvx9rHM/7GNcQWno5hZ4SvyyCxqkxMyPq0
	K+lg==
X-Gm-Message-State: AOPr4FVdG3BH+CywXFEHp2B5n3LEk9mi/7XdDq5VCawO3updtHAlUr//VCZlFC/pIAz2gQ==
X-Received: by 10.140.40.231 with SMTP id x94mr7012568qgx.83.1460498683740;
	Tue, 12 Apr 2016 15:04:43 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-15-136.ronkva.east.verizon.net.
	[71.171.15.136]) by smtp.gmail.com with ESMTPSA id
	e62sm14479942qge.44.2016.04.12.15.04.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 15:04:42 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Apr 2016 18:04:38 -0400
Message-Id: <1460498678-17241-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCHv4] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Tue, 12 Apr 2016 22:04:45 -0000

 * Run tested cpp bindings with GNU Radio Control Port.
 * The patch forcible removes Qt5 from configure. The disable is correct,
   but doesn't prevent a cmake error looking for qmake during configure.
   We do not need Qt5, so remove check. I suspect the issue might be in
   Qt5 cmake files.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../0001-Forcibly-disable-check-for-Qt5.patch      | 27 +++++++++++++++++
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 35 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb

diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
new file mode 100644
index 0000000..fcc2f08
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
@@ -0,0 +1,27 @@
+From b3da0d8677b7e8467367a303c18551c56ed20e15 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Tue, 12 Apr 2016 17:30:15 -0400
+Subject: [PATCH] Forcibly disable check for Qt5.
+
+Signed-off-by: Philip Balister <philip@balister.org>
+---
+ build/cmake/DefineOptions.cmake | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/build/cmake/DefineOptions.cmake b/build/cmake/DefineOptions.cmake
+index 62e240f..f8b4493 100644
+--- a/build/cmake/DefineOptions.cmake
++++ b/build/cmake/DefineOptions.cmake
+@@ -52,9 +52,6 @@ CMAKE_DEPENDENT_OPTION(WITH_LIBEVENT "Build with libevent support" ON
+ find_package(Qt4 QUIET COMPONENTS QtCore QtNetwork)
+ CMAKE_DEPENDENT_OPTION(WITH_QT4 "Build with Qt4 support" ON
+                        "QT4_FOUND" OFF)
+-find_package(Qt5 QUIET COMPONENTS Core Network)
+-CMAKE_DEPENDENT_OPTION(WITH_QT5 "Build with Qt5 support" ON
+-                       "Qt5_FOUND" OFF)
+ if(${WITH_QT4} AND ${WITH_QT5} AND ${CMAKE_MAJOR_VERSION} LESS 3)
+   # cmake < 3.0.0 causes conflict when building both Qt4 and Qt5
+   set(WITH_QT4 OFF)
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
new file mode 100644
index 0000000..b6b73ad
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Apache Thrift"
+DESCRIPTION =  "A software framework, for scalable cross-language services development"
+HOMEPAGE = "https://thrift.apache.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf"
+
+DEPENDS = "thrift-native boost python libevent flex-native bison-native \
+           glib-2.0 openssl"
+
+SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
+           file://0001-Forcibly-disable-check-for-Qt5.patch \
+"
+SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit pkgconfig cmake pythonnative
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS
+export HOST_SYS
+
+EXTRA_OECMAKE = "-DWITH_QT4=OFF -DWITH_QT5=OFF"
+EXTRA_OECMAKE_class-native = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
+             -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
+EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
+             -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
+
+do_install_append () {
+	ln -sf thrift ${D}/${bindir}/thrift-compiler
+}
+
-- 
2.5.5


