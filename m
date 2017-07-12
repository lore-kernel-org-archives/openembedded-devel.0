Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id E34B37809C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 13:14:22 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id t72so2742491lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E/cinS1x/ir+MKLLTzn9CqMdjrhvEeLe7jSv199Uw1Q=;
	b=tl83g6oAmL1iOrM3Owaaq+ZVSCHu0cUP2Zrb1k4VamnZBGXKhue+6uSuWJoWL+hFPd
	Bbd8njcyjBvg4leM+T7icB91nKTfPsh0oMyggQer49mOaTNg728YQjqi0zQthuYDk2Xh
	LEReCquJrHYEiaBUdUCsydWSeafRakQcFaVkLZedqgzS5O5ZIE99dHSI/3TFng0UVFR6
	KfZpSNyQRKi/R2QS81uqudn77aKDXTap4R/yyuSkXN4vi7oMydwPAfhh3BfyG9GQFEOz
	9CrhfhJ7A+ddIeoZrxYtpNmLZJLUI5RiAukWiJ3k/vH9LrDeZCha8pemW1ZII4Rt13FG
	wXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E/cinS1x/ir+MKLLTzn9CqMdjrhvEeLe7jSv199Uw1Q=;
	b=Sscezl144A1KtPDSUCMRsHdRbvtzR1kgR1X7ipK8E9eZpR2SfZlhTLe8j89BV/llmv
	eTWwfWoU+YufnfFDH1xUiWpI3AekEqWa8nm7gc5hEeq/bCNqdiN0desGOF6OketYvJB5
	9BRksgGi8fVOk+cD4tR/7pVcYV7/BxpiDDRX+yPBr9EUh2gOLIwsiMSunjsoIGeDYqmr
	yeTk23auoc+BLMEFYQFpXAu1HXvx2GcWUq3ti2x6YNnDxM5kTmwQx2B3r0D6JlcYrFjP
	lPOBpUg0y4nqFZ84qPUDBnK275dF8J8m2vimWnDQaG8LIo9dODShu/TRAbnu4hyxJtkt
	as0w==
X-Gm-Message-State: AIVw111Hb4zOJiolTjzNtDdl2/Tsi72xAWaVOp2uTekAYQwTCAJQ3xQL
	w8VG3Jvmccj2T6IcEIjIE/n3325oFA==
X-Received: by 10.80.158.199 with SMTP id a65mr6070828edf.169.1499865263284;
	Wed, 12 Jul 2017 06:14:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Wed, 12 Jul 2017 06:13:52 -0700 (PDT)
In-Reply-To: <CA+chaQcKpDbFe=iq=BbKg4BiUrFfRHBHJePAEOxeMny9fUs8Bg@mail.gmail.com>
References: <20170711181353.4404-1-raj.khem@gmail.com>
	<a5e067ca-4cdf-df31-d106-de26b5637df9@xevo.com>
	<CA+chaQcKpDbFe=iq=BbKg4BiUrFfRHBHJePAEOxeMny9fUs8Bg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jul 2017 06:13:52 -0700
Message-ID: <CAMKF1sq30C2Kr9JsFE1RqeGsJOSC-NvvZeCDb+dJgdf5R5FoAw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase-native: Fix qdbuscpp2xml segfault
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
X-List-Received-Date: Wed, 12 Jul 2017 13:14:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2017 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Is this meant to be applied only for 5.9 or are you seeing this issue wit=
h
> 5.8 as well?
>

for 5.8, i havent tested 5.9

> On Wed, Jul 12, 2017 at 1:13 AM, Martin Kelly <mkelly@xevo.com> wrote:
>>
>> Thanks! This bug has been bothering me for a while now, and the patch
>> fixes the issue for me.
>>
>>
>> On 07/11/2017 11:13 AM, Khem Raj wrote:
>>>
>>> 0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch alone w=
as
>>> causing
>>> qdbuscpp2xml to simply segfault on simple invocation
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>  recipes-qt/qt5/qtbase-native_git.bb                |  1 -
>>>  ...l.pro-do-not-build-with-bootstrapped-depe.patch | 79
>>> ----------------------
>>>  2 files changed, 80 deletions(-)
>>>  delete mode 100644
>>> recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrap=
ped-depe.patch
>>>
>>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb
>>> b/recipes-qt/qt5/qtbase-native_git.bb
>>> index da69812..98cbecc 100644
>>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>>> @@ -33,7 +33,6 @@ SRC_URI +=3D "\
>>>  # common for qtbase-native and nativesdk-qtbase
>>>  SRC_URI +=3D " \
>>>      file://0011-Always-build-uic.patch \
>>> -
>>> file://0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch =
\
>>>  "
>>>
>>>  CLEANBROKEN =3D "1"
>>> diff --git
>>> a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstr=
apped-depe.patch
>>> b/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstr=
apped-depe.patch
>>> deleted file mode 100644
>>> index e72601c..0000000
>>> ---
>>> a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstr=
apped-depe.patch
>>> +++ /dev/null
>>> @@ -1,79 +0,0 @@
>>> -From 86ae0ce931edbe0ac30cfe5f94f681f1d055fdb0 Mon Sep 17 00:00:00 2001
>>> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
>>> -Date: Mon, 6 Mar 2017 11:50:38 +0100
>>> -Subject: [PATCH] qdbuscpp2xml.pro: do not build with bootstrapped
>>> - dependenciies
>>> -MIME-Version: 1.0
>>> -Content-Type: text/plain; charset=3DUTF-8
>>> -Content-Transfer-Encoding: 8bit
>>> -
>>> -Upstream-Status: Pending
>>> -
>>> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ----
>>> - src/src.pro                             | 9 ++-------
>>> - src/tools/qdbuscpp2xml/qdbuscpp2xml.pro | 3 +--
>>> - src/tools/qdbusxml2cpp/qdbusxml2cpp.pro | 5 +----
>>> - 3 files changed, 4 insertions(+), 13 deletions(-)
>>> -
>>> -diff --git a/src/src.pro b/src/src.pro
>>> -index 90d7e2b..0aaf604 100644
>>> ---- a/src/src.pro
>>> -+++ b/src/src.pro
>>> -@@ -4,9 +4,6 @@ QT_FOR_CONFIG +=3D gui-private
>>> - include($$OUT_PWD/corelib/qtcore-config.pri)
>>> - include($$OUT_PWD/gui/qtgui-config.pri)
>>> -
>>> --force_bootstrap|!qtConfig(commandlineparser): \
>>> --    CONFIG +=3D force_dbus_bootstrap
>>> --
>>> - src_qtzlib.file =3D $$PWD/corelib/qtzlib.pro
>>> - src_qtzlib.target =3D sub-zlib
>>> -
>>> -@@ -37,13 +34,11 @@ src_tools_bootstrap_dbus.depends =3D
>>> src_tools_bootstrap
>>> -
>>> - src_tools_qdbusxml2cpp.subdir =3D tools/qdbusxml2cpp
>>> - src_tools_qdbusxml2cpp.target =3D sub-qdbusxml2cpp
>>> --force_dbus_bootstrap: src_tools_qdbusxml2cpp.depends =3D
>>> src_tools_bootstrap_dbus
>>> --else: src_tools_qdbusxml2cpp.depends =3D src_dbus
>>> -+src_tools_qdbusxml2cpp.depends =3D src_dbus
>>> -
>>> - src_tools_qdbuscpp2xml.subdir =3D tools/qdbuscpp2xml
>>> - src_tools_qdbuscpp2xml.target =3D sub-qdbuscpp2xml
>>> --force_bootstrap: src_tools_qdbuscpp2xml.depends =3D
>>> src_tools_bootstrap_dbus
>>> --else: src_tools_qdbuscpp2xml.depends =3D src_dbus
>>> -+src_tools_qdbuscpp2xml.depends =3D src_dbus
>>> -
>>> - src_winmain.subdir =3D $$PWD/winmain
>>> - src_winmain.target =3D sub-winmain
>>> -diff --git a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>> b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>> -index 5ac3159..74c507c 100644
>>> ---- a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>> -+++ b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>> -@@ -1,7 +1,6 @@
>>> - option(host_build)
>>> - QT =3D core-private
>>> --force_bootstrap: QT +=3D bootstrap_dbus-private
>>> --else: QT +=3D dbus-private
>>> -+QT +=3D dbus-private
>>> - DEFINES +=3D QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
>>> - QMAKE_CXXFLAGS +=3D $$QT_HOST_CFLAGS_DBUS
>>> -
>>> -diff --git a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>> b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>> -index d9ee5de..e891103 100644
>>> ---- a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>> -+++ b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>> -@@ -1,9 +1,6 @@
>>> - option(host_build)
>>> --!force_bootstrap:!qtConfig(commandlineparser): \
>>> --    CONFIG +=3D force_bootstrap
>>> - QT =3D core-private
>>> --force_bootstrap: QT +=3D bootstrap_dbus-private
>>> --else: QT +=3D dbus-private
>>> -+QT +=3D dbus-private
>>> - DEFINES +=3D QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
>>> - QMAKE_CXXFLAGS +=3D $$QT_HOST_CFLAGS_DBUS
>>> -
>>> ---
>>> -2.9.3
>>> -
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

