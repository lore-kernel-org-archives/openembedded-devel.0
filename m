Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE9B6022F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 17:26:26 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id x18so416279pln.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 09:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T+Oxi2nLms9gUWp86rY52WXEvaJ0q+yMNdY2loEczek=;
	b=KQw2r0vx1JZQ3snsVUNh9fmJ9m7CBnoRKDXfEbSBHppEAZ/9YyEof5ApSqBUBKFj83
	MrdSvzw8gt8gmU+CuxepjCsOvuTKmVkccHOVV9WHZy/HCxm3BpgtPyNb3Q6uRrz6qHmF
	1L/Nw2vRQwXHC4TLA+OXXSXAEbJ4tLrtC/aHcZCPRr7PozE/AfbEGwtG4KEUNDvadKDD
	/ZgXJILBNvCgBUud4M3I/mVPcYOVcl0lIvZM379GdtvfMJ5kNcDjatei2tGN/R/a94Vb
	0CFs0F7kQ+YnqbA2rt/a6pGKyYGMAbNBxKLN/Upjc57y0wAPBtqXpMyjVL45jW8FoCbl
	0zQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T+Oxi2nLms9gUWp86rY52WXEvaJ0q+yMNdY2loEczek=;
	b=Sb12cEHYCTgS9UCKwKbGZDLKeKZuy5h8lIntEJ7NvpzC3fk+9IAQjc3y4XKqcGdG58
	mB1U3sChGsJz9nY6ymKVavt2mD3L49gz68LIUx9clDD4Zw8XUmsX6ttMu1ACKExbfm8a
	2fblpdFyWcftZ9QsmmcEU3R0WzFlRWlWSxPQmp+uWhr4Ita1u+glXvdAljWV5hDYP7/8
	tuFRXXJ+kHo5uGyhDYtxnZWatTXVZggLWZoVmQFVZHAcN7hVaZYaCmFt9eDIVgqAbWbV
	BKRk2DmFE7JuY53gaO9tzlcrAtKwSAHl7WiJCsBHoJs1tCGb61xdMKjmvb3TL/ToLO39
	uHtg==
X-Gm-Message-State: APf1xPChDes8b+hgBYAb1lAHpjy3QMETbv0m7uMHVrji/r5pE7b+7fje
	ZvjOzW0W7PASu7EtjnNovt6+tyqHDISInxigS6PGZQ==
X-Google-Smtp-Source: AH8x225hr78NUNXEQVzo+lyBY9SADdRDKS4nCya4PZ7oaayQkqTwMFOBD9wUR9os45UXFXWZIf90k5mYiSOp2EhBISY=
X-Received: by 2002:a17:902:4827:: with SMTP id
	s36-v6mr14931875pld.337.1519061187312; 
	Mon, 19 Feb 2018 09:26:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.207.166 with HTTP; Mon, 19 Feb 2018 09:25:56 -0800 (PST)
In-Reply-To: <f5c98ff3-53a6-3044-fe92-b459845a721c@rudloff.pro>
References: <f5c98ff3-53a6-3044-fe92-b459845a721c@rudloff.pro>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Feb 2018 09:25:56 -0800
Message-ID: <CAMKF1spY7xim5Uyg=GET066qBJxmM4r+v3st0CS1JXg-LwGMNA@mail.gmail.com>
To: Pierre Rudloff <pierre@rudloff.pro>
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
X-List-Received-Date: Mon, 19 Feb 2018 17:26:26 -0000
Content-Type: text/plain; charset="UTF-8"

meta-qt5             = "5.10:0924e7a15d9ce36ef1869175cae3738071bd9edb"

It seems you are using local branch called 5.10, I would suggest to
use upstream rocko branch since thats what you are using for other
layers.

On Mon, Feb 19, 2018 at 2:51 AM, Pierre Rudloff <pierre@rudloff.pro> wrote:
> Hello,
>
> I'm trying to build AsteroidOS, an OpenEmbedded distribution that depends on
> meta-qt5 and "bitbake qtbase-native" complains that it can't find Perl.
>
> I do have Perl 5.24.1 installed (I'm using Debian 9.3) and I can see it in
> build/tmp-glibc/hosttools/perl.
>
> I reported the error to AsteroidOS
> (https://github.com/AsteroidOS/asteroid/issues/55) and QT
> (https://bugreports.qt.io/browse/QTBUG-66467) but they suggested I ask here.
>
> Here is the full log:
>>
>> Loading cache: 100%
>> |##########################################################################################################################################################|
>> Time: 0:00:00
>> Loaded 3046 entries from dependency cache.
>> Parsing recipes: 100%
>> |########################################################################################################################################################|
>> Time: 0:00:06
>> Parsing of 2240 .bb files complete (2225 cached, 15 parsed). 3060 targets,
>> 308 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           = "1.36.0"
>> BUILD_SYS            = "x86_64-linux"
>> NATIVELSBSTRING      = "debian-9"
>> TARGET_SYS           = "arm-oe-linux-gnueabi"
>> MACHINE              = "tetra"
>> DISTRO               = "asteroid"
>> DISTRO_VERSION       = "alpha-1.0"
>> TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
>> TARGET_FPU           = "hard"
>> meta-qt5             = "5.10:0924e7a15d9ce36ef1869175cae3738071bd9edb"
>> meta                 = "rocko:abc7fbab2c125b247f3274ca4b29e4f858b5ae12"
>> meta-asteroid        = "master:3c49fd588bf8743cc93e5e88edba1ffb02602b1d"
>> meta-oe              meta-multimedia      meta-gnome
>> meta-networking      = "rocko:a65c1acb1822966c3553de9fc98d8bb6be705c4e"
>> meta-android         = "rocko:4dc893c799951d8a9418860a6db9b3b7eed7bb49"
>> meta-python          meta-filesystems     =
>> "rocko:a65c1acb1822966c3553de9fc98d8bb6be705c4e"
>> meta-anthias-hybris  = "master:7e45263168efcb1696732b70204bd4fc6113c8d6"
>> meta-sparrow-hybris  = "master:55f5c9daf3e8e0797d9f49312e71e245f010fbe6"
>> meta-sprat-hybris    = "master:e64adbc6db63f7f1a90f0bdfaf8db123c3ac4a02"
>> meta-tetra-hybris    = "master:014b3436b930831dfaa5dd37510ebe7ac4944325"
>> meta-bass-hybris     = "master:248c7d5431ee2b540edbd5828ee125947f6b0de5"
>> meta-dory-hybris     = "master:cfa0f5c1c92dece99060c96da06f422c519a6d0b"
>> meta-lenok-hybris    = "master:462f80f0c45c8fdb4c37f943fbe8e3145324f8b8"
>> meta-swift-hybris    = "master:afd2e55dd62ef154e07afe66ee49418b51338314"
>> meta-wren-hybris     = "master:ef7d856fa95791bc03190ad2db704490c4ef96b1"
>>
>> Initialising tasks: 100%
>> |#####################################################################################################################################################|
>> Time: 0:00:00
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: qtbase-native-5.10.1+gitAUTOINC+6c6ace9d23-r0 do_configure:
>> Configuring qt failed. PACKAGECONFIG_CONFARGS was      -sysroot
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native
>> -no-gcc-sysroot     -system-zlib     -qt-pcre     -no-libjpeg     -no-libpng
>> -no-gif     -no-accessibility     -no-cups     -no-gui     -no-qml-debug
>> -no-sql-mysql     -no-sql-sqlite     -no-opengl     -no-openssl     -no-xcb
>> -no-icu     -verbose     -release     -prefix
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>> -hostprefix
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>> -bindir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
>> -hostbind
>
> ir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
> -libdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
> -hostlibdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
> -headerdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/include
> -archdatadir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
> -datadir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share
> -hostdatadir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/
> 5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib     -docdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share/doc
> -sysconfdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/etc
> -no-glib     -no-iconv     -silent     -nomake examples     -nomake tests
> -no-rpath     -no-feature-linkat     -platform linux-oe-g++
>>
>> ERROR: qtbase-native-5.10.1+gitAUTOINC+6c6ace9d23-r0 do_configure:
>> Function failed: do_configure (log file is located at
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/temp/log.do_configure.6022)
>> ERROR: Logfile of failure stored in:
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/temp/log.do_configure.6022
>> Log data follows:
>> DEBUG: Executing shell function qmake5_base_preconfigure
>> DEBUG: Shell function qmake5_base_preconfigure finished
>> DEBUG: Executing shell function do_configure
>> Performing shadow build...
>> Preparing build tree...
>> You need perl in your PATH to make a build from GIT.
>> Cannot proceed.
>> ERROR: Configuring qt failed. PACKAGECONFIG_CONFARGS was      -sysroot
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native
>> -no-gcc-sysroot     -system-zlib     -qt-pcre     -no-libjpeg     -no-libpng
>> -no-gif     -no-accessibility     -no-cups     -no-gui     -no-qml-debug
>> -no-sql-mysql     -no-sql-sqlite     -no-opengl     -no-openssl     -no-xcb
>> -no-icu     -verbose     -release     -prefix
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>> -hostprefix
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr
>> -bindir
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
>> -hostbindir /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-lin
>
> ux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/bin
> -libdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
> -hostlibdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
> -headerdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/include
> -archdatadir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/lib
> -datadir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share
> -hostdatadir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/li
> b     -docdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/usr/share/doc
> -sysconfdir
> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot-native/etc
> -no-glib     -no-iconv     -silent     -nomake examples     -nomake tests
> -no-rpath     -no-feature-linkat     -platform linux-oe-g++
>>
>> WARNING: exit code 1 from a shell command.
>> ERROR: Function failed: do_configure (log file is located at
>> /home/pierre/www/asteroid/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.10.1+gitAUTOINC+6c6ace9d23-r0/temp/log.do_configure.6022)
>> ERROR: Task
>> (/home/pierre/www/asteroid/src/meta-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_configure)
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 118 tasks of which 117 didn't need to be
>> rerun and 1 failed.
>> Summary: 1 task failed:
>>
>> /home/pierre/www/asteroid/src/meta-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_configure
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit
>> code.
>
>
> I also tried building a very minimalist i586-oe-linux distribution requiring
> only meta-qt5 and I get the same error.
> Do you know what could cause this?
>
> Regards,
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

