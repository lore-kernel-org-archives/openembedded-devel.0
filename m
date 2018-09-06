Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id C664A74E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:20 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i26-v6so5604150pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P8uGpRjG9Q36AoXoZEwOrSS7ObndshZ5DD/souwCtMk=;
	b=cpCKaiteQ+CAxu2e44kCCWVrzkiCdcoeH1j7FXOMHX40krUXX/J4M179LmpBAT26Vo
	JftUv8XUtimxtzJtqYxTnfL5zTWtCU4KgZiUHCWQXQBNTaEYez9G6RvUZMmq2GDRsz6v
	TN9CyGDGU9s26cKCwblAv4uYSHsi/0nARhUd4BDvQf/NVnHbGprVpY9AAqEq3JnbB1On
	1Bzyv8I0/nrhMOheAdfcHisBSdDwCzLiuAqvFkLP8yup/N8ivTszuNUnPykJgyTqJ1+o
	RDQtULZlzaVVkSRqbftaYlFBMEoq8Fc0yat1L81chZSlHGe7v5BYNg5qvfXwuTf2CeWZ
	d4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P8uGpRjG9Q36AoXoZEwOrSS7ObndshZ5DD/souwCtMk=;
	b=SE70+Inld5gKrNdJ2XT7wpvCVYO5I2Muvu6V/rE5+WkHFeWVYYwDGYTcoLLM9C/pMk
	RyTpXhuFhjGQSVg+7fhdlHM8OiyB1oQw0UJW7aHyRI+zj/bPdNdnMw3s1jY7OFXA20Kj
	q3LCCbAl5Vg52ohR2i55T4i9R5pfFzBrRz1+F2DH0HDT8yDLzXeoVcS7tzz0X3IP4ELN
	Kedd5YhVXR3ZFbr57Vaz0taoBCIXebk1zkNEQTD60+inCvpPdYUvCcBNAtlpDcKsMZ/Y
	ysdnlFKPr/BhwyEHyXGUTK4+qY7TGCfQ3VpL/30+MdKGAgvsXvfR8sygzipCgcJJ9J6r
	JXWg==
X-Gm-Message-State: APzg51AXZS6q9TSgcos7lqZWuvS2FZwpqxRGPS5C3XZP+VUZoxBnaStI
	UpOXoodmVQ9nYRlzfO2qmyNw+pgz
X-Google-Smtp-Source: ANB0VdZGfQ2/hAaMLO4KG15wkRuvuEn3bR/D7Ix/yaP3LKRcNh1r2qjmUAEVU8nyEH8fzj+Peolk8w==
X-Received: by 2002:a63:4663:: with SMTP id
	v35-v6mr3910146pgk.178.1536254541613; 
	Thu, 06 Sep 2018 10:22:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:21:56 -0700
Message-Id: <20180906172210.42551-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/17] boinc: Upgrade to 7.12
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:20 -0000

* Fixes build wth OpenSSL 1.1.x
* Drop cross compile patch, not needed anymore
* Package systemd support
* Drop no-pie flags, works ok with PIE now
* autotools-brokensep is no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../boinc/boinc-client/cross-compile.patch    | 98 -------------------
 ...-client_7.6.33.bb => boinc-client_7.12.bb} | 24 +++--
 2 files changed, 16 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.6.33.bb => boinc-client_7.12.bb} (82%)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
deleted file mode 100644
index 287391a522..0000000000
--- a/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Remove rpath, its bad for cross compiling to encode
-build time rpaths
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: boinc-client_release-7.6-7.6.33/api/Makefile.am
-===================================================================
---- boinc-client_release-7.6-7.6.33.orig/api/Makefile.am
-+++ boinc-client_release-7.6-7.6.33/api/Makefile.am
-@@ -43,18 +43,18 @@ endif
- 
- lib_LTLIBRARIES = libboinc_api.la
- libboinc_api_la_SOURCES = $(api_files)
--libboinc_api_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
-+libboinc_api_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
- 
- if BUILD_GRAPHICS_API
- lib_LTLIBRARIES += libboinc_graphics2.la
- libboinc_graphics2_la_SOURCES = $(graphics2_files)
- libboinc_graphics2_la_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/lib -I$(top_srcdir)/samples/image_libs
--libboinc_graphics2_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION) -ljpeg
-+libboinc_graphics2_la_LDFLAGS = -version-number $(LIBBOINC_VERSION) -ljpeg
- endif #BUILD_GRAPHICS_API
- 
- lib_LTLIBRARIES += libboinc_opencl.la
- libboinc_opencl_la_SOURCES = $(opencl_files)
--libboinc_opencl_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
-+libboinc_opencl_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
- 
- if INSTALL_HEADERS
- ## install only headers that are meant for exporting the API !!
-Index: boinc-client_release-7.6-7.6.33/lib/Makefile.am
-===================================================================
---- boinc-client_release-7.6-7.6.33.orig/lib/Makefile.am
-+++ boinc-client_release-7.6-7.6.33/lib/Makefile.am
-@@ -173,7 +173,7 @@ lib_LTLIBRARIES = libboinc.la
- libboinc_la_SOURCES = $(generic_sources) $(mac_sources) $(win_sources)
- libboinc_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
- libboinc_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
--libboinc_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
-+libboinc_la_LDFLAGS = -static -version-number $(LIBBOINC_VERSION)
- libboinc_la_LIBADD =
- 
- if ENABLE_BOINCCRYPT
-@@ -181,7 +181,7 @@ lib_LTLIBRARIES += libboinc_crypt.la
- libboinc_crypt_la_SOURCES = crypt.cpp
- libboinc_crypt_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CFLAGS)
- libboinc_crypt_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CXXFLAGS)
--libboinc_crypt_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
-+libboinc_crypt_la_LDFLAGS = -static -version-number $(LIBBOINC_VERSION)
- libboinc_crypt_la_LIBADD =
- endif
- 
-@@ -190,7 +190,7 @@ lib_LTLIBRARIES += libboinc_fcgi.la
- libboinc_fcgi_la_SOURCES = $(libfcgi_sources) $(mac_sources) $(win_sources)
- libboinc_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
- libboinc_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
--libboinc_fcgi_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
-+libboinc_fcgi_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
- libboinc_fcgi_la_LIBADD =
- endif 
- # end of "if ENABLE_FCGI"
-Index: boinc-client_release-7.6-7.6.33/sched/Makefile.am
-===================================================================
---- boinc-client_release-7.6-7.6.33.orig/sched/Makefile.am
-+++ boinc-client_release-7.6-7.6.33/sched/Makefile.am
-@@ -26,7 +26,7 @@ lib_LTLIBRARIES = libsched.la
- libsched_la_SOURCES = $(libsched_sources)
- libsched_la_CFLAGS = $(AM_CPPFLAGS)
- libsched_la_CXXFLAGS = $(AM_CPPFLAGS)
--libsched_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
-+libsched_la_LDFLAGS= -version-number $(LIBBOINC_VERSION)
- libsched_la_LIBADD= $(SSL_LIBS)
- 
- ## install only headers that are meant for exporting the API !!
-@@ -48,7 +48,7 @@ lib_LTLIBRARIES += libsched_fcgi.la
- libsched_fcgi_la_SOURCES = $(libsched_sources)
- libsched_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
- libsched_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
--libsched_fcgi_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
-+libsched_fcgi_la_LDFLAGS= -version-number $(LIBBOINC_VERSION)
- libsched_fcgi_la_LIBADD=
- 
- endif
-Index: boinc-client_release-7.6-7.6.33/zip/Makefile.am
-===================================================================
---- boinc-client_release-7.6-7.6.33.orig/zip/Makefile.am
-+++ boinc-client_release-7.6-7.6.33/zip/Makefile.am
-@@ -61,7 +61,7 @@ endif
- 
- lib_LTLIBRARIES = libboinc_zip.la
- libboinc_zip_la_SOURCES = $(libboinc_zip_sources)
--libboinc_zip_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
-+libboinc_zip_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
- libboinc_zip_la_LIBADD =
- 
- # Some OSs may not prefix libraries with lib.
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
similarity index 82%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
index 99b43fa3f8..e505bb4c5f 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
@@ -29,21 +29,19 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-
-SRC_URI = "https://github.com/BOINC/boinc/archive/client_release/7.6/${PV}.tar.gz \
+SRCREV = "bd12338dbd29083daa5a4b022592ca31ff68cd98"
+BRANCH = "client_release/7/${PV}"
+SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
            file://opengl_m4_check.patch \
-           file://cross-compile.patch \
            file://gtk-configure.patch \
 "
-SRC_URI[md5sum] = "437b4b98e384b4bda4ef7056e68166ac"
-SRC_URI[sha256sum] = "c4b1c29b9655013e0ac61dddf47ad7f30f38c46159f02a9d9dc8ab854e99aa6d"
 
-inherit gettext autotools-brokensep pkgconfig distro_features_check
+inherit gettext autotools pkgconfig distro_features_check systemd
 
 REQUIRED_DISTRO_FEATURES += "opengl"
 
-S = "${WORKDIR}/${BPN}_release-7.6-${PV}"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "\
     --enable-libraries \
@@ -75,5 +73,15 @@ do_compile_prepend () {
 	sed -i -e 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec=""|g' ${B}/${TARGET_SYS}-libtool
 	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/${TARGET_SYS}-libtool
 }
+do_install_append() {
+	if [ -e ${D}${libdir}/systemd/system/boinc-client.service ]; then
+		install -D -m 0644 \
+		${D}${libdir}/systemd/system/boinc-client.service \
+		${D}${systemd_system_unitdir}/boinc-client.service
+		rm -rf ${D}${libdir}/systemd
+	fi
+}
+
+SYSTEMD_SERVICE_${PN} = "boinc-client.service"
 
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
+FILES_${PN} += "${libdir}/systemd"
-- 
2.18.0


