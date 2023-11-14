Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCD7C54E7C
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 20:38:54 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by mx.groups.io with SMTP id smtpd.web11.3977.1699994330758650521
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 12:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=L+swi40W;
 spf=pass (domain: web.de, ip: 212.227.17.11, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699994328; x=1700599128; i=jan.claussen10@web.de;
	bh=vJK5Gou2xDIlIn3BOVxyjk4R40brdUsidKgBqO1sxdI=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=L+swi40WBI6JqY5MnmnCnd1vzgl/+LBqL/lU84+pk0x44EtOjkegvx5mr5pNcIZD
	 aaPJPwdA1IKG4d29sklhZV80HUU1fNzq0ke4OMGkJMMH+w4Ln1jTInFTZUilMUJW0
	 7yzxchWSoBaAJp2OuN8MvEhMabbQNP6iNPMn7quFxHFL4NJFMQxXGz9BjkdXnNoWZ
	 KGFDAu5twau+0C6gLZae4fPJ9D928xNvbbrDl7qVbrpYVYg6chpeNZ+d0VQp3IL1G
	 /3fept8jVcmYA1gBpuAlcFBfi+q1ofirI6Uhwa5pl2yoDEBefLPqDOSiB1DGl3Hjb
	 zsAm4kL4cpGNOEiTrQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([149.233.246.227]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N30dT-1rWFW90NAb-0130Rj; Tue, 14
 Nov 2023 21:38:48 +0100
Date: Tue, 14 Nov 2023 21:38:47 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <B209B613-FD40-495C-A652-2F322C2CFCCF@getmailspring.com>
In-Reply-To: <27BCAA1A-D895-4C5A-9A1E-D9D1F3DBB773@getmailspring.com>
References: <27BCAA1A-D895-4C5A-9A1E-D9D1F3DBB773@getmailspring.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6553dad7_59c979a2_13022c"
X-Provags-ID: V03:K1:ozso4EdsG2IMr7HTXfQh7FiTtELeXKZ1Ars8mjP59KrtyWYh3vC
 nzfPL6wsyhLrSRqoB55XLl/I6PA0Lsug3ecWag0xTJES8zor5AqvFsouRUa6OipvoMJLTG1
 TXeFkMVK5rrajfGx8RrNj8+qn/v6OwTy0QqUby4BPpvdlnfnjLW+bFr4pob3YiQZ+M1ANs+
 Kz3PgzU1vGKydmE+Oykbw==
UI-OutboundReport: notjunk:1;M01:P0:4W6IEl84DP4=;AMf29zI4/YSQwqVHdFcef5rc+Ye
 R8yUJE9BTEygtnjVxTRG4kfA54A6/3o22I2T3E27U4UlYqCT0llCbVUZOip8uQGItijeFSzRf
 loS7n0tUEGBAkH4o3xiNuTZIBnTDwUF8KdV6DocEugasgf8kfQSibAjKjmFTZPrFfwXNGzDRg
 2QO7NU0tLqWK/zQ79/H0R77B5NLe9+mq0Ax33raOjlKSimzRtjfyLH6KWDLGj/1RQg9+pObHd
 7GXFnIatx7ZDAaL60xiV6pgau34cpPsXWh3O8JdkJEpC2fcTiUpmtlidx63xeI37LLrcLWFIa
 A1Z66mNCgk7OSu7BUecF2cztQuFMAo7Af24JXwsDN7CHHaVWpLSOhU8kjYtvl/U0Cgy2G50/P
 uq/qXyOnWoGDZGhsV1vCPNjna08yeSalbysVgLPUK3JgWs1iZXl4wDvW+fiv8VYQrDlJe18zy
 6GoFJDxIdttvCFVE5EyrUZQoMPzOoosqlBr7LZ0XQsDgqrq+2n1PH56D5UABChQeoBoUNogCK
 IXscM2jWUwkmc5anPEYTFnIvsF2bY4IxDYxRIyDv9iTNPcUbyTCKOULqrbJSdFlL/UotLhswi
 kiJQGyC3+Nr22YG/sm2JPYU/GJl8r6y9qC7HXvYv7a4tB7nx1bD2A+8zoROuCT2MbFMS/3puU
 RruTUkf/9HvNOB7wZH1xcTFzkpU8znDDC/79kkam69B52ZtR8b8jVqDJ4wjQWclgz0HCvtkQL
 clcH/7QrQKBFMx7CZVs5p2puX+9rJ4ALH67qIhBi+5VS15G78eXrx55FCt3me8U02yaDhPGzX
 U7yIfNQk4RVTlykbVdEW1ClP9o+LW819ynh6kPIxdvgCjTybKwsgeIZCbnTokjc8gTU0Nfs7g
 wE29FsNnAJDXvsB7oUGvL1h8xxrK+UXyS3/MeAwch0K4gjll33cYOsuyGbpb426YrtI2gcBI3
 AzjaqH6dwnHdPbE0KtQzEzyFqww=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 20:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106722

--6553dad7_59c979a2_13022c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

So I have just tested btop on musl succesfully.

I am questioning the need for the locales though. You can run btop with t=
he --utf-force flag and it will work well. If you want to run it without =
this flag, you'll need to not only install the locales, but also add
LC=5FALL=3Den=5FUS.UT=46-8
LANG=3Den=5FUS.UT=46-8

to /etc/profile as a minimum. This would force the user to use these loca=
les. It would also require a .bbappend on base-files and I don't think th=
at this is a good idea.
On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen <jan.claussen10=40web.de> w=
rote:
> How did you build it=3F I have sent you a PM on IRC
>
> On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem=40gmail.com> wrote:
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
> >
>


--6553dad7_59c979a2_13022c
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>So I have just tested btop on musl succesfully. </div><br><div>I am =
questioning the need for the locales though. You can run btop with the --=
utf-force flag and it will work well. If you want to run it without this =
flag, you'll need to not only install the locales, but also add </div><br=
><div>LC=5FALL=3Den=5FUS.UT=46-8</div><div>LANG=3Den=5FUS.UT=46-8</div><b=
r><div>to /etc/profile as a minimum. This would force the user to use the=
se locales. It would also require a .bbappend on base-files and I don't t=
hink that this is a good idea.</div><br><div class=3D=22gmail=5Fquote=5Fa=
ttribution=22>On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen &lt;jan.claus=
sen10=40web.de&gt; wrote:</div><blockquote><div>How did you build it=3F I=
 have sent you a PM on IRC</div><br><div class=3D=22gmail=5Fquote=5Fattri=
bution=22>On Nov. 12 2023, at 9:21 pm, Khem Raj &lt;raj.khem=40gmail.com&=
gt; wrote:</div><blockquote><div><div>On Sun, Nov 12, 2023 at 10:51=E2=80=
=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&=
gt;</div><div>&gt; No, it is an issue I have with images for the Pi Zero.=
 I haven't build anything for musl at all, although it would probably a g=
ood choice for the Pi Zero.</div><div>&gt;</div><div>&gt; I have no issue=
s using Raspberry Pi OS or other distros btw, so the device is not the is=
sue</div><br><div>As one point I have pi0 running fine perhaps something =
has regressed</div><div>in meta-raspberrypi :( these things need TLC to k=
eep going.</div><br><div>&gt; On Nov. 12 2023, at 7:49 pm, Khem Raj &lt;r=
aj.khem=40gmail.com&gt; wrote:</div><div>&gt;</div><div>&gt; hmm is that =
just seen with musl and works ok with glibc based images =3F</div><div>&g=
t;</div><div>&gt; TCLIBC=3Dmusl bitbake core-image-base</div><div>&gt;</d=
iv><div>&gt; eg. will produce a musl based image which is expected to wor=
k</div><div>&gt;</div><div>&gt; On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM =
Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &g=
t;</div><div>&gt; &gt; Unfortunately I can't test it unless this gets sol=
ved (or I buy a different Raspberry Pi)</div><div>&gt; &gt;</div><div>&gt=
; &gt; https://github.com/agherzan/meta-raspberrypi/issues/1229</div><div=
>&gt; &gt;</div><div>&gt; &gt; On Nov. 12 2023, at 6:43 pm, Khem Raj &lt;=
raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; T=
CLIBC=3Dmusl bitbake &lt;recipe&gt;</div><div>&gt; &gt;</div><div>&gt; &g=
t; On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claus=
sen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &g=
t; How to test it against musl btw=3F Build a musl-based system for Raspb=
erry Pi and see if it runs=3F</div><div>&gt; &gt; &gt;</div><div>&gt; &gt=
; &gt; On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40=
web.de&gt; wrote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; Yes, =
the CMake support was added two months ago and the release is from 2022. =
Cmake is also not supported by the main developer who seems to favor an a=
dvanced Makefile. In any case, it is easier to fix than the Makefile. I w=
ill go with the git version for now then until there is a new release.</d=
iv><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Nov. 12 2023, at 6:20 =
pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt;=
</div><div>&gt; &gt; &gt; On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Cla=
u=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt;=
 &gt;</div><div>&gt; &gt; &gt; &gt; I am trying with the tarball but it i=
s quite hard, since it doesn't come with a CMakeLists.txt.</div><div>&gt;=
 &gt; &gt; &gt; There is a recipe here, but it involves a lot of patching=
 which could potentially be painful to maintain</div><div>&gt; &gt; &gt; =
&gt;</div><div>&gt; &gt; &gt; &gt; https://github.com/aristocratos/btop/i=
ssues/330=23issuecomment-1123685779</div><div>&gt; &gt; &gt; &gt;</div><d=
iv>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; is it because cmake support wa=
s added later =3F in that case maybe using</div><div>&gt; &gt; &gt; git v=
ersion is ok</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On No=
v. 11 2023, at 8:01 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div=
><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Sat, Nov 11, 2=
023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; =
wrote:</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &=
gt; It also needs a utf-8 locale to work. Else you have to force utf-8 mo=
de with a flag. I haven't included this as dependency at this point.</div=
><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; you want to expre=
ss all that is needed to get it running amicably.</div><div>&gt; &gt; &gt=
; &gt; keeping in mind that we have glibc and musl based systems to servi=
ce</div><div>&gt; &gt; &gt; &gt; it will be good to check it on musl too.=
</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt;</div><d=
iv>&gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen=
 &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt=
;</div><div>&gt; &gt; &gt; &gt; &gt; Glad that it arrived now=21 This is =
a really great resource monitor. It is building from the git repository. =
Do you think it is better to use the release instead=3F</div><div>&gt; &g=
t; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at =
7:30 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt;=
 &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; Thanks for your contri=
bution Jan</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &g=
t; &gt; On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan=
.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</=
div><div>&gt; &gt; &gt; &gt; &gt; &gt; ---</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++++=
+++++++++++</div><div>&gt; &gt; &gt; &gt; &gt; &gt; 1 file changed, 23 in=
sertions(+)</div><div>&gt; &gt; &gt; &gt; &gt; &gt; create mode 100644 me=
ta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta-oe/r=
ecipes-support/btop/btop=5F1.2.13.bb b/meta-oe/recipes-support/btop/btop=5F=
1.2.13.bb</div><div>&gt; &gt; &gt; &gt; &gt; &gt; new file mode 100644</d=
iv><div>&gt; &gt; &gt; &gt; &gt; &gt; index 000000000..f780a993a</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt; --- /dev/null</div><div>&gt; &gt; &gt; &g=
t; &gt; &gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; &=
gt; &gt; &gt; &gt; &gt; +SUMMARY =3D =22Resource monitor that shows usage=
 and stats for processor, memory, disks, network and processes.=22</div><=
div>&gt; &gt; &gt; &gt; &gt; &gt; +HOMEPAGE =3D =22https://github.com/ari=
stocratos/btop=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +LICENSE =3D =22=
Apache-2.0=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +LIC=5F=46ILES=5FCH=
KSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=22</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; +SECTION =3D =22console/utils=22</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; =
&gt; +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3D=
https;branch=3Dmain=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +SRCREV =3D=
 =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22</div><div>&gt; &gt; &gt; =
&gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +S =3D =22=24=7B=
WORKDIR=7D/git=22</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt=
; &gt; &gt; &gt; &gt; &gt; +inherit cmake</div><div>&gt; &gt; &gt; &gt; &=
gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +=46ILES:=24=7BPN=7D +=
=3D =22 =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons =5C=
</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; Le=
ts use =24=7Bdatadir=7D instead of hardcoded /usr/share</div><div>&gt; &g=
t; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/ic=
ons/hicolor =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icon=
s/hicolor/48x48 =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/=
icons/hicolor/scalable =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; + /usr=
/share/icons/hicolor/48x48/apps =5C</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; + /usr/share/icons/hicolor/48x48/apps/btop.png =5C</div><div>&gt; &gt;=
 &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalable/apps =5C</div><d=
iv>&gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalable/apps=
/btop.svg =5C</div><div>&gt; &gt; &gt; &gt; &gt; &gt; +=22</div><div>&gt;=
 &gt; &gt; &gt; &gt; &gt; --</div><div>&gt; &gt; &gt; &gt; &gt; &gt; 2.42=
.0</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; Links: You receive all messages sent to this group=
.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; View/Reply Online (=23106559): =
https://lists.openembedded.org/g/openembedded-devel/message/106559</div><=
div>&gt; &gt; &gt; &gt; &gt; &gt; Mute This Topic: https://lists.openembe=
dded.org/mt/102530478/1997914</div><div>&gt; &gt; &gt; &gt; &gt; &gt; Gro=
up Owner: openembedded-devel+owner=40lists.openembedded.org</div><div>&gt=
; &gt; &gt; &gt; &gt; &gt; Unsubscribe: https://lists.openembedded.org/g/=
openembedded-devel/unsub =5Braj.khem=40gmail.com=5D</div><div>&gt; &gt; &=
gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt;</div></div></blockquote></blockquote>
--6553dad7_59c979a2_13022c--


