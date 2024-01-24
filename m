Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B2AC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 12:07:28 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.20870.1706098039914473962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jan 2024 04:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 5431F2428C;
	Wed, 24 Jan 2024 13:07:17 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.185]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rSc2F-2Xv1Oa0; Wed, 24 Jan 2024 13:07:15 +0100
Date: Wed, 24 Jan 2024 13:07:20 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-oe][PATCH 1/3] lua: add recipe for lua-5.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <8OLR7S.S1KAQS3LTJY12@t-online.de>
In-Reply-To: <CAMKF1so46sLHzqSKHrm4d94yTNrgfO5OLzQK5awcxyLfThnx8Q@mail.gmail.com>
References: <20240122193109.3041355-1-f_l_k@t-online.de>
	<CAMKF1so46sLHzqSKHrm4d94yTNrgfO5OLzQK5awcxyLfThnx8Q@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MQIWF+b5qIHC0doVBuYM"
X-TOI-EXPURGATEID: 150726::1706098035-F57F9954-BF5B099B/0/0 CLEAN NORMAL
X-TOI-MSGID: b2476eea-0502-469c-b07d-c08dbf2f3867
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 12:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108445

--=-MQIWF+b5qIHC0doVBuYM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

There seems to be an issue with do_install, but I struggle to find=20
useful information in the error message in stdio output. I'm not able=20
to reproduce the issue locally. Lua-5.2 install is fine here, even with=20
ptest enabled.

In some circumstances it can be handy to have a recipe for lua-5.2, but=20
fortunately it is not a must-have I would say

On Mon, Jan 22 2024 at 06:01:51 PM -08:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> this fails to build.
>=20
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3547/s=
teps/14/logs/stdio>
>=20
> On Mon, Jan 22, 2024 at 11:31=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  mpv only supports lua-5.2 and luajit. Add lua-5.2 to unblock gui=20
>> build
>>  for platforms that dont support luajit
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../lua/lua-5.2/Makefile-build-so.patch       | 82=20
>> +++++++++++++++++++
>>   .../recipes-devtools/lua/lua-5.2/lua.pc.in    | 10 +++
>>   .../recipes-devtools/lua/lua-5.2/run-ptest    | 19 +++++
>>   meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb | 67 +++++++++++++++
>>   4 files changed, 178 insertions(+)
>>   create mode 100644=20
>> meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
>>   create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
>>   create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
>>   create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb
>>=20
>>  diff --git=20
>> a/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch=20
>> b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
>>  new file mode 100644
>>  index 000000000..343d1ddd6
>>  --- /dev/null
>>  +++ b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
>>  @@ -0,0 +1,82 @@
>>  +Upstream-Status: Inappropriate [Upstream doesn't support so libs]
>>  +
>>  +diff -ru lua-5.2.1/Makefile lua-5.2.1.new/Makefile
>>  +--- a/Makefile 2012-05-17 16:05:54.000000000 +0200
>>  ++++ b/Makefile 2012-09-12 22:39:07.162748096 +0200
>>  +@@ -38,16 +38,16 @@
>>  + # Convenience platforms targets.
>>  + PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix=20
>> solaris
>>  +
>>  ++# Lua version and release.
>>  ++V=3D 5.2
>>  ++R=3D $V.3
>>  ++
>>  + # What to install.
>>  + TO_BIN=3D lua luac
>>  + TO_INC=3D lua.h luaconf.h lualib.h lauxlib.h lua.hpp
>>  +-TO_LIB=3D liblua.a
>>  ++TO_LIB=3D liblua.a liblua.so.$(R)
>>  + TO_MAN=3D lua.1 luac.1
>>  +
>>  +-# Lua version and release.
>>  +-V=3D 5.2
>>  +-R=3D $V.3
>>  +-
>>  + # Targets start here.
>>  + all:  $(PLAT)
>>  +
>>  +@@ -63,7 +63,8 @@
>>  +       cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
>>  +       cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
>>  +       cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
>>  +-
>>  ++      ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so.$(V)
>>  ++      ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so
>>  + uninstall:
>>  +       cd src && cd $(INSTALL_BIN) && $(RM) $(TO_BIN)
>>  +       cd src && cd $(INSTALL_INC) && $(RM) $(TO_INC)
>>  +diff -ru lua-5.2.1/src/luaconf.h lua-5.2.1.new/src/luaconf.h
>>  +--- lua-5.2.1/src/luaconf.h    2012-05-11 16:14:42.000000000 +0200
>>  ++++ lua-5.2.1.new/src/luaconf.h        2012-09-12=20
>> 22:40:27.986622772 +0200
>>  +@@ -100,7 +100,7 @@
>>  + #else                 /* }{ */
>>  +
>>  + #define LUA_VDIR      LUA_VERSION_MAJOR "." LUA_VERSION_MINOR "/"
>>  +-#define LUA_ROOT      "/usr/local/"
>>  ++#define LUA_ROOT      "/usr"
>>  + #define LUA_LDIR      LUA_ROOT "share/lua/" LUA_VDIR
>>  + #define LUA_CDIR      LUA_ROOT "lib/lua/" LUA_VDIR
>>  + #define LUA_PATH_DEFAULT  \
>>  +diff -ru lua-5.2.1/src/Makefile lua-5.2.1.new/src/Makefile
>>  +--- lua-5.2.1/src/Makefile     2012-03-09 17:32:16.000000000 +0100
>>  ++++ lua-5.2.1.new/src/Makefile 2012-09-12 22:38:08.591386896 +0200
>>  +@@ -29,6 +29,7 @@
>>  + PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix=20
>> solaris
>>  +
>>  + LUA_A=3D        liblua.a
>>  ++LUA_SO=3D liblua.so
>>  + CORE_O=3D       lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o=20
>> lfunc.o lgc.o llex.o \
>>  +       lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o=20
>> ltable.o \
>>  +       ltm.o lundump.o lvm.o lzio.o
>>  +@@ -43,7 +44,7 @@
>>  + LUAC_O=3D       luac.o
>>  +
>>  + ALL_O=3D $(BASE_O) $(LUA_O) $(LUAC_O)
>>  +-ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T)
>>  ++ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T) $(LUA_SO)
>>  + ALL_A=3D $(LUA_A)
>>  +
>>  + # Targets start here.
>>  +@@ -59,6 +60,12 @@
>>  +       $(AR) $@ $(BASE_O)
>>  +       $(RANLIB) $@
>>  +
>>  ++$(LUA_SO): $(CORE_O) $(LIB_O)
>>  ++      $(CC) -shared -ldl -Wl,-soname,$(LUA_SO).5.2 -o $@.5.2.3 $?=20
>> -lm $(MYLDFLAGS)
>>  ++
>>  ++
>>  ++
>>  ++
>>  + $(LUA_T): $(LUA_O) $(LUA_A)
>>  +       $(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
>>  +
>>  diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in=20
>> b/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
>>  new file mode 100644
>>  index 000000000..c26775fa7
>>  --- /dev/null
>>  +++ b/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
>>  @@ -0,0 +1,10 @@
>>  +libdir=3D@LIBDIR@
>>  +includedir=3D@INCLUDEDIR@
>>  +
>>  +Name: Lua
>>  +Description: Lua language engine
>>  +Version: @VERSION@
>>  +Requires:
>>  +Libs: -L${libdir} -llua -lm -ldl
>>  +Cflags: -I${includedir}
>>  +
>>  diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest=20
>> b/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
>>  new file mode 100644
>>  index 000000000..8e085e1af
>>  --- /dev/null
>>  +++ b/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
>>  @@ -0,0 +1,19 @@
>>  +#!/bin/sh
>>  +
>>  +cd test
>>  +lua -e"_U=3Dtrue" all.lua > lua-test.tmp
>>  +
>>  +echo "--- test output ---"
>>  +cat lua-test.tmp
>>  +echo ""
>>  +echo ""
>>  +echo "--- ptest result ---"
>>  +
>>  +grep "final OK \!\!\!" lua-test.tmp > /dev/null
>>  +if [ $? -eq 0 ]; then
>>  +   echo "PASS: lua"
>>  +else
>>  +   echo "FAIL: lua"
>>  +fi
>>  +
>>  +rm -f lua-test.tmp
>>  diff --git a/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb=20
>> b/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb
>>  new file mode 100644
>>  index 000000000..58f716337
>>  --- /dev/null
>>  +++ b/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb
>>  @@ -0,0 +1,67 @@
>>  +SUMMARY =3D "Lua is a powerful light-weight programming language=20
>> designed \
>>  +for extending applications."
>>  +LICENSE =3D "MIT"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://doc/readme.html;beginline=3D381;endline=3D399;md5=3D07ddfddb01fa=
4ed9f2fb5e8eeae817a4"=20
>> <file://doc/readme.html;beginline=3D381;endline=3D399;md5=3D07ddfddb01fa=
4ed9f2fb5e8eeae817a4>
>>  +HOMEPAGE =3D "<http://www.lua.org/>"
>>  +
>>  +SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc=
=20
>> <http://www.lua.org/ftp/lua-$%7BPV%7D.tar.gz;name=3Dtarballsrc> \
>>  +           file://lua.pc.in <file://lua.pc.in/> \
>>  +           ${@bb.utils.contains=20
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'ptest',=20
>> 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=3Dtarba=
lltest=20
>> <http://www.lua.org/tests/lua-$%7BPV_testsuites%7D-tests.tar.gz;name=3Dt=
arballtest>=20
>> file://run-ptest <file://run-ptest/> ', '', d)} \
>>  +           file://Makefile-build-so.patch=20
>> <file://makefile-build-so.patch/> \
>>  +           "
>>  +
>>  +# if no test suite matches PV release of Lua exactly, download the=20
>> suite for the closest Lua release.
>>  +PV_testsuites =3D "5.2.2"
>>  +
>>  +SRC_URI[tarballsrc.sha256sum] =3D=20
>> "13c2fb97961381f7d06d5b5cea55b743c163800896fd5c5e2356201d3619002d"
>>  +SRC_URI[tarballtest.sha256sum] =3D=20
>> "07c1071c66d9cb4dc80200ed430fc21ebbbccf1f55148b87eb0b9522932e4eb6"
>>  +
>>  +S =3D "${WORKDIR}/lua-${PV}"
>>  +
>>  +DEPENDS =3D "readline"
>>  +inherit pkgconfig binconfig ptest
>>  +
>>  +TARGET_CC_ARCH +=3D " -fPIC  ${LDFLAGS}"
>>  +EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAGS} -fPIC'=20
>> MYLDFLAGS=3D'${LDFLAGS}'"
>>  +
>>  +do_configure:prepend() {
>>  +    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
>>  +    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
>>  +}
>>  +
>>  +do_compile () {
>>  +    oe_runmake linux
>>  +}
>>  +
>>  +do_install () {
>>  +    oe_runmake \
>>  +        'INSTALL_TOP=3D${D}${prefix}' \
>>  +        'INSTALL_BIN=3D${D}${bindir}' \
>>  +        'INSTALL_INC=3D${D}${includedir}/' \
>>  +        'INSTALL_MAN=3D${D}${mandir}/man1' \
>>  +        'INSTALL_SHARE=3D${D}${datadir}' \
>>  +        'INSTALL_LIB=3D${D}${libdir}' \
>>  +        'INSTALL_CMOD=3D${D}${libdir}' \
>>  +        install
>>  +    install -d ${D}${libdir}/pkgconfig  ${D}${datadir}/doc/lua
>>  +
>>  +    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e=20
>> s#@INCLUDEDIR@#${includedir}# ${WORKDIR}/lua.pc.in >=20
>> ${WORKDIR}/lua.pc
>>  +    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
>>  +    install -m 0644 doc/*.{gif,png,css,html} ${D}${datadir}/doc/lua
>>  +    rm -rf ${D}${datadir}/lua
>>  +}
>>  +
>>  +do_install_ptest () {
>>  +        cp -R --no-dereference --preserve=3Dmode,links -v=20
>> ${WORKDIR}/lua-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
>>  +}
>>  +
>>  +do_install_ptest:append:libc-musl () {
>>  +        # locale tests does not work on musl, due to limited=20
>> locale implementation
>>  +        #=20
>> <https://wiki.musl-libc.org/open-issues.html#Locale-limitations>
>>  +        sed -i -e 's|os.setlocale("pt_BR") or=20
>> os.setlocale("ptb")|false|g' ${D}${PTEST_PATH}/test/literals.lua
>>  +}
>>  +
>>  +BBCLASSEXTEND =3D "native nativesdk"
>>  +
>>  +inherit multilib_script
>>  +MULTILIB_SCRIPTS =3D "${PN}-dev:${includedir}/luaconf.h"
>>  --
>>  2.43.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#108374):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/108374>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/103894012/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-MQIWF+b5qIHC0doVBuYM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>There seems to be an issue with do=
_install, but I struggle to find useful information in the error message in=
 stdio output. I'm not able to reproduce the issue locally. Lua-5.2 install=
 is fine here, even with ptest enabled.</div><div><br></div><div>In some ci=
rcumstances it can be handy to have a recipe for lua-5.2, but fortunately i=
t is not a must-have I would say</div></div><div id=3D"geary-quote" dir=3D"=
auto"><br>On Mon, Jan 22 2024 at 06:01:51 PM -08:00:00, Khem Raj &lt;raj.kh=
em@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintex=
t" style=3D"white-space: break-spaces;">this fails to build.

<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/build=
s/3547/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/88/builds/3547/steps/14/logs/stdio</a>

On Mon, Jan 22, 2024 at 11:31=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:=
f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 mpv only supports lua-5.2 and luajit. Add lua-5.2 to unblock gui build
 for platforms that dont support luajit

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../lua/lua-5.2/Makefile-build-so.patch       | 82 +++++++++++++++++++
  .../recipes-devtools/lua/lua-5.2/lua.pc.in    | 10 +++
  .../recipes-devtools/lua/lua-5.2/run-ptest    | 19 +++++
  meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb | 67 +++++++++++++++
  4 files changed, 178 insertions(+)
  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so=
.patch
  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
  create mode 100644 meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb

 diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch =
b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
 new file mode 100644
 index 000000000..343d1ddd6
 --- /dev/null
 +++ b/meta-oe/recipes-devtools/lua/lua-5.2/Makefile-build-so.patch
 @@ -0,0 +1,82 @@
 +Upstream-Status: Inappropriate [Upstream doesn't support so libs]
 +
 +diff -ru lua-5.2.1/Makefile lua-5.2.1.new/Makefile
 +--- a/Makefile 2012-05-17 16:05:54.000000000 +0200
 ++++ b/Makefile 2012-09-12 22:39:07.162748096 +0200
 +@@ -38,16 +38,16 @@
 + # Convenience platforms targets.
 + PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix solaris
 +
 ++# Lua version and release.
 ++V=3D 5.2
 ++R=3D $V.3
 ++
 + # What to install.
 + TO_BIN=3D lua luac
 + TO_INC=3D lua.h luaconf.h lualib.h lauxlib.h lua.hpp
 +-TO_LIB=3D liblua.a
 ++TO_LIB=3D liblua.a liblua.so.$(R)
 + TO_MAN=3D lua.1 luac.1
 +
 +-# Lua version and release.
 +-V=3D 5.2
 +-R=3D $V.3
 +-
 + # Targets start here.
 + all:  $(PLAT)
 +
 +@@ -63,7 +63,8 @@
 +       cd src &amp;&amp; $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
 +       cd src &amp;&amp; $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
 +       cd doc &amp;&amp; $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
 +-
 ++      ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so.$(V)
 ++      ln -sf ./liblua.so.$(R) $(INSTALL_LIB)/liblua.so
 + uninstall:
 +       cd src &amp;&amp; cd $(INSTALL_BIN) &amp;&amp; $(RM) $(TO_BIN)
 +       cd src &amp;&amp; cd $(INSTALL_INC) &amp;&amp; $(RM) $(TO_INC)
 +diff -ru lua-5.2.1/src/luaconf.h lua-5.2.1.new/src/luaconf.h
 +--- lua-5.2.1/src/luaconf.h    2012-05-11 16:14:42.000000000 +0200
 ++++ lua-5.2.1.new/src/luaconf.h        2012-09-12 22:40:27.986622772 +020=
0
 +@@ -100,7 +100,7 @@
 + #else                 /* }{ */
 +
 + #define LUA_VDIR      LUA_VERSION_MAJOR "." LUA_VERSION_MINOR "/"
 +-#define LUA_ROOT      "/usr/local/"
 ++#define LUA_ROOT      "/usr"
 + #define LUA_LDIR      LUA_ROOT "share/lua/" LUA_VDIR
 + #define LUA_CDIR      LUA_ROOT "lib/lua/" LUA_VDIR
 + #define LUA_PATH_DEFAULT  \
 +diff -ru lua-5.2.1/src/Makefile lua-5.2.1.new/src/Makefile
 +--- lua-5.2.1/src/Makefile     2012-03-09 17:32:16.000000000 +0100
 ++++ lua-5.2.1.new/src/Makefile 2012-09-12 22:38:08.591386896 +0200
 +@@ -29,6 +29,7 @@
 + PLATS=3D aix ansi bsd freebsd generic linux macosx mingw posix solaris
 +
 + LUA_A=3D        liblua.a
 ++LUA_SO=3D liblua.so
 + CORE_O=3D       lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o l=
gc.o llex.o \
 +       lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o =
\
 +       ltm.o lundump.o lvm.o lzio.o
 +@@ -43,7 +44,7 @@
 + LUAC_O=3D       luac.o
 +
 + ALL_O=3D $(BASE_O) $(LUA_O) $(LUAC_O)
 +-ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T)
 ++ALL_T=3D $(LUA_A) $(LUA_T) $(LUAC_T) $(LUA_SO)
 + ALL_A=3D $(LUA_A)
 +
 + # Targets start here.
 +@@ -59,6 +60,12 @@
 +       $(AR) $@ $(BASE_O)
 +       $(RANLIB) $@
 +
 ++$(LUA_SO): $(CORE_O) $(LIB_O)
 ++      $(CC) -shared -ldl -Wl,-soname,$(LUA_SO).5.2 -o $@.5.2.3 $? -lm $(=
MYLDFLAGS)
 ++
 ++
 ++
 ++
 + $(LUA_T): $(LUA_O) $(LUA_A)
 +       $(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
 +
 diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in b/meta-oe/reci=
pes-devtools/lua/lua-5.2/lua.pc.in
 new file mode 100644
 index 000000000..c26775fa7
 --- /dev/null
 +++ b/meta-oe/recipes-devtools/lua/lua-5.2/lua.pc.in
 @@ -0,0 +1,10 @@
 +libdir=3D@LIBDIR@
 +includedir=3D@INCLUDEDIR@
 +
 +Name: Lua
 +Description: Lua language engine
 +Version: @VERSION@
 +Requires:
 +Libs: -L${libdir} -llua -lm -ldl
 +Cflags: -I${includedir}
 +
 diff --git a/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest b/meta-oe/reci=
pes-devtools/lua/lua-5.2/run-ptest
 new file mode 100644
 index 000000000..8e085e1af
 --- /dev/null
 +++ b/meta-oe/recipes-devtools/lua/lua-5.2/run-ptest
 @@ -0,0 +1,19 @@
 +#!/bin/sh
 +
 +cd test
 +lua -e"_U=3Dtrue" all.lua &gt; lua-test.tmp
 +
 +echo "--- test output ---"
 +cat lua-test.tmp
 +echo ""
 +echo ""
 +echo "--- ptest result ---"
 +
 +grep "final OK \!\!\!" lua-test.tmp &gt; /dev/null
 +if [ $? -eq 0 ]; then
 +   echo "PASS: lua"
 +else
 +   echo "FAIL: lua"
 +fi
 +
 +rm -f lua-test.tmp
 diff --git a/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb b/meta-oe/recip=
es-devtools/lua/lua-5.2_5.2.3.bb
 new file mode 100644
 index 000000000..58f716337
 --- /dev/null
 +++ b/meta-oe/recipes-devtools/lua/lua-5.2_5.2.3.bb
 @@ -0,0 +1,67 @@
 +SUMMARY =3D "Lua is a powerful light-weight programming language designed=
 \
 +for extending applications."
 +LICENSE =3D "MIT"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://doc/readme.html;beginline=3D381;e=
ndline=3D399;md5=3D07ddfddb01fa4ed9f2fb5e8eeae817a4" "=3D"">file://doc/read=
me.html;beginline=3D381;endline=3D399;md5=3D07ddfddb01fa4ed9f2fb5e8eeae817a=
4"</a>
 +HOMEPAGE =3D "<a href=3D"http://www.lua.org/">http://www.lua.org/</a>"
 +
 +SRC_URI =3D "<a href=3D"http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dta=
rballsrc">http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc</a> \
 +           <a href=3D"file://lua.pc.in">file://lua.pc.in</a> \
 +           <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</=
a>('DISTRO_FEATURES', 'ptest', '<a href=3D"http://www.lua.org/tests/lua-${P=
V_testsuites}-tests.tar.gz;name=3Dtarballtest">http://www.lua.org/tests/lua=
-${PV_testsuites}-tests.tar.gz;name=3Dtarballtest</a> <a href=3D"file://run=
-ptest">file://run-ptest</a> ', '', d)} \
 +           <a href=3D"file://Makefile-build-so.patch">file://Makefile-bui=
ld-so.patch</a> \
 +           "
 +
 +# if no test suite matches PV release of Lua exactly, download the suite =
for the closest Lua release.
 +PV_testsuites =3D "5.2.2"
 +
 +SRC_URI[tarballsrc.sha256sum] =3D "13c2fb97961381f7d06d5b5cea55b743c16380=
0896fd5c5e2356201d3619002d"
 +SRC_URI[tarballtest.sha256sum] =3D "07c1071c66d9cb4dc80200ed430fc21ebbbcc=
f1f55148b87eb0b9522932e4eb6"
 +
 +S =3D "${WORKDIR}/lua-${PV}"
 +
 +DEPENDS =3D "readline"
 +inherit pkgconfig binconfig ptest
 +
 +TARGET_CC_ARCH +=3D " -fPIC  ${LDFLAGS}"
 +EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAGS} -fPIC' MYLDFLA=
GS=3D'${LDFLAGS}'"
 +
 +do_configure:prepend() {
 +    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
 +    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
 +}
 +
 +do_compile () {
 +    oe_runmake linux
 +}
 +
 +do_install () {
 +    oe_runmake \
 +        'INSTALL_TOP=3D${D}${prefix}' \
 +        'INSTALL_BIN=3D${D}${bindir}' \
 +        'INSTALL_INC=3D${D}${includedir}/' \
 +        'INSTALL_MAN=3D${D}${mandir}/man1' \
 +        'INSTALL_SHARE=3D${D}${datadir}' \
 +        'INSTALL_LIB=3D${D}${libdir}' \
 +        'INSTALL_CMOD=3D${D}${libdir}' \
 +        install
 +    install -d ${D}${libdir}/pkgconfig  ${D}${datadir}/doc/lua
 +
 +    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#=
${includedir}# ${WORKDIR}/lua.pc.in &gt; ${WORKDIR}/lua.pc
 +    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
 +    install -m 0644 doc/*.{gif,png,css,html} ${D}${datadir}/doc/lua
 +    rm -rf ${D}${datadir}/lua
 +}
 +
 +do_install_ptest () {
 +        cp -R --no-dereference --preserve=3Dmode,links -v ${WORKDIR}/lua-=
${PV_testsuites}-tests ${D}${PTEST_PATH}/test
 +}
 +
 +do_install_ptest:append:libc-musl () {
 +        # locale tests does not work on musl, due to limited locale imple=
mentation
 +        # <a href=3D"https://wiki.musl-libc.org/open-issues.html#Locale-l=
imitations">https://wiki.musl-libc.org/open-issues.html#Locale-limitations<=
/a>
 +        sed -i -e 's|os.setlocale("pt_BR") or os.setlocale("ptb")|false|g=
' ${D}${PTEST_PATH}/test/literals.lua
 +}
 +
 +BBCLASSEXTEND =3D "native nativesdk"
 +
 +inherit multilib_script
 +MULTILIB_SCRIPTS =3D "${PN}-dev:${includedir}/luaconf.h"
 --
 2.43.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#108374): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/108374">https://lists.openembedded.org/g/openembe=
dded-devel/message/108374</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103894012/19=
97914">https://lists.openembedded.org/mt/103894012/1997914</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-MQIWF+b5qIHC0doVBuYM--


