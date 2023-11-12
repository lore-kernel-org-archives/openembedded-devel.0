Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4711DC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 17:25:03 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web10.19036.1699809893426269132
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 09:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=Tg75PSMq;
 spf=pass (domain: web.de, ip: 212.227.17.12, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699809891; x=1700414691; i=jan.claussen10@web.de;
	bh=LbGr0WNhWyK44BoYNvn1XXZ6p84PNMlXyPVPvajQGlw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=Tg75PSMq2+6FKtbPp6Cz4aOFwiXejgeQQpkwJ66kee5oWah/dmolwLNfvhB7MUZO
	 x+NxCSwVO9hinAH9rKsIFRogorMmw2WJwTel2+RKVhWSDGgV9N2P6Bd7I4kJXqPtd
	 1WCIAU9YZGzxoPPSFz3u+sKsxDwi+JUhW6vt/jEymBeKVaq+t7AG+D9+QATKOtofl
	 X7T80+/NR1oNlmIMjnNU25+hBfvLWiM7bMPlodUY8bYtv0lsoGh9ayScU7OJdNVap
	 0AdSQ3Tg1O3ucXcHAXfumuFL8GzmQh8tzEu17qZYUll9j4FmT806uCgbgSIr75rv5
	 Yn0t1k3n2VsSLBLa3g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([31.29.47.11]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMGuC-1qmLkD04Xu-00JkFp; Sun, 12
 Nov 2023 18:24:51 +0100
Date: Sun, 12 Nov 2023 18:24:50 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <3E93B590-1D58-48B3-AB82-4887A0075065@getmailspring.com>
In-Reply-To: <EA44BE37-C4A7-47D0-9361-FAC9B2D84373@getmailspring.com>
References: <EA44BE37-C4A7-47D0-9361-FAC9B2D84373@getmailspring.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65510a62_681fdeff_12072"
X-Provags-ID: V03:K1:r1bjLO37L+DJqGB+4tse69M2DzmuQob+hgiz/Bf422GICljFwT9
 Ap+CTChr9sG1ZwvzEhILdsvj0mPpfeDBhRXEc8GaRdD4HiY1yT0QZkSlhnYRCSCGuW4IyJ9
 ViTEF007TxXN/qxmGl7eUbkqFc9u5bXTl2ZA6LSowCiKqpNZqJKCsmkO/kA15S8HnGUIwaA
 Xyo19pxmQEsHWj+vly85g==
UI-OutboundReport: notjunk:1;M01:P0:WrMfX8w1Pv0=;bHsLHSrvFtCb+ZXxkuFXTSBlNDE
 JounGAAaLOInfXpvZWcLxlmDUdnsbuTF636GXni2TDp2qj2AcANb3Ft8p+uwIdKnwItFl+H/X
 zrJwHt9hSp1UvUCl5qJX3HJK9nhHACebg23YEECx0rnzLmdRQ7j++lIHwv4iIeFGJzcxmDjO8
 cGMnMC9LY31c99rCD1ntTwQO3B5E2USSrSFNE7GpfAXKKxRYsgt5kxCG6A8k+uuhSvi4dE4Tk
 zygWoD0/gkvUcYqOoC8EwdDLtVr1xhiRDrJ2GIm5NuXhVEOMAvF4Wt6cluSFmjxe301yOG16o
 ekAuBecXA1VPI2MpoDGd3FMWd0ph289FmPpK2J7fbpMGCovsZaQDTLJmKY7+hbLCjXhLYCxGy
 EnRk050Nt+rL2sYvtSC1PvEXvivoe8/QB00gkycwt5l9G5aKjcOhaArF9YT+1gIEi8l7HeKtU
 9WHZCoQDvPrceMSeXEiDdTKlbgFN2UmzAiwwWs9w10XDxS5/Cemzho4kWhS0K1hCH2r1r1WbA
 xmNzo8sTu8TEx9k5FIIBn8yBvQ+EykPvlxfhpiCr6pShGcT2CeGhzhy5jg2XkrXIi+UhtTEAK
 KGWpYEZXpsyOEJuN0oQTg9hzAWJTnlfSWplZ371YHmcgZuiG6uFjLWvYj2nYBj8ZFq5w/ualo
 X14l6TwYMdN2vuSKn6Qm1xx32cGAbRpza2gX7xTTMGyVYHJVv994v9sYErRJR2TXi1uWJ2/wb
 jg+r0EothC6DFu9QsdpQ//DQpUjN8ooqHoGaO0TIP0mchkvsHYygo7P3zOOcGUIamOWHPpCQg
 WCtwHlpy8n4xYjhUUGgIh2s8dgC7LMR6zQrjkq88KgeUvG2weUCepizfFUTrWAUpvAli45N4J
 7l/baKeAy9Cqoo58kZ4Um9Csx+zbJ8YRiNezjVyUZSDI+aZ51K13Py3p3pY+hpSTVDb6oxzGO
 1W0xluiFV3dLR1FVrFZV0W75+KA=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 17:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106596

--65510a62_681fdeff_12072
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

How to test it against musl btw=3F Build a musl-based system for Raspberr=
y Pi and see if it runs=3F

On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10=40web.de> w=
rote:
> Yes, the CMake support was added two months ago and the release is from=
 2022. Cmake is also not supported by the main developer who seems to fav=
or an advanced Makefile. In any case, it is easier to fix than the Makefi=
le. I will go with the git version for now then until there is a new rele=
ase.
>
> On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.clausse=
n10=40web.de> wrote:
> > >
> > > I am trying with the tarball but it is quite hard, since it doesn't=
 come with a CMakeLists.txt.
> > > There is a recipe here, but it involves a lot of patching which cou=
ld potentially be painful to maintain
> > >
> > > https://github.com/aristocratos/btop/issues/330=23issuecomment-1123=
685779
> > >
> >
> > is it because cmake support was added later =3F in that case maybe us=
ing
> > git version is ok
> >
> > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail.com> wrote:=

> > >
> > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.clau=
ssen10=40web.de> wrote:
> > > >
> > > > It also needs a utf-8 locale to work. Else you have to force utf-=
8 mode with a flag. I haven't included this as dependency at this point.
> > >
> > > you want to express all that is needed to get it running amicably.
> > > keeping in mind that we have glibc and musl based systems to servic=
e
> > > it will be good to check it on musl too.
> > >
> > > >
> > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10=40w=
eb.de> wrote:
> > > >
> > > > Glad that it arrived now=21 This is a really great resource monit=
or. It is building from the git repository. Do you think it is better to =
use the release instead=3F
> > > >
> > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com> wrot=
e:
> > > >
> > > > Thanks for your contribution Jan
> > > >
> > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.cl=
aussen10=40web.de> wrote:
> > > > >
> > > > > ---
> > > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++++=
+++++++++++
> > > > > 1 file changed, 23 insertions(+)
> > > > > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.b=
b
> > > > >
> > > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/me=
ta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > new file mode 100644
> > > > > index 000000000..f780a993a
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > =40=40 -0,0 +1,23 =40=40
> > > > > +SUMMARY =3D =22Resource monitor that shows usage and stats for=
 processor, memory, disks, network and processes.=22
> > > > > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
> > > > > +LICENSE =3D =22Apache-2.0=22
> > > > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57=22
> > > > > +SECTION =3D =22console/utils=22
> > > > > +
> > > > > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protoc=
ol=3Dhttps;branch=3Dmain=22
> > > > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22
> > > > > +
> > > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > > +
> > > > > +inherit cmake
> > > > > +
> > > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > > + /usr/share/icons =5C
> > > >
> > > > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share
> > > >
> > > > > + /usr/share/icons/hicolor =5C
> > > > > + /usr/share/icons/hicolor/48x48 =5C
> > > > > + /usr/share/icons/hicolor/scalable =5C
> > > > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > > > > +=22
> > > > > --
> > > > > 2.42.0
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (=23106559): https://lists.openembedded.org/g=
/openembedded-devel/message/106559
> > > > > Mute This Topic: https://lists.openembedded.org/mt/102530478/19=
97914
> > > > > Group Owner: openembedded-devel+owner=40lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-deve=
l/unsub =5Braj.khem=40gmail.com=5D
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
> >
>


--65510a62_681fdeff_12072
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>How to test it against musl btw=3F Build a musl-based system for Ras=
pberry Pi and see if it runs=3F</div><br><div class=3D=22gmail=5Fquote=5F=
attribution=22>On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen &lt;jan.clau=
ssen10=40web.de&gt; wrote:</div><blockquote><div>Yes, the CMake support w=
as added two months ago and the release is from 2022. Cmake is also not s=
upported by the main developer who seems to favor an advanced Makefile. I=
n any case, it is easier to fix than the Makefile. I will go with the git=
 version for now then until there is a new release.</div><br><div class=3D=
=22gmail=5Fquote=5Fattribution=22>On Nov. 12 2023, at 6:20 pm, Khem Raj &=
lt;raj.khem=40gmail.com&gt; wrote:</div><blockquote><div><div>On Sun, Nov=
 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de=
&gt; wrote:</div><div>&gt;</div><div>&gt; I am trying with the tarball bu=
t it is quite hard, since it doesn't come with a CMakeLists.txt.</div><di=
v>&gt; There is a recipe here, but it involves a lot of patching which co=
uld potentially be painful to maintain</div><div>&gt;</div><div>&gt; http=
s://github.com/aristocratos/btop/issues/330=23issuecomment-1123685779</di=
v><div>&gt;</div><br><div>is it because cmake support was added later =3F=
 in that case maybe using</div><div>git version is ok</div><br><div>&gt; =
On Nov. 11 2023, at 8:01 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:=
</div><div>&gt;</div><div>&gt; On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM J=
an Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt=
;</div><div>&gt; &gt; It also needs a utf-8 locale to work. Else you have=
 to force utf-8 mode with a flag. I haven't included this as dependency a=
t this point.</div><div>&gt;</div><div>&gt; you want to express all that =
is needed to get it running amicably.</div><div>&gt; keeping in mind that=
 we have glibc and musl based systems to service</div><div>&gt; it will b=
e good to check it on musl too.</div><div>&gt;</div><div>&gt; &gt;</div><=
div>&gt; &gt; On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen &lt;jan.claus=
sen10=40web.de&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; Glad th=
at it arrived now=21 This is a really great resource monitor. It is build=
ing from the git repository. Do you think it is better to use the release=
 instead=3F</div><div>&gt; &gt;</div><div>&gt; &gt; On Nov. 11 2023, at 7=
:30 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt;<=
/div><div>&gt; &gt; Thanks for your contribution Jan</div><div>&gt; &gt;<=
/div><div>&gt; &gt; On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9F=
en &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt;</div><=
div>&gt; &gt; &gt; ---</div><div>&gt; &gt; &gt; meta-oe/recipes-support/b=
top/btop=5F1.2.13.bb =7C 23 +++++++++++++++++++++</div><div>&gt; &gt; &gt=
; 1 file changed, 23 insertions(+)</div><div>&gt; &gt; &gt; create mode 1=
00644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &=
gt;</div><div>&gt; &gt; &gt; diff --git a/meta-oe/recipes-support/btop/bt=
op=5F1.2.13.bb b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>=
&gt; &gt; &gt; new file mode 100644</div><div>&gt; &gt; &gt; index 000000=
000..f780a993a</div><div>&gt; &gt; &gt; --- /dev/null</div><div>&gt; &gt;=
 &gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; =
&gt; &gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; &gt; &gt; +SUMMARY =3D =
=22Resource monitor that shows usage and stats for processor, memory, dis=
ks, network and processes.=22</div><div>&gt; &gt; &gt; +HOMEPAGE =3D =22h=
ttps://github.com/aristocratos/btop=22</div><div>&gt; &gt; &gt; +LICENSE =
=3D =22Apache-2.0=22</div><div>&gt; &gt; &gt; +LIC=5F=46ILES=5FCHKSUM =3D=
 =22file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=22</div><div>&g=
t; &gt; &gt; +SECTION =3D =22console/utils=22</div><div>&gt; &gt; &gt; +<=
/div><div>&gt; &gt; &gt; +SRC=5FURI =3D =22git://github.com/aristocratos/=
btop.git;protocol=3Dhttps;branch=3Dmain=22</div><div>&gt; &gt; &gt; +SRCR=
EV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22</div><div>&gt; &gt;=
 &gt; +</div><div>&gt; &gt; &gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><=
div>&gt; &gt; &gt; +</div><div>&gt; &gt; &gt; +inherit cmake</div><div>&g=
t; &gt; &gt; +</div><div>&gt; &gt; &gt; +=46ILES:=24=7BPN=7D +=3D =22 =5C=
</div><div>&gt; &gt; &gt; + /usr/share/icons =5C</div><div>&gt; &gt;</div=
><div>&gt; &gt; Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share=
</div><div>&gt; &gt;</div><div>&gt; &gt; &gt; + /usr/share/icons/hicolor =
=5C</div><div>&gt; &gt; &gt; + /usr/share/icons/hicolor/48x48 =5C</div><d=
iv>&gt; &gt; &gt; + /usr/share/icons/hicolor/scalable =5C</div><div>&gt; =
&gt; &gt; + /usr/share/icons/hicolor/48x48/apps =5C</div><div>&gt; &gt; &=
gt; + /usr/share/icons/hicolor/48x48/apps/btop.png =5C</div><div>&gt; &gt=
; &gt; + /usr/share/icons/hicolor/scalable/apps =5C</div><div>&gt; &gt; &=
gt; + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C</div><div>&gt; =
&gt; &gt; +=22</div><div>&gt; &gt; &gt; --</div><div>&gt; &gt; &gt; 2.42.=
0</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt; Links: You receive all =
messages sent to this group.</div><div>&gt; &gt; &gt; View/Reply Online (=
=23106559): https://lists.openembedded.org/g/openembedded-devel/message/1=
06559</div><div>&gt; &gt; &gt; Mute This Topic: https://lists.openembedde=
d.org/mt/102530478/1997914</div><div>&gt; &gt; &gt; Group Owner: openembe=
dded-devel+owner=40lists.openembedded.org</div><div>&gt; &gt; &gt; Unsubs=
cribe: https://lists.openembedded.org/g/openembedded-devel/unsub =5Braj.k=
hem=40gmail.com=5D</div><div>&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt;</div></div></blockquote></block=
quote>
--65510a62_681fdeff_12072--


