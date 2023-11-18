Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07A0C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 13:51:13 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web10.8394.1700315467608936815
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 05:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=NLBkLcX3;
 spf=pass (domain: web.de, ip: 217.72.192.78, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700315465; x=1700920265; i=jan.claussen10@web.de;
	bh=XjW0jL1iD90jDI1ElR+JIoHF34noJ18OTJr7b3P9elU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=NLBkLcX3sYw+TOyM1QrWzvcYd7d1iH7E5dO1H9vLNIgwoDng1OuefmwvM86n8c5N
	 CvtAxSR+dVngOL3DrZKnqY28U6MwJ7STecUeCWOcyArCXbhO5jrtK5cdZDXj8VKJb
	 5BaUdafgRDXSlgNlB71jCdJinpdNOLVRhFDtZbYeB/PokO3vmvlnooiAtOewxo3cp
	 ONjmqOKfTJlCDqQtcamEmdQkJqyQkDjE96ya62tX/HzAvz1TECet45mmv5PVseDfy
	 KpGSLcYNuG0huOjavaQYRbA/VxlJhVVr7Rn5NApfluJrl0nfiseeRR/ZLCljc9/7E
	 rOs6f2qUG7qYpDg2HQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([195.123.103.85]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBjIE-1rC6210wPs-00CYDY; Sat, 18
 Nov 2023 14:51:05 +0100
Date: Sat, 18 Nov 2023 14:51:04 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <D5F6E8F4-14B1-4CFF-A966-2215804A8D87@getmailspring.com>
In-Reply-To: <CAMKF1spC66qx=abKfbYuJoP_5pu_WmGxpr3+S5gq4ttKzsSyRg@mail.gmail.com>
References: <CAMKF1spC66qx=abKfbYuJoP_5pu_WmGxpr3+S5gq4ttKzsSyRg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6558c148_3ab42e65_13022c"
X-Provags-ID: V03:K1:DJ6GnsobHvrmZEqTaufN3ATIUAAgqK1qxn31Fi7rxA/bpONLWrD
 5WytnUYOD3Q8KwEPLDyTh59zVNq9Y8Sbb8fWsa/bFGoBSQziB0B9GVnkGVJV/f8PxJ4dyxo
 e0gELmsYZCMn6XCXwvA2rVo5qV7Z9YPpaXg8TyWgY86aZVV+4lSGuIqcUkbyJIr02N90nhj
 PWxQjtJmNHN2zRGVZvVtw==
UI-OutboundReport: notjunk:1;M01:P0:farqBT/i70w=;IIr1nQ67UdFq2Vcb3I/0gTFysSU
 +4Q+ALaYz4woyRzR1a+SPF1wPy9KJsopzXkDWgDH3ou+3kdRB0zwAULtUO+S5Y9u8GBZXLRK6
 VtcgOvlc95UKoDfcin3C5mag46stgw//ohiscPjn/gK53mZp/EzaZAkMHXR0t7nLDD7NtAqcj
 eBWMytHUlNt/V2QfJon5tNoFEMUXx7nGKfx9NSLCejCFcakLaLmdoUvx7yN7Xn6NNEhfUexxU
 jWWbrJj/HxZhQuAQ1/8AvZV7kY3XB4des21ruek8MsaayiC5hUvF/fDJNE56P0rrUNX8nELLK
 v+GwQxJBDWMQOBMUVuhNLoahYIo0SiLsWvfycZXg8T5YKyJoCDMOuaZcP4TktpFwPEja0ViAT
 jOAysQrmiX1/VrCSPPE6ABKEVgIehxl66qF8BiRfuwt2QuN6rIltJleHx3Pfpw4mUlLZGht+o
 lq9W2uA6iefdkHQ5mFVORUSzKpFyEV7lB2Ea2GdVf8tWHMkyGApxucoJWfPVgZMIqnoP5W7fv
 ipfxqjBuvWsLcCuHTqmey6NIYSM17zBBwmR+QixvuTEJ5yJcUpowHrqYMYKVHuPbfNJ5SFHR8
 +q/GthPcAtQEebXio1uXSRnd9u8See8BkWL1dyh+Xk1/DmpdC11Ohd/Xgx+zgig0XvlJrQACR
 m7CiqOm4WShn+ZYiIARyquorF7EkuPlk1fB29IPaRYWUE+Vb254YmIQ2v6Q5wIDkQbCpMbl6F
 KlA0sMpTDkXTM4YSjnZMLH8riXUDrT3sPbLNmI/0mM74MPhpoIXLXx/weHCuYB3ouaq1WHQKF
 A6O6KuYj4a1rTE4fW7OEwUcDe8FleNfMeN8Tsv0hEVmsIGj6z9W1lCG0cb27LfQlB783xlXf/
 jgheE8UYOHneF9cAfhJwzDd3f1ozj0KVDczH8JOfNx35ktfUbxnJeMh24Ruh3Qu/SRJQ5msNk
 ePX2io/27MiWRS8AEhAvT8jj1Rw=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 13:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106884

--6558c148_3ab42e65_13022c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

So in this case it shoule be alright like this. The developer will have t=
o take care to set its proper locale, but apart from that everything work=
s.

=46rom b242979231f4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2001
=46rom: =3D=3FUT=46-8=3Fq=3FJan=3D20Clau=3DC3=3D9=46en=3F=3D <jan.clausse=
n10=40web.de>
Date: Sat, 18 Nov 2023 14:45:27 +0100
Subject: =5BPATCH=5D meta-oe: recipes-support: Add btop
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUT=46-8
Content-Transfer-Encoding: 8bit

Adds btop, the shell-based resource monitor that shows usage and stats fo=
r processor, memory, disks, network and processes.
Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10=40web.de>
---
meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++++++++++++++=
+
1 file changed, 23 insertions(+)
create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb

diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/reci=
pes-support/btop/btop=5F1.2.13.bb
new file mode 100644
index 000000000..a944fe7b5
--- /dev/null
+++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
=40=40 -0,0 +1,23 =40=40
+SUMMARY =3D =22Resource monitor that shows usage and stats for processor=
, memory, disks, network and processes.=22
+HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
+LICENSE =3D =22Apache-2.0=22
+LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57=22
+SECTION =3D =22console/utils=22
+
+SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3Dhttps=
;branch=3Dmain=22
+SRCREV =3D =229edbf27f1b6d5844a97325fcda732762ba086a99=22
+
+S =3D =22=24=7BWORKDIR=7D/git=22
+
+inherit cmake
+
+=46ILES:=24=7BPN=7D +=3D =22 =5C
+ =24=7Bdatadir=7D/icons =5C
+ =24=7Bdatadir=7D/icons/hicolor =5C
+ =24=7Bdatadir=7D/icons/hicolor/48x48 =5C
+ =24=7Bdatadir=7D/icons/hicolor/scalable =5C
+ =24=7Bdatadir=7D/icons/hicolor/48x48/apps =5C
+ =24=7Bdatadir=7D/icons/hicolor/48x48/apps/btop.png =5C
+ =24=7Bdatadir=7D/icons/hicolor/scalable/apps =5C
+ =24=7Bdatadir=7D/icons/hicolor/scalable/apps/btop.svg =5C
+=22
--
2.42.1

On Nov. 14 2023, at 9:43 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen <jan.claussen=
10=40web.de> wrote:
> >
> > So I have just tested btop on musl succesfully.
> >
>
> OK
> > I am questioning the need for the locales though. You can run btop wi=
th the --utf-force flag and it will work well. If you want to run it with=
out this flag, you'll need to not only install the locales, but also add
> >
> > LC=5FALL=3Den=5FUS.UT=46-8
> > LANG=3Den=5FUS.UT=46-8
> >
>
> yeah if it can work without it, that would be great
> > to /etc/profile as a minimum. This would force the user to use these =
locales. It would also require a .bbappend on base-files and I don't thin=
k that this is a good idea.
> >
> > On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen <jan.claussen10=40web.d=
e> wrote:
> >
> > How did you build it=3F I have sent you a PM on IRC
> >
> > On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> >
> > On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10=40web.de> wrote:
> > >
> > > No, it is an issue I have with images for the Pi Zero. I haven't bu=
ild anything for musl at all, although it would probably a good choice fo=
r the Pi Zero.
> > >
> > > I have no issues using Raspberry Pi OS or other distros btw, so the=
 device is not the issue
> >
> > As one point I have pi0 running fine perhaps something has regressed
> > in meta-raspberrypi :( these things need TLC to keep going.
> >
> > > On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem=40gmail.com> wrote:=

> > >
> > > hmm is that just seen with musl and works ok with glibc based image=
s =3F
> > >
> > > TCLIBC=3Dmusl bitbake core-image-base
> > >
> > > eg. will produce a musl based image which is expected to work
> > >
> > > On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.clau=
ssen10=40web.de> wrote:
> > > >
> > > > Unfortunately I can't test it unless this gets solved (or I buy a=
 different Raspberry Pi)
> > > >
> > > > https://github.com/agherzan/meta-raspberrypi/issues/1229
> > > >
> > > > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem=40gmail.com> wrot=
e:
> > > >
> > > > TCLIBC=3Dmusl bitbake <recipe>
> > > >
> > > > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.cla=
ussen10=40web.de> wrote:
> > > > >
> > > > > How to test it against musl btw=3F Build a musl-based system fo=
r Raspberry Pi and see if it runs=3F
> > > > >
> > > > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10=40=
web.de> wrote:
> > > > >
> > > > > Yes, the CMake support was added two months ago and the release=
 is from 2022. Cmake is also not supported by the main developer who seem=
s to favor an advanced Makefile. In any case, it is easier to fix than th=
e Makefile. I will go with the git version for now then until there is a =
new release.
> > > > >
> > > > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.com> wr=
ote:
> > > > >
> > > > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.c=
laussen10=40web.de> wrote:
> > > > > >
> > > > > > I am trying with the tarball but it is quite hard, since it d=
oesn't come with a CMakeLists.txt.
> > > > > > There is a recipe here, but it involves a lot of patching whi=
ch could potentially be painful to maintain
> > > > > >
> > > > > > https://github.com/aristocratos/btop/issues/330=23issuecommen=
t-1123685779
> > > > > >
> > > > >
> > > > > is it because cmake support was added later =3F in that case ma=
ybe using
> > > > > git version is ok
> > > > >
> > > > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail.com> =
wrote:
> > > > > >
> > > > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <ja=
n.claussen10=40web.de> wrote:
> > > > > > >
> > > > > > > It also needs a utf-8 locale to work. Else you have to forc=
e utf-8 mode with a flag. I haven't included this as dependency at this p=
oint.
> > > > > >
> > > > > > you want to express all that is needed to get it running amic=
ably.
> > > > > > keeping in mind that we have glibc and musl based systems to =
service
> > > > > > it will be good to check it on musl too.
> > > > > >
> > > > > > >
> > > > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen=
10=40web.de> wrote:
> > > > > > >
> > > > > > > Glad that it arrived now=21 This is a really great resource=
 monitor. It is building from the git repository. Do you think it is bett=
er to use the release instead=3F
> > > > > > >
> > > > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com=
> wrote:
> > > > > > >
> > > > > > > Thanks for your contribution Jan
> > > > > > >
> > > > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <=
jan.claussen10=40web.de> wrote:
> > > > > > > >
> > > > > > > > ---
> > > > > > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++=
+++++++++++++++++
> > > > > > > > 1 file changed, 23 insertions(+)
> > > > > > > > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.=
2.13.bb
> > > > > > > >
> > > > > > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.b=
b b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000..f780a993a
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > > > =40=40 -0,0 +1,23 =40=40
> > > > > > > > +SUMMARY =3D =22Resource monitor that shows usage and sta=
ts for processor, memory, disks, network and processes.=22
> > > > > > > > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
> > > > > > > > +LICENSE =3D =22Apache-2.0=22
> > > > > > > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57=22
> > > > > > > > +SECTION =3D =22console/utils=22
> > > > > > > > +
> > > > > > > > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;=
protocol=3Dhttps;branch=3Dmain=22
> > > > > > > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22=

> > > > > > > > +
> > > > > > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > > > > > +
> > > > > > > > +inherit cmake
> > > > > > > > +
> > > > > > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > > > > > + /usr/share/icons =5C
> > > > > > >
> > > > > > > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share
> > > > > > >
> > > > > > > > + /usr/share/icons/hicolor =5C
> > > > > > > > + /usr/share/icons/hicolor/48x48 =5C
> > > > > > > > + /usr/share/icons/hicolor/scalable =5C
> > > > > > > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > > > > > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > > > > > > > +=22
> > > > > > > > --
> > > > > > > > 2.42.0
> > > > > > > >
> > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > Links: You receive all messages sent to this group.
> > > > > > > > View/Reply Online (=23106559): https://lists.openembedded=
.org/g/openembedded-devel/message/106559
> > > > > > > > Mute This Topic: https://lists.openembedded.org/mt/102530=
478/1997914
> > > > > > > > Group Owner: openembedded-devel+owner=40lists.openembedde=
d.org
> > > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedde=
d-devel/unsub =5Braj.khem=40gmail.com=5D
> > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > >
>


--6558c148_3ab42e65_13022c
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>So in this case it shoule be alright like this. The developer will h=
ave to take care to set its proper locale, but apart from that everything=
 works.</div><br><div><font style=3D=22font-family:monospace=22>=46rom b2=
42979231f4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2001</font></d=
iv><div><font style=3D=22font-family:monospace=22>=46rom: =3D=3FUT=46-8=3F=
q=3FJan=3D20Clau=3DC3=3D9=46en=3F=3D &lt;jan.claussen10=40web.de&gt;</fon=
t></div><div><font style=3D=22font-family:monospace=22>Date: Sat, 18 Nov =
2023 14:45:27 +0100</font></div><div><font style=3D=22font-family:monospa=
ce=22>Subject: =5BPATCH=5D meta-oe: recipes-support: Add btop</font></div=
><div><font style=3D=22font-family:monospace=22>MIME-Version: 1.0</font><=
/div><div><font style=3D=22font-family:monospace=22>Content-Type: text/pl=
ain; charset=3DUT=46-8</font></div><div><font style=3D=22font-family:mono=
space=22>Content-Transfer-Encoding: 8bit</font></div><br><div><font style=
=3D=22font-family:monospace=22>Adds btop, the shell-based resource monito=
r that shows usage and stats for processor, memory, disks, network and pr=
ocesses.</font></div><br><div><font style=3D=22font-family:monospace=22>S=
igned-off-by: Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt;</font></di=
v><div><font style=3D=22font-family:monospace=22>---</font></div><div><fo=
nt style=3D=22font-family:monospace=22>&nbsp;meta-oe/recipes-support/btop=
/btop=5F1.2.13.bb =7C 23 +++++++++++++++++++++</font></div><div><font sty=
le=3D=22font-family:monospace=22>&nbsp;1 file changed, 23 insertions(+)</=
font></div><div><font style=3D=22font-family:monospace=22>&nbsp;create mo=
de 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb</font></div><br><=
div><font style=3D=22font-family:monospace=22>diff --git a/meta-oe/recipe=
s-support/btop/btop=5F1.2.13.bb b/meta-oe/recipes-support/btop/btop=5F1.2=
.13.bb</font></div><div><font style=3D=22font-family:monospace=22>new fil=
e mode 100644</font></div><div><font style=3D=22font-family:monospace=22>=
index 000000000..a944fe7b5</font></div><div><font style=3D=22font-family:=
monospace=22>--- /dev/null</font></div><div><font style=3D=22font-family:=
monospace=22>+++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</font></=
div><div><font style=3D=22font-family:monospace=22>=40=40 -0,0 +1,23 =40=40=
</font></div><div><font style=3D=22font-family:monospace=22>+SUMMARY =3D =
=22Resource monitor that shows usage and stats for processor, memory, dis=
ks, network and processes.=22</font></div><div><font style=3D=22font-fami=
ly:monospace=22>+HOMEPAGE =3D =22https://github.com/aristocratos/btop=22<=
/font></div><div><font style=3D=22font-family:monospace=22>+LICENSE =3D =22=
Apache-2.0=22</font></div><div><font style=3D=22font-family:monospace=22>=
+LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57=22</font></div><div><font style=3D=22font-family:monospace=22=
>+SECTION =3D =22console/utils=22</font></div><div><font style=3D=22font-=
family:monospace=22>+</font></div><div><font style=3D=22font-family:monos=
pace=22>+SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=
=3Dhttps;branch=3Dmain=22</font></div><div><font style=3D=22font-family:m=
onospace=22>+SRCREV =3D =229edbf27f1b6d5844a97325fcda732762ba086a99=22</f=
ont></div><div><font style=3D=22font-family:monospace=22>+</font></div><d=
iv><font style=3D=22font-family:monospace=22>+S =3D =22=24=7BWORKDIR=7D/g=
it=22</font></div><div><font style=3D=22font-family:monospace=22>+</font>=
</div><div><font style=3D=22font-family:monospace=22>+inherit cmake</font=
></div><div><font style=3D=22font-family:monospace=22>+</font></div><div>=
<font style=3D=22font-family:monospace=22>+=46ILES:=24=7BPN=7D +=3D =22 =5C=
</font></div><div><font style=3D=22font-family:monospace=22>+&nbsp;&nbsp;=
&nbsp; =24=7Bdatadir=7D/icons =5C</font></div><div><font style=3D=22font-=
family:monospace=22>+&nbsp;&nbsp;&nbsp; =24=7Bdatadir=7D/icons/hicolor =5C=
</font></div><div><font style=3D=22font-family:monospace=22>+&nbsp;&nbsp;=
&nbsp; =24=7Bdatadir=7D/icons/hicolor/48x48 =5C</font></div><div><font st=
yle=3D=22font-family:monospace=22>+&nbsp;&nbsp;&nbsp; =24=7Bdatadir=7D/ic=
ons/hicolor/scalable =5C</font></div><div><font style=3D=22font-family:mo=
nospace=22>+&nbsp;&nbsp;&nbsp; =24=7Bdatadir=7D/icons/hicolor/48x48/apps =
=5C</font></div><div><font style=3D=22font-family:monospace=22>+&nbsp;&nb=
sp;&nbsp; =24=7Bdatadir=7D/icons/hicolor/48x48/apps/btop.png =5C</font></=
div><div><font style=3D=22font-family:monospace=22>+&nbsp;&nbsp;&nbsp; =24=
=7Bdatadir=7D/icons/hicolor/scalable/apps =5C</font></div><div><font styl=
e=3D=22font-family:monospace=22>+&nbsp;&nbsp;&nbsp; =24=7Bdatadir=7D/icon=
s/hicolor/scalable/apps/btop.svg =5C</font></div><div><font style=3D=22fo=
nt-family:monospace=22>+=22</font></div><div><font style=3D=22font-family=
:monospace=22>-- </font></div><div><font style=3D=22font-family:monospace=
=22>2.42.1</font></div><br><div class=3D=22gmail=5Fquote=5Fattribution=22=
>On Nov. 14 2023, at 9:43 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote=
:</div><blockquote><div><div>On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan=
 Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt;</div>=
<div>&gt; So I have just tested btop on musl succesfully.</div><div>&gt;<=
/div><br><div>OK</div><br><div>&gt; I am questioning the need for the loc=
ales though. You can run btop with the --utf-force flag and it will work =
well. If you want to run it without this flag, you'll need to not only in=
stall the locales, but also add</div><div>&gt;</div><div>&gt; LC=5FALL=3D=
en=5FUS.UT=46-8</div><div>&gt; LANG=3Den=5FUS.UT=46-8</div><div>&gt;</div=
><br><div>yeah if it can work without it, that would be great</div><br><d=
iv>&gt; to /etc/profile as a minimum. This would force the user to use th=
ese locales. It would also require a .bbappend on base-files and I don't =
think that this is a good idea.</div><div>&gt;</div><div>&gt; On Nov. 12 =
2023, at 9:24 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:=
</div><div>&gt;</div><div>&gt; How did you build it=3F I have sent you a =
PM on IRC</div><div>&gt;</div><div>&gt; On Nov. 12 2023, at 9:21 pm, Khem=
 Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt;</div><div>&gt; On=
 Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen1=
0=40web.de&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; No, it is a=
n issue I have with images for the Pi Zero. I haven't build anything for =
musl at all, although it would probably a good choice for the Pi Zero.</d=
iv><div>&gt; &gt;</div><div>&gt; &gt; I have no issues using Raspberry Pi=
 OS or other distros btw, so the device is not the issue</div><div>&gt;</=
div><div>&gt; As one point I have pi0 running fine perhaps something has =
regressed</div><div>&gt; in meta-raspberrypi :( these things need TLC to =
keep going.</div><div>&gt;</div><div>&gt; &gt; On Nov. 12 2023, at 7:49 p=
m, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt;</div>=
<div>&gt; &gt; hmm is that just seen with musl and works ok with glibc ba=
sed images =3F</div><div>&gt; &gt;</div><div>&gt; &gt; TCLIBC=3Dmusl bitb=
ake core-image-base</div><div>&gt; &gt;</div><div>&gt; &gt; eg. will prod=
uce a musl based image which is expected to work</div><div>&gt; &gt;</div=
><div>&gt; &gt; On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen=
 &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt;</div><di=
v>&gt; &gt; &gt; Unfortunately I can't test it unless this gets solved (o=
r I buy a different Raspberry Pi)</div><div>&gt; &gt; &gt;</div><div>&gt;=
 &gt; &gt; https://github.com/agherzan/meta-raspberrypi/issues/1229</div>=
<div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Nov. 12 2023, at 6:43 pm,=
 Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt;</d=
iv><div>&gt; &gt; &gt; TCLIBC=3Dmusl bitbake &lt;recipe&gt;</div><div>&gt=
; &gt; &gt;</div><div>&gt; &gt; &gt; On Sun, Nov 12, 2023 at 9:24=E2=80=AF=
AM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt;=
 &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; How to test it against musl=
 btw=3F Build a musl-based system for Raspberry Pi and see if it runs=3F<=
/div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Nov. 12 20=
23, at 6:23 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</=
div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; Yes, the CMake=
 support was added two months ago and the release is from 2022. Cmake is =
also not supported by the main developer who seems to favor an advanced M=
akefile. In any case, it is easier to fix than the Makefile. I will go wi=
th the git version for now then until there is a new release.</div><div>&=
gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Nov. 12 2023, at 6:20=
 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt=
; &gt;</div><div>&gt; &gt; &gt; &gt; On Sun, Nov 12, 2023 at 8:25=E2=80=AF=
AM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt;=
 &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; I am trying with =
the tarball but it is quite hard, since it doesn't come with a CMakeLists=
.txt.</div><div>&gt; &gt; &gt; &gt; &gt; There is a recipe here, but it i=
nvolves a lot of patching which could potentially be painful to maintain<=
/div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; htt=
ps://github.com/aristocratos/btop/issues/330=23issuecomment-1123685779</d=
iv><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt;</div><div>=
&gt; &gt; &gt; &gt; is it because cmake support was added later =3F in th=
at case maybe using</div><div>&gt; &gt; &gt; &gt; git version is ok</div>=
<div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Nov. 11 20=
23, at 8:01 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&g=
t; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Sat, Nov 11,=
 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt=
; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; It also needs a utf-8 locale to work. Else you have to fo=
rce utf-8 mode with a flag. I haven't included this as dependency at this=
 point.</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; =
&gt; you want to express all that is needed to get it running amicably.</=
div><div>&gt; &gt; &gt; &gt; &gt; keeping in mind that we have glibc and =
musl based systems to service</div><div>&gt; &gt; &gt; &gt; &gt; it will =
be good to check it on musl too.</div><div>&gt; &gt; &gt; &gt; &gt;</div>=
<div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt=
; On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.=
de&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt;=
 &gt; &gt; &gt; &gt; Glad that it arrived now=21 This is a really great r=
esource monitor. It is building from the git repository. Do you think it =
is better to use the release instead=3F</div><div>&gt; &gt; &gt; &gt; &gt=
; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 7:30 p=
m, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt; =
&gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; Thanks for your co=
ntribution Jan</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt=
; &gt; &gt; &gt; &gt; On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=
=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt; &gt=
; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; ---</div><d=
iv>&gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-oe/recipes-support/btop/btop=5F=
1.2.13.bb =7C 23 +++++++++++++++++++++</div><div>&gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; 1 file changed, 23 insertions(+)</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; create mode 100644 meta-oe/recipes-support/btop/btop=5F1.=
2.13.bb</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt; &gt; diff --git a/meta-oe/recipes-support/btop/btop=5F=
1.2.13.bb b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; =
&gt; &gt; &gt; &gt; &gt; &gt; new file mode 100644</div><div>&gt; &gt; &g=
t; &gt; &gt; &gt; &gt; index 000000000..f780a993a</div><div>&gt; &gt; &gt=
; &gt; &gt; &gt; &gt; --- /dev/null</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; &gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt=
; &gt; &gt; &gt; &gt; &gt; &gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; &=
gt; &gt; &gt; &gt; &gt; &gt; +SUMMARY =3D =22Resource monitor that shows =
usage and stats for processor, memory, disks, network and processes.=22</=
div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +HOMEPAGE =3D =22https://gith=
ub.com/aristocratos/btop=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =
+LICENSE =3D =22Apache-2.0=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt=
; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +SECTION =3D=
 =22console/utils=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div>=
<div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +SRC=5FURI =3D =22git://github.co=
m/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain=22</div><div>&gt; =
&gt; &gt; &gt; &gt; &gt; &gt; +SRCREV =3D =222a864f6f2ea60df16b3f015885eb=
3c18a48b9b78=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div><div>=
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; &gt; +inherit cmake</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt=
; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=46ILES:=24=7BPN=7D +=3D=
 =22 =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons =
=5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; &gt; + /usr/share/icons/hicolor =5C</div><div>&gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; + /usr/share/icons/hicolor/48x48 =5C</div><div>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalable =5C</div><div>&gt=
; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps =5C=
</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/=
48x48/apps/btop.png =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; + /u=
sr/share/icons/hicolor/scalable/apps =5C</div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; &gt; + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C</div><=
div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=22</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; --</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; 2.42.0</d=
iv><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&g=
t; &gt; &gt; &gt; &gt; &gt; &gt; Links: You receive all messages sent to =
this group.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; View/Reply Onlin=
e (=23106559): https://lists.openembedded.org/g/openembedded-devel/messag=
e/106559</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; Mute This Topic: ht=
tps://lists.openembedded.org/mt/102530478/1997914</div><div>&gt; &gt; &gt=
; &gt; &gt; &gt; &gt; Group Owner: openembedded-devel+owner=40lists.opene=
mbedded.org</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; Unsubscribe: htt=
ps://lists.openembedded.org/g/openembedded-devel/unsub =5Braj.khem=40gmai=
l.com=5D</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</d=
iv></div></blockquote>
--6558c148_3ab42e65_13022c--


