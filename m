Return-Path: <sragolu@mvista.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id DD7E66069D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 09:26:10 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id y193so2496460lfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 01:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w1rvPOfOUZ+NlugEL+Ei0ZjuRG17i7SF4kgmLWyYanE=;
	b=UJjUNeJQZnwWS4nFQa8enS6Kb047B0E4mzR48y8qjvJr1SNOHD/B4SEuohzgeKXQ0K
	aF4qryKNgYpjPWc4SunceQqqSPJbPNFCVM/zJd//d9RRFkK+rWoFX5i9m06ALKtIPbo1
	l6W/7PZWjRL2Og9svYqAmyG0Y5BAVzpE9D32Gjpp1az9m7tSsrbN6QErZUU1lnEW8+QB
	TykwpOho1JHQQ0MtwPvwECUb2VAbPWqz9HQlHAP/84Rg7wP6uH3Eka03XYEUBqnxREA2
	HfmW4CLLgOnp7HWDr+VEESzoZei5LNGrkY2bVmsoeQso0dByji35kaMRRDSoz8FaJWaj
	HOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w1rvPOfOUZ+NlugEL+Ei0ZjuRG17i7SF4kgmLWyYanE=;
	b=F0xlpaSj3DK0NbDdmm54JfPHwpnR/IMHelXaqig4HwTBM0g4U9wYn3Yqc2WwVUe275
	iZ4ZCeJx+b5+MJN+lK7dxgT7MU7rtXbbOCOqqpm5DdyFONTKS7g40l4fzwL9Oy3hI7JY
	wi1/LohkC2AwtJXeYVnbLyvomLCCLZdUH6PK2AYxqRp8kug7bJmMimWCbgPbEu7yRiDc
	JE/L3yHuRnAnUMMuuiDNKuUC5erVW391rFLPq+LFfEnySVO6awFCuvD1dMoMLxNYdpXg
	wq2XVctTLIjYigHoOEeTiCKlEubQS0R1xIhu3N7ig8Tnq6Bg7lhLzCdEjIeOKpuSLw98
	U0KQ==
X-Gm-Message-State: AMke39kRJ6KDrV4dtyx23LtqsbsdSBKaC0eWH3+0f8je2v3Xa9COKSfmc8s36TInqOjWJbNrd7Iw9MPf492iI47f
X-Received: by 10.46.21.88 with SMTP id 24mr3879221ljv.101.1488187571311; Mon,
	27 Feb 2017 01:26:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.208.69 with HTTP; Mon, 27 Feb 2017 01:26:10 -0800 (PST)
In-Reply-To: <7b26a808-c448-706f-c595-393e55451c3b@mobi-wize.com>
References: <1487759783-10455-1-git-send-email-guy.shapiro@mobi-wize.com>
	<CAH4+OFrHDbj1ZmYRRN+mSAHEHCvnBDiTou0JUQTmiyCmyr-Sig@mail.gmail.com>
	<7b26a808-c448-706f-c595-393e55451c3b@mobi-wize.com>
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
Date: Mon, 27 Feb 2017 14:56:10 +0530
Message-ID: <CAH4+OFq=aZeeEayB2TSAiGGiVhwp01EfBdqNavYEwo2kuJ+d+Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Feb 2017 09:26:18 -0000
Content-Type: text/plain; charset=UTF-8

Hi Guy,

I have tried mentioned changes for aarch32-port build and attached snapshot
of openjdk repo as an attachment. But when I started compiling I got below
compilation error. Could you please help me resolving this issue?


/home/srinivas/cham-project-new/montavista/bin/../tools/arm-gnu//bin/arm-montavista-linux-gnueabi-g++
-march=armv7-a -mthumb-interwork -mfloat-abi=hard -mtune=cortex-a9
--sysroot=/home/srinivas/cham-project-new/ericsson-project/tmp/sysroots/marvell-a385-cham
-DLINUX -D_GNU_SOURCE -DAARCH32 -DARM -D__STDC_LIMIT_MACROS
-D__STDC_CONSTANT_MACROS -DPRODUCT
-I/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/prims
-I/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm
-I/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/precompiled
-I/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm
-I/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/os_cpu/linux_aarch32/vm
-I/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/os/linux/vm
-I/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/os/posix/vm
-I../generated '-DHOTSPOT_RELEASE_VERSION="25.71-b00"'
'-DHOTSPOT_BUILD_TARGET="product"' '-DHOTSPOT_BUILD_USER="srinivas"'
'-DHOTSPOT_LIB_ARCH="aarch32"' '-DHOTSPOT_VM_DISTRO="OpenJDK"' -O2 -pipe -g
-feliminate-unused-debug-types -Wno-error=deprecated-declarations
-DTARGET_OS_FAMILY_linux -DTARGET_ARCH_aarch32 -DTARGET_ARCH_MODEL_aarch32
-DTARGET_OS_ARCH_linux_aarch32 -DTARGET_OS_ARCH_MODEL_linux_aarch32
-DTARGET_COMPILER_gcc -DCOMPILER1 -DDONT_USE_PRECOMPILED_HEADER -fno-rtti
-fno-exceptions -D_REENTRANT -fcheck-new -fvisibility=hidden -pipe
-fno-strict-aliasing -g -fno-omit-frame-pointer -DTARGET_OS_FAMILY_linux
-DTARGET_ARCH_aarch32 -DTARGET_ARCH_MODEL_aarch32
-DTARGET_OS_ARCH_linux_aarch32 -DTARGET_OS_ARCH_MODEL_linux_aarch32
-DTARGET_COMPILER_gcc -DCOMPILER1 -DDONT_USE_PRECOMPILED_HEADER -fPIC
-fno-rtti -fno-exceptions -D_REENTRANT -fcheck-new -fvisibility=hidden
-pipe -fno-strict-aliasing -g -fno-omit-frame-pointer -O3
-DVM_LITTLE_ENDIAN -Werror -Wpointer-arith -Wsign-compare -Wundef
-Wunused-function -Wunused-value -c -MMD -MP -MF
../generated/dependencies/sharedRuntime_aarch32.o.d -fpch-deps -o
sharedRuntime_aarch32.o
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp
| In file included from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp:28:0,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/utilities/globalDefinitions.hpp:33,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/utilities/debug.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/runtime/globals.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/memory/allocation.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/memory/iterator.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/memory/genOopClosures.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/oops/klass.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/runtime/handles.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/memory/universe.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/code/oopRecorder.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/asm/codeBuffer.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/asm/assembler.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/asm/macroAssembler.hpp:28,
|                  from
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:28:
|
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/share/vm/prims/jni.h:876:13:
note: the mangling of 'va_list' has changed in GCC 4.4
|
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:
In static member function 'static int
SharedRuntime::java_calling_convention(const BasicType*, VMRegPair*, int,
int)':
|
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:256:27:
error: comparison between signed and unsigned integer expressions
[-Werror=sign-compare]
|
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:288:27:
error: comparison between signed and unsigned integer expressions
[-Werror=sign-compare]
|
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:
In static member function 'static int
SharedRuntime::c_calling_convention(const BasicType*, VMRegPair*,
VMRegPair*, int)':
|
/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/jdk8u-cb8f12bf1e86/hotspot/src/cpu/aarch32/vm/sharedRuntime_aarch32.cpp:835:27:
error: comparison between signed and unsigned integer expressions
[-Werror=sign-compare]
| cc1plus: all warnings being treated as errors
| make[6]: *** [sharedRuntime_aarch32.o] Error 1
| make[5]: *** [the_vm] Error 2
| make[4]: *** [product1] Error 2
| make[3]: *** [generic_build1] Error 2
| make[2]: *** [product1] Error 2
| make[1]: ***
[/home/srinivas/cham-project-new/ericsson-project/tmp/work/cortexa9hf-vfp-montavista-linux-gnueabi/openjdk-8/72b05-r0/build/hotspot/_hotspot.timestamp]
Error 2
| make: *** [hotspot-only] Error 2


THanks,
Srinivas.

On Wed, Feb 22, 2017 at 4:28 PM, Guy Shapiro <guy.shapiro@mobi-wize.com>
wrote:

> On 22/02/2017 12:43, Srinivasa Rao Ragolu wrote:
>
> Thanks a lot for your contribution. Could you please share the location of
> these recipes? So that I can fetch and try on my build setup.
>
> They appear below as a patch that can be applied to the master branch of
> meta-java
> (git://git.yoctoproject.org/meta-java).
>
> Guy.
>
>
> On Wed, Feb 22, 2017 at 4:06 PM, Guy Shapiro <guy.shapiro@mobi-wize.com>
> wrote:
>
>> Hi all,
>>
>> The following patch adds a recipe for building the updated openjdk-8 ARM
>> port.
>> This JVM version is significantly faster than the current one.
>> This is still "work in progress", but can be used to create a useful
>> package.
>> Regards,
>> Guy
>>
>> P.S. I'm not going to be responsive on mail in the next weeks. Please
>> accept my
>> apology in advance for delayed answers.
>>
>> ---
>> Main changes:
>> - Fetch the code from the aarch32-port repository. This repository
>>   contains the C1 (Client) JIT, making it much faster than the
>>   currently used version.
>> - Compile using the newly available Client JVM variant.
>> - Don't apply some old patches that prevents the code from being
>>   compiled.
>> - Do not install modified jvm.cfg. Keep the built one instead.
>>
>> Main issues:
>> - The license file change (address update) breaks the build of old
>>   versions.
>> - headful/X11 builds still fail.
>>
>> Signed-off-by: Guy Shapiro <guy.shapiro@mobi-wize.com>
>> ---
>>  recipes-core/openjdk/openjdk-8-common.inc         |  4 +-
>>  recipes-core/openjdk/openjdk-8-cross.inc          |  1 +
>>  recipes-core/openjdk/openjdk-8-native_121b13.bb   |  2 +
>>  recipes-core/openjdk/openjdk-8-release-121b13.inc | 83
>> +++++++++++++++++++
>>  recipes-core/openjdk/openjdk-8_121b13.bb          | 99
>> +++++++++++++++++++++++
>>  recipes-core/openjdk/openjre-8_121b13.bb          | 54 +++++++++++++
>>  6 files changed, 242 insertions(+), 1 deletion(-)
>>  create mode 100644 recipes-core/openjdk/openjdk-8-native_121b13.bb
>>  create mode 100644 recipes-core/openjdk/openjdk-8-release-121b13.inc
>>  create mode 100644 recipes-core/openjdk/openjdk-8_121b13.bb
>>  create mode 100644 recipes-core/openjdk/openjre-8_121b13.bb
>>
>> diff --git a/recipes-core/openjdk/openjdk-8-common.inc
>> b/recipes-core/openjdk/openjdk-8-common.inc
>> index def779d..0e7d258 100644
>> --- a/recipes-core/openjdk/openjdk-8-common.inc
>> +++ b/recipes-core/openjdk/openjdk-8-common.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "Java runtime based upon the OpenJDK
>> Project"
>>  HOMEPAGE = "http://http://openjdk.java.net/"
>>  LICENSE  = "GPL-2.0-with-classpath-exception"
>>
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7b4baeedfe2d40cb03536573bc2c89b1"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3e0b59f8fac05c3c03d4a26bbda13f8f"
>>
>>  inherit java autotools gettext qemu pkgconfig
>>
>> @@ -196,6 +196,8 @@ def get_jdk_arch(d):
>>      jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
>>      if jdk_arch == "x86-64":
>>          jdk_arch = "amd64"
>> +    elif jdk_arch == "arm":
>> +        jdk_arch = "aarch32"
>>      elif jdk_arch == "powerpc":
>>          jdk_arch = "ppc"
>>      elif jdk_arch == "powerpc64":
>> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc
>> b/recipes-core/openjdk/openjdk-8-cross.inc
>> index 47fe35d..ce98152 100644
>> --- a/recipes-core/openjdk/openjdk-8-cross.inc
>> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
>> @@ -28,6 +28,7 @@ PACKAGECONFIG[gif] = "--with-giflib=system,--with-g
>> iflib=bundled,giflib,"
>>  export WANT_LLVM_RELEASE = "3.5.2"
>>  PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"
>>  PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
>> +PACKAGECONFIG[client] = "--with-jvm-variants=client,,,"
>>
>>  PACKAGECONFIG[repack] = ",,,"
>>
>> diff --git a/recipes-core/openjdk/openjdk-8-native_121b13.bb
>> b/recipes-core/openjdk/openjdk-8-native_121b13.bb
>> new file mode 100644
>> index 0000000..f75cfc8
>> --- /dev/null
>> +++ b/recipes-core/openjdk/openjdk-8-native_121b13.bb
>> @@ -0,0 +1,2 @@
>> +require openjdk-8-release-121b13.inc
>> +require openjdk-8-native.inc
>> diff --git a/recipes-core/openjdk/openjdk-8-release-121b13.inc
>> b/recipes-core/openjdk/openjdk-8-release-121b13.inc
>> new file mode 100644
>> index 0000000..441ee1f
>> --- /dev/null
>> +++ b/recipes-core/openjdk/openjdk-8-release-121b13.inc
>> @@ -0,0 +1,83 @@
>> +PATCHES_URI="\
>> +    file://remove-shell-variables-from-autoheader.patch;striplevel=0 \
>> +    file://filter-aclocal-copy-too.patch;striplevel=0 \
>> +    file://dont-expect-fqpn-for-make.patch;striplevel=0 \
>> +    file://openjdk8-no-genx11-in-headless.patch;apply=no \
>> +    file://openjdk8-no-unused-deps.patch;apply=no \
>> +    file://openjdk8-find-compiler-fix-env-respect.patch;apply=no \
>> +    file://openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch;apply=no
>> \
>> +"
>> +
>> +# Name of the directory containing the compiled output
>> +BUILD_DIR = "openjdk.build"
>> +BUILD_DIR_ECJ = "openjdk.build-ecj"
>> +
>> +# Force arm mode for now
>> +ARM_INSTRUCTION_SET_armv4t = "ARM"
>> +
>> +# readdir_r was deprecated in glibc-2.24. Ignore the error for now
>> +# NOTE: When updating the recipe, please check if this is still needed
>> +CFLAGS_append = " -Wno-error=deprecated-declarations"
>> +
>> +# Currently the arm port supports only the client JIT (or the Zero
>> interpreter)
>> +# For details see (http://mail.openjdk.java.net/
>> pipermail/aarch32-port-dev/2017-February/000750.html)
>> +PACKAGECONFIG_append_arm = " client"
>> +
>> +CORBA_CHANGESET = "093c20d822cc"
>> +SRC_URI[corba.md5sum] = "978bd5ebaf495bb99f5a436d60f39587"
>> +SRC_URI[corba.sha256sum] = "571826a06659b5afbe3ec0ea22178
>> c53a6b029ad1b17a763cbe1537d78a3f19e"
>> +
>> +HOTSPOT_CHANGESET = "2d40c68f1daa"
>> +SRC_URI[hotspot.md5sum] = "58013c035b578f8f11c4d00ac6ac4e95"
>> +SRC_URI[hotspot.sha256sum] = "2577cfe778f4eab3e392d37721491
>> 76936792238e8cfcc5b82bd743007655ca0"
>> +
>> +JAXP_CHANGESET = "1bd8db5ce718"
>> +SRC_URI[jaxp.md5sum] = "d6de6091c26dbe0ae2aa7951a677edeb"
>> +SRC_URI[jaxp.sha256sum] = "dcace543a0a61db258e2b05859e63
>> ebdba79910501a29f84f6605e4c1c9010d5"
>> +
>> +JAXWS_CHANGESET = "7ed8fcc10d0c"
>> +SRC_URI[jaxws.md5sum] = "a22232cfabb1c6684a9792c1ac5648f6"
>> +SRC_URI[jaxws.sha256sum] = "ed818fab52b5db9ba785ba064ebaf
>> f494837205a3c271ff8569a668dac6708a8"
>> +
>> +JDK_CHANGESET = "16729db11724"
>> +SRC_URI[jdk.md5sum] = "852107da4bf27fcb93d27bb8752a93fb"
>> +SRC_URI[jdk.sha256sum] = "c011db48e85757615557e04b205c8
>> ebd48a3e249ae0235e172e4ac5a30d34ce4"
>> +
>> +LANGTOOLS_CHANGESET = "e371a84a0763"
>> +SRC_URI[langtools.md5sum] = "d73c0ff9d58ffce38ef4bca64868b4e8"
>> +SRC_URI[langtools.sha256sum] = "0c238dc6c6f50c6b1b08d37102c18
>> 8f70bb04c4628e9b49e6d753db62429e24c"
>> +
>> +NASHORN_CHANGESET = "931298dbe3cf"
>> +SRC_URI[nashorn.md5sum] = "61008a331b72d5afbdf52375acd45956"
>> +SRC_URI[nashorn.sha256sum] = "33f3877f81c80150b62cd53fe815e
>> ac8ec7fdee6a116f5cedc6208e35380295d"
>> +
>> +OPENJDK_CHANGESET = "cb8f12bf1e86"
>> +SRC_URI[openjdk.md5sum] = "0738a58b7f0dd77a638d1127f17a19c3"
>> +SRC_URI[openjdk.sha256sum] = "0b0af46573ed08cedbde4a5bdefa1
>> e8cda63bdb679b5d46be789ec602911fce4"
>> +
>> +OPENJDK_HG_U = "jdk8u"
>> +OPENJDK_HG_URL = "http://hg.openjdk.java.net/aa
>> rch32-port/${OPENJDK_HG_U}"
>> +
>> +OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
>> +OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk"
>> +
>> +HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
>> +HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/arc
>> hive/${HOTSPOT_FILE};name=hotspot;unpack=false"
>> +
>> +CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
>> +CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=corba;
>> unpack=false"
>> +
>> +JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
>> +JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;
>> unpack=false"
>> +
>> +JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
>> +JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;
>> unpack=false"
>> +
>> +JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
>> +JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=
>> false"
>> +
>> +LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
>> +LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/a
>> rchive/${LANGTOOLS_FILE};name=langtools;unpack=false"
>> +
>> +NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
>> +NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/arc
>> hive/${NASHORN_FILE};name=nashorn;unpack=false"
>> diff --git a/recipes-core/openjdk/openjdk-8_121b13.bb
>> b/recipes-core/openjdk/openjdk-8_121b13.bb
>> new file mode 100644
>> index 0000000..42ea6fe
>> --- /dev/null
>> +++ b/recipes-core/openjdk/openjdk-8_121b13.bb
>> @@ -0,0 +1,99 @@
>> +require openjdk-8-release-121b13.inc
>> +require openjdk-8-cross.inc
>> +
>> +# some patches extracted from http://cr.openjdk.java.net/~rk
>> ennke/shark-build-hotspot/webrev.01/hotspot.patch
>> +# reported via http://mail.openjdk.java.net/p
>> ipermail/build-dev/2015-January/013972.html
>> +# by Roman Kennke (rkennke at redhat.com)
>> +PATCHES_URI_append = "\
>> +    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
>> +    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no
>> \
>> +    file://openjdk8-fix-adlc-flags.patch;apply=no \
>> +    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
>> +    file://openjdk8-add-missing-linker-flags.patch;apply=no \
>> +"
>> +
>> +do_install() {
>> +    rm -rf ${D}${JDK_HOME}
>> +    mkdir -p ${D}${JDK_HOME}
>> +    cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
>> +    chown -R root:root ${D}${JDK_HOME}
>> +    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
>> +}
>> +
>> +PACKAGES_append = " \
>> +    ${PN}-demo-dbg \
>> +    ${PN}-demo \
>> +    ${PN}-source \
>> +"
>> +
>> +FILES_${PN}_append = "\
>> +    ${JDK_HOME}/bin/[a-z]* \
>> +    ${JDK_HOME}/lib/[a-z]* \
>> +    ${JDK_HOME}/jre/bin/[a-z]* \
>> +    ${JDK_HOME}/jre/lib/[a-z]* \
>> +    ${JDK_HOME}/LICENSE \
>> +    ${JDK_HOME}/jre/LICENSE \
>> +    ${JDK_HOME}/release \
>> +"
>> +
>> +FILES_${PN}-dev_append = "\
>> +    ${JDK_HOME}/include \
>> +"
>> +
>> +FILES_${PN}-dbg_append = "\
>> +    ${JDK_HOME}/bin/.debug/ \
>> +    ${JDK_HOME}/lib/.debug/ \
>> +    ${JDK_HOME}/lib/${JDK_ARCH}/.debug/ \
>> +    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
>> +    ${JDK_HOME}/jre/bin/.debug/ \
>> +    ${JDK_HOME}/jre/lib/.debug/ \
>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug/ \
>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug/ \
>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug/ \
>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug/ \
>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
>> +    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
>> +"
>> +
>> +FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
>> +RDEPENDS_${PN}-demo = " ${PN} "
>> +
>> +FILES_${PN}-demo-dbg = "\
>> +    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/minst/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug/ \
>> +    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
>> +"
>> +
>> +FILES_${PN}-doc_append = "\
>> +    ${JDK_HOME}/man \
>> +    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
>> +    ${JDK_HOME}/THIRD_PARTY_README \
>> +    ${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
>> +    ${JDK_HOME}/jre/THIRD_PARTY_README \
>> +    ${JDK_HOME}/man \
>> +"
>> +
>> +FILES_${PN}-source = " ${JDK_HOME}/src.zip "
>> +
>> +RPROVIDES_${PN} = "java2-vm"
>> +PROVIDES_${PN} = "java2-vm"
>> +RPROVIDES_${PN} = "java2-runtime"
>> +PROVIDES_${PN} = "java2-runtime"
>> +
>> +inherit update-alternatives
>> +
>> +ALTERNATIVE_PRIORITY = "100"
>> +
>> +ALTERNATIVE_${PN} = "java javac"
>> +ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
>> +ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
>> +
>> +ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
>> +ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
>> diff --git a/recipes-core/openjdk/openjre-8_121b13.bb
>> b/recipes-core/openjdk/openjre-8_121b13.bb
>> new file mode 100644
>> index 0000000..9ef33e7
>> --- /dev/null
>> +++ b/recipes-core/openjdk/openjre-8_121b13.bb
>> @@ -0,0 +1,54 @@
>> +require openjdk-8-release-121b13.inc
>> +require openjdk-8-cross.inc
>> +
>> +# some patches extracted from http://cr.openjdk.java.net/~rk
>> ennke/shark-build-hotspot/webrev.01/hotspot.patch
>> +# reported via http://mail.openjdk.java.net/p
>> ipermail/build-dev/2015-January/013972.html
>> +# by Roman Kennke (rkennke at redhat.com)
>> +PATCHES_URI_append = "\
>> +    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
>> +    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no
>> \
>> +    file://openjdk8-fix-adlc-flags.patch;apply=no \
>> +    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
>> +    file://openjdk8-add-missing-linker-flags.patch;apply=no \
>> +"
>> +
>> +do_install() {
>> +    rm -rf ${D}${JRE_HOME}
>> +    mkdir -p ${D}${JRE_HOME}
>> +    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
>> +    chown -R root:root ${D}${JRE_HOME}
>> +    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
>> +}
>> +
>> +FILES_${PN}_append = "\
>> +    ${JRE_HOME}/bin/[a-z]* \
>> +    ${JRE_HOME}/lib/[a-z]* \
>> +    ${JRE_HOME}/LICENSE \
>> +    ${JRE_HOME}/release \
>> +"
>> +
>> +FILES_${PN}-dbg_append = "\
>> +    ${JRE_HOME}/bin/.debug/ \
>> +    ${JRE_HOME}/lib/.debug/ \
>> +    ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
>> +    ${JRE_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
>> +    ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
>> +"
>> +
>> +FILES_${PN}-doc_append = "\
>> +    ${JRE_HOME}/man \
>> +    ${JRE_HOME}/ASSEMBLY_EXCEPTION \
>> +    ${JRE_HOME}/THIRD_PARTY_README \
>> +"
>> +
>> +RPROVIDES_${PN} = "java2-vm"
>> +PROVIDES_${PN} = "java2-vm"
>> +RPROVIDES_${PN} = "java2-runtime"
>> +PROVIDES_${PN} = "java2-runtime"
>> +
>> +inherit update-alternatives
>> +
>> +ALTERNATIVE_${PN} = "java"
>> +ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
>> +ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
>> +ALTERNATIVE_PRIORITY[java] = "100"
>> --
>> 2.1.4
>>
>>
>
>

