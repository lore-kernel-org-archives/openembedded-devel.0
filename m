Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80573C4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:38:26 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web11.1420.1699727899640590774
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=Z4tv3m8Q;
 spf=pass (domain: web.de, ip: 217.72.192.78, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699727897; x=1700332697; i=jan.claussen10@web.de;
	bh=IiOfvNRzFcYad81hPC7ZQehdl+8hVXMF2JcaiKwMdwY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=Z4tv3m8QViUAxV6UlhVOFSDVTNPsCftekoZ2pz2KO+BRonYkWmZfBrbDqOj1JvKi
	 D6R6aSAnEbYJOWEva4WF3VJesGMRGNuCQYR03lA9jcrD0Sr4/AkfmQZEQqHh86yD9
	 hYGp/bqymVxjUpA66jySZe9EgaqT+u326iG/R2zFaQAdR32URxxRjBBafV68kr3vz
	 g/EGL+8ktFulKgJ5MBYurMPSEu2+7UctB4YXSPmicL9pjafJi0P7molr7NoX2ffEz
	 Gfx6+WMC0EmqK/4Ow/9s44o4QtNF1sJjjRbRbbeZzN5CsMvm8TrE7hoDpF+pCThy+
	 DpF5XY6NoxhhaBZDrA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([192.119.63.182]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLARU-1qjfGV0Y78-00IdmR; Sat, 11
 Nov 2023 19:38:17 +0100
Date: Sat, 11 Nov 2023 19:38:16 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <10AB6CF7-A6FF-435A-A35A-A2A35560F6BD@getmailspring.com>
In-Reply-To: <73831758-7C17-4540-AD08-572959D92E0E@getmailspring.com>
References: <73831758-7C17-4540-AD08-572959D92E0E@getmailspring.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="654fca18_264e423f_12072"
X-Provags-ID: V03:K1:hVn4YN03jrkOfs0jrqfVUSWsgzm4pi/cX4UKN8IsB1/1dEo4RN7
 PCaK8lyJypHbfm6w680AyBAU95bux5y6RLVVJRjFSkkve0POvOPJW08vODpDmvZNFBUC6Si
 6/wgrdyEtgnr533vGKWLSAuZ8rvBJICL/DKvcCPMWuHIvS7jkk+/WZV0GsBb755EpXXLMuf
 flhtQafkLa3UX36KKVTtQ==
UI-OutboundReport: notjunk:1;M01:P0:AequYRY2gTA=;HSFHDktZsQzdzihqkKNFiE1TRQy
 as45cjNc0FbCpu1qCIk5jRjKL/PDJGGaLBLo9cRgqeI96sPTgGVkQns6JK5TBFGnwohyRbxhb
 OjFxlfxkcTmdcXtskYNdKOLokbaG2idVynNlW+GRGmVmfbiBQ6umjmUlG2bu8E7GR8zLSYarS
 4jMo+ie4DD2OtIOIarSLz4SOiYFirJzPMUmDKGXCiIwzcDEcoq9B4JDgvOb/ijY5ZCBzqNGTo
 Z7qf06OOuq9iH7TIzb2KEUi8aiJco4AzV/2ludc7mNJl9VySgEg4qj6GAXYwUZBMxqg5+Ywc6
 XImsmpcQmQ9K9YabiQ06HU6TRO7JZVPep+pKFX8VeTqqYr+XG215/YGxAEC3nFj3wFsHzNz4P
 Dc+L+7T0+0ASaPjd0G/z0wFJsOHOLjZo9DE00G53KHY+ErgO+5eDMP/Cp+jxtgRMJEF9zS/d4
 P03DuKUnTrzZGRopX8YF5I8MXR3QsZYuFGHbPSHvqzrjoiux8mWKgN+FyQkngdc4ng18LjpVi
 nKIHA8VDzbGgEPo9TL/TiETaXVjZfHdNfLYkjmkJLLDw+7u3oyIoRAhb5HyCJU2HFmwWVpG0W
 1e9LPbckRYNqz90LR877sUsgOzjskrD5bs6Z/sUx6713eDXSY8KM4CMc2U91QhF+Ld4/VlNUl
 bRQgfwhXvJREXe2xYcn9QqRxlY0jAErOd4XlZci6Yc2y8iXHlLtP02n2/LqP5GtmmN7JgCYHB
 ponUxVsBlDPwUsx13drlkRFN5Z1xvIQqSPBKOUTlxxk/cjIghr4iZeBbihUqZ3a7cEzry+qjV
 ++FB9ix8Sd7GBYvRHROWmIHueUM3hsw6SNOwdN0xkavB/p+75zTJipTufjNiciGpIG7yOBK0g
 kM8SZ1QBTxuhhhQ/ENasJ6UFPkSv1fWborNXc83CR1L4qzCOLtKkV6DbRdj+8sZaEllwa48w4
 kX1YAdL3UvTcZNtGJTiQgy1UW9I=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 18:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106562

--654fca18_264e423f_12072
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

It also needs a utf-8 locale to work. Else you have to force utf-8 mode w=
ith a flag. I haven't included this as dependency at this point.

On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10=40web.de> w=
rote:
> Glad that it arrived now=21 This is a really great resource monitor. It=
 is building from the git repository. Do you think it is better to use th=
e release instead=3F
>
> On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com> wrote:
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
> >
>


--654fca18_264e423f_12072
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>It also needs a utf-8 locale to work. Else you have to force utf-8 m=
ode with a flag. I haven't included this as dependency at this point.</di=
v><br><div class=3D=22gmail=5Fquote=5Fattribution=22>On Nov. 11 2023, at =
7:35 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><bl=
ockquote><div>Glad that it arrived now=21 This is a really great resource=
 monitor. It is building from the git repository. Do you think it is bett=
er to use the release instead=3F</div><br><div class=3D=22gmail=5Fquote=5F=
attribution=22>On Nov. 11 2023, at 7:30 pm, Khem Raj &lt;raj.khem=40gmail=
.com&gt; wrote:</div><blockquote><div><div>Thanks for your contribution J=
an</div><br><div>On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fe=
n &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt;</div><div>&gt; --=
-</div><div>&gt; meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 +++=
++++++++++++++++++</div><div>&gt; 1 file changed, 23 insertions(+)</div><=
div>&gt; create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb=
</div><div>&gt;</div><div>&gt; diff --git a/meta-oe/recipes-support/btop/=
btop=5F1.2.13.bb b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><di=
v>&gt; new file mode 100644</div><div>&gt; index 000000000..f780a993a</di=
v><div>&gt; --- /dev/null</div><div>&gt; +++ b/meta-oe/recipes-support/bt=
op/btop=5F1.2.13.bb</div><div>&gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt=
; +SUMMARY =3D =22Resource monitor that shows usage and stats for process=
or, memory, disks, network and processes.=22</div><div>&gt; +HOMEPAGE =3D=
 =22https://github.com/aristocratos/btop=22</div><div>&gt; +LICENSE =3D =22=
Apache-2.0=22</div><div>&gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENS=
E;md5=3D3b83ef96387f14655fc854ddc3c6bd57=22</div><div>&gt; +SECTION =3D =22=
console/utils=22</div><div>&gt; +</div><div>&gt; +SRC=5FURI =3D =22git://=
github.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain=22</div><=
div>&gt; +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22</div>=
<div>&gt; +</div><div>&gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div>&g=
t; +</div><div>&gt; +inherit cmake</div><div>&gt; +</div><div>&gt; +=46IL=
ES:=24=7BPN=7D +=3D =22 =5C</div><div>&gt; + /usr/share/icons =5C</div><b=
r><div>Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share</div><br=
><div>&gt; + /usr/share/icons/hicolor =5C</div><div>&gt; + /usr/share/ico=
ns/hicolor/48x48 =5C</div><div>&gt; + /usr/share/icons/hicolor/scalable =5C=
</div><div>&gt; + /usr/share/icons/hicolor/48x48/apps =5C</div><div>&gt; =
+ /usr/share/icons/hicolor/48x48/apps/btop.png =5C</div><div>&gt; + /usr/=
share/icons/hicolor/scalable/apps =5C</div><div>&gt; + /usr/share/icons/h=
icolor/scalable/apps/btop.svg =5C</div><div>&gt; +=22</div><div>&gt; --</=
div><div>&gt; 2.42.0</div><div>&gt;</div><div>&gt; -=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; Links: You receive all messages sent=
 to this group.</div><div>&gt; View/Reply Online (=23106559): https://lis=
ts.openembedded.org/g/openembedded-devel/message/106559</div><div>&gt; Mu=
te This Topic: https://lists.openembedded.org/mt/102530478/1997914</div><=
div>&gt; Group Owner: openembedded-devel+owner=40lists.openembedded.org</=
div><div>&gt; Unsubscribe: https://lists.openembedded.org/g/openembedded-=
devel/unsub =5Braj.khem=40gmail.com=5D</div><div>&gt; -=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt;</div></div></blockquote></blockq=
uote>
--654fca18_264e423f_12072--


