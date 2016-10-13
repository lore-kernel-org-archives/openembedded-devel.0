Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 914B771ABE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 14:23:44 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id l131so100375429lfl.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rICI6bzBQPdcAYHHpOZnsY5ty6M+gl0AfrkWBI6f3XM=;
	b=Ad9vLcwq2SKiVrSJtuY0tNT9MjgzZ+/U75c9wHmwiCN1hjwa6vji2+izAPHJZS2O19
	fJUDxkN9fCwiO7yYBxU+AvIhPMVCIZnrVwI2/Q9ZewNI9vy87vz9ExeLXpDX40KVunGM
	BV6/hhGXw68GL1cB0Btd8fHgMNN1gtn8+zeRxgDe3Rkf/WLh5zMz/Asj0a27KWOTg46H
	vg389mFrux4uOZCNrFCEs0F/ssDjYSTmMh6TFco1myGayagOfWqq61qztWUzgw1uHb/e
	JUQWM8IzgehBiiLfa7CI5XDqyAScyYuk5eRMRZGseRM3NlzkFXJtivGZOA8+/dfSRV8W
	Jr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rICI6bzBQPdcAYHHpOZnsY5ty6M+gl0AfrkWBI6f3XM=;
	b=BS9qVnEH/nVldFWsLD5w7Wy1cW6CHkDlnfQCsX1bS743ysjaI2DuGwiXnAuP3Ym5Gf
	nQK172r6R1f3LK/zOVJmKTCL/pq1H3h/13rARBHd5/zflY8r473wkAA26IEppu961wba
	8Jaxp0wK97cKQHC4zr62GaNwuTarUFR/S7G71pVl2kAcGV0FcmotuBODkkvAEkmv6IIo
	id/Tnq24Ju4RofvqCkSKRaJMzizLTPqPWrcjK33W/In24OHmLpAUij9k/aEdWFCPVK7J
	/UYOjYnnNcqQXUHPOiojSMfWaQo7v4t+ytVrbnYMnnVCtK4zzxRDcSUt/9XHdewdvuDe
	lMZQ==
X-Gm-Message-State: AA6/9RnUSP9ZTDClR4X3ap2eaSKD0EIA/Ik6KnKbHriSJtBvm7X00jDENwsxUcvzjQOgTw==
X-Received: by 10.28.103.7 with SMTP id b7mr2410719wmc.48.1476368620960;
	Thu, 13 Oct 2016 07:23:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	kg7sm22914464wjb.34.2016.10.13.07.23.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Oct 2016 07:23:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 13 Oct 2016 16:23:38 +0200
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20161013142338.GC2924@jama>
References: <16076428.LW6cBLIOWS@localhost.localdomain>
	<CA+chaQd4_k4HPKqOzn-DSL92EM=UCejFpx87==0ub+aR8AE39w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQd4_k4HPKqOzn-DSL92EM=UCejFpx87==0ub+aR8AE39w@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-browser] Chromium Doesn't build for 32bit targets.
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
X-List-Received-Date: Thu, 13 Oct 2016 14:23:45 -0000
X-Groupsio-MsgNum: 63457
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline

--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 09:23:14AM +0200, Martin Jansa wrote:
> I was reporting the same issue on
> http://www.openembedded.org/wiki/Bitbake_World_Status and related e-mails
> since 2016-08-20
>=20
> You might want to help Trevor to reproduce it on his build (I'm sorry I
> didn't get to it yet)
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-August/10=
8907.html
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-August/10=
8911.html

The problem is that in version 52, ninja is passing -m32 to cflags for
some components when building for host, e.g. comparing bundled icu build
for host with 48 (chromium-wayland) and 52 (chromium):

--- chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release/obj.host/thi=
rd_party/icu/icuuc.ninja     2016-10-13 16:02:21.630981551 +0200
+++ chromium-wayland/48.0.2548.0-r0/chromium-48.0.2548.0/out/Release/obj.ho=
st/third_party/icu/icuuc.ninja       2016-10-13 15:48:56.794982910 +0200
@@ -6,38 +6,39 @@
 nm =3D $nm_host
 readelf =3D $readelf_host
 defines =3D -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 $
-    -DUCONFIG_ONLY_HTML_CONVERSION=3D1 -DU_CHARSET_IS_UTF8=3D1 $
-    -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=3D64 -DDISABLE_NACL $
-    -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD $
-    -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 $
+    -DUCONFIG_NO_NON_HTML5_CONVERSION=3D1 -DU_CHARSET_IS_UTF8=3D1 $
+    -DV8_DEPRECATION_WARNINGS -DCLD_VERSION=3D2 -D_FILE_OFFSET_BITS=3D64 $
+    -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD $
+    -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_ASH=3D1 -DUSE_PAN=
GO=3D1 $
     -DUSE_CAIRO=3D1 -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1=
 $
-    -DUSE_X11=3D1 -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 $
-    -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS $
-    -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED $
+    -DUSE_X11=3D1 -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_ONE_CLICK_SIGNIN $
+    -DENABLE_PRE_SYNC_BACKUP -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1=
 $
+    -DENABLE_PEPPER_CDMS -DENABLE_CONFIGURATION_POLICY $
+    -DENABLE_NOTIFICATIONS -DENABLE_HIDPI=3D1 -DENABLE_TOPCHROME_MD=3D1 $
+    -DUSE_UDEV -DDONT_EMBED_BUILD_METADATA -DFIELDTRIAL_TESTING_ENABLED $
     -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DENABLE_PDF=3D1 $
     -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 $
+    -DENABLE_AUTOFILL_DIALOG=3D1 -DENABLE_BACKGROUND=3D1 -DENABLE_GOOGLE_N=
OW=3D1 $
     -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVI=
EW=3D1 $
     -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 $
-    -DENABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 $ =20
-    -DENABLE_SERVICE_DISCOVERY=3D1 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CS=
D $
-    -DSAFE_BROWSING_DB_LOCAL -DU_COMMON_IMPLEMENTATION $
-    -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEXCEPT=3D $
-    -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVALGRI=
ND $
+    -DENABLE_APP_LIST=3D1 -DENABLE_SETTINGS_APP=3D1 -DENABLE_SUPERVISED_US=
ERS=3D1 $
+    -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -DFULL_SAFE_BROWSING $
+    -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMON_IMPLEMENTATION=
 $
+    -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DUSE_LIBPCI=3D1 $
+    -DUSE_OPENSSL=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVALGR=
IND $
     -DDYNAMIC_ANNOTATIONS_ENABLED=3D0
 includes =3D -I../../third_party/icu/source/common $=20
     -I../../third_party/icu/source/i18n -Igen
 cflags =3D -fstack-protector --param=3Dssp-buffer-size=3D4  -pthread $
-    -fno-strict-aliasing -Wno-extra -Wno-unused-parameter $
+    -fno-strict-aliasing -Wno-unused-parameter $  =20
     -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC $
     -Wno-unused-local-typedefs -Wno-deprecated-declarations $
-    -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections $
-    -ffunction-sections -funwind-tables
-cflags_c =3D $
-    -isystem/OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/include $
-    -O2 -pipe
+    -Wno-unused-function -Wno-format -Wno-unused-result -m32 -O2 -fno-iden=
t $
+    -fdata-sections -ffunction-sections -funwind-tables
+cflags_c =3D
 cflags_cc =3D -fno-exceptions -fno-rtti -fno-threadsafe-statics $
     -fvisibility-inlines-hidden -frtti -Wno-deprecated -std=3Dgnu++11 $
-    -Wno-narrowing
+    -Wno-narrowing -Wno-literal-suffix
 arflags =3D

 build obj.host/third_party/icu/source/common/icuuc.appendable.o: cxx $
@@ -76,8 +77,6 @@
     ../../third_party/icu/source/common/dtintrv.cpp || icudtl.dat
 build obj.host/third_party/icu/source/common/icuuc.errorcode.o: cxx $
     ../../third_party/icu/source/common/errorcode.cpp || icudtl.dat
-build obj.host/third_party/icu/source/common/icuuc.filteredbrk.o: cxx $
-    ../../third_party/icu/source/common/filteredbrk.cpp || icudtl.dat
 build obj.host/third_party/icu/source/common/icuuc.filterednormalizer2.o: $
     cxx ../../third_party/icu/source/common/filterednormalizer2.cpp || $
     icudtl.dat
=2E...=20

It doesn't even pass it consistently everywhere and if you try to finish the
build manually it will eventually try to link 32bit objects together with 6=
4bit
and fail with a different error:

| [167/17198] LINK character_data_generator
| FAILED: character_data_generator
| g++  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -Wl,-z,rel=
ro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags -W=
l,-O1 -Wl,--as-needed -Wl,--gc-sections -o character_data_generator -Wl,--s=
tart-group obj.host/third_party/WebKit/Source/platform/text/character_data_=
generator.CharacterPropertyDataGenerator.o obj.host/third_party/icu/libicuu=
c.a -Wl,--end-group
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.utrie2_builder.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.utrie2.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.utrie.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.cmemory.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.ucol_swp.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.udataswp.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.uinvchar.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.ustring.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.utf_impl.o' is incompatible with i386:x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/third_party/icu/source/comm=
on/icuuc.cstring.o' is incompatible with i386:x86-64 output
| obj.host/third_party/icu/source/common/icuuc.cstring.o: In function `T_CS=
tring_int64ToString_56':
| cstring.c:(.text.T_CString_int64ToString_56+0x8e): undefined reference to=
 `__umoddi3'
| cstring.c:(.text.T_CString_int64ToString_56+0xb2): undefined reference to=
 `__udivdi3'
| collect2: error: ld returned 1 exit status

OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux $ file \
  chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release/obj.host/third=
_party/WebKit/Source/platform/text/character_data_generator.CharacterProper=
tyDataGenerator.o \
  chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release/obj.host/third=
_party/icu/source/common/icuuc.utrie2_builder.o

chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release/obj.host/third_p=
arty/WebKit/Source/platform/text/character_data_generator.CharacterProperty=
DataGenerator.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not =
stripped

chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release/obj.host/third_p=
arty/icu/source/common/icuuc.utrie2_builder.o:                             =
                 ELF 32-bit LSB relocatable, Intel 80386, version 1 (SYSV),=
 not stripped

The fix should be to make ninja to respect all BUILD_* variables from OE
without adding incorrect -m32 when building on x86_64 host for x86 target
MACHINE.

Regards,

> On Mon, Oct 10, 2016 at 8:31 PM, Davis, Michael <michael.davis@essvote.co=
m>
> wrote:
>=20
> > I had sent an email about this a few months back for Krogoth, but I just
> > updated to master in prep for 2.2 and it is still the case.
> > Chromium 52 will not build for a 32bit target on a 64bit build OS.  It
> > will build the 64bit version, but it uses the build OS's tool chain whi=
ch
> > seems incorrect.
> >
> > As you can see from the log it pulls straight g++ and includes from my
> > Centos 7 build box.
> >
> > log.do_comple below:
> >
> > DEBUG: Executing shell function do_compile
> > ninja: Entering directory `/build/test/tmp/work/core2-
> > 32-poky-linux/chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Releas=
e'
> > [1/17943] AR obj/chrome/libsafe_browsing_proto.a
> > [2/17943] CXX obj/third_party/icu/source/common/icuuc.uresource.o
> > [3/17943] STAMP obj/chrome/make_file_types_protobuf.actions_depends.sta=
mp
> > [4/17943] CXX obj.host/third_party/icu/source/common/icuuc.ruleiter.o
> > FAILED: obj.host/third_party/icu/source/common/icuuc.ruleiter.o
> > g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.ruleiter.o.d
> > -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVE=
RSION=3D1
> > -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64
> > -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> > -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CA=
IRO=3D1
> > -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1
> > -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=
=3D1
> > -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1
> > -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1
> > -DENABLE_EXTENSIONS=3D1 -DENABLE_PDF=3D1 -DENABLE_PLUGINS=3D1
> > -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 -DENABLE_PRINTING=3D1
> > -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVIEW=3D1 -DENABLE_SPELLCH=
ECK=3D1
> > -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENABLE_SUPERVISED_USERS=3D1
> > -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -DFULL_SAFE_BROWSING
> > -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMO
> >  N_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0
> > -DU_NOEXCEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DN=
DEBUG
> > -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/s=
ource/common
> > -I../../third_party/icu/source/i18n -Igen -fstack-protector
> > --param=3Dssp-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra
> > -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=3Dhi=
dden
> > -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> > -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> > -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> > -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-depreca=
ted
> > -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/r=
uleiter.cpp
> > -o obj.host/third_party/icu/source/common/icuuc.ruleiter.o
> > In file included from /usr/include/features.h:399:0,
> >                  from /usr/include/stdint.h:25,
> >                  from /usr/lib/gcc/x86_64-redhat-
> > linux/4.8.5/include/stdint.h:9,
> >                  from ../../third_party/icu/source/
> > common/unicode/ptypes.h:66,
> >                  from ../../third_party/icu/source/
> > common/unicode/umachine.h:44,
> >                  from ../../third_party/icu/source/
> > common/unicode/utypes.h:36,
> >                  from ../../third_party/icu/source/
> > common/unicode/uobject.h:20,
> >                  from ../../third_party/icu/source/common/ruleiter.h:14,
> >                  from ../../third_party/icu/source/common/ruleiter.cpp:=
11:
> > /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> > or directory
> >  # include <gnu/stubs-32.h>
> >                            ^
> > compilation terminated.
> > [5/17943] AR obj/third_party/libvpx/libvpx.a
> > [6/17943] CXX obj.host/third_party/icu/source/common/icuuc.schriter.o
> > FAILED: obj.host/third_party/icu/source/common/icuuc.schriter.o
> > g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.schriter.o.d
> > -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVE=
RSION=3D1
> > -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64
> > -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> > -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CA=
IRO=3D1
> > -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1
> > -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=
=3D1
> > -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1
> > -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1
> > -DENABLE_EXTENSIONS=3D1 -DENABLE_PDF=3D1 -DENABLE_PLUGINS=3D1
> > -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 -DENABLE_PRINTING=3D1
> > -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVIEW=3D1 -DENABLE_SPELLCH=
ECK=3D1
> > -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENABLE_SUPERVISED_USERS=3D1
> > -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -DFULL_SAFE_BROWSING
> > -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMO
> >  N_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0
> > -DU_NOEXCEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DN=
DEBUG
> > -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/s=
ource/common
> > -I../../third_party/icu/source/i18n -Igen -fstack-protector
> > --param=3Dssp-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra
> > -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=3Dhi=
dden
> > -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> > -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> > -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> > -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-depreca=
ted
> > -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/s=
chriter.cpp
> > -o obj.host/third_party/icu/source/common/icuuc.schriter.o
> > In file included from /usr/include/features.h:399:0,
> >                  from /usr/include/c++/4.8.2/x86_64-
> > redhat-linux/32/bits/os_defines.h:39,
> >                  from /usr/include/c++/4.8.2/x86_64-
> > redhat-linux/32/bits/c++config.h:426,
> >                  from /usr/include/c++/4.8.2/exception:37,
> >                  from /usr/include/c++/4.8.2/typeinfo:34,
> >                  from ../../third_party/icu/source/common/utypeinfo.h:2=
8,
> >                  from ../../third_party/icu/source/common/schriter.cpp:=
16:
> > /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> > or directory
> >  # include <gnu/stubs-32.h>
> >                            ^
> > compilation terminated.
> > [7/17943] CXX obj.host/third_party/icu/source/common/icuuc.servlk.o
> > FAILED: obj.host/third_party/icu/source/common/icuuc.servlk.o
> > g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servlk.o.d
> > -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVE=
RSION=3D1
> > -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64
> > -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> > -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CA=
IRO=3D1
> > -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1
> > -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=
=3D1
> > -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1
> > -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1
> > -DENABLE_EXTENSIONS=3D1 -DENABLE_PDF=3D1 -DENABLE_PLUGINS=3D1
> > -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 -DENABLE_PRINTING=3D1
> > -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVIEW=3D1 -DENABLE_SPELLCH=
ECK=3D1
> > -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENABLE_SUPERVISED_USERS=3D1
> > -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -DFULL_SAFE_BROWSING
> > -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMON_
> >  IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0
> > -DU_NOEXCEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DN=
DEBUG
> > -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/s=
ource/common
> > -I../../third_party/icu/source/i18n -Igen -fstack-protector
> > --param=3Dssp-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra
> > -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=3Dhi=
dden
> > -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> > -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> > -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> > -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-depreca=
ted
> > -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/s=
ervlk.cpp
> > -o obj.host/third_party/icu/source/common/icuuc.servlk.o
> > In file included from /usr/include/features.h:399:0,
> >                  from /usr/include/stdint.h:25,
> >                  from /usr/lib/gcc/x86_64-redhat-
> > linux/4.8.5/include/stdint.h:9,
> >                  from ../../third_party/icu/source/
> > common/unicode/ptypes.h:66,
> >                  from ../../third_party/icu/source/
> > common/unicode/umachine.h:44,
> >                  from ../../third_party/icu/source/
> > common/unicode/utypes.h:36,
> >                  from ../../third_party/icu/source/common/servlk.cpp:9:
> > /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> > or directory
> >  # include <gnu/stubs-32.h>
> >                            ^
> > compilation terminated.
> > [8/17943] CXX obj.host/third_party/icu/source/common/icuuc.servrbf.o
> > FAILED: obj.host/third_party/icu/source/common/icuuc.servrbf.o
> > g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servrbf.o.d
> > -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVE=
RSION=3D1
> > -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64
> > -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> > -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CA=
IRO=3D1
> > -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1
> > -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=
=3D1
> > -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1
> > -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1
> > -DENABLE_EXTENSIONS=3D1 -DENABLE_PDF=3D1 -DENABLE_PLUGINS=3D1
> > -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 -DENABLE_PRINTING=3D1
> > -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVIEW=3D1 -DENABLE_SPELLCH=
ECK=3D1
> > -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENABLE_SUPERVISED_USERS=3D1
> > -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -DFULL_SAFE_BROWSING
> > -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMON
> >  _IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0
> > -DU_NOEXCEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DN=
DEBUG
> > -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/s=
ource/common
> > -I../../third_party/icu/source/i18n -Igen -fstack-protector
> > --param=3Dssp-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra
> > -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=3Dhi=
dden
> > -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> > -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> > -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> > -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-depreca=
ted
> > -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/s=
ervrbf.cpp
> > -o obj.host/third_party/icu/source/common/icuuc.servrbf.o
> > In file included from /usr/include/features.h:399:0,
> >                  from /usr/include/stdint.h:25,
> >                  from /usr/lib/gcc/x86_64-redhat-
> > linux/4.8.5/include/stdint.h:9,
> >                  from ../../third_party/icu/source/
> > common/unicode/ptypes.h:66,
> >                  from ../../third_party/icu/source/
> > common/unicode/umachine.h:44,
> >                  from ../../third_party/icu/source/
> > common/unicode/utypes.h:36,
> >                  from ../../third_party/icu/source/common/servrbf.cpp:9:
> > /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> > or directory
> >  # include <gnu/stubs-32.h>
> >                            ^
> > compilation terminated.
> > [9/17943] CXX obj.host/third_party/icu/source/common/icuuc.resource.o
> > FAILED: obj.host/third_party/icu/source/common/icuuc.resource.o
> > g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.resource.o.d
> > -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVE=
RSION=3D1
> > -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64
> > -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> > -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CA=
IRO=3D1
> > -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1
> > -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=
=3D1
> > -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1
> > -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1
> > -DENABLE_EXTENSIONS=3D1 -DENABLE_PDF=3D1 -DENABLE_PLUGINS=3D1
> > -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 -DENABLE_PRINTING=3D1
> > -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVIEW=3D1 -DENABLE_SPELLCH=
ECK=3D1
> > -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENABLE_SUPERVISED_USERS=3D1
> > -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -DFULL_SAFE_BROWSING
> > -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMO
> >  N_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0
> > -DU_NOEXCEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DN=
DEBUG
> > -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/s=
ource/common
> > -I../../third_party/icu/source/i18n -Igen -fstack-protector
> > --param=3Dssp-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra
> > -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=3Dhi=
dden
> > -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> > -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> > -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> > -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-depreca=
ted
> > -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/r=
esource.cpp
> > -o obj.host/third_party/icu/source/common/icuuc.resource.o
> > In file included from /usr/include/features.h:399:0,
> >                  from /usr/include/stdint.h:25,
> >                  from /usr/lib/gcc/x86_64-redhat-
> > linux/4.8.5/include/stdint.h:9,
> >                  from ../../third_party/icu/source/
> > common/unicode/ptypes.h:66,
> >                  from ../../third_party/icu/source/
> > common/unicode/umachine.h:44,
> >                  from ../../third_party/icu/source/
> > common/unicode/utypes.h:36,
> >                  from ../../third_party/icu/source/common/resource.h:26,
> >                  from ../../third_party/icu/source/common/resource.cpp:=
12:
> > /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> > or directory
> >  # include <gnu/stubs-32.h>
> >                            ^
> > compilation terminated.
> > [10/17943] CXX obj/third_party/icu/source/common/icuuc.uobject.o
> > [11/17943] CC obj/third_party/icu/source/common/icuuc.ustrfmt.o
> > [12/17943] CXX obj/third_party/icu/source/common/icuuc.ustack.o
> > [13/17943] CC obj/third_party/icu/source/common/icuuc.uscript.o
> > [14/17943] CC obj/third_party/icu/source/common/icuuc.usc_impl.o
> > [15/17943] CC obj/third_party/icu/source/common/icuuc.utf_impl.o
> > [16/17943] ACTION Generating download_file_types.pb.
> > [17/17943] CXX obj/third_party/icu/source/common/icuuc.ustrcase_locale.o
> > [18/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_titlecase_
> > brkiter.o
> > [19/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_cnv.o
> > [20/17943] CXX obj/third_party/icu/source/common/icuuc.util.o
> > [21/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_case_
> > locale.o
> > [22/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_props.o
> > [23/17943] CXX obj/third_party/icu/source/common/icuuc.uscript_props.o
> > [24/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_wcs.o
> > [25/17943] CXX obj/third_party/icu/source/common/icuuc.unormcmp.o
> > [26/17943] CXX obj/third_party/icu/source/common/icuuc.uprops.o
> > [27/17943] CXX obj/third_party/icu/source/common/icuuc.uset_props.o
> > [28/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_case.o
> > [29/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_titlecase_
> > brkiter.o
> > [30/17943] CXX obj/third_party/icu/source/common/icuuc.usetiter.o
> > [31/17943] CXX obj/third_party/icu/source/common/icuuc.unorm.o
> > [32/17943] CXX obj/third_party/icu/source/common/icuuc.ustring.o
> > [33/17943] CXX obj/third_party/icu/source/common/icuuc.ushape.o
> > [34/17943] CXX obj/third_party/icu/source/common/icuuc.uset.o
> > [35/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_cnv.o
> > [36/17943] CXX obj/third_party/icu/source/common/icuuc.ustrenum.o
> > [37/17943] CXX obj/third_party/icu/source/common/icuuc.usprep.o
> > [38/17943] CXX obj/third_party/icu/source/common/icuuc.ustrcase.o
> > [39/17943] CXX obj/third_party/icu/source/common/icuuc.ustrtrns.o
> > [40/17943] CXX obj/third_party/icu/source/common/icuuc.uresdata.o
> > [41/17943] CXX obj/third_party/icu/source/common/icuuc.utext.o
> > [42/17943] CXX obj/third_party/icu/source/common/icuuc.unisetspan.o
> > [43/17943] CXX obj/third_party/icu/source/common/icuuc.uresbund.o
> > ninja: build stopped: subcommand failed.
> > WARNING: /build/test/tmp/work/core2-32-poky-linux/chromium/52.0.2743.
> > 76-r0/temp/run.do_compile.88585:1 exit 1 from 'ninja -C
> > /build/test/tmp/work/core2-32-poky-linux/chromium/52.0.2743.
> > 76-r0/chromium-52.0.2743.76/out/Release -j 40 chrome chrome_sandbox'
> > ERROR: Function failed: do_compile (log file is located at
> > /build/test/tmp/work/core2-32-poky-linux/chromium/52.0.2743.
> > 76-r0/temp/log.do_compile.88585)
> >
> >
> > --
> > Michael Davis
> > Sr. Software Engineer
> > 11128 John Galt Blvd, 3nd floor
> > Omaha, NE 68137
> > Telephone:              (402) 938-1374
> > Fax:                         (402) 970-1275
> > Toll Free:                 1-800-247-8683
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf/mOoACgkQN1Ujt2V2gBw4mgCfYybqzfgd4gwzHOMM4WtyWUs0
cLQAn2gNzjxy1CEkbfCYtM9kvYbKcqU5
=Oe+a
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
