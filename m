Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5078C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 02:02:24 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.1815.1705975337831284116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 18:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6Ut/4LO;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ddf388ca74so2019446a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 18:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705975337; x=1706580137; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92Za2DX6dEozr1KO3XCR/bH9UZ1hp2FPZcBAJpc2Prs=;
        b=L6Ut/4LOaMvcR/Vzmz3pMGOSIFqW28p6ccs7jIhgUq/Qk6Jsu4nZ+JTz+Jq3i8Xt1M
         BjpiJzTCzIlVROCC4ni+qlurX1rOpnUi2O8bf6oWvYvuzU2RbFCNTUFrg9BZWrcKFl+W
         r106gP9fBLE/lha1jFpSFmhcNpqwnf+GzfrEbx/sK9kkHLrL2/Gyub9kb0Ea36tH6I92
         2LdKPEoYaHxXZqFfUZrQ9GrDJs5+Lee3Ri8dfzHIqeKTPEEJ5zWGr5bmyc6U5mjXDk/a
         3nPPL2Biaue4PhnpPl4W7YMMgdc4tIfTYegtmAe8Vr1LI2Ayy1qIaCaHOFDiYwiex6GI
         zS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705975337; x=1706580137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92Za2DX6dEozr1KO3XCR/bH9UZ1hp2FPZcBAJpc2Prs=;
        b=VHuz/BZHRDfqQGJ25F0kovgeZvWzCrsnbjFQRCZEt2OgHU8tO11aHV0nQ9ojBIoNM3
         Ju1qEbmIOceJPTheIkth+lsvvPZ2LmJKwiHN6gcTwFtCMeLTb5hH/Q+it9Y2HqQhrK16
         NIYnm4/UTzm4Ot44dI3lKfRZg5cYtMyeCcJAR3Sry1pnb7LjTI1aFKRvCO2aig+g4a6V
         0JRNepNkFCbdTbAXSmd2DfXv4ORBpa0WYp9sttmBfrrfcBFN9TTB8ToeAjZvQOpLvtDK
         9vO7h0tZlewCHcjXZsXk5Ho2tb6adxsJewGgVv79uQJIMQ1SDJYpbfza0w6EuuqNZg3c
         EjzQ==
X-Gm-Message-State: AOJu0YzIpNoRjHQOD7rq7xbWnFdgyecrydAvnp7eVPhkCzu333hQcoPv
	iP3gno8VJS64jmePkweoMB2H1rUQRA0vWSXpkhoOfD5qvJMnhR0zLORlsB/bkT2k+iijm8CsqoP
	FvOvpKs0d+I29C2V8P0vs3Sqvr3AthsnDK408sg==
X-Google-Smtp-Source: AGHT+IEovXrB/3M/iAzIbd+blie6+y6Mo7tpINS7G9BKAIkor8aWMMLFG70RYIUN+ON/vzbhtZ2PoxH9vLbvjMYMl+M=
X-Received: by 2002:a05:6871:58e:b0:214:6f9e:ee80 with SMTP id
 u14-20020a056871058e00b002146f9eee80mr937778oan.26.1705975336945; Mon, 22 Jan
 2024 18:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20240122193109.3041355-1-f_l_k@t-online.de>
In-Reply-To: <20240122193109.3041355-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jan 2024 18:01:51 -0800
Message-ID: <CAMKF1so46sLHzqSKHrm4d94yTNrgfO5OLzQK5awcxyLfThnx8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] lua: add recipe for lua-5.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 02:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108428

this fails to build.

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3547/step=
s/14/logs/stdio

On Mon, Jan 22, 2024 at 11:31=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> mpv only supports lua-5.2 and luajit. Add lua-5.2 to unblock gui build
> for platforms that dont support luajit
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../lua/lua-5.2/Makefile-build-so.patch       | 82 +++++++++++++++++++
>  .../recipes-devtools/lua/lua-5.2/lua.pc.in    | 10 +++
>  .../recipes-devtools/lua/lua-5.2/run-ptest    | 19 +++++
>  meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb | 67 +++++++++++++++
>  4 files changed, 178 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-s=
o.patch
>  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
>  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
>  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb
>
> diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch=
 b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
> new file mode 100644
> index 000000000..343d1ddd6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
> @@ -0,0 +1,82 @@
> +Upstream-Status: Inappropriate [Upstream doesn't support so libs]
> +
> +diff -ru lua-5.2.1/Makefile lua-5.2.1.new/Makefile
> +--- a/Makefile 2012-05-17 16:05:54.000000000 +0200
> ++++ b/Makefile 2012-09-12 22:39:07.162748096 +0200
> +@@ -38,16 +38,16 @@
> + # Convenience platforms targets.
> + PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix solaris
> +
> ++# Lua version and release.
> ++V=3D 5.2
> ++R=3D $V.3
> ++
> + # What to install.
> + TO_BIN=3D lua luac
> + TO_INC=3D lua.h luaconf.h lualib.h lauxlib.h lua.hpp
> +-TO_LIB=3D liblua.a
> ++TO_LIB=3D liblua.a liblua.so.$(R)
> + TO_MAN=3D lua.1 luac.1
> +
> +-# Lua version and release.
> +-V=3D 5.2
> +-R=3D $V.3
> +-
> + # Targets start here.
> + all:  $(PLAT)
> +
> +@@ -63,7 +63,8 @@
> +       cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
> +       cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
> +       cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
> +-
> ++      ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so.$(V)
> ++      ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so
> + uninstall:
> +       cd src && cd $(INSTALL_BIN) && $(RM) $(TO_BIN)
> +       cd src && cd $(INSTALL_INC) && $(RM) $(TO_INC)
> +diff -ru lua-5.2.1/src/luaconf.h lua-5.2.1.new/src/luaconf.h
> +--- lua-5.2.1/src/luaconf.h    2012-05-11 16:14:42.000000000 +0200
> ++++ lua-5.2.1.new/src/luaconf.h        2012-09-12 22:40:27.986622772 +02=
00
> +@@ -100,7 +100,7 @@
> + #else                 /* }{ */
> +
> + #define LUA_VDIR      LUA_VERSION_MAJOR "." LUA_VERSION_MINOR "/"
> +-#define LUA_ROOT      "/usr/local/"
> ++#define LUA_ROOT      "/usr"
> + #define LUA_LDIR      LUA_ROOT "share/lua/" LUA_VDIR
> + #define LUA_CDIR      LUA_ROOT "lib/lua/" LUA_VDIR
> + #define LUA_PATH_DEFAULT  \
> +diff -ru lua-5.2.1/src/Makefile lua-5.2.1.new/src/Makefile
> +--- lua-5.2.1/src/Makefile     2012-03-09 17:32:16.000000000 +0100
> ++++ lua-5.2.1.new/src/Makefile 2012-09-12 22:38:08.591386896 +0200
> +@@ -29,6 +29,7 @@
> + PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix solaris
> +
> + LUA_A=3D        liblua.a
> ++LUA_SO=3D liblua.so
> + CORE_O=3D       lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o =
lgc.o llex.o \
> +       lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o=
 \
> +       ltm.o lundump.o lvm.o lzio.o
> +@@ -43,7 +44,7 @@
> + LUAC_O=3D       luac.o
> +
> + ALL_O=3D $(BASE_O) $(LUA_O) $(LUAC_O)
> +-ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T)
> ++ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T) $(LUA_SO)
> + ALL_A=3D $(LUA_A)
> +
> + # Targets start here.
> +@@ -59,6 +60,12 @@
> +       $(AR) $@ $(BASE_O)
> +       $(RANLIB) $@
> +
> ++$(LUA_SO): $(CORE_O) $(LIB_O)
> ++      $(CC) -shared -ldl -Wl,-soname,$(LUA_SO).5.2 -o $@.5.2.3 $? -lm $=
(MYLDFLAGS)
> ++
> ++
> ++
> ++
> + $(LUA_T): $(LUA_O) $(LUA_A)
> +       $(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
> +
> diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in b/meta-oe/rec=
ipes-devtools/lua/lua-5.2/lua.pc.in
> new file mode 100644
> index 000000000..c26775fa7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
> @@ -0,0 +1,10 @@
> +libdir=3D@LIBDIR@
> +includedir=3D@INCLUDEDIR@
> +
> +Name: Lua
> +Description: Lua language engine
> +Version: @VERSION@
> +Requires:
> +Libs: -L${libdir} -llua -lm -ldl
> +Cflags: -I${includedir}
> +
> diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest b/meta-oe/rec=
ipes-devtools/lua/lua-5.2/run-ptest
> new file mode 100644
> index 000000000..8e085e1af
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +
> +cd test
> +lua -e"_U=3Dtrue" all.lua > lua-test.tmp
> +
> +echo "--- test output ---"
> +cat lua-test.tmp
> +echo ""
> +echo ""
> +echo "--- ptest result ---"
> +
> +grep "final OK \!\!\!" lua-test.tmp > /dev/null
> +if [ $? -eq 0 ]; then
> +   echo "PASS: lua"
> +else
> +   echo "FAIL: lua"
> +fi
> +
> +rm -f lua-test.tmp
> diff --git a/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb b/meta-oe/reci=
pes-devtools/lua/lua-5.2_5.2.3.bb
> new file mode 100644
> index 000000000..58f716337
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb
> @@ -0,0 +1,67 @@
> +SUMMARY =3D "Lua is a powerful light-weight programming language designe=
d \
> +for extending applications."
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D381;endline=3D3=
99;md5=3D07ddfddb01fa4ed9f2fb5e8eeae817a4"
> +HOMEPAGE =3D "http://www.lua.org/"
> +
> +SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc \
> +           file://lua.pc.in \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.=
lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=3Dtarballtest file://r=
un-ptest ', '', d)} \
> +           file://Makefile-build-so.patch \
> +           "
> +
> +# if no test suite matches PV release of Lua exactly, download the suite=
 for the closest Lua release.
> +PV_testsuites =3D "5.2.2"
> +
> +SRC_URI[tarballsrc.sha256sum] =3D "13c2fb97961381f7d06d5b5cea55b743c1638=
00896fd5c5e2356201d3619002d"
> +SRC_URI[tarballtest.sha256sum] =3D "07c1071c66d9cb4dc80200ed430fc21ebbbc=
cf1f55148b87eb0b9522932e4eb6"
> +
> +S =3D "${WORKDIR}/lua-${PV}"
> +
> +DEPENDS =3D "readline"
> +inherit pkgconfig binconfig ptest
> +
> +TARGET_CC_ARCH +=3D " -fPIC  ${LDFLAGS}"
> +EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAGS} -fPIC' MYLDFL=
AGS=3D'${LDFLAGS}'"
> +
> +do_configure:prepend() {
> +    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
> +    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
> +}
> +
> +do_compile () {
> +    oe_runmake linux
> +}
> +
> +do_install () {
> +    oe_runmake \
> +        'INSTALL_TOP=3D${D}${prefix}' \
> +        'INSTALL_BIN=3D${D}${bindir}' \
> +        'INSTALL_INC=3D${D}${includedir}/' \
> +        'INSTALL_MAN=3D${D}${mandir}/man1' \
> +        'INSTALL_SHARE=3D${D}${datadir}' \
> +        'INSTALL_LIB=3D${D}${libdir}' \
> +        'INSTALL_CMOD=3D${D}${libdir}' \
> +        install
> +    install -d ${D}${libdir}/pkgconfig  ${D}${datadir}/doc/lua
> +
> +    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@=
#${includedir}# ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
> +    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
> +    install -m 0644 doc/*.{gif,png,css,html} ${D}${datadir}/doc/lua
> +    rm -rf ${D}${datadir}/lua
> +}
> +
> +do_install_ptest () {
> +        cp -R --no-dereference --preserve=3Dmode,links -v ${WORKDIR}/lua=
-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
> +}
> +
> +do_install_ptest:append:libc-musl () {
> +        # locale tests does not work on musl, due to limited locale impl=
ementation
> +        # https://wiki.musl-libc.org/open-issues.html#Locale-limitations
> +        sed -i -e 's|os.setlocale("pt_BR") or os.setlocale("ptb")|false|=
g' ${D}${PTEST_PATH}/test/literals.lua
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS =3D "${PN}-dev:${includedir}/luaconf.h"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108374): https://lists.openembedded.org/g/openembedde=
d-devel/message/108374
> Mute This Topic: https://lists.openembedded.org/mt/103894012/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

