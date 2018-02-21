Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 40FD1607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:13:07 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id a7so1186758otk.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=TAhGY3XWXwjey19mfW9Pv5p7+7LBMq2zjEXy1RYAS4o=;
	b=oij0q4gNWRJLEsFpYfPakCdC2zg1OBhxaghv3uQ7U3Bb0noK+Uh7oVDAh41p/NgtmG
	FuH4C/THEwJ0WHqM1xPRW6j6VISlvxMifx099E3HeIkkEEtjDb8rMryz6wx0krGydZEE
	8LuFp8tkx7SnypIKdU7fRWGmUcJ9KWLkFJJi9AW4epW3U+RCi22G4UoTVRmwcAsdIJij
	7D48L3zhe7O3+fm6ln/YHwcR5WO3LvqOSUtQgyO/50rZMy62FgmarYzQx9AljNulvKKv
	rzMNwiqIE5WMU5Rr6ZgEmL/kavnGKvTBvsj3j9sGah8dbdZ6qP30sMZGJFbySzD8R1xV
	ZfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=TAhGY3XWXwjey19mfW9Pv5p7+7LBMq2zjEXy1RYAS4o=;
	b=h77togWkoCL/fHuwyd9opsfB6PmKlAOPuz0k3k4l+QgHkxPj+vxa82RKMxxIly2rSi
	5GPGG5YTVs/oVNrF5M6wIECfExzqOQuyX+X7sruSLBbWCUME3ZqS5N+iHUGO+qucPQHc
	Ssl3arRT/u1k1beKAjaH9Mwx4G1AM90hCjPbaCSAVEpeAQzG0W7ClwRxLD9BCOWNufu+
	/nxd9SyKW4uFFwsoD36Lzuw/ik0qWXTt08Lo7W7XjwQLU3u/b6odsXfuzOfD0LDkQ1RP
	iUhvKmGUVRb1Xz2SbLw5nuzazK31e/F/UrVBP82OBIwXu+fWcjzXFLkRmva6doC65LTO
	4QQA==
X-Gm-Message-State: APf1xPAvHaBjArcG5XR3ryAIciLKp4oRzu2wpiDdGWumThWByrQroYH0
	e9wdyn1wS4ayufp6oj0G+cVuYuQ1bQyhNG4JEHA=
X-Google-Smtp-Source: AG47ELtOQDAt1P0cgUeZrA/f4ZnAUqFLJ0FYG1wJsGcWrWMtm2+GX8F0CC2vJhud1am6rjs7jxBd/SXUWgQiWcIiAZU=
X-Received: by 10.157.37.47 with SMTP id k44mr2007768otb.27.1519215189108;
	Wed, 21 Feb 2018 04:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.110.68 with HTTP; Wed, 21 Feb 2018 04:13:08 -0800 (PST)
In-Reply-To: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
References: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Wed, 21 Feb 2018 13:13:08 +0100
Message-ID: <CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 12:13:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When running devshell I can verify that echo $PATH includes the
recipe-sysroot-native dir and if I run "whereis qmake2" the
recipe-sysroot-native dir appears. So the question remains why is CMake not
detecting the binaries?

BR
Mans Zigher

2018-02-21 13:02 GMT+01:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:

> Hi,
>
> I am trying to build a native QT application that is required when
> generating the image. The recipe is depending on qt4-native and i am usin=
g
> poky version rocko. The application is using CMake which is producing the
> following error
>
> | -- Looking for Q_WS_MAC - not found
> | CMake Error at recipe-sysroot-native/usr/shar
> e/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>
> |   Could NOT find Qt4 (missing: QT_MOC_EXECUTABLE QT_RCC_EXECUTABLE
> |   QT_UIC_EXECUTABLE) (found version "4.8.7")
> | Call Stack (most recent call first):
> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindPackageHandleSt=
andardArgs.cmake:377
> (_FPHSA_FAILURE_MESSAGE)
> |   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindQt4.cmake:1326
> (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
> |   CMakeLists.txt:5 (find_package)
>
> When using jethro the recipe works fine. If I search for qmake2 in the
> build directory we get the following hits
>
> ./tmp/sysroots-components/x86_64/qt4-native/usr/bin/qmake2
> ./tmp/work/x86_64-linux/my-qt-application/0.1-r0/recipe-sysr
> oot-native/usr/bin/qmake2
> ./tmp/work/x86_64-linux/qt4-native/4.8.7-r0/sysroot-destdir/
> home/build/tmp/work/x86_64-linux/qt4-native/4.8.7-r0/
> recipe-sysroot-native/usr/bin/qmake2
>
> I would think that CMake should find qmake2 in the recipe-sysroot-native
> dir. Any help would be appreciated. How can I point CMake in the directio=
n
> so it finds the qt tools.
>
> BR
> M=C3=A5ns Zigher
>
>

