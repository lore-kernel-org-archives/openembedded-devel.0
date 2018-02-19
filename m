Return-Path: <pierre@rudloff.pro>
Received: from smtp-out.ouvaton.coop (smtp-out.ouvaton.coop [163.172.154.103])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDFE71B1D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 18:54:09 +0000 (UTC)
Received: from panel.vitry.ouvaton.coop (panel.vitry.ouvaton.coop
	[194.36.166.20])
	by smtp-out.ouvaton.coop (Postfix) with ESMTPS id 1523822049A;
	Mon, 19 Feb 2018 18:54:10 +0000 (UTC)
Received: from pierre.rudloff.pro (LFbn-1-6079-192.w90-110.abo.wanadoo.fr
	[90.110.4.192])
	by panel.vitry.ouvaton.coop (Postfix) with ESMTPSA id D8092A7258;
	Mon, 19 Feb 2018 19:54:09 +0100 (CET)
Authentication-Results: panel.vitry.ouvaton.coop;
	spf=pass (sender IP is 90.110.4.192) smtp.mailfrom=pierre@rudloff.pro
	smtp.helo=pierre.rudloff.pro
Received-SPF: pass (panel.vitry.ouvaton.coop: connection is authenticated)
To: Khem Raj <raj.khem@gmail.com>
References: <f5c98ff3-53a6-3044-fe92-b459845a721c@rudloff.pro>
	<CAMKF1spY7xim5Uyg=GET066qBJxmM4r+v3st0CS1JXg-LwGMNA@mail.gmail.com>
From: Pierre Rudloff <pierre@rudloff.pro>
Message-ID: <8883ef7f-61fc-cbd5-8ac1-dced080c10a9@rudloff.pro>
Date: Mon, 19 Feb 2018 19:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spY7xim5Uyg=GET066qBJxmM4r+v3st0CS1JXg-LwGMNA@mail.gmail.com>
X-PPP-Message-ID: <20180219185409.19402.50937@panel.vitry.ouvaton.coop>
X-PPP-Vhost: rudloff.pro
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qtbase-native configure script can't find Perl
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
X-List-Received-Date: Mon, 19 Feb 2018 18:54:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit

Thanks. I tried to use rocko:
> meta-qt5             = "rocko:db881bb4917628ad3eb1fa7c4f27915cf2ae60f4"
But I still get the same error.


Le 19/02/2018 à 18:25, Khem Raj a écrit :
> meta-qt5             = "5.10:0924e7a15d9ce36ef1869175cae3738071bd9edb"
> 
> It seems you are using local branch called 5.10, I would suggest to
> use upstream rocko branch since thats what you are using for other
> layers.
> 
> On Mon, Feb 19, 2018 at 2:51 AM, Pierre Rudloff <pierre@rudloff.pro> wrote:
>> Hello,
>>
>> I'm trying to build AsteroidOS, an OpenEmbedded distribution that depends on
>> meta-qt5 and "bitbake qtbase-native" complains that it can't find Perl.
>>
>> I do have Perl 5.24.1 installed (I'm using Debian 9.3) and I can see it in
>> build/tmp-glibc/hosttools/perl.
>>
>> I reported the error to AsteroidOS
>> (https://github.com/AsteroidOS/asteroid/issues/55) and QT
>> (https://bugreports.qt.io/browse/QTBUG-66467) but they suggested I ask here.
>>
>> Here is the full log:
>>>
>>> Loading cache: 100%
>>> |##########################################################################################################################################################|
>>> Time: 0:00:00
>>> Loaded 3046 entries from dependency cache.
>>> Parsing recipes: 100%
>>> |########################################################################################################################################################|
>>> Time: 0:00:06
>>> Parsing of 2240 .bb files complete (2225 cached, 15 parsed). 3060 targets,
>>> 308 skipped, 0 masked, 0 errors.
>>> NOTE: Resolving any missing task queue dependencies
>>>
>>> Build Configuration:
>>> BB_VERSION           = "1.36.0"
>>> BUILD_SYS            = "x86_64-linux"
>>> NATIVELSBSTRING      = "debian-9"
>>> TARGET_SYS           = "arm-oe-linux-gnueabi"
>>> MACHINE              = "tetra"
>>> DISTRO               = "asteroid"
>>> DISTRO_VERSION       = "alpha-1.0"
>>> TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
>>> TARGET_FPU           = "hard"
>>> meta-qt5             = "5.10:0924e7a15d9ce36ef1869175cae3738071bd9edb"
>>> meta                 = "rocko:abc7fbab2c125b247f3274ca4b29e4f858b5ae12"
>>> meta-asteroid        = "master:3c49fd588bf8743cc93e5e88edba1ffb02602b1d"
>>> meta-oe              meta-multimedia      meta-gnome
>>> meta-networking      = "rocko:a65c1acb1822966c3553de9fc98d8bb6be705c4e"
>>> meta-android         = "rocko:4dc893c799951d8a9418860a6db9b3b7eed7bb49"
>>> meta-python          meta-filesystems     =
>>> "rocko:a65c1acb1822966c3553de9fc98d8bb6be705c4e"
>>> meta-anthias-hybris  = "master:7e45263168efcb1696732b70204bd4fc6113c8d6"
>>> meta-sparrow-hybris  = "master:55f5c9daf3e8e0797d9f49312e71e245f010fbe6"
>>> meta-sprat-hybris    = "master:e64adbc6db63f7f1a90f0bdfaf8db123c3ac4a02"
>>> meta-tetra-hybris    = "master:014b3436b930831dfaa5dd37510ebe7ac4944325"
>>> meta-bass-hybris     = "master:248c7d5431ee2b540edbd5828ee125947f6b0de5"
>>> meta-dory-hybris     = "master:cfa0f5c1c92dece99060c96da06f422c519a6d0b"
>>> meta-lenok-hybris    = "master:462f80f0c45c8fdb4c37f943fbe8e3145324f8b8"
>>> meta-swift-hybris    = "master:afd2e55dd62ef154e07afe66ee49418b51338314"
>>> meta-wren-hybris     = "master:ef7d856fa95791bc03190ad2db704490c4ef96b1"
>>>
>>> Initialising tasks: 100%
>>> |#####################################################################################################################################################|
>>> Time: 0:00:00
>>> NOTE: Executing SetScene Tasks
>>> NOTE: Executing RunQueue Tasks
>>> ERROR: qtbase-native-5.10.1+gitAUTOINC+6c6ace9d23-r0 do_configure:
>>> Configuring qt failed. PACKAGECONFIG_CONFARGS was      -sysroot
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native
>>> -no-gcc-sysroot     -system-zlib     -qt-pcre     -no-libjpeg     -no-libpng
>>> -no-gif     -no-accessibility     -no-cups     -no-gui     -no-qml-debug
>>> -no-sql-mysql     -no-sql-sqlite     -no-opengl     -no-openssl     -no-xcb
>>> -no-icu     -verbose     -release     -prefix
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>>> -hostprefix
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>>> -bindir
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
>>> -hostbind
>>
>> ir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
>> -libdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
>> -hostlibdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
>> -headerdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/include
>> -archdatadir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
>> -datadir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share
>> -hostdatadir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/
>> 5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib     -docdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share/doc
>> -sysconfdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/etc
>> -no-glib     -no-iconv     -silent     -nomake examples     -nomake tests
>> -no-rpath     -no-feature-linkat     -platform linux-oe-g++
>>>
>>> ERROR: qtbase-native-5.10.1+gitAUTOINC+6c6ace9d23-r0 do_configure:
>>> Function failed: do_configure (log file is located at
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/temp/log.do_configure.6022)
>>> ERROR: Logfile of failure stored in:
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/temp/log.do_configure.6022
>>> Log data follows:
>>> DEBUG: Executing shell function qmake5_base_preconfigure
>>> DEBUG: Shell function qmake5_base_preconfigure finished
>>> DEBUG: Executing shell function do_configure
>>> Performing shadow build...
>>> Preparing build tree...
>>> You need perl in your PATH to make a build from GIT.
>>> Cannot proceed.
>>> ERROR: Configuring qt failed. PACKAGECONFIG_CONFARGS was      -sysroot
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native
>>> -no-gcc-sysroot     -system-zlib     -qt-pcre     -no-libjpeg     -no-libpng
>>> -no-gif     -no-accessibility     -no-cups     -no-gui     -no-qml-debug
>>> -no-sql-mysql     -no-sql-sqlite     -no-opengl     -no-openssl     -no-xcb
>>> -no-icu     -verbose     -release     -prefix
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>>> -hostprefix
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>>> -bindir
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
>>> -hostbindir /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-lin
>>
>> ux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
>> -libdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
>> -hostlibdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
>> -headerdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/include
>> -archdatadir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
>> -datadir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share
>> -hostdatadir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/li
>> b     -docdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share/doc
>> -sysconfdir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/etc
>> -no-glib     -no-iconv     -silent     -nomake examples     -nomake tests
>> -no-rpath     -no-feature-linkat     -platform linux-oe-g++
>>>
>>> WARNING: exit code 1 from a shell command.
>>> ERROR: Function failed: do_configure (log file is located at
>>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/temp/log.do_configure.6022)
>>> ERROR: Task
>>> (/home/pierre/www/asteroid/src/meta-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_configure)
>>> failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 118 tasks of which 117 didn't need to be
>>> rerun and 1 failed.
>>> Summary: 1 task failed:
>>>
>>> /home/pierre/www/asteroid/src/meta-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_configure
>>> Summary: There were 2 ERROR messages shown, returning a non-zero exit
>>> code.
>>
>>
>> I also tried building a very minimalist i586-oe-linux distribution requiring
>> only meta-qt5 and I get the same error.
>> Do you know what could cause this?
>>
>> Regards,
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

