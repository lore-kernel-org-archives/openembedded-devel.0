Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9711FC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 01:33:32 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.867.1646789609699266552
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 17:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IJwRg3v+;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id b12so926663qvk.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 17:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gu1R7WwpCR9/idw6BZxP3RfnRi8ZOG+NVHAb0ZvSc2k=;
        b=IJwRg3v+MEDMQpna22vA8J4aAIgd+Ri6nAhwbfarz6RRa/alafjjjKKD0NEUpFbr2L
         zAPJJTtAkSa3g9UEGAm+ffnNO+w8UevNXruiEws798zOMO53Zpm2NL00CDDyI3173nvG
         ABO23MqP52qyGsBOBJ1oUrXur+kFQKxfBCCG1e1Kw0Ry+uicsZSg0jSCMH5Jsk5paIAZ
         xsWyP94nW+tX87jL9F6CwGMxJj3BBdImdAYDyIP18DsTft/4w1duYJbbcanMO5Iy/y99
         Urlz+soKDwHuvR8ArMk4kNltRdx5/qSlvoZQR4g4lzO6IG6AwGMa+aMONOxqjsUGwUEG
         mXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gu1R7WwpCR9/idw6BZxP3RfnRi8ZOG+NVHAb0ZvSc2k=;
        b=b5AE3CIdoFX90j+eTiZN9HoRkgKzDt2NZqSyU/S/AreHeVpQzQdWJUOzrLBRnEHSkB
         289tRTf6QaOG/5gIjEeYulC9oKP1UXg4caoy1eT+2bRcXYgFoUCB/iqSRbBQhoUNZrbi
         8hUezxxnNQwyjki7S4lW9cQ9kcKUSk09b7FTpT39gH7S3HndjTrhEiQbtV+w8O0GI2e4
         WCwnWF2h6b5vHpAWycQaKY4eAcvVWaxFOJuyPCKLkNnmoIbRv0b4VzivTZwuN+QZsEjm
         KRF4z6DBgShLIBzTYNWxgugwxp7joBQSEjdlfzCTFTPtAIyS8NhvrpTDeoGONd8qF8ze
         318Q==
X-Gm-Message-State: AOAM531v3wNRQ2fGQmK+6/8fdTpnMoAhEmpC776Wg3vkD/0TUKUoUKTd
	aMZ1KDHhYn6hEpTxpZNNuc+qc6Z1vXjJ9BVxD4MXFkllz4m3AA==
X-Google-Smtp-Source: 
 ABdhPJyUwCnDufUtmYWsVBaGws66u7n84Hv8FM90T9Xpmt4+d4pcxbKUQG16RIX+FJSph1/g+eKQ1VOznx+xhF+rd2g=
X-Received: by 2002:ad4:5def:0:b0:435:ac38:a77e with SMTP id
 jn15-20020ad45def000000b00435ac38a77emr4650641qvb.24.1646789608590; Tue, 08
 Mar 2022 17:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20220308151802.24837-1-ceggers@arri.de>
In-Reply-To: <20220308151802.24837-1-ceggers@arri.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Mar 2022 17:33:02 -0800
Message-ID: 
 <CAMKF1srstt_EVEmMdjOzima8VHLp3K30Ty1v=c2AvqWhO+ZANQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libiio: update to version 0.23
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 01:33:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95891

this fails to configure see

https://errors.yoctoproject.org/Errors/Details/651289/

I think you need a patch something on these lines

  diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 91db382a..eed83a46 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -291,7 +291,7 @@ if (WITH_ZSTD)
  endif (WITH_ZSTD)

  include_directories(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
 -
 +include(CheckCSourceCompiles)
  if(WITH_NETWORK_BACKEND)
     message(STATUS "Building with Network back end support")
     if (WIN32)


Try it out and test and resend if it fixes the problem.

On Tue, Mar 8, 2022 at 7:18 AM Christian Eggers <ceggers@arri.de> wrote:
>
> - drop 0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
>   (integrated upstream)
> - new PACKAGECONFIG "xml_backend" (WITH_XML_BACKEND=off must be
>   explicitly provided if libxml2 is not available)
> - new PACKAGECONFIG "dnssd" (HAVE_DNS_SD=off must be explicitly provided
>   if libavahi is not available)
> - python library has been renamed (libiio --> pylibiio)
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  ...rify-whether-libiio-is-installed-whe.patch | 34 -------------------
>  meta-oe/recipes-support/libiio/libiio_git.bb  | 21 ++++++------
>  2 files changed, 10 insertions(+), 45 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
>
> diff --git a/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch b/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
> deleted file mode 100644
> index 4d3dcd5cedd4..000000000000
> --- a/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 717b0f46b23ddc042da481d1d446bdd1c6c49142 Mon Sep 17 00:00:00 2001
> -From: Julien Malik <julien.malik@unseenlabs.fr>
> -Date: Mon, 27 Jul 2020 14:34:44 +0200
> -Subject: [PATCH] python: Do not verify whether libiio is installed when
> - cross-compiling
> -
> -This should fix #561
> -
> -Signed-off-by: Julien Malik <julien.malik@paraiso.me>
> ----
> - bindings/python/setup.py.cmakein | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/bindings/python/setup.py.cmakein b/bindings/python/setup.py.cmakein
> -index cd14e2e..96d58a8 100644
> ---- a/bindings/python/setup.py.cmakein
> -+++ b/bindings/python/setup.py.cmakein
> -@@ -54,6 +54,13 @@ class InstallWrapper(install):
> -         install.run(self)
> -
> -     def _check_libiio_installed(self):
> -+        cross_compiling = ("${CMAKE_CROSSCOMPILING}" == "TRUE")
> -+        if cross_compiling:
> -+            # When cross-compiling, we generally cannot dlopen
> -+            # the libiio shared lib from the build platform.
> -+            # Simply skip this check in that case.
> -+            return
> -+
> -         from platform import system as _system
> -         from ctypes import CDLL as _cdll
> -         from ctypes.util import find_library
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index 2c22838bbf21..918ab277481c 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -4,12 +4,10 @@ SECTION = "libs"
>  LICENSE = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
>
> -SRCREV = "565bf68eccfdbbf22cf5cb6d792e23de564665c7"
> -PV = "0.21+git${SRCPV}"
> +SRCREV = "92d6a35f3d8d721cda7d6fe664b435311dd368b4"
> +PV = "0.23"
>
> -SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=master \
> -           file://0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch \
> -"
> +SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=master"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
>  S = "${WORKDIR}/git"
> @@ -28,16 +26,16 @@ EXTRA_OECMAKE = " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
>  "
>
> -PACKAGECONFIG ??= "usb_backend network_backend serial_backend"
> -
> -NETWORK_BACKEND_DEPENDENCIES = "\
> -    libxml2 \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
> +PACKAGECONFIG ??= " \
> +    usb_backend network_backend serial_backend xml_backend \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'dnssd', '', d)} \
>  "
>
>  PACKAGECONFIG[usb_backend] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1 libxml2"
> -PACKAGECONFIG[network_backend] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF, ${NETWORK_BACKEND_DEPENDENCIES}"
> +PACKAGECONFIG[network_backend] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
>  PACKAGECONFIG[serial_backend] = "-DWITH_SERIAL_BACKEND=ON,-DWITH_SERIAL_BACKEND=off,libserialport libxml2"
> +PACKAGECONFIG[xml_backend] = "-DWITH_XML_BACKEND=ON,-DWITH_XML_BACKEND=off,libxml2"
> +PACKAGECONFIG[dnssd] = "-DHAVE_DNS_SD=ON,-DHAVE_DNS_SD=off,avahi"
>  PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
>
>  PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
> @@ -70,6 +68,7 @@ do_compile() {
>      cmake_do_compile
>  }
>
> +PIP_INSTALL_PACKAGE = "pylibiio"
>  do_install() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
>          setuptools3_do_install
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95882): https://lists.openembedded.org/g/openembedded-devel/message/95882
> Mute This Topic: https://lists.openembedded.org/mt/89639232/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

