Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0784571A6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 08:22:23 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id f2so9610746uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 00:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=GoezcNuwjLrFDRlhdZUWczoc5QSYmdqC67k3+KzcOIY=;
	b=McqXeTjjxcJjLQwY07Md2ElFKad3fHd4TH601Pf4eJ0Qzpl6tUUYcAhJMcHfqWLkiQ
	uRxg5bsbHT6kKObwFJu4etkDxvnC48/7sGHW/HWpGaf5pIOuxuVmQnsEXt6bZpRde+Vx
	wmFkRXvLZrz432OIZ6znyEyhQ4ujpBUB74QDigp2b6uP+u2/V/PSZF4JVAPSXfdcwzao
	r96Jh+Z4B8cBBYQ/cO1bp9JqvzfCrt5hANMPojnTf6R7Z6rPyLIwDyfX5i7US1mH/xR5
	WASknRbbUUUeemJInfZt8JBhBuUkW0JALb/0yUhRAbL3qiMehZqDIjw5fE0/hVh+itjx
	LGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=GoezcNuwjLrFDRlhdZUWczoc5QSYmdqC67k3+KzcOIY=;
	b=JyH4AmjGbGTebvbB4D+Q3eq7zG68bOS36jEQaVga2vjUdNTsCjvS2O22Tq1MPc57Sr
	mBYSurIqrfShe3WcHh7Niag2rmMpl72odS5Dx9G/GkEv9E2BbWL5jPK4uJyseGS/2eW8
	xGZJkXcckmIk0FmfFPMsAlAztIghVfH6haPbmRott8pBbY8rk2IXw23/4zRrYf86pD1g
	jhsWszzic1/0ez4E87bN39k4S6uWSopKVv26cSmc1nLe6zfiu9vACiQhYz9J3WqwTM87
	PLxK3V4FCcmc4g9UZVgv2B/8DewDoQnZWKhpGPf5NKsmSU2SnpGfM33wEW4Yf95wEPHP
	B7aA==
X-Gm-Message-State: AMke39nUDxt/JgK3WvvwKKS2Yn+VuwNj3+eshciN6+ZQWK+04+kTHyLuBas+vq3r/vC447akslwbeXoItvd/9Q==
X-Received: by 10.159.37.202 with SMTP id 68mr7274056uaf.80.1486455743283;
	Tue, 07 Feb 2017 00:22:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Tue, 7 Feb 2017 00:22:22 -0800 (PST)
In-Reply-To: <20170127163642.GA9282@jama>
References: <1485442490-2464-1-git-send-email-samuli.piippo@qt.io>
	<20170126200338.GC3016@jama> <20170127163642.GA9282@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 7 Feb 2017 09:22:22 +0100
Message-ID: <CALbNGRTZrt1BtFdKLZhYq8_2OCRgphPBf7g2T-fGUL0a_qCSaw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v6] Upgrade to Qt 5.8
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
X-List-Received-Date: Tue, 07 Feb 2017 08:22:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 5:36 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jan 26, 2017 at 09:03:38PM +0100, Martin Jansa wrote:
>> On Thu, Jan 26, 2017 at 04:54:50PM +0200, Samuli Piippo wrote:
>> > The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
>> > the contents of an environment value when qmake is run instead of when
>> > Makefile is processed. All OE_QMAKE_xxx variables need to be exported
>> > for qmake to find them. configure's setBootstrapVariable function need=
s
>> > to change $$(..) to normal $(...) operator to work with qmake's Makefi=
le.
>> >
>> > qt.conf generation for qtbase recipes is not needed, as configure will
>> > generate its own version based on configure arguments. Skip running
>> > qmake, since configure is now automatically invoked when it's run in
>> > qtbase's root folder.
>> >
>> > Update PACKAGECONFIGs for qtbase to match current configure options.
>> >
>> > The new Qt configuration system [1] can be used with a new variable
>> > EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
>> > arguments.
>> >
>> > Merge the two qtwayland recipes to one that supports all three targets
>> > (target, native, nativesdk) without need for additional patch.
>> >
>> > Recipes for new Qt modules: QtSCXML, QtNetworkAuth, QtGamepad.
>> > Removes qtdeclarative-render2d
>>
>> Thanks this resolved the -no-alsa issue, now it failing a bit further
>> with:
>>
>> |
>> /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtwebkit/5.8.0+gitAUTOINC=
+74ac5b0f34-r0/git/Source/ThirdParty/ANGLE/src/compiler/preprocessor/Tokeni=
zer.l:2779:26:
>> error: 'yylex_destroy' was not declared in this scope
>>
>> which might be caused by flex upgrade as I'm seeing similar issues in
>> other recipes and Khem reported the same here:
>> http://lists.openembedded.org/pipermail/openembedded-core/2017-January/1=
31555.html
>> and Patrick here:
>> http://lists.openembedded.org/pipermail/openembedded-core/2017-January/1=
31326.html
>>
>> Hopefully there will be upgrade to flex-2.6.3 to test this completely.
>
> After reverting flex-2.6.2 upgrade I was able to build most of the qt
> recipes for qemux86 (the complete bitbake world build is still running
> on jenkins slaves will send report e-mail someday next week).
>
> The only exception is qtwebengine which fails like this:
> | [12/10222] LINK character_data_generator
> | FAILED: character_data_generator
> | g++ -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -Wl,-z,re=
lro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags -=
Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -Wl,--no-as-needed -lpthread -Wl,-=
-as-needed -o character_data_generator -Wl,--start-group obj.host/src/3rdpa=
rty/chromium/third_party/WebKit/Source/platform/text/character_data_generat=
or.CharacterPropertyDataGenerator.o obj.host/src/3rdparty/chromium/third_pa=
rty/icu/libicuuc.a -Wl,--end-group
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.utrie2_builder.o' is incompatible with i38=
6:x86-64 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.utrie2.o' is incompatible with i386:x86-64=
 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.utrie.o' is incompatible with i386:x86-64 =
output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.cmemory.o' is incompatible with i386:x86-6=
4 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.ucol_swp.o' is incompatible with i386:x86-=
64 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.udataswp.o' is incompatible with i386:x86-=
64 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.uinvchar.o' is incompatible with i386:x86-=
64 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.ustring.o' is incompatible with i386:x86-6=
4 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.utf_impl.o' is incompatible with i386:x86-=
64 output
> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/=
bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/thi=
rd_party/icu/source/common/icuuc.cstring.o' is incompatible with i386:x86-6=
4 output
> | obj.host/src/3rdparty/chromium/third_party/icu/source/common/icuuc.cstr=
ing.o: In function `T_CString_int64ToString_56':
> | cstring.c:(.text.T_CString_int64ToString_56+0x76): undefined reference =
to `__umoddi3'
> | cstring.c:(.text.T_CString_int64ToString_56+0xa1): undefined reference =
to `__udivdi3'
> | collect2: error: ld returned 1 exit status
> | ERROR: oe_runmake failed
>
> So either disable character_data_generator for make sure that the build w=
on't mix target's i386 and host's x86-64 objects.
>
>> > [1] https://www.mail-archive.com/development@qt-project.org/msg25257.h=
tml
>> >
>> > Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
>> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>
Gave it a first try: Seems qmake is broken again: It reports native
paths only - that breaks a lot - see when I have time to take care.

[a.mueller@localhost oe-core]$
~/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/bin/qt5/qmake -query
QT_SYSROOT:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux
QT_INSTALL_PREFIX:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/h=
ome/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr
QT_INSTALL_PREFIX/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-lin=
ux/usr
QT_INSTALL_ARCHDATA:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux=
/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/qt5
QT_INSTALL_ARCHDATA/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-l=
inux/usr/lib/qt5
QT_INSTALL_DATA:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/hom=
e/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/share/qt5
QT_INSTALL_DATA/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux=
/usr/share/qt5
QT_INSTALL_DOCS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/hom=
e/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/share/doc/qt5
QT_INSTALL_DOCS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux=
/usr/share/doc/qt5
QT_INSTALL_HEADERS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/=
home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/include/qt5
QT_INSTALL_HEADERS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-li=
nux/usr/include/qt5
QT_INSTALL_LIBS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/hom=
e/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib
QT_INSTALL_LIBS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux=
/usr/lib
QT_INSTALL_LIBEXECS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux=
/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/qt5/libexec
QT_INSTALL_LIBEXECS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-l=
inux/usr/lib/qt5/libexec
QT_INSTALL_BINS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/hom=
e/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/bin/qt5
QT_INSTALL_BINS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux=
/usr/bin/qt5
QT_INSTALL_TESTS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/ho=
me/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/tests
QT_INSTALL_TESTS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linu=
x/usr/tests
QT_INSTALL_PLUGINS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/=
home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/qt5/plugins
QT_INSTALL_PLUGINS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-li=
nux/usr/lib/qt5/plugins
QT_INSTALL_IMPORTS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/=
home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/qt5/imports
QT_INSTALL_IMPORTS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-li=
nux/usr/lib/qt5/imports
QT_INSTALL_QML:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/home=
/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/qt5/qml
QT_INSTALL_QML/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/=
usr/lib/qt5/qml
QT_INSTALL_TRANSLATIONS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-l=
inux/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/share/qt5/t=
ranslations
QT_INSTALL_TRANSLATIONS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_=
64-linux/usr/share/qt5/translations
QT_INSTALL_CONFIGURATION:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-=
linux/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/etc/qt5
QT_INSTALL_CONFIGURATION/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86=
_64-linux/etc/qt5
QT_INSTALL_EXAMPLES:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux=
/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/examples
QT_INSTALL_EXAMPLES/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-l=
inux/usr/examples
QT_INSTALL_DEMOS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/ho=
me/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/examples
QT_INSTALL_DEMOS/raw:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linu=
x/usr/examples
QT_HOST_PREFIX:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr
QT_HOST_DATA:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/li=
b/qt5
QT_HOST_BINS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/bi=
n/qt5
QT_HOST_LIBS:/home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/li=
b
QMAKE_SPEC:linux-oe-g++
QMAKE_XSPEC:linux-oe-g++
QMAKE_VERSION:3.1
QT_VERSION:5.8.0

