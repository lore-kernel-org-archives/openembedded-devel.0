Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4E85D78499
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 13:05:36 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id l11so479005uaf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8s1JEL4IkE9euCptQgUE85uSkKkATK1nTcLlBfD7Gz0=;
	b=oBLoq5W0DsNDxE5y6Hm4TG/KiWx4dF5HN9fQbIBRk5/rlL6NzssXU2ZWI/5DpGZJkq
	H0+Mf6xVeXS7jVbXDaDCD2ADFnpLNiDoDnxO0w8OFO0TSkxeOgu01wyV6jdrLKEdqPRP
	/rz+ANlyWN32biix+rYb6Oxkk+r1R+mpnYSlMtK84lw1mmN8fovLQBzehdxq5CBtwz8F
	fG6FdIRRSpR+PXiMl2PrgE6X8oEk+kzLMy4CBJHsHwgjtLr8pkZ2F1SJCYXMQdKA5NQd
	muPBugkN2FldxqVafkjL6ycU/dhZiLvn1ya9b0DZzRxoA5udHEqYnu+1mZJmpA/U9z4l
	guJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8s1JEL4IkE9euCptQgUE85uSkKkATK1nTcLlBfD7Gz0=;
	b=R/YiDBoPlGg5VtgpdIqTlgpWfGRFEQUociTkb5CSgxqU8xU/fBIQ+h3TglVwemJupi
	XaYuuM4G9T4hSOZMy9Ma/ARWvzzySScHDyJ+Ixkwpx2+sZ9d/0GUSSn6H+RZ1tymPYnd
	MM+yK3r+OBZniv+cjvxW9D5ih20qyMUJ7qaFAVg4mwB583h+tLmupXprq4AXKVYZeAQ9
	y4E4hif93UN41lMjTMDRU5LW0S2zGm5JYfrz/W7AkGuMsyU1NRBzlbxjcb/TDSyympfp
	EwaonNhaE1ivM83AwZlIyvycEL8RyptHarIYEDsbzFZe9jC+lhhirZkFzqunglLNLuuj
	kHow==
X-Gm-Message-State: AHPjjUgEZH4M8tdBGMonk40FjIiLFHSkSNzSFYr3sH8IbBGYB6Y1pjCN
	pRG5lyTzyz7kzaGGyxsv0/+CZ7C4yg==
X-Google-Smtp-Source: ADKCNb5M9ygM2xz9t0T1kh5XXDNxiIk7p9PxemSdUBNqeVlhDo9Jcs5vlM2hQwO2Ce1TBiVVHtJ6ful1p+Y81qNQwW0=
X-Received: by 10.159.48.80 with SMTP id i16mr978386uab.191.1504271137678;
	Fri, 01 Sep 2017 06:05:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Fri, 1 Sep 2017 06:05:36 -0700 (PDT)
In-Reply-To: <20170831020401.6367-1-raj.khem@gmail.com>
References: <20170831020401.6367-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Sep 2017 15:05:36 +0200
Message-ID: <CA+chaQdT78AE7OJagPnp3W93PYwL5kdGBe8Dz12h+tXf9udnyg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/4] ntop: Fix build with musl
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
X-List-Received-Date: Fri, 01 Sep 2017 13:05:37 -0000
Content-Type: text/plain; charset="UTF-8"

added .patch file fails to apply in master-next:
http://errors.yoctoproject.org/Errors/Details/154751/

On Thu, Aug 31, 2017 at 4:03 AM, Khem Raj <raj.khem@gmail.com> wrote:

> move away from .inc file, when its included in single recipe
> helps with devtool workflow too.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-support/ntop/ntop.inc      | 131
> --------------------
>  .../ntop/ntop/0001-nDPI-Include-sys-types.h.patch  |  24 ++++
>  .../recipes-support/ntop/ntop/support-arm64.patch  |  28 -----
>  meta-networking/recipes-support/ntop/ntop_5.0.1.bb | 135
> ++++++++++++++++++++-
>  4 files changed, 158 insertions(+), 160 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop.inc
>  create mode 100644 meta-networking/recipes-support/ntop/ntop/0001-nDPI-
> Include-sys-types.h.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/support-
> arm64.patch
>
> diff --git a/meta-networking/recipes-support/ntop/ntop.inc
> b/meta-networking/recipes-support/ntop/ntop.inc
> deleted file mode 100644
> index b96433425..000000000
> --- a/meta-networking/recipes-support/ntop/ntop.inc
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -SUMMARY = "ntop is network top"
> -DESCRIPTION = "ntop is a network traffic probe that shows the network
> usage, \
> -similar to what the popular top Unix command does."
> -
> -SECTION = "console/network"
> -
> -LICENSE = "GPLv2+ & GPLv3 & OpenSSL"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://LICENSE-OpenSSL.txt;md5=
> a409f902e447ddd889cffa0c70e7c7c2 \
> -                   "
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
> -           file://ntop_configure_in.patch \
> -           file://ntop_init.patch \
> -           file://ntop_webInterface.patch \
> -           file://ntop_configure_in_net_snmp_config_exist.patch \
> -           file://ntop.service \
> -           file://use-static-inline.patch \
> -           file://support-arm64.patch \
> -          "
> -
> -inherit autotools-brokensep useradd pythonnative pkgconfig systemd
> -
> -DEPENDS = "geoip rrdtool python zlib libpcap gdbm"
> -
> -PACKAGECONFIG ??= "openssl snmp plugins"
> -PACKAGECONFIG[openssl] = "--with-ssl, --without-ssl, openssl, openssl"
> -PACKAGECONFIG[snmp] = "--enable-snmp=yes NETSNMP=${STAGING_BINDIR_CROSS}/net-snmp-config,
> \
> ---disable-snmp,net-snmp,"
> -PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
> -
> -EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no"
> -
> -do_configure() {
> -    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
> -    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.m4
> -    cp 3rd_party/* ./
> -
> -    # config nDPI
> -    cd nDPI
> -    ./configure ${CONFIGUREOPTS} --with-pic
> -    cd ..
> -
> -    sed -i -e 's:^CFG_DBFILE_DIR=$localstatedir/ntop:CFG_DBFILE_DIR=$localstatedir/lib/ntop:'
> ${S}/configure.in
> -
> -    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
> -    sed -i \
> -        -e 's:\(^CFLAGS="\$.*\) -I/usr/local/include
> -I/opt/local/include":\1":' \
> -        -e 's:\(^CPPFLAGS="\$.*\) -I/usr/local/include
> -I/opt/local/include":\1":' \
> -        -e 's:\(^LDFLAGS="\$.*\) -L/usr/local/lib -L/opt/local/lib":\1":'
> \
> -        ${S}/configure.in
> -
> -    # replace the DISTRO RELEASE in configure.in which are host's
> -    # with our release, although those doesn't affect functionality
> -    sed -i -e \
> -        '/DEFINEOS="LINUX"/{N;s/DISTRO=.*/DISTRO="${DISTRO}"/;
> N;s/RELEASE=.*/RELEASE="${DISTRO_VERSION}"/;}' \
> -        ${S}/configure.in
> -
> -    # osName in original configure.in should be ${TARGET_SYS}
> -    # which will show in ntop's "show configuration"
> -    sed -i -e \
> -        's:^osName=.*:osName=${TARGET_SYS}:' \
> -        ${S}/configure.in
> -
> -    # rename configureextra to configureextra_rename to avoid
> -    # configure.in to guess host OS and pull in more configure, non
> needed
> -    # which will cause some cross-compiling failure on specific host
> -    # e.g. SUSE(SLED...)
> -    test ! -f configureextra || mv -f configureextra configureextra_rename
> -
> -    # make sure configure finds python includdirs/libs with these envs
> -    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        STAGING_INCDIR=${STAGING_INCDIR} \
> -        STAGING_LIBDIR=${STAGING_LIBDIR}
> -
> -    autotools_do_configure
> -}
> -
> -do_compile_prepend() {
> -    cd nDPI
> -    oe_runmake
> -    cd ..
> -}
> -
> -do_install_append() {
> -    # remove the empty dirs
> -    rm -rf ${D}${libdir}/plugins
> -
> -    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
> -        ${D}${sysconfdir}/init.d/ntop
> -    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
> -        ${D}${sysconfdir}/ntop.conf
> -
> -    # change ntop dir in ntop.conf
> -    # don't use the -P as the ntop.init didn't support it
> -    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path
> /var/lib/ntop:" \
> -        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
> -        ${D}${sysconfdir}/ntop.conf
> -
> -    # For systemd
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> -        install -D -m 0755 ${S}/packages/RedHat/ntop.init
> ${D}${libexecdir}/ntop-helper
> -        install -D -m 0644 ${WORKDIR}/ntop.service
> ${D}${systemd_system_unitdir}/ntop.service
> -        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
> -            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -            ${D}${systemd_system_unitdir}/ntop.service
> -    fi
> -
> -    # Fix host-user-contaminated issue
> -    chown -R root:root ${D}
> -
> -    chown -R ntop.ntop ${D}${datadir}/ntop
> -    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
> -}
> -
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM_${PN} = "-M -g ntop -r -d ${localstatedir}/lib/ntop \
> --s /usr/sbin/nologin -c 'ntop' ntop"
> -GROUPADD_PARAM_${PN} = "-r ntop"
> -
> -SYSTEMD_SERVICE_${PN} = "ntop.service"
> -SYSTEMD_AUTO_ENABLE = "disable"
> -
> -FILES_${PN}_append = "${libdir}/ntop/plugins ${libdir}/libntop-*.so \
> -                      ${libdir}/libntopreport-*.so
> ${libdir}/lib*-${PV}.so"
> -FILES_${PN}-dev = "${includedir} ${libdir}/libntop.so \
> -                   ${libdir}/libntopreport.so \
> -                   ${libdir}/libnetflowPlugin.so
> ${libdir}/libsflowPlugin.so \
> -                   ${libdir}/librrdPlugin.so \
> -                   ${libdir}/*.a ${libdir}/libntopreport.a ${libdir}/*.la"
> -
> diff --git a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
> b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-
> Include-sys-types.h.patch
> new file mode 100644
> index 000000000..3a6a76120
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-
> Include-sys-types.h.patch
> @@ -0,0 +1,24 @@
> +From 6543f3e2d5fe214e2fc6c050289bf1ae73b18724 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 30 Aug 2017 13:56:24 -0700
> +Subject: [PATCH] nDPI: Include sys/types.h
> +
> +Needed for uint_t types
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + nDPI/src/include/ipq_api.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +Index: ntop-5.0.1/nDPI/src/include/ipq_api.h
> +===================================================================
> +--- ntop-5.0.1.orig/nDPI/src/include/ipq_api.h
> ++++ ntop-5.0.1/nDPI/src/include/ipq_api.h
> +@@ -24,6 +24,7 @@
> + #ifndef __IPOQUE_API_INCLUDE_FILE__
> + #define __IPOQUE_API_INCLUDE_FILE__
> +
> ++#include <sys/types.h>
> +
> + #if defined(HAVE_NTOP) && defined(WIN32)
> + #include <winsock2.h>
> diff --git a/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
> b/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
> deleted file mode 100644
> index 0b1e8afbc..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Add support for arm64
> -
> -Upstream-Status: Inappropriate [no longer maintained]
> -
> -Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> -
> -diff --git a/nDPI/config.sub.old b/nDPI/config.sub
> -index c2d1257..e4347ac 100755
> ---- a/nDPI/config.sub.old
> -+++ b/nDPI/config.sub
> -@@ -249,7 +249,7 @@ case $basic_machine in
> -       | alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
> -       | alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] |
> alpha64pca5[67] \
> -       | am33_2.0 \
> --      | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] |
> avr | avr32 \
> -+      | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] |
> avr | avr32 | aarch64 \
> -       | bfin \
> -       | c4x | clipper \
> -       | d10v | d30v | dlx | dsp16xx \
> -@@ -331,7 +331,7 @@ case $basic_machine in
> -       | alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
> -       | alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
> -       | alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
> --      | arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
> -+      | arm-*  | armbe-* | armle-* | armeb-* | armv*-* | aarch64-* \
> -       | avr-* | avr32-* \
> -       | bfin-* | bs2000-* \
> -       | c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
> diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> index 77b5e436f..298fbec61 100644
> --- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> +++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> @@ -1,4 +1,137 @@
> -include ntop.inc
> +SUMMARY = "ntop is network top"
> +DESCRIPTION = "ntop is a network traffic probe that shows the network
> usage, \
> +similar to what the popular top Unix command does."
>
> +SECTION = "console/network"
> +
> +LICENSE = "GPLv2+ & GPLv3 & OpenSSL"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://LICENSE-OpenSSL.txt;md5=
> a409f902e447ddd889cffa0c70e7c7c2 \
> +                   "
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
> +           file://ntop_configure_in.patch \
> +           file://ntop_init.patch \
> +           file://ntop_webInterface.patch \
> +           file://ntop_configure_in_net_snmp_config_exist.patch \
> +           file://ntop.service \
> +           file://use-static-inline.patch \
> +           file://0001-nDPI-Include-sys-types.h.patch \
> +          "
>  SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
>  SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a1
> 4d84a4bef84ec37b2276bc363f45c52ef8"
> +
> +inherit autotools-brokensep useradd pythonnative pkgconfig systemd
> +
> +DEPENDS = "geoip rrdtool python zlib libpcap gdbm"
> +
> +PACKAGECONFIG ??= "openssl snmp plugins"
> +PACKAGECONFIG[openssl] = "--with-ssl, --without-ssl, openssl, openssl"
> +PACKAGECONFIG[snmp] = "--enable-snmp=yes NETSNMP=${STAGING_BINDIR_CROSS}/net-snmp-config,
> \
> +--disable-snmp,net-snmp,"
> +PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
> +
> +EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no"
> +
> +do_configure() {
> +    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
> ${S}
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
> ${S}/nDPI
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub
> ${S}/nDPI
> +    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.m4
> +    cp 3rd_party/* ./
> +
> +    # config nDPI
> +    cd nDPI
> +    ./configure ${CONFIGUREOPTS} --with-pic
> +    cd ..
> +
> +    sed -i -e 's:^CFG_DBFILE_DIR=$localstatedir/ntop:CFG_DBFILE_DIR=$localstatedir/lib/ntop:'
> ${S}/configure.in
> +
> +    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
> +    sed -i \
> +        -e 's:\(^CFLAGS="\$.*\) -I/usr/local/include
> -I/opt/local/include":\1":' \
> +        -e 's:\(^CPPFLAGS="\$.*\) -I/usr/local/include
> -I/opt/local/include":\1":' \
> +        -e 's:\(^LDFLAGS="\$.*\) -L/usr/local/lib -L/opt/local/lib":\1":'
> \
> +        ${S}/configure.in
> +
> +    # replace the DISTRO RELEASE in configure.in which are host's
> +    # with our release, although those doesn't affect functionality
> +    sed -i -e \
> +        '/DEFINEOS="LINUX"/{N;s/DISTRO=.*/DISTRO="${DISTRO}"/;
> N;s/RELEASE=.*/RELEASE="${DISTRO_VERSION}"/;}' \
> +        ${S}/configure.in
> +
> +    # osName in original configure.in should be ${TARGET_SYS}
> +    # which will show in ntop's "show configuration"
> +    sed -i -e \
> +        's:^osName=.*:osName=${TARGET_SYS}:' \
> +        ${S}/configure.in
> +
> +    # rename configureextra to configureextra_rename to avoid
> +    # configure.in to guess host OS and pull in more configure, non
> needed
> +    # which will cause some cross-compiling failure on specific host
> +    # e.g. SUSE(SLED...)
> +    test ! -f configureextra || mv -f configureextra configureextra_rename
> +
> +    # make sure configure finds python includdirs/libs with these envs
> +    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> +        STAGING_INCDIR=${STAGING_INCDIR} \
> +        STAGING_LIBDIR=${STAGING_LIBDIR}
> +
> +    autotools_do_configure
> +}
> +
> +do_compile_prepend() {
> +    cd nDPI
> +    oe_runmake
> +    cd ..
> +}
> +
> +do_install_append() {
> +    # remove the empty dirs
> +    rm -rf ${D}${libdir}/plugins
> +
> +    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
> +        ${D}${sysconfdir}/init.d/ntop
> +    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
> +        ${D}${sysconfdir}/ntop.conf
> +
> +    # change ntop dir in ntop.conf
> +    # don't use the -P as the ntop.init didn't support it
> +    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path
> /var/lib/ntop:" \
> +        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
> +        ${D}${sysconfdir}/ntop.conf
> +
> +    # For systemd
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +        install -D -m 0755 ${S}/packages/RedHat/ntop.init
> ${D}${libexecdir}/ntop-helper
> +        install -D -m 0644 ${WORKDIR}/ntop.service
> ${D}${systemd_system_unitdir}/ntop.service
> +        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
> +            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +            ${D}${systemd_system_unitdir}/ntop.service
> +    fi
> +
> +    # Fix host-user-contaminated issue
> +    chown -R root:root ${D}
> +
> +    chown -R ntop.ntop ${D}${datadir}/ntop
> +    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
> +}
> +
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "-M -g ntop -r -d ${localstatedir}/lib/ntop \
> +-s /usr/sbin/nologin -c 'ntop' ntop"
> +GROUPADD_PARAM_${PN} = "-r ntop"
> +
> +SYSTEMD_SERVICE_${PN} = "ntop.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +FILES_${PN}_append = "${libdir}/ntop/plugins ${libdir}/libntop-*.so \
> +                      ${libdir}/libntopreport-*.so
> ${libdir}/lib*-${PV}.so"
> +FILES_${PN}-dev = "${includedir} ${libdir}/libntop.so \
> +                   ${libdir}/libntopreport.so \
> +                   ${libdir}/libnetflowPlugin.so
> ${libdir}/libsflowPlugin.so \
> +                   ${libdir}/librrdPlugin.so \
> +                   ${libdir}/*.a ${libdir}/libntopreport.a ${libdir}/*.la"
> +
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

