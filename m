Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id DCBEA7FD5C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 16:02:52 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id y8so2462336qvk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 08:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8c1LAcZHJs6I9ajoFgz0m8xMnEb58+gYt+uHt56cCWQ=;
	b=ikv9L332ufBi9TWWd/aEF3WxvKt9tNhhDP6RNbZrBkTD5heG+sabtqUqmBatIRL6IE
	79DViTARi3wS57pHss30BjDs7PCY3pBpxm4iD+DGbZJrthw2YD82y219FSpwd/6VA45S
	0W0pxlvrfiht1FkRytm9DVB2CLhHnMyCbOb7N/gPXXQ2sBA+W8u0ebqO7RY/9dEDclu6
	emE/Yau3GIv145lZW5OJMkCL1nIehii2o3+JRWuhw5QPXenFgTdBV0nODji3PlVE40Yi
	HgGoDfJ/4YW8xbLL1kgLFre552og+X5OWWumns668IpWuq7qRU4YhvTRoQcdkZWkUsXh
	nPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8c1LAcZHJs6I9ajoFgz0m8xMnEb58+gYt+uHt56cCWQ=;
	b=m3I+RSzf3VzZM5npzxDnfqO45wGxxPty7NrVkKqhQEU4QvCFu5Hk8ODVWOFFlqxv/I
	GEmv7LpA41eFpLsXihtojmQKKc4GrVxNEOjiYPHciiQBXCHKkK6JclDr5rSVwan4t8Z6
	tR+q83kHiCTDzlUD1ayjXrpIapTG6dXBD2dzLNxbZQYsrnQOHFmhQOPXSCbQVtuthZW6
	VUqjzJqMGGikenHWaj9Z++pEVslz5X4uvj3vNgRLsh5S53YoW9gwlYtgQrK9FWuP/YUG
	FHjItRZ1MIn2Tga1x7DGH4RWVOCuRqj+oaSxEnDGu4AF+0rEDfFg1E2iiJ6myXKL5sJ1
	qAvA==
X-Gm-Message-State: APjAAAXjbdz1hjFEHzhHJgTH1U2c4bZuvbiANhFP0r+eL0DcVP1qpd/T
	gOCUrlwivmxOsFoRaOnlv9g+5sAedY3PVBur1qY=
X-Google-Smtp-Source: APXvYqzCQCjNCgWQWURHmO8eFjw+ESpdkyf4/cvk4LQXeK6FXd+JXhx/bEqch8UWb1g0gH+IG+sp+T3vrUB7UsFlOo0=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr8694093qva.109.1579968173343; 
	Sat, 25 Jan 2020 08:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20200125095753.21694-1-costamagnagianfranco@yahoo.it>
	<20200125095753.21694-2-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200125095753.21694-2-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jan 2020 08:02:26 -0800
Message-ID: <CAMKF1sq4NzZ8J8XWku4GwXUuYzgZLBPzwO9fBMco-4LdyTuF4g@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: Re: [meta-oe][PATCH 2/2] mosquitto: apply upstream proposed patches to use cmake build system, simplifying a lot the build and install process.
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
X-List-Received-Date: Sat, 25 Jan 2020 16:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 25, 2020 at 2:53 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>

patch seems ok. Commit message could be redone.

> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../mosquitto/files/1568.patch                | 67 +++++++++++++++++++
>  .../mosquitto/files/1569.patch                | 25 +++++++
>  .../mosquitto/files/1570.patch                | 39 +++++++++++
>  .../mosquitto/files/1571.patch                | 24 +++++++
>  .../mosquitto/mosquitto_1.6.8.bb              | 45 +++++--------
>  5 files changed, 173 insertions(+), 27 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1568.patch
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1569.patch
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1570.patch
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1571.patch
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1568.patch b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
> new file mode 100644
> index 000000000..15f7a9105
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
> @@ -0,0 +1,67 @@
> +Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1568]
> +From 50bfc79cae5764a6e513b684a5eb5bef2b35c856 Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Wed, 22 Jan 2020 12:30:25 +0100
> +Subject: [PATCH] Bugfix: include "deps" directory only if BUNDLED_DEPS has
> + been provided and set to true
> +
> +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +---
> + config.mk          | 5 ++++-
> + lib/CMakeLists.txt | 5 ++++-
> + test/unit/Makefile | 6 +++++-
> + 3 files changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/config.mk b/config.mk
> +index 51e36e0d0..0ac24b3d4 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -135,7 +135,10 @@ endif
> +
> + STATIC_LIB_DEPS:=
> +
> +-LIB_CPPFLAGS=$(CPPFLAGS) -I. -I.. -I../lib -I../src/deps
> ++LIB_CPPFLAGS=$(CPPFLAGS) -I. -I.. -I../lib
> ++ifeq ($(WITH_BUNDLED_DEPS),yes)
> ++      LIB_CPPFLAGS:=$(LIB_CPPFLAGS) -I../src/deps
> ++endif
> + LIB_CFLAGS:=$(CFLAGS)
> + LIB_CXXFLAGS:=$(CXXFLAGS)
> + LIB_LDFLAGS:=$(LDFLAGS)
> +diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
> +index e1521f12a..891046a81 100644
> +--- a/lib/CMakeLists.txt
> ++++ b/lib/CMakeLists.txt
> +@@ -1,11 +1,14 @@
> + add_subdirectory(cpp)
> +
> + include_directories(${mosquitto_SOURCE_DIR} ${mosquitto_SOURCE_DIR}/lib
> +-                      ${mosquitto_SOURCE_DIR}/src/deps
> +                       ${STDBOOL_H_PATH} ${STDINT_H_PATH}
> +                       ${OPENSSL_INCLUDE_DIR} ${PTHREAD_INCLUDE_DIR})
> + link_directories(${mosquitto_SOURCE_DIR}/lib)
> +
> ++if (WITH_BUNDLED_DEPS)
> ++        include_directories(${mosquitto_SOURCE_DIR} ${mosquitto_SOURCE_DIR}/src/deps)
> ++endif (WITH_BUNDLED_DEPS)
> ++
> + set(C_SRC
> +       actions.c
> +       callbacks.c
> +diff --git a/test/unit/Makefile b/test/unit/Makefile
> +index 9d422428d..928579492 100644
> +--- a/test/unit/Makefile
> ++++ b/test/unit/Makefile
> +@@ -2,7 +2,11 @@ include ../../config.mk
> +
> + .PHONY: all check test test-broker test-lib clean coverage
> +
> +-CPPFLAGS:=$(CPPFLAGS) -I../.. -I../../lib -I../../src -I../../src/deps
> ++CPPFLAGS:=$(CPPFLAGS) -I../.. -I../../lib -I../../src
> ++ifeq ($(WITH_BUNDLED_DEPS),yes)
> ++        CPPFLAGS:=$(CPPFLAGS) -I../../src/deps
> ++endif
> ++
> + CFLAGS:=$(CFLAGS) -coverage -Wall -ggdb
> + LDFLAGS:=$(LDFLAGS) -coverage
> + LDADD:=$(LDADD) -lcunit
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1569.patch b/meta-networking/recipes-connectivity/mosquitto/files/1569.patch
> new file mode 100644
> index 000000000..9718b98c8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1569.patch
> @@ -0,0 +1,25 @@
> +Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1569]
> +From fda932612afce2cead2fd2ca1c8ea543b2892177 Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Wed, 22 Jan 2020 12:31:01 +0100
> +Subject: [PATCH] Bugfix: enabling DLT was overriding everything else on linker
> + flags because of error in cmake set keyword
> +
> +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +---
> + src/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 7898ff5b1..6dfbba5e6 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -130,7 +130,7 @@ add_definitions (-DWITH_BROKER)
> + if (WITH_DLT)
> +     message(STATUS "DLT_LIBDIR = ${DLT_LIBDIR}")
> +     link_directories(${DLT_LIBDIR})
> +-    set (MOSQ_LIBS ${DLT_LIBRARIES})
> ++    set (MOSQ_LIBS ${MOSQ_LIBS} ${DLT_LIBRARIES})
> + endif (WITH_DLT)
> +
> + set (MOSQ_LIBS ${MOSQ_LIBS} ${OPENSSL_LIBRARIES})
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1570.patch b/meta-networking/recipes-connectivity/mosquitto/files/1570.patch
> new file mode 100644
> index 000000000..f11fc4815
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1570.patch
> @@ -0,0 +1,39 @@
> +Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1570]
> +From 775677b05190380c3736bf0dbef002ee7b9bff33 Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Wed, 22 Jan 2020 12:29:41 +0100
> +Subject: [PATCH] cmake: add ADNS enable/disable dynamic support
> +
> +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +---
> + src/CMakeLists.txt | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 7898ff5b1..edae76f32 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -105,6 +105,9 @@ if (WITH_SYS_TREE)
> +       add_definitions("-DWITH_SYS_TREE")
> + endif (WITH_SYS_TREE)
> +
> ++option(WITH_ADNS
> ++      "Include ADNS support?" OFF)
> ++
> + if (CMAKE_SYSTEM_NAME STREQUAL Linux)
> +       option(WITH_SYSTEMD
> +               "Include systemd support?" OFF)
> +@@ -137,10 +140,11 @@ set (MOSQ_LIBS ${MOSQ_LIBS} ${OPENSSL_LIBRARIES})
> + # Check for getaddrinfo_a
> + include(CheckLibraryExists)
> + check_library_exists(anl getaddrinfo_a  "" HAVE_GETADDRINFO_A)
> +-if (HAVE_GETADDRINFO_A)
> ++if (HAVE_GETADDRINFO_A AND WITH_ADNS)
> ++      add_definitions("-DWITH_ADNS")
> +       add_definitions(-DHAVE_GETADDRINFO_A)
> +       set (MOSQ_LIBS ${MOSQ_LIBS} anl)
> +-endif (HAVE_GETADDRINFO_A)
> ++endif (HAVE_GETADDRINFO_A AND WITH_ADNS)
> +
> +
> + if (UNIX)
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
> new file mode 100644
> index 000000000..2cfa48457
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
> @@ -0,0 +1,24 @@
> +Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1571]
> +From 3fe5468f1bdca1bff1d18cf43c9e338f41aa9e32 Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Wed, 22 Jan 2020 12:39:49 +0100
> +Subject: [PATCH] Add dynamic symbols linking with cmake too
> +
> +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +---
> + lib/CMakeLists.txt | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
> +index e1521f12a..14ba12739 100644
> +--- a/lib/CMakeLists.txt
> ++++ b/lib/CMakeLists.txt
> +@@ -88,6 +88,8 @@ set_target_properties(libmosquitto PROPERTIES
> +       OUTPUT_NAME mosquitto
> +       VERSION ${VERSION}
> +       SOVERSION 1
> ++      LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker.version
> ++      LINK_FLAGS "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/linker.version"
> + )
> +
> + install(TARGETS libmosquitto RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}")
> diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
> index ea533d8a0..6079555a0 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
> @@ -16,45 +16,36 @@ DEPENDS = "uthash"
>
>  SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
>             file://mosquitto.init \
> +           file://1568.patch \
> +           file://1569.patch \
> +           file://1570.patch \
> +           file://1571.patch \
>  "
>
>  SRC_URI[md5sum] = "24a0e567c845b3e41b75e237d200edf8"
>  SRC_URI[sha256sum] = "7df23c81ca37f0e070574fe74414403cf25183016433d07add6134366fb45df6"
>
> -inherit systemd update-rc.d useradd
> +inherit systemd update-rc.d useradd cmake
>
> -PACKAGECONFIG ??= "ssl uuid \
> +PACKAGECONFIG ??= "ssl dlt websockets dns-srv\
>                    ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
>                    "
>
> -PACKAGECONFIG[dns-srv] = "WITH_SRV=yes,WITH_SRV=no,c-ares"
> -PACKAGECONFIG[ssl] = "WITH_TLS=yes WITH_TLS_PSK=yes,WITH_TLS=no WITH_TLS_PSK=no,openssl"
> -PACKAGECONFIG[uuid] = "WITH_UUID=yes,WITH_UUID=no,util-linux"
> -PACKAGECONFIG[systemd] = "WITH_SYSTEMD=yes,WITH_SYSTEMD=no,systemd"
> -PACKAGECONFIG[websockets] = "WITH_WEBSOCKETS=yes,WITH_WEBSOCKETS=no,libwebsockets"
> -
> -EXTRA_OEMAKE = " \
> -    prefix=${prefix} \
> -    mandir=${mandir} \
> -    localedir=${localedir} \
> -    ${PACKAGECONFIG_CONFARGS} \
> -    STRIP=/bin/true \
> -    WITH_DOCS=no \
> -    WITH_BUNDLED_DEPS=no \
> -"
> -
> -export LIB_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
> +PACKAGECONFIG[dns-srv] = "-DWITH_SRV=ON,-DWITH_SRV=OFF,c-ares"
> +PACKAGECONFIG[ssl] = "-DWITH_TLS=ON -DWITH_TLS_PSK=ON -DWITH_EC=ON,-DWITH_TLS=OFF -DWITH_TLS_PSK=OFF -DWITH_EC_OFF,openssl"
> +PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
> +PACKAGECONFIG[websockets] = "-DWITH_WEBSOCKETS=ON,-DWITH_WEBSOCKETS=OFF,libwebsockets"
> +PACKAGECONFIG[dlt] = "-DWITH_DLT=ON,-DWITH_DLT=OFF,dlt-daemon"
>
> -do_install() {
> -    oe_runmake 'DESTDIR=${D}' install
> +EXTRA_OECMAKE = " \
> +    -DWITH_BUNDLED_DEPS=OFF \
> +    -DWITH_ADNS=ON \
> +"
>
> +do_install_append() {
>      install -d ${D}${systemd_unitdir}/system/
>      install -m 0644 ${S}/service/systemd/mosquitto.service.notify ${D}${systemd_unitdir}/system/mosquitto.service
>
> -    install -d ${D}${sysconfdir}/mosquitto
> -    install -m 0644 ${D}${sysconfdir}/mosquitto/mosquitto.conf.example \
> -                    ${D}${sysconfdir}/mosquitto/mosquitto.conf
> -
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d/mosquitto
>      sed -i -e 's,@SBINDIR@,${sbindir},g' \
> @@ -77,9 +68,9 @@ FILES_${PN} = "${sbindir}/mosquitto \
>
>  CONFFILES_${PN} += "${sysconfdir}/mosquitto/mosquitto.conf"
>
> -FILES_libmosquitto1 = "${libdir}/libmosquitto.so.1"
> +FILES_libmosquitto1 = "${libdir}/libmosquitto.so.*"
>
> -FILES_libmosquittopp1 = "${libdir}/libmosquittopp.so.1"
> +FILES_libmosquittopp1 = "${libdir}/libmosquittopp.so.*"
>
>  FILES_${PN}-clients = "${bindir}/mosquitto_pub \
>                         ${bindir}/mosquitto_sub \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

