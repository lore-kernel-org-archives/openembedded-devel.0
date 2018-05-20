Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id E677674F83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 02:41:36 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id f21-v6so10606752iob.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 19:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JEsJyDribXHF60EdLSm4eE06DZbsjN3C9y1+1U8+v/Q=;
	b=rZdtl9BUIdEVWVJBwJUsFYkKkNPhmmCT1819uFGf6WHkwjiBRQlIjG5weyaXzhedHo
	FeePcYW+lQoS6U/bsasFNiaLBWaxlKUSp7cEtynU1KX3jeUiffjB6ITia3R8Fox0rl3M
	einhbshBWaxK/uZ0hzgYVV84wB9uqMqdo/aHWxJ0/bHUKGDuexu4CJUMTqzZA3w87nUw
	ylHi2BtPN/zXAM/2VLngCdsI9KCJc5kTYaTNeRu0jzBgYn/zcs5dK5PMY3TH5tEE9NL4
	ifp6e4h12yoB7OvaZnnWYgPqfAakVGtT1SWiNf0FzHU4Jw4nBY4BiMEsH0oab8LpaqTq
	TF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JEsJyDribXHF60EdLSm4eE06DZbsjN3C9y1+1U8+v/Q=;
	b=KvJiU4dHpv5fq2PvfWcemUV5iasNOWZSONozfGfdu73tJIboCaXybGc5gZ7M3RDvCG
	Gx+PKukeP8nYaDq0xsvcP963pIH9vQkfvJt+f3QCI8s8W5Ynmh4TCojVdPQegme4wz2K
	EVqpFI7W0TzWxbB4AOrdCbon9D+ydZy6cTlh8maLgixyjcCBU50qReUArfjEvmXjC80f
	UvCZ2bOL7NxJK1HAZWo1mahlC01sY9urRUTIB5xToEVqJud3OdfrqvudxHWK+mkIx03w
	Y2QkDIbVlxIAniHA78fc7NzwxLPHkiJkPDOmA5sOiNLPu93Fyhubj9yyJhg2GkziFYaQ
	AGyw==
X-Gm-Message-State: ALKqPwfnqp/fwjwRKKOandKo6bI7d/+xo5wBOtfRTGCQ5Yccp4UwJu+x
	cO5OZDE2XC5IRvagyrg8P7u4sL1l
X-Google-Smtp-Source: AB8JxZr6cErCECxklRNqWG5yzWVwHp9kL42PgL5OXyehybtCbQN6Cg8HyCSLCkghgmj4hCsR62NOtg==
X-Received: by 2002:a6b:b252:: with SMTP id
	b79-v6mr16755783iof.186.1526784097462; 
	Sat, 19 May 2018 19:41:37 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	g200-v6sm6660643itb.26.2018.05.19.19.41.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 May 2018 19:41:36 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 May 2018 22:41:30 -0400
Message-Id: <20180520024130.11222-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [meta-oe][master-next][PATCH] rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sun, 20 May 2018 02:41:37 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb   | 1 -
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb             | 2 +-
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb                      | 2 --
 meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb           | 1 -
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb        | 2 --
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb               | 1 -
 meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb             | 2 --
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 1 -
 meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb                    | 1 -
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb             | 2 --
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb       | 2 --
 meta-oe/recipes-support/fftw/fftw_3.3.7.bb                      | 1 -
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb                  | 2 --
 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb              | 2 +-
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb                  | 2 --
 meta-oe/recipes-support/libssh/libssh_0.7.3.bb                  | 1 -
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb        | 2 --
 meta-oe/recipes-support/opencv/opencv_3.3.bb                    | 2 +-
 18 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
index ea262f855b..f38414862a 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
@@ -23,5 +23,4 @@ PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,
 
 PACKAGES =+ "${PN}-testapps"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 1b56685c57..dcc2edf76e 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -34,7 +34,7 @@ do_install_append () {
 PACKAGES =+ "openobex-apps"
 FILES_${PN}-apps = "${bindir}/*"
 FILES_${PN} += "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/openobex-config ${libdir}/cmake"
+FILES_${PN}-dev += "${bindir}/openobex-config"
 DEBIAN_NOAUTONAME_${PN}-apps = "1"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 9a2f9dd1c5..a3b06fd133 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -30,5 +30,3 @@ EXTRA_OECMAKE = "\
     -DWITH_TESTS=OFF \
     -DWITH_TOOLS=OFF \
 "
-
-FILES_${PN}-dev += "${libdir}/cmake"
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
index ffbe73feee..dfe19947c0 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
@@ -20,7 +20,6 @@ S = "${WORKDIR}/git/c++"
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-compiler = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index c7c1ad1eca..3c1d8a9959 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -20,6 +20,4 @@ DEPENDS = "boost"
 
 inherit cmake
 
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
-
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 267c0e79f5..dcd47a4e69 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -47,7 +47,6 @@ PACKAGECONFIG[demos] = "-DLIBRCF_BUILD_DEMOS=ON,-DLIBRCF_BUILD_DEMOS=OFF,"
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'demos', '${PN}-demos', '', d)}"
 
 FILES_${PN}-demos = "${bindir}/*"
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibRcf.cmake"
 
 BBCLASSEXTEND = "nativesdk"
 
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
index 02c0cd2964..3ae4c1f879 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
@@ -18,5 +18,3 @@ SRC_URI = "git://github.com/msgpack/msgpack-c \
 inherit cmake pkgconfig
 
 S = "${WORKDIR}/git"
-
-FILES_${PN}-dev += "${libdir}/cmake/msgpack/*.cmake"
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 8ab35d224b..069385d5b0 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -20,7 +20,6 @@ EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJ
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
index 4e2ee23787..dc0081d031 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
@@ -22,7 +22,6 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DGLM_ENABLE_EXPERIMENTAL=ON"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
index 4ef1c408fd..f749d62342 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
@@ -17,5 +17,3 @@ DEPENDS = "libpng tiff lcms zlib"
 # standard path for *.cmake
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake \
                   -DOPENJPEG_INSTALL_LIB_DIR:PATH=${libdir}"
-
-FILES_${PN}-dev += "${libdir}/cmake/*.cmake"
diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index 29917c8a14..a3444b934c 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -16,5 +16,3 @@ inherit cmake
 
 # Only a static library and headers are created
 ALLOW_EMPTY_${PN} = "1"
-
-FILES_${PN}-dev += "${libdir}/cmake/*"
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
index aae6ec952a..c14edf7301 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
@@ -74,7 +74,6 @@ FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
 FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
 FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = "libfftw libfftwl libfftwf"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index 28b652a640..b186326e9b 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -10,8 +10,6 @@ SRCREV = "f8a0efe03aa69b3336d8e228b37d4ccb17324b88"
 
 S = "${WORKDIR}/git"
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 inherit cmake
 
 EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
index bc3b32e384..83d2a83250 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/eigen-eigen-5a0156e40feb"
 inherit cmake
 
 FILES_${PN} = "${includedir} ${libdir}"
-FILES_${PN}-dev = "${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+FILES_${PN}-dev = "${datadir}/eigen3/cmake ${datadir}/pkgconfig"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index 6bea16582f..a1576b5617 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -26,6 +26,4 @@ inherit cmake binconfig pkgconfig
 
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
index 79e7dc5998..e5ea2b8bfa 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
@@ -30,5 +30,4 @@ do_configure_prepend () {
         || bbfatal "Failed to disable examples"
 }
 
-FILES_${PN}-dev += "${libdir}/cmake"
 TOOLCHAIN = "gcc"
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
index 8b5ab44fdd..c763a6c2b3 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
@@ -12,6 +12,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-FILES_${PN}-dev += "${libdir}/cmake/"
-
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index ca62de7c8f..1cadbdb533 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -167,7 +167,7 @@ PACKAGES_DYNAMIC += "^libopencv-.*"
 
 FILES_${PN} = ""
 FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES_${PN}-staticdev += "${datadir}/OpenCV/3rdparty/lib/*.a"
 FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
 FILES_${PN}-java = "${datadir}/OpenCV/java"
-- 
2.17.0.582.gccdcbd54c


