Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF47C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 17:23:13 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web11.19063.1699809783850323847
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 09:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=rK/qnjYe;
 spf=pass (domain: web.de, ip: 217.72.192.78, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699809781; x=1700414581; i=jan.claussen10@web.de;
	bh=Xq+R/TDp3rgR/TX0rzncU7YaVkaVcrBhS38gjpm+3LU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=rK/qnjYeGK0vvbO+pk5VKu/bnijtY3pctX8wbNPFScjdX0iG0tovsHez5beHnnWU
	 GMK6KD1OfZ4OW835f7i/lNZlWVHFyd/Xo6VyEHEbiYXkgIKUSLTwv37XutkSDAQU3
	 jSeXPdxP5GKvyZBDECvstHQtfT0fifUIT3DLxsa12xG/GHLwzefM1dEn15GgwFmrA
	 KPeThltn+9DBfAc0B0Jd49gCSIvv7hVf/TlYviWexPw9O9KG5pXTOWij8WaMPrdpQ
	 ibNt1eg9LGOcbGL9SqPyk9fM+zFPbAUpab1ydzkPVEH6mMODYOd/HPT3WJIvnFkcQ
	 uV8Mmz+Kv9Vdwq0GsQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([31.29.47.11]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mw9xG-1rL8V70sC4-00sFqN; Sun, 12
 Nov 2023 18:23:01 +0100
Date: Sun, 12 Nov 2023 18:23:00 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <EA44BE37-C4A7-47D0-9361-FAC9B2D84373@getmailspring.com>
In-Reply-To: <CAMKF1spS52dn3+XxVsh3JhisBo58PN8fj6HGXtjNc+YKXp5fHg@mail.gmail.com>
References: <CAMKF1spS52dn3+XxVsh3JhisBo58PN8fj6HGXtjNc+YKXp5fHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="655109f4_100e93_12072"
X-Provags-ID: V03:K1:y2a8NhKKZkWgQI7WYKzQgrKTp7R6fRPHHfKBhMv1LMeqr6acri/
 N5//GYoBnVi860y6KfkvGvzlNLDV+DDuD1WlGYhLPFRHDdF+BTDZdrV5MC5fmGjuco7CJqK
 brK85ePoNb/wKqEHAL2ZcafeOJx33/w5s555PHLMz6fiRqX/sFQg6LaZ+8kbk1HbC4A6QoD
 kn729wjqnwl4tEoXHItFg==
UI-OutboundReport: notjunk:1;M01:P0:8MxL1yDiC4I=;MeFa5DshP1vQ+ZpGQ+ba9PFYJBN
 oQ4VGW73pnBf3qL//CeMNRIUQtuRtRReFXDDbGwu1Oh9g4yi6limzYDefSZ6vLigi028sCt5M
 2GECJUfrkX/V9tWzc09z+xdlHJdGnuhax2SEGUfHmxulPs/7tFj1day8xwkT/VTaC+ZNcbKTL
 Mo7gMID7ezikhMmDQlbONKFbDYv2Q35iYTZmw3sIze9nZXcZ1Z2IFn12GYz9XZKUDplWp3R8j
 z5TN2gwxY3+BBHR+aMT2g1NEIkY4BDUsdYsr+bOOZF0NW2PrmHMb2rBwxzJWYbZc1E0YKes2H
 WbLQyu2ayU2U8VC0CbYgQYCnGuytCEACFpaWA3NpGo/hVku33F5yDTvgXZu507jIlIaqPAO4w
 GwoBuQPPVGdEHUCfhwnrO9VgCRqxtDgMd1vkgAfNdb37lwk/UE+hU0P8m6TL4Vp4NiAAsEfoL
 nCwByLxJuRhikn8F2NTwMJAjuNO9W+g14KzFwWjdZI6ljStJos+y6j73zqyvNS0fJkYumhNpE
 o8Jx4Ro6pqILMpRP3AqPAe8OfX47e3qsk+GK8lhLBeN/CYkfxts3LbRS3dV7yHejsky/NaPI5
 39aQnFBwJOQx7KIWSMaIzR77O6e8MhxoRkkHP1MFhhZDvS2wPBL6v9dOJY7+zxqpDT1/BaneB
 XWTZ4c/txPaGZlcdDpXVecrL6ejj0X1zqmODnXS6PIOM7xuJJT/53n/SZxTDfgZd12Ps9rH4N
 Y9B2aok+MfSt32F+NMuFVYr5w9d1C/FxuRgG8b4fKF/iwTB8/N7a7rAWxS+AQ6IWaXs53RhdY
 E5dR6GrO3S7wrHAGagIs9JpHN0uUnFWkf4CZNxBDnMofeM/EO/E7UzFv0clMgcrUR0TKIfycr
 5R17045StbvVxysvYIqqPS6Tg33umaN9QCB9Fqh19H77m5RLvDnJN+NyCG5h5uK8cAC4Fj/8I
 jMMiGYDvFYtpG/5yY3PFKGZREyI=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 17:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106595

--655109f4_100e93_12072
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yes, the CMake support was added two months ago and the release is from 2=
022. Cmake is also not supported by the main developer who seems to favor=
 an advanced Makefile. In any case, it is easier to fix than the Makefile=
. I will go with the git version for now then until there is a new releas=
e.

On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen1=
0=40web.de> wrote:
> >
> > I am trying with the tarball but it is quite hard, since it doesn't c=
ome with a CMakeLists.txt.
> > There is a recipe here, but it involves a lot of patching which could=
 potentially be painful to maintain
> >
> > https://github.com/aristocratos/btop/issues/330=23issuecomment-112368=
5779
> >
>
> is it because cmake support was added later =3F in that case maybe usin=
g
> git version is ok
>
> > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> >
> > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10=40web.de> wrote:
> > >
> > > It also needs a utf-8 locale to work. Else you have to force utf-8 =
mode with a flag. I haven't included this as dependency at this point.
> >
> > you want to express all that is needed to get it running amicably.
> > keeping in mind that we have glibc and musl based systems to service
> > it will be good to check it on musl too.
> >
> > >
> > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10=40web=
.de> wrote:
> > >
> > > Glad that it arrived now=21 This is a really great resource monitor=
. It is building from the git repository. Do you think it is better to us=
e the release instead=3F
> > >
> > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com> wrote:=

> > >
> > > Thanks for your contribution Jan
> > >
> > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.clau=
ssen10=40web.de> wrote:
> > > >
> > > > ---
> > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++++++=
+++++++++
> > > > 1 file changed, 23 insertions(+)
> > > > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > >
> > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta=
-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > new file mode 100644
> > > > index 000000000..f780a993a
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
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
=3Dhttps;branch=3Dmain=22
> > > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22
> > > > +
> > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > +
> > > > +inherit cmake
> > > > +
> > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > + /usr/share/icons =5C
> > >
> > > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share
> > >
> > > > + /usr/share/icons/hicolor =5C
> > > > + /usr/share/icons/hicolor/48x48 =5C
> > > > + /usr/share/icons/hicolor/scalable =5C
> > > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > > > +=22
> > > > --
> > > > 2.42.0
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (=23106559): https://lists.openembedded.org/g/o=
penembedded-devel/message/106559
> > > > Mute This Topic: https://lists.openembedded.org/mt/102530478/1997=
914
> > > > Group Owner: openembedded-devel+owner=40lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/=
unsub =5Braj.khem=40gmail.com=5D
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
>


--655109f4_100e93_12072
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Yes, the CMake support was added two months ago and the release is f=
rom 2022. Cmake is also not supported by the main developer who seems to =
favor an advanced Makefile. In any case, it is easier to fix than the Mak=
efile. I will go with the git version for now then until there is a new r=
elease.</div><br><div class=3D=22gmail=5Fquote=5Fattribution=22>On Nov. 1=
2 2023, at 6:20 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><bl=
ockquote><div><div>On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9F=
en &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt;</div><div>&gt; I=
 am trying with the tarball but it is quite hard, since it doesn't come w=
ith a CMakeLists.txt.</div><div>&gt; There is a recipe here, but it invol=
ves a lot of patching which could potentially be painful to maintain</div=
><div>&gt;</div><div>&gt; https://github.com/aristocratos/btop/issues/330=
=23issuecomment-1123685779</div><div>&gt;</div><br><div>is it because cma=
ke support was added later =3F in that case maybe using</div><div>git ver=
sion is ok</div><br><div>&gt; On Nov. 11 2023, at 8:01 pm, Khem Raj &lt;r=
aj.khem=40gmail.com&gt; wrote:</div><div>&gt;</div><div>&gt; On Sat, Nov =
11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de=
&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; It also needs a utf-8=
 locale to work. Else you have to force utf-8 mode with a flag. I haven't=
 included this as dependency at this point.</div><div>&gt;</div><div>&gt;=
 you want to express all that is needed to get it running amicably.</div>=
<div>&gt; keeping in mind that we have glibc and musl based systems to se=
rvice</div><div>&gt; it will be good to check it on musl too.</div><div>&=
gt;</div><div>&gt; &gt;</div><div>&gt; &gt; On Nov. 11 2023, at 7:35 pm, =
Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &g=
t;</div><div>&gt; &gt; Glad that it arrived now=21 This is a really great=
 resource monitor. It is building from the git repository. Do you think i=
t is better to use the release instead=3F</div><div>&gt; &gt;</div><div>&=
gt; &gt; On Nov. 11 2023, at 7:30 pm, Khem Raj &lt;raj.khem=40gmail.com&g=
t; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; Thanks for your contrib=
ution Jan</div><div>&gt; &gt;</div><div>&gt; &gt; On Sat, Nov 11, 2023 at=
 10:26=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:=
</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; ---</div><div>&gt; &gt=
; &gt; meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 +++++++++++++=
++++++++</div><div>&gt; &gt; &gt; 1 file changed, 23 insertions(+)</div><=
div>&gt; &gt; &gt; create mode 100644 meta-oe/recipes-support/btop/btop=5F=
1.2.13.bb</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; diff --git a/=
meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/recipes-support/b=
top/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; new file mode 100644</div><=
div>&gt; &gt; &gt; index 000000000..f780a993a</div><div>&gt; &gt; &gt; --=
- /dev/null</div><div>&gt; &gt; &gt; +++ b/meta-oe/recipes-support/btop/b=
top=5F1.2.13.bb</div><div>&gt; &gt; &gt; =40=40 -0,0 +1,23 =40=40</div><d=
iv>&gt; &gt; &gt; +SUMMARY =3D =22Resource monitor that shows usage and s=
tats for processor, memory, disks, network and processes.=22</div><div>&g=
t; &gt; &gt; +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22</di=
v><div>&gt; &gt; &gt; +LICENSE =3D =22Apache-2.0=22</div><div>&gt; &gt; &=
gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57=22</div><div>&gt; &gt; &gt; +SECTION =3D =22console/utils=
=22</div><div>&gt; &gt; &gt; +</div><div>&gt; &gt; &gt; +SRC=5FURI =3D =22=
git://github.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain=22<=
/div><div>&gt; &gt; &gt; +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a=
48b9b78=22</div><div>&gt; &gt; &gt; +</div><div>&gt; &gt; &gt; +S =3D =22=
=24=7BWORKDIR=7D/git=22</div><div>&gt; &gt; &gt; +</div><div>&gt; &gt; &g=
t; +inherit cmake</div><div>&gt; &gt; &gt; +</div><div>&gt; &gt; &gt; +=46=
ILES:=24=7BPN=7D +=3D =22 =5C</div><div>&gt; &gt; &gt; + /usr/share/icons=
 =5C</div><div>&gt; &gt;</div><div>&gt; &gt; Lets use =24=7Bdatadir=7D in=
stead of hardcoded /usr/share</div><div>&gt; &gt;</div><div>&gt; &gt; &gt=
; + /usr/share/icons/hicolor =5C</div><div>&gt; &gt; &gt; + /usr/share/ic=
ons/hicolor/48x48 =5C</div><div>&gt; &gt; &gt; + /usr/share/icons/hicolor=
/scalable =5C</div><div>&gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/a=
pps =5C</div><div>&gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps/bt=
op.png =5C</div><div>&gt; &gt; &gt; + /usr/share/icons/hicolor/scalable/a=
pps =5C</div><div>&gt; &gt; &gt; + /usr/share/icons/hicolor/scalable/apps=
/btop.svg =5C</div><div>&gt; &gt; &gt; +=22</div><div>&gt; &gt; &gt; --</=
div><div>&gt; &gt; &gt; 2.42.0</div><div>&gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt;=
 &gt; Links: You receive all messages sent to this group.</div><div>&gt; =
&gt; &gt; View/Reply Online (=23106559): https://lists.openembedded.org/g=
/openembedded-devel/message/106559</div><div>&gt; &gt; &gt; Mute This Top=
ic: https://lists.openembedded.org/mt/102530478/1997914</div><div>&gt; &g=
t; &gt; Group Owner: openembedded-devel+owner=40lists.openembedded.org</d=
iv><div>&gt; &gt; &gt; Unsubscribe: https://lists.openembedded.org/g/open=
embedded-devel/unsub =5Braj.khem=40gmail.com=5D</div><div>&gt; &gt; &gt; =
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt;</d=
iv></div></blockquote>
--655109f4_100e93_12072--


