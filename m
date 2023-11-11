Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8A8C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:35:46 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web10.1346.1699727745275589066
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=EKL1R9IK;
 spf=pass (domain: web.de, ip: 212.227.15.4, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699727743; x=1700332543; i=jan.claussen10@web.de;
	bh=ddfw62/WAKpf+eoG/55ROT02TzxBUbi9cEZYQ08JhEo=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=EKL1R9IK+bbhxKc9prIDIMpHTW2vJK0eLEXO1gsMmEGCcVeuk7RK3vuVi7xw86xu
	 BQDONwbWyFa/mGQt/BHGxh8revIYe/rAagSLBPSFy/B7h0Hh+EvB4oJZkUcxtv3Ft
	 1Bmylk85RupPgsDsE7Eotxe6ONn+qL0PotKaMzwYVHzjTwf6hMYoFgomI9JmPl+qw
	 RWU9tl75NuTqngIt8TExhac2WeMa25gaqTBjVfFEaSRvEN6b5BJ6QKafJDonWkkSD
	 4GakH3/LopdVCh+fuA2Bq02RsNiCAluC4d5OBR71iDhNAcEw7NiFnRUneZxQhVEky
	 U18t1L+XhQK/DZxUBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([192.119.63.182]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgiXQ-1rc3aV0r7M-00gyD2; Sat, 11
 Nov 2023 19:35:43 +0100
Date: Sat, 11 Nov 2023 19:35:42 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <73831758-7C17-4540-AD08-572959D92E0E@getmailspring.com>
In-Reply-To: <CAMKF1spgAw3VRxGECeyk3hbNM3yx1CZVGz4VNZOb+iiOWw9=2A@mail.gmail.com>
References: <CAMKF1spgAw3VRxGECeyk3hbNM3yx1CZVGz4VNZOb+iiOWw9=2A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="654fc97e_1fa39105_12072"
X-Provags-ID: V03:K1:XFz9mv0G7eDqaTZQK/LDfUZMa0iGGvRkhPRQiuOV0xd7V9o/BTq
 ISoFVTGt8CXO+d8WQDVBlOzDQxe966AUIP+y2P2edmMwOVprDKV23yHsFIauyuSQlncvdTd
 G6W+O70q792wRd/yUsfvqB8URzbICGg5lpKfmF2KCoTuAcyL9muZhTNnbBZSPiCh1czejM0
 XOHP1DDBDy6FmpBIysSBQ==
UI-OutboundReport: notjunk:1;M01:P0:WyajQmQd4wY=;aTSe8z1eCFinszlpym01u62G6O8
 DAcSfabxyNRcDzpjyM1nn2YmoSjhb7ilgCsp8Jxf7DEp5+LeGi2gtoe/WAAQhJCf2qDSRe8tr
 mX/1rDlR/iKFbCQ8Fm3CcQOtoNKbXxcGhpWcX9/NchrL0eOm1SisA77kk9B+mi8j+pJCfTx4L
 2ZZQvjY/IyKWqAp+wEFHfOCxWlA357ARBYWlj95OLaUBprNwq2fxIWN/PA5LsrfB9UqN3Cz5b
 l2tHY+kwax6wWz82Ggealnh9siTgu89iHrn1KhGyxjPk+cW3vQ7pyiTkcaSRTC3Mdj+0+v0pf
 Q/qEOdMJJRFnbyWA1U//13mkyp5R6Bm8v3nP0I7ADwn96DCecNgKeG6JeYSJv7LoqBgv0pxBu
 vh8CpiQIgXvH5qayomcyQHn0xWpm+/xHvHlQB+NaoYhufcAgy7VuwD53KTZLpHHUBBoMBO3Gj
 Xrq4abSJH1VJ/wCokSAqqpNPRcICmF+4YeRwrD0RVVzAE/tBoG1Plr1fWSQfeKQ766/OysLcp
 vei5R6j7/YyMsESLDQ4KGppqTi7v5k3ku+6TbqmIfrbwBlqeVpSIJDb52oNfHNIpQImhFXrNb
 k3KbpQa2t8j9k1ECk/wSuGKXCvXBD7wyPtbnPgiRZuO1uEkLJpe3zpV9A4PKirt5rnYj5KaGU
 5TEKZgWPrBVJAQPELVI3nueOFIzGxlgDaGLbxz4t3zn5BbJkI73lN/K6XJ1ZabnVELmSeDubR
 pzCRKg/LSW5BHo9Oj+HKgty3wKVO2CB839F3kwjE0Xgql83sakh7caLEDxlJvIJkoVUg0FV5g
 77bOFHN17DGNcUKoqsPwGueu4WOICWfG+oUio1Y68dRHZsSZVVxZWP4YwD6BAds4Q3p/Ho+kW
 OvHeyOUcQzMUx8420Ndhi645dd6P8SFm7emNIqzsO/X4gbsUlM7OjfpLHhIyjqul2659RUsaf
 uk9RevEx+ImUmfIOvxFX+0E6zuU=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 18:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106561

--654fc97e_1fa39105_12072
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Glad that it arrived now=21 This is a really great resource monitor. It i=
s building from the git repository. Do you think it is better to use the =
release instead=3F

On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> Thanks for your contribution Jan
>
> On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10=40web.de> wrote:
> >
> > ---
> > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++++++++++=
+++++
> > 1 file changed, 23 insertions(+)
> > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> >
> > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/=
recipes-support/btop/btop=5F1.2.13.bb
> > new file mode 100644
> > index 000000000..f780a993a
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
> > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22
> > +
> > +S =3D =22=24=7BWORKDIR=7D/git=22
> > +
> > +inherit cmake
> > +
> > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > + /usr/share/icons =5C
>
> Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share
> > + /usr/share/icons/hicolor =5C
> > + /usr/share/icons/hicolor/48x48 =5C
> > + /usr/share/icons/hicolor/scalable =5C
> > + /usr/share/icons/hicolor/48x48/apps =5C
> > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > + /usr/share/icons/hicolor/scalable/apps =5C
> > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > +=22
> > --
> > 2.42.0
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (=23106559): https://lists.openembedded.org/g/opene=
mbedded-devel/message/106559
> > Mute This Topic: https://lists.openembedded.org/mt/102530478/1997914
> > Group Owner: openembedded-devel+owner=40lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b =5Braj.khem=40gmail.com=5D
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--654fc97e_1fa39105_12072
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Glad that it arrived now=21 This is a really great resource monitor.=
 It is building from the git repository. Do you think it is better to use=
 the release instead=3F</div><br><div class=3D=22gmail=5Fquote=5Fattribut=
ion=22>On Nov. 11 2023, at 7:30 pm, Khem Raj &lt;raj.khem=40gmail.com&gt;=
 wrote:</div><blockquote><div><div>Thanks for your contribution Jan</div>=
<br><div>On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen &lt;ja=
n.claussen10=40web.de&gt; wrote:</div><div>&gt;</div><div>&gt; ---</div><=
div>&gt; meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 +++++++++++=
++++++++++</div><div>&gt; 1 file changed, 23 insertions(+)</div><div>&gt;=
 create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><d=
iv>&gt;</div><div>&gt; diff --git a/meta-oe/recipes-support/btop/btop=5F1=
.2.13.bb b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; n=
ew file mode 100644</div><div>&gt; index 000000000..f780a993a</div><div>&=
gt; --- /dev/null</div><div>&gt; +++ b/meta-oe/recipes-support/btop/btop=5F=
1.2.13.bb</div><div>&gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; +SUMMARY=
 =3D =22Resource monitor that shows usage and stats for processor, memory=
, disks, network and processes.=22</div><div>&gt; +HOMEPAGE =3D =22https:=
//github.com/aristocratos/btop=22</div><div>&gt; +LICENSE =3D =22Apache-2=
.0=22</div><div>&gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57=22</div><div>&gt; +SECTION =3D =22consol=
e/utils=22</div><div>&gt; +</div><div>&gt; +SRC=5FURI =3D =22git://github=
.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain=22</div><div>&g=
t; +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22</div><div>&=
gt; +</div><div>&gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div>&gt; +</=
div><div>&gt; +inherit cmake</div><div>&gt; +</div><div>&gt; +=46ILES:=24=
=7BPN=7D +=3D =22 =5C</div><div>&gt; + /usr/share/icons =5C</div><br><div=
>Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share</div><br><div>=
&gt; + /usr/share/icons/hicolor =5C</div><div>&gt; + /usr/share/icons/hic=
olor/48x48 =5C</div><div>&gt; + /usr/share/icons/hicolor/scalable =5C</di=
v><div>&gt; + /usr/share/icons/hicolor/48x48/apps =5C</div><div>&gt; + /u=
sr/share/icons/hicolor/48x48/apps/btop.png =5C</div><div>&gt; + /usr/shar=
e/icons/hicolor/scalable/apps =5C</div><div>&gt; + /usr/share/icons/hicol=
or/scalable/apps/btop.svg =5C</div><div>&gt; +=22</div><div>&gt; --</div>=
<div>&gt; 2.42.0</div><div>&gt;</div><div>&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-</div><div>&gt; Links: You receive all messages sent to =
this group.</div><div>&gt; View/Reply Online (=23106559): https://lists.o=
penembedded.org/g/openembedded-devel/message/106559</div><div>&gt; Mute T=
his Topic: https://lists.openembedded.org/mt/102530478/1997914</div><div>=
&gt; Group Owner: openembedded-devel+owner=40lists.openembedded.org</div>=
<div>&gt; Unsubscribe: https://lists.openembedded.org/g/openembedded-deve=
l/unsub =5Braj.khem=40gmail.com=5D</div><div>&gt; -=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-</div><div>&gt;</div></div></blockquote>
--654fc97e_1fa39105_12072--


