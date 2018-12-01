Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id B98FB6D65A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 05:46:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k12so8379779qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 21:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IWGVotMTjG2ve/F5jkmNllPFMU+wWOHnhWfCy31UdbQ=;
	b=qCHeYYNUZG/y4xwsX7654QlkCjfk3tlui+WK3dLsjXBwG0FTZPM4yPkDN6UZIy8/j3
	rJxc09Au5tgZYb6DjjU/rwRzASBRTdiZWj2NkXZdlbY21PEJ4nez0GbWPfdlJGbKzcp/
	MIKsNo4vjBjGvCvV6lhvwI+EnM6juZv/RVhEwo2v0HakOUoJLsqm06BUeODH0AFfvTYn
	zWIcBeoZmrWwl56lcmfc3gDxiKFAZC6CWRZDCTsjktifwBYG3YiPL3Gy+V/a45frQ3hK
	Ob2Lltk39ixhJnjSCHhSNIT6S/GEgd6GmIwCWf0u0wiDx+Qtd8gOKJ4wuoTK/26cXs7L
	x77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IWGVotMTjG2ve/F5jkmNllPFMU+wWOHnhWfCy31UdbQ=;
	b=MmMAh+nvxSSvDPuel25ofmWim1MRw5DfiYj/I9LxTnS+rFwKlXAZgajVuhbUs/z5Jh
	juIZXgAalmVVw3YkiHtGVFU/AGH+iAkNEhb1kSxLM/30AXg0BkQRmqO4AcwyVIYt9ra/
	7c4ZKcZC/Ftha6+TY+H6JKfSR4HwK6atAUCBGp3sx4nlc6RSfEMsrZrWhdvoMLn3/j6F
	1aMDttsR2agfPFbfqQXntxKjhBF5CS2P6sBVPN2Qf8cA2e8R1BtphGiTtSUcH/f21UjB
	eh/NeZq1rfGFnFxHw1Cp95/oCJjwCw3WlkDlK1Nt/b8l74ChFaQeH3XAW9lkQ9N0KB74
	r0lA==
X-Gm-Message-State: AA+aEWaY2+QeP0TmT3GEJO6jyz8vooqUNV8Vt5Ki2BFJKjgsrTINktLI
	E3gh096PbHo/TxlLFeuYSSjQqXy3pBagkb1VvbczhiOs
X-Google-Smtp-Source: AFSGD/Uc2hWeu7+cDepehAbliCLfglg72LMNdMs7ybYDpQIGWBV5cXnK4MvNT23ZowVapll+IeFh/mJ8VCPfqdaY1Ic=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr8042233qvd.224.1543643181189; 
	Fri, 30 Nov 2018 21:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20181122135127.60927-1-martin@geanix.com>
	<20181122141255.61221-1-martin@geanix.com>
In-Reply-To: <20181122141255.61221-1-martin@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Nov 2018 21:45:55 -0800
Message-ID: <CAMKF1sqvhZXhNcHbNyTUZQoRM8i4Mv5XVrdydvoLAKOQsn2dvA@mail.gmail.com>
To: martin@geanix.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv4] iwd: add version 0.12
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
X-List-Received-Date: Sat, 01 Dec 2018 05:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin

I merged an older version of this patch.  Can you please send a followup
which addresses the changes up until v4 ?
On Thu, Nov 22, 2018 at 6:13 AM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> The iwd wireless daemon is an alternative to wpa_supplicant. It is
> controlled using the iwctl command line client (or the dbus interface).
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>
> Changes since v3:
> - Update patch upstream status to backport
>
> Changes since v2:
> - add patch to make client unit test depend on packageconfig
> - remove split of packages
>
> Changes since v1:
> - add packageconfig for client, ead, and ofono
> - split out packages for iwctl, ead, and iwmon
> - add ptest support
>
>  ...ient-unit-test-conditional-on-enable.patch | 59 +++++++++++++++++++
>  ...ble-serial-tests-in-automake-to-supp.patch | 32 ++++++++++
>  .../recipes-connectivity/iwd/iwd/run-ptest    | 30 ++++++++++
>  meta-oe/recipes-connectivity/iwd/iwd_0.12.bb  | 43 ++++++++++++++
>  4 files changed, 164 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile-ma=
ke-client-unit-test-conditional-on-enable.patch
>  create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-configure.a=
c-enable-serial-tests-in-automake-to-supp.patch
>  create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/run-ptest
>  create mode 100644 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile-make-clie=
nt-unit-test-conditional-on-enable.patch b/meta-oe/recipes-connectivity/iwd=
/iwd/0001-Makefile-make-client-unit-test-conditional-on-enable.patch
> new file mode 100644
> index 000000000..7a39d05e5
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile-make-client-unit=
-test-conditional-on-enable.patch
> @@ -0,0 +1,59 @@
> +From b327b775db4e250d3448ab30ce97ca0acfea7603 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
> +Date: Thu, 22 Nov 2018 14:31:11 +0100
> +Subject: [PATCH] Makefile: make client unit test conditional on
> + --{enable,disable}-client
> +To: iwd@lists.01.org
> +
> +The iwctl client and its unit test depends on readline. If building on a
> +host without readline installed, default make target succeeds when
> +configured with --disable-client, but the following make check target
> +fails.
> +
> +Fix this by making the test-client target conditional on the
> +--{enable,disable}-client configure flag.
> +
> +Upstream-Status: Backport [c4803d3b12010292d719cc3bcf694def5b6eeee8]
> +Signed-Off-By: Martin Hundeb=C3=B8ll <martin@geanix.com>
> +
> +---
> + Makefile.am | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index db64c38..262e80d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -297,9 +297,11 @@ unit_tests =3D unit/test-cmac-aes \
> +               unit/test-crypto unit/test-eapol unit/test-mpdu \
> +               unit/test-ie unit/test-ssid-to-utf8 unit/test-ssid-securi=
ty \
> +               unit/test-arc4 unit/test-wsc unit/test-eap-mschapv2 \
> +-              unit/test-eap-sim unit/test-client unit/test-ecc \
> +-              unit/test-sae
> ++              unit/test-eap-sim unit/test-ecc unit/test-sae
> +
> ++if CLIENT
> ++unit_tests +=3D unit/test-client
> ++endif
> +
> + ell_pem_files =3D cert-ca-key.pem cert-client-key.pem cert-client-key-p=
kcs8.pem \
> +               cert-server-key.pem cert-server-key-pkcs8.pem \
> +@@ -404,6 +406,7 @@ unit_test_eap_mschapv2_SOURCES =3D src/eap-mschapv2.=
h src/eap-mschapv2.c \
> +                               unit/test-eap-mschapv2.c
> + unit_test_eap_mschapv2_LDADD =3D $(ell_ldadd)
> +
> ++if CLIENT
> + unit_test_client_SOURCES =3D unit/test-client.c \
> +                               client/adapter.c \
> +                               client/agent.h client/agent.c \
> +@@ -414,6 +417,7 @@ unit_test_client_SOURCES =3D unit/test-client.c \
> +                               client/network.h client/network.c \
> +                               client/properties.h client/properties.c
> + unit_test_client_LDADD =3D $(ell_ldadd) -lreadline
> ++endif
> +
> + unit_test_ecc_SOURCES =3D unit/test-ecc.c src/ecc.c src/ecc.h
> + unit_test_ecc_LDADD =3D $(ell_ldadd)
> +--
> +2.19.1
> +
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-configure.ac-enabl=
e-serial-tests-in-automake-to-supp.patch b/meta-oe/recipes-connectivity/iwd=
/iwd/0001-configure.ac-enable-serial-tests-in-automake-to-supp.patch
> new file mode 100644
> index 000000000..f9f073056
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-configure.ac-enable-seria=
l-tests-in-automake-to-supp.patch
> @@ -0,0 +1,32 @@
> +From 06a21885b89675ba094b573d5af8aa74729111d6 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
> +Date: Thu, 22 Nov 2018 10:03:09 +0100
> +Subject: [PATCH] configure.ac: enable serial-tests in automake to suppor=
t
> + ptest
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> +---
> + configure.ac | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8deb53a..1a5330b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -6,7 +6,8 @@ AC_CONFIG_AUX_DIR(build-aux)
> + AC_CONFIG_MACRO_DIR(build-aux)
> +
> + AM_INIT_AUTOMAKE([foreign subdir-objects color-tests silent-rules
> +-                                      tar-pax no-dist-gzip dist-xz])
> ++                                      tar-pax no-dist-gzip dist-xz
> ++                                      serial-tests])
> +
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> +
> +--
> +2.19.1
> +
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd/run-ptest b/meta-oe/rec=
ipes-connectivity/iwd/iwd/run-ptest
> new file mode 100644
> index 000000000..f2db136b1
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iwd/iwd/run-ptest
> @@ -0,0 +1,30 @@
> +#!/bin/sh
> +
> +run_test() {
> +    test=3D$1
> +    name=3D$(basename $1)
> +
> +    log=3D$(./$test)
> +    res=3D$(echo $?)
> +
> +    # check for skipped test
> +    case "$log" in
> +        *skipping*)
> +            echo "SKIP: $name"
> +            return
> +            ;;
> +    esac
> +
> +    # check for passed / failed
> +    if [[ "$res" -eq "0" ]]; then
> +        echo "PASS: $name"
> +    else
> +        echo "FAIL: $name"
> +    fi
> +}
> +
> +for path in tests/*; do
> +    run_test $path
> +done
> +
> +exit 0
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_0.12.bb
> new file mode 100644
> index 000000000..c9aec91ce
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION =3D "Wireless daemon for Linux"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb504b67c50331fc78734fed90fb0=
e09"
> +
> +inherit autotools pkgconfig systemd ptest
> +
> +DEPENDS =3D "ell dbus"
> +
> +SRC_URI =3D " \
> +    git://git.kernel.org/pub/scm/network/wireless/iwd.git \
> +    file://0001-configure.ac-enable-serial-tests-in-automake-to-supp.pat=
ch \
> +    file://0001-Makefile-make-client-unit-test-conditional-on-enable.pat=
ch \
> +    file://run-ptest \
> +"
> +SRCREV =3D "d7609915db4b57229f7dd4c04b4eabcce637872a"
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??=3D "client ${@bb.utils.filter('DISTRO_FEATURES', 'syste=
md', d)} wired ofono"
> +PACKAGECONFIG[client] =3D "--enable-client,--disable-client,readline"
> +PACKAGECONFIG[systemd] =3D "--enable-systemd-service,--disable-systemd-s=
ervice,systemd"
> +PACKAGECONFIG[wired] =3D "--enable-wired,--disable-wired"
> +PACKAGECONFIG[ofono] =3D "--enable-ofono,--disable-ofono"
> +
> +EXTRA_OECONF +=3D "--enable-external-ell"
> +
> +do_configure_prepend () {
> +    mkdir -p ${S}/build-aux
> +}
> +
> +do_compile_ptest() {
> +    oe_runmake buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    # remove intermediate object files
> +    rm -f ${B}/unit/*.o
> +    install -D -t ${D}${PTEST_PATH}/tests ${B}/unit/*
> +}
> +
> +# iwd service
> +SYSTEMD_SERVICE_${PN} =3D "iwd.service"
> +SYSTEMD_SERVICE_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'wired=
', 'ead.service', '', d)}"
> +FILES_${PN} +=3D "${datadir}/dbus-1/"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

