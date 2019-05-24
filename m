Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 495DD7E472
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 04:05:54 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g69so3604727plb.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 21:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gUnCwojxW64s4AKmwKDaZY+hWC/1LuByqwe7zy0qhPo=;
	b=SLWRaJwE84ADUKqPP2OcKIdI8Dz9bCLeA+eaSGZQ1jTjytD4Rw1XDMfS7WIJNIsWD+
	NfW4hvJ9NhAyribpV+Z4UkZ46gGmGd5uqFTmJth6aQ3syRTt29MXKr4ybKTymUdJnlI9
	/w+aQReVmSoKcCZpkEC1Z5DUlSsv+hdsOdV2Rgzj3JigIWPJf7JMyQ48f3i95++1U4PW
	RfZhoZNZy4cl0bHBzmYWVIYPSYlTeiM1Um+TfdMxrkXKKvLRglC78xaTCLqDZGK5p+ut
	M6qeDZFQudwTk+AdSTzg/wzJNtBRooZ8o1lL8JUtao8EgARimZ4D2dB4PWQfhpN8lGXP
	Wuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gUnCwojxW64s4AKmwKDaZY+hWC/1LuByqwe7zy0qhPo=;
	b=FwvvREuk0QAnn8Vpc2CI8fj44JuxaRFxIj67XTSjrEcmu7MuTZNj2/GkyrquBuDVBL
	z7emc5khpU//BfFX4nik7YJctShuII9GGbU+L/DthiAhDy2SXBjWy/hvXaFoDN5zPeNG
	5wDtRsuJ9+1CNntJRAPhX/Z5v1yGLMSDcnYGs0fuQdPu6+gkKZpG2RKeMHC/RVwRzH9U
	9ZSIOS0KbnTrVPBWz08TG65vo/MDL3gTq3ahHD1wCgdP18+3Do4ZEu1v//Sze3KGYL4w
	/Iop6Pvg0hMk2e9o9aJNtIWNcy3j5Wi4PYgnwxQuizpAEi6QUoBiUpJ0x98WT5lEvl4C
	hOuA==
X-Gm-Message-State: APjAAAWsbTfQhPmDLBuxvZ9D1pCgPTSKgj5tEZIGqZ1r0ypj0tdRukFA
	583wid2Tvk0ad98bktFfYVrd8KYhSgI=
X-Google-Smtp-Source: APXvYqyHtD0xSMUstL0p68nQPna702zZW/EWRSVadnKmdiLGnonb+/o6FqC33xpcwt5lxUpJu0uSTA==
X-Received: by 2002:a17:902:3103:: with SMTP id
	w3mr27809578plb.187.1558670754684; 
	Thu, 23 May 2019 21:05:54 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:313d:8ef2:9687:9b74])
	by smtp.gmail.com with ESMTPSA id r1sm995104pfg.65.2019.05.23.21.05.53
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 21:05:54 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
	<20190523064859.24336-9-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8d92d992-cc69-506d-b285-619af7ea266f@gmail.com>
Date: Thu, 23 May 2019 21:05:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190523064859.24336-9-schnitzeltony@gmail.com>
Subject: Re: [PATCH 08/41] evolution-data-server: uprade 3.26.6 -> 3.32.2 and rework
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
X-List-Received-Date: Fri, 24 May 2019 04:05:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

small nit, typo in subject

On 5/22/19 11:48 PM, Andreas Müller wrote:
> * Unfortuantely they stopped maintaing Changelog and suggest to clone the repo.
> * a native variant had to be introduced for code-generator tools
> * gobject-introspection builds theoretically :) Unfortunataelly qemu runs
>    with 100% CPU load and never returns -> disable introspection for now
> * add PACKAGECONFIGs for new dependencies - disabled by default
> * give up fine grained packaging: It was broken over the years completely
>    and nobody seemed to take care.
> * ICU-patch does not apply anymore and it seems upstream has fixed issues
>    with ICU
> * add upstream-version-is-even to inherit
> * rename folder containing recipe
> * get rid of gconf dependency
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...nded-way-to-handle-the-icu-namespace.patch |  46 -------
>   .../evolution-data-server-native.bb           |  23 ++++
>   .../evolution-data-server.bb}                 | 123 +++++-------------
>   .../evolution-data-server.inc                 |  16 +++
>   ...keLists.txt-Remove-TRY_RUN-for-iconv.patch |  24 ++--
>   ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch |   0
>   ...the-Novell-sample-contact-with-somet.patch |   0
>   ...abi-from-the-default-C-warning-flags.patch |  29 +++++
>   .../0005-call-native-helpers.patch            |  45 +++++++
>   .../evolution-data-server/iconv-detect.h      |   0
>   10 files changed, 158 insertions(+), 148 deletions(-)
>   delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
>   rename meta-gnome/recipes-gnome/{eds/evolution-data-server_3.26.6.bb => evolution-data-server/evolution-data-server.bb} (15%)
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch (59%)
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch (100%)
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch (100%)
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-I-94-Remove-Wabi-from-the-default-C-warning-flags.patch
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-call-native-helpers.patch
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/iconv-detect.h (100%)
> 
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
> deleted file mode 100644
> index d3b0ac673..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 698a0e104dcbe4b630df848fd4af7c59f76cdc37 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 5 May 2018 17:46:52 -0700
> -Subject: [PATCH] Use recommended way to handle the icu namespace
> -
> -Fixes build with icu >= 61
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/libedataserver/e-alphabet-index-private.cpp | 2 ++
> - src/libedataserver/e-transliterator-private.cpp | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/src/libedataserver/e-alphabet-index-private.cpp b/src/libedataserver/e-alphabet-index-private.cpp
> -index d3e44f4..ddffd99 100644
> ---- a/src/libedataserver/e-alphabet-index-private.cpp
> -+++ b/src/libedataserver/e-alphabet-index-private.cpp
> -@@ -33,9 +33,11 @@
> -
> - /* ICU headers */
> - #include <unicode/alphaindex.h>
> -+#include <unicode/ustring.h>
> -
> - using icu::AlphabeticIndex;
> - using icu::Locale;
> -+using U_ICU_NAMESPACE::UnicodeString;
> -
> - struct _EAlphabetIndex {
> - 	AlphabeticIndex *priv;
> -diff --git a/src/libedataserver/e-transliterator-private.cpp b/src/libedataserver/e-transliterator-private.cpp
> -index bb15593..573446f 100644
> ---- a/src/libedataserver/e-transliterator-private.cpp
> -+++ b/src/libedataserver/e-transliterator-private.cpp
> -@@ -33,8 +33,10 @@
> -
> - /* ICU headers */
> - #include <unicode/translit.h>
> -+#include <unicode/ustring.h>
> -
> - using icu::Transliterator;
> -+using U_ICU_NAMESPACE::UnicodeString;
> -
> - struct _ETransliterator {
> - 	Transliterator *priv;
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
> new file mode 100644
> index 000000000..681a61c33
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
> @@ -0,0 +1,23 @@
> +require ${BPN}.inc
> +
> +inherit native
> +
> +DEPENDS = "glib-2.0-native"
> +
> +# build native helpers
> +do_compile() {
> +    cd ${S}/src/camel
> +    sed -i 's:#include "evolution-data-server-config.h"::g' camel-gen-tables.c
> +    ${CC} -o ${B}/camel-gen-tables camel-gen-tables.c ${CFLAGS} ${LDFLAGS}
> +
> +    LDFLAGS_glib=`pkg-config glib-2.0 --libs`
> +    CFLAGS_glib=`pkg-config glib-2.0 --cflags`
> +    cd ${S}/src/addressbook/libebook-contacts
> +    sed -i 's:#include "evolution-data-server-config.h"::g' gen-western-table.c
> +    ${CC} -o ${B}/gen-western-table gen-western-table.c ${CFLAGS} ${CFLAGS_glib} ${LDFLAGS} ${LDFLAGS_glib}
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${B}/* ${D}${bindir}
> +}
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> similarity index 15%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> index 1949fc7fd..5f535c1b5 100644
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> @@ -1,51 +1,48 @@
> -SUMMARY = "Evolution database backend server"
> -HOMEPAGE = "http://www.gnome.org/projects/evolution/"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "LGPLv2 & LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
> -                    file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
> -                    file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543 \
> -                    file://src/calendar/libecal/e-cal.h;endline=24;md5=e699ec3866f73f129f7a4ffffdcfc196"
> +require ${BPN}.inc
>   
>   DEPENDS = " \
> -    intltool-native gperf-native \
> -    glib-2.0 gtk+3 gconf libgnome-keyring libgdata \
> +    ${BPN}-native intltool-native gperf-native \
> +    glib-2.0 gtk+3 libgdata \
>       dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
>   "
>   
> -inherit distro_features_check gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative
> +inherit distro_features_check cmake gtk-doc gettext gobject-introspection perlnative pythonnative
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> -SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
> -           file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
> -           file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
> -           file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
> -           file://iconv-detect.h \
> -           file://0004-Use-recommended-way-to-handle-the-icu-namespace.patch \
> -           "
> -SRC_URI[archive.md5sum] = "ae7bbf543b2c3ff79af27e0edea5d472"
> -SRC_URI[archive.sha256sum] = "e43aa1847ddc02965f560261ef88d18fb8704eddaa55555bf96b884a33e510ec"
> +SRC_URI += " \
> +    file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
> +    file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
> +    file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
> +    file://0004-I-94-Remove-Wabi-from-the-default-C-warning-flags.patch \
> +    file://0005-call-native-helpers.patch \
> +    file://iconv-detect.h \
> +"
>   
>   LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
>   LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
>   
> +# For arm qemu-arm runs at 100% CPU load and never returns - so disable introspection for now
> +GI_DATA_ENABLED="False"
> +
>   EXTRA_OECMAKE = " \
> +    -DSYSCONF_INSTALL_DIR=${sysconfdir} \
>       -DWITH_KRB5=OFF \
>       -DENABLE_GOA=OFF \
>       -DENABLE_UOA=OFF \
>       -DENABLE_GOOGLE_AUTH=OFF \
>       -DENABLE_WEATHER=OFF \
> +    -DENABLE_INTROSPECTION=${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'ON', 'OFF', d)} \
>       -D${LKSTRFTIME} \
>       -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
>   "
>   
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
> +PACKAGECONFIG[canberra] = "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
> +PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,webkitgtk json-glib"
>   
> -EXTRA_OECONF = "--with-libdb=${STAGING_DIR_HOST}${prefix} \
> -                --disable-nntp --disable-gtk-doc"
> +# BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs when
> +# searching for openldap-libs
> +PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
>   
>   # -ldb needs this on some platforms
>   LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
> @@ -55,78 +52,20 @@ do_configure_append () {
>   
>       # fix native perl shebang
>       sed -i 's:${STAGING_BINDIR_NATIVE}/perl-native:${bindir}:' ${B}/src/tools/addressbook-export/csv2vcard
> +
> +    # fix abs path for g-ir-scanner-wrapper
> +    sed  -i ${B}/build.ninja \
> +        -e 's: ${bindir}/g-ir-scanner-wrapper: ${STAGING_BINDIR}/g-ir-scanner-wrapper:g'
>   }
>   
>   do_compile_prepend() {
>       export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
>   }
>   
> +FILES_${PN} =+ " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/evolution-data-server-*/ui/ \
> +    ${systemd_user_unitdir} \
> +"
>   
> -PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
> -             libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
> -             libedataserver libedataserver-dev \
> -             libedataserverui libedataserverui-dev"
> -
> -FILES_${PN} =+ "${systemd_user_unitdir} \
> -                ${datadir}/dbus-1 \
> -                ${datadir}/evolution-data-server-*/ui/"
>   RDEPENDS_${PN} += "perl"
> -
> -FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
> -FILES_${PN}-dbg =+ "${libdir}/evolution-data-server*/camel-providers/.debug \
> -                    ${libdir}/evolution-data-server*/calendar-backends/.debug \
> -                    ${libdir}/evolution-data-server*/addressbook-backends/.debug \
> -                    ${libdir}/evolution-data-server*/extensions/.debug/"
> -
> -RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"
> -
> -FILES_libcamel = "${libdir}/libcamel-*.so.* \
> -                  ${libdir}/libcamel-provider-*.so.* \
> -                  ${libdir}/evolution-data-server*/camel-providers/*.so \
> -                  ${libdir}/evolution-data-server*/camel-providers/*.urls"
> -FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
> -                      ${libdir}/pkgconfig/camel*pc \
> -                      ${libdir}/evolution-data-server*/camel-providers/*.la \
> -                      ${includedir}/evolution-data-server*/camel"
> -
> -FILES_libebook = "${libdir}/libebook-*.so.*"
> -FILES_libebook-dev = "${libdir}/libebook-1.2.so \
> -                      ${libdir}/pkgconfig/libebook-*.pc \
> -                      ${includedir}/evolution-data-server*/libebook/*.h"
> -RRECOMMENDS_libebook = "libedata-book"
> -
> -FILES_libecal = "${libdir}/libecal-*.so.* \
> -                 ${datadir}/evolution-data-server-1.4/zoneinfo"
> -FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
> -                     ${includedir}/evolution-data-server*/libecal/*.h \
> -                     ${includedir}/evolution-data-server*/libical/*.h"
> -RRECOMMENDS_libecal = "libedata-cal tzdata"
> -
> -FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
> -                       ${datadir}/dbus-1/services/*.AddressBook.service \
> -                       ${libdir}/libedata-book-*.so.* \
> -                       ${libdir}/evolution-data-server-*/extensions/libebook*.so \
> -                       ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
> -FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
> -                           ${libdir}/pkgconfig/libedata-book-*.pc \
> -                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
> -                           ${includedir}/evolution-data-server-*/libedata-book"
> -
> -FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
> -                      ${datadir}/dbus-1/services/*.Calendar.service \
> -                      ${libdir}/libedata-cal-*.so.* \
> -                      ${libdir}/evolution-data-server-*/extensions/libecal*.so"
> -FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
> -                          ${libdir}/pkgconfig/libedata-cal-*.pc \
> -                          ${includedir}/evolution-data-server-*/libedata-cal \
> -                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"
> -
> -FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
> -FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
> -                            ${libdir}/pkgconfig/libedataserver-*.pc \
> -                            ${includedir}/evolution-data-server-*/libedataserver/*.h"
> -
> -FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* ${datadir}/evolution-data-server-1.4/glade/*.glade"
> -FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
> -                              ${libdir}/pkgconfig/libedataserverui-*.pc \
> -                              ${includedir}/evolution-data-server-*/libedataserverui/*.h"
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> new file mode 100644
> index 000000000..2ea94920b
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> @@ -0,0 +1,16 @@
> +SUMMARY = "Evolution database backend server"
> +HOMEPAGE = "http://www.gnome.org/projects/evolution/"
> +BUGTRACKER = "https://bugzilla.gnome.org/"
> +
> +LICENSE = "LGPLv2 & LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
> +                    file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
> +                    file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543 \
> +                    file://src/calendar/libecal/e-cal.h;endline=24;md5=e699ec3866f73f129f7a4ffffdcfc196"
> +
> +inherit gnomebase
> +
> +SRC_URI[archive.md5sum] = "965648316c7cee06f49878eceed5da01"
> +SRC_URI[archive.sha256sum] = "7ea7491065fd0382f2268cf6bf95331a75dfda587d5940deb47f9e74be1ab3c9"
> +PV = "3.32.2"
> +
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> similarity index 59%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> index a821a14ab..e8c6d6a76 100644
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> @@ -1,6 +1,6 @@
>   From 131b88a81aba3d72d566bc8a9d968941a98e0007 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> -Date: Tue, 19 Dec 2017 16:37:20 +0100
> +Date: Sun, 31 Mar 2019 18:11:55 +0200
>   Subject: [PATCH] CMakeLists.txt: Remove TRY_RUN for iconv
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
> @@ -13,20 +13,24 @@ Upstream-Status: Inappropriate [OE specific]
>   
>   Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>   ---
> - CMakeLists.txt | 5 -----
> - 1 file changed, 5 deletions(-)
> + CMakeLists.txt | 11 -----------
> + 1 file changed, 11 deletions(-)
>   
>   diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 8d07772..a2396f2 100644
> +index 1672daf..0b3e4e0 100644
>   --- a/CMakeLists.txt
>   +++ b/CMakeLists.txt
> -@@ -521,13 +521,8 @@ if(NOT HAVE_ICONV)
> +@@ -524,17 +524,6 @@ if(NOT HAVE_ICONV)
> + 	message(FATAL_ERROR "You need to install a working iconv implementation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
>    endif(NOT HAVE_ICONV)
>    
> - set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
> --CHECK_C_SOURCE_RUNS("#include \"${CMAKE_SOURCE_DIR}/iconv-detect.c\"" _correct_iconv)
> - unset(CMAKE_REQUIRED_LIBRARIES)
> -
> +-set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
> +-file(TO_NATIVE_PATH "${CMAKE_BINARY_DIR}/" _binary_dir_with_separator)
> +-CHECK_C_SOURCE_RUNS("#define ICONV_DETECT_BUILD_DIR \"${_binary_dir_with_separator}\"
> +-		     #include \"${CMAKE_SOURCE_DIR}/iconv-detect.c\"" _correct_iconv)
> +-unset(_binary_dir_with_separator)
> +-unset(CMAKE_REQUIRED_LIBRARIES)
> +-
>   -if(NOT _correct_iconv)
>   -	message(FATAL_ERROR "You need to install a working iconv implementation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
>   -endif(NOT _correct_iconv)
> @@ -35,5 +39,5 @@ index 8d07772..a2396f2 100644
>    # Backtraces for debugging
>    # ******************************
>   --
> -2.14.3
> +2.20.1
>   
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
> similarity index 100%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
> similarity index 100%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-I-94-Remove-Wabi-from-the-default-C-warning-flags.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-I-94-Remove-Wabi-from-the-default-C-warning-flags.patch
> new file mode 100644
> index 000000000..8cfc1f8d6
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-I-94-Remove-Wabi-from-the-default-C-warning-flags.patch
> @@ -0,0 +1,29 @@
> +From 3cfeb3c7f458c6fe40c67cea43987b45cf6cbeaf Mon Sep 17 00:00:00 2001
> +From: Milan Crha <mcrha@redhat.com>
> +Date: Thu, 14 Mar 2019 14:16:56 +0100
> +Subject: [PATCH] I#94 - Remove -Wabi from the default C++ warning flags
> +
> +Closes https://gitlab.gnome.org/GNOME/evolution-data-server/issues/94
> +
> +Upstream-Status: Applied [1]
> +
> +[1] https://gitlab.gnome.org/GNOME/evolution-data-server/commit/3cfeb3c7f458c6fe40c67cea43987b45cf6cbeaf
> +---
> + cmake/modules/SetupBuildFlags.cmake | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/cmake/modules/SetupBuildFlags.cmake b/cmake/modules/SetupBuildFlags.cmake
> +index 4c6154129..284445455 100644
> +--- a/cmake/modules/SetupBuildFlags.cmake
> ++++ b/cmake/modules/SetupBuildFlags.cmake
> +@@ -56,7 +56,6 @@ macro(setup_build_flags _maintainer_mode)
> +
> + 	list(APPEND proposed_cxx_flags
> + 		${proposed_flags}
> +-		-Wabi
> + 		-Wnoexcept
> + 	)
> +
> +--
> +2.20.1
> +
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-call-native-helpers.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-call-native-helpers.patch
> new file mode 100644
> index 000000000..e320f6342
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-call-native-helpers.patch
> @@ -0,0 +1,45 @@
> +From 9c375e3fcf8ff778a5010a07a7da4b6a58adec7c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Sun, 31 Mar 2019 19:11:31 +0200
> +Subject: [PATCH] call native helpers
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate[oe-specific]
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + src/addressbook/libebook-contacts/CMakeLists.txt | 2 +-
> + src/camel/CMakeLists.txt                         | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/addressbook/libebook-contacts/CMakeLists.txt b/src/addressbook/libebook-contacts/CMakeLists.txt
> +index e9e3259..e749d1b 100644
> +--- a/src/addressbook/libebook-contacts/CMakeLists.txt
> ++++ b/src/addressbook/libebook-contacts/CMakeLists.txt
> +@@ -25,7 +25,7 @@ target_link_libraries(gen-western-table
> +
> + add_custom_command(
> + 	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
> +-	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gen-western-table "${CMAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
> ++	COMMAND gen-western-table "${CMAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
> + 	DEPENDS gen-western-table e-name-western-tables.h.in
> + )
> +
> +diff --git a/src/camel/CMakeLists.txt b/src/camel/CMakeLists.txt
> +index be626a8..14ac8b8 100644
> +--- a/src/camel/CMakeLists.txt
> ++++ b/src/camel/CMakeLists.txt
> +@@ -10,7 +10,7 @@ target_include_directories(camel-gen-tables PUBLIC
> +
> + add_custom_command(
> + 	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
> +-	COMMAND ${CMAKE_CURRENT_BINARY_DIR}/camel-gen-tables >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
> ++	COMMAND camel-gen-tables >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
> + 	DEPENDS camel-gen-tables
> + )
> +
> +--
> +2.20.1
> +
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/iconv-detect.h
> similarity index 100%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/iconv-detect.h
> 

