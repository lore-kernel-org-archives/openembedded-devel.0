Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 89458787ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 15:49:47 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id q12so1789474otg.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 07:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ahm6PRCAPdY+RQOin2d/xmwQeXZ1Uypi2dEgwaMuPio=;
	b=Lpsrq0PJUXnPd6snEdG3AuJ1eQsFndgAq2QtSVLYSc63wzQew8iAxz6zd3h2Yit66w
	9ZA4b1T/g425UB9e2oS5dOcd354UTpSsg2T+3EPOfADfpVVp7pGeMWbXpJyqItAZkAxp
	GBCgfpU0SuUNzlfJN1H+OEieT12Lo+0xsCbsKoiJjkt+7yiBftTVBMthU/L5qVm3+BVF
	TwpDoqHT0mUVLXc1B/fO71bQxhf2/+TPHmCmEkrT91KC8ABvB5dcE2voVodE/nOznzDV
	G1GlZKHfh7wZ4E0krVP1Se88SMuFjBSpRcTBvyBqhPTitIu12nqsSUA/t9wMG/eBHj2S
	Sv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ahm6PRCAPdY+RQOin2d/xmwQeXZ1Uypi2dEgwaMuPio=;
	b=QlILbXThhpUlo//hBcf1GGosXzmfiDSr+hU4dPcheTl6AeWEqHrn+z5g5BL4CkToxD
	bIW9GCG2bQEpVwu5f7tNsDtHp7uR8C7211OOvyCtwDMTihSbDtFSJwIsNNyfJnf9IX8t
	Ch3ftRyqgpPG9HqwBLUypxfuoHRkNkViEEmewnX+bCk26Yr8Hs76v+CJYYgr+c6TNJ02
	koHDy6P3K6FBbTE7BEwjjXRvbDnKOEYhDNhDBjhiKi/4h6/nChbxbyVBvDHieQbhKSg1
	U20AtBLuJCWmK5WvLYv1CGyvV/V1rHDP4Jsx0Aobw/pVb8554Drsqs3fImJfr/gL7Gfy
	ZBdQ==
X-Gm-Message-State: APf1xPAtnxLYV7jbFMa8lvJQHiyLA6JGSJQZ9l3WZwaK/jsDS3so11jh
	aaHYf/3LrH22a/gVW34NHL8j9heRjtaVMCtsUFI=
X-Google-Smtp-Source: AH8x224OacKzC3ckBTnFG4JzImxvYrJTuW+4MdkUoL4C7Y08UIbLtjIE4YqwsAw7Gjehdfx8ufxIm2s1f1KqPiiIbtU=
X-Received: by 10.157.3.196 with SMTP id f62mr2836526otf.360.1519228188674;
	Wed, 21 Feb 2018 07:49:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.110.68 with HTTP; Wed, 21 Feb 2018 07:49:48 -0800 (PST)
In-Reply-To: <CAEhQi8kt8eOUDvP9UpZ5vYCW9fSxbhkZ3x6hcbnLRqV=K=7HGQ@mail.gmail.com>
References: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
	<CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
	<CAEhQi8kt8eOUDvP9UpZ5vYCW9fSxbhkZ3x6hcbnLRqV=K=7HGQ@mail.gmail.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Wed, 21 Feb 2018 16:49:48 +0100
Message-ID: <CAEhQi8kYxwU+o-MTDcGafFMvYt=fU0CFR6mb5On05Gk_ryvJyw@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 15:49:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Shouldn't it actually point to sysroot-components? Even if the directory
would actually exists and containing the moc4 then what if the recipe is
cleared after building qt4-native it would break. Is the problem that
qt4-native is actually broken for rocko?

BR
Mans Zigher

2018-02-21 15:51 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:

> After some more investigation I realized that qmake is actually detected
> correctly the problem is that when running qmake2 -query I get the
> following results
>
> qmake2 -query
>
> QT_INSTALL_PREFIX:/home/build/tmp/work/x86_64-linux/qt4-nati
> ve/4.8.7-r0/recipe-sysroot-native/usr
>
>
> QT_INSTALL_DATA:/home/build/tmp/work/x86_64-linux/qt4-native
> /4.8.7-r0/recipe-sysroot-native/usr/share/qt4
>
>
> QT_INSTALL_DOCS:/home/build/tmp/work/x86_64-linux/qt4-native
> /4.8.7-r0/recipe-sysroot-native/usr/share/doc/qt4
>
>
> QT_INSTALL_HEADERS:/home/build/tmp/work/x86_64-linux/qt4-
> native/4.8.7-r0/recipe-sysroot-native/usr/include/qt4
>
>
> QT_INSTALL_LIBS:/home/build/tmp/work/x86_64-linux/qt4-native
> /4.8.7-r0/recipe-sysroot-native/usr/lib
>
>
> QT_INSTALL_BINS:/home/build/tmp/work/x86_64-linux/qt4-native
> /4.8.7-r0/recipe-sysroot-native/usr/bin
>
>
> QT_INSTALL_PLUGINS:/home/build/tmp/work/x86_64-linux/qt4-
> native/4.8.7-r0/recipe-sysroot-native/usr/lib/qt4/plugins
>
>
> QT_INSTALL_IMPORTS:/home/build/tmp/work/x86_64-linux/qt4-
> native/4.8.7-r0/recipe-sysroot-native/usr/lib/qt4/imports
>
>
> QT_INSTALL_TRANSLATIONS:/home/build/tmp/work/x86_64-linux/qt
> 4-native/4.8.7-r0/recipe-sysroot-native/usr/share/qt4/translations
>
>
> QT_INSTALL_CONFIGURATION:/home/build/tmp/work/x86_64-linux/
> qt4-native/4.8.7-r0/recipe-sysroot-native/etc/qt4
>
>
> QT_INSTALL_EXAMPLES:/home/build/tmp/work/x86_64-linux/qt4-
> native/4.8.7-r0/recipe-sysroot-native/usr/bin/qt4/examples
>
>
> QT_INSTALL_DEMOS:/home/build/tmp/work/x86_64-linux/qt4-nativ
> e/4.8.7-r0/recipe-sysroot-native/usr/bin/qt4/demos
>
>
> QMAKE_MKSPECS:/home/build/tmp/work/x86_64-linux/qt4-native/4
> .8.7-r0/recipe-sysroot-native/usr/share/qt4/mkspecs
>
>
> QMAKE_VERSION:2.01a
> QT_VERSION:4.8.7
>
> QT_INSTALL_BINS:/home/build/tmp/work/x86_64-linux/qt4-native
> /4.8.7-r0/recipe-sysroot-native/usr/bin is a directory that is none
> existing.
>
> BR
> Mans Zigher
>
>
> 2018-02-21 13:13 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:
>
>> When running devshell I can verify that echo $PATH includes the
>> recipe-sysroot-native dir and if I run "whereis qmake2" the
>> recipe-sysroot-native dir appears. So the question remains why is CMake =
not
>> detecting the binaries?
>>
>> BR
>> Mans Zigher
>>
>> 2018-02-21 13:02 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:
>>
>>> Hi,
>>>
>>> I am trying to build a native QT application that is required when
>>> generating the image. The recipe is depending on qt4-native and i am us=
ing
>>> poky version rocko. The application is using CMake which is producing t=
he
>>> following error
>>>
>>> | -- Looking for Q_WS_MAC - not found
>>> | CMake Error at recipe-sysroot-native/usr/shar
>>> e/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>>>
>>> |   Could NOT find Qt4 (missing: QT_MOC_EXECUTABLE QT_RCC_EXECUTABLE
>>> |   QT_UIC_EXECUTABLE) (found version "4.8.7")
>>> | Call Stack (most recent call first):
>>> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindPackageHandle=
StandardArgs.cmake:377
>>> (_FPHSA_FAILURE_MESSAGE)
>>> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindQt4.cmake:132=
6
>>> (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>>> |   CMakeLists.txt:5 (find_package)
>>>
>>> When using jethro the recipe works fine. If I search for qmake2 in the
>>> build directory we get the following hits
>>>
>>> ./tmp/sysroots-components/x86_64/qt4-native/usr/bin/qmake2
>>> ./tmp/work/x86_64-linux/my-qt-application/0.1-r0/recipe-sysr
>>> oot-native/usr/bin/qmake2
>>> ./tmp/work/x86_64-linux/qt4-native/4.8.7-r0/sysroot-destdir/
>>> home/build/tmp/work/x86_64-linux/qt4-native/4.8.7-r0/recipe-
>>> sysroot-native/usr/bin/qmake2
>>>
>>> I would think that CMake should find qmake2 in the recipe-sysroot-nativ=
e
>>> dir. Any help would be appreciated. How can I point CMake in the direct=
ion
>>> so it finds the qt tools.
>>>
>>> BR
>>> M=C3=A5ns Zigher
>>>
>>>
>>
>

