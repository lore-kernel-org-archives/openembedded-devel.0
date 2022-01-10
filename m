Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCC7C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 06:47:02 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.28384.1641797221083370640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 22:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ePwlQo8+;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id kl12so1748169qvb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 22:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XfkzhFlBCP/aH5qVPxoAfe/0yWvyB0HLHd+5EWQs+o4=;
        b=ePwlQo8+tUFOFYy3Z7+KLgrucpEQu56n+ovOaCCUNU766t8k469sZE8oxkC3a3D6lG
         snUScnikrmC5K0bXx+u63NEi2JrCzxL2T+XcsZNL2bR7eYpgltGk6Qqd+SGkajP11ZBh
         Q2M+c5DpDm81FdcB+NCbf01wCSJ0cr+UhiX6C6KplXrEJFUe0ezyyH71WTvDKoZAFlvG
         H39hRkKJv5Dc3NVMInNzRAFHn3D/pI9UJAcUbDbCk4q2+ZlZGKD6wf0cEqNrCRXWbPNQ
         jdfvRL+A5P78qQ6iwp3xQPW9ZYBGj2lXIQq7ou+deMmVrS5g31AZe7GBjImXMJzZITH2
         jHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XfkzhFlBCP/aH5qVPxoAfe/0yWvyB0HLHd+5EWQs+o4=;
        b=PxKWQRsyWXA5HxBFNnLve1vsDducE5/KlVHfkb5M6vcWHbIuYKKiPyK9tcG3yzoEdL
         VqaXMMEmkHX0RWiTtEzIwoLULUtETMy+NCUtxmIjZqTpACDufVZa0VQbj9Tbs9y7PQVY
         OrNX5eR93gI4rhOiv4LuPAxYffrZ2UycG7yiXb0D2pC7saZy6rGbm7m8PwCvIPET/tpX
         zmQeg+LRKWVFZ5iZ4qdRVTVMuvsySByY9IXNiti0esYY7g4eOKWGtopjXqWawBQC2pvE
         QYSZ/s7/zXcQEE+pS31tE1vxMPqQ9iYVgRyAGsIjps88KPyGeQbGZLYPWWWxWgHe3lLv
         g93A==
X-Gm-Message-State: AOAM532UcRlHPQClKYNnAg4LjljVF0egHBHBpqt8dMG68QXxCzDj0urK
	4cQ+Mtl3KhXFHTWF4lEFIjw0vy5flvZYU3S6RM2QRASdiHyMHg==
X-Google-Smtp-Source: 
 ABdhPJxFogaKd7H/Kh1Z94QzXefX0+3d0K1BsLcmRe0y3lFDl1YTohFfhfT2kUVBdCzzI/7Z9wHplFpJIC3IyQLvNkg=
X-Received: by 2002:a05:6214:e46:: with SMTP id
 o6mr16406768qvc.110.1641797219964;
 Sun, 09 Jan 2022 22:46:59 -0800 (PST)
MIME-Version: 1.0
References: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
 <1641576297-3341-4-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1641576297-3341-4-git-send-email-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Jan 2022 22:46:34 -0800
Message-ID: 
 <CAMKF1srfY3RCLDOUwwdj=jYnAfZCyY9Y-7OM1dVKa3HhXMH-CA@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/3] pcp: Added a new recipe which provides dstat
 command.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 06:47:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94708

this needs some packaging fixes see

https://errors.yoctoproject.org/Errors/Details/621867/

ERROR: QA Issue: pcp: Files/directories were installed but not shipped
in any package:
  /etc/cron.d
  /etc/init.d
  /etc/cron.d/pcp-pmfind
  /etc/cron.d/pcp-pmie
  /etc/cron.d/pcp-pmlogger
  /etc/cron.d/pcp-pmlogger-daily-report
  /etc/init.d/pmcd
  /etc/init.d/pmproxy
  /etc/init.d/pmie
  /etc/init.d/pmlogger
  /etc/init.d/pcp
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or dele

On Fri, Jan 7, 2022 at 12:25 AM leimaohui <leimaohui@fujitsu.com> wrote:
>
> Performance Co-Pilot is a system performance analysis toolkit
>  - Collect performance metrics from your systems efficiently.
>  - Analyze systems' performance metrics in real-time or using historical =
data.
>  - Extend the collected performance metrics in a simple way.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../recipes-support/pcp/pcp-native_5.3.5.bb   |  49 ++++
>  meta-oe/recipes-support/pcp/pcp.inc           |  32 +++
>  ...ove-unsuitble-part-for-cross-compile.patch |  45 ++++
>  meta-oe/recipes-support/pcp/pcp/config.linux  |  13 ++
>  meta-oe/recipes-support/pcp/pcp_5.3.5.bb      | 217 ++++++++++++++++++
>  5 files changed, 356 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
>  create mode 100644 meta-oe/recipes-support/pcp/pcp.inc
>  create mode 100644 meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble=
-part-for-cross-compile.patch
>  create mode 100644 meta-oe/recipes-support/pcp/pcp/config.linux
>  create mode 100644 meta-oe/recipes-support/pcp/pcp_5.3.5.bb
>
> diff --git a/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb b/meta-oe/re=
cipes-support/pcp/pcp-native_5.3.5.bb
> new file mode 100644
> index 0000000000..029a47531b
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
> @@ -0,0 +1,49 @@
> +require pcp.inc
> +inherit python3native native
> +#autotools-brokensep
> +DEPENDS =3D "python3-native python3-setuptools-native flex-native bison-=
native"
> +
> +export PCP_DIR =3D "${D}"
> +export PCP_TMP_DIR =3D "${D}/tmp"
> +export PCP_BIN_DIR =3D "${D}/usr/bin"
> +
> +B =3D "${S}"
> +
> +do_configure:prepend() {
> +    export SED=3D${TMPDIR}/hosttools/sed
> +    export AR=3D${TMPDIR}/hosttools/ar
> +#    export PYTHON=3Dpython3
> +
> +    rm -rf ${S}/include/pcp/configsz.h
> +    rm -rf ${S}/include/pcp/platformsz.h
> +
> +}
> +do_compile:prepend() {
> +    sed -i -e "s,#undef HAVE_64BIT_LONG,,g" \
> +           -e "s,#undef HAVE_64BIT_PTR,,g" \
> +           -e "s,#undef PM_SIZEOF_SUSECONDS_T,,g" \
> +           -e "s,#undef PM_SIZEOF_TIME_T,,g" \
> +           ${S}/src/include/pcp/config.h.in
> +
> +    export AR=3D${TMPDIR}/hosttools/ar
> +#    export PYTHON=3Dpython3
> +}
> +
> +do_compile() {
> +        oe_runmake default_pcp
> +}
> +
> +do_install () {
> +    oe_runmake install \
> +    PCP_ETC_DIR=3D${D}/${sysconfdir} \
> +    PCP_SYSCONF_DIR=3D${D}/${sysconfdir} \
> +    PCP_VAR_DIR=3D${D}/${localstatedir} \
> +    PCP_SHARE_DIR=3D${D}/${datadir} \
> +    PCP_BIN_DIR=3D${D}/${bindir} \
> +    PCP_BINADM_DIR=3D${D}/${libexecdir}/pcp/bin \
> +    PCP_LIBADM_DIR=3D${D}/${libdir} \
> +    PCP_LIB_DIR=3D${D}/${libdir} \
> +    PCP_MAN_DIR=3D${D}/${mandir} \
> +    PCP_DOC_DIR=3D${D}/${docdir}
> +}
> +
> diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-suppor=
t/pcp/pcp.inc
> new file mode 100644
> index 0000000000..f6f111b0e8
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcp/pcp.inc
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "System-level performance monitoring and performance managem=
ent"
> +HOMEPAGE =3D "http://www.pcp.io"
> +SECTION =3D  "Applications/System"
> +
> +LICENSE =3D "GPLv2+ & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D37ab75b580d5aad4ada04260efa37=
02f \
> +                    "
> +COMPATIBLE_HOST:libc-musl =3D "null"
> +
> +SRC_URI =3D "https://performancecopilot.jfrog.io/artifactory/pcp-source-=
release/pcp-5.3.5.src.tar.gz \
> +          file://config.linux \
> +          "
> +
> +SRC_URI[sha256sum] =3D "589a610f753a49af6d2015cede87e9d469bd07880ebef26f=
e1607b6ded375e97"
> +
> +inherit distutils3-base pkgconfig autotools
> +
> +B =3D "${S}"
> +
> +# Specify any options you want to pass to the configure script using EXT=
RA_OECONF:
> +CACHED_CONFIGUREVARS =3D "PACKAGE_DISTRIBUTION=3Darch"
> +EXTRA_OECONF:append =3D " --with-dstat-symlink=3Dyes --with-infiniband=
=3Dno \
> +                --with-pmdapodman=3Dno --with-python=3Dno --with-python3=
=3Dyes --with-perl=3Dno \
> +               --with-pmdabcc=3Dno --with-pmdajson=3Dno  --with-perfeven=
t=3Dno \
> +               --with-pmdabcc=3Dyes \
> +               --with-rundir=3D${localstatedir}/run \
> +                --with-sysconfigdir=3D${sysconfdir} \
> +                --with-logdir=3D${localstatedir}/log \
> +                --with-docdir=3D${docdir} \
> +                "
> +
> +
> diff --git a/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-f=
or-cross-compile.patch b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuit=
ble-part-for-cross-compile.patch
> new file mode 100644
> index 0000000000..292499850e
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cros=
s-compile.patch
> @@ -0,0 +1,45 @@
> +From db9e6a4b7a48dee62fccb662347dd638a2d286d5 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Thu, 2 Dec 2021 14:29:06 +0900
> +Subject: [PATCH] Remove unsuitble part for cross-compile.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + configure.ac               | 6 ------
> + src/libpcp/src/GNUmakefile | 1 -
> + 2 files changed, 7 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5b25382..5d24714 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -623,12 +623,6 @@ fi
> + which=3D$WHICH
> + AC_SUBST(which)
> +
> +-if test -z "$AR"; then
> +-    AC_PATH_PROGS(AR, [gcc-ar ar], /usr/bin/ar)
> +-fi
> +-if test ! -x "$AR"; then
> +-    AC_MSG_ERROR([cannot find a valid 'ar' command.])
> +-fi
> + ar=3D$AR
> + AC_SUBST(ar)
> +
> +diff --git a/src/libpcp/src/GNUmakefile b/src/libpcp/src/GNUmakefile
> +index 3c4ccd6..d1eba19 100644
> +--- a/src/libpcp/src/GNUmakefile
> ++++ b/src/libpcp/src/GNUmakefile
> +@@ -176,7 +176,6 @@ exports:   exports.in mk.exports
> + # cases
> + #
> + check.done:   $(OBJECTS)
> +-      ./check-statics
> +       touch check.done
> +
> + ifneq ($(LIBTARGET),)
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/pcp/pcp/config.linux b/meta-oe/recip=
es-support/pcp/pcp/config.linux
> new file mode 100644
> index 0000000000..191f87acc6
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcp/pcp/config.linux
> @@ -0,0 +1,13 @@
> +sizeof_int=3D4
> +sizeof_long=3D4
> +sizeof_pointer=3D8
> +sizeof_suseconds_t=3D8
> +sizeof_time_t=3D8
> +bit_field_scheme=3D2100
> +enable_python3=3D'yes'
> +enable_python3=3D'true'
> +have_python_OrderedDict=3D"true"
> +have_python=3Dpython3
> +printf_p_prefix=3D0x
> +printf_fmt_int64=3DI64d
> +strtoint64=3Dstrtoll
> diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb b/meta-oe/recipes-s=
upport/pcp/pcp_5.3.5.bb
> new file mode 100644
> index 0000000000..e6c139e1d3
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
> @@ -0,0 +1,217 @@
> +require pcp.inc
> +#inherit perlnative
> +
> +# NOTE: the following prog dependencies are unknown, ignoring: gtar gzip=
 pkgmk xmlto lzma qshape md5sum pod2man publican git makedepend qmake-qt4 x=
confirm true gmake xz dblatex hdiutil rpm bzip2 which mkinstallp dtrace sei=
nfo qmake-qt5 gawk dlltool rpmbuild dpkg makepkg qmake echo
> +# NOTE: unable to map the following pkg-config dependencies: libmicrohtt=
pd libsystemd-journal
> +#       (this is based on recipes that have previously been built and pa=
ckaged)
> +# NOTE: the following library dependencies are unknown, ignoring: nspr g=
en ibumad regex sasl2 pfm nss papi ibmad
> +#       (this is based on recipes that have previously been built and pa=
ckaged)
> +DEPENDS +=3D "perl-native bison-native flex-native python3-native python=
3-setuptools python3 \
> +       pcp-native cairo zlib ncurses readline libx11 avahi openssl"
> +
> +
> +SRC_URI +=3D "file://0001-Remove-unsuitble-part-for-cross-compile.patch =
\
> +           "
> +
> +export PCP_DIR=3D"${RECIPE_SYSROOT_NATIVE}"
> +#export PCP_RUN_DIR=3D"${RECIPE_SYSROOT_NATIVE}"
> +EXTRA_OEMAKE =3D "CC=3D"${CC}" LD=3D"${LD}" AR=3D"${AR}""
> +inherit useradd systemd
> +
> +SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
> +SYSTEMD_SERVICE:${PN} =3D "pmcd.service pmcd.service pmie_check.service =
pmie_farm_check.service \
> +                         pmlogger_daily.service pmlogger_farm_check.serv=
ice pmfind.service \
> +                         pmie_daily.service  pmlogger.service pmlogger_d=
aily_report.service \
> +                         pmproxy.service pmie.service pmie_farm.service =
pmlogger_check.service \
> +                         pmlogger_farm.service"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system --home ${localstatedir}/lib/pcp --no-c=
reate-home \
> +                       --user-group pcp"
> +
> +USERADD_PACKAGES =3D "${PN}-testsuite"
> +USERADD_PARAM:${PN}-testsuite =3D "--system --home ${localstatedir}/lib/=
pcp/testsuite --no-create-home \
> +                       --user-group pcpqa"
> +
> +RDEPENDS:${PN} +=3D "perl"
> +RDEPENDS:${PN}-testsuite +=3D "${PN} bash perl"
> +RDEPENDS:python3-${PN} +=3D "${PN} python3"
> +
> +do_configure:prepend () {
> +    cp ${WORKDIR}/config.linux ${B}
> +    rm -rf ${S}/include/pcp/configsz.h
> +    rm -rf ${S}/include/pcp/platformsz.h
> +    export SED=3D${TMPDIR}/hosttools/sed
> +    export PYTHON=3Dpython3
> +}
> +
> +do_compile:prepend() {
> +       sed -i -e "s,#undef HAVE_64BIT_LONG,,g" \
> +               -e "s,#undef HAVE_64BIT_PTR,,g" \
> +               -e "s,#undef PM_SIZEOF_SUSECONDS_T,,g" \
> +               -e "s,#undef PM_SIZEOF_TIME_T,,g" \
> +               ${S}/src/include/pcp/config.h.in
> +       sed -i -e "s,HAVE_PYTHON_ORDEREDDICT =3D false,HAVE_PYTHON_ORDERE=
DDICT =3D true,g" \
> +               ${S}/src/include/builddefs
> +       sed -i -e "s,TOPDIR)/python3-pcp.list,TOPDIR)/python3-pcp.list --=
install-lib=3D${PYTHON_SITEPACKAGES_DIR},g" ${S}/src/python/GNUmakefile
> +       export PYTHON=3Dpython3
> +       #export PYTHON3=3D${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${=
PYTHON_PN}
> +}
> +
> +do_compile() {
> +        oe_runmake default_pcp
> +}
> +
> +do_install () {
> +       export NO_CHOWN=3Dtrue
> +       oe_runmake install DIST_ROOT=3D${D}\
> +       install_pcp
> +
> +       rm -rf ${D}${localstatedir}/log
> +       rm -rf ${D}${localstatedir}/lib/pcp/pmcd
> +       rm -rf ${D}${localstatedir}/lib/pcp/tmp
> +       rm -rf ${D}${localstatedir}/run
> +       mv ${D}${docdir}/C* ${D}${docdir}/pcp-doc/
> +       mv ${D}${docdir}/I* ${D}${docdir}/pcp-doc/
> +       mv ${D}${docdir}/R* ${D}${docdir}/pcp-doc/
> +       mv ${D}${docdir}/V* ${D}${docdir}/pcp-doc/
> +       sed -i "s#PCP_AWK_PROG=3D.*#PCP_AWK_PROG=3Dawk#" ${D}/${sysconfdi=
r}/pcp.conf
> +       sed -i "s#PCP_SORT_PROG=3D.*#PCP_SORT_PROG=3Dsort#" ${D}/${syscon=
fdir}/pcp.conf
> +       sed -i "s#PCP_ECHO_PROG=3D.*#PCP_ECHO_PROG=3Decho#" ${D}/${syscon=
fdir}/pcp.conf
> +       sed -i "s#PCP_WHICH_PROG=3D.*#PCP_WHICH_PROG=3Dwhich#" ${D}/${sys=
confdir}/pcp.conf
> +}
> +
> +PACKAGES +=3D " ${PN}-export-zabbix-agent ${PN}-testsuite \
> +       libpcp-gui2  libpcp-gui2-dev \
> +       libpcp-import1 \
> +       libpcp-mmv1 libpcp-mmv1-dev \
> +       libpcp-pmda3 libpcp-pmda3-dev \
> +       libpcp-trace2 libpcp-trace2-dev \
> +       libpcp-web1 libpcp-web1-dev \
> +       libpcp3 libpcp3-dev python3-${PN}\
> +"
> +FILES:libpcp-gui2 =3D "${libdir}/libpcp_gui.so.2 \
> +"
> +FILES:libpcp-gui2-dev =3D " \
> +       ${libdir}/libpcp_gui.so \
> +       ${libdir}/libpcp_gui.a \
> +       ${includedir}/pmafm.h \
> +       ${includedir}/pmtime.h \
> +"
> +FILES:libpcp-mmv1 =3D " \
> +       ${libdir}/libpcp_mmv.so.1 \
> +"
> +FILES:libpcp-mmv1-dev =3D " \
> +       ${libdir}/libpcp_mmv.a \
> +       ${libdir}/libpcp_mmv.so \
> +       ${libdir}/libpcp_mmv.so \
> +       ${includedir}/mmv_stats.h \
> +       ${includedir}/mmv_dev.h \
> +       ${datadir}/man/man3/mmv_* \
> +       ${datadir}/man/man5/mmv.5.gz \
> +"
> +FILES:libpcp-import1 =3D " \
> +       ${libdir}/libpcp_import.so.1 \
> +"
> +FILES:libpcp-pmda3 =3D " \
> +       ${libdir}/libpcp_pmda.so.3 \
> +"
> +FILES:libpcp-pmda3-dev =3D " \
> +       ${includedir}/pmda.h \
> +       ${includedir}/pmdaroot.h \
> +       ${libdir}/libpcp_pmda.a \
> +       ${libdir}/libpcp_pmda.so \
> +       ${libdir}/pkgconfig/libpcp_pmda.pc \
> +       ${datadir}/man/man3/PMDA.3.gz \
> +       ${datadir}/man/man3/pmda* \
> +"
> +FILES:libpcp-trace2 =3D " \
> +       ${libdir}/libpcp_trace.so.2 \
> +"
> +FILES:libpcp-trace2-dev =3D " \
> +       ${includedir}/trace.h \
> +       ${includedir}/trace_dev.h \
> +       ${libdir}/libpcp_trace.a \
> +       ${libdir}/libpcp_trace.so \
> +       ${datadir}/man/man3/pmtrace* \
> +"
> +FILES:libpcp-web1 =3D " \
> +       ${libdir}/libpcp_web.so.1 \
> +"
> +FILES:libpcp-web1-dev =3D " \
> +       ${includedir}/pmhttp.h \
> +       ${includedir}/pmjson.h \
> +       ${libdir}/libpcp_web.a \
> +       ${libdir}/libpcp_web.so \
> +       ${datadir}/man/man3/pmhttp* \
> +       ${datadir}/man/man3/pmjson* \
> +"
> +FILES:libpcp3 =3D " \
> +       ${libdir}/libpcp.so.3 \
> +"
> +
> +FILES:${PN} =3D " \
> +       ${sysconfdir}/pcp \
> +       ${libexecdir} \
> +       ${bindir} \
> +       ${datadir}/bash-completion \
> +       ${datadir}/pcp-gui \
> +       ${datadir}/zsh \
> +       ${systemd_system_unitdir}/ \
> +       ${libdir}/pcp/ \
> +       ${datadir}/pcp \
> +       ${libdir}/*.sh \
> +       ${datadir}/man \
> +       ${libdir}/rc-proc.sh.minimal \
> +       ${sysconfdir}/p* \
> +       ${sysconfdir}/s* \
> +       ${localstatedir}/lib/pcp/config \
> +       ${localstatedir}/lib/pcp/pmdas/ \
> +       ${localstatedir}/lib/pcp/pmns \
> +       ${libdir}/libpcp_fault.so.3 \
> +"
> +
> +FILES:${PN}-export-zabbix-agent +=3D " \
> +       ${libdir}/zabbix \
> +       ${sysconfdir}/zabbix \
> +       ${mandir}/man3/zbxpcp.3.gz \
> +       ${libdir}/zabbix \
> +"
> +FILES:${PN}-testsuite =3D "${localstatedir}/lib/pcp/testsuite/"
> +FILES:python3-${PN} =3D "${PYTHON_SITEPACKAGES_DIR}"
> +FILES:${PN}-dev +=3D " \
> +        ${includedir}/pcp \
> +        ${libdir}/libpcp.a \
> +        ${libdir}/libpcp.so \
> +        ${localstatedir}/lib/pcp/pmdas/*/*.so \
> +        ${libexecdir}/pcp/bin/install-sh \
> +        ${libdir}/pkgconfig/libpcp.pc \
> +        ${libdir}/zabbix/modules/*.so \
> +        ${datadir}/man/man3/LOGIMPORT.3.gz \
> +        ${datadir}/man/man3/P* \
> +        ${datadir}/man/man3/Q* \
> +        ${datadir}/man/man3/__pm* \
> +        ${datadir}/man/man3/pmA* \
> +        ${datadir}/man/man3/pmC* \
> +        ${datadir}/man/man3/pmD* \
> +        ${datadir}/man/man3/pmE* \
> +        ${datadir}/man/man3/pmF* \
> +        ${datadir}/man/man3/pmG* \
> +        ${datadir}/man/man3/pmH* \
> +        ${datadir}/man/man3/pmI* \
> +        ${datadir}/man/man3/pmL* \
> +        ${datadir}/man/man3/pmM* \
> +        ${datadir}/man/man3/pmN* \
> +        ${datadir}/man/man3/pmO* \
> +        ${datadir}/man/man3/pmP* \
> +        ${datadir}/man/man3/pmR* \
> +        ${datadir}/man/man3/pmS* \
> +        ${datadir}/man/man3/pmT* \
> +        ${datadir}/man/man3/pmU* \
> +        ${datadir}/man/man3/pmW* \
> +        ${datadir}/man/man3/pmf* \
> +        ${datadir}/man/man3/pmg* \
> +        ${datadir}/man/man3/pmi* \
> +        ${datadir}/man/man3/pms* \
> +        ${datadir}/man/man3/pmt* \
> +"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94679): https://lists.openembedded.org/g/openembedded=
-devel/message/94679
> Mute This Topic: https://lists.openembedded.org/mt/88257328/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

