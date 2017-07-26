Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2ED78213
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 19:49:45 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id l82so36091682ywc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 12:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KjyEFe5RPpdRY7egO8xLnKd2smXqgwMFOyxmj5Q1hIE=;
	b=ZzlteWI5JEExFziEqvQlVtUum1yZ7eaE4U260bxte33XuqnR4G1k5SB5oRIvVMbDno
	r7P6hLLi0er8hmMa/fK9VyywmGaMQyt9C33PZtSrn7Tgj3ND21rRICUdTjGckCchHeYj
	AvLrAo3zRZT44i5cI/526YuIxQ6GryJWMT9nwa2q+6cZqWM1+7ZZADXUCmbbUEBvpSPr
	Tyu7x2Ux+tU9+7aRg7b8OhqA99hI6/tYXZ3/CYrgJAxOIchf73fGMuRS+/xXBULY5F1C
	pCZS1acACApnN+ITQunDWTSJ7gFwVazvdurGt7Hx0S/wBkLNv5hzu/ctyHNgkW8wEljK
	X9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KjyEFe5RPpdRY7egO8xLnKd2smXqgwMFOyxmj5Q1hIE=;
	b=TOtLt4+xcpjtC2vnRb+jf/tRicV3hdxItTjrmyJXIO7deEbvPZ/4IJbNWMQYBmFKzY
	n+RH1L9VWaTmhpt+ntU6JxttcUlFvEQxAPjzBJN00Bmk4aiNcth+zGJoDHYglJ2cM2kA
	woQRPI7md9AWz709sF1mloMXFGcj+e0XxCH2vCfZEHAMwneTk7ot6ByRxh2XlqnLeJiZ
	Ju+zLtohAdyzkjcULU6I/fnXCNyJu2fVklXthlWRxlaycKoa7pbsrKSQ3FWCEvWKF7zl
	26SZiygGXA2otOOD1b0NGxSCZWth+5LQLAZPeYQI5LT4PvaRmRyRMo+6maOJOn35vBMf
	fiFg==
X-Gm-Message-State: AIVw112MMm0HdgL7iM76FvxcPGEq05WfqF63aTrzIg6GhpBOt/CSAVyB
	zbbTxA625ntskItCZz4PdhRVwfHY/w==
X-Received: by 10.13.194.1 with SMTP id e1mr1801230ywd.64.1501098587163; Wed,
	26 Jul 2017 12:49:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.73.196 with HTTP; Wed, 26 Jul 2017 12:49:46 -0700 (PDT)
In-Reply-To: <21d334b0-d490-f961-be24-7fe93bff099b@mentor.com>
References: <1500831823-32660-1-git-send-email-alexey_firago@mentor.com>
	<CA+chaQcHfgXB-Lx8-BmxDpbP6hdF=PnXMQy9NGO2dDpVFsRvKw@mail.gmail.com>
	<21d334b0-d490-f961-be24-7fe93bff099b@mentor.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Jul 2017 20:49:46 +0100
Message-ID: <CA+chaQddJLF3SmG2+ToNUhwPC77LZkGw1iTGyKskc=fgQap6-A@mail.gmail.com>
To: Alexey Firago <alexey_firago@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] c-ares: update 1.12.0 -> 1.13.0
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
X-List-Received-Date: Wed, 26 Jul 2017 19:49:46 -0000
Content-Type: text/plain; charset="UTF-8"

I didn't check what these new binaries actually do, but separate package
for them would be good.

On Wed, Jul 26, 2017 at 7:59 PM, Alexey Firago <alexey_firago@mentor.com>
wrote:

> Thanks for the review.
>
> I have fixed the issue with the missing libcares.pc, will be sent in V2.
>
> Do you have any suggestion to fix the issue with the debian.bblass? Maybe
> add one more package for example c-ares-tools ?
>
> Regards,
> Alexey Firago
>
>
> On 26.07.2017 12:34, Martin Jansa wrote:
>
>> There is few more changes at least worth mentioned in commit message (or
>> better fixed to provide upgrade path)
>>
>> There are few new binaries in ${PN} so debian.bbclass no longer renames
>> the package:
>> diff --git a/packages/*-gnueabi/c-ares/c-ares/latest
>> b/packages/*-gnueabi/c-ares/c-ares/latest
>> index 479e475..5301942 100644
>> --- a/packages/*-gnueabi/c-ares/c-ares/latest
>> +++ b/packages/*-gnueabi/c-ares/c-ares/latest
>> @@ -1,10 +1,10 @@
>> -PV = 1.12.0
>> +PV = 1.13.0+gitrAUTOINC+3be1924221
>>   PR = r0
>> +PKGV = 1.13.0+gitr0+3be1924221
>>   PKGR = r0.0
>> -PKG = libcares2
>> -RPROVIDES = c-ares (=1.12.0)
>> +RPROVIDES =
>>   RDEPENDS = glibc (>= 2.25.90) libgcc (>= 7.1.0)
>>   RRECOMMENDS =
>> -PKGSIZE = 43057
>> +PKGSIZE = 85465
>>   FILES = /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc
>> /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev /usr/lib/udev /lib/udev /usr
>> -FILELIST = /usr/lib/libcares.so.2 /usr/lib/libcares.so.2.2.0
>> +FILELIST = /usr/bin/acountry /usr/bin/adig /usr/bin/ahost
>> /usr/lib/libcares.so.2 /usr/lib/libcares.so.2.2.0
>>
>>
>> It no longer installs libcares.pc, so all other components which were
>> using pkg-config to find libcares are now failing
>>
>> diff --git a/packages/*-gnueabi/c-ares/c-ares-dev/latest
>> b/packages/*-gnueabi/c-ares/c-ares-dev/latest
>> index bebfa7c..c1d4015 100644
>> --- a/packages/*-gnueabi/c-ares/c-ares-dev/latest
>> +++ b/packages/*-gnueabi/c-ares/c-ares-dev/latest
>> @@ -1,10 +1,10 @@
>> -PV = 1.12.0
>> +PV = 1.13.0+gitrAUTOINC+3be1924221
>>   PR = r0
>> +PKGV = 1.13.0+gitr0+3be1924221
>>   PKGR = r0.0
>> -PKG = libcares-dev
>> -RPROVIDES = c-ares-dev (=1.12.0)
>> -RDEPENDS = c-ares (= 1.12.0-r0.0)
>> +RPROVIDES =
>> +RDEPENDS = c-ares (= 1.13.0+gitr0+3be1924221-r0.0)
>>   RRECOMMENDS = glibc-dev libgcc-dev
>> -PKGSIZE = 36789
>> -FILES = /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la
>> /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal
>> /lib/*.o
>> -FILELIST = /usr/include/ares.h /usr/include/ares_build.h
>> /usr/include/ares_dns.h /usr/include/ares_rules.h
>> /usr/include/ares_version.h /usr/lib/l
>> +PKGSIZE = 40640
>> +FILES = /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la
>> /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal
>> /lib/*.o
>> +FILELIST = /usr/include/ares.h /usr/include/ares_build.h
>> /usr/include/ares_dns.h /usr/include/ares_rules.h
>> /usr/include/ares_version.h /usr/lib/c
>>
>> the last lines are truncated, but here it's shown nicely:
>> diff --git a/packages/*-gnueabi/c-ares/c-ares-dev/files-in-package.txt
>> b/packages/*-gnueabi/c-ares/c-ares-dev/
>> index d95ff9a..7f47aa1 100644
>> --- a/packages/*-gnueabi/c-ares/c-ares-dev/files-in-package.txt
>> +++ b/packages/*-gnueabi/c-ares/c-ares-dev/files-in-package.txt
>> @@ -1,11 +1,14 @@
>>   drwxr-xr-x root       root             4096 ./usr
>>   drwxr-xr-x root       root             4096 ./usr/include
>> --rw-r--r-- root       root             3646 ./usr/include/ares_build.h
>> +-rw-r--r-- root       root              959 ./usr/include/ares_build.h
>>   -rw-r--r-- root       root             5306 ./usr/include/ares_dns.h
>> --rw-r--r-- root       root            22343 ./usr/include/ares.h
>> +-rw-r--r-- root       root            23253 ./usr/include/ares.h
>>   -rw-r--r-- root       root             4278 ./usr/include/ares_rules.h
>> --rw-r--r-- root       root              648 ./usr/include/ares_version.h
>> +-rw-r--r-- root       root              652 ./usr/include/ares_version.h
>>   drwxr-xr-x root       root             4096 ./usr/lib
>> -lrwxrwxrwx root       root               17 ./usr/lib/libcares.so ->
>> libcares.so.2.2.0
>> -drwxr-xr-x root       root             4096 ./usr/lib/pkgconfig
>> --rw-r--r-- root       root              551
>> ./usr/lib/pkgconfig/libcares.pc
>> +drwxr-xr-x root       root             4096 ./usr/lib/cmake
>> +drwxr-xr-x root       root             4096 ./usr/lib/cmake/c-ares
>> +-rw-r--r-- root       root             1606
>> ./usr/lib/cmake/c-ares/c-ares-config.cmake
>> +-rw-r--r-- root       root             3775
>> ./usr/lib/cmake/c-ares/c-ares-targets.cmake
>> +-rw-r--r-- root       root              798
>> ./usr/lib/cmake/c-ares/c-ares-targets-noconfig.cmake
>> +lrwxrwxrwx root       root               13 ./usr/lib/libcares.so ->
>> libcares.so.2
>>
>>
>> On Sun, Jul 23, 2017 at 7:43 PM, Alexey Firago <alexey_firago@mentor.com
>> <mailto:alexey_firago@mentor.com>> wrote:
>>
>>     Update to c-ares version 1.13.0 from June 20 2017
>>
>>     Recipe updates:
>>       * Change SRC_URI to github, because tarball at
>>     https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz
>>     <https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz>
>>         does not include all required files (cmake related).
>>       * Change build method to cmake. Library now supports cmake
>>         build system and installs *.cmake config files. These files can
>>         be used by several libraries/packages, such as gRPC, curl.
>>
>>     Highlights of library changes and bug fixes:
>>       * cmake build system support added
>>       * Add virtual function set for socket IO: ares_set_socket_functions
>>       * CVE-2017-1000381: c-ares NAPTR parser out of bounds access
>>
>>     Full changelog - https://c-ares.haxx.se/changelog.html
>>     <https://c-ares.haxx.se/changelog.html>
>>
>>     Signed-off-by: Alexey Firago <alexey_firago@mentor.com
>>     <mailto:alexey_firago@mentor.com>>
>>     ---
>>       ...configure.ac-don-t-override-passed-cflags.patch | 26
>>     ----------------------
>>       .../recipes-support/c-ares/c-ares_1.12.0.bb
>>     <http://c-ares_1.12.0.bb>        | 15 -------------
>>       .../recipes-support/c-ares/c-ares_1.13.0.bb
>>     <http://c-ares_1.13.0.bb>        | 16 +++++++++++++
>>       3 files changed, 16 insertions(+), 41 deletions(-)
>>       delete mode 100644
>>     meta-networking/recipes-support/c-ares/c-ares/0001-configure
>> .ac-don-t-override-passed-cflags.patch
>>       delete mode 100644
>>     meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
>>     <http://c-ares_1.12.0.bb>
>>       create mode 100644
>>     meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
>>     <http://c-ares_1.13.0.bb>
>>
>>     diff --git
>>     a/meta-networking/recipes-support/c-ares/c-ares/0001-configu
>> re.ac-don-t-override-passed-cflags.patch
>>     b/meta-networking/recipes-support/c-ares/c-ares/0001-configu
>> re.ac-don-t-override-passed-cflags.patch
>>     deleted file mode 100644
>>     index 10fad4e..0000000
>>     ---
>>     a/meta-networking/recipes-support/c-ares/c-ares/0001-configu
>> re.ac-don-t-override-passed-cflags.patch
>>     +++ /dev/null
>>     @@ -1,26 +0,0 @@
>>     -From 2a7236d2a7bb9c3d3c3f44ebf59404bf7134fcb3 Mon Sep 17 00:00:00
>> 2001
>>     -From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com
>>     <mailto:adraszik@tycoint.com>>
>>     -Date: Tue, 12 Apr 2016 11:37:28 +0100
>>     -Subject: [PATCH] configure.ac <http://configure.ac>: don't override
>>     passed cflags
>>     -
>>     -We are controlling debug and optimiser flags from OE
>>     ----
>>     - configure.ac <http://configure.ac> | 2 --
>>     - 1 file changed, 2 deletions(-)
>>     -
>>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>>     <http://configure.ac>
>>     -index 5c02450..3cf9fcd 100644
>>     ---- a/configure.ac <http://configure.ac>
>>     -+++ b/configure.ac <http://configure.ac>
>>     -@@ -147,8 +147,6 @@ dnl
>>     ************************************************************
>> **********
>>     -
>>     - CARES_CHECK_COMPILER
>>     - CARES_SET_COMPILER_BASIC_OPTS
>>     --CARES_SET_COMPILER_DEBUG_OPTS
>>     --CARES_SET_COMPILER_OPTIMIZE_OPTS
>>     - CARES_SET_COMPILER_WARNING_OPTS
>>     -
>>     - if test "$compiler_id" = "INTEL_UNIX_C"; then
>>     ---
>>     -2.8.0.rc3
>>     -
>>     diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
>>     <http://c-ares_1.12.0.bb>
>>     b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
>>     <http://c-ares_1.12.0.bb>
>>     deleted file mode 100644
>>     index 4e28d6a..0000000
>>     --- a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
>>     <http://c-ares_1.12.0.bb>
>>     +++ /dev/null
>>     @@ -1,15 +0,0 @@
>>     -# Copyright (c) 2012-2014 LG Electronics, Inc.
>>     -
>>     -SUMMARY = "c-ares is a C library that resolves names asynchronously."
>>     -HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/
>>     <http://daniel.haxx.se/projects/c-ares/>"
>>     -SECTION = "libs"
>>     -LICENSE = "MIT"
>>     -LIC_FILES_CHKSUM =
>>     "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
>>     -
>>     -SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz
>>     <http://c-ares.haxx.se/download/${BP}.tar.gz> \
>>     -               file://0001-configure.ac-don-t-override-passed-cflags.patch
>> \
>>     -"
>>     -SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
>>     -SRC_URI[sha256sum] =
>>     "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
>>     -
>>     -inherit autotools pkgconfig
>>     diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
>>     <http://c-ares_1.13.0.bb>
>>     b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
>>     <http://c-ares_1.13.0.bb>
>>     new file mode 100644
>>     index 0000000..46f0198
>>     --- /dev/null
>>     +++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
>>     <http://c-ares_1.13.0.bb>
>>     @@ -0,0 +1,16 @@
>>     +# Copyright (c) 2012-2014 LG Electronics, Inc.
>>     +SUMMARY = "c-ares is a C library that resolves names asynchronously."
>>     +HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/
>>     <http://daniel.haxx.se/projects/c-ares/>"
>>     +SECTION = "libs"
>>     +LICENSE = "MIT"
>>     +LIC_FILES_CHKSUM =
>>     "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
>>     +SRCREV = "3be1924221e1326df520f8498d704a5c4c8d0cce"
>>     +PV = "1.13.0+gitr${SRCPV}"
>>     +
>>     +SRC_URI = "git://github.com/c-ares/c-ares.git
>>     <http://github.com/c-ares/c-ares.git>"
>>     +
>>     +S = "${WORKDIR}/git"
>>     +
>>     +inherit cmake pkgconfig
>>     +
>>     +FILES_${PN}-dev += "${libdir}/cmake"
>>     --
>>     2.7.4
>>
>>     --
>>     _______________________________________________
>>     Openembedded-devel mailing list
>>     Openembedded-devel@lists.openembedded.org
>>     <mailto:Openembedded-devel@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>>
>>
>>

