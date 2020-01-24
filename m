Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB637F879
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:31:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x8so1240213pgk.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=/JM0PFb9W+4hqM1amky05asEtwJEBHy9SBYeBQStP1A=;
	b=SkGxcwV9i/iVKtgfUeJM2wiCwN+64dVlKXD/XTrfpOJ06MheKqpvpbJWJzQ6IB31BO
	dmPFIa836JyM0g0nF46dEbV73f5xBJf//D1mj5M/NYKPsJx6+2hXAZzZiG5viVeqSZrx
	2In3b+qs86l8ZgjcVt+I/iE9e9zSi+VFyFgDC23rIGNuzWVKVZosdYbIRPbQO+Q9fHuS
	U1RzGd0pypi1XVpjQAHK7uiPtH7fO/PpeZQi16tBdrGREYe2t42TRVDOr2JY3nlEJvRw
	ec2ryEClc+v8sRdz/41uTpaNCmIRdoyfvBeQGRcQi8Gx3FOnpjrNy1GCepIELVhNNeas
	/ZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=/JM0PFb9W+4hqM1amky05asEtwJEBHy9SBYeBQStP1A=;
	b=nXcaFO3kU0C/z3tV8KK+RRGLLOgz/wR+odCqRN00F8kHH+uS+iN17Vv6oEPCagDj8u
	qrRtwYaFrYWnaT+9/N0tHSxlr+pwhsEV8v/C+ktTHIWgbkrtBitidxeD92Sj2cDNg3Al
	EbpVkGVzDAcBFxqUQ92ZrbEEsiqlqUnVjwSN1hEeU6Nokh8120H2UNpD7Nqe393jWJBK
	YeoKLbW3iOxQTbmgJV97m/6+Mercj/4Or2VzzHxq+SXWQ/2o8+0R4hxB5viy7wh96bVT
	oeTPrN0JYAnXTE5FUpl/e4ZWYgfk5IdDnNvB+H4jBH0rSpjs1+X1XggQscrHw/gyDq0u
	myxw==
X-Gm-Message-State: APjAAAWklsRI3ubAcwdJE917yOATOlznZ81bDAy8eSi9+N7VWez+uA9G
	9GbuJdy80052y6M9So7mkSE=
X-Google-Smtp-Source: APXvYqzeB66C7Qcm8eobNUPClj0r6gIJbo34qiTICbdNJAmwze81+fq9+MgoDYLqK/X8cn+dwL/5eA==
X-Received: by 2002:a62:ea06:: with SMTP id t6mr3800321pfh.73.1579879861968;
	Fri, 24 Jan 2020 07:31:01 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:c529:ee5d:f9be:6846?
	([2601:202:4180:a5c0:c529:ee5d:f9be:6846])
	by smtp.gmail.com with ESMTPSA id
	v10sm7096636pgk.24.2020.01.24.07.30.59
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 07:31:00 -0800 (PST)
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20200124134304.21057-1-costamagnagianfranco@yahoo.it>
	<20200124134304.21057-2-costamagnagianfranco@yahoo.it>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5191d979-1bf9-4fdf-e0d1-976b280ef699@gmail.com>
Date: Fri, 24 Jan 2020 07:30:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200124134304.21057-2-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
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
X-List-Received-Date: Fri, 24 Jan 2020 15:31:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/24/20 5:43 AM, Gianfranco Costamagna wrote:
> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../mosquitto/files/1568.patch                | 66 +++++++++++++++++++
>  .../mosquitto/files/1569.patch                | 24 +++++++
>  .../mosquitto/files/1570.patch                | 28 ++++++++
>  .../mosquitto/files/1571.patch                | 23 +++++++
>  .../mosquitto/mosquitto_1.6.8.bb              | 45 +++++--------
>  5 files changed, 159 insertions(+), 27 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1568.patch
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1569.patch
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1570.patch
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1571.patch
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1568.patch b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
> new file mode 100644
> index 000000000..2ac1373f2
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
> @@ -0,0 +1,66 @@
> +From 50bfc79cae5764a6e513b684a5eb5bef2b35c856 Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Wed, 22 Jan 2020 12:30:25 +0100
> +Subject: [PATCH] Bugfix: include "deps" directory only if BUNDLED_DEPS has
> + been provided and set to true

Patches missing "Upstream-Status:   "

See https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
for options.


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
> ++	LIB_CPPFLAGS:=$(LIB_CPPFLAGS) -I../src/deps
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
> +-			${mosquitto_SOURCE_DIR}/src/deps
> + 			${STDBOOL_H_PATH} ${STDINT_H_PATH}
> + 			${OPENSSL_INCLUDE_DIR} ${PTHREAD_INCLUDE_DIR})
> + link_directories(${mosquitto_SOURCE_DIR}/lib)
> + 
> ++if (WITH_BUNDLED_DEPS)
> ++        include_directories(${mosquitto_SOURCE_DIR} ${mosquitto_SOURCE_DIR}/src/deps)
> ++endif (WITH_BUNDLED_DEPS)
> ++
> + set(C_SRC
> + 	actions.c
> + 	callbacks.c
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
> index 000000000..d088ab3f7
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1569.patch
> @@ -0,0 +1,24 @@
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
> index 000000000..62b3acdb2
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1570.patch
> @@ -0,0 +1,28 @@
> +From 9a6470d31d212522a56cab94b81f99a7b6967f76 Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Wed, 22 Jan 2020 12:29:41 +0100
> +Subject: [PATCH] cmake: add ADNS enable/disable dynamic support
> +
> +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +---
> + src/CMakeLists.txt | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 7898ff5b1..11c24e2cc 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -105,6 +105,13 @@ if (WITH_SYS_TREE)
> + 	add_definitions("-DWITH_SYS_TREE")
> + endif (WITH_SYS_TREE)
> + 
> ++option(WITH_ADNS
> ++	"Include ADNS support?" OFF)
> ++if (WITH_ADNS)
> ++	add_definitions("-DWITH_ADNS")
> ++	set (MOSQ_LIBS ${MOSQ_LIBS} anl)
> ++endif (WITH_ADNS)
> ++
> + if (CMAKE_SYSTEM_NAME STREQUAL Linux)
> + 	option(WITH_SYSTEMD
> + 		"Include systemd support?" OFF)
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
> new file mode 100644
> index 000000000..4e4f804e0
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
> @@ -0,0 +1,23 @@
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
> + 	OUTPUT_NAME mosquitto
> + 	VERSION ${VERSION}
> + 	SOVERSION 1
> ++	LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker.version
> ++	LINK_FLAGS "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/linker.version"
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


