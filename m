Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D5AC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 18:24:03 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web11.20363.1699813435521140634
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 10:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=bICMSXFz;
 spf=pass (domain: web.de, ip: 217.72.192.78, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699813433; x=1700418233; i=jan.claussen10@web.de;
	bh=dr/VLhDWavAEluB3xEk+zoqRbGeupQOJHJmlVtNWC1s=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=bICMSXFzZzFRse00580CZQgPQFdE91Jb/XJCkRIOrJH0/WJapoTS4joieUOeBC3H
	 PAMfhOb/EaAW9oXPRaUq0mhdjn/JM1XFbrhvb+Bwo1EjC+GLGmJ4cj4Jo9/IpufaK
	 qbuQ621imngkZ/rTOm/jnvgCBfLm2+QuUlkKtXFWVFPvV1HgkN4NIRmCKWhqWZZz2
	 Rhmd2PhyAOWrupjy9Pdn806PlI5iGLp8YrCCvyJ0c0yt1GwE7jJBH7yzFzPnn/2lT
	 XlwCoE6y59PdItWHJCsafn78o2s/8nrCbJTFeOgWzpkvzGhuYNXPj8uvbY6mE7aav
	 I7NbjibVUPfCOma2fg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([31.29.47.11]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MftBr-1rZ4xk1Vbl-00foVb; Sun, 12
 Nov 2023 19:23:53 +0100
Date: Sun, 12 Nov 2023 19:23:52 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <616DF2BB-0679-45D9-AE12-0A5006A2A840@getmailspring.com>
In-Reply-To: <CAMKF1sq55zsKUM24WVKusuQCvGjG9CgXCuVHxvaX8hTMtvD49g@mail.gmail.com>
References: <CAMKF1sq55zsKUM24WVKusuQCvGjG9CgXCuVHxvaX8hTMtvD49g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65511838_50c8e6b3_4ea0"
X-Provags-ID: V03:K1:R+ek0uv91p90ttFgptuNwjRXUc07IqyDiQbA/gzrqZyIARm8py0
 MkteCzFpGaHk5WH6DnoyDs44ozVrvwhfYN6hKhnYQZDNdNPaR6WmIcu7f5TbzgRhDihFf6H
 LwMYGdkweMD/9KP6S/WtpmO1KlmJY7gBThiHfdUehD1s9rNdwJzAF6oX7izIIOJK8dpj+c5
 qvFWBCWz2Rf0EF9vmurJA==
UI-OutboundReport: notjunk:1;M01:P0:DSkv4SQESdA=;6HerkDUne1n3yWe93VB709xNCD0
 ILzdAo3m6MW6Jo7Rynl5oAQ6xeV8zeCEu3REDppq0fT2ZIlSbTRHxSDugtMD849K/lM7Kz5HZ
 A/sGkiBilbyvcMfImlzSM2P1Uyey9cW4QLD5U1Mz93Nv6i9yRTzw0J2Rps8WTpALVwB4mjFtO
 4md57TXBxajkJQA2pOMKIv3NKBs27UWJQC743mMWer1PBahCtZDCGm4NuvG/vzvsxPKIuvcto
 seHQy/0cTwSBkpG/hXBpFKJvDSxd23sybacz2lGY5NTnD632GunDUN87xcA8kM23W1wk6cFM/
 V/XVyuw0m5XHEEwucxSQxawAL3f5tjV3g7GLPQJzbSQiTj3L0UdeNWoSrIKNULzPM5mmhH1w0
 ZovceTRPkXNlTbq02Feuny4ASaXZPDouoj+61dCHmNtOvOyMSXxuOcXpSebtI5beZR/13RoWs
 +sjCbshD4J2KCSUQlahm7vCSJFzmQZw3o0F3aevfCe3wAiU+HJRodmjbqm10xPIudE6PnKbBH
 NNRCIsrQiN8OPgZsKtmfxx6ZhJbWdKPfm/Li/hQNVE0a3g3bXUrPaAuihXWek9pzrzt/zbz0A
 6x8rEfgU9Kk89LbeQPIUbsktzwM1cT9fiDmdz7GIEDGnKO0w8R42FCKm4QH3KDw4dKk7VzYT2
 4wQZQpo51t0a+6MBMSQBGKe5BBwju5+49G/VA3CAMoOipn570wg2BcjF9BZwOPxHXfofJNE0T
 +LrfrUSrI/uLmwAiHMBPvf7AyptQVdQxdzJwyLUKnp68z1K+HI4oY6yPpvHBk8l/2yxbGx0XL
 biZsi4CVhQ5U+t4GB3VDx3NUUaIWRmB/gPSNxDU5qZkdnccr2Bl/WZeWYHA90mJ9Ii0L2GyJG
 cLwnFUs8NLFRHd6Xa15Ajlax3cgWgv5kGVasarsB/Siu3IXmXRwUu01O2+0RVYKylIgQcRuVS
 Ze8E4Q==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 18:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106599

--65511838_50c8e6b3_4ea0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Unfortunately I can't test it unless this gets solved (or I buy a differe=
nt Raspberry Pi)

https://github.com/agherzan/meta-raspberrypi/issues/1229
On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> TCLIBC=3Dmusl bitbake <recipe>
>
> On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen1=
0=40web.de> wrote:
> >
> > How to test it against musl btw=3F Build a musl-based system for Rasp=
berry Pi and see if it runs=3F
> >
> > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10=40web.d=
e> wrote:
> >
> > Yes, the CMake support was added two months ago and the release is fr=
om 2022. Cmake is also not supported by the main developer who seems to f=
avor an advanced Makefile. In any case, it is easier to fix than the Make=
file. I will go with the git version for now then until there is a new re=
lease.
> >
> > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> >
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
>


--65511838_50c8e6b3_4ea0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Unfortunately I can't test it unless this gets solved (or I buy a di=
fferent Raspberry Pi)</div><br><div><a href=3D=22https://github.com/agher=
zan/meta-raspberrypi/issues/1229=22 title=3D=22https://github.com/agherza=
n/meta-raspberrypi/issues/1229=22>https://github.com/agherzan/meta-raspbe=
rrypi/issues/1229</a></div><br><div class=3D=22gmail=5Fquote=5Fattributio=
n=22>On Nov. 12 2023, at 6:43 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; w=
rote:</div><blockquote><div><div>TCLIBC=3Dmusl bitbake &lt;recipe&gt;</di=
v><br><div>On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen &lt;j=
an.claussen10=40web.de&gt; wrote:</div><div>&gt;</div><div>&gt; How to te=
st it against musl btw=3F Build a musl-based system for Raspberry Pi and =
see if it runs=3F</div><div>&gt;</div><div>&gt; On Nov. 12 2023, at 6:23 =
pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt=
;</div><div>&gt; Yes, the CMake support was added two months ago and the =
release is from 2022. Cmake is also not supported by the main developer w=
ho seems to favor an advanced Makefile. In any case, it is easier to fix =
than the Makefile. I will go with the git version for now then until ther=
e is a new release.</div><div>&gt;</div><div>&gt; On Nov. 12 2023, at 6:2=
0 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt;</div><d=
iv>&gt; On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.=
claussen10=40web.de&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; I =
am trying with the tarball but it is quite hard, since it doesn't come wi=
th a CMakeLists.txt.</div><div>&gt; &gt; There is a recipe here, but it i=
nvolves a lot of patching which could potentially be painful to maintain<=
/div><div>&gt; &gt;</div><div>&gt; &gt; https://github.com/aristocratos/b=
top/issues/330=23issuecomment-1123685779</div><div>&gt; &gt;</div><div>&g=
t;</div><div>&gt; is it because cmake support was added later =3F in that=
 case maybe using</div><div>&gt; git version is ok</div><div>&gt;</div><d=
iv>&gt; &gt; On Nov. 11 2023, at 8:01 pm, Khem Raj &lt;raj.khem=40gmail.c=
om&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; On Sat, Nov 11, 202=
3 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wr=
ote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; It also needs a ut=
f-8 locale to work. Else you have to force utf-8 mode with a flag. I have=
n't included this as dependency at this point.</div><div>&gt; &gt;</div><=
div>&gt; &gt; you want to express all that is needed to get it running am=
icably.</div><div>&gt; &gt; keeping in mind that we have glibc and musl b=
ased systems to service</div><div>&gt; &gt; it will be good to check it o=
n musl too.</div><div>&gt; &gt;</div><div>&gt; &gt; &gt;</div><div>&gt; &=
gt; &gt; On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=
=40web.de&gt; wrote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; Gl=
ad that it arrived now=21 This is a really great resource monitor. It is =
building from the git repository. Do you think it is better to use the re=
lease instead=3F</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Nov=
. 11 2023, at 7:30 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div>=
<div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; Thanks for your contribution=
 Jan</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Sat, Nov 11, 20=
23 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; w=
rote:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; ---</di=
v><div>&gt; &gt; &gt; &gt; meta-oe/recipes-support/btop/btop=5F1.2.13.bb =
=7C 23 +++++++++++++++++++++</div><div>&gt; &gt; &gt; &gt; 1 file changed=
, 23 insertions(+)</div><div>&gt; &gt; &gt; &gt; create mode 100644 meta-=
oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; &gt;</d=
iv><div>&gt; &gt; &gt; &gt; diff --git a/meta-oe/recipes-support/btop/bto=
p=5F1.2.13.bb b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&=
gt; &gt; &gt; &gt; new file mode 100644</div><div>&gt; &gt; &gt; &gt; ind=
ex 000000000..f780a993a</div><div>&gt; &gt; &gt; &gt; --- /dev/null</div>=
<div>&gt; &gt; &gt; &gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13=
.bb</div><div>&gt; &gt; &gt; &gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt;=
 &gt; &gt; &gt; +SUMMARY =3D =22Resource monitor that shows usage and sta=
ts for processor, memory, disks, network and processes.=22</div><div>&gt;=
 &gt; &gt; &gt; +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22<=
/div><div>&gt; &gt; &gt; &gt; +LICENSE =3D =22Apache-2.0=22</div><div>&gt=
; &gt; &gt; &gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57=22</div><div>&gt; &gt; &gt; &gt; +SECTION =3D=
 =22console/utils=22</div><div>&gt; &gt; &gt; &gt; +</div><div>&gt; &gt; =
&gt; &gt; +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protoc=
ol=3Dhttps;branch=3Dmain=22</div><div>&gt; &gt; &gt; &gt; +SRCREV =3D =22=
2a864f6f2ea60df16b3f015885eb3c18a48b9b78=22</div><div>&gt; &gt; &gt; &gt;=
 +</div><div>&gt; &gt; &gt; &gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><=
div>&gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; +inherit cmake</d=
iv><div>&gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; +=46ILES:=24=7B=
PN=7D +=3D =22 =5C</div><div>&gt; &gt; &gt; &gt; + /usr/share/icons =5C</=
div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; Lets use =24=7Bdatadir=7D=
 instead of hardcoded /usr/share</div><div>&gt; &gt; &gt;</div><div>&gt; =
&gt; &gt; &gt; + /usr/share/icons/hicolor =5C</div><div>&gt; &gt; &gt; &g=
t; + /usr/share/icons/hicolor/48x48 =5C</div><div>&gt; &gt; &gt; &gt; + /=
usr/share/icons/hicolor/scalable =5C</div><div>&gt; &gt; &gt; &gt; + /usr=
/share/icons/hicolor/48x48/apps =5C</div><div>&gt; &gt; &gt; &gt; + /usr/=
share/icons/hicolor/48x48/apps/btop.png =5C</div><div>&gt; &gt; &gt; &gt;=
 + /usr/share/icons/hicolor/scalable/apps =5C</div><div>&gt; &gt; &gt; &g=
t; + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C</div><div>&gt; &=
gt; &gt; &gt; +=22</div><div>&gt; &gt; &gt; &gt; --</div><div>&gt; &gt; &=
gt; &gt; 2.42.0</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &g=
t; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt;=
 &gt; Links: You receive all messages sent to this group.</div><div>&gt; =
&gt; &gt; &gt; View/Reply Online (=23106559): https://lists.openembedded.=
org/g/openembedded-devel/message/106559</div><div>&gt; &gt; &gt; &gt; Mut=
e This Topic: https://lists.openembedded.org/mt/102530478/1997914</div><d=
iv>&gt; &gt; &gt; &gt; Group Owner: openembedded-devel+owner=40lists.open=
embedded.org</div><div>&gt; &gt; &gt; &gt; Unsubscribe: https://lists.ope=
nembedded.org/g/openembedded-devel/unsub =5Braj.khem=40gmail.com=5D</div>=
<div>&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</d=
iv><div>&gt; &gt; &gt; &gt;</div></div></blockquote>
--65511838_50c8e6b3_4ea0--


