Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C0A427723C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:41:48 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so42259297wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EgvgLcpiQ3GK/FOnmcpi2LPdG9uTzRMaKxenUFUabtg=;
	b=q35oe7ODDScrb9UhfZBs3vtTZAy0M0Y/dEypFCnnr5IWyduRCUg8qMIe9JUR3kQTN3
	JWm9pCYRc4KbV5IgnO2DA6SidPMxEJx6mjBDb/qxhkcBHpmI0Job93ruaUHdsdVI0M3Q
	CtDmZglBcnW6pSsUyN9ebcnEcq5ZEIVHQVXzE2QXCYJb7zeBRYca4FnA4oCLneP/mQna
	OrAv2AIkicJGJTcsOLPArKz6pidUAbIJLTFVr7v99EBSdCUtyurToudVTXw5nxz54yX9
	wQjE2tRVdbkQb+tv9FrABJoeRyMxS85vg4+vWHBfZVSr3qvO0dhgakP5ar+k/y9DYFsu
	LD3A==
X-Received: by 10.28.210.77 with SMTP id j74mr44650035wmg.60.1447346508370;
	Thu, 12 Nov 2015 08:41:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl9sm15317126wjb.10.2015.11.12.08.41.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 08:41:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 17:42:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151112164203.GI2574@jama>
References: <1447343800-21460-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRRrYKrn5jh-UnktCy9w8CCZ1hYrZApqOpDRbS+OW-9B_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRrYKrn5jh-UnktCy9w8CCZ1hYrZApqOpDRbS+OW-9B_g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-xfce] xfce4-session: exclude machine-host dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Thu, 12 Nov 2015 16:41:53 -0000
X-Groupsio-MsgNum: 58581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9iyR+p8Z2cn535Lj"
Content-Disposition: inline

--9iyR+p8Z2cn535Lj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 05:11:36PM +0100, Andreas M=FCller wrote:
> On Thu, Nov 12, 2015 at 4:56 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * this whole machine-host is very bad idea, all changes from postinst
> >   will be removed when netbase package is upgraded (it has CONFFILES
> >   set but most users won't know that this entry was appended by
> >   machine-host package)
> > * see:
> >   http://lists.openembedded.org/pipermail/openembedded-devel/2015-Septe=
mber/103271.html
> > * fixes:
> > ERROR: xfce4-session different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemux86
> > runtaskdeps changed from ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-ut=
ilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7=
=2E4.bb.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_pac=
kagedata', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfc=
e4-session_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_=
packagedata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3=
=2E4.bb.do_packagedata'] to ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-uti=
lsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.=
4.bb.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packag=
edata', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-=
session_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_pac=
kagedata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.=
bb.do_packagedata']
> > meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb.=
do_packagedata with hash 7b3f9a883729dfe908e17980476d10e2
> >  changed to
> > meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb.=
do_packagedata with hash f51309cb641c82a6d8e2dc5387bb6484
> > Hash for dependent task xfce4-sessionmachine-host.bb.do_packagedata cha=
nged from 7b3f9a883729dfe908e17980476d10e2 to f51309cb641c82a6d8e2dc5387bb6=
484
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-xfce/conf/layer.conf | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> > index 55bcef6..64b1077 100644
> > --- a/meta-xfce/conf/layer.conf
> > +++ b/meta-xfce/conf/layer.conf
> > @@ -17,3 +17,7 @@ LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "gnome-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "meta-python"
> > +
> > +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> > +  xfce4-session->machine-host \
> > +"
> > --
> I missed that - there should be another way to go for this problem.
> Two questions
>=20
> * What exactly does SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS do? I checked your
> original patch in oe-core but do not understand what the result of
> setting SIGGEN_EXCLUDE_.. is.

http://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-SIGGEN_=
EXCLUDE_SAFE_RECIPE_DEPS
http://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-SIGGEN_=
EXCLUDERECIPES_ABISAFE

Does this help? In short it will prevent sstate signature handler in
including the task signatures of recipes included in these variables.

SIGGEN_EXCLUDERECIPES_ABISAFE excludes it from everywhere
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS excludes it only when counting signature
of given recipes.

> * How much time do you give me to come around with a proper solution -
> without machine-host quirk? I would like to avoid getting this into
> jethro.

machine-host recipe is already in jethro (released yesterday) or do you
want to avoid this SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS addition? I want to
get all these fixes for signatures and dependencies soon - I'm tempted
blocking new changes to meta-oe layers and not updating oe-core until
the reports are clean - the issues were reported months ago and very few
fixes were sent since then.

Adding SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS doesn't make machine-host quirk
works, I would prefer you find proper solution and then we'll get rid of
both machine-host and SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, ok?

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9iyR+p8Z2cn535Lj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEwA8ACgkQN1Ujt2V2gBy1dACgrMm+BBnZE/ECI9QZa8+sWFco
7YAAn1dVfDO0x7N68+NMgSQVguYmiU7c
=E3zo
-----END PGP SIGNATURE-----

--9iyR+p8Z2cn535Lj--
