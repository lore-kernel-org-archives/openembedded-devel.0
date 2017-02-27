Return-Path: <sragolu@mvista.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC57071D87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 09:48:19 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id z127so30827440lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6yy2PDgGdC/gcwHGpqYJA7/YHq1zpZcBT/ZTIzjm3rU=;
	b=ECUnEeE53eA6O7q6uNt8Fw0R/b208o1q9G11KhU+9MCBaLwVz/QpVWb5YQNqGemqFU
	bjALH9QU9DNK+rwTRkdidJIf4hFpHFtbwg/tUobOX16OLh3riNWchw+GU4V9NmyNwpws
	2dGiqo6v9HQbVzr5JD/XkiyzFh91R3Nb7akGEjKvY/Gzn2heBNeYwhePh7fqunGso39g
	fL6zfJdNQfmSU5m4Mp/8HUEWFdqPxMHwBX4d3K+XuA2YGOVA7lDVa91Mk24o0c0pxJZy
	4lBmPOzZsdSZYxoDELiSmNNyk1ZptcxBFl/t6EqWEmMNCfI9SPQqAz1zGsVtKZ4/zr9Y
	ftiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6yy2PDgGdC/gcwHGpqYJA7/YHq1zpZcBT/ZTIzjm3rU=;
	b=tXI6xSVuA21roOR0pVCdjdkFzjiaRRuEf8tWiaBX4ni06d/5wV2dp9T803rvDyYnaX
	UEFiX/ZQU7+LQ1lxzNYpAhBN9Wzud13YyOOqp5XOMrNeHamtwtcSLPdd6CGUwKWO73Ts
	B96ErkFbZxVmPVH3EnUHDz+jLwZ8Tx24Nn0lkfdHm9lKdkj8I5EP/7wuIICNOho8V0qk
	k050sSxjD+a1AUSTc7h1eK2n2vYHf3T6oFUjkmTKgOCn7m1pFMKCDoEjzMPOTt8QRl1g
	J674BagciIa3CzlSMYMnF08vj5G5Ka2nDqGUgA3r2otFrwRB2ydDc0g58kY+HOm1sQuh
	3HHw==
X-Gm-Message-State: AMke39mfFeYXIddKvap2BEcICeYD2ZSmOk9hDHNW9Th0OVTxV3ALFMLxJ2Li0Cip1gZKHqnxoHADFQ6JbHJIYbne
X-Received: by 10.25.198.19 with SMTP id w19mr4692026lff.175.1488188899652;
	Mon, 27 Feb 2017 01:48:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.208.69 with HTTP; Mon, 27 Feb 2017 01:48:18 -0800 (PST)
In-Reply-To: <CAH4+OFq=aZeeEayB2TSAiGGiVhwp01EfBdqNavYEwo2kuJ+d+Q@mail.gmail.com>
References: <1487759783-10455-1-git-send-email-guy.shapiro@mobi-wize.com>
	<CAH4+OFrHDbj1ZmYRRN+mSAHEHCvnBDiTou0JUQTmiyCmyr-Sig@mail.gmail.com>
	<7b26a808-c448-706f-c595-393e55451c3b@mobi-wize.com>
	<CAH4+OFq=aZeeEayB2TSAiGGiVhwp01EfBdqNavYEwo2kuJ+d+Q@mail.gmail.com>
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
Date: Mon, 27 Feb 2017 15:18:18 +0530
Message-ID: <CAH4+OFoigK1HxZYPW-zFcs+dqTt_0yvdTjogzzeMHfXdGnwRRw@mail.gmail.com>
To: Guy Shapiro <guy.shapiro@mobi-wize.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] [rfc] openjdk-8: recipe for jdk8u121-b13-aarch32
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
X-List-Received-Date: Mon, 27 Feb 2017 09:48:21 -0000
X-Groupsio-MsgNum: 65578
Content-Type: multipart/mixed; boundary=94eb2c1958c0b9349405497ffa24

--94eb2c1958c0b9349405497ffa24
Content-Type: text/plain; charset=UTF-8

For got to attach my openjdk recipe set ....

On Mon, Feb 27, 2017 at 2:56 PM, Srinivasa Rao Ragolu <sragolu@mvista.com>
wrote:

> Hi Guy,
>
> I have tried mentioned changes for aarch32-port build and attached
> snapshot of openjdk repo as an attachment. But when I started compiling I
> got below compilation error. Could you please help me resolving this issue?
>
>
> /home/srinivas/cham-project-new/montavista/bin/../tools/
> arm-gnu//bin/arm-montavista-linux-gnueabi-g++ -march=armv7-a
> -mthumb-interwork -mfloat-abi=hard -mtune=cortex-a9
> --sysroot=/home/srinivas/cham-project-new/ericsson-project/tmp/sysroots/marvell-a385-cham
> -DLINUX -D_GNU_SOURCE -DAARCH32 -DARM -D__STDC_LIMIT_MACROS
> -D__STDC_CONSTANT_MACROS -DPRODUCT -I/home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/prims
> -I/home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm -I/home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/precompiled
> -I/home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm
> -I/home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/os_cpu/linux_aarch32/vm
> -I/home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/os/linux/vm
> -I/home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/os/posix/vm -I../generated
> '-DHOTSPOT_RELEASE_VERSION="25.71-b00"' '-DHOTSPOT_BUILD_TARGET="product"'
> '-DHOTSPOT_BUILD_USER="srinivas"' '-DHOTSPOT_LIB_ARCH="aarch32"'
> '-DHOTSPOT_VM_DISTRO="OpenJDK"' -O2 -pipe -g
> -feliminate-unused-debug-types -Wno-error=deprecated-declarations
> -DTARGET_OS_FAMILY_linux -DTARGET_ARCH_aarch32 -DTARGET_ARCH_MODEL_aarch32
> -DTARGET_OS_ARCH_linux_aarch32 -DTARGET_OS_ARCH_MODEL_linux_aarch32
> -DTARGET_COMPILER_gcc -DCOMPILER1 -DDONT_USE_PRECOMPILED_HEADER -fno-rtti
> -fno-exceptions -D_REENTRANT -fcheck-new -fvisibility=hidden -pipe
> -fno-strict-aliasing -g -fno-omit-frame-pointer -DTARGET_OS_FAMILY_linux
> -DTARGET_ARCH_aarch32 -DTARGET_ARCH_MODEL_aarch32
> -DTARGET_OS_ARCH_linux_aarch32 -DTARGET_OS_ARCH_MODEL_linux_aarch32
> -DTARGET_COMPILER_gcc -DCOMPILER1 -DDONT_USE_PRECOMPILED_HEADER -fPIC
> -fno-rtti -fno-exceptions -D_REENTRANT -fcheck-new -fvisibility=hidden
> -pipe -fno-strict-aliasing -g -fno-omit-frame-pointer -O3
> -DVM_LITTLE_ENDIAN -Werror -Wpointer-arith -Wsign-compare -Wundef
> -Wunused-function -Wunused-value -c -MMD -MP -MF ../generated/dependencies/sharedRuntime_aarch32.o.d
> -fpch-deps -o sharedRuntime_aarch32.o /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp
> | In file included from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/utilities/globalDefinitions_gcc.hpp:28:0,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/utilities/globalDefinitions.hpp:33,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/utilities/debug.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/runtime/globals.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/memory/allocation.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/memory/iterator.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/memory/genOopClosures.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/oops/klass.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/runtime/handles.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/memory/universe.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/code/oopRecorder.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/asm/codeBuffer.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/asm/assembler.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/share/vm/asm/macroAssembler.hpp:28,
> |                  from /home/srinivas/cham-project-
> new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-
> linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/
> src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:28:
> | /home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/prims/jni.h:876:13: note: the
> mangling of 'va_list' has changed in GCC 4.4
> | /home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:
> In static member function 'static int SharedRuntime::java_calling_convention(const
> BasicType*, VMRegPair*, int, int)':
> | /home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/
> sharedRuntime_aarch32.cpp:256:27: error: comparison between signed and
> unsigned integer expressions [-Werror=sign-compare]
> | /home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/
> sharedRuntime_aarch32.cpp:288:27: error: comparison between signed and
> unsigned integer expressions [-Werror=sign-compare]
> | /home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:
> In static member function 'static int SharedRuntime::c_calling_convention(const
> BasicType*, VMRegPair*, VMRegPair*, int)':
> | /home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/
> sharedRuntime_aarch32.cpp:835:27: error: comparison between signed and
> unsigned integer expressions [-Werror=sign-compare]
> | cc1plus: all warnings being treated as errors
> | make[6]: *** [sharedRuntime_aarch32.o] Error 1
> | make[5]: *** [the_vm] Error 2
> | make[4]: *** [product1] Error 2
> | make[3]: *** [generic_build1] Error 2
> | make[2]: *** [product1] Error 2
> | make[1]: *** [/home/srinivas/cham-project-new/ericsson-project/tmp/work/
> cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-
> r0/build/hotspot/_hotspot.timestamp] Error 2
> | make: *** [hotspot-only] Error 2
>
>
> THanks,
> Srinivas.
>
> On Wed, Feb 22, 2017 at 4:28 PM, Guy Shapiro <guy.shapiro@mobi-wize.com>
> wrote:
>
>> On 22/02/2017 12:43, Srinivasa Rao Ragolu wrote:
>>
>> Thanks a lot for your contribution. Could you please share the location
>> of these recipes? So that I can fetch and try on my build setup.
>>
>> They appear below as a patch that can be applied to the master branch of
>> meta-java
>> (git://git.yoctoproject.org/meta-java).
>>
>> Guy.
>>
>>
>> On Wed, Feb 22, 2017 at 4:06 PM, Guy Shapiro <guy.shapiro@mobi-wize.com>
>> wrote:
>>
>>> Hi all,
>>>
>>> The following patch adds a recipe for building the updated openjdk-8 ARM
>>> port.
>>> This JVM version is significantly faster than the current one.
>>> This is still "work in progress", but can be used to create a useful
>>> package.
>>> Regards,
>>> Guy
>>>
>>> P.S. I'm not going to be responsive on mail in the next weeks. Please
>>> accept my
>>> apology in advance for delayed answers.
>>>
>>> ---
>>> Main changes:
>>> - Fetch the code from the aarch32-port repository. This repository
>>>   contains the C1 (Client) JIT, making it much faster than the
>>>   currently used version.
>>> - Compile using the newly available Client JVM variant.
>>> - Don't apply some old patches that prevents the code from being
>>>   compiled.
>>> - Do not install modified jvm.cfg. Keep the built one instead.
>>>
>>> Main issues:
>>> - The license file change (address update) breaks the build of old
>>>   versions.
>>> - headful/X11 builds still fail.
>>>
>>> Signed-off-by: Guy Shapiro <guy.shapiro@mobi-wize.com>
>>> ---
>>>  recipes-core/openjdk/openjdk-8-common.inc         |  4 +-
>>>  recipes-core/openjdk/openjdk-8-cross.inc          |  1 +
>>>  recipes-core/openjdk/openjdk-8-native_121b13.bb   |  2 +
>>>  recipes-core/openjdk/openjdk-8-release-121b13.inc | 83
>>> +++++++++++++++++++
>>>  recipes-core/openjdk/openjdk-8_121b13.bb          | 99
>>> +++++++++++++++++++++++
>>>  recipes-core/openjdk/openjre-8_121b13.bb          | 54 +++++++++++++
>>>  6 files changed, 242 insertions(+), 1 deletion(-)
>>>  create mode 100644 recipes-core/openjdk/openjdk-8-native_121b13.bb
>>>  create mode 100644 recipes-core/openjdk/openjdk-8-release-121b13.inc
>>>  create mode 100644 recipes-core/openjdk/openjdk-8_121b13.bb
>>>  create mode 100644 recipes-core/openjdk/openjre-8_121b13.bb
>>>
>>> diff --git a/recipes-core/openjdk/openjdk-8-common.inc
>>> b/recipes-core/openjdk/openjdk-8-common.inc
>>> index def779d..0e7d258 100644
>>> --- a/recipes-core/openjdk/openjdk-8-common.inc
>>> +++ b/recipes-core/openjdk/openjdk-8-common.inc
>>> @@ -2,7 +2,7 @@ DESCRIPTION = "Java runtime based upon the OpenJDK
>>> Project"
>>>  HOMEPAGE = "http://http://openjdk.java.net/"
>>>  LICENSE  = "GPL-2.0-with-classpath-exception"
>>>
>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7b4baeedfe
>>> 2d40cb03536573bc2c89b1"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3e0b59f8fa
>>> c05c3c03d4a26bbda13f8f"
>>>
>>>  inherit java autotools gettext qemu pkgconfig
>>>
>>> @@ -196,6 +196,8 @@ def get_jdk_arch(d):
>>>      jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
>>>      if jdk_arch == "x86-64":
>>>          jdk_arch = "amd64"
>>> +    elif jdk_arch == "arm":
>>> +        jdk_arch = "aarch32"
>>>      elif jdk_arch == "powerpc":
>>>          jdk_arch = "ppc"
>>>      elif jdk_arch == "powerpc64":
>>> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc
>>> b/recipes-core/openjdk/openjdk-8-cross.inc
>>> index 47fe35d..ce98152 100644
>>> --- a/recipes-core/openjdk/openjdk-8-cross.inc
>>> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
>>> @@ -28,6 +28,7 @@ PACKAGECONFIG[gif] = "--with-giflib=system,--with-g
>>> iflib=bundled,giflib,"
>>>  export WANT_LLVM_RELEASE = "3.5.2"
>>>  PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"
>>>  PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
>>> +PACKAGECONFIG[client] = "--with-jvm-variants=client,,,"
>>>
>>>  PACKAGECONFIG[repack] = ",,,"
>>>
>>> diff --git a/recipes-core/openjdk/openjdk-8-native_121b13.bb
>>> b/recipes-core/openjdk/openjdk-8-native_121b13.bb
>>> new file mode 100644
>>> index 0000000..f75cfc8
>>> --- /dev/null
>>> +++ b/recipes-core/openjdk/openjdk-8-native_121b13.bb
>>> @@ -0,0 +1,2 @@
>>> +require openjdk-8-release-121b13.inc
>>> +require openjdk-8-native.inc
>>> diff --git a/recipes-core/openjdk/openjdk-8-release-121b13.inc
>>> b/recipes-core/openjdk/openjdk-8-release-121b13.inc
>>> new file mode 100644
>>> index 0000000..441ee1f
>>> --- /dev/null
>>> +++ b/recipes-core/openjdk/openjdk-8-release-121b13.inc
>>> @@ -0,0 +1,83 @@
>>> +PATCHES_URI="\
>>> +    file://remove-shell-variables-from-autoheader.patch;striplevel=0 \
>>> +    file://filter-aclocal-copy-too.patch;striplevel=0 \
>>> +    file://dont-expect-fqpn-for-make.patch;striplevel=0 \
>>> +    file://openjdk8-no-genx11-in-headless.patch;apply=no \
>>> +    file://openjdk8-no-unused-deps.patch;apply=no \
>>> +    file://openjdk8-find-compiler-fix-env-respect.patch;apply=no \
>>> +    file://openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch;apply=no
>>> \
>>> +"
>>> +
>>> +# Name of the directory containing the compiled output
>>> +BUILD_DIR = "openjdk.build"
>>> +BUILD_DIR_ECJ = "openjdk.build-ecj"
>>> +
>>> +# Force arm mode for now
>>> +ARM_INSTRUCTION_SET_armv4t = "ARM"
>>> +
>>> +# readdir_r was deprecated in glibc-2.24. Ignore the error for now
>>> +# NOTE: When updating the recipe, please check if this is still needed
>>> +CFLAGS_append = " -Wno-error=deprecated-declarations"
>>> +
>>> +# Currently the arm port supports only the client JIT (or the Zero
>>> interpreter)
>>> +# For details see (http://mail.openjdk.java.net/
>>> pipermail/aarch32-port-dev/2017-February/000750.html)
>>> +PACKAGECONFIG_append_arm = " client"
>>> +
>>> +CORBA_CHANGESET = "093c20d822cc"
>>> +SRC_URI[corba.md5sum] = "978bd5ebaf495bb99f5a436d60f39587"
>>> +SRC_URI[corba.sha256sum] = "571826a06659b5afbe3ec0ea22178
>>> c53a6b029ad1b17a763cbe1537d78a3f19e"
>>> +
>>> +HOTSPOT_CHANGESET = "2d40c68f1daa"
>>> +SRC_URI[hotspot.md5sum] = "58013c035b578f8f11c4d00ac6ac4e95"
>>> +SRC_URI[hotspot.sha256sum] = "2577cfe778f4eab3e392d37721491
>>> 76936792238e8cfcc5b82bd743007655ca0"
>>> +
>>> +JAXP_CHANGESET = "1bd8db5ce718"
>>> +SRC_URI[jaxp.md5sum] = "d6de6091c26dbe0ae2aa7951a677edeb"
>>> +SRC_URI[jaxp.sha256sum] = "dcace543a0a61db258e2b05859e63
>>> ebdba79910501a29f84f6605e4c1c9010d5"
>>> +
>>> +JAXWS_CHANGESET = "7ed8fcc10d0c"
>>> +SRC_URI[jaxws.md5sum] = "a22232cfabb1c6684a9792c1ac5648f6"
>>> +SRC_URI[jaxws.sha256sum] = "ed818fab52b5db9ba785ba064ebaf
>>> f494837205a3c271ff8569a668dac6708a8"
>>> +
>>> +JDK_CHANGESET = "16729db11724"
>>> +SRC_URI[jdk.md5sum] = "852107da4bf27fcb93d27bb8752a93fb"
>>> +SRC_URI[jdk.sha256sum] = "c011db48e85757615557e04b205c8
>>> ebd48a3e249ae0235e172e4ac5a30d34ce4"
>>> +
>>> +LANGTOOLS_CHANGESET = "e371a84a0763"
>>> +SRC_URI[langtools.md5sum] = "d73c0ff9d58ffce38ef4bca64868b4e8"
>>> +SRC_URI[langtools.sha256sum] = "0c238dc6c6f50c6b1b08d37102c18
>>> 8f70bb04c4628e9b49e6d753db62429e24c"
>>> +
>>> +NASHORN_CHANGESET = "931298dbe3cf"
>>> +SRC_URI[nashorn.md5sum] = "61008a331b72d5afbdf52375acd45956"
>>> +SRC_URI[nashorn.sha256sum] = "33f3877f81c80150b62cd53fe815e
>>> ac8ec7fdee6a116f5cedc6208e35380295d"
>>> +
>>> +OPENJDK_CHANGESET = "cb8f12bf1e86"
>>> +SRC_URI[openjdk.md5sum] = "0738a58b7f0dd77a638d1127f17a19c3"
>>> +SRC_URI[openjdk.sha256sum] = "0b0af46573ed08cedbde4a5bdefa1
>>> e8cda63bdb679b5d46be789ec602911fce4"
>>> +
>>> +OPENJDK_HG_U = "jdk8u"
>>> +OPENJDK_HG_URL = "http://hg.openjdk.java.net/aa
>>> rch32-port/${OPENJDK_HG_U}"
>>> +
>>> +OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
>>> +OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk"
>>> +
>>> +HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
>>> +HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/arc
>>> hive/${HOTSPOT_FILE};name=hotspot;unpack=false"
>>> +
>>> +CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
>>> +CORBA_URI = "${OPENJDK_HG_URL}/corba/archi
>>> ve/${CORBA_FILE};name=corba;unpack=false"
>>> +
>>> +JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
>>> +JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpac
>>> k=false"
>>> +
>>> +JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
>>> +JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archi
>>> ve/${JAXWS_FILE};name=jaxws;unpack=false"
>>> +
>>> +JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
>>> +JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=f
>>> alse"
>>> +
>>> +LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
>>> +LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/a
>>> rchive/${LANGTOOLS_FILE};name=langtools;unpack=false"
>>> +
>>> +NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
>>> +NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/arc
>>> hive/${NASHORN_FILE};name=nashorn;unpack=false"
>>> diff --git a/recipes-core/openjdk/openjdk-8_121b13.bb
>>> b/recipes-core/openjdk/openjdk-8_121b13.bb
>>> new file mode 100644
>>> index 0000000..42ea6fe
>>> --- /dev/null
>>> +++ b/recipes-core/openjdk/openjdk-8_121b13.bb
>>> @@ -0,0 +1,99 @@
>>> +require openjdk-8-release-121b13.inc
>>> +require openjdk-8-cross.inc
>>> +
>>> +# some patches extracted from http://cr.openjdk.java.net/~rk
>>> ennke/shark-build-hotspot/webrev.01/hotspot.patch
>>> +# reported via http://mail.openjdk.java.net/p
>>> ipermail/build-dev/2015-January/013972.html
>>> +# by Roman Kennke (rkennke at redhat.com)
>>> +PATCHES_URI_append = "\
>>> +    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
>>> +    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no
>>> \
>>> +    file://openjdk8-fix-adlc-flags.patch;apply=no \
>>> +    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
>>> +    file://openjdk8-add-missing-linker-flags.patch;apply=no \
>>> +"
>>> +
>>> +do_install() {
>>> +    rm -rf ${D}${JDK_HOME}
>>> +    mkdir -p ${D}${JDK_HOME}
>>> +    cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
>>> +    chown -R root:root ${D}${JDK_HOME}
>>> +    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
>>> +}
>>> +
>>> +PACKAGES_append = " \
>>> +    ${PN}-demo-dbg \
>>> +    ${PN}-demo \
>>> +    ${PN}-source \
>>> +"
>>> +
>>> +FILES_${PN}_append = "\
>>> +    ${JDK_HOME}/bin/[a-z]* \
>>> +    ${JDK_HOME}/lib/[a-z]* \
>>> +    ${JDK_HOME}/jre/bin/[a-z]* \
>>> +    ${JDK_HOME}/jre/lib/[a-z]* \
>>> +    ${JDK_HOME}/LICENSE \
>>> +    ${JDK_HOME}/jre/LICENSE \
>>> +    ${JDK_HOME}/release \
>>> +"
>>> +
>>> +FILES_${PN}-dev_append = "\
>>> +    ${JDK_HOME}/include \
>>> +"
>>> +
>>> +FILES_${PN}-dbg_append = "\
>>> +    ${JDK_HOME}/bin/.debug/ \
>>> +    ${JDK_HOME}/lib/.debug/ \
>>> +    ${JDK_HOME}/lib/${JDK_ARCH}/.debug/ \
>>> +    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
>>> +    ${JDK_HOME}/jre/bin/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
>>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
>>> +"
>>> +
>>> +FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
>>> +RDEPENDS_${PN}-demo = " ${PN} "
>>> +
>>> +FILES_${PN}-demo-dbg = "\
>>> +    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/minst/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug/ \
>>> +    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
>>> +"
>>> +
>>> +FILES_${PN}-doc_append = "\
>>> +    ${JDK_HOME}/man \
>>> +    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
>>> +    ${JDK_HOME}/THIRD_PARTY_README \
>>> +    ${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
>>> +    ${JDK_HOME}/jre/THIRD_PARTY_README \
>>> +    ${JDK_HOME}/man \
>>> +"
>>> +
>>> +FILES_${PN}-source = " ${JDK_HOME}/src.zip "
>>> +
>>> +RPROVIDES_${PN} = "java2-vm"
>>> +PROVIDES_${PN} = "java2-vm"
>>> +RPROVIDES_${PN} = "java2-runtime"
>>> +PROVIDES_${PN} = "java2-runtime"
>>> +
>>> +inherit update-alternatives
>>> +
>>> +ALTERNATIVE_PRIORITY = "100"
>>> +
>>> +ALTERNATIVE_${PN} = "java javac"
>>> +ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
>>> +ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
>>> +
>>> +ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
>>> +ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
>>> diff --git a/recipes-core/openjdk/openjre-8_121b13.bb
>>> b/recipes-core/openjdk/openjre-8_121b13.bb
>>> new file mode 100644
>>> index 0000000..9ef33e7
>>> --- /dev/null
>>> +++ b/recipes-core/openjdk/openjre-8_121b13.bb
>>> @@ -0,0 +1,54 @@
>>> +require openjdk-8-release-121b13.inc
>>> +require openjdk-8-cross.inc
>>> +
>>> +# some patches extracted from http://cr.openjdk.java.net/~rk
>>> ennke/shark-build-hotspot/webrev.01/hotspot.patch
>>> +# reported via http://mail.openjdk.java.net/p
>>> ipermail/build-dev/2015-January/013972.html
>>> +# by Roman Kennke (rkennke at redhat.com)
>>> +PATCHES_URI_append = "\
>>> +    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
>>> +    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no
>>> \
>>> +    file://openjdk8-fix-adlc-flags.patch;apply=no \
>>> +    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
>>> +    file://openjdk8-add-missing-linker-flags.patch;apply=no \
>>> +"
>>> +
>>> +do_install() {
>>> +    rm -rf ${D}${JRE_HOME}
>>> +    mkdir -p ${D}${JRE_HOME}
>>> +    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
>>> +    chown -R root:root ${D}${JRE_HOME}
>>> +    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
>>> +}
>>> +
>>> +FILES_${PN}_append = "\
>>> +    ${JRE_HOME}/bin/[a-z]* \
>>> +    ${JRE_HOME}/lib/[a-z]* \
>>> +    ${JRE_HOME}/LICENSE \
>>> +    ${JRE_HOME}/release \
>>> +"
>>> +
>>> +FILES_${PN}-dbg_append = "\
>>> +    ${JRE_HOME}/bin/.debug/ \
>>> +    ${JRE_HOME}/lib/.debug/ \
>>> +    ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
>>> +    ${JRE_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
>>> +    ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
>>> +"
>>> +
>>> +FILES_${PN}-doc_append = "\
>>> +    ${JRE_HOME}/man \
>>> +    ${JRE_HOME}/ASSEMBLY_EXCEPTION \
>>> +    ${JRE_HOME}/THIRD_PARTY_README \
>>> +"
>>> +
>>> +RPROVIDES_${PN} = "java2-vm"
>>> +PROVIDES_${PN} = "java2-vm"
>>> +RPROVIDES_${PN} = "java2-runtime"
>>> +PROVIDES_${PN} = "java2-runtime"
>>> +
>>> +inherit update-alternatives
>>> +
>>> +ALTERNATIVE_${PN} = "java"
>>> +ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
>>> +ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
>>> +ALTERNATIVE_PRIORITY[java] = "100"
>>> --
>>> 2.1.4
>>>
>>>
>>
>>
>

--94eb2c1958c0b9349405497ffa24
Content-Type: application/x-gzip; name="openjdk.tar.gz"
Content-Disposition: attachment; filename="openjdk.tar.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iznx7vyh0

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

--94eb2c1958c0b9349405497ffa24--
