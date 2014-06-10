Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4B23C601A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 17:11:23 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id x48so5018867wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 10:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=paCeB2P8YGolyPborbMY5HDgE1vRgoBmPPF5nohrNlU=;
	b=QTCCs1MDxFo5+giwvvvmIrb/JmeDObzIwyUXA58LZO3SiiQTEKSZrHFACSih84fGmB
	HJpC4o+OevXV9qj/tzbyZElfZgerzW2MHvLNVCptk+bLRIcDxpTudoXfvrjyfiZ2MTAK
	Od4G41+WPYi8xXj5lp9VX8IT5OPkgF+Vna5xusfA9kQyR48IszF8PxdbpvkTYdS6sHiz
	Ttosw3CUHZl8jSa8Cdm6Nxyb2GpOdKOdrEyW4L5mcoNu/MWjqrcAMdsmBekZ7ab9vxym
	aYTzkKyH23Gvqm+x62s+MR7PdcuVFN6EmKO9RGYobZE8POsUlFSfOBnYVj8NvzJahjyp
	wWwA==
X-Received: by 10.14.29.5 with SMTP id h5mr60368eea.91.1402420284539;
	Tue, 10 Jun 2014 10:11:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v45sm53355133eeg.29.2014.06.10.10.11.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jun 2014 10:11:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jun 2014 19:11:43 +0200
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20140610171143.GH2433@jama>
References: <20140610112139.GD2433@jama>
	<1402418201-4389-1-git-send-email-ashcharles@gmail.com>
	<CAK8F28nWie5hLac3mFiB739BRfw=MQQ8q=39rZoV3i39vuvvcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8F28nWie5hLac3mFiB739BRfw=MQQ8q=39rZoV3i39vuvvcw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Patch v2] xfce4-screenshooter: Ensure lib directory exists.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jun 2014 17:11:31 -0000
X-Groupsio-MsgNum: 50257
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l06SQqiZYCi8rTKz"
Content-Disposition: inline

--l06SQqiZYCi8rTKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2014 at 09:42:17AM -0700, Ash Charles wrote:
> Hi,
>=20
> Newbie question:
> I sent this correction as a v2 on the patch as committed on
> master-next (which, unintentionally meant that I carried over Martin's
> SOB).  Is this the correct approach or

I don't mind my SOB being carried (I can still remove it when
re-cherry-picking to master next)

> 1. would you rather a completely new patch to resolve just the issue
> as the original has already been committed to master-next

No, being in master-next only means that it's being tested in my Jenkins
builds, I'm rebasing master-next every time I push something to master,
so I'll just replace original patch with v2 in master-next for next Jenkins
build.

> 2. would you rather a v2 on the original patch I sent to the list?

Sending PATCHv2 with --in-reply-to as you did now, is the best for me, than=
ks

> thanks,
> --Ash
>=20
> On Tue, Jun 10, 2014 at 9:36 AM, Ash Charles <ashcharles@gmail.com> wrote:
> > Screenshooter autogenerates screenshooter-marshal.[ch] in lib/ during
> > compilation.  The source directory contains a lib/ but this directory
> > doesn't exist in a build directory by default so we add one manually.
> > Really, this should be corrected in the upstream package.
> >
> > v2: only make lib/ if it doesn't exist
> >
> > Upstream-Status: pending
> >
> > Signed-off-by: Ash Charles <ashcharles@gmail.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb     =
| 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensho=
oter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoo=
ter_1.8.1.bb
> > index 4cda352..0e2e327 100644
> > --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.=
8.1.bb
> > +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.=
8.1.bb
> > @@ -11,5 +11,9 @@ SRC_URI +=3D "file://0001-Fix-panel-plugin-build.patc=
h"
> >  SRC_URI[md5sum] =3D "d0ffea2052a8e70154cf13789070711f"
> >  SRC_URI[sha256sum] =3D "40419892bd28989315eed053c159bba0f4264ed8c6c673=
8806024e481eab9492"
> >
> > +do_compile_prepend() {
> > +       mkdir -p lib
> > +}
> > +
> >  FILES_${PN} +=3D "${datadir}/xfce4/panel/plugins \
> >          ${libdir}/xfce4/panel/plugins"
> > --
> > 1.8.3.2
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l06SQqiZYCi8rTKz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOXPE8ACgkQN1Ujt2V2gByMgwCePkZEPmQpW3qL8Kmt7m5708Jm
S9MAoJY08K9wDliAIc1lba/FawSsaOHT
=MBet
-----END PGP SIGNATURE-----

--l06SQqiZYCi8rTKz--
