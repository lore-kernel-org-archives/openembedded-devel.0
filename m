Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE5260657
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 14:11:01 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so92971176wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EJqU9JB+ceoKLpa8muLiKLRsRpyWtEQIFwf/cKV/NmM=;
	b=z6hYnIm2mYduK5n+UwbD1OKi028igJp0hHVvnmzXCfMd4hbgLj1VLX29C1nkOMJoeh
	kPmaIQxLEJHjUDvgkvVFCZ/dbnynSe1Sv4hkVgkGBRWZdBXvf7+bfF0tDkirWeMPPYUv
	4sqX6W27OkyO0K6aFJJQ2OipVZvDxgKIZqrIsFd9y6p1YtcCl5kSivva6NGyZvoXeSBL
	LY5WPrOHoOQLhtULtC1dssP7GOMvGC9Q/2YFM+MJuYqRp20AbDtPUVmdbmUjlzlZ+VbZ
	zoasb+IdABxJMV+TD3c4EH00n1AWHPotv9XKUAvkZUfSMFeAjKeFFVbWsACsYS0nqP/f
	qCuQ==
X-Received: by 10.180.10.197 with SMTP id k5mr32754799wib.22.1445436661235;
	Wed, 21 Oct 2015 07:11:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i10sm10656851wjz.41.2015.10.21.07.10.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 07:10:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2015 16:11:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151021141118.GC2556@jama>
References: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
	<20151021105937.GA2556@jama> <20151021110944.GB2556@jama>
MIME-Version: 1.0
In-Reply-To: <20151021110944.GB2556@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/6] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Wed, 21 Oct 2015 14:11:02 -0000
X-Groupsio-MsgNum: 57947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 01:09:44PM +0200, Martin Jansa wrote:
> On Wed, Oct 21, 2015 at 12:59:37PM +0200, Martin Jansa wrote:
> > On Wed, Oct 14, 2015 at 08:48:51PM +0200, Jens Rehsack wrote:
> > >=20
> > > llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM =
in 3.5
> > > (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to=
-the-arm-backend).
> > >=20
> > > Ensure JIT is built with llvm
> >=20
> > I'm tempted to leave this one after jethro is branched, unless
> > default LLVM_RELEASE is updated in oe-core/jethro mesa as well.
> >=20
> > Otherwise everybody will need to set LLVM_RELASE in their mesa bbappend
> > or we'll need to bbappend it in meta-oe.
>=20
> Or better, update this to keep 3.3 as llvm is meant to allow multiple
> versions being built and installed in parallel.

Another reason to keep 3.3 around is build on older hosts, current 3.5
fails in Ubuntu-12.04

| checking whether GCC is new enough... no
| configure: error:
| The selected GCC C++ compiler is not new enough to build LLVM. Please upg=
rade
| to GCC 4.7. You may pass --disable-compiler-version-checks to configure to
| bypass these sanity checks.

> > What others think?
> >=20
> > And was this tested with mesa or just with java?
> >=20
> > Regards,
> >=20
> > >=20
> > > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > > ---
> > >  meta-oe/recipes-core/llvm/llvm.inc                 |  8 +---
> > >  ...r-output-from-configure-if-CFLAGS-is-set-.patch | 52 ------------=
----------
> > >  .../{llvm3.3 =3D> llvm3.5}/arm_fenv_uclibc.patch     |  0
> > >  .../llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.bb}      | 11 +++--
> > >  4 files changed, 9 insertions(+), 62 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-core/llvm/llvm3.3/Remove-error-ou=
tput-from-configure-if-CFLAGS-is-set-.patch
> > >  rename meta-oe/recipes-core/llvm/{llvm3.3 =3D> llvm3.5}/arm_fenv_ucl=
ibc.patch (100%)
> > >  rename meta-oe/recipes-core/llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.=
bb} (71%)
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYnnQUACgkQN1Ujt2V2gByMUACfTGywksepGeHNMUOrNH9HfRPS
3SYAoLWYe5iSrd7cTIFsUqt6mSr9he2+
=Uwpd
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
