Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC8879448
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 10:59:01 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id h69-v6so5448044pfd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lFyMlKbxrYm6FVyMw3asFPqPA7P7+zziallVnRKu0IM=;
	b=D0j7N1So8bUKXwUaOsX40Vau/W1qDC1xtcQqz8Lu9VoLO4mkTaxKRuzrrGJZiZRATE
	/2Az/3p0ohqdL9NoSKEEVMih734KE+s1Vdzv9z4iKxYlvia4ul8I+PigLfucdZ3bWg/u
	2xzGdw6+cHAN01EtEUlMVJnFVtRXCFYPDlIGBeYWRD36O1DtDvy7DBKo/UZlTGem/fWF
	m6hclx+4cLRijZg9Fjr3kbUqozEATeeO02DGxtu7c716Gj5ohGfGow3cRBzpcprAnQVW
	mJ+ttzARAmUJOxNtZcG3bEdtmrAVoqeP3o+0g2SDoKjM31SMT8MbPXwiiKOBFeZlslMp
	p4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lFyMlKbxrYm6FVyMw3asFPqPA7P7+zziallVnRKu0IM=;
	b=teS2R74vAtHrLQmvehEUI7C4BLlUkr1WW+CxOVwiGIG1kyv3TvcpHkfaezDIU1ldop
	GdISaIPUE0Wb4jKuPUBan8ZIKdj3tqd928gt8J0RbcdNeTKpM4cTXxgVrzoDY12G/5TE
	KnMHsyMgw8GK+R3M8cO2zle7zsXxsEMpTxbglLXAt9nx1lOmRHGjonrakZvN139JmBhd
	YsHig+zsBKB0dztt0zuAY2e8W2YsZcaPCnyXK9qTtRgz9S3tGpQHh1VfMJqcej8NMlMk
	3i7DhfWFHoG+VxiSgipPxzpZtW7yBXMCdCFgBMJ8Lr7xsxEQJYlfZKfg42t+SYMHE7yZ
	e7qg==
X-Gm-Message-State: APzg51DhSmtGEYQyO3XZ/NQ9wA/xyydsl7l6exxnohv/efSaK/hQKQ9K
	s0cCHxhg7Gq3BS2DVTUxjh7iXsbrszkMT2L6TED6YM8O
X-Google-Smtp-Source: ANB0VdZuMkNZsZXm+dwLou8C6kr/wdt7OOkW3XzMxTBfYlOc0B/N/LnBXZDGGxpEwP8rc6NivpB2gyEqR0fe+8eKMmM=
X-Received: by 2002:a63:2e09:: with SMTP id
	u9-v6mr15917878pgu.294.1537009142588; 
	Sat, 15 Sep 2018 03:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <1536948135-11493-1-git-send-email-andrea.adami@gmail.com>
	<e7e25946-8c75-4cd6-9b1b-3aaa6fdd4a5b@windriver.com>
In-Reply-To: <e7e25946-8c75-4cd6-9b1b-3aaa6fdd4a5b@windriver.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 15 Sep 2018 12:58:50 +0200
Message-ID: <CAAQYJAutgBtf4bmNagBkAo4ATnbC_P_4B4R31mzM_5bRKyHAxQ@mail.gmail.com>
To: hongxu.jia@windriver.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH v2] klibc: fix build on i386 with GCC and security flags enabled
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
X-List-Received-Date: Sat, 15 Sep 2018 10:59:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2018 at 10:15 AM Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
>
> On 2018=E5=B9=B409=E6=9C=8815=E6=97=A5 02:02, Andrea Adami wrote:
> > ld fails if distro's security-flags are enabled:
> > Inject the SECURITY_XFLAGS if security_flags.inc was included.
> >
> > Fix on i386: ld: discarded output section: `.got.plt'
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >   meta-initramfs/recipes-devtools/klibc/klibc.inc | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-ini=
tramfs/recipes-devtools/klibc/klibc.inc
> > index 3d25e96..837b026 100644
> > --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > @@ -47,7 +47,8 @@ EXTRA_OEMAKE =3D "'KLIBCARCH=3D${KLIBC_ARCH}' \
> >                   'KLIBCOPTFLAGS=3D${TUNE_CCARGS}' \
> >                    V=3D1 \
> >                   "
> > -EXTRA_OEMAKE +=3D 'EXTRA_KLIBCAFLAGS=3D"-Wa,--noexecstack" EXTRA_KLIBC=
LDFLAGS=3D"-z noexecstack"'
> > +EXTRA_OEMAKE +=3D "'EXTRA_KLIBCAFLAGS=3D${SECURITY_CFLAGS} -Wa,--noexe=
cstack' \
> > +                 'EXTRA_KLIBCLDFLAGS=3D${SECURITY_LDFLAGS} -z noexecst=
ack'"
> >
> Is it necessary to pass SECURITY_XFLAGS directly? While including
> security_flags.inc,
> CC will contain SECURITY_CFLAGS and LDFLAGS will contain SECURITY_LDFLAGS=
.
> Maybe you should make sure  to pass LDFLAGS to EXTRA_KLIBCLDFLAGS to avoi=
d
> ldflags qa warning.
>
> [security_flags.inc]
>   58 TARGET_CC_ARCH_append_class-target =3D " ${SECURITY_CFLAGS}"
>   59 TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
> [security_flags.inc]
>
> >   export FIX_ARMV4_EABI_BX =3D "${FIX_V4BX}"
> >   KLIBCTHUMB =3D "${@['CONFIG_KLIBC_THUMB=3Dn', 'CONFIG_KLIBC_THUMB=3Dy=
'][(d.getVar('ARM_INSTRUCTION_SET') =3D=3D 'thumb')]}"
> > @@ -74,5 +75,4 @@ KLIBC_ARCH_powerpc =3D "ppc"
> >   KLIBC_ARCH_powerpc64 =3D "ppc64"
> >   THIS_LIBKLIBC =3D "libklibc (=3D ${PV}-${PR})"
> >
> > -SECURITY_CFLAGS =3D "-fno-PIE -no-pie"
> > -SECURITY_LDFLAGS =3D "-no-pie"
> > +SECURITY_LDFLAGS =3D "${@'-z relro -z now -pie' if '${GCCPIE}' else ''=
}"
>
> The same reason, it is not necessary to test GCCPIE,
>
> and it missed "-Wl,"?, how about directly set SECURITY_STACK_PROTECTOR =
=3D ""
>
Hi,
thanks for reviewing.

It is true the SECURITY_CFLAGS are passed to the compiler.
The problem is, klibc has its own arch makefiles (MCONFIG) and the
linker is called directly, so if you just append the LDFLAGS like
this:

EXTRA_OEMAKE +=3D "'EXTRA_KLIBCAFLAGS=3D-Wa,--noexecstack' \
                 'EXTRA_KLIBCLDFLAGS=3D${LDFLAGS} -z noexecstack'"

you get:

  i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/static/ipconf=
ig -W
l,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -z relro -z now -pie -z noexec=
stack u
sr/klibc/arch/i386/crt0.o --start-group  usr/kinit/ipconfig/main.o usr/kini=
t/ipc
onfig/netdev.o usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o =
usr/k
init/ipconfig/bootp_proto.o  usr/klibc/libc.a /tmp/build/tmp-musl/work/i586=
-oe-l
inux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc=
.a --
end-group ; cp -f usr/kinit/ipconfig/static/ipconfig usr/kinit/ipconfig/sta=
tic/i
pconfig.g ; i586-oe-linux-musl-strip --strip-all -R .comment -R .note --str=
ip-al
l -R .comment -R .note --strip-all -R .comment -R .note usr/kinit/ipconfig/=
stati
c/ipconfig
i586-oe-linux-musl-ld.bfd: unrecognized option '-Wl,-O1'

Thus I am expliciting the SECURITY_LDFLAGS.

Note that this patch, injecting the -pie, does now break build for mips,
because the MCONFIG foir mips disables pic.
The immediate fix is to remove -pie for mips (standard behavior).

Cheers
Andrea


>
> //Hongxu
>

