Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089F5C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 20:11:07 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.748.1635883864605791918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 13:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=mVTmoyrn;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635883864;
  x=1667419864;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KqF3OzUomDm7bxMAkLU7B6XHO882YHsih/Z0gLzgSS0=;
  b=mVTmoyrnF3Lk+mAkilo+Cw0XsWpWXJ2RpJs8uTslFJZl8hrrMiztjbA2
   gSoHBwbp8YkS/HFttC1p4CqNclTFsenGoGJzBOouyoIbhKTKu10rgRzyz
   x9OmzvoADrQ1lO6Tgp3bFHExoS5vbK5zCb1obe/nG5rqlUJW1nVwnQt2v
   YIPLqpQaD3fJZIJ3mcC1pxNW5lP+6YqQEBIBascR4dePWuWHdBXn1qAAz
   4z/nuZ30O/txX1AFGYnY7JsSr3KTGRtiRaz9TvDfryS03G1p8B7vv4a1x
   mqCNWJyx05w4FMfsrZj3yfR/pnsGctVXhQk/Eb4SMW6iTe9DolYblWBtX
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>, "OE Development
 (openembedded-devel@lists.openembedded.org)"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] Is it time to remove opensaf?
Thread-Topic: [oe] Is it time to remove opensaf?
Thread-Index: AdfQBVT48u0Gx35rTT+0sp2HRYUaXwAE94UAAALLvYA=
Date: Tue, 2 Nov 2021 20:11:02 +0000
Message-ID: <c904695823484f2fb1ce9df4e14d0f6e@axis.com>
References: <432b09f9a07b493fb9191eec798aa07a@axis.com>
 <083fee51-9dd8-c9d3-7f27-90f41e8d261e@gmail.com>
In-Reply-To: <083fee51-9dd8-c9d3-7f27-90f41e8d261e@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 20:11:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93792

> -----Original Message-----
> From: akuster808 <akuster808@gmail.com>
> Sent: den 2 november 2021 20:41
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; OE Development
> (openembedded-devel@lists.openembedded.org) <openembedded-
> devel@lists.openembedded.org>
> Subject: Re: [oe] Is it time to remove opensaf?
>=20
> Peter,
>=20
> On 11/2/21 9:33 AM, Peter Kjellerstedt wrote:
> > I am currently working on patches for OE-Core to report QA warnings
> > in case some directories that are expected to be empty have some
> > files installed into them. As part of the review process, Khem
> > reported failures for some recipes in OpenEmbedded due to this,
> > opensaf being one of them.
> >
> > Now I have tried to build and run opensaf in a QEMU image, but I
> > cannot get it to work. The sysvinit initscript relies on
> > /lib/lsb/init-functions, which AFAICT has not existed since lsb
> > was removed from OE-Core two years ago, and opensaf has never
> > depended on lsb in the first place. As for systemd, the service
> > file uses the same sysvinit scripts so it has the same problem.
> > And in addition, the script is in /etc/init.d, which
> > systemd.bbclass removes unless both sysvinit and systemd are
> > enabled in DISTRO_FEATURES.
> >
> > And in addition to this, if I just try to start the opensafd binary
> > it seg faults immediately.
> >
> > So all in all, even if opensaf has been updated regularly, it
> > doesn't seem like anyone is actually using it. Which brings me to
> > my actual question: should I just send a patch to remove it?
> >
> > Alternatively I can fix the creation of the /var/log/opensaf
> > directory, which was the error Khem saw with my patch for OE-Core
> > applied, but it seems like wasted work in case no one is actually
> > using the recipe...
>=20
> Thanks for the analysis. Does the current mechanism to blacklist a
> recipe help possible finding users of this recipe?=A0 Is your concern
> carrying this in the next LTS as well?

I guess adding a PNBLACKLIST for it would work too (I have never used=20
it, so I did not think off it). My concern was mainly that I had to=20
spend time on fixing the recipe to support that /var/volatile is now=20
checked for being empty, for a recipe that apparently is broken. So=20
if a PNBLACKLIST helps the next person that does changes to the system=20
from having to care about the broken opensaf recipe, then that is fine=20
with me. ;)

In the end I did send a patch that changes the opensaf recipe to create=20
/var/log/opensaf in runtime, by copying the solution for one of the=20
other recipes I was fixing. So I am in the clear for my change to=20
OE-Core. But opensaf is still as broken as before when it comes to=20
actually starting the service...

> -armin
> >
> > //Peter

//Peter


