Return-Path: <mozcelikors@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 247086010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:45:15 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id j26-v6so940072qtl.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=Emg+3WWTfJQoLpv8fukTDZ6X9etplw8oYIc0cd38fIU=;
	b=oWt/gaFfgXLryubJ2tDPySgMAPPFKGjeOds8Qw9+ZUAeAp6QHik+fkmWUxSH/dwNR5
	TMWaZEIn1uJWOc5waiNQxIUZ1C0sK91dDdeDQDnMQBCwnwvu1wj7TJtUGPUyA4goFW2e
	9lNQ6dvMlLY9M5JirZPlBWHJ7+YcQRWg4FgfvjQdmoSVzH5pZO/H/sKWsVOgMAsnMOlW
	E38cgtiibisXmsi4SyWK3qG6JydJhUyxsVXPqw68FMW6eKnXoo8giGPni7um5EtA0bO1
	Z0hiEmUL+cwZd8y0ER0SWGRlYd8ri3P6/27azKpUyGouQvhws39AB5xv9bQZzl6PbrKs
	B3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=Emg+3WWTfJQoLpv8fukTDZ6X9etplw8oYIc0cd38fIU=;
	b=sBaQcEJdA22dVGKY+M8iF8/s+D3wIxRrc49PJHAoCWfWu6B4TRjvxVIvJb1Y7nJ2gJ
	xTDgjZ9U4ozbkPaIEk34kzLp3wuFWK+kTdGmX4kVgdezKtiZ8RL9i+LRPRwj3sosXXP0
	HrgL1MMpW2xDs5T0YqsCfZbGhY3kLIAyNYW0uctdwdjUjGtdPJCVt+VHSpfllQX3zPDA
	yRaJoFZKPCOerep9LFCkw5GImu1RYvhIu65WgsVZ3w4eP+6PslGcbq/j+CL4vD3GOwZc
	TtOpUzMDQJy3dy4cfXqGmooZE9qH/t4cTZswEAk53SBGYqvBBpUc3pNIq49BUlkMHBVV
	B4fA==
X-Gm-Message-State: ALQs6tBXLDVSdgo+eZvNDGuWy2DthI7co6oeDdL0LOSD8iVK2HBnnxtN
	nIIUPVSzCpJf7bZ3QiGV6mlZsUGokh7seKEUbPfuIg==
X-Google-Smtp-Source: AIpwx49xKJbXzxR/MdAeuZY9SFniL/ahDtPCq3ehUiEIF5oBMfZTNIhfPUqBZKuSEQ8XLbPwWpnE3GCnXDQ+s7tllKs=
X-Received: by 2002:ac8:f11:: with SMTP id
	e17-v6mr1222239qtk.261.1524041116316; 
	Wed, 18 Apr 2018 01:45:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.48.225 with HTTP; Wed, 18 Apr 2018 01:45:15 -0700 (PDT)
From: =?UTF-8?B?TXVzdGFmYSDDlnrDp2VsaWvDtnJz?= <mozcelikors@gmail.com>
Date: Wed, 18 Apr 2018 11:45:15 +0300
Message-ID: <CADCo0b8KGUsXHHSL_eJ5P9_3467qtO2dAAcxsfpByD33FinWgw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] [problem] Qt SDK Issue cstdlib:75:15: fatal error: stdlib.h: No such file or directory
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
X-List-Received-Date: Wed, 18 Apr 2018 08:45:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

This is my first post to this mailing list. I will be trying my hardest to
explain a problem that has caused me a lot of headache until now.

The Idea:
My idea is to have a Qt SDK along my image which I can source and use to
cross-compile Qt apps easily with CMake (rather than QMake) from host PC
Linux shell.

Branches:
I have tried this approach with all master, all rocko, and all morty
branches and all of them gave the same results.

Platform:
Raspberry Pi ZeroW (ARMv6)

Steps:
In order to generate Qt5 + CMake SDK,
meta-qt5 layer added and the following is added:
TOOLCHAIN_HOST_TASK_append =3D " nativesdk-cmake nativesdk-cmake-dev "

In order to produce SDK,
bitbake meta-toolchain-qt5

App Cross-Development Workflow:
1) Sourcing SDK
2) cmake & make on the application

CMakeLists.txt for the application is given as follows:

cmake_minimum_required(VERSION 3.0)
> project(rpiDisplay)
> set (CMAKE_C_FLAGS "-fPIC ${CMAKE_C_FLAGS}")
> set (CMAKE_CXX_FLAGS "-std=3Dc++11 -fPIC -Wno-write-strings
> -Wno-deprecated-declarations -Wno-unused-local-typedefs -O2 -pipe -g
> -feliminate-unused-debug-types  -fstack-protector-strong -pie -fpie
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -fvisibility-inlines-hid=
den
> ${CMAKE_CXX_FLAGS}")
>
>





*if(DEFINED ENV{SDKTARGETSYSROOT})    message(STATUS "SDK Detected")
set(SDK_EN 1)else(DEFINED ENV{SDKTARGETSYSROOT})    set(SDK_EN
0)endif(DEFINED ENV{SDKTARGETSYSROOT})*


*# Find includes in the build directories*
*set(CMAKE_INCLUDE_CURRENT_DIR ON)*

*# Turn on automatic invocation of the MOC*
*set(CMAKE_AUTOMOC ON)*

*find_package (Qt5Widgets REQUIRED)*
*find_package (Qt5Core REQUIRED)*

*# Find the QtWidgets library*
*find_package(Qt5Core REQUIRED)*
*find_package(Qt5Widgets REQUIRED)*

*# Generate code from ui files*
*qt5_wrap_ui(UI_HEADERS mainwindow.ui)*

*# Generate rules for building source files from the resources*
*qt5_add_resources(QRCS resources/resources.qrc)*

*# Tell CMake to create the helloworld executable*
*add_executable(rpiDisplay main.cpp mainwindow.cpp ${UI_HEADERS} ${QRCS})*

*# Add the Qt5 Widgets for linking*
*target_link_libraries(rpiDisplay Qt5::Widgets)*



*CMake is successfully able to run, finding cross-compiler, sysroot, and
Qt5 macros.*

*However, when "make" command is run I get the following error*

>
> *[ 50%] Building CXX object CMakeFiles/rpiDisplay.dir/main.cpp.o*
*In file included from
/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/i=
nclude/c++/7.3.0/bits/stl_algo.h:59:0,*
*                 from
/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/i=
nclude/c++/7.3.0/algorithm:62,*
*                 from
/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/i=
nclude/qt5/QtCore/qglobal.h:109,*
*                 from
/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/i=
nclude/qt5/QtGui/qtguiglobal.h:43,*
*                 from
/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/i=
nclude/qt5/QtWidgets/qtwidgetsglobal.h:43,*
*                 from
/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/i=
nclude/qt5/QtWidgets/qmainwindow.h:43,*
*                 from
/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/i=
nclude/qt5/QtWidgets/QMainWindow:1,*
*                 from
/home/mozcelikors/qtCreatorWorkspace/rpiDisplay_CMake/mainwindow.h:4,*
*                 from
/home/mozcelikors/qtCreatorWorkspace/rpiDisplay_CMake/main.cpp:1:*
*/opt/embeddev/0.1.0/sysroots/arm1176jzfshf-vfp-embeddev-linux-gnueabi/usr/=
include/c++/7.3.0/cstdlib:75:15:
fatal error: stdlib.h: No such file or directory*
* #include_next <stdlib.h>*
*               ^~~~~~~~~~*
*compilation terminated.*



*This issue is encountered in the web by several different people. For
example, https://github.com/voidlinux/void-packages/issues/5254
<https://github.com/voidlinux/void-packages/issues/5254> encounters the
same problem when installing qtcreator. The suggested patch is already
included in master and does prevent some of the qt packages from
complaining about this issue. But what I do want to understand is how can
this issue be addressed in a case which uses Qt CMake SDK to build other
applications. It doesn't seem to solve my issue.*


*To reproduce the issue, I've tried the following solutions which did not
help:*

*1) Globally remove -isystem from the QMAKE_CFLAGS_ISYSTEM =3D -isystem lin=
e
> in /usr/lib/qt5/mkspecs/common/gcc-base.conf*
>
*2) Removing the last path /usr/include from the file
/usr/lib/qt5/mkspecs/qconfig.pri line QMAKE_DEFAULT_INCDIRS =3D ... *


*Any guidance as to how to tackle this problem is greately appreciated.*

*Kind regards,*
*Mustafa =C3=96z=C3=A7elik=C3=B6rs*

