Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2217860107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 15:31:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r5so23308294wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wREGJ1zwoWCURshdqgYZbZdZWfSdqQhnHN9nv+PuMWg=;
	b=kPDAMwL1Vn2F0EenqcEKPxMYpoms0zrOkhyUKQ1kqw7bjtc6HY4xr/AKAxWxjsKIGN
	cwwdtahN0bis8+SqsHPbs5qJU1QzmR4JBS+wmeRQFCvDbPdtlcc/cUADY+PaSIEJFplv
	xn311/EjMGxEZZv4WbLHgnTHkPh/CbNkxNjJyG+Jws5jmgqLGA/7Vd4ntfEGPPxNhXUD
	0sf5obXVx/eFyYn9oDnIB4XSHSzSP/i+86vdJzg60ubKwTLiP1UN9DTTHGHvjBCAVgYw
	9sDgO2//T76TOOGVldcSrrSUSFM+Yj/yH1LqlZwXXYSMmvizMiABBw0ctABBhfem3noI
	JJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wREGJ1zwoWCURshdqgYZbZdZWfSdqQhnHN9nv+PuMWg=;
	b=dQZQNF55MWjteCtGHyGmwOInAsFqJMXAZnWxbh/VxZcioaEq2DnO3qyut7Oau1oWTQ
	eVu+T5NH7/Pd6lW2+70FJCM2SWU55KDvAO7XuaEhl09grDGXvw0pkAS3e/yOYnlOY6s1
	qDKkwEncwLMC19ssQoBkguJHmZ1tSd2787egPpNxnrJeT7c4OCM0iSjgDpl6hRsQCTLl
	dkpLuXWTUo8fZ/4KEUEdxBN9LgjbeHGLM4gA4t3ZU5sEyPuji8zzM2iIaTL4/lIGrU21
	gh+21lfIGnVBNzpRj56R8Grsy5la42mg3dfYxVuuZ0ku92O89Ot1RT/zEHJw527o87HP
	g2lg==
X-Gm-Message-State: ALyK8tLyAah3R6YfOGt3xj03r9HHTX54NvYOCqRAJ4JKwFpIfapAX9hySqyw56YynFM07w==
X-Received: by 10.28.68.67 with SMTP id r64mr6762970wma.57.1465918271229;
	Tue, 14 Jun 2016 08:31:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id e8sm4710132wma.2.2016.06.14.08.31.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Jun 2016 08:31:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Jun 2016 17:31:27 +0200
To: "Kinsella, Ray" <ray.kinsella@intel.com>
Message-ID: <20160614153127.GA21667@jama>
References: <1462542559-10941-1-git-send-email-ray.kinsella@intel.com>
	<3b5ca19a-01b1-9c67-0736-21fd7163c1da@intel.com>
MIME-Version: 1.0
In-Reply-To: <3b5ca19a-01b1-9c67-0736-21fd7163c1da@intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] wvstreams: fixing segfault with new gcc optimizations
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
X-List-Received-Date: Tue, 14 Jun 2016 15:31:11 -0000
X-Groupsio-MsgNum: 61821
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 03:26:16PM +0100, Kinsella, Ray wrote:
> Hi Martin,
>=20
> What should I do to progress this?

What progress you're expecting? it was merged more than a month ago:

commit 786ab843f0eb825781df5b4c639b6ae5f4c74c41
Author:     Kinsella, Ray <ray.kinsella@intel.com>
AuthorDate: Fri May 6 14:49:19 2016 +0100
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Tue May 10 20:18:56 2016 +0200

>=20
> Ray K
>=20
> On 06/05/2016 14:49, Kinsella, Ray wrote:
> > Recent GCC optimizations -ftree-dce and -foptimize-sibling-calls are ca=
using
> > a segfault in the wvstream stackmaster. Fedora had the same problem and
> > resolved the issue by removing these optimizations.
> >
> > See: https://bugzilla.redhat.com/show_bug.cgi?id=3D812651
> >
> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> > ---
> >  meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/m=
eta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > index 73cfb03..6199a2f 100644
> > --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > @@ -20,6 +20,8 @@ inherit autotools-brokensep pkgconfig
> >
> >  PARALLEL_MAKE =3D ""
> >
> > +TARGET_CFLAGS_append =3D " -fno-tree-dce -fno-optimize-sibling-calls"
> > +
> >  LDFLAGS_append =3D " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
> >
> >  EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without-=
valgrind"
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldgI04ACgkQN1Ujt2V2gBxEZACgpGLZdegAAAu3p/XXcKljsANF
lI0An1b8eqkB7NbC0Ser5jfCgOXz/2S1
=B5uR
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
