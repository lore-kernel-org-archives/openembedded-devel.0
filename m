Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22780C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 21:10:46 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by mx.groups.io with SMTP id smtpd.web11.16914.1700341839200979976
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 13:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=gN+Xpb7A;
 spf=pass (domain: web.de, ip: 212.227.15.14, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700341836; x=1700946636; i=jan.claussen10@web.de;
	bh=h6nxenzDrPT1U2SQeX+2OHtevscRrPJEJ9GpbcKv08I=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=gN+Xpb7A5dfQjVMPkWIBBMxH2qDphA7CHSYIlSnZbbBUD0KW/nzfq4DNuU2FU9TT
	 1gn6YGUaAFHU0sGpacD19GJkatzeFa/ql3Qhb49DQS5+m9DdVf2D2mFiP/WMhPbjf
	 ikEZr/Azc1R762UUKRKjV2CHBZ3eJtGSwBQfeD85Jr8PXzrzE8dNYv4QjmiZxOV9e
	 bkolkyoCtjxLHd5nGbjvkrDUL3Qil525bEKWvVYkFzdM7FmZ/1o1pXlHmqqXFEXUB
	 EW7Ed1Uk2FLoELgpsdjb9eH8vdbXgyk/uyrRwgv8KPhcdk2s6999OzA95tMdjG8lM
	 rZ72GBFFngIpFDbLSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from x1-yoga ([195.123.103.85]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdwJO-1rfS5y1FHq-00avvF; Sat, 18
 Nov 2023 22:10:36 +0100
Date: Sat, 18 Nov 2023 22:10:35 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <20796306-08F9-4F85-819B-B46624BDFD7D@getmailspring.com>
In-Reply-To: <CAMKF1sqNvLqxai8HX-OHV9+Tr9EO7UJxexEW7VFKQkFrnHVd+g@mail.gmail.com>
References: <CAMKF1sqNvLqxai8HX-OHV9+Tr9EO7UJxexEW7VFKQkFrnHVd+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6559284b_1ffe0de6_7ca"
X-Provags-ID: V03:K1:GII0+pzZIyFsUhVUKHmaCm8q0fcrRbT01baKOyro7+t4m3evJGm
 kerJcXElWVGAhkHwRulzaJePbol4s4ppRD6xxItXIlGkp5wyhno6zMbk0wORegy5ucR6yZt
 EvGad6jKgxq7SjG6dprt8zKWkNIOZ5X+iszKiJ8NVn9lrW9P3dwgDm7WF/LLd1XhtPWFKdG
 rILgXwS0wy8Zmcqc51cGg==
UI-OutboundReport: notjunk:1;M01:P0:lSXpwGhE71g=;L3VNBtadqWgeP9EFy20HQWcKmsp
 vajCDixd8v6O9JNoAvfFxjfsujWBcfS7DtYIjPlyCOTXHdb5dP9aMxGxZKe8cuRixUBGj40sP
 etgS5KKxSVA/dwgaMN9SP/PTSt5D/0ok9v2Voji7bQwn3IHB+Azcb46BhKU3+2KQiPmWRnq6S
 mk6VZVQr2ebb3ImtCb0rEK4Vi8RAgDERUlsAoPAuUzUwQBjhi8TqxsvcaLhddtHV6bSMvE57e
 aMzqMAY5kgj2Dwai+QIDcfBFlvm67vl2sSQJJJXrkCVv5ginfStSoEBhsSW9R8/10H2CSc0vV
 /toJhz+TtXW1MbT9E0GHra0lE92Wp4YUMpaYvGNAnCNWp4oHkH2cdahHu+VDvUgrAhATfM1vF
 iU2vLHSvDBAsNNw2SRpx2bx24lMAoWYA9ixV7+IK28e84Pui9s7zToqIKn/SoRAxzocMnIPPX
 FIvEcBUWxUmzhI4vhT7OrajIMPCsyaz3xchW3egOeAEFJUEh1VlY0Fqi83WWOio+McDqlZZrV
 vMY3UE8f4spKxBWSZYQg193VTZ5qUYUX36QMZv0PjxgNmWfk4H3EtRBZdiE82pREPuC2s6PQL
 1zmY39x4/5oHoCtiJA+W+hBAMWuwkBzGvalOOUM/lasNMI3Teed8fcVeNRm2mJdPv838vJhk7
 oBziws+N4DsuOJAnekz6bAF5nF0s9ZIjUObMbsEyb03N9F74WKzdkuvHtA9E+r9SnzP455kvv
 ntJ9VjPxNblJ3XSeqlnIHu6dXtqERs80fIyQxxMJw1cV80f1gmSfAQ5a91oQaqICpr87anksw
 65vMoLDEueqYla07Hym0a5ufU3kNv6K7n7M8Xiyb4wLOEnNm9Y6Bj0McCxNcryvWXnJSjetwi
 /JYiwnGoDvXrRoj4lxaF4cGozLgJM5C/nFRGV4uO0t6wELU5R9rTVeh6nIzTTSVvLv7JkULTa
 t8WW4w==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 21:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106896

--6559284b_1ffe0de6_7ca
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

So the commit title should have started with the recipe name=3F btop-1.2.=
13.bb=3F

Is there any mail program that can format diffs automatically btw=3F I do=
n't care about how to submit patches. It is just not nice to read and in =
your case I also have an > added for every reply, which just gets hard to=
 read after long correspondence.
On Nov. 18 2023, at 8:09 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> I tweaked the commit message summary before staging it into
> master-next, here is some guidelines on patch submission
>
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html=3Fh=
ighlight=3Dpatch+submission
> ps: It also explains why we use mailing lists in contribution workflow.=

> On Sat, Nov 18, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10=40web.de> wrote:
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
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (=23106891): https://lists.openembedded.org/g/opene=
mbedded-devel/message/106891
> > Mute This Topic: https://lists.openembedded.org/mt/102675969/1997914
> > Group Owner: openembedded-devel+owner=40lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b =5Braj.khem=40gmail.com=5D
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--6559284b_1ffe0de6_7ca
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>So the commit title should have started with the recipe name=3F btop=
-1.2.13.bb=3F</div><br><div>Is there any mail program that can format dif=
fs automatically btw=3F I don't care about how to submit patches. It is j=
ust not nice to read and in your case I also have an &gt; added for every=
 reply, which just gets hard to read after long correspondence.</div><br>=
<div class=3D=22gmail=5Fquote=5Fattribution=22>On Nov. 18 2023, at 8:09 p=
m, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><blockquote><div><di=
v>I tweaked the commit message summary before staging it into</div><div>m=
aster-next, here is some guidelines on patch submission</div><br><div>htt=
ps://docs.yoctoproject.org/contributor-guide/submit-changes.html=3Fhighli=
ght=3Dpatch+submission</div><br><div>ps: It also explains why we use mail=
ing lists in contribution workflow.</div><br><div>On Sat, Nov 18, 2023 at=
 10:26=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:=
</div><div>&gt;</div><div>&gt; Adds btop, the shell-based resource monito=
r that shows usage and stats for processor, memory, disks, network and pr=
ocesses.</div><div>&gt;</div><div>&gt; Signed-off-by: Jan Clau=C3=9Fen &l=
t;jan.claussen10=40web.de&gt;</div><div>&gt; ---</div><div>&gt; meta-oe/r=
ecipes-support/btop/btop=5F1.2.13.bb =7C 23 +++++++++++++++++++++</div><d=
iv>&gt; 1 file changed, 23 insertions(+)</div><div>&gt; create mode 10064=
4 meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt;</div><div>=
&gt; diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe=
/recipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; new file mode 10064=
4</div><div>&gt; index 000000000..a944fe7b5</div><div>&gt; --- /dev/null<=
/div><div>&gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</div><=
div>&gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; +SUMMARY =3D =22Resource=
 monitor that shows usage and stats for processor, memory, disks, network=
 and processes.=22</div><div>&gt; +HOMEPAGE =3D =22https://github.com/ari=
stocratos/btop=22</div><div>&gt; +LICENSE =3D =22Apache-2.0=22</div><div>=
&gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57=22</div><div>&gt; +SECTION =3D =22console/utils=22</div>=
<div>&gt; +</div><div>&gt; +SRC=5FURI =3D =22git://github.com/aristocrato=
s/btop.git;protocol=3Dhttps;branch=3Dmain=22</div><div>&gt; +SRCREV =3D =22=
9edbf27f1b6d5844a97325fcda732762ba086a99=22</div><div>&gt; +</div><div>&g=
t; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div>&gt; +</div><div>&gt; +inh=
erit cmake</div><div>&gt; +</div><div>&gt; +=46ILES:=24=7BPN=7D +=3D =22 =
=5C</div><div>&gt; + =24=7Bdatadir=7D/icons =5C</div><div>&gt; + =24=7Bda=
tadir=7D/icons/hicolor =5C</div><div>&gt; + =24=7Bdatadir=7D/icons/hicolo=
r/48x48 =5C</div><div>&gt; + =24=7Bdatadir=7D/icons/hicolor/scalable =5C<=
/div><div>&gt; + =24=7Bdatadir=7D/icons/hicolor/48x48/apps =5C</div><div>=
&gt; + =24=7Bdatadir=7D/icons/hicolor/48x48/apps/btop.png =5C</div><div>&=
gt; + =24=7Bdatadir=7D/icons/hicolor/scalable/apps =5C</div><div>&gt; + =24=
=7Bdatadir=7D/icons/hicolor/scalable/apps/btop.svg =5C</div><div>&gt; +=22=
</div><div>&gt; --</div><div>&gt; 2.42.1</div><div>&gt;</div><div>&gt;</d=
iv><div>&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt;=
 Links: You receive all messages sent to this group.</div><div>&gt; View/=
Reply Online (=23106891): https://lists.openembedded.org/g/openembedded-d=
evel/message/106891</div><div>&gt; Mute This Topic: https://lists.openemb=
edded.org/mt/102675969/1997914</div><div>&gt; Group Owner: openembedded-d=
evel+owner=40lists.openembedded.org</div><div>&gt; Unsubscribe: https://l=
ists.openembedded.org/g/openembedded-devel/unsub =5Braj.khem=40gmail.com=5D=
</div><div>&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&=
gt;</div></div></blockquote>
--6559284b_1ffe0de6_7ca--


