Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1BB6B9DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 12:14:18 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id c6so4416864lan.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 04:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version:content-type;
	bh=aO8j3jDsvuGQwVbsrrEZz97l2egPrPC0MwA49x08Xy4=;
	b=03XRYSaj4W6PehmocZOyEFY/MbOaVlGtq6JoVSUZWIGuS6grCB5zMSM+ZyeOUHHuOJ
	YYacsUrJ/xjD1HCaZIwJtoLrLRXjpRHTzYNkJypbUdYQnMWFgVqIxwnKgPXNhFjVoPOH
	IvfE/YZDcM6dLYskfYaec2xIJ62S3VjGm0hB9VO2NlaNQGZvE+8jvODBUcoJKCdfrx8d
	7LsSx2/BoOv013oXY1BzASYfKZ8qQslQjNG5Ptmnewe878L0E6D5sfAsK8dzZlAlohxT
	Df80Q6LmEPL/gsv+BEBx0MK8H4cNPyu67ATvPbpqG+rVB2EM83fgF/spwlZxsTMzxGmZ
	1gpQ==
X-Received: by 10.112.181.232 with SMTP id dz8mr4079382lbc.8.1390047258896;
	Sat, 18 Jan 2014 04:14:18 -0800 (PST)
Received: from [192.168.0.156] (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id g8sm7428555lae.1.2014.01.18.04.14.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 18 Jan 2014 04:14:18 -0800 (PST)
Date: Sat, 18 Jan 2014 13:13:48 +0100 (CET)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20140118113814.GR3742@jama>
Message-ID: <alpine.LFD.2.11.1401181305380.13045@localhost.localdomain>
References: <CAPbeDCnrC84D8tqjT-A29YLO_hn2K1wQ5a_cK85uMVfGEzbrhQ@mail.gmail.com>
	<20140113101147.GI16995@jama>
	<alpine.LFD.2.11.1401140055500.20049@localhost.localdomain>
	<CAPbeDCkCM3U=qXv-sUKDNxH1zGyC76m2_fsz_DZLouJovCCceA@mail.gmail.com>
	<20140118113814.GR3742@jama>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][jansa/qt5-5.2.0] libQt5*.la references OE build directories
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2014 12:14:20 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-19963888-1390047258=:13045"

--8323328-19963888-1390047258=:13045
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT


On Sat, 18 Jan 2014, Martin Jansa wrote:

> On Sat, Jan 18, 2014 at 11:03:09AM +0100, Jacob Kroon wrote:
>> Hi Andreas and Martin,
>>
>> On Tue, Jan 14, 2014 at 1:03 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>>>
>>> On Mon, 13 Jan 2014, Martin Jansa wrote:
>>>
>>>  On Mon, Jan 13, 2014 at 01:58:25AM +0100, Jacob Kroon wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> I'm seeing what I believe is a problem with the *.la files in the Qt5
>>>>> dev-packages.
>>>>> The files references paths in my OE build environment, like so:
>>>>>
>>>>> ...
>>>>> # Libraries that this one depends upon.
>>>>> dependency_libs='-lQt5Gui
>>>>> -L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/
>>>>> sysroots/wandboard-solo/usr/lib
>>>>> -lQt5Core -lpthread '
>>>>> ...
>>>>> # Directory that this library needs to be installed in:
>>>>> libdir='/home/jkroon/Projects/oe-devel/build/tmp-eglibc/
>>>>> sysroots/wandboard-solo/usr'
>>>>> ...
>>>>>
>>>>> I noticed this since my Qt5 autotools project wouldn't link properly when
>>>>> using the SDK, unless I first removed all libQt5*.la files.
>>>>>
>>>>> I'm not quite sure where to look for the problem so any pointers would be
>>>>> appreciated.
>>>>>
>>>>
>>>> Probably bad rebase on my side, please compare
>>>>
>>>> mkspecs/features/qt_module.prf in 5.1.1 and 5.2.0
>>>>
>>>> changed in:
>>>> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-
>>>> qt/qt5/qtbase-5.1.1/0008-qt_module-Fix-pkgconfig-replacement.patch
>>>> and
>>>> https://github.com/meta-qt5/meta-qt5/blob/jansa/qt5-5.2.0/
>>>> recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
>>>>
>>>> Or better in meta-qt5's qtbase repo:
>>>> https://github.com/meta-qt5/qtbase/blob/b5.1.1/mkspecs/
>>>> features/qt_module.prf
>>>> https://github.com/meta-qt5/qtbase/blob/b5.2.0/mkspecs/
>>>> features/qt_module.prf
>>>>
>>>>
>>> I tried building Qt 5.1.1 from master again, the .la-files do look better,
>>> "libdir" looks correct (taken from libQt5Svg.la):
>>>
>>> <snip>
>>>
>>> # Directory that this library needs to be installed in:
>>> libdir='/usr/lib'
>>> </snip>
>>>
>>> however
>>>
>>> <snip>
>>>
>>> dependency_libs='-lQt5Gui -L/home/jkroon/Projects/oe-
>>> devel/build/tmp-eglibc/sysroots/wandboard-solo/usr/lib -lQt5Core
>>> -lpthread '
>>> </snip>
>>>
>>> Dunno wether this is a problem or not, I never tried building the project
>>> with 5.1.1 using the SDK.
>>>
>>> Will hopefully have some time tomorrow to look at the links you sent.
>>>
>>> Thanks,
>>>
>>> Jacob
>>>
>>
>> I'm trying to get the .la-files for Qt5 dev-packages correct.
>>
>> What I've come up with so far is attached in the patch (to be applied in
>> top of "jansa-qt5-5.2.0", b8a236df79c25802c1f2eb2525e8a534e73e608e)
>>
>> With the patch applied I can still build both an image and an SDK, and also
>> the resulting SDK can be used to build my QT5 autotools projects. But I get
>> these warnings when building for instance "qtxmlpatterns":
>>
>> WARNING: QA Issue: qtxmlpatterns: The compile log indicates that host
>> include and/or library paths were used.
>
> This warning is the reason why I've originally created this patch, so
> something is definitely wrong in new version.

I got rid of this warning by adding the "-L/usr/lib" -> "" substitution 
for the .prl file aswell. But it's an ugly hack I guess..

> I know it's very confusing .prf (and last upstream changes didn't make
> it any easier), I'll try to look at it this weekend.
>
> It would be great to prepare some nice reproducer which we can use in
> upstream gerrit to show that this really doesn't work well in more
> complicated case (like our cross-compile with "sstate-relocateable"
> .prl,.la,.pc files, where we really don't want to include host paths).
>
> Do you have something like smaller test case or were you testing it on
> "big" qtbase build?
>

Unfortunately no, I did all testing on the big 
qtbase-native/qtbase/nativesdk-qtbase packages (pats my poor laptop 
harddrive). Do you have an idea of where to start for creating such a test 
case ? Something like a recipe that uses qtbase but only builds qmake + a 
minimal Qt module ?

>> With my patch applied,
>> recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch looks
>> like this:
>>
>> --- qtbase-opensource-src-5.2.0.orig/mkspecs/features/qt_module.prf
>> +++ qtbase-opensource-src-5.2.0/mkspecs/features/qt_module.prf
>> @@ -135,30 +135,36 @@ load(qt_installs)
>>      rplbase = $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
>>  else: \
>>      rplbase = $$MODULE_BASE_OUTDIR
>> -include_replace.match = $$rplbase/include
>> -include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
>> -include_replace.CONFIG = path
>> +pkgconfig_include_replace.match = $$rplbase/include
>> +pkgconfig_include_replace.replace = "\$$\\{includedir}"
>> +pkgconfig_include_replace.CONFIG = path
>> +pkgconfig_lib_replace.match = $$rplbase/lib
>> +pkgconfig_lib_replace.replace = "\$$\\{libdir}"
>> +pkgconfig_lib_replace.CONFIG = path
>>  lib_replace.match = $$rplbase/lib
>>  host_build: \
>>      lib_replace.replace = $$[QT_HOST_LIBS]
>>  else: \
>>      lib_replace.replace = $$[QT_INSTALL_LIBS/raw]
>>  lib_replace.CONFIG = path
>> -QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
>> +QMAKE_PRL_INSTALL_REPLACE += lib_replace
>>
>>  unix|win32-g++* {
>>     CONFIG += create_pc
>>     QMAKE_PKGCONFIG_LIBDIR = $$lib_replace.replace
>> -   QMAKE_PKGCONFIG_INCDIR = $$include_replace.replace
>> +   QMAKE_PKGCONFIG_INCDIR = $$[QT_INSTALL_HEADERS/raw]
>>     QMAKE_PKGCONFIG_CFLAGS = -I${includedir}/$$MODULE_INCNAME
>>     QMAKE_PKGCONFIG_DESTDIR = pkgconfig
>> -   QMAKE_PKGCONFIG_INSTALL_REPLACE += include_replace lib_replace
>> +   QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
>> pkgconfig_lib_replace
>>  }
>>
>>  unix {
>> +   lafile_replace.match = "-L$$[QT_INSTALL_LIBS/raw]"
>> +   lafile_replace.replace = ""
>> +   lafile_replace.CONFIG = path
>>     CONFIG += create_libtool explicitlib
>>     QMAKE_LIBTOOL_LIBDIR = $$lib_replace.replace
>> -   QMAKE_LIBTOOL_INSTALL_REPLACE += include_replace lib_replace
>> +   QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace lafile_replace
>>  }
>>
>> The lafile_replace does the substitution "-L/usr/lib" -> "". Maybe this is
>> needed for the .prl-files aswell ? Is the QMAKE_PRL_BUILD_DIR needed at all
>> ? With all the sed:ing going on, that path looks phony to me...
>>
>> From native "sysroots/x86_64-linux/usr/lib/libQt5Xml.prl":
>> QMAKE_PRL_BUILD_DIR =
>> /home/jkroon/Projects/oe-devel/build/tmp-eglibc/work/x86_64-linux/qtbase-native/5.2.0-r0/build/src/xml
>> QMAKE_PRL_LIBS =
>> -L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib
>> -lQt5Core -lpthread
>>
>> From native "sysroots/x86_64-linux/usr/lib/libQt5Xml.la":
>> dependency_libs=' -lQt5Core -lpthread '
>> libdir='/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib'
>>
>> From target "sysroots/wandboard-solo/usr/lib/libQt5Xml.prl":
>> QMAKE_PRL_BUILD_DIR =
>> /home/jkroon/Projects/oe-devel/build/tmp-eglibc/work/cortexa9hf-vfp-neon-mx6-oe-linux-gnueabi/qtbase/5.2.0-r0/build/src/xml
>> QMAKE_PRL_LIBS = -L/usr/lib -lQt5Core -lpthread
>>
>> From target "sysroots/wandboard-solo/usr/lib/libQt5Xml.la":
>> dependency_libs=' -lQt5Core -lpthread '
>> libdir='/usr/lib'
>>
>>   -- Jacob (very confused)
>
>> diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
>> index f85fb33..5503e1a 100644
>> --- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
>> +++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
>> @@ -46,57 +46,36 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>>   mkspecs/features/qt_module.prf | 43 ++++++++++++++++++++++++++++++------------
>>   1 file changed, 31 insertions(+), 12 deletions(-)
>>
>> -diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
>> -index 11509ee..2f95684 100644
>> ---- a/mkspecs/features/qt_module.prf
>> -+++ b/mkspecs/features/qt_module.prf
>> -@@ -135,30 +135,49 @@ load(qt_installs)
>> +Index: qtbase-opensource-src-5.2.0/mkspecs/features/qt_module.prf
>> +===================================================================
>> +--- qtbase-opensource-src-5.2.0.orig/mkspecs/features/qt_module.prf
>> ++++ qtbase-opensource-src-5.2.0/mkspecs/features/qt_module.prf
>> +@@ -135,30 +135,36 @@ load(qt_installs)
>>       rplbase = $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
>>   else: \
>>       rplbase = $$MODULE_BASE_OUTDIR
>>  -include_replace.match = $$rplbase/include
>>  -include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
>>  -include_replace.CONFIG = path
>> --lib_replace.match = $$rplbase/lib
>> --host_build: \
>> --    lib_replace.replace = $$[QT_HOST_LIBS]
>> --else: \
>>  +pkgconfig_include_replace.match = $$rplbase/include
>>  +pkgconfig_include_replace.replace = "\$$\\{includedir}"
>> ++pkgconfig_include_replace.CONFIG = path
>>  +pkgconfig_lib_replace.match = $$rplbase/lib
>>  +pkgconfig_lib_replace.replace = "\$$\\{libdir}"
>> -+!exists($$[QT_SYSROOT]) {
>> -+    include_replace.match = $$rplbase/include
>> -+    include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
>> -+    include_replace.CONFIG = path
>> -+    lib_replace.match = $$rplbase/lib
>> ++pkgconfig_lib_replace.CONFIG = path
>> + lib_replace.match = $$rplbase/lib
>> + host_build: \
>> +     lib_replace.replace = $$[QT_HOST_LIBS]
>> + else: \
>>       lib_replace.replace = $$[QT_INSTALL_LIBS/raw]
>> --lib_replace.CONFIG = path
>> -+    lib_replace.CONFIG = path
>> -+    lafile_replace.match = $$rplbase
>> -+    lafile_replace.replace = "$$[QT_INSTALL_PREFIX/raw]"
>> -+} else {
>> -+    # include_replace and lib_replace are duplicate, but we don't want to
>> -+    # make QMAKE_PKGCONFIG_INSTALL_REPLACE, QMAKE_PRL_INSTALL_REPLACE conditional
>> -+    include_replace.match = $$rplbase
>> -+    include_replace.replace = $$[QT_SYSROOT]$$[QT_INSTALL_PREFIX/raw]
>> -+    include_replace.CONFIG = path
>> -+    lib_replace.match = $$rplbase
>> -+    lib_replace.replace = $$[QT_SYSROOT]$$[QT_INSTALL_PREFIX/raw]
>> -+    lib_replace.CONFIG = path
>> -+    lafile_replace.match = $$rplbase
>> -+    lafile_replace.replace = "=$$[QT_INSTALL_PREFIX/raw]"
>> -+}
>> - QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
>> + lib_replace.CONFIG = path
>> +-QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
>> ++QMAKE_PRL_INSTALL_REPLACE += lib_replace
>>
>>   unix|win32-g++* {
>>      CONFIG += create_pc
>> --   QMAKE_PKGCONFIG_LIBDIR = $$lib_replace.replace
>> +    QMAKE_PKGCONFIG_LIBDIR = $$lib_replace.replace
>>  -   QMAKE_PKGCONFIG_INCDIR = $$include_replace.replace
>> -+   host_build: \
>> -+       QMAKE_PKGCONFIG_LIBDIR = $$[QT_HOST_LIBS]
>> -+   else: \
>> -+       QMAKE_PKGCONFIG_LIBDIR = $$[QT_INSTALL_LIBS/raw]
>>  +   QMAKE_PKGCONFIG_INCDIR = $$[QT_INSTALL_HEADERS/raw]
>>      QMAKE_PKGCONFIG_CFLAGS = -I${includedir}/$$MODULE_INCNAME
>>      QMAKE_PKGCONFIG_DESTDIR = pkgconfig
>> @@ -105,13 +84,13 @@ index 11509ee..2f95684 100644
>>   }
>>
>>   unix {
>> ++   lafile_replace.match = "-L$$[QT_INSTALL_LIBS/raw]"
>> ++   lafile_replace.replace = ""
>> ++   lafile_replace.CONFIG = path
>>      CONFIG += create_libtool explicitlib
>>      QMAKE_LIBTOOL_LIBDIR = $$lib_replace.replace
>>  -   QMAKE_LIBTOOL_INSTALL_REPLACE += include_replace lib_replace
>> -+   QMAKE_LIBTOOL_INSTALL_REPLACE += include_replace lib_replace lafile_replace
>> ++   QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace lafile_replace
>>   }
>>
>>   unix|win32-g++* {
>> ---
>> -1.8.5.2
>> -
>
>
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--8323328-19963888-1390047258=:13045--
