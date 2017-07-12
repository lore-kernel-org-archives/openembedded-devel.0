Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id BEEBD780F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 08:30:16 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id p207so4745191yba.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wi0dul1uTAkUEasfUNEnKF6clxeLqlRqnQcgfks1CT8=;
	b=l8+LPYhp0DwtLWk3LJirdP2SWykPyruH+vN8RZmVFQoBih3lpvSnJ8EaUqcarNFUen
	e9wmWH/fBxUTZ9zojRquziDytyd1J2nE6aQsMatSYRIx6ZtzhJgDgEgzQAF2KzugJE6U
	T+7axNIDB5tn38uaxWhIDin48fBZsOM46bC3qhf2Y0f7AYH1NLUU4vpTBv9veVfEnS+N
	wA1PWPT5WHHrZf85ikxdh4t3xsSIlGls5DBC2rkEod/p+ZWYyjsb0fqILYAqac1XDke8
	4PmszzSnBbz6EzN2JdPuNTB9EeS6Cib0hwGFBh7PIbrLqyOBIxFQr3zOrOY/SYhA5cF3
	YdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wi0dul1uTAkUEasfUNEnKF6clxeLqlRqnQcgfks1CT8=;
	b=p7yHL4TzD7DOu1/A2Uc5dXVB3OwxkMmmSXrNvt80EH9xx0iRFi3FxyJJXHdvlVwjlq
	7YbQCrAYB/uDEdkaQPG5W8LlTFjyh4MU1PEPdJ744avznDRZFkMygSxwaVZ0BaTKfKbH
	LxDXLTB1mikMet7qQP6U/MMSddxbA/tBDLgxMM0EHIZasme7y7GkJ3f8pJzZR0nPH0N7
	91Rk453DtMLTub26t1piBrRv3Um4h7+G/P3J8iC59CyiZuC9gr9913QcS2S5a2jAwQ8j
	8Wd1iSHNi1Ky6BLEZ9JKpQopg5qCT6OJxb9fWZxpT19pz9tXhZsXOZji1L2pKi4gfhH5
	14pA==
X-Gm-Message-State: AIVw113vnnwnXzNGFRU14lhP2F8ZihGRZjj2VG2itBgDEYJH9u47J4JB
	+lm0H/ToUJNNFbw4Cx99gxPIo+dIpA==
X-Received: by 10.37.200.69 with SMTP id y66mr24804ybf.147.1499844609254; Wed,
	12 Jul 2017 00:30:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Wed, 12 Jul 2017 00:30:08 -0700 (PDT)
In-Reply-To: <a5e067ca-4cdf-df31-d106-de26b5637df9@xevo.com>
References: <20170711181353.4404-1-raj.khem@gmail.com>
	<a5e067ca-4cdf-df31-d106-de26b5637df9@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Jul 2017 08:30:08 +0100
Message-ID: <CA+chaQcKpDbFe=iq=BbKg4BiUrFfRHBHJePAEOxeMny9fUs8Bg@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 12 Jul 2017 08:30:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this meant to be applied only for 5.9 or are you seeing this issue with
5.8 as well?

On Wed, Jul 12, 2017 at 1:13 AM, Martin Kelly <mkelly@xevo.com> wrote:

> Thanks! This bug has been bothering me for a while now, and the patch
> fixes the issue for me.
>
>
> On 07/11/2017 11:13 AM, Khem Raj wrote:
>
>> 0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch alone
>> was causing
>> qdbuscpp2xml to simply segfault on simple invocation
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  recipes-qt/qt5/qtbase-native_git.bb                |  1 -
>>  ...l.pro-do-not-build-with-bootstrapped-depe.patch | 79
>> ----------------------
>>  2 files changed, 80 deletions(-)
>>  delete mode 100644 recipes-qt/qt5/qtbase/0012-qdb
>> uscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>>
>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
>> qtbase-native_git.bb
>> index da69812..98cbecc 100644
>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>> @@ -33,7 +33,6 @@ SRC_URI +=3D "\
>>  # common for qtbase-native and nativesdk-qtbase
>>  SRC_URI +=3D " \
>>      file://0011-Always-build-uic.patch \
>> -    file://0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.pa=
tch
>> \
>>  "
>>
>>  CLEANBROKEN =3D "1"
>> diff --git a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-wi=
th-bootstrapped-depe.patch
>> b/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-w
>> ith-bootstrapped-depe.patch
>> deleted file mode 100644
>> index e72601c..0000000
>> --- a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-w
>> ith-bootstrapped-depe.patch
>> +++ /dev/null
>> @@ -1,79 +0,0 @@
>> -From 86ae0ce931edbe0ac30cfe5f94f681f1d055fdb0 Mon Sep 17 00:00:00 2001
>> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@google=
mail.com>
>> -Date: Mon, 6 Mar 2017 11:50:38 +0100
>> -Subject: [PATCH] qdbuscpp2xml.pro: do not build with bootstrapped
>> - dependenciies
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ----
>> - src/src.pro                             | 9 ++-------
>> - src/tools/qdbuscpp2xml/qdbuscpp2xml.pro | 3 +--
>> - src/tools/qdbusxml2cpp/qdbusxml2cpp.pro | 5 +----
>> - 3 files changed, 4 insertions(+), 13 deletions(-)
>> -
>> -diff --git a/src/src.pro b/src/src.pro
>> -index 90d7e2b..0aaf604 100644
>> ---- a/src/src.pro
>> -+++ b/src/src.pro
>> -@@ -4,9 +4,6 @@ QT_FOR_CONFIG +=3D gui-private
>> - include($$OUT_PWD/corelib/qtcore-config.pri)
>> - include($$OUT_PWD/gui/qtgui-config.pri)
>> -
>> --force_bootstrap|!qtConfig(commandlineparser): \
>> --    CONFIG +=3D force_dbus_bootstrap
>> --
>> - src_qtzlib.file =3D $$PWD/corelib/qtzlib.pro
>> - src_qtzlib.target =3D sub-zlib
>> -
>> -@@ -37,13 +34,11 @@ src_tools_bootstrap_dbus.depends =3D
>> src_tools_bootstrap
>> -
>> - src_tools_qdbusxml2cpp.subdir =3D tools/qdbusxml2cpp
>> - src_tools_qdbusxml2cpp.target =3D sub-qdbusxml2cpp
>> --force_dbus_bootstrap: src_tools_qdbusxml2cpp.depends =3D
>> src_tools_bootstrap_dbus
>> --else: src_tools_qdbusxml2cpp.depends =3D src_dbus
>> -+src_tools_qdbusxml2cpp.depends =3D src_dbus
>> -
>> - src_tools_qdbuscpp2xml.subdir =3D tools/qdbuscpp2xml
>> - src_tools_qdbuscpp2xml.target =3D sub-qdbuscpp2xml
>> --force_bootstrap: src_tools_qdbuscpp2xml.depends =3D
>> src_tools_bootstrap_dbus
>> --else: src_tools_qdbuscpp2xml.depends =3D src_dbus
>> -+src_tools_qdbuscpp2xml.depends =3D src_dbus
>> -
>> - src_winmain.subdir =3D $$PWD/winmain
>> - src_winmain.target =3D sub-winmain
>> -diff --git a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>> b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>> -index 5ac3159..74c507c 100644
>> ---- a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>> -+++ b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>> -@@ -1,7 +1,6 @@
>> - option(host_build)
>> - QT =3D core-private
>> --force_bootstrap: QT +=3D bootstrap_dbus-private
>> --else: QT +=3D dbus-private
>> -+QT +=3D dbus-private
>> - DEFINES +=3D QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
>> - QMAKE_CXXFLAGS +=3D $$QT_HOST_CFLAGS_DBUS
>> -
>> -diff --git a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>> b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>> -index d9ee5de..e891103 100644
>> ---- a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>> -+++ b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>> -@@ -1,9 +1,6 @@
>> - option(host_build)
>> --!force_bootstrap:!qtConfig(commandlineparser): \
>> --    CONFIG +=3D force_bootstrap
>> - QT =3D core-private
>> --force_bootstrap: QT +=3D bootstrap_dbus-private
>> --else: QT +=3D dbus-private
>> -+QT +=3D dbus-private
>> - DEFINES +=3D QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
>> - QMAKE_CXXFLAGS +=3D $$QT_HOST_CFLAGS_DBUS
>> -
>> ---
>> -2.9.3
>> -
>>
>> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

