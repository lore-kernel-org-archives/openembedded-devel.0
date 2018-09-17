Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF7B71AC1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 13:09:15 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id f6-v6so7417405plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U4F8my6Xq2x9UT6n1ntcccMjv1Iliwefss4lUrF9+nU=;
	b=fXAo76dMgyaiZYC2MagZ/knb/QFEcEgV2ZXztAYIS/QAi/NdctDnP/GMUmPE99QVne
	McQbwwAA7qM4GRUSK0OGZFVdvnUWCkOeesd5ODbYOZ47hiSK/qzcU8zO7QvMGHF7UPz/
	yD8jsXgvMIYWQmubEaLr2oQD2Y1IkjxRUzogooausjIj/kMZEaC7PDSqqpAVxiI+wehX
	xO9l3WDJtH4iDqPWqzvTaBfV5jYLh+Hp5sgjnfWLf0gBpyxi3ixcUg/U2dnWbcFuHN1r
	Wge3c4+U9E+lpXz8OXzRIbPn+ybewE1213ewbd472CLyI+Manm+81KGtNBsUnuMM8R+T
	GpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U4F8my6Xq2x9UT6n1ntcccMjv1Iliwefss4lUrF9+nU=;
	b=cJQcXtdppESsCwKu5KbQ9P6I2tQ91oqYGF3d8hP05zDu4+IX9pV/5Ki0bXtddMMeqp
	FcCEYCTiS2jcMpk72Bf174Yp7Z4KKbQqYAgqLdXPh7cM4ksbLZBa247uWVZhdkce7iMy
	kH0Nb+h7AMxRAvnHdM6BqQE4HDKDvab+xuu2VBViQiytwEL6seDz2xUd4dzhzAdzhgyR
	romtZvJkcHFiXjXEilzWhXdBAtaC5Sf1MWUpu7pAvy+CD4JJ16OhJfQmCM4nzm+kBgeL
	ws4YAko2ExG/Fy8T9edsJtzwx522IskRiB3p5bCqOsDVXB4fGJ+QxnfQh62iiwhLjQbv
	a8sg==
X-Gm-Message-State: APzg51BwgDqJMIFtfllQu8ozSoT8jEVsU9OKa4jAu4837cU76B1o3B4I
	DHaTt8jDCEHC6UMZI8StqUvLUxrLJba66nwsqVM=
X-Google-Smtp-Source: ANB0Vdbcj3n5kQQ4pPMLz2M+ohUZLKT81MP5tvd7uRjkmtT8d2ZIBIf1E6QsQG2VYQ7Aj4GqZ71UtAI3ww5cOuHI9do=
X-Received: by 2002:a17:902:1c5:: with SMTP id
	b63-v6mr25121744plb.82.1537189757090; 
	Mon, 17 Sep 2018 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <1536948135-11493-1-git-send-email-andrea.adami@gmail.com>
	<e7e25946-8c75-4cd6-9b1b-3aaa6fdd4a5b@windriver.com>
	<CAAQYJAutgBtf4bmNagBkAo4ATnbC_P_4B4R31mzM_5bRKyHAxQ@mail.gmail.com>
	<fae3f605-3c1a-e0cb-209f-5d2aca70e075@windriver.com>
In-Reply-To: <fae3f605-3c1a-e0cb-209f-5d2aca70e075@windriver.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 17 Sep 2018 15:09:04 +0200
Message-ID: <CAAQYJAs8ucjfYFFzDrzG9mGN8crk1yz_9sOC7-qRG=fNWqfaFw@mail.gmail.com>
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
X-List-Received-Date: Mon, 17 Sep 2018 13:09:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2018 at 1:30 PM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> On 2018=E5=B9=B409=E6=9C=8815=E6=97=A5 18:58, Andrea Adami wrote:
> > On Sat, Sep 15, 2018 at 10:15 AM Hongxu Jia <hongxu.jia@windriver.com> =
wrote:
> >> On 2018=E5=B9=B409=E6=9C=8815=E6=97=A5 02:02, Andrea Adami wrote:
> >>> ld fails if distro's security-flags are enabled:
> >>> Inject the SECURITY_XFLAGS if security_flags.inc was included.
> >>>
> >>> Fix on i386: ld: discarded output section: `.got.plt'
> >>>
> >>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >>> ---
> >>>    meta-initramfs/recipes-devtools/klibc/klibc.inc | 6 +++---
> >>>    1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-i=
nitramfs/recipes-devtools/klibc/klibc.inc
> >>> index 3d25e96..837b026 100644
> >>> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> >>> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> >>> @@ -47,7 +47,8 @@ EXTRA_OEMAKE =3D "'KLIBCARCH=3D${KLIBC_ARCH}' \
> >>>                    'KLIBCOPTFLAGS=3D${TUNE_CCARGS}' \
> >>>                     V=3D1 \
> >>>                    "
> >>> -EXTRA_OEMAKE +=3D 'EXTRA_KLIBCAFLAGS=3D"-Wa,--noexecstack" EXTRA_KLI=
BCLDFLAGS=3D"-z noexecstack"'
> >>> +EXTRA_OEMAKE +=3D "'EXTRA_KLIBCAFLAGS=3D${SECURITY_CFLAGS} -Wa,--noe=
xecstack' \
> >>> +                 'EXTRA_KLIBCLDFLAGS=3D${SECURITY_LDFLAGS} -z noexec=
stack'"
> >>>
> >> Is it necessary to pass SECURITY_XFLAGS directly? While including
> >> security_flags.inc,
> >> CC will contain SECURITY_CFLAGS and LDFLAGS will contain SECURITY_LDFL=
AGS.
> >> Maybe you should make sure  to pass LDFLAGS to EXTRA_KLIBCLDFLAGS to a=
void
> >> ldflags qa warning.
> >>
> >> [security_flags.inc]
> >>    58 TARGET_CC_ARCH_append_class-target =3D " ${SECURITY_CFLAGS}"
> >>    59 TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
> >> [security_flags.inc]
> >>
> >>>    export FIX_ARMV4_EABI_BX =3D "${FIX_V4BX}"
> >>>    KLIBCTHUMB =3D "${@['CONFIG_KLIBC_THUMB=3Dn', 'CONFIG_KLIBC_THUMB=
=3Dy'][(d.getVar('ARM_INSTRUCTION_SET') =3D=3D 'thumb')]}"
> >>> @@ -74,5 +75,4 @@ KLIBC_ARCH_powerpc =3D "ppc"
> >>>    KLIBC_ARCH_powerpc64 =3D "ppc64"
> >>>    THIS_LIBKLIBC =3D "libklibc (=3D ${PV}-${PR})"
> >>>
> >>> -SECURITY_CFLAGS =3D "-fno-PIE -no-pie"
> >>> -SECURITY_LDFLAGS =3D "-no-pie"
> >>> +SECURITY_LDFLAGS =3D "${@'-z relro -z now -pie' if '${GCCPIE}' else =
''}"
> >> The same reason, it is not necessary to test GCCPIE,
> >>
> >> and it missed "-Wl,"?, how about directly set SECURITY_STACK_PROTECTOR=
 =3D ""
> >>
> > Hi,
> > thanks for reviewing.
> >
> > It is true the SECURITY_CFLAGS are passed to the compiler.
> > The problem is, klibc has its own arch makefiles (MCONFIG) and the
> > linker is called directly, so if you just append the LDFLAGS like
> > this:
> >
> > EXTRA_OEMAKE +=3D "'EXTRA_KLIBCAFLAGS=3D-Wa,--noexecstack' \
> >                   'EXTRA_KLIBCLDFLAGS=3D${LDFLAGS} -z noexecstack'"
> >
> > you get:
> >
> >    i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/static/i=
pconfig -W
> > l,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -z relro -z now -pie -z no=
execstack u
> > sr/klibc/arch/i386/crt0.o --start-group  usr/kinit/ipconfig/main.o usr/=
kinit/ipc
> > onfig/netdev.o usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_prot=
o.o usr/k
> > init/ipconfig/bootp_proto.o  usr/klibc/libc.a /tmp/build/tmp-musl/work/=
i586-oe-l
> > inux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/li=
bgcc.a --
> > end-group ; cp -f usr/kinit/ipconfig/static/ipconfig usr/kinit/ipconfig=
/static/i
> > pconfig.g ; i586-oe-linux-musl-strip --strip-all -R .comment -R .note -=
-strip-al
> > l -R .comment -R .note --strip-all -R .comment -R .note usr/kinit/ipcon=
fig/stati
> > c/ipconfig
> > i586-oe-linux-musl-ld.bfd: unrecognized option '-Wl,-O1'
> >
> > Thus I am expliciting the SECURITY_LDFLAGS.
> >
> > Note that this patch, injecting the -pie, does now break build for mips=
,
> > because the MCONFIG foir mips disables pic.
> > The immediate fix is to remove -pie for mips (standard behavior).
>
> OK, thanks for the explain
>
> //Hongxu

Hi,

with a following patch more archs were fixed when building with security fl=
ags.
I ended up appending both SECURITY_CFLAGS and SECURITY_LDFLAGS and I
only have to special-case the mips/mips64 which at the time of klibc
(10yrs ago) if you read the kernel was expecting pic code in userspace
but here in klibc I see pic disabled in the makefiles...
Maybe Khem can test runtime...my only mips is a DTB decoder (well,
with a bit of motivation I could do that, it's OpenPli).

Cheers
Andrea


>
> > Cheers
> > Andrea
> >
> >
> >> //Hongxu
> >>
>

