Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web12.6721.1589293104375406464
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 07:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TV56eQUP;
 spf=pass (domain: konsulko.com, ip: 209.85.208.171, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f171.google.com with SMTP id l19so13874330lje.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=k6xMnLTe7vSwj02HspdI/EtXskpm+I08bPGVCRO3i8I=;
        b=TV56eQUP7nkBGo8Mg2GmfByGm1XXJ0ctkirgrFTQpvDYJuwtdWL3L7UV0SDPloh9Sy
         sLdlYHq+KfBHrHcj0DxvGhEXBso0KV9tzX0cag56myCM9QaqASn/1OW4M/DH6/n3ZKVi
         +2ZC0gEuX9mk3xtLJii5ibDDTL10Ogf6zSTp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=k6xMnLTe7vSwj02HspdI/EtXskpm+I08bPGVCRO3i8I=;
        b=UAFgwBDR2udwe0GesdiM7MenoMkssO5LO25J7u68g5eFSe9DsON2HtaQdV8rxoaE8a
         pOIqUlLlKl0Ma3PTtPPc3fDh3kJToJ5XIywOOCaIibsmpVWGwiy0cg0SiZxqZJZDagUD
         w0IHVfk5BJT2eDfRQe9rQwCnfyQs012lNuUVoIJIBVypkDREaGNi+Ts7EmI/FERYiWgx
         fF0cZeaQrai8coEE/tYR2nsrqaCOovzDdPlWLnn6mCKr5mTvz1XTK+xAr8D6bmhO2E1g
         ThnP9MSTM9EX6Mp+cKOQrlnx7w8U/VJyTHoJ6z6bhj5+VQncLgiNAA0E78hJmvDwo5kt
         1GoQ==
X-Gm-Message-State: AOAM530SREixjcg4o2TAIZlBERgWOMbJDqlWdC9eMtZs1CprTxFiC+AR
	QPtNNZYE21FfieCz0/k7NDEF+HtSdTI=
X-Google-Smtp-Source: ABdhPJxEiNYgWMEAB4wYP8l0CrAtucCdRxUgXh/KO1Y99ENsofP12zJuOxlw18kfLmMVTsn/NXGrOw==
X-Received: by 2002:a2e:988f:: with SMTP id b15mr14545742ljj.232.1589293101956;
        Tue, 12 May 2020 07:18:21 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id a6sm12990303ljk.22.2020.05.12.07.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 07:18:21 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCHv2] lirc: upgrade 0.9.4d -> 0.10.1
To: Khem Raj <raj.khem@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200429170447.28554-1-leon.anavi@konsulko.com>
 <CAMKF1sp=18ZaiMK457ej9TQbkVr-qxDYBw9mU=_ZJpx-jaDVSA@mail.gmail.com>
 <CAMKF1sphfJwqHNd=q0sVQOKf7m3NktLoCVwNjPf=JCLS-uP_4g@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <071d2843-edf4-f0ea-bd7d-4de126785476@konsulko.com>
Date: Tue, 12 May 2020 17:18:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sphfJwqHNd=q0sVQOKf7m3NktLoCVwNjPf=JCLS-uP_4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

I've finally managed to reproduced it while building on a more powerful 
machine. Indeed, looks like a race condition. To avoid it I've extended 
do_configure to ensure python-pkg/VERSION exists. I'll submit version 3 
of the patch shortly. Thank you for your time helping me out with this 
issue in IRC during the weekend.

Best regards,
Leon

On 11.05.20 г. 21:34 ч., Khem Raj wrote:
> happening again after re-adding
>
> https://errors.yoctoproject.org/Errors/Details/411339/
>
> I am dropping it. Unless we have clarity on why its happening. It
> might be some sort of race
>
> On Thu, May 7, 2020 at 5:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>> seeing this error
>>
>> https://errors.yoctoproject.org/Errors/Details/410835/
>>
>> On Wed, Apr 29, 2020 at 10:05 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>>> Upgrade Linux Infrared Remote Control (LIRC) to the latest version
>>> 0.10.1. Remove redundant old patches. Apply a new patch from Arch
>>> Linux FS#57792 that fixes build errors. Create tar.gz archive
>>> (PYTHON_TARBALL) which LIRC needs for install-nodist_pkgdataDATA.
>>> Add python3-setuptools-native as a dependency. Replace path to
>>> python3 in scripts based on a similar approach as in the recipe
>>> for blueman.
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>   .../lirc/lirc/fix_build_errors.patch          |  30 ++++++
>>>   .../lirc/lirc/pollfd.patch                    | 101 ------------------
>>>   .../lirc/{lirc_0.9.4d.bb => lirc_0.10.1.bb}   |  27 ++++-
>>>   3 files changed, 53 insertions(+), 105 deletions(-)
>>>   create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
>>>   delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
>>>   rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/{lirc_0.9.4d.bb => lirc_0.10.1.bb} (74%)
>>>
>>> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
>>> new file mode 100644
>>> index 000000000..41353dbbd
>>> --- /dev/null
>>> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
>>> @@ -0,0 +1,30 @@
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 58347d8..8c7fca2 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -77,15 +77,10 @@ AC_TYPE_UINT64_T
>>> +
>>> + dnl AC_TYPE_GETGROUPS seems broken on recent MacOS, so:
>>> + AC_MSG_CHECKING([Figure out if getgrouplist() needs gid_t or int])
>>> +-oldcflags="$CFLAGS"
>>> +-export CFLAGS=-Werror
>>> + AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
>>> + #include <unistd.h>
>>> +-#include <grp.h>
>>> +-  ]], [[
>>> +-gid_t groups[32]; int ngroups; const char* user = "root";
>>> +-getgrouplist(user, 1, groups, &ngroups);
>>> +-  ]])],[
>>> ++int getgroups(int gidsetsize, gid_t grouplist[]);
>>> ++  ]], [[  ]])],[
>>> +     AC_MSG_RESULT(gid_t)
>>> +     AC_DEFINE(GETGROUPS_T,[gid_t])
>>> +   ],[
>>> +@@ -93,7 +88,6 @@ getgrouplist(user, 1, groups, &ngroups);
>>> +     AC_DEFINE(GETGROUPS_T,[int])
>>> +   ]
>>> + )
>>> +-export CFLAGS="$oldcflags"
>>> +
>>> + dnl Checks for library functions.
>>> + AC_CHECK_FUNCS(gethostname gettimeofday mkfifo select socket strdup \
>>> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
>>> deleted file mode 100644
>>> index 4feea8034..000000000
>>> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
>>> +++ /dev/null
>>> @@ -1,101 +0,0 @@
>>> -Index: lirc-0.9.4d/daemons/lircrcd.cpp
>>> -===================================================================
>>> ---- lirc-0.9.4d.orig/daemons/lircrcd.cpp
>>> -+++ lirc-0.9.4d/daemons/lircrcd.cpp
>>> -@@ -29,10 +29,12 @@
>>> - #include <sys/un.h>
>>> - #include <sys/stat.h>
>>> - #include <sys/types.h>
>>> -+#include <poll.h>
>>> - #include <syslog.h>
>>> -
>>> - #include "lirc_client.h"
>>> - #include "lirc/lirc_log.h"
>>> -+#include "lirc/curl_poll.h"
>>> -
>>> - #define MAX_CLIENTS 100
>>> - #define WHITE_SPACE " \t"
>>> -Index: lirc-0.9.4d/lib/curl_poll.c
>>> -===================================================================
>>> ---- lirc-0.9.4d.orig/lib/curl_poll.c
>>> -+++ lirc-0.9.4d/lib/curl_poll.c
>>> -@@ -36,6 +36,7 @@
>>> - #include <stdlib.h>
>>> - #include <sys/time.h>
>>> - #include <sys/types.h>
>>> -+#include <sys/poll.h>
>>> -
>>> - #include "lirc_log.h"
>>> - #include "curl_poll.h"
>>> -@@ -67,7 +68,7 @@ static const logchannel_t logchannel = L
>>> -
>>> - #ifdef HAVE_POLL_FINE
>>> -
>>> --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
>>> -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
>>> - {
>>> -       return poll(ufds, nfds, timeout_ms);
>>> - }
>>> -@@ -112,7 +113,7 @@ static int verify_sock(int s)
>>> - }
>>> -
>>> -
>>> --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
>>> -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
>>> - {
>>> -       struct timeval pending_tv;
>>> -       struct timeval* ptimeout;
>>> -Index: lirc-0.9.4d/lib/curl_poll.h
>>> -===================================================================
>>> ---- lirc-0.9.4d.orig/lib/curl_poll.h
>>> -+++ lirc-0.9.4d/lib/curl_poll.h
>>> -@@ -1,5 +1,5 @@
>>> --#ifndef _POLL_H
>>> --#define _POLL_H
>>> -+#ifndef _LIB_CURL_POLL_H
>>> -+#define _LIB_CURL_POLL_H
>>> - /***************************************************************************
>>> -  *                                  _   _ ____  _
>>> -  *  Project                     ___| | | |  _ \| |
>>> -@@ -29,13 +29,9 @@
>>> - extern "C" {
>>> - #endif
>>> -
>>> --#ifdef HAVE_SYS_POLL_H
>>> --#include <sys/poll.h>
>>> --#else
>>> - #include <poll.h>
>>> --#endif
>>> -
>>> --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
>>> -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
>>> -
>>> - #ifdef __cplusplus
>>> - }
>>> -Index: lirc-0.9.4d/lib/lirc/curl_poll.h
>>> -===================================================================
>>> ---- lirc-0.9.4d.orig/lib/lirc/curl_poll.h
>>> -+++ lirc-0.9.4d/lib/lirc/curl_poll.h
>>> -@@ -1,5 +1,5 @@
>>> --#ifndef _POLL_H
>>> --#define _POLL_H
>>> -+#ifndef _LIRC_CURL_POLL_H
>>> -+#define _LIRC_CURL_POLL_H
>>> - /***************************************************************************
>>> -  *                                  _   _ ____  _
>>> -  *  Project                     ___| | | |  _ \| |
>>> -@@ -29,13 +29,9 @@
>>> - extern "C" {
>>> - #endif
>>> -
>>> --#ifdef HAVE_SYS_POLL_H
>>> --#include <sys/poll.h>
>>> --#else
>>> - #include <poll.h>
>>> --#endif
>>> -
>>> --int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
>>> -+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
>>> -
>>> - #ifdef __cplusplus
>>> - }
>>> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
>>> similarity index 74%
>>> rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
>>> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
>>> index f59969673..b29516576 100644
>>> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
>>> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
>>> @@ -6,13 +6,13 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
>>>   HOMEPAGE = "http://www.lirc.org"
>>>   SECTION = "console/network"
>>>   LICENSE = "GPLv2"
>>> -DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 python3-pyyaml"
>>> +DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 python3-pyyaml python3-setuptools-native"
>>>
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>
>>>   SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
>>> -    file://pollfd.patch \
>>>       file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
>>> +    file://fix_build_errors.patch \
>>>       file://lircd.service \
>>>       file://lircd.init \
>>>       file://lircexec.init \
>>> @@ -20,8 +20,8 @@ SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
>>>       file://lirc_options.conf \
>>>       file://lirc.tmpfiles \
>>>   "
>>> -SRC_URI[md5sum] = "0d11679cbdd94a5a6da00a8e7231b4bf"
>>> -SRC_URI[sha256sum] = "c68f18c35b489b865c0a741d119b136e8702191538cd3551b977a7af6c4e41ab"
>>> +SRC_URI[md5sum] = "86c3f8e4efaba10571addb8313d1e040"
>>> +SRC_URI[sha256sum] = "8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2"
>>>
>>>   SYSTEMD_PACKAGES = "lirc lirc-exec"
>>>   SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service lircd-setup.service lircd-uinput.service"
>>> @@ -41,7 +41,26 @@ PACKAGECONFIG ?= " \
>>>   CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
>>>
>>>   #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
>>> +
>>> +# Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgdataDATA
>>> +do_install_prepend() {
>>> +    rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
>>> +    mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
>>> +    tar --exclude='${WORKDIR}/${PN}-${PV}/python-pkg/*' -czf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}
>>> +}
>>> +
>>> +# In code, path to python is a variable that is replaced with path to native version of it
>>> +# during the configure stage, e.g ../recipe-sysroot-native/usr/bin/python3-native/python3.
>>> +# Replace it with #!/usr/bin/env python3
>>>   do_install_append() {
>>> +    sed -i '1c#!/usr/bin/env python3' ${D}${bindir}/lirc-setup \
>>> +                                      ${D}${PYTHON_SITEPACKAGES_DIR}/lirc-setup/lirc-setup \
>>> +                                      ${D}${bindir}/irtext2udp \
>>> +                                      ${D}${bindir}/lirc-init-db \
>>> +                                      ${D}${bindir}/irdb-get \
>>> +                                      ${D}${bindir}/pronto2lirc \
>>> +                                      ${D}${sbindir}/lircd-setup
>>> +
>>>       install -m 0755 -d ${D}${sysconfdir}
>>>       install -m 0755 -d ${D}${sysconfdir}/lirc
>>>       install -m 0755 -d ${D}${systemd_unitdir}/system
>>> --
>>> 2.17.1
>>>
>>> 

-- 
Leon Anavi
Software Engineer
konsulko.com

