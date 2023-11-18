Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C703C54E76
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 18:27:55 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by mx.groups.io with SMTP id smtpd.web11.13792.1700332070053931819
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 10:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=KYpd/4Rb;
 spf=pass (domain: web.de, ip: 212.227.15.14, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700332067; x=1700936867; i=jan.claussen10@web.de;
	bh=F1ejp/yMPFbL6TdikpR3XlBWA7Nje8RTscnpS3j8OUM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=KYpd/4RbwXsxH1gL42Gau1ObEaardnkkAGVaX5/8X61pgcSqQILLcLZf7Zchzwge
	 +4o5c9FGY4zuX64q+BmPh86aoXAtU4JdOVh/EHqIy/KGDpXdPTBhXTFeM1nKSmWdB
	 QM0PCEaPz4b482KhZOTFNQkpkfNN58TEKCF4qclp0H2wWwkrjyD43O4oMXS/4gUZk
	 ECbAYYmMOPN21fOF6p5U8xpzWYEgPAM4uVuwjthQQS8wgODBhdgdobIhUO6e7HWQN
	 LA3mSGIZRuA1dgcRoO0amTAYGhqgb+sgcD2hIPEqlj16I+lK6KgWKOQYFyTmRz5je
	 F0RfS8oPn2tjwEv+oQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from x1-yoga ([195.123.103.85]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MOUxu-1qhy3B0VrC-00Q79Z; Sat, 18
 Nov 2023 19:27:47 +0100
Date: Sat, 18 Nov 2023 19:27:46 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <D2DD7979-6682-4CDC-8CCD-E8F2845F9912@getmailspring.com>
In-Reply-To: <CAMKF1sp9-aAaTxtYYcrBQh=sthmdRSaErMB5weXYGd1sbar1BA@mail.gmail.com>
References: <CAMKF1sp9-aAaTxtYYcrBQh=sthmdRSaErMB5weXYGd1sbar1BA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65590222_79dfd11b_7ca"
X-Provags-ID: V03:K1:hKNpx72lZGOmWvBuaj6bbhRdqk0WC7wXq7Rpp/wLt+Y0xXbQi1z
 Vz7v2H5kf3ZAJiVLFv3Egjnjcljl+vDYa79drSMsGAt/wwpr7SveQqpf5HIKBc0ubz8TXlJ
 7AxKaZcC1dsU+Qxoji/t/Gweulsx6TzxUJZCIm/Bir+UN9ych/faAi5Px1wid+CzaEgAcZ8
 rjQXZNwGw+Z7C8fWTMf2Q==
UI-OutboundReport: notjunk:1;M01:P0:+/+eEHdW2n4=;xNIWWGBICiSu994yxi2nCpHJVEZ
 pa/U36PJ8mSOyKiWV1ZCYcpTPDU9c9mZePCBJamiQJvcBF8XWEhjbRSMB/gufEHE39tgvAgc/
 nq9fCvh789b5ZSB0akDOF6Ki9Lh5vh3PNMaTgMXTp1RU8SOVhfnrBzYAH1xDZGSLxJUfWgC3h
 3yl80RjUYUeM9yLpQ5xIsyP0+qAWpE0tTkRndW6FzPIjCMtDr46ejeqUwyyxRKiXt4T7SWUn7
 yoRw5jMy8rhVYEvoA/Rz1pZV7R2BhXcnuvPSaflLIgRUOESzg2U452DTjjJD3pIW9vAHJKWnO
 5E356k62fIc8ZGTynIta3k8Yp9A+EF0myRNYP247w4aeQObcynPrOR8XrdifFO+iOohfacTB/
 pdh03CdV6dX7JMSFrg21lE42giynDo8d05c5BdjElCols3Zn4AnlfJ+TqbyOrFiSGe84kPCIT
 r4RQkS0Lg+EdVxgCIFCaZ+Q7Gw2yRDf0qzjte46IGi4zcFRus1pLSq9boaN4s3mSsS4+VXley
 YP+tS2J4eNS3ZQ6MOebQTZHY2hOGBy26YoF6ze1UH5Hsm2diT7iUFBpGLNFETH4XYPj4oFNwq
 +rfGHKEZ3XXz23jVY64jSkmFmp4IcErEVHPdb8r/yW59Z07RAko7GLNZeqgYGSXd1E0LML5kk
 0eVCvQC3AHPkERvcDbChOkp7wJIMlyjhsx4FfAMzDIwzscdB+bqoFX/fE+L1g4PYZ0gYaj0L0
 PjRZS8+rufqHvBGZPWMNVRi6InB7pvZiu/B/HzE7hehOnXRw0hNjsM190X2YvMfC06Zz8C7uP
 qpRWll0vEoKuz+shsZ8+Y0m3fVsEU+sfY7Om5B+GOlRT25euiESBlBdzisky5HNmToO4GkcYv
 vHHbtpnlp5iSlir695LpXqgFtWdjfrBRi6s47PN9xXph6Xq3cuCIWE8tU7W2RtNqDi2GuEh96
 1tKCMU249rNC2WjlNSevoV3wbEs=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 18:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106892

--65590222_79dfd11b_7ca
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

No idea if I did that right now. I really don't understand why you guys u=
se the email based merge requests, but well.

On Nov. 18 2023, at 5:45 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> thats fine and thanks for update. However, if you can resend it via
> git format-patch && git send-email then tools I use will capture the
> v2 properly.
>
> On Sat, Nov 18, 2023 at 5:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen1=
0=40web.de> wrote:
> >
> > So in this case it shoule be alright like this. The developer will ha=
ve to take care to set its proper locale, but apart from that everything =
works.
> >
> > =46rom b242979231f4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2=
001
> > =46rom: =3D=3FUT=46-8=3Fq=3FJan=3D20Clau=3DC3=3D9=46en=3F=3D <jan.cla=
ussen10=40web.de>
> > Date: Sat, 18 Nov 2023 14:45:27 +0100
> > Subject: =5BPATCH=5D meta-oe: recipes-support: Add btop
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUT=46-8
> > Content-Transfer-Encoding: 8bit
> >
> > Adds btop, the shell-based resource monitor that shows usage and stat=
s for processor, memory, disks, network and processes.
> >
> > Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10=40web.de>
> > ---
> > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++++++++++=
+++++
> > 1 file changed, 23 insertions(+)
> > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> >
> > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/=
recipes-support/btop/btop=5F1.2.13.bb
> > new file mode 100644
> > index 000000000..a944fe7b5
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > =40=40 -0,0 +1,23 =40=40
> > +SUMMARY =3D =22Resource monitor that shows usage and stats for proce=
ssor, memory, disks, network and processes.=22
> > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
> > +LICENSE =3D =22Apache-2.0=22
> > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57=22
> > +SECTION =3D =22console/utils=22
> > +
> > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3Dh=
ttps;branch=3Dmain=22
> > +SRCREV =3D =229edbf27f1b6d5844a97325fcda732762ba086a99=22
> > +
> > +S =3D =22=24=7BWORKDIR=7D/git=22
> > +
> > +inherit cmake
> > +
> > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > + =24=7Bdatadir=7D/icons =5C
> > + =24=7Bdatadir=7D/icons/hicolor =5C
> > + =24=7Bdatadir=7D/icons/hicolor/48x48 =5C
> > + =24=7Bdatadir=7D/icons/hicolor/scalable =5C
> > + =24=7Bdatadir=7D/icons/hicolor/48x48/apps =5C
> > + =24=7Bdatadir=7D/icons/hicolor/48x48/apps/btop.png =5C
> > + =24=7Bdatadir=7D/icons/hicolor/scalable/apps =5C
> > + =24=7Bdatadir=7D/icons/hicolor/scalable/apps/btop.svg =5C
> > +=22
> > --
> > 2.42.1
> >
> > On Nov. 14 2023, at 9:43 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> >
> > On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen <jan.clauss=
en10=40web.de> wrote:
> > >
> > > So I have just tested btop on musl succesfully.
> > >
> >
> > OK
> >
> > > I am questioning the need for the locales though. You can run btop =
with the --utf-force flag and it will work well. If you want to run it wi=
thout this flag, you'll need to not only install the locales, but also ad=
d
> > >
> > > LC=5FALL=3Den=5FUS.UT=46-8
> > > LANG=3Den=5FUS.UT=46-8
> > >
> >
> > yeah if it can work without it, that would be great
> >
> > > to /etc/profile as a minimum. This would force the user to use thes=
e locales. It would also require a .bbappend on base-files and I don't th=
ink that this is a good idea.
> > >
> > > On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen <jan.claussen10=40web=
.de> wrote:
> > >
> > > How did you build it=3F I have sent you a PM on IRC
> > >
> > > On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem=40gmail.com> wrote:=

> > >
> > > On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.clau=
ssen10=40web.de> wrote:
> > > >
> > > > No, it is an issue I have with images for the Pi Zero. I haven't =
build anything for musl at all, although it would probably a good choice =
for the Pi Zero.
> > > >
> > > > I have no issues using Raspberry Pi OS or other distros btw, so t=
he device is not the issue
> > >
> > > As one point I have pi0 running fine perhaps something has regresse=
d
> > > in meta-raspberrypi :( these things need TLC to keep going.
> > >
> > > > On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem=40gmail.com> wrot=
e:
> > > >
> > > > hmm is that just seen with musl and works ok with glibc based ima=
ges =3F
> > > >
> > > > TCLIBC=3Dmusl bitbake core-image-base
> > > >
> > > > eg. will produce a musl based image which is expected to work
> > > >
> > > > On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.cl=
aussen10=40web.de> wrote:
> > > > >
> > > > > Unfortunately I can't test it unless this gets solved (or I buy=
 a different Raspberry Pi)
> > > > >
> > > > > https://github.com/agherzan/meta-raspberrypi/issues/1229
> > > > >
> > > > > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem=40gmail.com> wr=
ote:
> > > > >
> > > > > TCLIBC=3Dmusl bitbake <recipe>
> > > > >
> > > > > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.c=
laussen10=40web.de> wrote:
> > > > > >
> > > > > > How to test it against musl btw=3F Build a musl-based system =
for Raspberry Pi and see if it runs=3F
> > > > > >
> > > > > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10=
=40web.de> wrote:
> > > > > >
> > > > > > Yes, the CMake support was added two months ago and the relea=
se is from 2022. Cmake is also not supported by the main developer who se=
ems to favor an advanced Makefile. In any case, it is easier to fix than =
the Makefile. I will go with the git version for now then until there is =
a new release.
> > > > > >
> > > > > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.com> =
wrote:
> > > > > >
> > > > > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan=
.claussen10=40web.de> wrote:
> > > > > > >
> > > > > > > I am trying with the tarball but it is quite hard, since it=
 doesn't come with a CMakeLists.txt.
> > > > > > > There is a recipe here, but it involves a lot of patching w=
hich could potentially be painful to maintain
> > > > > > >
> > > > > > > https://github.com/aristocratos/btop/issues/330=23issuecomm=
ent-1123685779
> > > > > > >
> > > > > >
> > > > > > is it because cmake support was added later =3F in that case =
maybe using
> > > > > > git version is ok
> > > > > >
> > > > > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail.com=
> wrote:
> > > > > > >
> > > > > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <=
jan.claussen10=40web.de> wrote:
> > > > > > > >
> > > > > > > > It also needs a utf-8 locale to work. Else you have to fo=
rce utf-8 mode with a flag. I haven't included this as dependency at this=
 point.
> > > > > > >
> > > > > > > you want to express all that is needed to get it running am=
icably.
> > > > > > > keeping in mind that we have glibc and musl based systems t=
o service
> > > > > > > it will be good to check it on musl too.
> > > > > > >
> > > > > > > >
> > > > > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.clauss=
en10=40web.de> wrote:
> > > > > > > >
> > > > > > > > Glad that it arrived now=21 This is a really great resour=
ce monitor. It is building from the git repository. Do you think it is be=
tter to use the release instead=3F
> > > > > > > >
> > > > > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.c=
om> wrote:
> > > > > > > >
> > > > > > > > Thanks for your contribution Jan
> > > > > > > >
> > > > > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen=
 <jan.claussen10=40web.de> wrote:
> > > > > > > > >
> > > > > > > > > ---
> > > > > > > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++=
+++++++++++++++++++
> > > > > > > > > 1 file changed, 23 insertions(+)
> > > > > > > > > create mode 100644 meta-oe/recipes-support/btop/btop=5F=
1.2.13.bb
> > > > > > > > >
> > > > > > > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13=
.bb b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000..f780a993a
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > > > > =40=40 -0,0 +1,23 =40=40
> > > > > > > > > +SUMMARY =3D =22Resource monitor that shows usage and s=
tats for processor, memory, disks, network and processes.=22
> > > > > > > > > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22=

> > > > > > > > > +LICENSE =3D =22Apache-2.0=22
> > > > > > > > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b8=
3ef96387f14655fc854ddc3c6bd57=22
> > > > > > > > > +SECTION =3D =22console/utils=22
> > > > > > > > > +
> > > > > > > > > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.gi=
t;protocol=3Dhttps;branch=3Dmain=22
> > > > > > > > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=
=22
> > > > > > > > > +
> > > > > > > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > > > > > > +
> > > > > > > > > +inherit cmake
> > > > > > > > > +
> > > > > > > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > > > > > > + /usr/share/icons =5C
> > > > > > > >
> > > > > > > > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share=

> > > > > > > >
> > > > > > > > > + /usr/share/icons/hicolor =5C
> > > > > > > > > + /usr/share/icons/hicolor/48x48 =5C
> > > > > > > > > + /usr/share/icons/hicolor/scalable =5C
> > > > > > > > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > > > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > > > > > > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > > > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > > > > > > > > +=22
> > > > > > > > > --
> > > > > > > > > 2.42.0
> > > > > > > > >
> > > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > > Links: You receive all messages sent to this group.
> > > > > > > > > View/Reply Online (=23106559): https://lists.openembedd=
ed.org/g/openembedded-devel/message/106559
> > > > > > > > > Mute This Topic: https://lists.openembedded.org/mt/1025=
30478/1997914
> > > > > > > > > Group Owner: openembedded-devel+owner=40lists.openembed=
ded.org
> > > > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembed=
ded-devel/unsub =5Braj.khem=40gmail.com=5D
> > > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > >
>


--65590222_79dfd11b_7ca
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>No idea if I did that right now. I really don't understand why you g=
uys use the email based merge requests, but well.</div><br><div class=3D=22=
gmail=5Fquote=5Fattribution=22>On Nov. 18 2023, at 5:45 pm, Khem Raj &lt;=
raj.khem=40gmail.com&gt; wrote:</div><blockquote><div><div>thats fine and=
 thanks for update. However, if you can resend it via</div><div>git forma=
t-patch &amp;&amp; git send-email then tools I use will capture the</div>=
<div>v2 properly.</div><br><div>On Sat, Nov 18, 2023 at 5:51=E2=80=AFAM J=
an Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt;</di=
v><div>&gt; So in this case it shoule be alright like this. The developer=
 will have to take care to set its proper locale, but apart from that eve=
rything works.</div><div>&gt;</div><div>&gt; =46rom b242979231f4f32243b99=
cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2001</div><div>&gt; =46rom: =3D=3F=
UT=46-8=3Fq=3FJan=3D20Clau=3DC3=3D9=46en=3F=3D &lt;jan.claussen10=40web.d=
e&gt;</div><div>&gt; Date: Sat, 18 Nov 2023 14:45:27 +0100</div><div>&gt;=
 Subject: =5BPATCH=5D meta-oe: recipes-support: Add btop</div><div>&gt; M=
IME-Version: 1.0</div><div>&gt; Content-Type: text/plain; charset=3DUT=46=
-8</div><div>&gt; Content-Transfer-Encoding: 8bit</div><div>&gt;</div><di=
v>&gt; Adds btop, the shell-based resource monitor that shows usage and s=
tats for processor, memory, disks, network and processes.</div><div>&gt;<=
/div><div>&gt; Signed-off-by: Jan Clau=C3=9Fen &lt;jan.claussen10=40web.d=
e&gt;</div><div>&gt; ---</div><div>&gt; meta-oe/recipes-support/btop/btop=
=5F1.2.13.bb =7C 23 +++++++++++++++++++++</div><div>&gt; 1 file changed, =
23 insertions(+)</div><div>&gt; create mode 100644 meta-oe/recipes-suppor=
t/btop/btop=5F1.2.13.bb</div><div>&gt;</div><div>&gt; diff --git a/meta-o=
e/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/recipes-support/btop/bt=
op=5F1.2.13.bb</div><div>&gt; new file mode 100644</div><div>&gt; index 0=
00000000..a944fe7b5</div><div>&gt; --- /dev/null</div><div>&gt; +++ b/met=
a-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; =40=40 -0,0 +1,=
23 =40=40</div><div>&gt; +SUMMARY =3D =22Resource monitor that shows usag=
e and stats for processor, memory, disks, network and processes.=22</div>=
<div>&gt; +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22</div><=
div>&gt; +LICENSE =3D =22Apache-2.0=22</div><div>&gt; +LIC=5F=46ILES=5FCH=
KSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=22</div=
><div>&gt; +SECTION =3D =22console/utils=22</div><div>&gt; +</div><div>&g=
t; +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3Dht=
tps;branch=3Dmain=22</div><div>&gt; +SRCREV =3D =229edbf27f1b6d5844a97325=
fcda732762ba086a99=22</div><div>&gt; +</div><div>&gt; +S =3D =22=24=7BWOR=
KDIR=7D/git=22</div><div>&gt; +</div><div>&gt; +inherit cmake</div><div>&=
gt; +</div><div>&gt; +=46ILES:=24=7BPN=7D +=3D =22 =5C</div><div>&gt; + =24=
=7Bdatadir=7D/icons =5C</div><div>&gt; + =24=7Bdatadir=7D/icons/hicolor =5C=
</div><div>&gt; + =24=7Bdatadir=7D/icons/hicolor/48x48 =5C</div><div>&gt;=
 + =24=7Bdatadir=7D/icons/hicolor/scalable =5C</div><div>&gt; + =24=7Bdat=
adir=7D/icons/hicolor/48x48/apps =5C</div><div>&gt; + =24=7Bdatadir=7D/ic=
ons/hicolor/48x48/apps/btop.png =5C</div><div>&gt; + =24=7Bdatadir=7D/ico=
ns/hicolor/scalable/apps =5C</div><div>&gt; + =24=7Bdatadir=7D/icons/hico=
lor/scalable/apps/btop.svg =5C</div><div>&gt; +=22</div><div>&gt; --</div=
><div>&gt; 2.42.1</div><div>&gt;</div><div>&gt; On Nov. 14 2023, at 9:43 =
pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt;</div><div=
>&gt; On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen &lt;jan.c=
laussen10=40web.de&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; So =
I have just tested btop on musl succesfully.</div><div>&gt; &gt;</div><di=
v>&gt;</div><div>&gt; OK</div><div>&gt;</div><div>&gt; &gt; I am question=
ing the need for the locales though. You can run btop with the --utf-forc=
e flag and it will work well. If you want to run it without this flag, yo=
u'll need to not only install the locales, but also add</div><div>&gt; &g=
t;</div><div>&gt; &gt; LC=5FALL=3Den=5FUS.UT=46-8</div><div>&gt; &gt; LAN=
G=3Den=5FUS.UT=46-8</div><div>&gt; &gt;</div><div>&gt;</div><div>&gt; yea=
h if it can work without it, that would be great</div><div>&gt;</div><div=
>&gt; &gt; to /etc/profile as a minimum. This would force the user to use=
 these locales. It would also require a .bbappend on base-files and I don=
't think that this is a good idea.</div><div>&gt; &gt;</div><div>&gt; &gt=
; On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.=
de&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; How did you build i=
t=3F I have sent you a PM on IRC</div><div>&gt; &gt;</div><div>&gt; &gt; =
On Nov. 12 2023, at 9:21 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:=
</div><div>&gt; &gt;</div><div>&gt; &gt; On Sun, Nov 12, 2023 at 10:51=E2=
=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><di=
v>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; No, it is an issue I have with =
images for the Pi Zero. I haven't build anything for musl at all, althoug=
h it would probably a good choice for the Pi Zero.</div><div>&gt; &gt; &g=
t;</div><div>&gt; &gt; &gt; I have no issues using Raspberry Pi OS or oth=
er distros btw, so the device is not the issue</div><div>&gt; &gt;</div><=
div>&gt; &gt; As one point I have pi0 running fine perhaps something has =
regressed</div><div>&gt; &gt; in meta-raspberrypi :( these things need TL=
C to keep going.</div><div>&gt; &gt;</div><div>&gt; &gt; &gt; On Nov. 12 =
2023, at 7:49 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>=
&gt; &gt; &gt;</div><div>&gt; &gt; &gt; hmm is that just seen with musl a=
nd works ok with glibc based images =3F</div><div>&gt; &gt; &gt;</div><di=
v>&gt; &gt; &gt; TCLIBC=3Dmusl bitbake core-image-base</div><div>&gt; &gt=
; &gt;</div><div>&gt; &gt; &gt; eg. will produce a musl based image which=
 is expected to work</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On=
 Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen1=
0=40web.de&gt; wrote:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &=
gt; &gt; Unfortunately I can't test it unless this gets solved (or I buy =
a different Raspberry Pi)</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; https://github.com/agherzan/meta-raspberrypi/issues/1229</di=
v><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Nov. 12 2023,=
 at 6:43 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; =
&gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; TCLIBC=3Dmusl bitbake &lt;re=
cipe&gt;</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On S=
un, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40=
web.de&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; =
&gt; &gt; &gt; How to test it against musl btw=3F Build a musl-based syst=
em for Raspberry Pi and see if it runs=3F</div><div>&gt; &gt; &gt; &gt; &=
gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Nov. 12 2023, at 6:23 pm, Jan C=
lau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &g=
t; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; Yes, the CMake support wa=
s added two months ago and the release is from 2022. Cmake is also not su=
pported by the main developer who seems to favor an advanced Makefile. In=
 any case, it is easier to fix than the Makefile. I will go with the git =
version for now then until there is a new release.</div><div>&gt; &gt; &g=
t; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Nov. 12 2023, at 6:20 =
pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt;=
 &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Sun, Nov 12, 2023 at 8:2=
5=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; I am trying with the tarball but it is quite hard, since it doesn't co=
me with a CMakeLists.txt.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; There i=
s a recipe here, but it involves a lot of patching which could potentiall=
y be painful to maintain</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt; https://github.com/aristocratos/btop/issu=
es/330=23issuecomment-1123685779</div><div>&gt; &gt; &gt; &gt; &gt; &gt;<=
/div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; is =
it because cmake support was added later =3F in that case maybe using</di=
v><div>&gt; &gt; &gt; &gt; &gt; git version is ok</div><div>&gt; &gt; &gt=
; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 8=
:01 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; On Sat, Nov 1=
1, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&=
gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; &gt; It also needs a utf-8 locale to work. Else yo=
u have to force utf-8 mode with a flag. I haven't included this as depend=
ency at this point.</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt=
; &gt; &gt; &gt; &gt; &gt; you want to express all that is needed to get =
it running amicably.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; keeping in m=
ind that we have glibc and musl based systems to service</div><div>&gt; &=
gt; &gt; &gt; &gt; &gt; it will be good to check it on musl too.</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &=
gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 7:35=
 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&g=
t; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; =
&gt; Glad that it arrived now=21 This is a really great resource monitor.=
 It is building from the git repository. Do you think it is better to use=
 the release instead=3F</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 7:30 pm, Khe=
m Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &=
gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks for you=
r contribution Jan</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Sat, Nov 11, 2023 at 10:26=E2=80=AF=
AM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt;=
 &gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; &gt; &gt; ---</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-o=
e/recipes-support/btop/btop=5F1.2.13.bb =7C 23 +++++++++++++++++++++</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; 1 file changed, 23 insertio=
ns(+)</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; create mode 10064=
4 meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt=
; diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/re=
cipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; &gt; &gt; new file mode 100644</div><div>&gt; &gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; index 000000000..f780a993a</div><div>&gt; &gt; &gt; &gt; &gt; =
&gt; &gt; &gt; --- /dev/null</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 &gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; =
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt=
; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +SUMMARY =3D =22Resource monitor tha=
t shows usage and stats for processor, memory, disks, network and process=
es.=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +HOMEPAGE =3D =22=
https://github.com/aristocratos/btop=22</div><div>&gt; &gt; &gt; &gt; &gt=
; &gt; &gt; &gt; +LICENSE =3D =22Apache-2.0=22</div><div>&gt; &gt; &gt; &=
gt; &gt; &gt; &gt; &gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57=22</div><div>&gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; +SECTION =3D =22console/utils=22</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =
&gt; +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3D=
https;branch=3Dmain=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; =
+SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22</div><div>&gt;=
 &gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; =
&gt; &gt; &gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =
&gt; +inherit cmake</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +</=
div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=46ILES:=24=7BPN=7D +=3D=
 =22 =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/i=
cons =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; Lets use =24=7Bdatadir=7D instead of hardcoded =
/usr/share</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor =5C</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48=
 =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons=
/hicolor/scalable =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=
 /usr/share/icons/hicolor/48x48/apps =5C</div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps/btop.png =5C</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/=
scalable/apps =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /us=
r/share/icons/hicolor/scalable/apps/btop.svg =5C</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; +=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &g=
t; &gt; --</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; 2.42.0</div>=
<div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt=
; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div>=
<div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Links: You receive all messa=
ges sent to this group.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 View/Reply Online (=23106559): https://lists.openembedded.org/g/openembe=
dded-devel/message/106559</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &g=
t; Mute This Topic: https://lists.openembedded.org/mt/102530478/1997914</=
div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Group Owner: openembedde=
d-devel+owner=40lists.openembedded.org</div><div>&gt; &gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; Unsubscribe: https://lists.openembedded.org/g/openembedde=
d-devel/unsub =5Braj.khem=40gmail.com=5D</div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;</div></div></blockquote>
--65590222_79dfd11b_7ca--


