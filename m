Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 72CBE78D5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:02:20 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id v17-v6so6928258qkb.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 21:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=enq8xN9lavY/KRHNRz9doZn8ntkUytQk0eyC/AUDU2k=;
	b=gJjlfdpCXHUeFzXY9GzgROcjWuVjzd3q8HoOiYD2I7okhd9UpGAjtaJ9bSNMnmmmqq
	42DPpDqR3IMrhfJzd/T7ekn/H0ulf7YNtwJMu7cAYpgE61Ji0a+Oyz15uk6KBmoTFbf0
	J7n7GEhzZ2gXlHPhLlFiwXmnkCHmte+84TRtzaZ5YMxnZRI5PijMXTeoi03kSUIaZwFZ
	pkOiDA/HLArAR8omqvbpAEJ9g1iAPMWRKe1PAij5djUeduovE3OxdgK0yHb9i1BUEfV9
	ggwwOkCaW2H4lFyy5O4Pre9WPdi9PedQ2/z5Xjhgy3BUThm/7TVt0Fow/ri5GNeKjjXb
	YvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=enq8xN9lavY/KRHNRz9doZn8ntkUytQk0eyC/AUDU2k=;
	b=BO3QtlMjny6t1rh7Qyj/HoKZJ0uVpboJ1qP8F24/auBxKy4ETn7/BNYib7Gjxanx4W
	09Kvo4K7ZZ7UeBAtMJRIMpAHfvnyuKBCrlmc1+a+/Sf3zaxbTG/fmhcGn6bERKoLEj2b
	gKH7Yj/N1hn4B6uC8WMpg1QjdBKmDR9X3JZkHB26dFhd914i9GCN+1xyzZjq214uQTM0
	xtDeyhfDY4CJSNFGU552KxlwcjWFXjRxFoMi8h1GeKuC+H3hDC1qC/Xawf/bZtEBC7ri
	fFRMcC6htKEe4EswHBWf+Bqi6tNzAkW0XVE9/BL4s6jZ5VCs7e5tT9JL2aHGtMdom7Oo
	49wA==
X-Gm-Message-State: AOUpUlHZOyiBW1+rs5yDGJUffYrpDeCdUbozdXGDN8UsFrjuF2/1YO13
	OBgMEEd0EyG7nH24ipmusX18HicBsPSxjLVMpfw=
X-Google-Smtp-Source: AAOMgpdqSqzkrWDpdLer+DEOOqAnIbwWvKWGHODi3X9JLefOjSwTLsQh/IRAyyhK/fVpRVmvYNmeH7gbT1FI4wxZSLQ=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr13656419qke.12.1532923340969;
	Sun, 29 Jul 2018 21:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
	<20180713140616.15664-2-hongzhi.song@windriver.com>
	<CAJTo0LbXD42g6wJ4z3Kgg+TXSRaAueLgWzYjkkdq13YO3aVb+Q@mail.gmail.com>
	<37cf1c1d-c607-6ba3-20f0-8fe9e46706f1@windriver.com>
	<CAMKF1soQMbp7urcfEd0ri3XCQ=oyP_BwqJkoEDi8zDS1O4KqJg@mail.gmail.com>
	<729ad129-04ef-77b7-a70e-775e63a4b7d7@windriver.com>
	<c58c0d27-080b-8ed9-6680-2e4b566b2811@windriver.com>
In-Reply-To: <c58c0d27-080b-8ed9-6680-2e4b566b2811@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jul 2018 21:02:10 -0700
Message-ID: <CAMKF1so=Z61q3ZqGmmv6pzht5b9CK1_CFofNA9yKdXE-orX_3A@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Mon, 30 Jul 2018 04:02:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can not get it compiling for musl and rpi with poky lsb equivalent distro
until there are clean builds it won=E2=80=99t be possible for me to get thi=
s in

On Sun, Jul 29, 2018 at 8:34 PM Hongzhi, Song <hongzhi.song@windriver.com>
wrote:

> ping
>
> --Hongzhi
>
>
> On 2018=E5=B9=B407=E6=9C=8827=E6=97=A5 17:00, Hongzhi, Song wrote:
> > Hi Raj,
> >
> > Could you help to confirm that if the libelf exists in your
> > recipe-sysroot?
> >
> > Because I can't reproduce your error.
> >
> >
> > --Hongzhi
> >
> >
> > On 2018=E5=B9=B407=E6=9C=8827=E6=97=A5 16:40, Khem Raj wrote:
> >> this fails on rpi
> >>
> >> ERROR: Logfile of failure stored in:
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/temp/log.do_compile.22198
>
> >>
> >> Log data follows:
> >> | DEBUG: Executing shell function do_compile
> >> | NOTE: make -j 16 CROSS_COMPILE=3Darm-bec-linux-gnueabi- ARCH=3Darm
> >> CC=3Darm-bec-linux-gnueabi-gcc  -march=3Darmv7ve -mthumb -mfpu=3Dneon-=
vfpv4
> >> -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -fstack-protector-strong
> >> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secu=
rity
> >> -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
> >> -Wformat-security -Werror=3Dformat-security
> >>
> --sysroot=3D/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kerne=
l-selftest/1.0-r0/recipe-sysroot
>
> >>
> >> AR=3Darm-bec-linux-gnueabi-ar LD=3Darm-bec-linux-gnueabi-ld
> >>
> --sysroot=3D/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kerne=
l-selftest/1.0-r0/recipe-sysroot
>
> >>
> >>
> DESTDIR=3D/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-=
selftest/1.0-r0/image
> >> -C
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf
> >> | make: Entering directory
> >>
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/=
1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
>
> >>
> >> | make -C ../../../lib/bpf
> >>
> OUTPUT=3D/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-s=
elftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/
>
> >>
> >> | make[1]: Entering directory
> >>
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/=
1.0-r0/kernel-selftest-1.0/tools/lib/bpf'
>
> >>
> >> |
> >> | Auto-detecting system features:
> >> | ...                        libelf: [ ^[[31mOFF^[[m ]
> >> | ...                           bpf: [ ^[[31mOFF^[[m ]
> >> |
> >> | BPF API too old
> >> | make[1]: *** [Makefile:219: bpfdep] Error 255
> >> | make[1]: *** Waiting for unfinished jobs....
> >> | No libelf found
> >> | make[1]: *** [Makefile:216: elfdep] Error 255
> >> |   HOSTCC
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/fixdep.o
> >> |   HOSTLD
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/fixdep-in.o
> >> |   LINK
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/fixdep
> >> | make[1]: Leaving directory
> >>
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/=
1.0-r0/kernel-selftest-1.0/tools/lib/bpf'
>
> >>
> >> | make: *** [Makefile:33:
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/libbpf.a]
>
> >>
> >> Error 2
> >> | make: Leaving directory
> >>
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/=
1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
>
> >>
> >> | ERROR: oe_runmake failed
> >> | WARNING:
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/temp/run.do_compile.22198:1
> >> exit 1 from 'exit 1'
> >> | ERROR: Function failed: do_compile (log file is located at
> >>
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1=
.0-r0/temp/log.do_compile.22198)
>
> >>
> >>
> >> On Mon, Jul 16, 2018 at 2:51 AM Hongzhi, Song
> >> <hongzhi.song@windriver.com> wrote:
> >>>
> >>>
> >>> On 2018=E5=B9=B407=E6=9C=8814=E6=97=A5 00:23, Burton, Ross wrote:
> >>>> On 13 July 2018 at 15:06, Hongzhi.Song <hongzhi.song@windriver.com>
> >>>> wrote:
> >>>>> +LIC_FILES_CHKSUM =3D
> >>>>> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7 \
> >>>> Why are you shipping your own copy of the kernel's COPYING file even
> >>>> though you copy another in that prefunc?
> >>>>
> >>>> Isn't it possible to just depend on kernel-source and build directly
> >>>> from the kernel source tree?
> >>>>
> >>>>> +# for bpf and vm
> >>>>> +DEPENDS =3D " \
> >>>>> +    elfutils \
> >>>>> +    libcap \
> >>>>> +    libcap-ng \
> >>>>> +    fuse \
> >>>>> +    util-linux \
> >>>>> +    rsync-native \
> >>>>> +"
> >>>> Really not convinced these dependencies are accurate.
> >>>>
> >>>>> +TEST_LIST =3D "bpf \
> >>>>> +             vm \
> >>>>> +"
> >>>> You're not listing memfd in here, but that is the only place which
> >>>> uses fuse as far as I can tell.
> >>>>
> >>>> My suggestion is to trim the DEPENDS back to the core minimum and us=
e
> >>>> PACKAGECONIG to select what directories get built. This means you ca=
n
> >>>> have optional test suites where the dependencies are not in oe-core
> >>>> (fuse for memfd, for example), and get the right RDEPENDS too.
> >>>>
> >>>>> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
> >>>>> INSTALL_PATH=3D${D}/opt/kselftest/${i} install
> >>>> FHS says /opt is for sysadmin-installed tools that are not package
> >>>> managed.  You're building a package.  You're also building a package
> >>>> which is essentially ptest.  I'd say inherit ptest, write a runner,
> >>>> and put all the binaries in $PTESTDIR.
> >>> Hi Burton,
> >>>
> >>> kernel-selftest is designed to be shared by ptest and oe-self, and
> >>> thus is
> >>> not supposed to inherit ptest.
> >>>
> >>> The suggestions you mentioned above will be modified soon.
> >>>
> >>> --Hongzhi
> >>>
> >>>> Ross
> >>>>
> >
>
>

