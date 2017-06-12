Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E10877E06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:47:35 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x81so9639659lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HoleINymNU/Sa1LnHL54uwvwF78d/DQ/OFGnpumZtZ4=;
	b=n5HUjDhjFZvZvP4ElwY3AUZcNbsbO2bV6xadU6J2haKadM+24KNmZ1OwnFPRFfHme1
	nn0Uwc5Z4YZj/aZzqABbvmeoXNnGkYTNU+xYJVOIoYAncjduYliHujL4y1Q+g7Mhns9H
	X6MRtHfGnYoaDn8+FptwsqDV8Sof2CO5MCoqJ795UBbh7n8/RHfGg19rDglUXwT4vPz/
	9HGm/ugkypWzNbS5eRmcAwrKisxXoKgcp5/IC+fdgJvdSHvfgI2Q/J8m/blZhKEMX+UJ
	J4WM7qWfI84nIISnz38ARqaENSjOqaJnVqmhznJZQvO9pseqdry1bATmZ2Wzxyj+NC2Q
	8fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HoleINymNU/Sa1LnHL54uwvwF78d/DQ/OFGnpumZtZ4=;
	b=Ayjbn4twnNhqeVn8QTj0qUdPhXBObJQr+UajUL7GYT5RUOcV/oOM6NyRaNd1TJBMFI
	F+SPbie2wg2saqTTUdBdziH857cIwC8t9bA3R1GGX5nVUiAkwd5ZZsl7n2G4qqJ0znER
	KhD5rfznCuZkOc9WDl22+Wfj84CcIbFFSu22jIWzf18etOtNZbQskxArvUMx/Vi4ahph
	k4U1osMU5s2zDCnuuKnjmv4Od2MQF58mfOez/0X2FNwzTcD6nYF3DosXtzxlnK4H7HsT
	joY8HjniwUjN5M14Jf1UDPcbeK7AuR0rgPxNPIv7Y/22bTjl5UtbXueb9ij9FP0jA3mm
	5InA==
X-Gm-Message-State: AODbwcDoSwqroc2n1a/ztULF1h+Ecuarx7mgqbGmImC/Q/pXdtMy7IeZ
	d7JsSmwKGYRxeL9QNWkPrOsbJjQl4A==
X-Received: by 10.80.137.36 with SMTP id e33mr29463391ede.67.1497278856610;
	Mon, 12 Jun 2017 07:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Mon, 12 Jun 2017 07:47:06 -0700 (PDT)
In-Reply-To: <1497251079.30163.233.camel@intel.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
	<1496997797.30163.181.camel@intel.com>
	<CAMKF1srK2nyrbJ8P_jzgAwHabhvMKWswxvAHm79xc+cEyaG0sA@mail.gmail.com>
	<1497018842.30163.203.camel@intel.com>
	<1497029524.30163.219.camel@intel.com>
	<1497251079.30163.233.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jun 2017 07:47:06 -0700
Message-ID: <CAMKF1sp4vc10QhxkUENz2it0W5=0q+OhynG5n=rqW5iL269PpQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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
X-List-Received-Date: Mon, 12 Jun 2017 14:47:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patrick

I have a patchset that is redoing the PIE hardening with using some help
from gcc configuration itself. with this patch almost all of the NOPIE entr=
ies
in secuity.inc are fixed and we get gcc to take care of -pie passing to com=
piler
and linker when needed

This patches are done after gcc7 recipes so I will propose them after gcc7 =
but
if you are interested here is the branch

Top 6 patches are what you want from
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/master


On Mon, Jun 12, 2017 at 12:04 AM, Patrick Ohly <patrick.ohly@intel.com> wro=
te:
> On Fri, 2017-06-09 at 19:32 +0200, Patrick Ohly wrote:
>> On Fri, 2017-06-09 at 16:34 +0200, Patrick Ohly wrote:
>> > On Fri, 2017-06-09 at 13:24 +0000, Khem Raj wrote:
>> > >
>> > > On Fri, Jun 9, 2017 at 1:43 AM Patrick Ohly <patrick.ohly@intel.com>
>> > > wrote:
>> > >
>> > >         On Wed, 2017-06-07 at 21:44 +0000, Peter Kjellerstedt wrote:
>> > >         > My guess is that the problem stems from the fact that
>> > >         security_flags.inc
>> > >         > adds -pie (which is a linker flag) to SECURITY_CFLAGS rath=
er
>> > >         than
>> > >         > SECURITY_LDFLAGS...
>> > >
>> > >         I think I've seen that cause problems elsewhere when the
>> > >         CFLAGS came
>> > >         after -shared, because then the compiler ended up trying to
>> > >         produce a
>> > >         pie executable instead of a shared library.
>> > >
>> > >         Perhaps we should finally address that in security_flags.inc
>> > >         instead of
>> > >         working around it?
>> > >
>> > >
>> > > This patch is removing -pie from compiler and linker flags which doe=
s
>> > > not result in intended behavior for executable when linked they will
>> > > not be using -pie
>> >
>> > The patch had some syntax errors (fixed version below), but it had the
>> > code which adds -pie to TARGET_LDFLAGS when it is in SECURITY_CFLAGS, =
so
>> > conceptually the flag shouldn't get lost entirely.
>> >
>> > Are you saying that one cannot rely on TARGET_LDFLAGS being used durin=
g
>> > linking?
>> >
>> > I've tested with m4, and it seems to work okay:
>> >
>> > $ grep -w -e -pie tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/t=
emp/log.do_compile
>> > x86_64-refkit-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=
=3Dsse -msse4.2 --sysroot=3D/fast/build/refkit/intel-corei7-64/tmp-glibc/wo=
rk/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot   -O2 -pipe -g -felim=
inate-unused-debug-types -fdebug-prefix-map=3D/fast/build/refkit/intel-core=
i7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0=3D/usr/src/debug/m=
4/1.4.18-r0 -fdebug-prefix-map=3D/fast/build/refkit/intel-corei7-64/tmp-gli=
bc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot-native=3D -fdebu=
g-prefix-map=3D/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-=
refkit-linux/m4/1.4.18-r0/recipe-sysroot=3D  -fstack-protector-strong -fpie=
 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security=
  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -pie -fstack-protector-str=
ong -Wl,-z,relro,-z,now -o m4 m4.o builtin.o debug.o eval.o format.o freeze=
.o input.o macro.o output.o path.o symtab.o ../lib/libm4.a
>> >
>> > $ file tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/packages-spl=
it/m4/usr/bin/m4
>> > tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/packages-split/m4/u=
sr/bin/m4: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamica=
lly linked, interpreter /lib/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, Bui=
ldID[sha1]=3Df10d0a26299dcb8c5bd0f1c82ed492aea2d8f0ac, stripped
>> >
>> > I assume "ELF 64-bit LSB shared object" instead of "ELF 64-bit LSB
>> > executable" means "pie executable"?
>>
>> While I don't think my patch caused -pie to get lost, unfortunately I
>> now know that it still doesn't go into the right place in all cases. For
>> example, ncurses puts LDFLAGS after -shared, thus triggering the "main
>> undefined" error.
>>
>> The TOOLCHAIN_OPTIONS that Khem mentioned get appended directly after
>> the command, so that seems like a better place for -pie than LDFLAGS.
>> It's still a bit odd to pass a linker flag to all compiler invocations,
>> including those that do not link, but it might be a pragmatic solution
>> that is better than what we have now.
>>
>> However, my patch below now causes /usr/lib/libstdc++.a-gdb.py to be
>> built for gcc-runtime, which triggers an error:
>>
>> ERROR: gcc-runtime-6.3.0-r0 do_package: QA Issue: gcc-runtime:
>> Files/directories were installed but not shipped in any package:
>>   /usr/lib/libstdc++.a-gdb.py
>
> That's just a minor follow-up error. The real problem is that libstdc
> ++.so.6.0.22 was not getting built anymore. The expect .py file then is
> libstdc++.so.6.0.22-gdb.py.
>
> I'm still unsure about the root cause. Something seems to have gone
> wrong when building the toolchain, because gcc-runtime doesn't even have
> -pie in the compiler flags. From log.do_configure:
>
> checking whether the x86_64-refkit-linux-gcc  -m64 -march=3Dcorei7
> -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2
> --sysroot=3D/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-r=
efkit-linux/gcc-runtime/6.3.0-r0/recipe-sysroot  -Wl,-z,relro,-z,now linker=
 (x86_64-refkit-linux-ld --sysroot=3D/fast/build/refkit/intel-corei7-64/tmp=
-glibc/work/corei7-64-refkit-linux/gcc-runtime/6.3.0-r0/recipe-sysroot  -Wl=
,-z,relro,-z,now   -m elf_x86_64) supports shared libraries... no
> checking dynamic linker characteristics... GNU/Linux ld.so
> checking how to hardcode library paths into programs... unsupported
> checking whether stripping libraries is possible... yes
> checking if libtool supports shared libraries... no
>
> I'm going to put this aside for now, but I remain unhappy about how we
> currently pass -pie in CFLAGS and the workarounds that are getting used
> as a result of that, like disabling -pie for Python distutils. I
> understand that that particular change probably only affected very few
> binaries, but it still looks like a workaround and not a proper solution
> to me.
>
> What do others thing about the current status quo regarding -pie?
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>

