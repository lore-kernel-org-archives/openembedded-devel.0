Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEB678DD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:24:45 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id y139-v6so2124688wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=D98cAKmI/jH1xGnkB3e6vrTRrntzu+XdCCxivHMuY9Y=;
	b=frLOtJCWlqdCriLK4ljT0ojQGZM6Hlcaa+CG8kOjInr3Jf7jDiXfvHgD48qMZkSNHd
	KbBTJwYYyqnZA6jRaRwG0OJ6sggzK6vo/l5XJHWJjFlQDgxB81ts6Nd65vLWTtu7DegS
	wf+9KF/s/orrthgbBhW+acLuunwCyYo8yWSETDYkA0Ahr2CqImSJx8ZrEwpi7epoGxxf
	jRfzGIBCpxi7kIswOl9E8dsBL0tLwE2YB6s6+OTuYctcXCTIvRtxokD7IxjhemOWjWw7
	FdXjac5bUXEA8RDr+DbN3Dc+bga8P0YQcuES7dMCrD+NaWAXvYLzElxo0KST5nKB9597
	CS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=D98cAKmI/jH1xGnkB3e6vrTRrntzu+XdCCxivHMuY9Y=;
	b=O4yP3lTpjFqk/xgN/Li56Cfv3zSIrc0TGuJLaWepDCTQz8/bcaPf29g2IHdSKqr4ul
	7ZPrL2dEUUOL6VxW/wDg9xoIsW9b7lKBsvssI5iBv8KkxaR3X4orL/WQSVy8cKT1++CN
	AU5sgAN6lIxXcS5tQnwUzviLAcp0wHRzwY0asnnFu7UfR96fCEMUQ+OOf5OZ0OQwCoQi
	yAz+6Y/AYHZr9z2pCWuN3W+sy7GLsypsYCSbnU8BMz2dSLvhjsR1IEE29MPcmOveEma+
	HrgtYjdo7gh6uzrXJ4DQYAfaQEo44lgP3Zac7X3fyAGcvhghhXxKyvBUvfjtaq5k3lop
	1U4Q==
X-Gm-Message-State: APzg51DXb0dOPSBc8ooRuGCYRLOLPTpqBAifzQqui5wJ5sgHBfgxsZJ/
	Gf5e9F5wR5EMEhPuyUjCvIroGX7qgvNCGisMHic7vg==
X-Google-Smtp-Source: ANB0VdYuZpk9kuZKetnEhkP+uUnQ1WId0Qs8Icmnb1q0ZH3KFshrctxhjk/IJadPk/kQSSZ+dfsOJO1bcww8a+RwysI=
X-Received: by 2002:a1c:4887:: with SMTP id
	v129-v6mr1458713wma.129.1535466286099; 
	Tue, 28 Aug 2018 07:24:46 -0700 (PDT)
MIME-Version: 1.0
Sender: rehsack@gmail.com
Received: by 2002:a5d:6511:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 07:24:45
	-0700 (PDT)
In-Reply-To: <CA+chaQe3wMFtqMgK92XO+o-+uEpwA4ZjHT22saVg2pQoQUX0dA@mail.gmail.com>
References: <20180828132222.22199-1-sno@netbsd.org>
	<CA+chaQe3wMFtqMgK92XO+o-+uEpwA4ZjHT22saVg2pQoQUX0dA@mail.gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Date: Tue, 28 Aug 2018 16:24:45 +0200
X-Google-Sender-Auth: eqqICHQ49Rer1V1WEDclUo9dbow
Message-ID: <CAANR1XF-QL5MKAbocRnERFNeR0zZka5nLaL_e+TNPa1RXzywBw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] grpc: update from 1.8.5 -> 1.14.1
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
X-List-Received-Date: Tue, 28 Aug 2018 14:24:46 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-28 15:46 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Why do you think:
>
> FILES_${PN}-dev += "${libdir}/cmake/${PN}"
>
> is needed?

I just didn't know that - my first attempts to control these was a bit older ;)

> It should be included in ${PN}-dev already since:
> http://git.openembedded.org/openembedded-core/commit/meta/classes/cmake.bbclass?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93
> updated in:
> http://git.openembedded.org/openembedded-core/commit/?id=543e39ad5e2baa0f1ece013a89483783e6b15dd9
>
> And the /* in "${bindir}/*" also isn't necessary.

copy error from openjdk-8 recipe ;)

> On Tue, Aug 28, 2018 at 3:22 PM Jens Rehsack <sno@netbsd.org> wrote:
>>
>> Update gRPC to 1.14.1 and fix cause for issues like
>>
>> https://stackoverflow.com/questions/49975541/how-to-port-grpc-helloworldcpp-example-on-yocto
>>
>> For release notes check https://github.com/grpc/grpc/releases
>>
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>>  ...ix-grpc_cpp_plugin-path-during-cross.patch |  8 +--
>>  ...Fix-libraries-installation-for-Linux.patch | 61 ++++++++++---------
>>  ...-Find-c-ares-in-target-sysroot-alone.patch | 42 -------------
>>  .../grpc/{grpc_1.8.5.bb => grpc_1.14.1.bb}    | 15 +++--
>>  4 files changed, 47 insertions(+), 79 deletions(-)
>>  delete mode 100644
>> meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
>>  rename meta-networking/recipes-devtools/grpc/{grpc_1.8.5.bb =>
>> grpc_1.14.1.bb} (77%)
>>
>> diff --git
>> a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
>> b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
>> index 5774e62eb..a83d85407 100644
>> ---
>> a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
>> +++
>> b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
>> @@ -14,7 +14,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
>>  index f9cd630..9663934 100644
>>  --- a/CMakeLists.txt
>>  +++ b/CMakeLists.txt
>> -@@ -328,6 +328,13 @@ function(protobuf_generate_grpc_cpp)
>> +@@ -170,6 +170,13 @@ function(protobuf_generate_grpc_cpp)
>>       return()
>>     endif()
>>
>> @@ -25,7 +25,7 @@ index f9cd630..9663934 100644
>>  +      set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
>>  +  endif()
>>  +
>> -   set(_protobuf_include_path -I . -I ${PROTOBUF_WELLKNOWN_IMPORT_DIR})
>> +   set(_protobuf_include_path -I . -I
>> ${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR})
>>     foreach(FIL ${ARGN})
>>       get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
>>  @@ -345,7 +352,7 @@ function(protobuf_generate_grpc_cpp)
>> @@ -41,7 +41,7 @@ diff --git a/templates/CMakeLists.txt.template
>> b/templates/CMakeLists.txt.templa
>>  index 64daf04..a7e8629 100644
>>  --- a/templates/CMakeLists.txt.template
>>  +++ b/templates/CMakeLists.txt.template
>> -@@ -373,6 +373,13 @@
>> +@@ -209,6 +209,13 @@
>>         return()
>>       endif()
>>
>> @@ -52,7 +52,7 @@ index 64daf04..a7e8629 100644
>>  +        set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
>>  +    endif()
>>  +
>> -     set(_protobuf_include_path -I . -I
>> <%text>${PROTOBUF_WELLKNOWN_IMPORT_DIR}</%text>)
>> +     set(_protobuf_include_path -I . -I
>> <%text>${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR}</%text>)
>>       foreach(FIL <%text>${ARGN}</%text>)
>>         get_filename_component(ABS_FIL <%text>${FIL}</%text> ABSOLUTE)
>>  @@ -390,7 +397,7 @@
>> diff --git
>> a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>> b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>> index f8d965294..459dc45a4 100644
>> ---
>> a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>> +++
>> b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>> @@ -1,7 +1,7 @@
>> -From 8e9bf962a45a82f1c2eb5858e29fa89a3a60b564 Mon Sep 17 00:00:00 2001
>> +From 2279e30be5796e9b185545543ea54fe68633cbdd Mon Sep 17 00:00:00 2001
>>  From: Alexey Firago <alexey_firago@mentor.com>
>>  Date: Mon, 30 Oct 2017 23:24:49 +0300
>> -Subject: [PATCH 1/4] CMakeLists.txt: Fix libraries installation for Linux
>> +Subject: [PATCH] CMakeLists.txt: Fix libraries installation for Linux
>>
>>  * Set libs versions as in Makefile
>>
>> @@ -9,21 +9,19 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>  %% original patch:
>> 0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>>  ---
>> - CMakeLists.txt                        | 55
>> +++++++++++++++++++++++++++++++++++
>> - CMakeLists.txt => CMakeLists.txt.orig |  0
>> - 2 files changed, 55 insertions(+)
>> - copy CMakeLists.txt => CMakeLists.txt.orig (100%)
>> + CMakeLists.txt | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 59 insertions(+)
>>
>>  diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index b1a49df..13e64ac 100644
>> +index a59fd818e3..5066f44a32 100644
>>  --- a/CMakeLists.txt
>>  +++ b/CMakeLists.txt
>>  @@ -30,6 +30,15 @@ set(PACKAGE_TARNAME
>> "${PACKAGE_NAME}-${PACKAGE_VERSION}")
>>   set(PACKAGE_BUGREPORT "https://github.com/grpc/grpc/issues/")
>>   project(${PACKAGE_NAME} C CXX)
>>
>> -+set (CORE_VERSION_MAJOR "4")
>> -+set (CORE_VERSION "4.0.0")
>> ++set (CORE_VERSION_MAJOR "6")
>> ++set (CORE_VERSION "6.0.0")
>>  +
>>  +set (CPP_VERSION_MAJOR "1")
>>  +set (CPP_VERSION "${PACKAGE_VERSION}")
>> @@ -31,10 +29,21 @@ index b1a49df..13e64ac 100644
>>  +set (CSHARP_VERSION_MAJOR "1")
>>  +set (CSHARP_VERSION "${PACKAGE_VERSION}")
>>  +
>> - set(gRPC_INSTALL_BINDIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH
>> "Installation directory for executables")
>> - set(gRPC_INSTALL_LIBDIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH
>> "Installation directory for libraries")
>> - set(gRPC_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH
>> "Installation directory for headers")
>> -@@ -841,6 +850,10 @@ if(WIN32 AND MSVC)
>> + set(gRPC_INSTALL_BINDIR "bin" CACHE STRING "Installation directory for
>> executables")
>> + set(gRPC_INSTALL_LIBDIR "lib" CACHE STRING "Installation directory for
>> libraries")
>> + set(gRPC_INSTALL_INCLUDEDIR "include" CACHE STRING "Installation
>> directory for headers")
>> +@@ -702,6 +711,10 @@ if(WIN32 AND MSVC)
>> +   endif()
>> + endif()
>> +
>> ++if(_gRPC_PLATFORM_LINUX)
>> ++  set_property(TARGET address_sorting PROPERTY VERSION ${CORE_VERSION})
>> ++  set_property(TARGET address_sorting PROPERTY SOVERSION
>> ${CORE_VERSION_MAJOR})
>> ++endif()
>> +
>> + target_include_directories(address_sorting
>> +   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> +@@ -825,6 +838,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -45,7 +54,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(gpr
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -1221,6 +1234,10 @@ if(WIN32 AND MSVC)
>> +@@ -1259,6 +1276,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -56,7 +65,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -1535,6 +1552,10 @@ if(WIN32 AND MSVC)
>> +@@ -1633,6 +1654,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -67,7 +76,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc_cronet
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -2377,6 +2398,10 @@ if(WIN32 AND MSVC)
>> +@@ -2575,6 +2600,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -78,7 +87,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc_unsecure
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -2592,6 +2617,10 @@ if(WIN32 AND MSVC)
>> +@@ -2791,6 +2820,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -89,7 +98,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc++
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -3078,6 +3107,10 @@ if(WIN32 AND MSVC)
>> +@@ -3357,6 +3390,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -100,7 +109,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc++_cronet
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -3282,6 +3315,11 @@ protobuf_generate_grpc_cpp(
>> +@@ -3630,6 +3667,11 @@ protobuf_generate_grpc_cpp(
>>     src/proto/grpc/status/status.proto
>>   )
>>
>> @@ -112,7 +121,7 @@ index b1a49df..13e64ac 100644
>>   target_include_directories(grpc++_error_details
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>>     PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
>> -@@ -3408,6 +3446,11 @@ protobuf_generate_grpc_cpp(
>> +@@ -3762,6 +3804,11 @@ protobuf_generate_grpc_cpp(
>>     src/proto/grpc/reflection/v1alpha/reflection.proto
>>   )
>>
>> @@ -124,7 +133,7 @@ index b1a49df..13e64ac 100644
>>   target_include_directories(grpc++_reflection
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>>     PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
>> -@@ -3827,6 +3870,10 @@ if(WIN32 AND MSVC)
>> +@@ -4265,6 +4312,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -135,7 +144,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc++_unsecure
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -4140,6 +4187,10 @@ if(WIN32 AND MSVC)
>> +@@ -4649,6 +4700,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -146,7 +155,7 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc_plugin_support
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -4649,6 +4700,10 @@ if(WIN32 AND MSVC)
>> +@@ -5184,6 +5239,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -157,10 +166,6 @@ index b1a49df..13e64ac 100644
>>
>>   target_include_directories(grpc_csharp_ext
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}>
>> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt.orig
>> -similarity index 100%
>> -copy from CMakeLists.txt
>> -copy to CMakeLists.txt.orig
>>  --
>> -2.16.1
>> +2.17.1
>>
>> diff --git
>> a/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
>> b/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
>> deleted file mode 100644
>> index 8985022fa..000000000
>> ---
>> a/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -From a498b56ba96948015f0f2784b2ab8296946716ee Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Thu, 1 Feb 2018 23:28:17 -0800
>> -Subject: [PATCH 4/4] CMakeLists.txt: Find c-ares in target sysroot alone
>> -
>> -Current code lets it look into native sysroot as well
>> -which is then preferred during cross compile and it adds
>> -absolute path to libcares into linker flags
>> -on heterogenous architectures linker complains and build
>> -fails
>> -
>> -|
>> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/grpc/1.8.5-r0/recipe-sysroot-native/usr/lib/lib
>> -cares.so.2.2.0: file not recognized: File format not recognized
>> -| collect2: error: ld returned 1 exit status
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - CMakeLists.txt | 6 ++----
>> - 1 file changed, 2 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index 1d7eef1..058423d 100644
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -153,10 +153,8 @@ if("${gRPC_CARES_PROVIDER}" STREQUAL "module")
>> -     set(gRPC_INSTALL FALSE)
>> -   endif()
>> - elseif("${gRPC_CARES_PROVIDER}" STREQUAL "package")
>> --  find_package(c-ares REQUIRED CONFIG)
>> --  if(TARGET c-ares::cares)
>> --    set(_gRPC_CARES_LIBRARIES c-ares::cares)
>> --  endif()
>> -+  find_package(c-ares REQUIRED)
>> -+  set(_gRPC_CARES_LIBRARIES cares)
>> -   set(_gRPC_FIND_CARES "if(NOT c-ares_FOUND)\n  find_package(c-ares
>> CONFIG)\nendif()")
>> - endif()
>> -
>> ---
>> -2.16.1
>> -
>> diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
>> b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
>> similarity index 77%
>> rename from meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
>> rename to meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
>> index 3e44f99c1..24aa15745 100644
>> --- a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
>> +++ b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
>> @@ -10,11 +10,10 @@ DEPENDS = "gflags c-ares protobuf protobuf-native
>> protobuf-c protobuf-c-native o
>>  DEPENDS_append_class-target = " gtest grpc-native "
>>
>>  S = "${WORKDIR}/git"
>> -SRCREV = "db68cb3652cc7697647e9934b5316d98a6ba04d1"
>> -BRANCH = "v1.8.x"
>> +SRCREV = "d8020cb6daa87f1a3bb3b0c299bc081c4a3de1e8"
>> +BRANCH = "v1.14.x"
>>  SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH}
>> \
>>
>> file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
>> -
>> file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
>>             "
>>  SRC_URI_append_class-target = "
>> file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
>>
>> @@ -26,8 +25,14 @@ EXTRA_OECMAKE = " \
>>      -DgRPC_SSL_PROVIDER=package \
>>      -DgRPC_PROTOBUF_PROVIDER=package \
>>      -DgRPC_GFLAGS_PROVIDER=package \
>> -    -DgRPC_INSTALL=1 \
>> +    -DgRPC_INSTALL=ON \
>> +    -DCMAKE_CROSSCOMPILING=ON \
>>      -DBUILD_SHARED_LIBS=ON \
>>      "
>>
>> -BBCLASSEXTEND = "native"
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +SYSROOT_DIRS_BLACKLIST_append_class-target = "${libdir}/cmake/grpc"
>> +
>> +FILES_${PN}-dev += "${bindir}/*"
>> +FILES_${PN}-dev += "${libdir}/cmake/${PN}"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

