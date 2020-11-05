Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.1175.1604604037603656296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 11:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WV921CHY;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 11so2277935qkd.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 11:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJ6jlBMlbrxGk3gzzXy5jBdlgjTzyipiKzpBSQVFAB0=;
        b=WV921CHYNZRtAL9aMrFzwERpfk06LMP7/T5rN9Bebes2zA/S/P9i47N4dtZy7leHFD
         E/bFjKzQoiJkZPZNj7DuUi6pxgoo/+dqwAaj4yZDFr5V6gFEVAmkpYQXRkUbnYU3rIoc
         Lavd60cD59j/o9CRwmD/lfJIuG4DXUp08snULrW3ixNpZhPRWULmr53RWnOOwCGIe2zi
         SlnIS+sJVbVjSLScSloO9JWVP+D5RluTAVzxCxycnBw1NYX/qfXv+1JD+Ck0FVRoi5ki
         4NMYXmz6e7FofGX5/Q9HjG6FRrL5wmxAM4VRYi0O2co+YEwc7Vlh3GGd2bTJyNpjK5HA
         wmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJ6jlBMlbrxGk3gzzXy5jBdlgjTzyipiKzpBSQVFAB0=;
        b=ad9M+naDU3C34sKKWBpQ/UOTqJUJdzznOU+GI7aF05y/TtitGH2m55KSyNZvPfaXEa
         W+Ap1kcCJvxTR3nMQQmMxAu3u7S43x/NipCv563Pgp0fXjJVT2e37pnfDx0M5lCeA8vv
         O4Hb7tDnmlnmpKMdcuWRQBb7kvYHtjGVEFOdOKVr3azH2ZD7x8SnWX07O4RlaHpjGjvO
         rU1NiXZH5w3hQBfBsy27gOtOtsPu+yyCGsKMTZr4D1Xcty10GiREpx6PetwOHlhWTUmH
         g2hVE3W6dVIzJmwlcIAchl8Evl92gosuyZyyuclXeemDCAXNkcLD1wNo+4yJ49bX91QX
         nw2w==
X-Gm-Message-State: AOAM530hZI8D9ipSQPEjeLXh2bxt295oFo5QDlLlwK97ZO41/HxyAeKB
	EbaH4H9Q8qn4cA8cVYKHX1S4oZVd+Nu5VDmIkMs=
X-Google-Smtp-Source: ABdhPJzrSJEc3/HCJW8nfioEy9o6tqWRbCTy52D0c5jgl1VkjKrAtARMRsAxvfpYR4MHrnjFUcbZ4MAXmi1daeUHCsg=
X-Received: by 2002:a37:6195:: with SMTP id v143mr3422499qkb.71.1604604036461;
 Thu, 05 Nov 2020 11:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20201105093015.36886-1-mingli.yu@windriver.com> <20201105093015.36886-3-mingli.yu@windriver.com>
In-Reply-To: <20201105093015.36886-3-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 5 Nov 2020 11:20:10 -0800
Message-ID: <CAMKF1srN3p5HPwq1n0qg51g8yU7sS0Di9iX_hb89Unjsfs6WLg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 3/4] ntopng: add new recipe
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails http://errors.yoctoproject.org/Errors/Details/511661/

On Thu, Nov 5, 2020 at 1:30 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> ntopng is a web-based network traffic monitoring application
> released under GPLv3. It is the new incarnation of the original
> ntop written in 1998, and now revamped in terms of performance,
> usability, and features.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...kefile.in-don-t-use-the-internal-lua.patch | 39 +++++++++
>  ...utogen.sh-generate-configure.ac-only.patch | 36 ++++++++
>  ...1-configure.seed-fix-configure-error.patch | 42 ++++++++++
>  ...onfigure.seed-fix-host-contamination.patch | 82 +++++++++++++++++++
>  .../ntopng/files/ntopng.service               | 13 +++
>  .../recipes-support/ntopng/ntopng_4.2.bb      | 47 +++++++++++
>  6 files changed, 259 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
>  create mode 100644 meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
>  create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
>  create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
>  create mode 100644 meta-networking/recipes-support/ntopng/files/ntopng.service
>  create mode 100644 meta-networking/recipes-support/ntopng/ntopng_4.2.bb
>
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
> new file mode 100644
> index 000000000..46724558c
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
> @@ -0,0 +1,39 @@
> +From 65c15247d268566b79e4595b8e734b7e40679d75 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 4 Nov 2020 08:55:10 +0000
> +Subject: [PATCH] Makefile.in: don't use the internal lua
> +
> +ntopng depends on lua and it will compile the lua under
> +third-party sub dir of source tree, but this one supports
> +cross-compiling badly, so use the one under RECIPE_SYSROOT.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + Makefile.in | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 143535746..fc06a5341 100755
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -40,7 +40,6 @@ endif
> +
> + LUA_HOME=${PWD}/third-party/lua-5.3.5
> + LUA_INC=-I$(LUA_HOME)/src
> +-LUA_LIB=$(LUA_HOME)/src/liblua.a
> +
> + ######
> + LIBRRDTOOL_HOME=${PWD}/third-party/rrdtool-1.4.8
> +@@ -118,7 +117,6 @@ RPM_PKG = $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(PLATFORM).rpm
> + RPM_DATA_PKG = $(TARGET)-data-$(NTOPNG_VERSION)-@REVISION@.noarch.rpm
> + ######
> +
> +-LIB_TARGETS = $(LUA_LIB)
> +
> + ifneq ($(HAS_ZEROMQ), 0)
> + LIB_TARGETS += $(ZEROMQ_LIB)
> +--
> +2.26.2
> +
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
> new file mode 100644
> index 000000000..8d62147b9
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
> @@ -0,0 +1,36 @@
> +From 22f0bec462763f1b0b92daa33133e274d3b45f4f Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 5 Nov 2020 00:05:21 -0800
> +Subject: [PATCH] autogen.sh: generate configure.ac only
> +
> +The autogen.sh should only generate configure.ac and the
> +logic used to generate configure script should follow the
> +autotools.bbclass in oe. Otherwise there may comes below
> +do_configure error:
> + | checking whether we are cross compiling... configure: error: in `/path/tmp/work/core2-64-poky-linux/ndpi/3.4-r0/git':
> + | configure: error: cannot run C compiled programs.
> + | If you meant to cross compile, use `--host'.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + autogen.sh | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/autogen.sh b/autogen.sh
> +index 73f8d0ebe..15ff0aa84 100755
> +--- a/autogen.sh
> ++++ b/autogen.sh
> +@@ -73,8 +73,3 @@ cat configure.seed | sed \
> +     > configure.ac
> +
> + rm -f config.h config.h.in *~ #*
> +-
> +-echo "Wait please..."
> +-autoreconf -if
> +-echo ""
> +-echo "Now run ./configure"
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
> new file mode 100644
> index 000000000..dffab24ca
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
> @@ -0,0 +1,42 @@
> +From 29797dd037009d38e4976249ed21b2076240751e Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 4 Nov 2020 04:36:46 +0000
> +Subject: [PATCH] configure.seed: fix configure error
> +
> +fix the below error:
> +configure: error: cannot run test program while cross compiling
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + configure.seed | 13 +------------
> + 1 file changed, 1 insertion(+), 12 deletions(-)
> +
> +diff --git a/configure.seed b/configure.seed
> +index a321f9bbf..03f9a31b0 100644
> +--- a/configure.seed
> ++++ b/configure.seed
> +@@ -642,18 +642,7 @@ if test x$radcli = xtrue; then
> +   fi
> + fi
> +
> +-AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_supported], [
> +-  AC_TRY_RUN([
> +-  #include <pthread.h>
> +-
> +-  int main() {
> +-    pthread_rwlock_t t;
> +-    return 0;
> +-  }
> +-]
> +-, [my_cv_rw_locks_supported=yes], [my_cv_rw_locks_supported=no])
> +-]
> +-)
> ++AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_supported])
> +
> + if test "$my_cv_rw_locks_supported" = yes; then
> +   AC_DEFINE_UNQUOTED(HAVE_RW_LOCK, 1, [pthread rwlocks supported])
> +--
> +2.26.2
> +
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
> new file mode 100644
> index 000000000..a5ac59fb3
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
> @@ -0,0 +1,82 @@
> +From 81e3512718f80965c26ccb1f9d694c91b121fea0 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 4 Nov 2020 06:28:28 +0000
> +Subject: [PATCH] configure.seed: fix host contamination
> +
> +Fix below error:
> +This autoconf log indicates errors, it looked at host include and/or
> +library paths while determining system capabilities.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + configure.seed | 47 +++++------------------------------------------
> + 1 file changed, 5 insertions(+), 42 deletions(-)
> +
> +diff --git a/configure.seed b/configure.seed
> +index 03f9a31b0..58aebb5b8 100644
> +--- a/configure.seed
> ++++ b/configure.seed
> +@@ -79,31 +79,6 @@ fi
> + #
> + REVISION=`git log --pretty=oneline | wc -l`
> +
> +-if test -d "/usr/local/include"; then
> +-  CFLAGS="${CFLAGS} -I/usr/local/include"
> +-  CPPFLAGS="${CPPFLAGS} -I/usr/local/include"
> +-fi
> +-
> +-if test -d "/usr/local/lib"; then
> +-  LDFLAGS="${LDFLAGS} -L/usr/local/lib"
> +-fi
> +-
> +-if test -d /opt/local/include; then :
> +-  CFLAGS="${CFLAGS} -I/opt/local/include"
> +-  CPPFLAGS="${CPPFLAGS} -I/opt/local/include"
> +-fi
> +-
> +-if test -d /opt/local/lib; then :
> +-  LDFLAGS="${LDFLAGS} -L/opt/local/lib"
> +-fi
> +-
> +-if [ test -f /usr/bin/lsb_release ]; then
> +-  CODENAME=`/usr/bin/lsb_release -c|cut -f 2`
> +-  if [[ $CODENAME == "wheezy" ]]; then :
> +-    CPPFLAGS="${CPPFLAGS} -DOLD_NETFILTER_INTERFACE=1"
> +-  fi
> +-fi
> +-
> + SHORT_MACHINE=`uname -m | cut -b1-3`
> +
> + GIT_RELEASE="@GIT_RELEASE@"
> +@@ -214,23 +189,11 @@ dnl> fi
> + pkg-config --exists libssl
> + if test "$?" -ne 1; then
> +   AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
> +-  SSL_INC="`pkg-config --cflags libssl` -I/usr/include/openssl"
> ++  SSL_INC="`pkg-config --cflags libssl`"
> +   SSL_LIB="`pkg-config --libs libssl` -lssl -lcrypto"
> + else
> +-  dnl Workaround for MacOS Brew
> +-  if test -d "/usr/local/opt/openssl/lib"; then
> +-    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
> +-    SSL_INC="-I/usr/local/opt/openssl/include"
> +-    SSL_LIB="-L/usr/local/opt/openssl/lib -lssl"
> +-  dnl Workaround for FreeBSD
> +-  elif test -f "/usr/lib/libssl.so"; then
> +-    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
> +-    SSL_INC="-I/usr/include"
> +-    SSL_LIB="-L/usr/lib -lssl -lcrypto"
> +-  else
> +-    echo "Please install openssl-dev(el) package prerequisite"
> +-    exit -1
> +-  fi
> ++  echo "Please install openssl-dev(el) package prerequisite"
> ++  exit -1
> + fi
> +
> + AC_CHECK_LIB([gcrypt], [gcry_cipher_checktag], [LDFLAGS="${LDFLAGS} -lgcrypt"])
> +--
> +2.26.2
> +
> diff --git a/meta-networking/recipes-support/ntopng/files/ntopng.service b/meta-networking/recipes-support/ntopng/files/ntopng.service
> new file mode 100644
> index 000000000..66912fbef
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/files/ntopng.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=ntopng - High-Speed Web-based Traffic Analysis and Flow Collection Tool
> +After=network.target
> +
> +[Service]
> +Type=forking
> +StandardOutput=syslog
> +StandardError=inherit
> +ExecStart=/usr/bin/ntopng -e -w 3000
> +Restart=on-abort
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
> new file mode 100644
> index 000000000..250fe8fbe
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
> @@ -0,0 +1,47 @@
> +SUMMARY = "Web-based Traffic and Security Network Traffic Monitoring"
> +DESCRIPTION = "ntopng is a web-based network traffic monitoring application \
> +released under GPLv3. It is the new incarnation of the original \
> +ntop written in 1998, and now revamped in terms of performance, \
> +usability, and features."
> +
> +SECTION = "console/network"
> +
> +DEPENDS = "curl libmaxminddb libpcap lua mariadb ndpi json-c rrdtool zeromq"
> +RDEPENDS_${PN} = "bash redis"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRCREV = "5e649a2d1130b4a3ab0c5bb673d615172cc0bdbb"
> +SRC_URI = "git://github.com/ntop/ntopng.git;protocol=git;branch=4.2-stable \
> +           file://0001-configure.seed-fix-configure-error.patch \
> +           file://0001-configure.seed-fix-host-contamination.patch \
> +           file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
> +           file://0001-autogen.sh-generate-configure.ac-only.patch \
> +           file://ntopng.service \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +# don't use the lua under thirdparty as it supports cross compiling badly
> +export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
> +
> +LDFLAGS_append_mipsarch = " -latomic"
> +LDFLAGS_append_powerpc = " -latomic"
> +inherit autotools-brokensep gettext systemd
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${WORKDIR}/ntopng.service ${D}${systemd_unitdir}/system
> +}
> +
> +FILES_${PN} += "\
> +    ${systemd_unitdir}/system/ntopng.service"
> +
> +FILES_${PN}-doc += "\
> +    /usr/man/man8/ntopng.8"
> +
> +do_configure_prepend() {
> +    ${S}/autogen.sh
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "ntopng.service"
> --
> 2.26.2
>
>
> 
>
