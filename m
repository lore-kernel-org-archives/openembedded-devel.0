Return-Path: <koen.kooi@linaro.org>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 731CF600B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 07:45:01 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id qe11so4170111lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=u07oJgL7JYjj46GRv0MxykXgeQrRHwOADEBaxrjQjEc=;
	b=RI2evYm8HWiSmSQnYV/0L2dkdUcV4rKPXRjMvpTzD31fHX3fRuIWlZHwDH4uJmnPtV
	U76P7/e5xh+oexiEr1agI7tf5T+L96LhIaT9xwceO34r9CNQbdBYs5yx8Sjvu9C1Ykpa
	fV8aSYxJHZeCfgmEEHaep5c8Z1iCguk0mXrtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=u07oJgL7JYjj46GRv0MxykXgeQrRHwOADEBaxrjQjEc=;
	b=F4CqhrNoCIjJ8p2tEcB6RvDGflNjkvxL7cLcb6Jqg/bGPgIDcwE3nG0c1BULHU9JQ/
	Sqjqf6ZQ6tgjxwFxmW0Y1zDGhP/Ij0va5xlC+zXjsAkfq4oaIwH5diK39lWrrcUaqSWz
	aX6CezPjjvgwKFJ/iREH5gXumwilXGluUrxDYj7GGojCDXy5SEhdpzCmqc4LpAQ/XMX6
	75tM/v5w4iban6gnk8qp0W7MOWTqhQeQrzTijqVrdkIDFPCH97d23pRm+3B8pIHYYggy
	afCClZdxnjXaDLhDW8Aa+noynx4JEe64WxvwqiD/VDK7Be/SkilV6l/f9EFcPAIvAlrx
	kbjQ==
X-Gm-Message-State: AD7BkJKVPFb2tPc6Pr8N6Ivz0o7yNTG64zNvd04rtVUa8npZiOBzPiGlzOYnD1K/646hzgEYYs4sfdszgpjww1UT
MIME-Version: 1.0
X-Received: by 10.112.126.233 with SMTP id nb9mr558490lbb.74.1458719101956;
	Wed, 23 Mar 2016 00:45:01 -0700 (PDT)
Received: by 10.112.204.200 with HTTP; Wed, 23 Mar 2016 00:45:01 -0700 (PDT)
In-Reply-To: <CAP0W-RmQA20XfH2y8zZgb=HA2s=ZWxedtYAaCNxpt0kKOW1uuA@mail.gmail.com>
References: <1457075695-17045-1-git-send-email-koen.kooi@linaro.org>
	<20160304133409.GB2557@jama>
	<CAP0W-RkrAsFnA=FxyK+QUHDWV2UtduFLvykqC+B86gaG9vLowA@mail.gmail.com>
	<20160304150914.GF2557@jama> <20160305123304.GA2560@jama>
	<CAP0W-RmQA20XfH2y8zZgb=HA2s=ZWxedtYAaCNxpt0kKOW1uuA@mail.gmail.com>
Date: Wed, 23 Mar 2016 08:45:01 +0100
Message-ID: <CAP0W-Rk1w6CiQ_wJQ1ESEWo5BVP==yjo47uZpRExHLV2FA20Zw@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/2] efivar: update to 0.23
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
X-List-Received-Date: Wed, 23 Mar 2016 07:45:03 -0000
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 12:38, Koen Kooi <koen.kooi@linaro.org> wrote:
> On 5 March 2016 at 13:33, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Fri, Mar 04, 2016 at 04:09:14PM +0100, Martin Jansa wrote:
>>> On Fri, Mar 04, 2016 at 03:16:22PM +0100, Koen Kooi wrote:
>>> > On 4 March 2016 at 14:34, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> > > On Fri, Mar 04, 2016 at 08:14:54AM +0100, Koen Kooi wrote:
>>> > >> Upstream removed the use of the nvme headers completely, so no more conflicts. Also drop gcc options patch, ubuntu 12.04 is too old to support in meta-oe/master.
>>> > >
>>> > > This fails to build static version, when no-static-libs.inc is used
>>> > > (e.g. default in Poky).
>>> > >
>>> > > Can you either disable static in popt or change efivar to respect
>>> > > --disable-static (if possible)?
>>> >
>>> > I've patched out the static build in v3, that should fix this.
>>>
>>> Thanks for quick updated, applied in master-next with small indentation
>>> fix.
>>
>> Well, almost there
>
> I'm looking at it this week, hopefully I'll get something done before
> heading to ELC.

I can't reproduce that error locally:

Build Configuration:
BB_VERSION        = "1.29.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-22"
TARGET_SYS        = "i586-oe-linux"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta-oe
meta-filesystems
meta-initramfs
meta-webserver
meta-python
meta-networking
meta-gnome        = "HEAD:47498d15e9d68e1cc50947633aba9e2b3d29da85"
meta-aarch64
meta-ilp32
meta-bigendian
meta-linaro
meta-linaro-toolchain
meta-linaro-integration = "master:e71e6db6585f34dbab2ac4645801528614d7e274"
meta-virtualization = "HEAD:f3e598729639546303e4bf041989417efe23613d"
meta-browser      = "HEAD:a3789a4168fcd42f1cdf5b5febe2c779a9467919"
meta              = "HEAD:9c200760cbbe322ed884729eb395f389c863e1c8"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1932 tasks of which 850 didn't need to
be rerun and all succeeded.

[koen@thinkpad build]$ find build/tmp-glibc/deploy/ -name "efi*ipk"
build/tmp-glibc/deploy/ipk/aarch64/efivar-dev_0.23-r0_aarch64.ipk
build/tmp-glibc/deploy/ipk/aarch64/efibootmgr-dbg_0.12-r0_aarch64.ipk
build/tmp-glibc/deploy/ipk/aarch64/efivar-doc_0.23-r0_aarch64.ipk
build/tmp-glibc/deploy/ipk/aarch64/efivar_0.23-r0_aarch64.ipk
build/tmp-glibc/deploy/ipk/aarch64/efibootmgr_0.12-r0_aarch64.ipk
build/tmp-glibc/deploy/ipk/aarch64/efibootmgr-dev_0.12-r0_aarch64.ipk
build/tmp-glibc/deploy/ipk/aarch64/efivar-dbg_0.23-r0_aarch64.ipk
build/tmp-glibc/deploy/ipk/i586/efivar_0.23-r0_i586.ipk
build/tmp-glibc/deploy/ipk/i586/efivar-doc_0.23-r0_i586.ipk
build/tmp-glibc/deploy/ipk/i586/efivar-dev_0.23-r0_i586.ipk
build/tmp-glibc/deploy/ipk/i586/efibootmgr-dev_0.12-r0_i586.ipk
build/tmp-glibc/deploy/ipk/i586/efivar-dbg_0.23-r0_i586.ipk
build/tmp-glibc/deploy/ipk/i586/efibootmgr_0.12-r0_i586.ipk
build/tmp-glibc/deploy/ipk/i586/efibootmgr-dbg_0.12-r0_i586.ipk
[koen@thinkpad build]$


>
>>
>> one build failed with:
>> | i586-oe-linux-gcc  -m32 -march=i586
>> --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86
>> -O2 -pipe -g -feliminate-unused-debug-types
>> -fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git=/usr/src/efivar
>> -fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git=/usr/src/efivar
>> -fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux=
>> -fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86=
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git/src/include/efivar/
>> -specs=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git/gcc.specs
>> -L.  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed     -shared \
>> |         -Wl,-soname,libefivar.so.0 \
>> |         -o libefivar.so dp.o dp-acpi.o dp-hw.o dp-media.o dp-message.o
>> efivarfs.o export.o guid.o guids.o guid-symbols.o lib.o vars.o -ldl
>> |
>> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld:
>> --default-symver: unknown option
>> |
>> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld:
>> use the --help option for usage information
>> | collect2: error: ld returned 1 exit status
>> | make[1]: *** [libefivar.so] Error 1
>> | make[1]: *** Waiting for unfinished jobs....
>>
>> 2nd one failed with:
>>
>> | install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
>> | install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
>> ;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
>> ;
>> | install: cannot stat 'efivar.pc': No such file or directory
>> | install: cannot stat 'efiboot.pc': No such file or directory
>> | make[1]: *** [install] Error 1
>> | make[1]: Leaving directory `efivar/0.23-r0/git/src'
>> | make: *** [install] Error 2
>> | ERROR: oe_runmake failed
>>
>>
>>> > > 5.3.0/ld: cannot find -lpopt
>>> > > | collect2: error: ld returned 1 exit status
>>> > > | make[1]: *** [efivar-static] Error 1
>>> > > | make[1]: *** Waiting for unfinished jobs....
>>> > >
>>> > >
>>> > >>
>>> > >> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>> > >> ---
>>> > >>  .../efivar/0001-efivar-fix-for-cross-compile.patch | 21 +++----
>>> > >>  ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------------
>>> > >>  meta-oe/recipes-extended/efivar/efivar_0.21.bb     | 39 ------------
>>> > >>  meta-oe/recipes-extended/efivar/efivar_0.23.bb     | 36 +++++++++++
>>> > >>  4 files changed, 45 insertions(+), 122 deletions(-)
>>> > >>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
>>> > >>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar_0.21.bb
>>> > >>  create mode 100644 meta-oe/recipes-extended/efivar/efivar_0.23.bb
>>> > >>
>>> > >> diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>>> > >> index 4bd7d95..b02edd9 100644
>>> > >> --- a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>>> > >> +++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>>> > >> @@ -12,20 +12,17 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> > >>   1 file changed, 2 insertions(+), 2 deletions(-)
>>> > >>
>>> > >>  diff --git a/src/Makefile b/src/Makefile
>>> > >> -index 6eac858..ef4eb1d 100644
>>> > >> +index 5fc7887..1829d22 100644
>>> > >>  --- a/src/Makefile
>>> > >>  +++ b/src/Makefile
>>> > >> -@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
>>> > >> - makeguids : makeguids.o fakeguid.o
>>> > >> -     $(CC) $(cflags) -o $@ $^ -ldl
>>> > >> -
>>> > >> +@@ -29,8 +29,8 @@ all : deps $(TARGETS)
>>> > >> + ./guid-symbols.c : include/efivar/efivar-guids.h
>>> > >> + ./guids.bin : include/efivar/efivar-guids.h
>>> > >> + ./names.bin : include/efivar/efivar-guids.h
>>> > >>  -include/efivar/efivar-guids.h : makeguids guids.txt
>>> > >> --    ./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
>>> > >> +-    ./makeguids guids.txt guids.bin names.bin \
>>> > >>  +include/efivar/efivar-guids.h : guids.txt
>>> > >> -+    makeguids guids.txt guids.bin names.bin guid-symbols.S $@
>>> > >> ++    makeguids guids.txt guids.bin names.bin \
>>> > >> +             guid-symbols.c include/efivar/efivar-guids.h
>>> > >>
>>> > >> - guidlist.o : guids.S include/efivar/efivar-guids.h
>>> > >> -     $(CC) $(cflags) -c -o guidlist.o guids.S
>>> > >> ---
>>> > >> -2.6.0.rc2.10.gf4d9753
>>> > >> -
>>> > >> + makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT
>>> > >> diff --git a/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch b/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
>>> > >> deleted file mode 100644
>>> > >> index 7f04b19..0000000
>>> > >> --- a/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
>>> > >> +++ /dev/null
>>> > >> @@ -1,71 +0,0 @@
>>> > >> -gcc options '-Wmaybe-uninitialized' and '-std=gnu11' are not recognized by gcc
>>> > >> -whose version is lower than 4.6, such as on Ubuntu 12.04. Drop them for backward
>>> > >> -compatible.
>>> > >> -
>>> > >> -Upstream-Status: Pending
>>> > >> -
>>> > >> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> > >> ----
>>> > >> -diff --git a/Make.defaults b/Make.defaults
>>> > >> -index cc2baa9..118ae56 100644
>>> > >> ---- a/Make.defaults
>>> > >> -+++ b/Make.defaults
>>> > >> -@@ -10,10 +10,9 @@ CFLAGS    ?= -O2 -g
>>> > >> -
>>> > >> - ARCH = $(shell uname -m)
>>> > >> - clang_cflags =
>>> > >> --gcc_cflags = -Wmaybe-uninitialized
>>> > >> - cflags      := $(CFLAGS) \
>>> > >> -     -Werror -Wall -Wsign-compare -Wstrict-aliasing \
>>> > >> --    -std=gnu11 -fshort-wchar -fPIC \
>>> > >> -+    -fshort-wchar -fPIC \
>>> > >> -     -fvisibility=hidden \
>>> > >> -     -D_GNU_SOURCE -I${TOPDIR}/src/include/efivar/ \
>>> > >> -     $(if $(filter $(CC),clang),$(clang_cflags),) \
>>> > >> -diff --git a/src/guid.h b/src/guid.h
>>> > >> -index 9542ee1..0817991 100644
>>> > >> ---- a/src/guid.h
>>> > >> -+++ b/src/guid.h
>>> > >> -@@ -31,7 +31,8 @@ static inline int
>>> > >> - real_isspace(char c)
>>> > >> - {
>>> > >> -     char spaces[] = " \f\n\r\t\v";
>>> > >> --    for (int i = 0; spaces[i] != '\0'; i++)
>>> > >> -+    int i;
>>> > >> -+    for (i = 0; spaces[i] != '\0'; i++)
>>> > >> -             if (c == spaces[i])
>>> > >> -                     return 1;
>>> > >> -     return 0;
>>> > >> -@@ -59,7 +60,8 @@ check_sanity(const char *text, size_t len)
>>> > >> - static inline int
>>> > >> - check_segment_sanity(const char *text, size_t len)
>>> > >> - {
>>> > >> --    for(unsigned int i = 0; i < len; i++) {
>>> > >> -+    unsigned int i;
>>> > >> -+    for(i = 0; i < len; i++) {
>>> > >> -             if (text[i] >= '0' && text[i] <= '9')
>>> > >> -                     continue;
>>> > >> -             /* "| 0x20" is tolower() without having to worry about
>>> > >> -diff --git a/src/makeguids.c b/src/makeguids.c
>>> > >> -index e9acf15..7e16cb2 100644
>>> > >> ---- a/src/makeguids.c
>>> > >> -+++ b/src/makeguids.c
>>> > >> -@@ -150,7 +150,8 @@ main(int argc, char *argv[])
>>> > >> -
>>> > >> -     fprintf(header, "#ifndef EFIVAR_GUIDS_H\n#define EFIVAR_GUIDS_H 1\n\n");
>>> > >> -
>>> > >> --    for (unsigned int i = 0; i < line-1; i++) {
>>> > >> -+    unsigned int i, j;
>>> > >> -+    for (i = 0; i < line-1; i++) {
>>> > >> -             if (!strcmp(outbuf[i].symbol, "efi_guid_zero"))
>>> > >> -                     fprintf(symout, "\t.globl %s\n"
>>> > >> -                                     "\t.data\n"
>>> > >> -@@ -176,7 +177,7 @@ main(int argc, char *argv[])
>>> > >> -                     fprintf(symout, "efi_guid_empty:\n");
>>> > >> -
>>> > >> -             uint8_t *guid_data = (uint8_t *) &outbuf[i].guid;
>>> > >> --            for (unsigned int j = 0; j < sizeof (efi_guid_t); j++)
>>> > >> -+            for (j = 0; j < sizeof (efi_guid_t); j++)
>>> > >> -                     fprintf(symout,"\t.byte 0x%02x\n", guid_data[j]);
>>> > >> -
>>> > >> -             fprintf(symout, "%s_end:\n", outbuf[i].symbol);
>>> > >> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>>> > >> deleted file mode 100644
>>> > >> index f7a4d55..0000000
>>> > >> --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>>> > >> +++ /dev/null
>>> > >> @@ -1,39 +0,0 @@
>>> > >> -SUMMARY = "Tools to manipulate UEFI variables"
>>> > >> -DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
>>> > >> -HOMEPAGE = "https://github.com/rhinstaller/efivar"
>>> > >> -
>>> > >> -LICENSE = "LGPLv2.1"
>>> > >> -LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
>>> > >> -
>>> > >> -DEPENDS_class-target = "popt efivar-native"
>>> > >> -
>>> > >> -SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
>>> > >> -SRC_URI = "git://github.com/rhinstaller/efivar.git"
>>> > >> -SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
>>> > >> -SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
>>> > >> -
>>> > >> -S = "${WORKDIR}/git"
>>> > >> -
>>> > >> -do_install() {
>>> > >> -    oe_runmake install DESTDIR=${D}
>>> > >> -}
>>> > >> -
>>> > >> -do_compile_class-native() {
>>> > >> -    oe_runmake -C src makeguids
>>> > >> -}
>>> > >> -
>>> > >> -do_install_class-native() {
>>> > >> -    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
>>> > >> -}
>>> > >> -
>>> > >> -BBCLASSEXTEND = "native"
>>> > >> -
>>> > >> -# See
>>> > >> -# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116564.html
>>> > >> -# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116571.html
>>> > >> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105802.html
>>> > >> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105786.html
>>> > >> -# but it's still broken:
>>> > >> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105825.html
>>> > >> -# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105830.html
>>> > >> -PNBLACKLIST[efivar] ?= "BROKEN: linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or directory"
>>> > >> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
>>> > >> new file mode 100644
>>> > >> index 0000000..faffb79
>>> > >> --- /dev/null
>>> > >> +++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
>>> > >> @@ -0,0 +1,36 @@
>>> > >> +SUMMARY = "Tools to manipulate UEFI variables"
>>> > >> +DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
>>> > >> +HOMEPAGE = "https://github.com/rhinstaller/efivar"
>>> > >> +
>>> > >> +LICENSE = "LGPLv2.1"
>>> > >> +LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
>>> > >> +
>>> > >> +DEPENDS_class-target = "popt efivar-native"
>>> > >> +
>>> > >> +SRCREV = "01abee43d6d6e755f56a4135ab5aa0bfad609ce2"
>>> > >> +SRC_URI = "git://github.com/rhinstaller/efivar.git"
>>> > >> +SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
>>> > >> +
>>> > >> +S = "${WORKDIR}/git"
>>> > >> +
>>> > >> +# Setting CROSS_COMPILE breaks pkgconfig, so just set AR
>>> > >> +EXTRA_OEMAKE = "AR=${TARGET_PREFIX}gcc-ar"
>>> > >> +
>>> > >> +do_compile_prepend() {
>>> > >> +    sed -i -e s:-Werror::g ${S}/gcc.specs
>>> > >> +}
>>> > >> +
>>> > >> +do_compile_class-native() {
>>> > >> +    oe_runmake -C src makeguids
>>> > >> +}
>>> > >> +
>>> > >> +do_install() {
>>> > >> +    oe_runmake install DESTDIR=${D}
>>> > >> +}
>>> > >> +
>>> > >> +do_install_class-native() {
>>> > >> +    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
>>> > >> +}
>>> > >> +
>>> > >> +BBCLASSEXTEND = "native"
>>> > >> +
>>> > >> --
>>> > >> 2.4.3
>>> > >>
>>> > >> --
>>> > >> _______________________________________________
>>> > >> Openembedded-devel mailing list
>>> > >> Openembedded-devel@lists.openembedded.org
>>> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>> > >
>>> > > --
>>> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>> >
>>> >
>>> >
>>> > --
>>> > Koen Kooi
>>> >
>>> > Builds and Baselines | Release Manager
>>> > Linaro.org | Open source software for ARM SoCs
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>>
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> --
> Koen Kooi
>
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs



-- 
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

