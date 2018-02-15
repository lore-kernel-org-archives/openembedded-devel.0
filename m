Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B1176605FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 23:51:26 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w21so735937plp.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 15:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mQejJMNxVfHTKv03W5IvWedDHsv96pE/RaSUV7c/HEg=;
	b=Aw8JC+vFrGsTcVZP7b6tflVGAVL57gPZp9817N6dbayy2TFEEJyviGssRIZ2Pk5zv1
	NZ9YMKido8CyYTzsatkgRPQPr+i8x2XK5tcbXQl4F19pV9qbjH1uwbP0ELTF0vNRb3UI
	gG9LUbOa4Px/Tt6Ac4lDMYb8UQpbDlGB6Vg2nLpjFvLofRAUsSNIH9nyUqEXLnHgSCWk
	BAV+ecHUEuAutoRE9VA3DGoDOYW88og2LmsPjOfZZ9SR5qi/OGh5AUv4aYM5Zeug2xfc
	POe7r5W2J1AiqSDsDJ5o8UrKEp351s4tFvi+94mOZegFNiRcjPpvK54bAA0eFojGZnqz
	OyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mQejJMNxVfHTKv03W5IvWedDHsv96pE/RaSUV7c/HEg=;
	b=YUvsW/s21qL0m9SLniV5hBChM5yP1fDiErHTIJj74NdbRHXr4wAm5qaxQVpKrlElzo
	Q/u+SaJ8XnnN/j4wnyEWTgoYvPvh+z4sZzS+FK2aflzHgD5wOiw+QF7O/dK44gGPJ2IL
	z84560nroqHZtHlvWTeYF0KZDvA+FhLfPWTApmcsFjmtBOpEmh8JmEz3X4fdzjYhjnfw
	gTYTBE+qisU07EDVIbYMFNmRK1p0Bm7nMdA2GoB/JyhayxIw9+3R0vT3W02dfNu6971f
	suBcLmnU4laQsL9NeRyuCZrF8qNPBfPMZAwedciWiA+W8c5LSIKITy52DmS1wW384IPS
	1lxw==
X-Gm-Message-State: APf1xPBUjCZt2HycPQelkynoN/xWwFlq7WdKUbJl4xsPiiTraSlkAF9r
	J1xcPNu23dMTbh/yPMQmHXxC/9Na2EklHlmHSr9o6A==
X-Google-Smtp-Source: AH8x225R9D/XydZbB8M9lsqe4BTbVh4JEvGV/crEdo5kR/FWtWl9CyuK29w3ts7CezPW30Iw0vNf7iMmPzl+pj8xfn0=
X-Received: by 2002:a17:902:48c8:: with SMTP id
	u8-v6mr3967011plh.272.1518738687505; 
	Thu, 15 Feb 2018 15:51:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.207.166 with HTTP; Thu, 15 Feb 2018 15:50:56 -0800 (PST)
In-Reply-To: <20180215234152.GQ2786@denix.org>
References: <20180215043848.14310-1-raj.khem@gmail.com>
	<20180215234152.GQ2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Feb 2018 15:50:56 -0800
Message-ID: <CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Thu, 15 Feb 2018 23:51:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 15, 2018 at 3:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Feb 14, 2018 at 08:38:48PM -0800, Khem Raj wrote:
>> Fixes no-x11 builds (eglfs)
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
>>  ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch | 36 ++++++++++++++++++++++
>>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>>  3 files changed, 38 insertions(+)
>>  create mode 100644 recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
>>
>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
>> index ac3924e..ffde8ee 100644
>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>> @@ -34,6 +34,7 @@ SRC_URI += "\
>>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
>>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
>>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
>> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
>>  "
>>
>>  # common for qtbase-native and nativesdk-qtbase
>> diff --git a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
>> new file mode 100644
>> index 0000000..44e9009
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
>> @@ -0,0 +1,36 @@
>> +From 61c858474804fd772d612e6c5b4bb6df261d521a Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Wed, 14 Feb 2018 17:08:43 -0800
>> +Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
>> +
>> +-isystem fails to build when code uses include_next on certain files e.g.
>> +
>> +qtbase/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
>> + #include_next <stdlib.h>
>> +               ^~~~~~~~~~
>
> I'm building qt 5.10.0 in master with gcc 7.3.0 in a no-x11 environment with
> eglfs and not seeing this issue. What else is different?

DISTRO_FEATURES_remove = "x11"
DISTRO_FEATURES_remove = "wayland"
DISTRO_FEATURES_append = " directfb"

then in qtbase
PACKAGECONFIG_GL = "gles2"
PACKAGECONFIG_FONTS = "fontconfig"
PACKAGECONFIG_append = " libinput eglfs"
PACKAGECONFIG_remove = "tests"


>
>
>> +compilation terminated.
>> +make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + mkspecs/common/gcc-base.conf | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/mkspecs/common/gcc-base.conf b/mkspecs/common/gcc-base.conf
>> +index 234f71d495..ee3da023e6 100644
>> +--- a/mkspecs/common/gcc-base.conf
>> ++++ b/mkspecs/common/gcc-base.conf
>> +@@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
>> + QMAKE_CFLAGS_SHLIB         += $$QMAKE_CFLAGS_PIC
>> + QMAKE_CFLAGS_STATIC_LIB    += $$QMAKE_CFLAGS_PIC
>> + QMAKE_CFLAGS_APP           += $$QMAKE_CFLAGS_PIC
>> +-QMAKE_CFLAGS_ISYSTEM        = -isystem
>> ++QMAKE_CFLAGS_ISYSTEM        = -I
>> + QMAKE_CFLAGS_YACC          += -Wno-unused -Wno-parentheses
>> + QMAKE_CFLAGS_HIDESYMS      += -fvisibility=hidden
>> + QMAKE_CFLAGS_EXCEPTIONS_OFF += -fno-exceptions
>> +--
>> +2.16.1
>> +
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index 4f3ade2..cc9bce3 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -29,6 +29,7 @@ SRC_URI += "\
>>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
>>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
>>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
>> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
>>      file://run-ptest \
>>  "
>>
>> --
>> 2.16.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

