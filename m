Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id BCC157863A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:02:02 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id n74so965867ota.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 04:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=hdqeL9pc5LG9c8EwfLZaabDFzvgj+Q3hceGDMNdzBDU=;
	b=PVEdjZup/Y2Ync77W8nIFkY0bJKKcOqTQr4S9qEbkrh/wCb0mPFm9YB9XQn5vkReqk
	S9WYKY9ElUelH1GMvO5lHOpxBh5VbZJgEx4EzUNfey56dZ7srbVfPL4BVbav5s/3FscM
	QaprP8Ga5DymMmwsFJxLvZX2CEehi6E+JkFSIvIjIDa7b2QWDd8VpbUGChG7pMYJ6nUV
	2nYHiuI6kZX+JZasTz4JujeDKYmzfL751H/Ds2VlHKDVRsh2ukP6ufrsr8nbkUjS5o4F
	ZjYRImrxeG9CaOrpZhLBKzvV07dJzrAG0tJjze1x4kS0jh9obP++JA+QsdI0fCwl1RyG
	dLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=hdqeL9pc5LG9c8EwfLZaabDFzvgj+Q3hceGDMNdzBDU=;
	b=cH3V+mrL0NZ1LuS2Y8mEoyLmJz8IhylP2xHXAqBY33fy5Lw3oreld/lcAhqJEUcVsJ
	BR52WY9piz5c9yXgHSaK8Mano5SidwU3+b2WeAmWhtwcCE93H6coWWVeCLbe32P2tvsr
	CD9YnWVN9uuAg5i5o/xf8YSJGmSOXbFotiuG5+yCXTSg1x9yN06I5dvF2gErAXw8h/kf
	ADT2fuIH8zYM6xz1vqjMJxq45rz+RgxBvAZMIl3t7qmuhEA/x5u9Dclgoa+h324rD9sw
	md0O/Ip9AfYD4WqXcerWNPru8b85XTTwb3CnNWkuCxIxZbuE5nIA97HJcJvscpCOkJCE
	mcpw==
X-Gm-Message-State: APf1xPAXq8gONiAXuJYFRIoNMJtOfZUHy3dFVLMtMRjEMY97rVreL0Hm
	sdUUvZhBdBlGMup4ZLGPkonlV+Pxo3KYd2Ju4NF+5Q==
X-Google-Smtp-Source: AG47ELttB5xBKwsXZ6nTyy/vsNb68B7RiZksvRbzC9SCvUdpNHo1/m80MRHL+VTINt9NBPqyUEiD0RREzYNTV79LAYw=
X-Received: by 10.157.68.133 with SMTP id v5mr2253222ote.342.1519214523449;
	Wed, 21 Feb 2018 04:02:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.110.68 with HTTP; Wed, 21 Feb 2018 04:02:03 -0800 (PST)
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Wed, 21 Feb 2018 13:02:03 +0100
Message-ID: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt4] Cmake Could NOT find Qt4, missing: QT_MOC_EXECUTABLE
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
X-List-Received-Date: Wed, 21 Feb 2018 12:02:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to build a native QT application that is required when
generating the image. The recipe is depending on qt4-native and i am using
poky version rocko. The application is using CMake which is producing the
following error

| -- Looking for Q_WS_MAC - not found
| CMake Error at recipe-sysroot-native/usr/share/cmake-3.8/Modules/
FindPackageHandleStandardArgs.cmake:137 (message):
|   Could NOT find Qt4 (missing: QT_MOC_EXECUTABLE QT_RCC_EXECUTABLE
|   QT_UIC_EXECUTABLE) (found version "4.8.7")
| Call Stack (most recent call first):
|   recipe-sysroot-native/usr/share/cmake-3.8/Modules/
FindPackageHandleStandardArgs.cmake:377 (_FPHSA_FAILURE_MESSAGE)

|   recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindQt4.cmake:1326
(FIND_PACKAGE_HANDLE_STANDARD_ARGS)
|   CMakeLists.txt:5 (find_package)

When using jethro the recipe works fine. If I search for qmake2 in the
build directory we get the following hits

./tmp/sysroots-components/x86_64/qt4-native/usr/bin/qmake2
./tmp/work/x86_64-linux/my-qt-application/0.1-r0/recipe-
sysroot-native/usr/bin/qmake2
./tmp/work/x86_64-linux/qt4-native/4.8.7-r0/sysroot-
destdir/home/build/tmp/work/x86_64-linux/qt4-native/4.8.7-
r0/recipe-sysroot-native/usr/bin/qmake2

I would think that CMake should find qmake2 in the recipe-sysroot-native
dir. Any help would be appreciated. How can I point CMake in the direction
so it finds the qt tools.

BR
M=C3=A5ns Zigher

