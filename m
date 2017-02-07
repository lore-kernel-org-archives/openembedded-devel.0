Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 734A462134
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 09:02:33 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n125so1800758vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 01:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=pfCGmQo9QLW6xkmgoJ6UWm2BArE9dyveUee63l9+hWM=;
	b=nNRgJTQfdPl0JjwPg40hWlEik4BqHBXZnjZgV6tX4e5ol6Gf3+eAdtvlzSM5gwV9rL
	3SQ1DNjWb6QsXOjAKSvEzx+tQaW8Yt9Ss/iEAMZ+txaYVRBh9Q4HmrL/iANManJQMuPn
	33USpqDgn551cIrPVVZ/kgNMo72YSJxEldJVRXAFPNmxHVKnixPgj2xk7W5GD0oIuSxP
	+v/GEVXz7j2O2zwiQeezQoc/RTUSYjiyJq4oOuANbyDAA6z5snJvihDqB9xr9W/CpNW1
	NuvPJF+1Ue1NUgKBJ8rYN1jjEYqvnYq0BT56J0e+HXDwbS+ZMfFP3WQ33sFX7m47n3Ha
	8Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=pfCGmQo9QLW6xkmgoJ6UWm2BArE9dyveUee63l9+hWM=;
	b=op6ZKeFsWteytdVzub9vQT4uIZONBccM+gJr2RYe8QwnBuAnBQz9k3mKHEg/+6OnKy
	PDPnY835LPmixYbyIi/7yZYvtAUR5pvo0tNpe3sUyBwLn7q6hgLnasLGzvYs9w+jDm7c
	eFpNHRLp8ZbzvXOGkpGG51HYMtULlij5Jba0UsRprjEqvdLL2jE8fMRbWyLWwcDrDlg4
	X/h2EtjETWmlbphCh3tZn+20hBG8VtSFHCYUl2V2YK6tRkIi0i9A9qSEhL7uRMysqJuK
	k6VOIaifqrd4u5nT/l0Ii9ekzAOvxMZAnftbfRupp37IrNCw93fu0y5xdGB8W8iZycE1
	DQjQ==
X-Gm-Message-State: AMke39k+KbJIkFtJ5JfGBJuk1uSGP04TpnbEGH7JAtzC3ynJ/9MTTUqXq0g1LhLy87K89INejVIxzQD+yYXdxg==
X-Received: by 10.31.212.135 with SMTP id l129mr5715637vkg.134.1486458153289; 
	Tue, 07 Feb 2017 01:02:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Tue, 7 Feb 2017 01:02:32 -0800 (PST)
In-Reply-To: <CALbNGRTZrt1BtFdKLZhYq8_2OCRgphPBf7g2T-fGUL0a_qCSaw@mail.gmail.com>
References: <1485442490-2464-1-git-send-email-samuli.piippo@qt.io>
	<20170126200338.GC3016@jama> <20170127163642.GA9282@jama>
	<CALbNGRTZrt1BtFdKLZhYq8_2OCRgphPBf7g2T-fGUL0a_qCSaw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 7 Feb 2017 10:02:32 +0100
Message-ID: <CALbNGRSVE4p1CVDpaVYLJ1P9MCqvBUF37aPgb2+gb9u=doLCUA@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 Feb 2017 09:02:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2017 at 9:22 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Jan 27, 2017 at 5:36 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Thu, Jan 26, 2017 at 09:03:38PM +0100, Martin Jansa wrote:
>>> On Thu, Jan 26, 2017 at 04:54:50PM +0200, Samuli Piippo wrote:
>>> > The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
>>> > the contents of an environment value when qmake is run instead of whe=
n
>>> > Makefile is processed. All OE_QMAKE_xxx variables need to be exported
>>> > for qmake to find them. configure's setBootstrapVariable function nee=
ds
>>> > to change $$(..) to normal $(...) operator to work with qmake's Makef=
ile.
>>> >
>>> > qt.conf generation for qtbase recipes is not needed, as configure wil=
l
>>> > generate its own version based on configure arguments. Skip running
>>> > qmake, since configure is now automatically invoked when it's run in
>>> > qtbase's root folder.
>>> >
>>> > Update PACKAGECONFIGs for qtbase to match current configure options.
>>> >
>>> > The new Qt configuration system [1] can be used with a new variable
>>> > EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
>>> > arguments.
>>> >
>>> > Merge the two qtwayland recipes to one that supports all three target=
s
>>> > (target, native, nativesdk) without need for additional patch.
>>> >
>>> > Recipes for new Qt modules: QtSCXML, QtNetworkAuth, QtGamepad.
>>> > Removes qtdeclarative-render2d
>>>
>>> Thanks this resolved the -no-alsa issue, now it failing a bit further
>>> with:
>>>
>>> |
>>> /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtwebkit/5.8.0+gitAUTOIN=
C+74ac5b0f34-r0/git/Source/ThirdParty/ANGLE/src/compiler/preprocessor/Token=
izer.l:2779:26:
>>> error: 'yylex_destroy' was not declared in this scope
>>>
>>> which might be caused by flex upgrade as I'm seeing similar issues in
>>> other recipes and Khem reported the same here:
>>> http://lists.openembedded.org/pipermail/openembedded-core/2017-January/=
131555.html
>>> and Patrick here:
>>> http://lists.openembedded.org/pipermail/openembedded-core/2017-January/=
131326.html
>>>
>>> Hopefully there will be upgrade to flex-2.6.3 to test this completely.
>>
>> After reverting flex-2.6.2 upgrade I was able to build most of the qt
>> recipes for qemux86 (the complete bitbake world build is still running
>> on jenkins slaves will send report e-mail someday next week).
>>
>> The only exception is qtwebengine which fails like this:
>> | [12/10222] LINK character_data_generator
>> | FAILED: character_data_generator
>> | g++ -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -Wl,-z,r=
elro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags =
-Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -Wl,--no-as-needed -lpthread -Wl,=
--as-needed -o character_data_generator -Wl,--start-group obj.host/src/3rdp=
arty/chromium/third_party/WebKit/Source/platform/text/character_data_genera=
tor.CharacterPropertyDataGenerator.o obj.host/src/3rdparty/chromium/third_p=
arty/icu/libicuuc.a -Wl,--end-group
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.utrie2_builder.o' is incompatible with i3=
86:x86-64 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.utrie2.o' is incompatible with i386:x86-6=
4 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.utrie.o' is incompatible with i386:x86-64=
 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.cmemory.o' is incompatible with i386:x86-=
64 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.ucol_swp.o' is incompatible with i386:x86=
-64 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.udataswp.o' is incompatible with i386:x86=
-64 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.uinvchar.o' is incompatible with i386:x86=
-64 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.ustring.o' is incompatible with i386:x86-=
64 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.utf_impl.o' is incompatible with i386:x86=
-64 output
>> | /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu=
/bin/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/th=
ird_party/icu/source/common/icuuc.cstring.o' is incompatible with i386:x86-=
64 output
>> | obj.host/src/3rdparty/chromium/third_party/icu/source/common/icuuc.cst=
ring.o: In function `T_CString_int64ToString_56':
>> | cstring.c:(.text.T_CString_int64ToString_56+0x76): undefined reference=
 to `__umoddi3'
>> | cstring.c:(.text.T_CString_int64ToString_56+0xa1): undefined reference=
 to `__udivdi3'
>> | collect2: error: ld returned 1 exit status
>> | ERROR: oe_runmake failed
>>
>> So either disable character_data_generator for make sure that the build =
won't mix target's i386 and host's x86-64 objects.
>>
>>> > [1] https://www.mail-archive.com/development@qt-project.org/msg25257.=
html
>>> >
>>> > Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
>>> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>
> Gave it a first try: Seems qmake is broken again: It reports native
> paths only - that breaks a lot - see when I have time to take care.
>
Just checked on other machine: This is same behaviour as in 5.7.0. So
the build breaks somewhere else.

Andreas

