Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.2095.1616813091445175450
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 19:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZEECNwou;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id by2so3940914qvb.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 19:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UKeIliFqZRu7FUpcKcVT0xLcP5SmjtROak3F+U96JNo=;
        b=ZEECNwouA3QcGDKFBTvmNcFaI/hBXERVLbmyQ2YFueNnzIImA2GBbKh3AjnRr6TG8/
         7b3rY6giM12lYVTHMOTFkcgM3gW2m9QGEJ4wr56YwhDCuokVGoKduJBBmsx+p/IPMnGu
         Zdx11DJ8J/skYw2Z6w435NdxURy9TKZFK0BJzV9/LCXhoP8KK99pQ/31O1VGbHCOjLmP
         5ffVL/uxGEmRT9xVcxPiJjWGrJTtWffkNLh4uVcEbCOtJnH/6a0nEA9wl97aDG4omlox
         gyKay5aHz5HAhEhlLY0VrC1ExcjzYxHqdiPiUNJkbYSrCJ5nU0D2KE+07d66xnBZ788B
         msig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UKeIliFqZRu7FUpcKcVT0xLcP5SmjtROak3F+U96JNo=;
        b=ojq110293NyZxaAVQ8Wgxv8F9ZE5uol65SUKpz2m39MdTrPMpiXouQVXnE1DYZBsMq
         vxA6r4fhv50SbcHgWGN9tk/nZRmioqqQyqzbFySK8fCfyCzarLrkZHAxbTRb3RiLMEGi
         CW94YefAreIC1VqJW+DqcpeYEFjGsAFe8WMnTdTocWBZIwIjGQv49781dZRetHTYu+JC
         Po3udHzE1DUgGKL/WIcYpfrQo6j1vb7ROZGZNLHEs0xHxmhPvtMHT175RJipVQixja3J
         r8SZQfGMZqaDK5/viCZiKHZZy8XUXFrvNbTM5Wdm+HfhyBzxXBYQMKLAJTEBgYasvRc4
         he2Q==
X-Gm-Message-State: AOAM532wMI2ujUy23RZe9dltCZx3kv0EMo/YW6YXppiVTXtxmZnVt8pK
	+LumaUioTeAphkEofobW2ELFIITS1nVsiACRFUU=
X-Google-Smtp-Source: ABdhPJyzbx+0RfNn3RKT15Q/2LqIPcjqYbhw+ANhckwkfUX4pOyq6kQ7H+qBNu8Gqjdv8SpP3JoeGpIEivMWt/8qb2g=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr16501537qvb.50.1616813090544;
 Fri, 26 Mar 2021 19:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210326030642.23095-1-yifan.yu@windriver.com>
In-Reply-To: <20210326030642.23095-1-yifan.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 26 Mar 2021 19:44:24 -0700
Message-ID: <CAMKF1spphHPi6WWyUzZyvC7MpW38Dt=NM+jrP0PvrBQho88EwA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] rsyslog: fix some of the ptests
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to patch

https://errors.yoctoproject.org/Errors/Details/574583/

On Thu, Mar 25, 2021 at 8:07 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>
> Run test as non-root 'tester'.
> Add more rdepends for ptest.
>
> Introduce a patch to skip checking for a libc header:
>     sys/inotify
>
> Python scripts no longer called with ./script.
> Remove the need for to patch shebang.
> Ptest results:
>
>     8.2102.0
> ===============
> TOTAL: 424
> PASS:  417
> SKIP:  5
> XFAIL: 0
> FAIL:  2
> XPASS: 0
> ERROR: 0
>
> Remaining failure related to relp:
> * imrelp-tls-cfgcmd
> * sndrcv_relp_tls-cfgcmd
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>  ...-tests-disable-the-check-for-inotify.patch | 46 +++++++++++++++++++
>  .../rsyslog/rsyslog/run-ptest                 |  6 ++-
>  .../rsyslog/rsyslog_8.2102.0.bb               | 15 +++---
>  3 files changed, 60 insertions(+), 7 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
> new file mode 100644
> index 000000000..221d70e63
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
> @@ -0,0 +1,46 @@
> +From 2d45f4b90bdc42f515764ae28bf62ab8fa23531d Mon Sep 17 00:00:00 2001
> +From: Yi Fan Yu <yifan.yu@windriver.com>
> +Date: Wed, 10 Mar 2021 14:47:21 -0500
> +Subject: [PATCH] tests: disable the check for inotify
> +
> +We don't need to check inotify.h.
> +Assume it is present since it is part of the linux kernel
> +since 2.6.13 [1].
> +
> +[1](https://kernelnewbies.org/Linux_2_6_13)
> +
> +(it would require installing the libc headers otherwise,
> + for the test  to detect /usr/include/sys/inotify.h.)
> +
> +Upstream-Status: Not Applicable [OE-specific]
> +
> +Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +---
> + tests/diag.sh | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/diag.sh b/tests/diag.sh
> +index 0739bdb74..7a0176bd6 100755
> +--- a/tests/diag.sh
> ++++ b/tests/diag.sh
> +@@ -2679,7 +2679,7 @@ case $1 in
> +               fi
> +               ;;
> +       'check-inotify') # Check for inotify/fen support
> +-              if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
> ++              if true; then
> +                       echo [inotify mode]
> +               elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
> +                       grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
> +@@ -2694,7 +2694,7 @@ case $1 in
> +               fi
> +               ;;
> +       'check-inotify-only') # Check for ONLY inotify support
> +-              if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
> ++              if true; then
> +                       echo [inotify mode]
> +               else
> +                       echo [inotify not supported, skipping...]
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
> index aa698d85c..efa9ba3ed 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
> @@ -5,4 +5,8 @@ set -o pipefail
>
>  SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
>  cd ${SCRIPTPATH}
> -make -C tests -k check-TESTS
> +useradd tester  || echo "user already exists"
> +ln -sf /usr/sbin/logrotate /usr/bin/logrotate
> +su tester -c "make -C tests -k check-TESTS"
> +userdel tester
> +rm -f /usr/bin/logrotate
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
> index 22059d140..921124024 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
>             file://rsyslog.service \
>             file://use-pkgconfig-to-check-libgcrypt.patch \
>             file://run-ptest \
> +           file://0001-tests-disable-the-check-for-inotify.patch \
>  "
>
>  SRC_URI_append_libc-musl = " \
> @@ -80,11 +81,6 @@ PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
>  PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
>  PACKAGECONFIG[imhttp] = "--enable-imhttp,--disable-imhttp,civetweb,"
>
> -do_configure_prepend() {
> -    sed -i -e 's|python |python3 |g' ${S}/tests/*.sh
> -    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/*.py
> -    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/testsuites/*.py
> -}
>
>  TESTDIR = "tests"
>  do_compile_ptest() {
> @@ -97,6 +93,10 @@ do_install_ptest() {
>      cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
>      cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
>
> +    # give permissions to all users
> +    # some tests need to write to this directory as user 'daemon'
> +    chmod 777 -R ${D}${PTEST_PATH}/tests
> +
>      # do NOT need to rebuild Makefile itself
>      sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
>      # do NOT need to rebuild $(check_PROGRAMS)
> @@ -195,8 +195,11 @@ VALGRIND_libc-musl_powerpc64le = ''
>  VALGRIND_riscv64 = ""
>  VALGRIND_riscv32 = ""
>
> +# util-linux: logger needs the -d option
>  RDEPENDS_${PN}-ptest += "\
>    make diffutils gzip bash gawk coreutils procps \
> -  libgcc python3-core python3-io \
> +  libgcc python3-core python3-io python3-json \
> +  curl util-linux shadow \
>    "
> +
>  RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
> --
> 2.29.2
>
>
> 
>
