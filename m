Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB4271957
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 07:23:14 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id o68so16748406qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 00:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=UKYNf5of8OUe7i1wvvDxefRm9lU3qzlUSNyF4Vm3HWM=;
	b=N2tEHs6ZJjhvSllImOrtekRAqGm3I6ZPXrtGqbEq8FjWPpvaXCpCJNVnUdCJH+KnvY
	A/2aJG9qcdBuirDes/xEU2Iq2yNY+V1afY3o7spKP5oko0bSzNdZqIBXM2enQKW5NvVz
	5IsDg7n033BDTJP3H+M3YGFs2JTJpNJRO6g255/KNQMWoedspiUJFGZpQ71Lj7vGGdwy
	N/lY7J8jMRCScXy4IweJmUn6DRQpif8IwPqMUP/O/Nh1N3abWNBhDR/LM4welJ1bDQnq
	roL/QwmLfbjXw71LbJeVi3lVEoQsqBlPselwleYI7lS40fwYZv1A7gQD50ODue6u2F37
	g6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=UKYNf5of8OUe7i1wvvDxefRm9lU3qzlUSNyF4Vm3HWM=;
	b=f7lm+frczI/IHTMe8qpi2RUANit7gZJyOXs7EtYExxpm4SM3s53xKzxiboRb9YAsq9
	EhwU2KFrp9KBndFglZoDOJfwqWdDWW7DJ0Txr/SSnDP4yNoz9rnVILmTNkjbXNq2dEwb
	s6VRKQZtv4kD2ndBAcvNDqNSjE24k/SRZ2rIs/k3YDPC8WW8rDOzvycKcXy9WygKYoTW
	BrY4JoGfwaPBGitKS4+Fj4JPYqnotc2aSjdkPbpDj8X5679Td2tNzXPTtnJ6IX0FmYu8
	FXZndODl29Pghm1K4EbqoOAcvhbWlIkGoDlrQpEGfOU82WJteFheEMt/I7cbiEFaWHjC
	SIXA==
X-Gm-Message-State: AA6/9RnU6MX3AshnpbAEj8DTfMb2I20p32emrgNPg7CTE2NLMzqjlr46un+KLgzz0U0HIkYXWXACLCoacVResw==
X-Received: by 10.194.235.34 with SMTP id uj2mr2809671wjc.144.1476170595568;
	Tue, 11 Oct 2016 00:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Tue, 11 Oct 2016 00:23:14 -0700 (PDT)
In-Reply-To: <16076428.LW6cBLIOWS@localhost.localdomain>
References: <16076428.LW6cBLIOWS@localhost.localdomain>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Oct 2016 09:23:14 +0200
Message-ID: <CA+chaQd4_k4HPKqOzn-DSL92EM=UCejFpx87==0ub+aR8AE39w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] Chromium Doesn't build for 32bit targets.
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
X-List-Received-Date: Tue, 11 Oct 2016 07:23:16 -0000
Content-Type: text/plain; charset=UTF-8

I was reporting the same issue on
http://www.openembedded.org/wiki/Bitbake_World_Status and related e-mails
since 2016-08-20

You might want to help Trevor to reproduce it on his build (I'm sorry I
didn't get to it yet)
http://lists.openembedded.org/pipermail/openembedded-devel/2016-August/108907.html
http://lists.openembedded.org/pipermail/openembedded-devel/2016-August/108911.html

On Mon, Oct 10, 2016 at 8:31 PM, Davis, Michael <michael.davis@essvote.com>
wrote:

> I had sent an email about this a few months back for Krogoth, but I just
> updated to master in prep for 2.2 and it is still the case.
> Chromium 52 will not build for a 32bit target on a 64bit build OS.  It
> will build the 64bit version, but it uses the build OS's tool chain which
> seems incorrect.
>
> As you can see from the log it pulls straight g++ and includes from my
> Centos 7 build box.
>
> log.do_comple below:
>
> DEBUG: Executing shell function do_compile
> ninja: Entering directory `/build/test/tmp/work/core2-
> 32-poky-linux/chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release'
> [1/17943] AR obj/chrome/libsafe_browsing_proto.a
> [2/17943] CXX obj/third_party/icu/source/common/icuuc.uresource.o
> [3/17943] STAMP obj/chrome/make_file_types_protobuf.actions_depends.stamp
> [4/17943] CXX obj.host/third_party/icu/source/common/icuuc.ruleiter.o
> FAILED: obj.host/third_party/icu/source/common/icuuc.ruleiter.o
> g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.ruleiter.o.d
> -DU_USING_ICU_NAMESPACE=0 -DHAVE_DLOPEN=0 -DUCONFIG_ONLY_HTML_CONVERSION=1
> -DU_CHARSET_IS_UTF8=1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=64
> -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=1 -DUSE_PANGO=1 -DUSE_CAIRO=1
> -DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DUSE_X11=1
> -DUSE_CLIPBOARD_AURAX11=1 -DENABLE_WEBRTC=1 -DENABLE_MEDIA_ROUTER=1
> -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=1
> -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=1
> -DENABLE_EXTENSIONS=1 -DENABLE_PDF=1 -DENABLE_PLUGINS=1
> -DENABLE_SESSION_SERVICE=1 -DENABLE_THEMES=1 -DENABLE_PRINTING=1
> -DENABLE_BASIC_PRINTING=1 -DENABLE_PRINT_PREVIEW=1 -DENABLE_SPELLCHECK=1
> -DENABLE_CAPTIVE_PORTAL_DETECTION=1 -DENABLE_SUPERVISED_USERS=1
> -DENABLE_MDNS=1 -DENABLE_SERVICE_DISCOVERY=1 -DFULL_SAFE_BROWSING
> -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMO
>  N_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=0
> -DU_NOEXCEPT= -DUSE_LIBPCI=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DNDEBUG
> -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -I../../third_party/icu/source/common
> -I../../third_party/icu/source/i18n -Igen -fstack-protector
> --param=ssp-buffer-size=4  -pthread -fno-strict-aliasing -Wno-extra
> -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=hidden
> -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-deprecated
> -std=gnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/ruleiter.cpp
> -o obj.host/third_party/icu/source/common/icuuc.ruleiter.o
> In file included from /usr/include/features.h:399:0,
>                  from /usr/include/stdint.h:25,
>                  from /usr/lib/gcc/x86_64-redhat-
> linux/4.8.5/include/stdint.h:9,
>                  from ../../third_party/icu/source/
> common/unicode/ptypes.h:66,
>                  from ../../third_party/icu/source/
> common/unicode/umachine.h:44,
>                  from ../../third_party/icu/source/
> common/unicode/utypes.h:36,
>                  from ../../third_party/icu/source/
> common/unicode/uobject.h:20,
>                  from ../../third_party/icu/source/common/ruleiter.h:14,
>                  from ../../third_party/icu/source/common/ruleiter.cpp:11:
> /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> or directory
>  # include <gnu/stubs-32.h>
>                            ^
> compilation terminated.
> [5/17943] AR obj/third_party/libvpx/libvpx.a
> [6/17943] CXX obj.host/third_party/icu/source/common/icuuc.schriter.o
> FAILED: obj.host/third_party/icu/source/common/icuuc.schriter.o
> g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.schriter.o.d
> -DU_USING_ICU_NAMESPACE=0 -DHAVE_DLOPEN=0 -DUCONFIG_ONLY_HTML_CONVERSION=1
> -DU_CHARSET_IS_UTF8=1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=64
> -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=1 -DUSE_PANGO=1 -DUSE_CAIRO=1
> -DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DUSE_X11=1
> -DUSE_CLIPBOARD_AURAX11=1 -DENABLE_WEBRTC=1 -DENABLE_MEDIA_ROUTER=1
> -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=1
> -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=1
> -DENABLE_EXTENSIONS=1 -DENABLE_PDF=1 -DENABLE_PLUGINS=1
> -DENABLE_SESSION_SERVICE=1 -DENABLE_THEMES=1 -DENABLE_PRINTING=1
> -DENABLE_BASIC_PRINTING=1 -DENABLE_PRINT_PREVIEW=1 -DENABLE_SPELLCHECK=1
> -DENABLE_CAPTIVE_PORTAL_DETECTION=1 -DENABLE_SUPERVISED_USERS=1
> -DENABLE_MDNS=1 -DENABLE_SERVICE_DISCOVERY=1 -DFULL_SAFE_BROWSING
> -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMO
>  N_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=0
> -DU_NOEXCEPT= -DUSE_LIBPCI=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DNDEBUG
> -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -I../../third_party/icu/source/common
> -I../../third_party/icu/source/i18n -Igen -fstack-protector
> --param=ssp-buffer-size=4  -pthread -fno-strict-aliasing -Wno-extra
> -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=hidden
> -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-deprecated
> -std=gnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/schriter.cpp
> -o obj.host/third_party/icu/source/common/icuuc.schriter.o
> In file included from /usr/include/features.h:399:0,
>                  from /usr/include/c++/4.8.2/x86_64-
> redhat-linux/32/bits/os_defines.h:39,
>                  from /usr/include/c++/4.8.2/x86_64-
> redhat-linux/32/bits/c++config.h:426,
>                  from /usr/include/c++/4.8.2/exception:37,
>                  from /usr/include/c++/4.8.2/typeinfo:34,
>                  from ../../third_party/icu/source/common/utypeinfo.h:28,
>                  from ../../third_party/icu/source/common/schriter.cpp:16:
> /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> or directory
>  # include <gnu/stubs-32.h>
>                            ^
> compilation terminated.
> [7/17943] CXX obj.host/third_party/icu/source/common/icuuc.servlk.o
> FAILED: obj.host/third_party/icu/source/common/icuuc.servlk.o
> g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servlk.o.d
> -DU_USING_ICU_NAMESPACE=0 -DHAVE_DLOPEN=0 -DUCONFIG_ONLY_HTML_CONVERSION=1
> -DU_CHARSET_IS_UTF8=1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=64
> -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=1 -DUSE_PANGO=1 -DUSE_CAIRO=1
> -DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DUSE_X11=1
> -DUSE_CLIPBOARD_AURAX11=1 -DENABLE_WEBRTC=1 -DENABLE_MEDIA_ROUTER=1
> -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=1
> -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=1
> -DENABLE_EXTENSIONS=1 -DENABLE_PDF=1 -DENABLE_PLUGINS=1
> -DENABLE_SESSION_SERVICE=1 -DENABLE_THEMES=1 -DENABLE_PRINTING=1
> -DENABLE_BASIC_PRINTING=1 -DENABLE_PRINT_PREVIEW=1 -DENABLE_SPELLCHECK=1
> -DENABLE_CAPTIVE_PORTAL_DETECTION=1 -DENABLE_SUPERVISED_USERS=1
> -DENABLE_MDNS=1 -DENABLE_SERVICE_DISCOVERY=1 -DFULL_SAFE_BROWSING
> -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMON_
>  IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=0
> -DU_NOEXCEPT= -DUSE_LIBPCI=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DNDEBUG
> -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -I../../third_party/icu/source/common
> -I../../third_party/icu/source/i18n -Igen -fstack-protector
> --param=ssp-buffer-size=4  -pthread -fno-strict-aliasing -Wno-extra
> -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=hidden
> -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-deprecated
> -std=gnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/servlk.cpp
> -o obj.host/third_party/icu/source/common/icuuc.servlk.o
> In file included from /usr/include/features.h:399:0,
>                  from /usr/include/stdint.h:25,
>                  from /usr/lib/gcc/x86_64-redhat-
> linux/4.8.5/include/stdint.h:9,
>                  from ../../third_party/icu/source/
> common/unicode/ptypes.h:66,
>                  from ../../third_party/icu/source/
> common/unicode/umachine.h:44,
>                  from ../../third_party/icu/source/
> common/unicode/utypes.h:36,
>                  from ../../third_party/icu/source/common/servlk.cpp:9:
> /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> or directory
>  # include <gnu/stubs-32.h>
>                            ^
> compilation terminated.
> [8/17943] CXX obj.host/third_party/icu/source/common/icuuc.servrbf.o
> FAILED: obj.host/third_party/icu/source/common/icuuc.servrbf.o
> g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servrbf.o.d
> -DU_USING_ICU_NAMESPACE=0 -DHAVE_DLOPEN=0 -DUCONFIG_ONLY_HTML_CONVERSION=1
> -DU_CHARSET_IS_UTF8=1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=64
> -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=1 -DUSE_PANGO=1 -DUSE_CAIRO=1
> -DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DUSE_X11=1
> -DUSE_CLIPBOARD_AURAX11=1 -DENABLE_WEBRTC=1 -DENABLE_MEDIA_ROUTER=1
> -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=1
> -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=1
> -DENABLE_EXTENSIONS=1 -DENABLE_PDF=1 -DENABLE_PLUGINS=1
> -DENABLE_SESSION_SERVICE=1 -DENABLE_THEMES=1 -DENABLE_PRINTING=1
> -DENABLE_BASIC_PRINTING=1 -DENABLE_PRINT_PREVIEW=1 -DENABLE_SPELLCHECK=1
> -DENABLE_CAPTIVE_PORTAL_DETECTION=1 -DENABLE_SUPERVISED_USERS=1
> -DENABLE_MDNS=1 -DENABLE_SERVICE_DISCOVERY=1 -DFULL_SAFE_BROWSING
> -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMON
>  _IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=0
> -DU_NOEXCEPT= -DUSE_LIBPCI=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DNDEBUG
> -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -I../../third_party/icu/source/common
> -I../../third_party/icu/source/i18n -Igen -fstack-protector
> --param=ssp-buffer-size=4  -pthread -fno-strict-aliasing -Wno-extra
> -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=hidden
> -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-deprecated
> -std=gnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/servrbf.cpp
> -o obj.host/third_party/icu/source/common/icuuc.servrbf.o
> In file included from /usr/include/features.h:399:0,
>                  from /usr/include/stdint.h:25,
>                  from /usr/lib/gcc/x86_64-redhat-
> linux/4.8.5/include/stdint.h:9,
>                  from ../../third_party/icu/source/
> common/unicode/ptypes.h:66,
>                  from ../../third_party/icu/source/
> common/unicode/umachine.h:44,
>                  from ../../third_party/icu/source/
> common/unicode/utypes.h:36,
>                  from ../../third_party/icu/source/common/servrbf.cpp:9:
> /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> or directory
>  # include <gnu/stubs-32.h>
>                            ^
> compilation terminated.
> [9/17943] CXX obj.host/third_party/icu/source/common/icuuc.resource.o
> FAILED: obj.host/third_party/icu/source/common/icuuc.resource.o
> g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.resource.o.d
> -DU_USING_ICU_NAMESPACE=0 -DHAVE_DLOPEN=0 -DUCONFIG_ONLY_HTML_CONVERSION=1
> -DU_CHARSET_IS_UTF8=1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=64
> -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD
> -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=1 -DUSE_PANGO=1 -DUSE_CAIRO=1
> -DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DUSE_X11=1
> -DUSE_CLIPBOARD_AURAX11=1 -DENABLE_WEBRTC=1 -DENABLE_MEDIA_ROUTER=1
> -DENABLE_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=1
> -DUSE_UDEV -DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=1
> -DENABLE_EXTENSIONS=1 -DENABLE_PDF=1 -DENABLE_PLUGINS=1
> -DENABLE_SESSION_SERVICE=1 -DENABLE_THEMES=1 -DENABLE_PRINTING=1
> -DENABLE_BASIC_PRINTING=1 -DENABLE_PRINT_PREVIEW=1 -DENABLE_SPELLCHECK=1
> -DENABLE_CAPTIVE_PORTAL_DETECTION=1 -DENABLE_SUPERVISED_USERS=1
> -DENABLE_MDNS=1 -DENABLE_SERVICE_DISCOVERY=1 -DFULL_SAFE_BROWSING
> -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMO
>  N_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=0
> -DU_NOEXCEPT= -DUSE_LIBPCI=1 -DUSE_GLIB=1 -DUSE_NSS_CERTS=1 -DNDEBUG
> -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -I../../third_party/icu/source/common
> -I../../third_party/icu/source/i18n -Igen -fstack-protector
> --param=ssp-buffer-size=4  -pthread -fno-strict-aliasing -Wno-extra
> -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=hidden
> -pipe -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations
> -Wno-unused-function -m32 -O2 -fno-ident -fdata-sections
> -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti
> -fno-threadsafe-statics -fvisibility-inlines-hidden -frtti -Wno-deprecated
> -std=gnu++11 -Wno-narrowing  -c ../../third_party/icu/source/common/resource.cpp
> -o obj.host/third_party/icu/source/common/icuuc.resource.o
> In file included from /usr/include/features.h:399:0,
>                  from /usr/include/stdint.h:25,
>                  from /usr/lib/gcc/x86_64-redhat-
> linux/4.8.5/include/stdint.h:9,
>                  from ../../third_party/icu/source/
> common/unicode/ptypes.h:66,
>                  from ../../third_party/icu/source/
> common/unicode/umachine.h:44,
>                  from ../../third_party/icu/source/
> common/unicode/utypes.h:36,
>                  from ../../third_party/icu/source/common/resource.h:26,
>                  from ../../third_party/icu/source/common/resource.cpp:12:
> /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file
> or directory
>  # include <gnu/stubs-32.h>
>                            ^
> compilation terminated.
> [10/17943] CXX obj/third_party/icu/source/common/icuuc.uobject.o
> [11/17943] CC obj/third_party/icu/source/common/icuuc.ustrfmt.o
> [12/17943] CXX obj/third_party/icu/source/common/icuuc.ustack.o
> [13/17943] CC obj/third_party/icu/source/common/icuuc.uscript.o
> [14/17943] CC obj/third_party/icu/source/common/icuuc.usc_impl.o
> [15/17943] CC obj/third_party/icu/source/common/icuuc.utf_impl.o
> [16/17943] ACTION Generating download_file_types.pb.
> [17/17943] CXX obj/third_party/icu/source/common/icuuc.ustrcase_locale.o
> [18/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_titlecase_
> brkiter.o
> [19/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_cnv.o
> [20/17943] CXX obj/third_party/icu/source/common/icuuc.util.o
> [21/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_case_
> locale.o
> [22/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_props.o
> [23/17943] CXX obj/third_party/icu/source/common/icuuc.uscript_props.o
> [24/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_wcs.o
> [25/17943] CXX obj/third_party/icu/source/common/icuuc.unormcmp.o
> [26/17943] CXX obj/third_party/icu/source/common/icuuc.uprops.o
> [27/17943] CXX obj/third_party/icu/source/common/icuuc.uset_props.o
> [28/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_case.o
> [29/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_titlecase_
> brkiter.o
> [30/17943] CXX obj/third_party/icu/source/common/icuuc.usetiter.o
> [31/17943] CXX obj/third_party/icu/source/common/icuuc.unorm.o
> [32/17943] CXX obj/third_party/icu/source/common/icuuc.ustring.o
> [33/17943] CXX obj/third_party/icu/source/common/icuuc.ushape.o
> [34/17943] CXX obj/third_party/icu/source/common/icuuc.uset.o
> [35/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_cnv.o
> [36/17943] CXX obj/third_party/icu/source/common/icuuc.ustrenum.o
> [37/17943] CXX obj/third_party/icu/source/common/icuuc.usprep.o
> [38/17943] CXX obj/third_party/icu/source/common/icuuc.ustrcase.o
> [39/17943] CXX obj/third_party/icu/source/common/icuuc.ustrtrns.o
> [40/17943] CXX obj/third_party/icu/source/common/icuuc.uresdata.o
> [41/17943] CXX obj/third_party/icu/source/common/icuuc.utext.o
> [42/17943] CXX obj/third_party/icu/source/common/icuuc.unisetspan.o
> [43/17943] CXX obj/third_party/icu/source/common/icuuc.uresbund.o
> ninja: build stopped: subcommand failed.
> WARNING: /build/test/tmp/work/core2-32-poky-linux/chromium/52.0.2743.
> 76-r0/temp/run.do_compile.88585:1 exit 1 from 'ninja -C
> /build/test/tmp/work/core2-32-poky-linux/chromium/52.0.2743.
> 76-r0/chromium-52.0.2743.76/out/Release -j 40 chrome chrome_sandbox'
> ERROR: Function failed: do_compile (log file is located at
> /build/test/tmp/work/core2-32-poky-linux/chromium/52.0.2743.
> 76-r0/temp/log.do_compile.88585)
>
>
> --
> Michael Davis
> Sr. Software Engineer
> 11128 John Galt Blvd, 3nd floor
> Omaha, NE 68137
> Telephone:              (402) 938-1374
> Fax:                         (402) 970-1275
> Toll Free:                 1-800-247-8683
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

