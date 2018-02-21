Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id E814E60806
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:51:42 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id b15so1619149otf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eCEZSkQozL1sQi0UeQt0nL7GUHcGYmkiko4WLu+6zRA=;
	b=pCrxmO7SAmOO+epXUg2sAkX7FNDases7brWnbQblUHvdZTWRn6E2jwZM6qyX2SrMy4
	h99qM+dfbDWfcDi2CDRZWm2SWON8kHR+9sV2lNMFX/p78dtgu5nJ8uyXqGaNC/CaNW3C
	YI5t4fUHlmKVHHSBtTLSN5PJqMwwIMLH5pO6dsDlB8V06zS1WMuQzHwpWyLBcYI9Lynh
	/7OiWkzv6qjtGrANZO5gV5jiJL8/A7cHpGafvJx68JnO13xHgANuLiR1C9AtQDsROcjR
	4ujO1A2sV/pGKedvZGQaCHHwD55ao9Urh9zLfOfwNpbtBEsp1l2KlfaAA8RHNV/fhfBn
	ZWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eCEZSkQozL1sQi0UeQt0nL7GUHcGYmkiko4WLu+6zRA=;
	b=Xfp2R8R40ltPF9lYWFTBANcJFWB++YRisbBoCSNg56dFUKfwZUzrrr6Iv5nPPNOkbY
	xhW5KMkK8ZP1bXJIOM0VmH8Joc3sPodf1jyvpOekskQjVRSiq646YBL7ZiId0RraEInr
	F4SrSUp4l8PwB1/HGUFznGtNV1s9j7HnKWQafnok+I8qcofRV33K/+kdk7IfEIwuTYN8
	yu1EamYkT6sYgc7vH88JoXjNDReq1/IGNixHNNLww9aH9EVPphvSC00Sthz1qanAE8kA
	oyIx4ESwh9p+BT5PHpptsbYbkBE3X969jnl4HHCdtQaInTpCtfzQd7zMjjos6g3sJda/
	ZmUg==
X-Gm-Message-State: APf1xPADRJRa7thM1D7Og/qObgMC5p/QJ4vYezWfe72ZRxVPwOyXRbOZ
	rK7fXjWg3jM0pIeRFxYHniUb6YbSOwdD7K3JSkdtgQ==
X-Google-Smtp-Source: AG47ELtJW5JUuLsYkrRmhvcs8nBZSYxJKrFUShq4tV1dylefuXEGp58rG5BhLz0rkyVhOhxCVRliEJiPxoCwt2BXizc=
X-Received: by 10.157.37.47 with SMTP id k44mr2375037otb.27.1519224703632;
	Wed, 21 Feb 2018 06:51:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.110.68 with HTTP; Wed, 21 Feb 2018 06:51:43 -0800 (PST)
In-Reply-To: <CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
References: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
	<CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Wed, 21 Feb 2018 15:51:43 +0100
Message-ID: <CAEhQi8kt8eOUDvP9UpZ5vYCW9fSxbhkZ3x6hcbnLRqV=K=7HGQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 14:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After some more investigation I realized that qmake is actually detected
correctly the problem is that when running qmake2 -query I get the
following results

qmake2 -query

QT_INSTALL_PREFIX:/home/build/tmp/work/x86_64-linux/qt4-
native/4.8.7-r0/recipe-sysroot-native/usr


QT_INSTALL_DATA:/home/build/tmp/work/x86_64-linux/qt4-
native/4.8.7-r0/recipe-sysroot-native/usr/share/qt4


QT_INSTALL_DOCS:/home/build/tmp/work/x86_64-linux/qt4-
native/4.8.7-r0/recipe-sysroot-native/usr/share/doc/qt4


QT_INSTALL_HEADERS:/home/build/tmp/work/x86_64-linux/
qt4-native/4.8.7-r0/recipe-sysroot-native/usr/include/qt4


QT_INSTALL_LIBS:/home/build/tmp/work/x86_64-linux/qt4-
native/4.8.7-r0/recipe-sysroot-native/usr/lib


QT_INSTALL_BINS:/home/build/tmp/work/x86_64-linux/qt4-
native/4.8.7-r0/recipe-sysroot-native/usr/bin


QT_INSTALL_PLUGINS:/home/build/tmp/work/x86_64-linux/
qt4-native/4.8.7-r0/recipe-sysroot-native/usr/lib/qt4/plugins


QT_INSTALL_IMPORTS:/home/build/tmp/work/x86_64-linux/
qt4-native/4.8.7-r0/recipe-sysroot-native/usr/lib/qt4/imports


QT_INSTALL_TRANSLATIONS:/home/build/tmp/work/x86_64-linux/
qt4-native/4.8.7-r0/recipe-sysroot-native/usr/share/qt4/translations


QT_INSTALL_CONFIGURATION:/home/build/tmp/work/x86_64-
linux/qt4-native/4.8.7-r0/recipe-sysroot-native/etc/qt4


QT_INSTALL_EXAMPLES:/home/build/tmp/work/x86_64-linux/
qt4-native/4.8.7-r0/recipe-sysroot-native/usr/bin/qt4/examples


QT_INSTALL_DEMOS:/home/build/tmp/work/x86_64-linux/qt4-
native/4.8.7-r0/recipe-sysroot-native/usr/bin/qt4/demos


QMAKE_MKSPECS:/home/build/tmp/work/x86_64-linux/qt4-native/
4.8.7-r0/recipe-sysroot-native/usr/share/qt4/mkspecs


QMAKE_VERSION:2.01a
QT_VERSION:4.8.7

QT_INSTALL_BINS:/home/build/tmp/work/x86_64-linux/qt4-
native/4.8.7-r0/recipe-sysroot-native/usr/bin is a directory that is none
existing.

BR
Mans Zigher


2018-02-21 13:13 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:

> When running devshell I can verify that echo $PATH includes the
> recipe-sysroot-native dir and if I run "whereis qmake2" the
> recipe-sysroot-native dir appears. So the question remains why is CMake n=
ot
> detecting the binaries?
>
> BR
> Mans Zigher
>
> 2018-02-21 13:02 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:
>
>> Hi,
>>
>> I am trying to build a native QT application that is required when
>> generating the image. The recipe is depending on qt4-native and i am usi=
ng
>> poky version rocko. The application is using CMake which is producing th=
e
>> following error
>>
>> | -- Looking for Q_WS_MAC - not found
>> | CMake Error at recipe-sysroot-native/usr/shar
>> e/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>>
>> |   Could NOT find Qt4 (missing: QT_MOC_EXECUTABLE QT_RCC_EXECUTABLE
>> |   QT_UIC_EXECUTABLE) (found version "4.8.7")
>> | Call Stack (most recent call first):
>> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindPackageHandleS=
tandardArgs.cmake:377
>> (_FPHSA_FAILURE_MESSAGE)
>> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindQt4.cmake:1326
>> (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>> |   CMakeLists.txt:5 (find_package)
>>
>> When using jethro the recipe works fine. If I search for qmake2 in the
>> build directory we get the following hits
>>
>> ./tmp/sysroots-components/x86_64/qt4-native/usr/bin/qmake2
>> ./tmp/work/x86_64-linux/my-qt-application/0.1-r0/recipe-sysr
>> oot-native/usr/bin/qmake2
>> ./tmp/work/x86_64-linux/qt4-native/4.8.7-r0/sysroot-destdir/
>> home/build/tmp/work/x86_64-linux/qt4-native/4.8.7-r0/recipe-
>> sysroot-native/usr/bin/qmake2
>>
>> I would think that CMake should find qmake2 in the recipe-sysroot-native
>> dir. Any help would be appreciated. How can I point CMake in the directi=
on
>> so it finds the qt tools.
>>
>> BR
>> M=C3=A5ns Zigher
>>
>>
>

