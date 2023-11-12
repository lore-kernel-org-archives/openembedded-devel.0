Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CC8C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:24:24 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web11.22699.1699820660581962255
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=YlpZYIYe;
 spf=pass (domain: web.de, ip: 217.72.192.78, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699820658; x=1700425458; i=jan.claussen10@web.de;
	bh=zhLPEFbbG7AnFU+ckFicVl0O/ry9iMmRIu0HVUu4iZE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=YlpZYIYe8L1lVBTjqWU/nLwFa4PO2IYSJPKU253dHj+z3M3tr8PNjIf7RllsWO6q
	 YEgUz8k6LVaxgZSKgV7bEZCdO7vVk+mCXtO+4jWevjOlZZoXY8rPQSf0GLMxxd7jC
	 uX5jyF/9eqjNN714oZEOR2z8oi7MM2VzI9vZuW/GIeGn9gaYUpQDGAuyMJIXefHi9
	 JfZ/xVyCGE9eKx8Ytf5Mcp8KQypuO0+F9rhSP8s04vYg6wzIcWOhCXGJuLmSv3Nyq
	 6L9BBKnRts5+Nzhye5xIUG88VuTm+RMgzxpSwoJf/0s1Yq4zbo/CGM1oYJDkBpW3f
	 F0cKmIurPDKIgrxQRQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([31.29.47.11]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mc1ZN-1rfBvR0VCh-00d3O7; Sun, 12
 Nov 2023 21:24:18 +0100
Date: Sun, 12 Nov 2023 21:24:17 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <27BCAA1A-D895-4C5A-9A1E-D9D1F3DBB773@getmailspring.com>
In-Reply-To: <CAMKF1sqd83q-=EjZHya7PWoWRO=X10X6rbJTvZJGCNtJ4n=iPg@mail.gmail.com>
References: <CAMKF1sqd83q-=EjZHya7PWoWRO=X10X6rbJTvZJGCNtJ4n=iPg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65513471_4f46fe06_4ea0"
X-Provags-ID: V03:K1:9jl4dQC3HF+dSs8vCS45lwlS6KJRIvpnsCqhWfKAxLcgofaudkf
 NG+kSrS9Pw2ur7Voq1gBuxgpT/lWyS2A69/QVSrKzZpcq3Mgsx/mLKmLjsxXq5WX9A+Qxft
 knvvf6scBW/rN65aD3rreyoZvS6JczSXP0I4lzSQ0qQxbY7BGMbsod55QfEU2ne/ZjLQc77
 VtU7D2XpWucTgwmE/krCQ==
UI-OutboundReport: notjunk:1;M01:P0:CE5y299jmoA=;X4suUBUcoibXdCbKum+MVhWHFB8
 QJKhCsPAugLUlmdgzI3KLmO7+GdeDSnUZkdr5Yu6jFZrYq2c3Y5S3gfBKuWDGX3hVKKOinHay
 ek2250ax7k+JxmEH3yS5Rr593Pg4L5vcOuXURpaV77BC15jkb9UUP8r1GyHNXt7cbbeelKSur
 3pc8ZXc4bDzrHHuTb93cVZW3MSNgIxMgMNcPQpTdyUJrC00xWdjK5zBYd9BS1YszyWJ4zsApw
 VpKj6osbeK/NaxRt4Srp33Zqaow29je+PpNQFU2k2Er3dhmxwzJO7ZLHvqwMGvU8oGwVERcOs
 G4eLlNUUJXc2I8Yt0viBNB+yXoheGepm1IMPRXh7M8yAzDgUCNeXlCsyaqYd152iR9FZmgkfx
 iFM7p5qqFDG9JNXdVdcsrSlUkN/wcRosu6D/+4gGymQcKSgYT9+m/J5VjO+n24H95s/ivuP6L
 E7wTFGtQ2WLONuesCj6DeBSJYpRuy7cJzzBzMm3u7mtF6sYMGLyqVKeCKpLewY1mYrA8ta4xO
 UB0BNTtpmsaH8yFtzJYWN2w+Y28btoCicqQoeefuHww0ioEKB/d3v2CFkIG12R3MgTcH0v7Cg
 kx8Pf68j811kfi/OckmdSpIjsfH6nf/YrU6e6L/jMzIHWi4E20S46kBpEi0POEG/jkVi+K/v7
 rOcUsekQjnCIjmHWFhq+4akf+sMzgrY8Xo0VE9NDUkmnQfjtOp0zXSGBu0lZ0dDm0mKTu45Dn
 XcfswYtXw1Gjl90Zf6XzO9wDuDcMjNyyRNf76oaT+r7Itvcf9LBfR3CeqaG4AMQ17EqdlJswt
 GttM2oZhEAtuYp9hyHTteHT99IcpPqJpDEXivC7OH8VEgIUgKJpL5DfC3MzpFUdj8X2MTdJkr
 YSz8PfLzZdnSs4sxF3EpQkWWHDX9CiLHlXTtfJDdfln+bXrg/1QjngeJ8E3HED88UU8d5zQuk
 msgySA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106611

--65513471_4f46fe06_4ea0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

How did you build it=3F I have sent you a PM on IRC

On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10=40web.de> wrote:
> >
> > No, it is an issue I have with images for the Pi Zero. I haven't buil=
d anything for musl at all, although it would probably a good choice for =
the Pi Zero.
> >
> > I have no issues using Raspberry Pi OS or other distros btw, so the d=
evice is not the issue
>
> As one point I have pi0 running fine perhaps something has regressed
> in meta-raspberrypi :( these things need TLC to keep going.
>
> > On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> >
> > hmm is that just seen with musl and works ok with glibc based images =
=3F
> >
> > TCLIBC=3Dmusl bitbake core-image-base
> >
> > eg. will produce a musl based image which is expected to work
> >
> > On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10=40web.de> wrote:
> > >
> > > Unfortunately I can't test it unless this gets solved (or I buy a d=
ifferent Raspberry Pi)
> > >
> > > https://github.com/agherzan/meta-raspberrypi/issues/1229
> > >
> > > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem=40gmail.com> wrote:=

> > >
> > > TCLIBC=3Dmusl bitbake <recipe>
> > >
> > > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.claus=
sen10=40web.de> wrote:
> > > >
> > > > How to test it against musl btw=3F Build a musl-based system for =
Raspberry Pi and see if it runs=3F
> > > >
> > > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10=40w=
eb.de> wrote:
> > > >
> > > > Yes, the CMake support was added two months ago and the release i=
s from 2022. Cmake is also not supported by the main developer who seems =
to favor an advanced Makefile. In any case, it is easier to fix than the =
Makefile. I will go with the git version for now then until there is a ne=
w release.
> > > >
> > > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.com> wrot=
e:
> > > >
> > > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.cla=
ussen10=40web.de> wrote:
> > > > >
> > > > > I am trying with the tarball but it is quite hard, since it doe=
sn't come with a CMakeLists.txt.
> > > > > There is a recipe here, but it involves a lot of patching which=
 could potentially be painful to maintain
> > > > >
> > > > > https://github.com/aristocratos/btop/issues/330=23issuecomment-=
1123685779
> > > > >
> > > >
> > > > is it because cmake support was added later =3F in that case mayb=
e using
> > > > git version is ok
> > > >
> > > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail.com> wr=
ote:
> > > > >
> > > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.=
claussen10=40web.de> wrote:
> > > > > >
> > > > > > It also needs a utf-8 locale to work. Else you have to force =
utf-8 mode with a flag. I haven't included this as dependency at this poi=
nt.
> > > > >
> > > > > you want to express all that is needed to get it running amicab=
ly.
> > > > > keeping in mind that we have glibc and musl based systems to se=
rvice
> > > > > it will be good to check it on musl too.
> > > > >
> > > > > >
> > > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10=
=40web.de> wrote:
> > > > > >
> > > > > > Glad that it arrived now=21 This is a really great resource m=
onitor. It is building from the git repository. Do you think it is better=
 to use the release instead=3F
> > > > > >
> > > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com> =
wrote:
> > > > > >
> > > > > > Thanks for your contribution Jan
> > > > > >
> > > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <ja=
n.claussen10=40web.de> wrote:
> > > > > > >
> > > > > > > ---
> > > > > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++=
+++++++++++++++
> > > > > > > 1 file changed, 23 insertions(+)
> > > > > > > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.=
13.bb
> > > > > > >
> > > > > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb =
b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > > new file mode 100644
> > > > > > > index 000000000..f780a993a
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > > =40=40 -0,0 +1,23 =40=40
> > > > > > > +SUMMARY =3D =22Resource monitor that shows usage and stats=
 for processor, memory, disks, network and processes.=22
> > > > > > > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
> > > > > > > +LICENSE =3D =22Apache-2.0=22
> > > > > > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef9=
6387f14655fc854ddc3c6bd57=22
> > > > > > > +SECTION =3D =22console/utils=22
> > > > > > > +
> > > > > > > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;pr=
otocol=3Dhttps;branch=3Dmain=22
> > > > > > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22
> > > > > > > +
> > > > > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > > > > +
> > > > > > > +inherit cmake
> > > > > > > +
> > > > > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > > > > + /usr/share/icons =5C
> > > > > >
> > > > > > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share
> > > > > >
> > > > > > > + /usr/share/icons/hicolor =5C
> > > > > > > + /usr/share/icons/hicolor/48x48 =5C
> > > > > > > + /usr/share/icons/hicolor/scalable =5C
> > > > > > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > > > > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > > > > > > +=22
> > > > > > > --
> > > > > > > 2.42.0
> > > > > > >
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > Links: You receive all messages sent to this group.
> > > > > > > View/Reply Online (=23106559): https://lists.openembedded.o=
rg/g/openembedded-devel/message/106559
> > > > > > > Mute This Topic: https://lists.openembedded.org/mt/10253047=
8/1997914
> > > > > > > Group Owner: openembedded-devel+owner=40lists.openembedded.=
org
> > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-=
devel/unsub =5Braj.khem=40gmail.com=5D
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > >
>


--65513471_4f46fe06_4ea0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>How did you build it=3F I have sent you a PM on IRC</div><br><div cl=
ass=3D=22gmail=5Fquote=5Fattribution=22>On Nov. 12 2023, at 9:21 pm, Khem=
 Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><blockquote><div><div>On Su=
n, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40=
web.de&gt; wrote:</div><div>&gt;</div><div>&gt; No, it is an issue I have=
 with images for the Pi Zero. I haven't build anything for musl at all, a=
lthough it would probably a good choice for the Pi Zero.</div><div>&gt;</=
div><div>&gt; I have no issues using Raspberry Pi OS or other distros btw=
, so the device is not the issue</div><br><div>As one point I have pi0 ru=
nning fine perhaps something has regressed</div><div>in meta-raspberrypi =
:( these things need TLC to keep going.</div><br><div>&gt; On Nov. 12 202=
3, at 7:49 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt=
;</div><div>&gt; hmm is that just seen with musl and works ok with glibc =
based images =3F</div><div>&gt;</div><div>&gt; TCLIBC=3Dmusl bitbake core=
-image-base</div><div>&gt;</div><div>&gt; eg. will produce a musl based i=
mage which is expected to work</div><div>&gt;</div><div>&gt; On Sun, Nov =
12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de=
&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; Unfortunately I can't=
 test it unless this gets solved (or I buy a different Raspberry Pi)</div=
><div>&gt; &gt;</div><div>&gt; &gt; https://github.com/agherzan/meta-rasp=
berrypi/issues/1229</div><div>&gt; &gt;</div><div>&gt; &gt; On Nov. 12 20=
23, at 6:43 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&g=
t; &gt;</div><div>&gt; &gt; TCLIBC=3Dmusl bitbake &lt;recipe&gt;</div><di=
v>&gt; &gt;</div><div>&gt; &gt; On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM J=
an Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt=
; &gt;</div><div>&gt; &gt; &gt; How to test it against musl btw=3F Build =
a musl-based system for Raspberry Pi and see if it runs=3F</div><div>&gt;=
 &gt; &gt;</div><div>&gt; &gt; &gt; On Nov. 12 2023, at 6:23 pm, Jan Clau=
=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt;<=
/div><div>&gt; &gt; &gt; Yes, the CMake support was added two months ago =
and the release is from 2022. Cmake is also not supported by the main dev=
eloper who seems to favor an advanced Makefile. In any case, it is easier=
 to fix than the Makefile. I will go with the git version for now then un=
til there is a new release.</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; =
&gt; On Nov. 12 2023, at 6:20 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; w=
rote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Sun, Nov 12, 2=
023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; w=
rote:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; I am tr=
ying with the tarball but it is quite hard, since it doesn't come with a =
CMakeLists.txt.</div><div>&gt; &gt; &gt; &gt; There is a recipe here, but=
 it involves a lot of patching which could potentially be painful to main=
tain</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; https://=
github.com/aristocratos/btop/issues/330=23issuecomment-1123685779</div><d=
iv>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; =
is it because cmake support was added later =3F in that case maybe using<=
/div><div>&gt; &gt; &gt; git version is ok</div><div>&gt; &gt; &gt;</div>=
<div>&gt; &gt; &gt; &gt; On Nov. 11 2023, at 8:01 pm, Khem Raj &lt;raj.kh=
em=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &l=
t;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt;</=
div><div>&gt; &gt; &gt; &gt; &gt; It also needs a utf-8 locale to work. E=
lse you have to force utf-8 mode with a flag. I haven't included this as =
dependency at this point.</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; you want to express all that is needed to get it running ami=
cably.</div><div>&gt; &gt; &gt; &gt; keeping in mind that we have glibc a=
nd musl based systems to service</div><div>&gt; &gt; &gt; &gt; it will be=
 good to check it on musl too.</div><div>&gt; &gt; &gt; &gt;</div><div>&g=
t; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Nov. 11 2023=
, at 7:35 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</di=
v><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; Glad t=
hat it arrived now=21 This is a really great resource monitor. It is buil=
ding from the git repository. Do you think it is better to use the releas=
e instead=3F</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; =
&gt; &gt; On Nov. 11 2023, at 7:30 pm, Khem Raj &lt;raj.khem=40gmail.com&=
gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &g=
t; &gt; Thanks for your contribution Jan</div><div>&gt; &gt; &gt; &gt; &g=
t;</div><div>&gt; &gt; &gt; &gt; &gt; On Sat, Nov 11, 2023 at 10:26=E2=80=
=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&=
gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; ---<=
/div><div>&gt; &gt; &gt; &gt; &gt; &gt; meta-oe/recipes-support/btop/btop=
=5F1.2.13.bb =7C 23 +++++++++++++++++++++</div><div>&gt; &gt; &gt; &gt; &=
gt; &gt; 1 file changed, 23 insertions(+)</div><div>&gt; &gt; &gt; &gt; &=
gt; &gt; create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb=
</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta=
-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; &gt; &=
gt; &gt; new file mode 100644</div><div>&gt; &gt; &gt; &gt; &gt; &gt; ind=
ex 000000000..f780a993a</div><div>&gt; &gt; &gt; &gt; &gt; &gt; --- /dev/=
null</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta-oe/recipes-suppor=
t/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; &gt; &gt; &gt; =40=40 -0=
,0 +1,23 =40=40</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +SUMMARY =3D =22R=
esource monitor that shows usage and stats for processor, memory, disks, =
network and processes.=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +HOMEPA=
GE =3D =22https://github.com/aristocratos/btop=22</div><div>&gt; &gt; &gt=
; &gt; &gt; &gt; +LICENSE =3D =22Apache-2.0=22</div><div>&gt; &gt; &gt; &=
gt; &gt; &gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef9=
6387f14655fc854ddc3c6bd57=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +SEC=
TION =3D =22console/utils=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +</d=
iv><div>&gt; &gt; &gt; &gt; &gt; &gt; +SRC=5FURI =3D =22git://github.com/=
aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain=22</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48=
b9b78=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &g=
t; &gt; &gt; &gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div>&gt; &gt; &=
gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +inherit cma=
ke</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt=
; &gt; &gt; +=46ILES:=24=7BPN=7D +=3D =22 =5C</div><div>&gt; &gt; &gt; &g=
t; &gt; &gt; + /usr/share/icons =5C</div><div>&gt; &gt; &gt; &gt; &gt;</d=
iv><div>&gt; &gt; &gt; &gt; &gt; Lets use =24=7Bdatadir=7D instead of har=
dcoded /usr/share</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt; + /usr/share/icons/hicolor =5C</div><div>&gt; &gt; &g=
t; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48 =5C</div><div>&gt; &gt=
; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalable =5C</div><div>&=
gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps =5C</d=
iv><div>&gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/ap=
ps/btop.png =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icon=
s/hicolor/scalable/apps =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; + /us=
r/share/icons/hicolor/scalable/apps/btop.svg =5C</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; +=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; --</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; 2.42.0</div><div>&gt; &gt; &gt; &gt; &gt; =
&gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt; &gt; &gt; &gt; Links: You rece=
ive all messages sent to this group.</div><div>&gt; &gt; &gt; &gt; &gt; &=
gt; View/Reply Online (=23106559): https://lists.openembedded.org/g/opene=
mbedded-devel/message/106559</div><div>&gt; &gt; &gt; &gt; &gt; &gt; Mute=
 This Topic: https://lists.openembedded.org/mt/102530478/1997914</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt; Group Owner: openembedded-devel+owner=40l=
ists.openembedded.org</div><div>&gt; &gt; &gt; &gt; &gt; &gt; Unsubscribe=
: https://lists.openembedded.org/g/openembedded-devel/unsub =5Braj.khem=40=
gmail.com=5D</div><div>&gt; &gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div></=
div></blockquote>
--65513471_4f46fe06_4ea0--


