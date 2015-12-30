Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8D37C6FFDC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 18:04:54 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id to18so170706371igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JFocCBW5C5r3/RRC3pJjIxMqz7NnzkTrk6247xjB+YE=;
	b=laApOlB3lKAWmoA54iN0z3ZeNmeJG9I0C+vzWl8NqL1ekGW0sqlHiyK5ENwf8tNM2I
	owxcwGYwRTi/kPgjYN7NV8jUulG9xEEGBT6HXHAFbRMTODkDeKFVLpowovca+WEgmnRY
	Ta7jtjo0i59CnW1OpzY2dHU7DSPcRbukDwNpL3zWzsQuvvmTuNBzPkkILudr0xZej2iG
	yfnCPbizoCZa/t/InB/yeh3u4z6dqBRCVZ07ZRK4KFA4p5rRCSJdA3NNGYpioqiv53I6
	RAo5AZfkrO+8Yk3meLzXzcYcAb1YTTlpTb82qCm0+yCBNAJWQBj6ttQ+1DCjOj86ZM6O
	S0qg==
X-Received: by 10.50.138.232 with SMTP id qt8mr57334136igb.75.1451498695452;
	Wed, 30 Dec 2015 10:04:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 30 Dec 2015 10:04:26 -0800 (PST)
In-Reply-To: <56837748.6020903@gmail.com>
References: <56837748.6020903@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Dec 2015 10:04:26 -0800
Message-ID: <CAMKF1spcVXiHxyPnTg=nYUOM_2yc2vU6x+VwG6unWH3wdNKeag@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
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
X-List-Received-Date: Wed, 30 Dec 2015 18:04:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 29, 2015 at 10:18 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> I noticed the recent gcc update from 5.2 to 5.3 in openembedded-core
> seems to cause meta-browser's chromium build to fail with more warnings
> being treated as errors. My MACHINE is intel-corei7-64, but I'm guessing
> this probably happens on other architectures too.
>
> Is anyone looking at this?
>
> Is there any talk about this upstream?
>

can you backport and report back

https://chromium.googlesource.com/v8/v8/+/e28183b5977a2d2732f7f8b9a2f26637c9566585%5E%21/#F0

>
>
> Build Configuration:
> BB_VERSION        = "1.28.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "openSUSE-project-13.2"
> TARGET_SYS        = "x86_64-fortress-linux"
> MACHINE           = "intel-corei7-64"
> DISTRO            = "fortress"
> DISTRO_VERSION    = "0.1"
> TUNE_FEATURES     = "m64 corei7"
> TARGET_FPU        = ""
> meta              = "master:1568f4fa1c8f8abd9b365ecd264841cd4f6b66b1"
> meta-yocto-bsp
> meta-yocto        = "master:9b392ef494f3fee9b85ee9e37ad700781e32e636"
> meta-intel        = "master:ac56397b913e9f2ccc7d6cf5a1a5a9002b619671"
> meta-oe
> meta-gnome
> meta-python
> meta-networking   =
> "contrib/twoerner/nodejs_v4:40b9f35fa3b4361ca53dbb91d2552f2eae6af460"
> meta-browser      = "master:bb799af123f1361767885d5b8f7e14b334d3fd7a"
>
>
>
> | FAILED: x86_64-fortress-linux-g++  -m64 -march=corei7 -mtune=corei7
> -mfpmath=sse -msse4.2
> --sysroot=/z/layerindex-master/minnowmax/tmp/sysroots/intel-corei7-64
> -MMD -MF obj/third_party/WebKit/Source/wtf/dtoa/wtf.bignum.o.d
> -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=64 -DDISABLE_NACL
> -DCHROMIUM_BUILD -DTOOLKIT_VIEWS=1 -DUI_COMPOSITOR_IMAGE_TRANSPORT
> -DUSE_AURA=1 -DUSE_ASH=1 -DUSE_PANGO=1 -DUSE_CAIRO=1
> -DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DUSE_X11=1
> -DUSE_CLIPBOARD_AURAX11=1 -DENABLE_ONE_CLICK_SIGNIN
> -DENABLE_PRE_SYNC_BACKUP -DUSE_XI2_MT=2 -DENABLE_REMOTING=1
> -DENABLE_WEBRTC=1 -DENABLE_PEPPER_CDMS -DENABLE_CONFIGURATION_POLICY
> -DENABLE_NOTIFICATIONS -DUSE_UDEV -DDONT_EMBED_BUILD_METADATA
> -DENABLE_TASK_MANAGER=1 -DENABLE_EXTENSIONS=1 -DENABLE_PLUGINS=1
> -DENABLE_SESSION_SERVICE=1 -DENABLE_THEMES=1 -DENABLE_AUTOFILL_DIALOG=1
> -DENABLE_BACKGROUND=1 -DENABLE_GOOGLE_NOW=1 -DCLD_VERSION=2
> -DCLD2_DATA_SOURCE=static -DENABLE_PRINTING=1 -DENABLE_BASIC_PRINTING=1
> -DENABLE_PRINT_PREVIEW=1 -DENABLE_SPELLCHECK=1
> -DENABLE_CAPTIVE_PORTAL_DETECTION=1 -DENABLE_APP_LIST=1
> -DENABLE_SETTINGS_APP=1 -DENABLE_MANAGED_USERS=1 -DENABLE_MDNS=1
> -DENABLE_SERVICE_DISCOVERY=1 -DENABLE_LOAD_COMPLETION_HACKS=1
> -DWTF_IMPLEMENTATION=1 -DENABLE_OPENTYPE_VERTICAL=1
> -DENABLE_LAYOUT_UNIT_IN_INLINE_BOXES=0
> -DWTF_USE_CONCATENATED_IMPULSE_RESPONSES=1
> -DENABLE_INPUT_MULTIPLE_FIELDS_UI=1 -DENABLE_WEB_AUDIO=1
> -DWTF_USE_WEBAUDIO_FFMPEG=1 -DWTF_USE_DEFAULT_RENDER_THEME=1
> -DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION
> -DUSE_LIBPCI=1 -DUSE_GLIB=1 -DUSE_NSS=1 -D__STDC_CONSTANT_MACROS
> -D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND
> -DDYNAMIC_ANNOTATIONS_ENABLED=0 -D_FORTIFY_SOURCE=2 -Igen
> -I../../third_party/WebKit/Source -I../../third_party/WebKit
> -I../../third_party/icu/source/i18n
> -I../../third_party/icu/source/common -fstack-protector
> --param=ssp-buffer-size=4 -Werror -pthread -fno-strict-aliasing -Wall
> -Wno-unused-parameter -Wno-missing-field-initializers
> -fvisibility=hidden -pipe -fPIC
> -B/z/layerindex-master/minnowmax/tmp/work/corei7-64-fortress-linux/chromium/40.0.2214.91-r0/chromium-40.0.2214.91/third_party/binutils/Linux_x64/Release/bin
> -Wno-unused-local-typedefs -m64 -march=x86-64 -O2 -fno-ident
> -fdata-sections -ffunction-sections -funwind-tables
> -Wno-error=unused-local-typedefs -O2 -pipe -g
> -feliminate-unused-debug-types -fvisibility-inlines-hidden
> -Wno-c++0x-compat -fno-exceptions -fno-rtti -fno-threadsafe-statics
> -fvisibility-inlines-hidden -Wsign-compare -Wno-c++0x-compat
> -std=gnu++11 -Wno-narrowing -Wno-literal-suffix  -c
> ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc -o
> obj/third_party/WebKit/Source/wtf/dtoa/wtf.bignum.o
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc: In member function
> 'void WTF::double_conversion::Bignum::Align(const
> WTF::double_conversion::Bignum&)':
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:715:31: error:
> assuming signed overflow does not occur when simplifying conditional to
> constant [-Werror=strict-overflow]
> |              for (int i = 0; i < zero_digits; ++i) {
> |                                ^
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:715:31: error:
> assuming signed overflow does not occur when simplifying conditional to
> constant [-Werror=strict-overflow]
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc: In member function
> 'void
> WTF::double_conversion::Bignum::AssignDecimalString(WTF::double_conversion::Vector<const
> char>)':
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error:
> assuming signed overflow does not occur when assuming that (X + c) < X
> is always false [-Werror=strict-overflow]
> |      void Bignum::AssignDecimalString(Vector<const char> value) {
> |           ^
> | cc1plus: all warnings being treated as errors
> | ninja: build stopped: subcommand failed.
>

