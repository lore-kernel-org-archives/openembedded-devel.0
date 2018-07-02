Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id C88FB7896B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:44:20 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id o202-v6so9514394vko.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SJL7VtocM6pj0OR0TeH44mjmBTS+QYyZUSDB7OG5THY=;
	b=e5R1qtEgSdXNtX1XPd8XDvBNH8edvodtkqcsdOeY1x2HD4qLQBk7Dm1AIyUIHCXFGC
	54YMjLYPNPnBujl0okuFLMfXaIyOcIn9bazJNqmj5o6AtuYFfGeWTUOvctqUnBk1TVz6
	SPNldxWsCv1QwJwub9SN+yC+zNbcfXcnS8d3Ka/bnOSqegCzQMP6lrO6Gq3bGEsYw8kQ
	nxrXzQuG/RSjoYXAk1wYWHoU1tlse2lsgASVAcdKVJ/DwYFl04GFPV+a2UsooZnv4MJa
	0ZFB6yl4+4amPHEnfNQLwAoIxhKB+fgVYIqNi5NfoO/QatM3gJIrPxRkWONqjnCAM6BG
	VR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SJL7VtocM6pj0OR0TeH44mjmBTS+QYyZUSDB7OG5THY=;
	b=Oui8gvAuRYCs47yIH9VOL+DnwVpE0eDc0tlgGBuVEURX2HuSYfwIGMqEKv+O1Kzk9K
	+f57KmGrfH0o4Xotj5DoO2flzKrZOYX8f8t1gF8kuGuNQCpvUBHAScpXzVCXEV6nLlBx
	XaIP2rz0vL2PbHmoqtq5ByFMU3TrYycA4dDdUQlKA4WqRGFwlJ3mkm740i7/cuiKoeB9
	ZVCmJgZx+K/i2NYdSXitTZmRy8NO0yyCmB6hffJfv4UYMnpZ5ZggG/Utp3RLzeImEpGg
	uR5pq7hcC8As+LPovcFgCAGYV9JhTPCxVdAZ/Rz2elDZKe9NlrhGMYDE/3EuB81pEFKn
	lF+w==
X-Gm-Message-State: APt69E1jRk7+dtkRJoFfGWBUPWr02xeXLUQVAZK08Lla93RtJTJjPy9e
	AsyJfjFuJnW0xGLqjLj5ZMFv2+KyQn9c/LEJUSA=
X-Google-Smtp-Source: AAOMgpcwM4jcNUTKE2IKpKqL2QNz3RQFwII9Gs/ec39nC7DfrZZwL6rvg0y8e8SmNZL3fY7CVG4KcHQkmBUy0H6t+lA=
X-Received: by 2002:a1f:7c4:: with SMTP id
	187-v6mr15104921vkh.60.1530549861381; 
	Mon, 02 Jul 2018 09:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180629101758.28179-1-alexandru.vasiu@ni.com>
	<CAMKF1sq6Q1p0fpzVzA0U3b-t6N3ieSDme6B5-ZaK0tLBazz8PQ@mail.gmail.com>
	<MWHPR04MB097618A7658FEC9BA2B59757984E0@MWHPR04MB0976.namprd04.prod.outlook.com>
	<CAMKF1spePt0Zm3eqagOmjoyzMHqTrokwGGdGRXMX80deEbHEnQ@mail.gmail.com>
	<MWHPR04MB097647C999B588A7A960698098430@MWHPR04MB0976.namprd04.prod.outlook.com>
In-Reply-To: <MWHPR04MB097647C999B588A7A960698098430@MWHPR04MB0976.namprd04.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2018 09:43:55 -0700
Message-ID: <CAMKF1sqDoCqqnpA_Z2Yyd=Qx3sKVdDzv5iiByFph4Dv1wthkiQ@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to 0.0.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 16:44:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK I think checksumming the original file is all we need
On Sun, Jul 1, 2018 at 11:42 PM Alexandru Vasiu <alexandru.vasiu@ni.com> wr=
ote:
>
> Hi Khem,
>
>
> I found that end of each line from LICENSE.txt  changed from \n to \r\n w=
ithout any intention. So, that's why the md5sum changed. I think this is ok=
.
>
>
>
> Alex
>
>
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, June 29, 2018 5:47 PM
> To: Alexandru Vasiu
> Cc: openembeded-devel
> Subject: Re: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade t=
o 0.0.6
>
> Hi Alexander,
>
> Please add a line or two about why license checksum has changed and
> resend the patch
> On Fri, Jun 29, 2018 at 7:15 AM Alexandru Vasiu <alexandru.vasiu@ni.com> =
wrote:
> >
> > I fixed getIfaces which returns all network interfaces from system. [1]
> >
> >
> > Alex
> >
> >
> > [1] - https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com=
_bat-2Dserjo_PyIface_pull_11&d=3DDwIFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZ=
ZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3DQRMFvPHHQw=
-394ILp_uPGveN_LT1bHkj_qfmp12nFGM&s=3DaqvdL-Qq2V1_9Wwt1BD3_IDi01VEwbJ3pX7eC=
7uVNq4&e=3D
>
> >
> >
> >
> >
> > ________________________________
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Friday, June 29, 2018 4:45 PM
> > To: Alexandru Vasiu
> > Cc: openembeded-devel
> > Subject: Re: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade=
 to 0.0.6
> >
> > On Fri, Jun 29, 2018 at 3:26 AM Alexandru Vasiu <alexandru.vasiu@ni.com=
> wrote:
> > >
> > > Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> > > ---
> > >  meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++-=
--
> > >  .../{python-pyiface_0.0.5.bb =3D> python-pyiface_0.0.6.bb}    | 0
> > >  .../{python3-pyiface_0.0.5.bb =3D> python3-pyiface_0.0.6.bb}  | 0
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > >  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb =
=3D> python-pyiface_0.0.6.bb} (100%)
> > >  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb=
 =3D> python3-pyiface_0.0.6.bb} (100%)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b=
/meta-python/recipes-devtools/python/python-pyiface.inc
> > > index 620b244c6..8e464a83f 100644
> > > --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> > > +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> > > @@ -3,9 +3,9 @@ SECTION =3D "devel/python"
> > >  HOMEPAGE =3D "https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_pypi.python.org_pypi_pyiface_&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1j=
jZZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3D5tZAgNTd=
4p-RmB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DvAz7s9Lx6KxR7duweLBdBkFuJ4wXLJnWdXw=
P78oEIX4&e=3D"
> > >  LICENSE =3D "GPLv3+"
> > >
> > > -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fe869ee987a340198fb0=
d54c55c47f1"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfe06497acaf4f45999925=
d348c2605f9"
> > >
> > what changed here ?
> >
> > > -SRC_URI[md5sum] =3D "06c3c71fe51df740dae6a88a13afb5e0"
> > > -SRC_URI[sha256sum] =3D "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6e=
b1bf903ec32e043af924"
> > > +SRC_URI[md5sum] =3D "2379d8d4506e6c4d83cf3d4824abce8b"
> > > +SRC_URI[sha256sum] =3D "774ea47bb1387e493f6d5d0937b68fa28202c948eccd=
dbd6e4cf2d708dcd86f2"
> > >
> > >  inherit pypi
> > > diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5=
.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> > > similarity index 100%
> > > rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.=
bb
> > > rename to meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> > > diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.=
5.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> > > similarity index 100%
> > > rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5=
.bb
> > > rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.6.b=
b
> > > --
> > > 2.18.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembed=
ded.org_mailman_listinfo_openembedded-2Ddevel&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMT=
VdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJ=
q8&m=3D5tZAgNTd4p-RmB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DcJjM59nw1Gsf8kbrzR07=
SznshRlnyt9NTHExIi4LP1I&e=3D

