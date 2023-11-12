Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD63C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 16:25:42 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web11.17956.1699806336792056943
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 08:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=Cv4r+8RJ;
 spf=pass (domain: web.de, ip: 212.227.17.12, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699806334; x=1700411134; i=jan.claussen10@web.de;
	bh=786pOkyMY/ARMunY8itiwKev9dSr75mXj8kpL8ODU7Y=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=Cv4r+8RJDgKUqa4RRMxLZ3DbO4AB3dt1kxtpr4TBnwFM/pvFmQeOmldV6dBrMP3g
	 JlbOCXfns00B6sA5+K1m2LyN51d5/8HxA5lG8/mM5us2SO6bbBIluk97UFsMg5uIT
	 HD35zSodeOCyS+28cpwvxQiDJ0mT4p8+OnJB3CCLYYquLhI2KOLp4nHwxVJwqIGfe
	 EWMVm6eeWaXn4xF24tYoaQ7n9wvIQaauKKIcIFsK2eA7Pr30UHuoOiP/t47s/3JA4
	 NgXHgKH8QOV6iVXo4DtFYrbyw2kKarw5PogjLRXNE7W3Zk4UsOf0GMLPSMCNOY7xL
	 GkDSEgzj5DUoMkWBsQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([31.29.47.11]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwR0J-1rKygF1H6L-00s3zo; Sun, 12
 Nov 2023 17:25:34 +0100
Date: Sun, 12 Nov 2023 17:25:33 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <AADC177D-1457-42FA-AEA8-A6850E0FC53E@getmailspring.com>
In-Reply-To: <CAMKF1sq718EwKbfEdWgGfZQq+2kRJCPaepp4aY9XsMXKckHQjw@mail.gmail.com>
References: <CAMKF1sq718EwKbfEdWgGfZQq+2kRJCPaepp4aY9XsMXKckHQjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6550fc7d_7d4aba99_12072"
X-Provags-ID: V03:K1:jg8zScq3fTeXQVNIJXgeHYHLUtLnhtL9MQplooKHsZ0nx7Gwj4D
 qd5Ry++TjjXFCry1sYpIL4HY0353gwK2y7GGEMqOspwz/Fn/XvOV+h3kbArHvMmFco5LSF4
 QzGC4TAjsg75au+iCt/R6y+cUtHuDE0neY1eSBKNYG0vcdv2PxZ8QHPKKIWmmirTLTuv4ek
 /Y5iy97y1JYzp+Y8mMvQQ==
UI-OutboundReport: notjunk:1;M01:P0:JofrezNwuk4=;IluW1V2/o7Gw55DaxsUGeA4d73O
 XdFcrm5BAVERCCQVs73b5pjxOxK/23uM34MKzkkzIlZ1nzjV/wnz2Z15AtSqy2lKGZy19zE09
 h0+lskJsnMnPk4JbjP0b5K+aHgUoa5/KgWI5MDP+L5N4RD63FICRccxNKhSsLlCGN44Vd/8sC
 jf+pRTGNrzKGifLp+JJEDQ1K648CZ4iszL1ObBrc4wHPlsOttKlEb/yrQUwSHuOxdwzBOIbIi
 Xhdz4x7BhFaTqJih1128SQfQgWS5aR6/WfQSZefOKKK7XDbsjPX7Sq6Aq28yDZJTwpjF1sOkA
 z8rukq4FtUCbIUYBZZQ58N/RoCF0Vjt/LCG0y0NQlZ2DY46T3dgKWk0wPr5aw2Pip3LhckAQn
 DRP2Wo72s1zJUEsvFO1Mq/8s9ykJd782yNE+oCJaAaSQzirffj0f9ygfWG3+OEtiKaNE6csz+
 KemEviWyBVTU0yl34h4McsDRxx9Z9dFlCVpFLwVkUelLXCCOHeSGsFII+2/RNR2rcjh7xQvVh
 aFg+G2J1DleJQ6m+GOKAu3xc3vIeS6cenAmZkIpfR9bGbYfKspKTi8R3qGDas4Z9Gv+yYczW8
 sqrOwTmCne9KULm8Q1lxMdsgiiYvdYQMJqQuQxsxn6wEyh+olofPklmSkBRrO6NiQaxyuQ82k
 PK+zzEikfelm68iX2ZwSr+uUef93OYRCgm90xZb1X7qL2jk4TJcMRaRZ+dNSG4Ri8xtgMRFt4
 rSOwtUjEksyNU4606YDJIC49Z73LK731nW98FRnN9fyPRppGfTiVXNKzjsKqttNJtaFqEvIdO
 U/pt+ibtWixv0mXhjNLgE9McGPJ88h99WsgM/xQFj5EjT5Itv6jYNQRzHuJ5tXTXmfAVDjDYj
 SHp7Nryg3+fMmdzWNO/OqjqXD9/obymN7+TPEfDiwBwcWATgNteTyMMko2vRf0YfOcvqRjSWu
 dciGiw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 16:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106593

--6550fc7d_7d4aba99_12072
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I am trying with the tarball but it is quite hard, since it doesn't come =
with a CMakeLists.txt.
There is a recipe here, but it involves a lot of patching which could pot=
entially be painful to maintain

https://github.com/aristocratos/btop/issues/330=23issuecomment-1123685779=

On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10=40web.de> wrote:
> >
> > It also needs a utf-8 locale to work. Else you have to force utf-8 mo=
de with a flag. I haven't included this as dependency at this point.
>
> you want to express all that is needed to get it running amicably.
> keeping in mind that we have glibc and musl based systems to service
> it will be good to check it on musl too.
>
> >
> > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10=40web.d=
e> wrote:
> >
> > Glad that it arrived now=21 This is a really great resource monitor. =
It is building from the git repository. Do you think it is better to use =
the release instead=3F
> >
> > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> >
> > Thanks for your contribution Jan
> >
> > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10=40web.de> wrote:
> > >
> > > ---
> > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++++++++=
+++++++
> > > 1 file changed, 23 insertions(+)
> > > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > >
> > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-o=
e/recipes-support/btop/btop=5F1.2.13.bb
> > > new file mode 100644
> > > index 000000000..f780a993a
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > =40=40 -0,0 +1,23 =40=40
> > > +SUMMARY =3D =22Resource monitor that shows usage and stats for pro=
cessor, memory, disks, network and processes.=22
> > > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
> > > +LICENSE =3D =22Apache-2.0=22
> > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57=22
> > > +SECTION =3D =22console/utils=22
> > > +
> > > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3D=
https;branch=3Dmain=22
> > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22
> > > +
> > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > +
> > > +inherit cmake
> > > +
> > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > + /usr/share/icons =5C
> >
> > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share
> >
> > > + /usr/share/icons/hicolor =5C
> > > + /usr/share/icons/hicolor/48x48 =5C
> > > + /usr/share/icons/hicolor/scalable =5C
> > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > > +=22
> > > --
> > > 2.42.0
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (=23106559): https://lists.openembedded.org/g/ope=
nembedded-devel/message/106559
> > > Mute This Topic: https://lists.openembedded.org/mt/102530478/199791=
4
> > > Group Owner: openembedded-devel+owner=40lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub =5Braj.khem=40gmail.com=5D
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>


--6550fc7d_7d4aba99_12072
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>I am trying with the tarball but it is quite hard, since it doesn't =
come with a CMakeLists.txt. </div><div>There is a recipe here, but it inv=
olves a lot of patching which could potentially be painful to maintain </=
div><br><div><a href=3D=22https://github.com/aristocratos/btop/issues/330=
=23issuecomment-1123685779=22 title=3D=22https://github.com/aristocratos/=
btop/issues/330=23issuecomment-1123685779=22>https://github.com/aristocra=
tos/btop/issues/330=23issuecomment-1123685779</a></div><br><div class=3D=22=
gmail=5Fquote=5Fattribution=22>On Nov. 11 2023, at 8:01 pm, Khem Raj &lt;=
raj.khem=40gmail.com&gt; wrote:</div><blockquote><div><div>On Sat, Nov 11=
, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&g=
t; wrote:</div><div>&gt;</div><div>&gt; It also needs a utf-8 locale to w=
ork. Else you have to force utf-8 mode with a flag. I haven't included th=
is as dependency at this point.</div><br><div>you want to express all tha=
t is needed to get it running amicably.</div><div>keeping in mind that we=
 have glibc and musl based systems to service</div><div>it will be good t=
o check it on musl too.</div><br><div>&gt;</div><div>&gt; On Nov. 11 2023=
, at 7:35 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</di=
v><div>&gt;</div><div>&gt; Glad that it arrived now=21 This is a really g=
reat resource monitor. It is building from the git repository. Do you thi=
nk it is better to use the release instead=3F</div><div>&gt;</div><div>&g=
t; On Nov. 11 2023, at 7:30 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wro=
te:</div><div>&gt;</div><div>&gt; Thanks for your contribution Jan</div><=
div>&gt;</div><div>&gt; On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=
=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt;</div>=
<div>&gt; &gt; ---</div><div>&gt; &gt; meta-oe/recipes-support/btop/btop=5F=
1.2.13.bb =7C 23 +++++++++++++++++++++</div><div>&gt; &gt; 1 file changed=
, 23 insertions(+)</div><div>&gt; &gt; create mode 100644 meta-oe/recipes=
-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt;</div><div>&gt; &gt; di=
ff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/recipe=
s-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; new file mode 100644<=
/div><div>&gt; &gt; index 000000000..f780a993a</div><div>&gt; &gt; --- /d=
ev/null</div><div>&gt; &gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2=
.13.bb</div><div>&gt; &gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; &gt; +=
SUMMARY =3D =22Resource monitor that shows usage and stats for processor,=
 memory, disks, network and processes.=22</div><div>&gt; &gt; +HOMEPAGE =3D=
 =22https://github.com/aristocratos/btop=22</div><div>&gt; &gt; +LICENSE =
=3D =22Apache-2.0=22</div><div>&gt; &gt; +LIC=5F=46ILES=5FCHKSUM =3D =22f=
ile://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=22</div><div>&gt; &g=
t; +SECTION =3D =22console/utils=22</div><div>&gt; &gt; +</div><div>&gt; =
&gt; +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3D=
https;branch=3Dmain=22</div><div>&gt; &gt; +SRCREV =3D =222a864f6f2ea60df=
16b3f015885eb3c18a48b9b78=22</div><div>&gt; &gt; +</div><div>&gt; &gt; +S=
 =3D =22=24=7BWORKDIR=7D/git=22</div><div>&gt; &gt; +</div><div>&gt; &gt;=
 +inherit cmake</div><div>&gt; &gt; +</div><div>&gt; &gt; +=46ILES:=24=7B=
PN=7D +=3D =22 =5C</div><div>&gt; &gt; + /usr/share/icons =5C</div><div>&=
gt;</div><div>&gt; Lets use =24=7Bdatadir=7D instead of hardcoded /usr/sh=
are</div><div>&gt;</div><div>&gt; &gt; + /usr/share/icons/hicolor =5C</di=
v><div>&gt; &gt; + /usr/share/icons/hicolor/48x48 =5C</div><div>&gt; &gt;=
 + /usr/share/icons/hicolor/scalable =5C</div><div>&gt; &gt; + /usr/share=
/icons/hicolor/48x48/apps =5C</div><div>&gt; &gt; + /usr/share/icons/hico=
lor/48x48/apps/btop.png =5C</div><div>&gt; &gt; + /usr/share/icons/hicolo=
r/scalable/apps =5C</div><div>&gt; &gt; + /usr/share/icons/hicolor/scalab=
le/apps/btop.svg =5C</div><div>&gt; &gt; +=22</div><div>&gt; &gt; --</div=
><div>&gt; &gt; 2.42.0</div><div>&gt; &gt;</div><div>&gt; &gt; -=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; Links: You receive =
all messages sent to this group.</div><div>&gt; &gt; View/Reply Online (=23=
106559): https://lists.openembedded.org/g/openembedded-devel/message/1065=
59</div><div>&gt; &gt; Mute This Topic: https://lists.openembedded.org/mt=
/102530478/1997914</div><div>&gt; &gt; Group Owner: openembedded-devel+ow=
ner=40lists.openembedded.org</div><div>&gt; &gt; Unsubscribe: https://lis=
ts.openembedded.org/g/openembedded-devel/unsub =5Braj.khem=40gmail.com=5D=
</div><div>&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><=
div>&gt; &gt;</div></div></blockquote>
--6550fc7d_7d4aba99_12072--


