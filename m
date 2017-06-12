Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id F1295782A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 18:51:12 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u101so24061784wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ut0WT6xX037rnnCtKVK2ZMr2ZR71HLGUBG0SVmxILtk=;
	b=Zj7dP0zV8GigkOcKQaG9ms5bVXiuRqrVAZvnYMlph3bpjrIN9C6KjfnOsmCCfJFi7r
	uo3QYawox0b7WqtKt6Pt5Ob/ZeVxBFYrO37Sm/cc2K2nYhCag5XFNhmMpy2Mc5DseRG+
	U1rAqeQCzjNwXDkYgwGm6bgA6wZimKBeN1nJ6uyZyUgrEaPaFSFDxXWqlTnH9DcLlF0z
	iiJUQveO8mws4qBUGb4x8+0/dE1rVaM9MZzwUA+OXyHU4ZOi5lLbEEZYs4+d+fTImN4E
	pLXeQZXXHqA7n9RFghciVR+Hbjqjn5kTcb2vlqetRt4Q/AQCEcQuUdK+hwy5Hw6JGFLC
	MFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ut0WT6xX037rnnCtKVK2ZMr2ZR71HLGUBG0SVmxILtk=;
	b=XTXJxUYa3GwSk2/j9Xdrox2nKHfGaKI/J2OjWdRTD98kk1RBRTs5T+gdPufCab71ZR
	GVg/6tzrtcM0qz4yooPgckSMyge/ual+TO7wTk2KNb9r0ceulUyM1Cu4tbJt9qywqTBL
	2A9EUkuExp5SDpqgBm9wXKorVPSI0EPwaShgMZthQVBPghBXnZXSv/Innum3vadxftZK
	ATneL/ZsPN7DWtZhybUamJTRDVTffW2j6DzaZ5tn8SbRp5IforyvIu0J2pHBPMWRENkJ
	lb9EApmp3Y6Cf6SV+a0KhXJrCXYNj4vXX+L1kfwKgzmnk9i+SLs38IvjXYnv8ZJXHb+Z
	9MAQ==
X-Gm-Message-State: AKS2vOwre28qk/ZDEl3pvxPyJYTr1KWkIMyaYrHiBwwAfUjFzPJ0t28t
	+QAU+w3nL6qQQ6jUHrQ5SscjjfNbLA==
X-Received: by 10.80.180.188 with SMTP id w57mr7658617edd.42.1497293473202;
	Mon, 12 Jun 2017 11:51:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Mon, 12 Jun 2017 11:50:42 -0700 (PDT)
In-Reply-To: <667bcd0040224328aa002e61b1fb8fb6@XBOX02.axis.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
	<1496997797.30163.181.camel@intel.com>
	<CAMKF1srK2nyrbJ8P_jzgAwHabhvMKWswxvAHm79xc+cEyaG0sA@mail.gmail.com>
	<1497018842.30163.203.camel@intel.com>
	<1497029524.30163.219.camel@intel.com>
	<1497251079.30163.233.camel@intel.com>
	<CAMKF1sp4vc10QhxkUENz2it0W5=0q+OhynG5n=rqW5iL269PpQ@mail.gmail.com>
	<667bcd0040224328aa002e61b1fb8fb6@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jun 2017 11:50:42 -0700
Message-ID: <CAMKF1so8-+YjOHuXnqoXoZPsfez8AvrVFH9SpW7iP_jk=1PmRQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: -pie in SECURITY_CFLAGS (was: Re: [meta-oe][PATCH 1/3] meson: update Meson devtool to 0.40.1)
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
X-List-Received-Date: Mon, 12 Jun 2017 18:51:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 12, 2017 at 11:23 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> This looks great, except for one thing. What about external toolchains?
>
> We use Poky's compiler when building for ARM, but when building for
> MIPS we need to use our own, which is based on gcc 4.7.2 and not
> likely to be updated. With the suggested changes to security_flags.inc
> we will no longer be able to build with hardening enabled for MIPS...
>
> Regarding your changes:
> * Wouldn't it be better to define GCCPIE as:
>     GCCPIE ??= ""
>   in meta/recipes-devtools/gcc/gcc-configure-common.inc and as:
>     GCCPIE ?= "--enable-default-pie"
>   in meta/conf/distro/include/security_flags.inc? That way it is easy
>   to disable PIE by setting GCCPIE = "" in local.conf even if other
>   hardenings are enabled by including security_flags.inc.

that seems a fine idea, I will make this change locally.

> * It is probably a bad idea to change the definition of
>   SECURITY_NO_PIE_CFLAGS to:
>     SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_CFLAGS}"
>   since it is most likely used to define SECURITY_CFLAGS in other
>   existing layers via the typical:
>     SECURITY_CFLAGS_pn-foo = "${SECURITY_NO_PIE_CFLAGS}"
>   and you will then end up with a circular definition...
>
> For backwards compatibility it might be an idea to do the following
> in security_flags.inc:
>
> GCCPIE ?= "--enable-default-pie"
>
> # SECURITY_PIE_CFLAGS is used to maintain backwards compatibility for
> # the definitions of SECURITY_CFLAGS and SECURITY_NO_PIE_CFLAGS after
> # the introduction of GCCPIE.
> SECURITY_PIE_CFLAGS ?= "${@'' if '${GCCPIE}' else '-pie -fpie'}"
> SECURITY_CFLAGS ?= "-fstack-protector-strong ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>
> That way the SECURITY_CFLAGS and SECURITY_NO_PIE_CFLAGS variables
> would keep their old values unless GCCPIE is set to something, which
> it is by default.

seems good yes, I will have run into this error once I plug in meta-oe
but was still building oe-core world.

>
> Enabling hardening but without PIE would then become:
>
> GCCPIE = ""
> SECURITY_PIE_CFLAGS = ""
>

agreed.

> //Peter
>
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: den 12 juni 2017 16:47
>> To: Patrick Ohly <patrick.ohly@intel.com>
>> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
>> devel@lists.openembedded.org
>> Subject: Re: [oe] -pie in SECURITY_CFLAGS (was: Re: [meta-oe][PATCH
>> 1/3] meson: update Meson devtool to 0.40.1)
>>
>> Patrick
>>
>> I have a patchset that is redoing the PIE hardening with using some
>> help from gcc configuration itself. with this patch almost all of the
>> NOPIE entries in secuity.inc are fixed and we get gcc to take care of
>> -pie passing to compiler and linker when needed
>>
>> This patches are done after gcc7 recipes so I will propose them after
>> gcc7 but if you are interested here is the branch
>>
>> Top 6 patches are what you want from
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/master
>>
>>
>> On Mon, Jun 12, 2017 at 12:04 AM, Patrick Ohly <patrick.ohly@intel.com>
>> wrote:
>> > On Fri, 2017-06-09 at 19:32 +0200, Patrick Ohly wrote:
>> >> On Fri, 2017-06-09 at 16:34 +0200, Patrick Ohly wrote:
>> >> > On Fri, 2017-06-09 at 13:24 +0000, Khem Raj wrote:
>> >> > >
>> >> > > On Fri, Jun 9, 2017 at 1:43 AM Patrick Ohly
>> <patrick.ohly@intel.com>
>> >> > > wrote:
>> >> > >
>> >> > >         On Wed, 2017-06-07 at 21:44 +0000, Peter Kjellerstedt
>> wrote:
>> >> > >         > My guess is that the problem stems from the fact that
>> >> > >         security_flags.inc
>> >> > >         > adds -pie (which is a linker flag) to SECURITY_CFLAGS
>> rather
>> >> > >         than
>> >> > >         > SECURITY_LDFLAGS...
>> >> > >
>> >> > >         I think I've seen that cause problems elsewhere when the
>> >> > >         CFLAGS came
>> >> > >         after -shared, because then the compiler ended up trying
>> to
>> >> > >         produce a
>> >> > >         pie executable instead of a shared library.
>> >> > >
>> >> > >         Perhaps we should finally address that in
>> security_flags.inc
>> >> > >         instead of
>> >> > >         working around it?
>> >> > >
>> >> > >
>> >> > > This patch is removing -pie from compiler and linker flags which
>> does
>> >> > > not result in intended behavior for executable when linked they
>> will
>> >> > > not be using -pie
>> >> >
>> >> > The patch had some syntax errors (fixed version below), but it had
>> the
>> >> > code which adds -pie to TARGET_LDFLAGS when it is in
>> SECURITY_CFLAGS, so
>> >> > conceptually the flag shouldn't get lost entirely.
>> >> >
>> >> > Are you saying that one cannot rely on TARGET_LDFLAGS being used
>> during
>> >> > linking?
>> >> >
>> >> > I've tested with m4, and it seems to work okay:
>> >> >
>> >> > $ grep -w -e -pie tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-
>> r0/temp/log.do_compile
>> >> > x86_64-refkit-linux-gcc  -m64 -march=corei7 -mtune=corei7 -
>> mfpmath=sse -msse4.2 --sysroot=/fast/build/refkit/intel-corei7-64/tmp-
>> glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot   -O2 -
>> pipe -g -feliminate-unused-debug-types -fdebug-prefix-
>> map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-
>> linux/m4/1.4.18-r0=/usr/src/debug/m4/1.4.18-r0 -fdebug-prefix-
>> map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-
>> linux/m4/1.4.18-r0/recipe-sysroot-native= -fdebug-prefix-
>> map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-
>> linux/m4/1.4.18-r0/recipe-sysroot=  -fstack-protector-strong -fpie -
>> D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -pie -fstack-protector-
>> strong -Wl,-z,relro,-z,now -o m4 m4.o builtin.o debug.o eval.o format.o
>> freeze.o input.o macro.o output.o path.o symtab.o ../lib/libm4.a
>> >> >
>> >> > $ file tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-
>> r0/packages-split/m4/usr/bin/m4
>> >> > tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/packages-
>> split/m4/usr/bin/m4: ELF 64-bit LSB shared object, x86-64, version 1
>> (SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2, for
>> GNU/Linux 3.2.0,
>> BuildID[sha1]=f10d0a26299dcb8c5bd0f1c82ed492aea2d8f0ac, stripped
>> >> >
>> >> > I assume "ELF 64-bit LSB shared object" instead of "ELF 64-bit LSB
>> >> > executable" means "pie executable"?
>> >>
>> >> While I don't think my patch caused -pie to get lost, unfortunately
>> I
>> >> now know that it still doesn't go into the right place in all cases.
>> For
>> >> example, ncurses puts LDFLAGS after -shared, thus triggering the
>> "main
>> >> undefined" error.
>> >>
>> >> The TOOLCHAIN_OPTIONS that Khem mentioned get appended directly
>> after
>> >> the command, so that seems like a better place for -pie than
>> LDFLAGS.
>> >> It's still a bit odd to pass a linker flag to all compiler
>> invocations,
>> >> including those that do not link, but it might be a pragmatic
>> solution
>> >> that is better than what we have now.
>> >>
>> >> However, my patch below now causes /usr/lib/libstdc++.a-gdb.py to be
>> >> built for gcc-runtime, which triggers an error:
>> >>
>> >> ERROR: gcc-runtime-6.3.0-r0 do_package: QA Issue: gcc-runtime:
>> >> Files/directories were installed but not shipped in any package:
>> >>   /usr/lib/libstdc++.a-gdb.py
>> >
>> > That's just a minor follow-up error. The real problem is that libstdc
>> > ++.so.6.0.22 was not getting built anymore. The expect .py file then
>> is
>> > libstdc++.so.6.0.22-gdb.py.
>> >
>> > I'm still unsure about the root cause. Something seems to have gone
>> > wrong when building the toolchain, because gcc-runtime doesn't even
>> have
>> > -pie in the compiler flags. From log.do_configure:
>> >
>> > checking whether the x86_64-refkit-linux-gcc  -m64 -march=corei7
>> > -mtune=corei7 -mfpmath=sse -msse4.2
>> > --sysroot=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-
>> 64-refkit-linux/gcc-runtime/6.3.0-r0/recipe-sysroot  -Wl,-z,relro,-
>> z,now linker (x86_64-refkit-linux-ld --
>> sysroot=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-
>> refkit-linux/gcc-runtime/6.3.0-r0/recipe-sysroot  -Wl,-z,relro,-z,now
>> -m elf_x86_64) supports shared libraries... no
>> > checking dynamic linker characteristics... GNU/Linux ld.so
>> > checking how to hardcode library paths into programs... unsupported
>> > checking whether stripping libraries is possible... yes
>> > checking if libtool supports shared libraries... no
>> >
>> > I'm going to put this aside for now, but I remain unhappy about how
>> we
>> > currently pass -pie in CFLAGS and the workarounds that are getting
>> used
>> > as a result of that, like disabling -pie for Python distutils. I
>> > understand that that particular change probably only affected very
>> few
>> > binaries, but it still looks like a workaround and not a proper
>> solution
>> > to me.
>> >
>> > What do others thing about the current status quo regarding -pie?
>> >
>> > --
>> > Best Regards, Patrick Ohly
>> >
>> > The content of this message is my personal opinion only and although
>> > I am an employee of Intel, the statements I make here in no way
>> > represent Intel's position on the issue, nor am I authorized to speak
>> > on behalf of Intel on this matter.
>> >
>> >
>> >

