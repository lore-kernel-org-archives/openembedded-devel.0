Return-Path: <mans.zigher@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id C29D06AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 11:04:34 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id b8so3398354oib.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 03:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=bNxH+SPwfY3C71klUgTezzV3PaPGXIptsefWBsb7YL0=;
	b=KuFdfsJdysqcv6qfbh8ClrfksxHhbG+rp0Rc71BNvJ/Ot+ykc7TBaPdHIvbLjTk8+h
	0VnQvUcCSpzgv0yiw45DPcw9lAMlXTRKZlAKuFHhQcy1lAd9bBefIHguG5FIS1RRbAB+
	Qcx8T2Ue1qhoWlDDSwd21h77w8yr9+JTl/m0X/MaEXk5FcUhBztK4IE9dRqrNW0jadbT
	grV+IK/ebyYgewjKq73BocZJbl9YO2ohPUPkCi0A9spLJn3dsTS8sJGFknm4FAoYs8OW
	vU/WBAz5qU2NQ9esAzxpi9ikfjkapQZwAvPVZ+48Qm5aSnUIK6TkW1WcSYqwO0WLhkGQ
	Dllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=bNxH+SPwfY3C71klUgTezzV3PaPGXIptsefWBsb7YL0=;
	b=m/RzkXsGfd5NsYdYUDt1C6qg7mddIf9WG1U0zCb0amevfCuEvZRZXCbPUzPwgECMJn
	+weqLc+BSsIfgi3tw97/UCvbS6sZJI2/GtwZX/6dXcHHwnpotttc3j30BmwxJwCAcuIL
	7zc/k3lJE+UIx+W7dAQPpPtMrCHBDl5Fd5329ZukeVyRli7/id4AiwC4HMjIQfGPy3Bb
	zrkYARiA1YvUzbw5sCXjfCNl1/4+EE7uAdz1tVVxNfP1GgonNWbDYKVldOe+cEds62Kw
	58n8LfM9hLOHDBN4A3jrAJw3lIPw4b9ly8z+lhpuKqF5+YqO0qEJdiA+NXEwxf2G0WrG
	Br0w==
X-Gm-Message-State: APf1xPByzNEh4sl7Mp8xFkEiiDnmKvlxIP121LYdbfJDKomYz990sNDV
	TYgcFVY+KZqdtTb1odB7CxTg0euHo/kOmmwQQjBKEg==
X-Google-Smtp-Source: AH8x224Dd6pyTeTiKYVRNxAo9IKwnKEctdz3OvuBP7YqD278gBAgmr0wRKor23ILNf13Nen3jvj5pwP6MOYyuyRVuHY=
X-Received: by 10.202.206.200 with SMTP id e191mr4082372oig.194.1519297475515; 
	Thu, 22 Feb 2018 03:04:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.110.68 with HTTP; Thu, 22 Feb 2018 03:04:35 -0800 (PST)
In-Reply-To: <CAEhQi8kYxwU+o-MTDcGafFMvYt=fU0CFR6mb5On05Gk_ryvJyw@mail.gmail.com>
References: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
	<CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
	<CAEhQi8kt8eOUDvP9UpZ5vYCW9fSxbhkZ3x6hcbnLRqV=K=7HGQ@mail.gmail.com>
	<CAEhQi8kYxwU+o-MTDcGafFMvYt=fU0CFR6mb5On05Gk_ryvJyw@mail.gmail.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Thu, 22 Feb 2018 12:04:35 +0100
Message-ID: <CAEhQi8kJsaGWaHSTB9mwWSCJ+wCSGEpDXb3V6SWeCLmT56zCwA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt4] Cmake Could NOT find Qt4, missing: QT_MOC_EXECUTABLE
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
X-List-Received-Date: Thu, 22 Feb 2018 11:04:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure if this is the right way to solve it but since all the recipes
have there own sysroot you need to make sure that the QT_INSTALL_PREFIX is
pointing to the right sysroot it should not point to the qt4-native sysroot
since that might not exist especially if using rm_work.
Create a qt.conf file for your recipe and and then implement a
do_configure_prepand where you set the QT_INSTALL_PREFIX to point to the
recipe sysroot. My ended up looking like this.

[Paths]
Prefix =3D "@WORKDIR@/recipe-sysroot-native/"
Binaries =3D "usr/bin"

in do_configure_prepand

do_configure_prepend() {
    sed -i -e 's,@WORKDIR@,${WORKDIR},g' ${WORKDIR}/qt.conf
}

This solved my problem I still couldn't figure out if the qt4-native is
actually broken or if this is the way it should work now that each recipe
have it's own sysroot.

BR
Mans Zigher

2018-02-21 16:49 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:

> Shouldn't it actually point to sysroot-components? Even if the directory
> would actually exists and containing the moc4 then what if the recipe is
> cleared after building qt4-native it would break. Is the problem that
> qt4-native is actually broken for rocko?
>
> BR
> Mans Zigher
>
> 2018-02-21 15:51 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:
>
>> After some more investigation I realized that qmake is actually detected
>> correctly the problem is that when running qmake2 -query I get the
>> following results
>>
>> qmake2 -query
>>
>> QT_INSTALL_PREFIX:/home/build/tmp/work/x86_64-linux/qt4-nati
>> ve/4.8.7-r0/recipe-sysroot-native/usr
>>
>>
>> QT_INSTALL_DATA:/home/build/tmp/work/x86_64-linux/qt4-native
>> /4.8.7-r0/recipe-sysroot-native/usr/share/qt4
>>
>>
>> QT_INSTALL_DOCS:/home/build/tmp/work/x86_64-linux/qt4-native
>> /4.8.7-r0/recipe-sysroot-native/usr/share/doc/qt4
>>
>>
>> QT_INSTALL_HEADERS:/home/build/tmp/work/x86_64-linux/qt4-nat
>> ive/4.8.7-r0/recipe-sysroot-native/usr/include/qt4
>>
>>
>> QT_INSTALL_LIBS:/home/build/tmp/work/x86_64-linux/qt4-native
>> /4.8.7-r0/recipe-sysroot-native/usr/lib
>>
>>
>> QT_INSTALL_BINS:/home/build/tmp/work/x86_64-linux/qt4-native
>> /4.8.7-r0/recipe-sysroot-native/usr/bin
>>
>>
>> QT_INSTALL_PLUGINS:/home/build/tmp/work/x86_64-linux/qt4-nat
>> ive/4.8.7-r0/recipe-sysroot-native/usr/lib/qt4/plugins
>>
>>
>> QT_INSTALL_IMPORTS:/home/build/tmp/work/x86_64-linux/qt4-nat
>> ive/4.8.7-r0/recipe-sysroot-native/usr/lib/qt4/imports
>>
>>
>> QT_INSTALL_TRANSLATIONS:/home/build/tmp/work/x86_64-linux/qt
>> 4-native/4.8.7-r0/recipe-sysroot-native/usr/share/qt4/translations
>>
>>
>> QT_INSTALL_CONFIGURATION:/home/build/tmp/work/x86_64-linux/q
>> t4-native/4.8.7-r0/recipe-sysroot-native/etc/qt4
>>
>>
>> QT_INSTALL_EXAMPLES:/home/build/tmp/work/x86_64-linux/qt4-na
>> tive/4.8.7-r0/recipe-sysroot-native/usr/bin/qt4/examples
>>
>>
>> QT_INSTALL_DEMOS:/home/build/tmp/work/x86_64-linux/qt4-nativ
>> e/4.8.7-r0/recipe-sysroot-native/usr/bin/qt4/demos
>>
>>
>> QMAKE_MKSPECS:/home/build/tmp/work/x86_64-linux/qt4-native/4
>> .8.7-r0/recipe-sysroot-native/usr/share/qt4/mkspecs
>>
>>
>> QMAKE_VERSION:2.01a
>> QT_VERSION:4.8.7
>>
>> QT_INSTALL_BINS:/home/build/tmp/work/x86_64-linux/qt4-native
>> /4.8.7-r0/recipe-sysroot-native/usr/bin is a directory that is none
>> existing.
>>
>> BR
>> Mans Zigher
>>
>>
>> 2018-02-21 13:13 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:
>>
>>> When running devshell I can verify that echo $PATH includes the
>>> recipe-sysroot-native dir and if I run "whereis qmake2" the
>>> recipe-sysroot-native dir appears. So the question remains why is CMake=
 not
>>> detecting the binaries?
>>>
>>> BR
>>> Mans Zigher
>>>
>>> 2018-02-21 13:02 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:
>>>
>>>> Hi,
>>>>
>>>> I am trying to build a native QT application that is required when
>>>> generating the image. The recipe is depending on qt4-native and i am u=
sing
>>>> poky version rocko. The application is using CMake which is producing =
the
>>>> following error
>>>>
>>>> | -- Looking for Q_WS_MAC - not found
>>>> | CMake Error at recipe-sysroot-native/usr/shar
>>>> e/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137
>>>> (message):
>>>> |   Could NOT find Qt4 (missing: QT_MOC_EXECUTABLE QT_RCC_EXECUTABLE
>>>> |   QT_UIC_EXECUTABLE) (found version "4.8.7")
>>>> | Call Stack (most recent call first):
>>>> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindPackageHandl=
eStandardArgs.cmake:377
>>>> (_FPHSA_FAILURE_MESSAGE)
>>>> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindQt4.cmake:13=
26
>>>> (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>>>> |   CMakeLists.txt:5 (find_package)
>>>>
>>>> When using jethro the recipe works fine. If I search for qmake2 in the
>>>> build directory we get the following hits
>>>>
>>>> ./tmp/sysroots-components/x86_64/qt4-native/usr/bin/qmake2
>>>> ./tmp/work/x86_64-linux/my-qt-application/0.1-r0/recipe-sysr
>>>> oot-native/usr/bin/qmake2
>>>> ./tmp/work/x86_64-linux/qt4-native/4.8.7-r0/sysroot-destdir/
>>>> home/build/tmp/work/x86_64-linux/qt4-native/4.8.7-r0/recipe-
>>>> sysroot-native/usr/bin/qmake2
>>>>
>>>> I would think that CMake should find qmake2 in the
>>>> recipe-sysroot-native dir. Any help would be appreciated. How can I po=
int
>>>> CMake in the direction so it finds the qt tools.
>>>>
>>>> BR
>>>> M=C3=A5ns Zigher
>>>>
>>>>
>>>
>>
>

