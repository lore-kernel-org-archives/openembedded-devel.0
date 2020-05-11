Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.1244.1589222097026887100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 11:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LIB63j+s;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id v4so7924485qte.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2020 11:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W2yKTiGDfyAGbc/LPYKLCchBLzpiuYCsXg421J2DGlA=;
        b=LIB63j+sGEa6/Lhl6BerMI5pxItHpIEKYZKwD6EtbJbzh5ZWLMNZcV5JBZONX1/6e0
         JhrMvY+IKp4TaLwbm5vLtMudNEvPhgQgnQZalSIimSL2hgyP5It1r6azTF1D9vsBzJZP
         2QmdTOCfq54gMLN5x0BWj+rNqfj04RJUIQ22VPUXi1IuSEv9scoYYkRIjFSPiecE43Z9
         4Y614JQbaZaWUEfAPeEbomJGHWtk3wL/F1sEbJv9ZmxrgvwmnIg4IiyMHV9GnHhHzBfJ
         tnG3Te5xYiJAeILFcvo18dQqPC7GpgZTXYndN8D9h5N7yHUuy4bI9TAt2FDXRP8B3sLX
         R17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W2yKTiGDfyAGbc/LPYKLCchBLzpiuYCsXg421J2DGlA=;
        b=cY7vZ9WaeVmIq6Y27KHG958T1v324fli+X5J2U9Y9Njya4BE5f6BZOw1syGdpAr2Nc
         9oX3poFXNOGZC5pt1htyRkXnOs2StHuQIR4Jrs+/B+TBHnk85qkyFDny73IW+c8dDz3z
         /PaNknEj+WuikP7V/OHa1ABVuIbmHL05ug9drgG1HLmOdkzCynuieqpRKgQ7fGKBJ2eo
         VFFxQXuYExFYJLQvrwCm0CJZr8s+LZ1N63B+wX330fsH2dBQfjBpfzSCmparJY/wgJLK
         WJXVDxhAG7LU2QDTcjfBZFeBafyXl+5yGAYPwYFMkPar0vMToptgJZZJGBbo8N4jRKbF
         Z7Lw==
X-Gm-Message-State: AGi0PuYhvhNpBaUolV0304stNZbPNNv7RYNn/JaJBBBz4xdPSOtEhBpd
	MjGUM1oXLWiuDxLOxsfUDA2zphHrskq6rSvuOdui0GG2bFs=
X-Google-Smtp-Source: APiQypKYU73UE1SkiYWX0q/AfxR0bRM+/qUeM9MH9478ZG7FIuIrxMI9P1WjcBmAaj70TZ1/jzrXwMgbQDzBwguGQgQ=
X-Received: by 2002:aed:308e:: with SMTP id 14mr17871134qtf.146.1589222095284;
 Mon, 11 May 2020 11:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200429170447.28554-1-leon.anavi@konsulko.com> <CAMKF1sp=18ZaiMK457ej9TQbkVr-qxDYBw9mU=_ZJpx-jaDVSA@mail.gmail.com>
In-Reply-To: <CAMKF1sp=18ZaiMK457ej9TQbkVr-qxDYBw9mU=_ZJpx-jaDVSA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 11 May 2020 11:34:29 -0700
Message-ID: <CAMKF1sphfJwqHNd=q0sVQOKf7m3NktLoCVwNjPf=JCLS-uP_4g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] lirc: upgrade 0.9.4d -> 0.10.1
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Leon Anavi <leon.anavi@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

happening again after re-adding

https://errors.yoctoproject.org/Errors/Details/411339/

I am dropping it. Unless we have clarity on why its happening. It
might be some sort of race

On Thu, May 7, 2020 at 5:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing this error
>
> https://errors.yoctoproject.org/Errors/Details/410835/
>
> On Wed, Apr 29, 2020 at 10:05 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
> >
> > Upgrade Linux Infrared Remote Control (LIRC) to the latest version
> > 0.10.1. Remove redundant old patches. Apply a new patch from Arch
> > Linux FS#57792 that fixes build errors. Create tar.gz archive
> > (PYTHON_TARBALL) which LIRC needs for install-nodist_pkgdataDATA.
> > Add python3-setuptools-native as a dependency. Replace path to
> > python3 in scripts based on a similar approach as in the recipe
> > for blueman.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  .../lirc/lirc/fix_build_errors.patch          |  30 ++++++
> >  .../lirc/lirc/pollfd.patch                    | 101 ------------------
> >  .../lirc/{lirc_0.9.4d.bb => lirc_0.10.1.bb}   |  27 ++++-
> >  3 files changed, 53 insertions(+), 105 deletions(-)
> >  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
> >  delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
> >  rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/{lirc_0.9.4d.bb => lirc_0.10.1.bb} (74%)
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
> > new file mode 100644
> > index 000000000..41353dbbd
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
> > @@ -0,0 +1,30 @@
> > +diff --git a/configure.ac b/configure.ac
> > +index 58347d8..8c7fca2 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -77,15 +77,10 @@ AC_TYPE_UINT64_T
> > +
> > + dnl AC_TYPE_GETGROUPS seems broken on recent MacOS, so:
> > + AC_MSG_CHECKING([Figure out if getgrouplist() needs gid_t or int])
> > +-oldcflags="$CFLAGS"
> > +-export CFLAGS=-Werror
> > + AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> > + #include <unistd.h>
> > +-#include <grp.h>
> > +-  ]], [[
> > +-gid_t groups[32]; int ngroups; const char* user = "root";
> > +-getgrouplist(user, 1, groups, &ngroups);
> > +-  ]])],[
> > ++int getgroups(int gidsetsize, gid_t grouplist[]);
> > ++  ]], [[  ]])],[
> > +     AC_MSG_RESULT(gid_t)
> > +     AC_DEFINE(GETGROUPS_T,[gid_t])
> > +   ],[
> > +@@ -93,7 +88,6 @@ getgrouplist(user, 1, groups, &ngroups);
> > +     AC_DEFINE(GETGROUPS_T,[int])
> > +   ]
> > + )
> > +-export CFLAGS="$oldcflags"
> > +
> > + dnl Checks for library functions.
> > + AC_CHECK_FUNCS(gethostname gettimeofday mkfifo select socket strdup \
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
> > deleted file mode 100644
> > index 4feea8034..000000000
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
> > +++ /dev/null
> > @@ -1,101 +0,0 @@
> > -Index: lirc-0.9.4d/daemons/lircrcd.cpp
> > -===================================================================
> > ---- lirc-0.9.4d.orig/daemons/lircrcd.cpp
> > -+++ lirc-0.9.4d/daemons/lircrcd.cpp
> > -@@ -29,10 +29,12 @@
> > - #include <sys/un.h>
> > - #include <sys/stat.h>
> > - #include <sys/types.h>
> > -+#include <poll.h>
> > - #include <syslog.h>
> > -
> > - #include "lirc_client.h"
> > - #include "lirc/lirc_log.h"
> > -+#include "lirc/curl_poll.h"
> > -
> > - #define MAX_CLIENTS 100
> > - #define WHITE_SPACE " \t"
> > -Index: lirc-0.9.4d/lib/curl_poll.c
> > -===================================================================
> > ---- lirc-0.9.4d.orig/lib/curl_poll.c
> > -+++ lirc-0.9.4d/lib/curl_poll.c
> > -@@ -36,6 +36,7 @@
> > - #include <stdlib.h>
> > - #include <sys/time.h>
> > - #include <sys/types.h>
> > -+#include <sys/poll.h>
> > -
> > - #include "lirc_log.h"
> > - #include "curl_poll.h"
> > -@@ -67,7 +68,7 @@ static const logchannel_t logchannel = L
> > -
> > - #ifdef HAVE_POLL_FINE
> > -
> > --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
> > -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
> > - {
> > -       return poll(ufds, nfds, timeout_ms);
> > - }
> > -@@ -112,7 +113,7 @@ static int verify_sock(int s)
> > - }
> > -
> > -
> > --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
> > -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
> > - {
> > -       struct timeval pending_tv;
> > -       struct timeval* ptimeout;
> > -Index: lirc-0.9.4d/lib/curl_poll.h
> > -===================================================================
> > ---- lirc-0.9.4d.orig/lib/curl_poll.h
> > -+++ lirc-0.9.4d/lib/curl_poll.h
> > -@@ -1,5 +1,5 @@
> > --#ifndef _POLL_H
> > --#define _POLL_H
> > -+#ifndef _LIB_CURL_POLL_H
> > -+#define _LIB_CURL_POLL_H
> > - /***************************************************************************
> > -  *                                  _   _ ____  _
> > -  *  Project                     ___| | | |  _ \| |
> > -@@ -29,13 +29,9 @@
> > - extern "C" {
> > - #endif
> > -
> > --#ifdef HAVE_SYS_POLL_H
> > --#include <sys/poll.h>
> > --#else
> > - #include <poll.h>
> > --#endif
> > -
> > --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
> > -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
> > -
> > - #ifdef __cplusplus
> > - }
> > -Index: lirc-0.9.4d/lib/lirc/curl_poll.h
> > -===================================================================
> > ---- lirc-0.9.4d.orig/lib/lirc/curl_poll.h
> > -+++ lirc-0.9.4d/lib/lirc/curl_poll.h
> > -@@ -1,5 +1,5 @@
> > --#ifndef _POLL_H
> > --#define _POLL_H
> > -+#ifndef _LIRC_CURL_POLL_H
> > -+#define _LIRC_CURL_POLL_H
> > - /***************************************************************************
> > -  *                                  _   _ ____  _
> > -  *  Project                     ___| | | |  _ \| |
> > -@@ -29,13 +29,9 @@
> > - extern "C" {
> > - #endif
> > -
> > --#ifdef HAVE_SYS_POLL_H
> > --#include <sys/poll.h>
> > --#else
> > - #include <poll.h>
> > --#endif
> > -
> > --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
> > -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
> > -
> > - #ifdef __cplusplus
> > - }
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
> > similarity index 74%
> > rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
> > rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
> > index f59969673..b29516576 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
> > @@ -6,13 +6,13 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
> >  HOMEPAGE = "http://www.lirc.org"
> >  SECTION = "console/network"
> >  LICENSE = "GPLv2"
> > -DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 python3-pyyaml"
> > +DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 python3-pyyaml python3-setuptools-native"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
> > -    file://pollfd.patch \
> >      file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
> > +    file://fix_build_errors.patch \
> >      file://lircd.service \
> >      file://lircd.init \
> >      file://lircexec.init \
> > @@ -20,8 +20,8 @@ SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
> >      file://lirc_options.conf \
> >      file://lirc.tmpfiles \
> >  "
> > -SRC_URI[md5sum] = "0d11679cbdd94a5a6da00a8e7231b4bf"
> > -SRC_URI[sha256sum] = "c68f18c35b489b865c0a741d119b136e8702191538cd3551b977a7af6c4e41ab"
> > +SRC_URI[md5sum] = "86c3f8e4efaba10571addb8313d1e040"
> > +SRC_URI[sha256sum] = "8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2"
> >
> >  SYSTEMD_PACKAGES = "lirc lirc-exec"
> >  SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service lircd-setup.service lircd-uinput.service"
> > @@ -41,7 +41,26 @@ PACKAGECONFIG ?= " \
> >  CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
> >
> >  #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
> > +
> > +# Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgdataDATA
> > +do_install_prepend() {
> > +    rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
> > +    mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
> > +    tar --exclude='${WORKDIR}/${PN}-${PV}/python-pkg/*' -czf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}
> > +}
> > +
> > +# In code, path to python is a variable that is replaced with path to native version of it
> > +# during the configure stage, e.g ../recipe-sysroot-native/usr/bin/python3-native/python3.
> > +# Replace it with #!/usr/bin/env python3
> >  do_install_append() {
> > +    sed -i '1c#!/usr/bin/env python3' ${D}${bindir}/lirc-setup \
> > +                                      ${D}${PYTHON_SITEPACKAGES_DIR}/lirc-setup/lirc-setup \
> > +                                      ${D}${bindir}/irtext2udp \
> > +                                      ${D}${bindir}/lirc-init-db \
> > +                                      ${D}${bindir}/irdb-get \
> > +                                      ${D}${bindir}/pronto2lirc \
> > +                                      ${D}${sbindir}/lircd-setup
> > +
> >      install -m 0755 -d ${D}${sysconfdir}
> >      install -m 0755 -d ${D}${sysconfdir}/lirc
> >      install -m 0755 -d ${D}${systemd_unitdir}/system
> > --
> > 2.17.1
> >
> > 
