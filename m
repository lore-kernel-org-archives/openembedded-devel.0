Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407FBC54E76
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 18:34:45 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web11.13960.1700332482870357195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 10:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=vS0IQrBr;
 spf=pass (domain: web.de, ip: 212.227.15.4, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700332480; x=1700937280; i=jan.claussen10@web.de;
	bh=P/E0YM/8UjZrtRYZRAHOByyvYunye5bErjD02K/s8WY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=vS0IQrBrGbz4ffeprqlLRoE4UhvwYWdpwulHetC4VT+fX1UXJ4RwCYw8kSu3JYoO
	 lN6XJY2iNe4YO4vZbbPVAc6dBYUy4trDS7VgX7qAK/CJrCZOk1ptYmIkSk/o7x1+3
	 3JJNqjBPMFSCfDZs1YCQCPWvQDM+IrfucoJ6mRHOYM21T8V1dQQi9QOaOX+yuh+4q
	 J+7rHkvNK6zdSeubHtT/8xNDE6wXoZV/CXnDgTqdX6SlJzQZwucQ0cLtAt/CmMrTZ
	 0XTAmA/JC3gWe4gYCqtGphpl6YBfJlMXA+oz+s94zIFfs+I8fSokgNvCkknFzSlm3
	 28p5UjY8D5fTsjct6Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from x1-yoga ([195.123.103.85]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cLR-1rRVMD108D-015PAE; Sat, 18
 Nov 2023 19:34:40 +0100
Date: Sat, 18 Nov 2023 19:34:39 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <31D9FA89-846A-467A-927F-4C43F159992C@getmailspring.com>
In-Reply-To: <CAMKF1sq63_bX6NCadBCpRMiA8ts0H7bhndDqpQdjHbR9dA3cdA@mail.gmail.com>
References: <CAMKF1sq63_bX6NCadBCpRMiA8ts0H7bhndDqpQdjHbR9dA3cdA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="655903bf_8fbaae0_7ca"
X-Provags-ID: V03:K1:4DQBPQclgWWsGi4S7vnZk2fTseNK2ekhVo9U4+G1lXluYp5PwWu
 JKba/ec+taSMj6SRFVXhdvzFysrPVBNYlLk52tNApVaRvOtmHSrfctYds6SBbbwsPreOH1e
 imrm0mrQeemg5qcSxbVCEAxDcAybOYdmEwPEkTCTaH5R5EyYp9KXA4ddcZtMcRx26upk3nA
 1jBWE5JdrQCzyTnsZjd6A==
UI-OutboundReport: notjunk:1;M01:P0:NQSLHiyLydI=;UQM22Bwft2IuZPSIV9utWSIumoq
 V/W0lThs/2FFAstDMGyeEVQv4QP4rgdsdAVRXirSvPMBKMmZLlU/BnBuHkmiVqEfje+xzF2ev
 E7xAdNOquHHYajIUeD0NXQK1H2VQmVmsI4uRGQou44AT0I2AczzFR9ohLW/2+JhUoR4vrY2vo
 cEU1/8cpwF+/khwvOl6i4UjxPpCQlzt53hWpKPEttH93a3joZZZm3AWQ9BtlG5WKxJY0ogLI0
 BAkGWfWlzCrUzMs3hGUmM9YG+iQMSCzHFf3HL6MBIree5OjhCXBCx/87WyoB1Dtqxx7+YXgHg
 EZcrXlA44C+V9rC1G1tDzNLBAchxsiAJ57yR0a7fMCY1elQi5nTRKnDcV4pUZ29jS1FxC8anw
 yUPm5Mnvi6EYu7xv2F7xA8TCy8GsTQFc2RN5cY0u1RRiTP8jlNIEpddGJsFR8QhnWsACr73IV
 v2xsaK1aOx1hpk+9AZKTdUnk8HEmVH2ct0oqUqu3IfQZ+/M5gpEgQ1Rr3seHpkQ+GCmvm9ncl
 7gYfbs3C+zYQs1XiqZwOaGZZqkUCkNYSrWutFbuV0IjRcPwOQiMTBv6WwgGVq9bUetPSdppBy
 KTG6lAE5jKeDjveNRsSKt5SImz2pucNAzLY6uOv5of4c8SZaFTIdkAx8kSgj+AMTBLo3hazbn
 JWtXKo8r4kC0OyKm3iEIoFhUG+BxzRVfjtKOvmyyk2p88DUtiY5BfzO08iditBB1Z0b8UQlVu
 hrMEXfKECe8bx7ACOU64kHPJcDWH4nsuAS6AiHmFlrLZQqk3fpJWa2d8Q6WVG1M4bFa3AzXTN
 tubBKoFhz6YcT2ATw5H5/q2MLNh0w73JqUa19K/aqsabf7eP887fWcBDGORHFif24+8GmJyjR
 dvebtQCCIP9yr8jU5B49kdsoJQvk52fj3fiY+8Q5W2rLtsZwQvqX4vbdrvTNY6d1xW39awnT+
 CaeQsm+0R1BUneEnWcsAAYpVtqQ=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 18:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106894

--655903bf_8fbaae0_7ca
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Maybe on the next Yocto summit=21 :)

On Nov. 18 2023, at 7:33 pm, Khem Raj <raj.khem=40gmail.com> wrote:
>
>
> On Sat, Nov 18, 2023 at 10:27=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > No idea if I did that right now. I really don't understand why you gu=
ys use the email based merge requests, but well.
>
>
> I can talk about it over a beer :)
> Thanks for treading along.
> >
> > On Nov. 18 2023, at 5:45 pm, Khem Raj <raj.khem=40gmail.com (mailto:r=
aj.khem=40gmail.com)> wrote:
> > > thats fine and thanks for update. However, if you can resend it via=

> > > git format-patch && git send-email then tools I use will capture th=
e
> > > v2 properly.
> > >
> > > On Sat, Nov 18, 2023 at 5:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claus=
sen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > >
> > > > So in this case it shoule be alright like this. The developer wil=
l have to take care to set its proper locale, but apart from that everyth=
ing works.
> > > >
> > > > =46rom b242979231f4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:=
00 2001
> > > > =46rom: =3D=3FUT=46-8=3Fq=3FJan=3D20Clau=3DC3=3D9=46en=3F=3D <jan=
.claussen10=40web.de (mailto:jan.claussen10=40web.de)>
> > > > Date: Sat, 18 Nov 2023 14:45:27 +0100
> > > > Subject: =5BPATCH=5D meta-oe: recipes-support: Add btop
> > > > MIME-Version: 1.0
> > > > Content-Type: text/plain; charset=3DUT=46-8
> > > > Content-Transfer-Encoding: 8bit
> > > >
> > > > Adds btop, the shell-based resource monitor that shows usage and =
stats for processor, memory, disks, network and processes.
> > > >
> > > > Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10=40web.de (mailto:=
jan.claussen10=40web.de)>
> > > > ---
> > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb (http://btop=5F1.2.=
13.bb) =7C 23 +++++++++++++++++++++
> > > > 1 file changed, 23 insertions(+)
> > > > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb =
(http://btop=5F1.2.13.bb)
> > > >
> > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb (http:=
//btop=5F1.2.13.bb) b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb (http=
://btop=5F1.2.13.bb)
> > > > new file mode 100644
> > > > index 000000000..a944fe7b5
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb (http://btop=5F=
1.2.13.bb)
> > > > =40=40 -0,0 +1,23 =40=40
> > > > +SUMMARY =3D =22Resource monitor that shows usage and stats for p=
rocessor, memory, disks, network and processes.=22
> > > > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
> > > > +LICENSE =3D =22Apache-2.0=22
> > > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57=22
> > > > +SECTION =3D =22console/utils=22
> > > > +
> > > > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=
=3Dhttps;branch=3Dmain (http://github.com/aristocratos/btop.git;protocol=3D=
https;branch=3Dmain)=22
> > > > +SRCREV =3D =229edbf27f1b6d5844a97325fcda732762ba086a99=22
> > > > +
> > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > +
> > > > +inherit cmake
> > > > +
> > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > + =24=7Bdatadir=7D/icons =5C
> > > > + =24=7Bdatadir=7D/icons/hicolor =5C
> > > > + =24=7Bdatadir=7D/icons/hicolor/48x48 =5C
> > > > + =24=7Bdatadir=7D/icons/hicolor/scalable =5C
> > > > + =24=7Bdatadir=7D/icons/hicolor/48x48/apps =5C
> > > > + =24=7Bdatadir=7D/icons/hicolor/48x48/apps/btop.png =5C
> > > > + =24=7Bdatadir=7D/icons/hicolor/scalable/apps =5C
> > > > + =24=7Bdatadir=7D/icons/hicolor/scalable/apps/btop.svg =5C
> > > > +=22
> > > > --
> > > > 2.42.1
> > > >
> > > > On Nov. 14 2023, at 9:43 pm, Khem Raj <raj.khem=40gmail.com (mail=
to:raj.khem=40gmail.com)> wrote:
> > > >
> > > > On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen <jan.cl=
aussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > >
> > > > > So I have just tested btop on musl succesfully.
> > > > >
> > > >
> > > > OK
> > > >
> > > > > I am questioning the need for the locales though. You can run b=
top with the --utf-force flag and it will work well. If you want to run i=
t without this flag, you'll need to not only install the locales, but als=
o add
> > > > >
> > > > > LC=5FALL=3Den=5FUS.UT=46-8
> > > > > LANG=3Den=5FUS.UT=46-8
> > > > >
> > > >
> > > > yeah if it can work without it, that would be great
> > > >
> > > > > to /etc/profile as a minimum. This would force the user to use =
these locales. It would also require a .bbappend on base-files and I don'=
t think that this is a good idea.
> > > > >
> > > > > On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen <jan.claussen10=40=
web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > >
> > > > > How did you build it=3F I have sent you a PM on IRC
> > > > >
> > > > > On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem=40gmail.com (ma=
ilto:raj.khem=40gmail.com)> wrote:
> > > > >
> > > > > On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.=
claussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > >
> > > > > > No, it is an issue I have with images for the Pi Zero. I have=
n't build anything for musl at all, although it would probably a good cho=
ice for the Pi Zero.
> > > > > >
> > > > > > I have no issues using Raspberry Pi OS or other distros btw, =
so the device is not the issue
> > > > >
> > > > > As one point I have pi0 running fine perhaps something has regr=
essed
> > > > > in meta-raspberrypi :( these things need TLC to keep going.
> > > > >
> > > > > > On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem=40gmail.com (=
mailto:raj.khem=40gmail.com)> wrote:
> > > > > >
> > > > > > hmm is that just seen with musl and works ok with glibc based=
 images =3F
> > > > > >
> > > > > > TCLIBC=3Dmusl bitbake core-image-base
> > > > > >
> > > > > > eg. will produce a musl based image which is expected to work=

> > > > > >
> > > > > > On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <ja=
n.claussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > > >
> > > > > > > Unfortunately I can't test it unless this gets solved (or I=
 buy a different Raspberry Pi)
> > > > > > >
> > > > > > > https://github.com/agherzan/meta-raspberrypi/issues/1229
> > > > > > >
> > > > > > > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem=40gmail.com=
 (mailto:raj.khem=40gmail.com)> wrote:
> > > > > > >
> > > > > > > TCLIBC=3Dmusl bitbake <recipe>
> > > > > > >
> > > > > > > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <j=
an.claussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > > > >
> > > > > > > > How to test it against musl btw=3F Build a musl-based sys=
tem for Raspberry Pi and see if it runs=3F
> > > > > > > >
> > > > > > > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.clauss=
en10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > > > >
> > > > > > > > Yes, the CMake support was added two months ago and the r=
elease is from 2022. Cmake is also not supported by the main developer wh=
o seems to favor an advanced Makefile. In any case, it is easier to fix t=
han the Makefile. I will go with the git version for now then until there=
 is a new release.
> > > > > > > >
> > > > > > > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.c=
om (mailto:raj.khem=40gmail.com)> wrote:
> > > > > > > >
> > > > > > > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen =
<jan.claussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > > > > >
> > > > > > > > > I am trying with the tarball but it is quite hard, sinc=
e it doesn't come with a CMakeLists.txt.
> > > > > > > > > There is a recipe here, but it involves a lot of patchi=
ng which could potentially be painful to maintain
> > > > > > > > >
> > > > > > > > > https://github.com/aristocratos/btop/issues/330=23issue=
comment-1123685779
> > > > > > > > >
> > > > > > > >
> > > > > > > > is it because cmake support was added later =3F in that c=
ase maybe using
> > > > > > > > git version is ok
> > > > > > > >
> > > > > > > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail=
.com (mailto:raj.khem=40gmail.com)> wrote:
> > > > > > > > >
> > > > > > > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9F=
en <jan.claussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > > > > > >
> > > > > > > > > > It also needs a utf-8 locale to work. Else you have t=
o force utf-8 mode with a flag. I haven't included this as dependency at =
this point.
> > > > > > > > >
> > > > > > > > > you want to express all that is needed to get it runnin=
g amicably.
> > > > > > > > > keeping in mind that we have glibc and musl based syste=
ms to service
> > > > > > > > > it will be good to check it on musl too.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.cl=
aussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > > > > > >
> > > > > > > > > > Glad that it arrived now=21 This is a really great re=
source monitor. It is building from the git repository. Do you think it i=
s better to use the release instead=3F
> > > > > > > > > >
> > > > > > > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gma=
il.com (mailto:raj.khem=40gmail.com)> wrote:
> > > > > > > > > >
> > > > > > > > > > Thanks for your contribution Jan
> > > > > > > > > >
> > > > > > > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9F=
en <jan.claussen10=40web.de (mailto:jan.claussen10=40web.de)> wrote:
> > > > > > > > > > >
> > > > > > > > > > > ---
> > > > > > > > > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb (http=
://btop=5F1.2.13.bb) =7C 23 +++++++++++++++++++++
> > > > > > > > > > > 1 file changed, 23 insertions(+)
> > > > > > > > > > > create mode 100644 meta-oe/recipes-support/btop/bto=
p=5F1.2.13.bb (http://btop=5F1.2.13.bb)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.=
2.13.bb (http://btop=5F1.2.13.bb) b/meta-oe/recipes-support/btop/btop=5F1=
.2.13.bb (http://btop=5F1.2.13.bb)
> > > > > > > > > > > new file mode 100644
> > > > > > > > > > > index 000000000..f780a993a
> > > > > > > > > > > --- /dev/null
> > > > > > > > > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb=
 (http://btop=5F1.2.13.bb)
> > > > > > > > > > > =40=40 -0,0 +1,23 =40=40
> > > > > > > > > > > +SUMMARY =3D =22Resource monitor that shows usage a=
nd stats for processor, memory, disks, network and processes.=22
> > > > > > > > > > > +HOMEPAGE =3D =22https://github.com/aristocratos/bt=
op=22
> > > > > > > > > > > +LICENSE =3D =22Apache-2.0=22
> > > > > > > > > > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57=22
> > > > > > > > > > > +SECTION =3D =22console/utils=22
> > > > > > > > > > > +
> > > > > > > > > > > +SRC=5FURI =3D =22git://github.com/aristocratos/bto=
p.git;protocol=3Dhttps;branch=3Dmain (http://github.com/aristocratos/btop=
.git;protocol=3Dhttps;branch=3Dmain)=22
> > > > > > > > > > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b=
9b78=22
> > > > > > > > > > > +
> > > > > > > > > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > > > > > > > > +
> > > > > > > > > > > +inherit cmake
> > > > > > > > > > > +
> > > > > > > > > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > > > > > > > > + /usr/share/icons =5C
> > > > > > > > > >
> > > > > > > > > > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/s=
hare
> > > > > > > > > >
> > > > > > > > > > > + /usr/share/icons/hicolor =5C
> > > > > > > > > > > + /usr/share/icons/hicolor/48x48 =5C
> > > > > > > > > > > + /usr/share/icons/hicolor/scalable =5C
> > > > > > > > > > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > > > > > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > > > > > > > > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > > > > > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C=

> > > > > > > > > > > +=22
> > > > > > > > > > > --
> > > > > > > > > > > 2.42.0
> > > > > > > > > > >
> > > > > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > > > > Links: You receive all messages sent to this group.=

> > > > > > > > > > > View/Reply Online (=23106559): https://lists.openem=
bedded.org/g/openembedded-devel/message/106559
> > > > > > > > > > > Mute This Topic: https://lists.openembedded.org/mt/=
102530478/1997914
> > > > > > > > > > > Group Owner: openembedded-devel+owner=40lists.opene=
mbedded.org (mailto:openembedded-devel%2Bowner=40lists.openembedded.org)
> > > > > > > > > > > Unsubscribe: https://lists.openembedded.org/g/opene=
mbedded-devel/unsub =5Braj.khem=40gmail.com (mailto:raj.khem=40gmail.com)=
=5D
> > > > > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > > > >
> > >
> >
>
>
>


--655903bf_8fbaae0_7ca
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Maybe on the next Yocto summit=21 <span data-emoji-typing=3D=22true=22=
>:)</span></div><br><div class=3D=22gmail=5Fquote=5Fattribution=22>On Nov=
. 18 2023, at 7:33 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div>=
<blockquote><div><br></div><div><br><div class=3D=22gmail=5Fquote=22><div=
 class=3D=22gmail=5Fattr=22><div>On Sat, Nov 18, 2023 at 10:27=E2=80=AFAM=
 Jan Clau=C3=9Fen &lt;<a href=3D=22mailto:jan.claussen10=40web.de=22 titl=
e=3D=22mailto:jan.claussen10=40web.de=22>jan.claussen10=40web.de</a>&gt; =
wrote:</div></div><blockquote><div>No idea if I did that right now. I rea=
lly don't understand why you guys use the email based merge requests, but=
 well.</div></blockquote><div><br></div><div>I can talk about it over a b=
eer :)</div><div>Thanks for treading along.&nbsp;</div><blockquote><br><d=
iv>On Nov. 18 2023, at 5:45 pm, Khem Raj &lt;<a href=3D=22mailto:raj.khem=
=40gmail.com=22 title=3D=22mailto:raj.khem=40gmail.com=22>raj.khem=40gmai=
l.com</a>&gt; wrote:</div><blockquote><div><div>thats fine and thanks for=
 update. However, if you can resend it via</div><div>git format-patch &am=
p;&amp; git send-email then tools I use will capture the</div><div>v2 pro=
perly.</div><br><div>On Sat, Nov 18, 2023 at 5:51=E2=80=AFAM Jan Clau=C3=9F=
en &lt;<a href=3D=22mailto:jan.claussen10=40web.de=22 title=3D=22mailto:j=
an.claussen10=40web.de=22>jan.claussen10=40web.de</a>&gt; wrote:</div><di=
v>&gt;</div><div>&gt; So in this case it shoule be alright like this. The=
 developer will have to take care to set its proper locale, but apart fro=
m that everything works.</div><div>&gt;</div><div>&gt; =46rom b242979231f=
4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2001</div><div>&gt; =46=
rom: =3D=3FUT=46-8=3Fq=3FJan=3D20Clau=3DC3=3D9=46en=3F=3D &lt;<a href=3D=22=
mailto:jan.claussen10=40web.de=22 title=3D=22mailto:jan.claussen10=40web.=
de=22>jan.claussen10=40web.de</a>&gt;</div><div>&gt; Date: Sat, 18 Nov 20=
23 14:45:27 +0100</div><div>&gt; Subject: =5BPATCH=5D meta-oe: recipes-su=
pport: Add btop</div><div>&gt; MIME-Version: 1.0</div><div>&gt; Content-T=
ype: text/plain; charset=3DUT=46-8</div><div>&gt; Content-Transfer-Encodi=
ng: 8bit</div><div>&gt;</div><div>&gt; Adds btop, the shell-based resourc=
e monitor that shows usage and stats for processor, memory, disks, networ=
k and processes.</div><div>&gt;</div><div>&gt; Signed-off-by: Jan Clau=C3=
=9Fen &lt;<a href=3D=22mailto:jan.claussen10=40web.de=22 title=3D=22mailt=
o:jan.claussen10=40web.de=22>jan.claussen10=40web.de</a>&gt;</div><div>&g=
t; ---</div><div>&gt; meta-oe/recipes-support/btop/<a href=3D=22http://bt=
op=5F1.2.13.bb=22 title=3D=22http://btop=5F1.2.13.bb=22>btop=5F1.2.13.bb<=
/a>&nbsp;=7C 23 +++++++++++++++++++++</div><div>&gt; 1 file changed, 23 i=
nsertions(+)</div><div>&gt; create mode 100644 meta-oe/recipes-support/bt=
op/<a href=3D=22http://btop=5F1.2.13.bb=22 title=3D=22http://btop=5F1.2.1=
3.bb=22>btop=5F1.2.13.bb</a></div><div>&gt;</div><div>&gt; diff --git a/m=
eta-oe/recipes-support/btop/<a href=3D=22http://btop=5F1.2.13.bb=22 title=
=3D=22http://btop=5F1.2.13.bb=22>btop=5F1.2.13.bb</a>&nbsp;b/meta-oe/reci=
pes-support/btop/<a href=3D=22http://btop=5F1.2.13.bb=22 title=3D=22http:=
//btop=5F1.2.13.bb=22>btop=5F1.2.13.bb</a></div><div>&gt; new file mode 1=
00644</div><div>&gt; index 000000000..a944fe7b5</div><div>&gt; --- /dev/n=
ull</div><div>&gt; +++ b/meta-oe/recipes-support/btop/<a href=3D=22http:/=
/btop=5F1.2.13.bb=22 title=3D=22http://btop=5F1.2.13.bb=22>btop=5F1.2.13.=
bb</a></div><div>&gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; +SUMMARY =3D=
 =22Resource monitor that shows usage and stats for processor, memory, di=
sks, network and processes.=22</div><div>&gt; +HOMEPAGE =3D =22<a href=3D=
=22https://github.com/aristocratos/btop=22 title=3D=22https://github.com/=
aristocratos/btop=22>https://github.com/aristocratos/btop</a>=22</div><di=
v>&gt; +LICENSE =3D =22Apache-2.0=22</div><div>&gt; +LIC=5F=46ILES=5FCHKS=
UM =3D =22file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=22</div><=
div>&gt; +SECTION =3D =22console/utils=22</div><div>&gt; +</div><div>&gt;=
 +SRC=5FURI =3D =22git://<a href=3D=22http://github.com/aristocratos/btop=
.git;protocol=3Dhttps;branch=3Dmain=22 title=3D=22http://github.com/arist=
ocratos/btop.git;protocol=3Dhttps;branch=3Dmain=22>github.com/aristocrato=
s/btop.git;protocol=3Dhttps;branch=3Dmain</a>=22</div><div>&gt; +SRCREV =3D=
 =229edbf27f1b6d5844a97325fcda732762ba086a99=22</div><div>&gt; +</div><di=
v>&gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div>&gt; +</div><div>&gt; =
+inherit cmake</div><div>&gt; +</div><div>&gt; +=46ILES:=24=7BPN=7D +=3D =
=22 =5C</div><div>&gt; + =24=7Bdatadir=7D/icons =5C</div><div>&gt; + =24=7B=
datadir=7D/icons/hicolor =5C</div><div>&gt; + =24=7Bdatadir=7D/icons/hico=
lor/48x48 =5C</div><div>&gt; + =24=7Bdatadir=7D/icons/hicolor/scalable =5C=
</div><div>&gt; + =24=7Bdatadir=7D/icons/hicolor/48x48/apps =5C</div><div=
>&gt; + =24=7Bdatadir=7D/icons/hicolor/48x48/apps/btop.png =5C</div><div>=
&gt; + =24=7Bdatadir=7D/icons/hicolor/scalable/apps =5C</div><div>&gt; + =
=24=7Bdatadir=7D/icons/hicolor/scalable/apps/btop.svg =5C</div><div>&gt; =
+=22</div><div>&gt; --</div><div>&gt; 2.42.1</div><div>&gt;</div><div>&gt=
; On Nov. 14 2023, at 9:43 pm, Khem Raj &lt;<a href=3D=22mailto:raj.khem=40=
gmail.com=22 title=3D=22mailto:raj.khem=40gmail.com=22>raj.khem=40gmail.c=
om</a>&gt; wrote:</div><div>&gt;</div><div>&gt; On Tue, Nov 14, 2023 at 1=
2:38=E2=80=AFPM Jan Clau=C3=9Fen &lt;<a href=3D=22mailto:jan.claussen10=40=
web.de=22 title=3D=22mailto:jan.claussen10=40web.de=22>jan.claussen10=40w=
eb.de</a>&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; So I have ju=
st tested btop on musl succesfully.</div><div>&gt; &gt;</div><div>&gt;</d=
iv><div>&gt; OK</div><div>&gt;</div><div>&gt; &gt; I am questioning the n=
eed for the locales though. You can run btop with the --utf-force flag an=
d it will work well. If you want to run it without this flag, you'll need=
 to not only install the locales, but also add</div><div>&gt; &gt;</div><=
div>&gt; &gt; LC=5FALL=3Den=5FUS.UT=46-8</div><div>&gt; &gt; LANG=3Den=5F=
US.UT=46-8</div><div>&gt; &gt;</div><div>&gt;</div><div>&gt; yeah if it c=
an work without it, that would be great</div><div>&gt;</div><div>&gt; &gt=
; to /etc/profile as a minimum. This would force the user to use these lo=
cales. It would also require a .bbappend on base-files and I don't think =
that this is a good idea.</div><div>&gt; &gt;</div><div>&gt; &gt; On Nov.=
 12 2023, at 9:24 pm, Jan Clau=C3=9Fen &lt;<a href=3D=22mailto:jan.clauss=
en10=40web.de=22 title=3D=22mailto:jan.claussen10=40web.de=22>jan.clausse=
n10=40web.de</a>&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; How d=
id you build it=3F I have sent you a PM on IRC</div><div>&gt; &gt;</div><=
div>&gt; &gt; On Nov. 12 2023, at 9:21 pm, Khem Raj &lt;<a href=3D=22mail=
to:raj.khem=40gmail.com=22 title=3D=22mailto:raj.khem=40gmail.com=22>raj.=
khem=40gmail.com</a>&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; O=
n Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=3D=22=
mailto:jan.claussen10=40web.de=22 title=3D=22mailto:jan.claussen10=40web.=
de=22>jan.claussen10=40web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt;</di=
v><div>&gt; &gt; &gt; No, it is an issue I have with images for the Pi Ze=
ro. I haven't build anything for musl at all, although it would probably =
a good choice for the Pi Zero.</div><div>&gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; I have no issues using Raspberry Pi OS or other distros btw, so t=
he device is not the issue</div><div>&gt; &gt;</div><div>&gt; &gt; As one=
 point I have pi0 running fine perhaps something has regressed</div><div>=
&gt; &gt; in meta-raspberrypi :( these things need TLC to keep going.</di=
v><div>&gt; &gt;</div><div>&gt; &gt; &gt; On Nov. 12 2023, at 7:49 pm, Kh=
em Raj &lt;<a href=3D=22mailto:raj.khem=40gmail.com=22 title=3D=22mailto:=
raj.khem=40gmail.com=22>raj.khem=40gmail.com</a>&gt; wrote:</div><div>&gt=
; &gt; &gt;</div><div>&gt; &gt; &gt; hmm is that just seen with musl and =
works ok with glibc based images =3F</div><div>&gt; &gt; &gt;</div><div>&=
gt; &gt; &gt; TCLIBC=3Dmusl bitbake core-image-base</div><div>&gt; &gt; &=
gt;</div><div>&gt; &gt; &gt; eg. will produce a musl based image which is=
 expected to work</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Su=
n, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=3D=22mai=
lto:jan.claussen10=40web.de=22 title=3D=22mailto:jan.claussen10=40web.de=22=
>jan.claussen10=40web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt;</di=
v><div>&gt; &gt; &gt; &gt; Unfortunately I can't test it unless this gets=
 solved (or I buy a different Raspberry Pi)</div><div>&gt; &gt; &gt; &gt;=
</div><div>&gt; &gt; &gt; &gt; <a href=3D=22https://github.com/agherzan/m=
eta-raspberrypi/issues/1229=22 title=3D=22https://github.com/agherzan/met=
a-raspberrypi/issues/1229=22>https://github.com/agherzan/meta-raspberrypi=
/issues/1229</a></div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &=
gt; On Nov. 12 2023, at 6:43 pm, Khem Raj &lt;<a href=3D=22mailto:raj.khe=
m=40gmail.com=22 title=3D=22mailto:raj.khem=40gmail.com=22>raj.khem=40gma=
il.com</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &=
gt; &gt; TCLIBC=3Dmusl bitbake &lt;recipe&gt;</div><div>&gt; &gt; &gt; &g=
t;</div><div>&gt; &gt; &gt; &gt; On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM =
Jan Clau=C3=9Fen &lt;<a href=3D=22mailto:jan.claussen10=40web.de=22 title=
=3D=22mailto:jan.claussen10=40web.de=22>jan.claussen10=40web.de</a>&gt; w=
rote:</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &g=
t; How to test it against musl btw=3F Build a musl-based system for Raspb=
erry Pi and see if it runs=3F</div><div>&gt; &gt; &gt; &gt; &gt;</div><di=
v>&gt; &gt; &gt; &gt; &gt; On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen =
&lt;<a href=3D=22mailto:jan.claussen10=40web.de=22 title=3D=22mailto:jan.=
claussen10=40web.de=22>jan.claussen10=40web.de</a>&gt; wrote:</div><div>&=
gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; Yes, the CMake=
 support was added two months ago and the release is from 2022. Cmake is =
also not supported by the main developer who seems to favor an advanced M=
akefile. In any case, it is easier to fix than the Makefile. I will go wi=
th the git version for now then until there is a new release.</div><div>&=
gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Nov. 12 202=
3, at 6:20 pm, Khem Raj &lt;<a href=3D=22mailto:raj.khem=40gmail.com=22 t=
itle=3D=22mailto:raj.khem=40gmail.com=22>raj.khem=40gmail.com</a>&gt; wro=
te:</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt;=
 On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=3D=22=
mailto:jan.claussen10=40web.de=22 title=3D=22mailto:jan.claussen10=40web.=
de=22>jan.claussen10=40web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt=
; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; I am trying with the =
tarball but it is quite hard, since it doesn't come with a CMakeLists.txt=
.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; There is a recipe here, but it =
involves a lot of patching which could potentially be painful to maintain=
</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; <a href=3D=22https://github.com/aristocratos/btop/issues/330=23is=
suecomment-1123685779=22 title=3D=22https://github.com/aristocratos/btop/=
issues/330=23issuecomment-1123685779=22>https://github.com/aristocratos/b=
top/issues/330=23issuecomment-1123685779</a></div><div>&gt; &gt; &gt; &gt=
; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &=
gt; &gt; is it because cmake support was added later =3F in that case may=
be using</div><div>&gt; &gt; &gt; &gt; &gt; git version is ok</div><div>&=
gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; On Nov. 1=
1 2023, at 8:01 pm, Khem Raj &lt;<a href=3D=22mailto:raj.khem=40gmail.com=
=22 title=3D=22mailto:raj.khem=40gmail.com=22>raj.khem=40gmail.com</a>&gt=
; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen=
 &lt;<a href=3D=22mailto:jan.claussen10=40web.de=22 title=3D=22mailto:jan=
.claussen10=40web.de=22>jan.claussen10=40web.de</a>&gt; wrote:</div><div>=
&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt=
; &gt; It also needs a utf-8 locale to work. Else you have to force utf-8=
 mode with a flag. I haven't included this as dependency at this point.</=
div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt;=
 &gt; you want to express all that is needed to get it running amicably.<=
/div><div>&gt; &gt; &gt; &gt; &gt; &gt; keeping in mind that we have glib=
c and musl based systems to service</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; it will be good to check it on musl too.</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen=
 &lt;<a href=3D=22mailto:jan.claussen10=40web.de=22 title=3D=22mailto:jan=
.claussen10=40web.de=22>jan.claussen10=40web.de</a>&gt; wrote:</div><div>=
&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt=
; &gt; Glad that it arrived now=21 This is a really great resource monito=
r. It is building from the git repository. Do you think it is better to u=
se the release instead=3F</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</d=
iv><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 7:30 pm, K=
hem Raj &lt;<a href=3D=22mailto:raj.khem=40gmail.com=22 title=3D=22mailto=
:raj.khem=40gmail.com=22>raj.khem=40gmail.com</a>&gt; wrote:</div><div>&g=
t; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; =
&gt; Thanks for your contribution Jan</div><div>&gt; &gt; &gt; &gt; &gt; =
&gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Sat, Nov 11, 20=
23 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=3D=22mailto:jan.claus=
sen10=40web.de=22 title=3D=22mailto:jan.claussen10=40web.de=22>jan.clauss=
en10=40web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ---</div><div>&gt=
; &gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-oe/recipes-support/btop/<a href=
=3D=22http://btop=5F1.2.13.bb=22 title=3D=22http://btop=5F1.2.13.bb=22>bt=
op=5F1.2.13.bb</a>&nbsp;=7C 23 +++++++++++++++++++++</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt; &gt; &gt; 1 file changed, 23 insertions(+)</div><div>=
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; create mode 100644 meta-oe/recipe=
s-support/btop/<a href=3D=22http://btop=5F1.2.13.bb=22 title=3D=22http://=
btop=5F1.2.13.bb=22>btop=5F1.2.13.bb</a></div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff =
--git a/meta-oe/recipes-support/btop/<a href=3D=22http://btop=5F1.2.13.bb=
=22 title=3D=22http://btop=5F1.2.13.bb=22>btop=5F1.2.13.bb</a>&nbsp;b/met=
a-oe/recipes-support/btop/<a href=3D=22http://btop=5F1.2.13.bb=22 title=3D=
=22http://btop=5F1.2.13.bb=22>btop=5F1.2.13.bb</a></div><div>&gt; &gt; &g=
t; &gt; &gt; &gt; &gt; &gt; new file mode 100644</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; index 000000000..f780a993a</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt; &gt; &gt; --- /dev/null</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; +++ b/meta-oe/recipes-support/btop/<a href=3D=22http=
://btop=5F1.2.13.bb=22 title=3D=22http://btop=5F1.2.13.bb=22>btop=5F1.2.1=
3.bb</a></div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; =40=40 -0,0 +1=
,23 =40=40</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +SUMMARY =3D=
 =22Resource monitor that shows usage and stats for processor, memory, di=
sks, network and processes.=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &g=
t; &gt; +HOMEPAGE =3D =22<a href=3D=22https://github.com/aristocratos/bto=
p=22 title=3D=22https://github.com/aristocratos/btop=22>https://github.co=
m/aristocratos/btop</a>=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &=
gt; +LICENSE =3D =22Apache-2.0=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &g=
t; +SECTION =3D =22console/utils=22</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +SRC=5FU=
RI =3D =22git://<a href=3D=22http://github.com/aristocratos/btop.git;prot=
ocol=3Dhttps;branch=3Dmain=22 title=3D=22http://github.com/aristocratos/b=
top.git;protocol=3Dhttps;branch=3Dmain=22>github.com/aristocratos/btop.gi=
t;protocol=3Dhttps;branch=3Dmain</a>=22</div><div>&gt; &gt; &gt; &gt; &gt=
; &gt; &gt; &gt; +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22=
</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt; &gt; &gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; &gt; &gt; +inherit cmake</div><div>&gt; &gt; &gt; &gt; &gt; &gt=
; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=46ILES:=
=24=7BPN=7D +=3D =22 =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt=
; + /usr/share/icons =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</di=
v><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; Lets use =24=7Bdatadir=7D inste=
ad of hardcoded /usr/share</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</=
div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicol=
or =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/ico=
ns/hicolor/48x48 =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + =
/usr/share/icons/hicolor/scalable =5C</div><div>&gt; &gt; &gt; &gt; &gt; =
&gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps =5C</div><div>&gt; &=
gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps/b=
top.png =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/shar=
e/icons/hicolor/scalable/apps =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=22</div><div>&gt; &gt; &gt; &=
gt; &gt; &gt; &gt; &gt; --</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &=
gt; 2.42.0</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&g=
t; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Links: You re=
ceive all messages sent to this group.</div><div>&gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; View/Reply Online (=23106559): <a href=3D=22https://lists=
.openembedded.org/g/openembedded-devel/message/106559=22 title=3D=22https=
://lists.openembedded.org/g/openembedded-devel/message/106559=22>https://=
lists.openembedded.org/g/openembedded-devel/message/106559</a></div><div>=
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Mute This Topic: <a href=3D=22htt=
ps://lists.openembedded.org/mt/102530478/1997914=22 title=3D=22https://li=
sts.openembedded.org/mt/102530478/1997914=22>https://lists.openembedded.o=
rg/mt/102530478/1997914</a></div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =
&gt; Group Owner: <a href=3D=22mailto:openembedded-devel%2Bowner=40lists.=
openembedded.org=22 title=3D=22mailto:openembedded-devel%2Bowner=40lists.=
openembedded.org=22>openembedded-devel+owner=40lists.openembedded.org</a>=
</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Unsubscribe: <a href=3D=
=22https://lists.openembedded.org/g/openembedded-devel/unsub=22 title=3D=22=
https://lists.openembedded.org/g/openembedded-devel/unsub=22>https://list=
s.openembedded.org/g/openembedded-devel/unsub</a>&nbsp;=5B<a href=3D=22ma=
ilto:raj.khem=40gmail.com=22 title=3D=22mailto:raj.khem=40gmail.com=22>ra=
j.khem=40gmail.com</a>=5D</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &g=
t; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; &gt;</div></div></blockquote></blockquote></div></di=
v></blockquote>
--655903bf_8fbaae0_7ca--


