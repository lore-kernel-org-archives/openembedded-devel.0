Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D30727705E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 11:09:25 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so68864266wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LI/AcK0twJC75fJfvoXvqQNdsC2mfsoe794ZTW9S0RI=;
	b=QbDcr/JyzqvEq7J/2EXcEoBKZaIHuSkLgZPQZ+2WD/WhYFTwkpv6xyt722N5KcoIgm
	eHj5A9LOH30hEEk/ZM6hqafCK4tcOwCuHnT5lBQOmmfEqhJZ524/iwQc7oRQqqaplz4F
	k14NHzbQwnJwMgu/RSAKdsZUo6E1fIzp4iEnj+Y3rPRWWLPercHso/A7pyJnfYYUEWO3
	GOzoRTiagjBIQ7nQpTOkeGT7okU7ECbt87Ya+37a3CISanRZDWcXXyS/81zAKWwFyqbR
	mROvN4PL1aNC9Z2dQ7eJnW2M13LZ52ezI0WE7gLMtt39XCJ6otqdZKsmSPRNhdmo532z
	apZw==
X-Received: by 10.194.22.161 with SMTP id e1mr10887713wjf.128.1445425765593;
	Wed, 21 Oct 2015 04:09:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh5sm9679709wjb.42.2015.10.21.04.09.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 04:09:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2015 13:09:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151021110944.GB2556@jama>
References: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
	<20151021105937.GA2556@jama>
MIME-Version: 1.0
In-Reply-To: <20151021105937.GA2556@jama>
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
X-List-Received-Date: Wed, 21 Oct 2015 11:09:31 -0000
X-Groupsio-MsgNum: 57944
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 12:59:37PM +0200, Martin Jansa wrote:
> On Wed, Oct 14, 2015 at 08:48:51PM +0200, Jens Rehsack wrote:
> >=20
> > llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM in=
 3.5
> > (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-t=
he-arm-backend).
> >=20
> > Ensure JIT is built with llvm
>=20
> I'm tempted to leave this one after jethro is branched, unless
> default LLVM_RELEASE is updated in oe-core/jethro mesa as well.
>=20
> Otherwise everybody will need to set LLVM_RELASE in their mesa bbappend
> or we'll need to bbappend it in meta-oe.

Or better, update this to keep 3.3 as llvm is meant to allow multiple
versions being built and installed in parallel.

>=20
> What others think?
>=20
> And was this tested with mesa or just with java?
>=20
> Regards,
>=20
> >=20
> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > ---
> >  meta-oe/recipes-core/llvm/llvm.inc                 |  8 +---
> >  ...r-output-from-configure-if-CFLAGS-is-set-.patch | 52 --------------=
--------
> >  .../{llvm3.3 =3D> llvm3.5}/arm_fenv_uclibc.patch     |  0
> >  .../llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.bb}      | 11 +++--
> >  4 files changed, 9 insertions(+), 62 deletions(-)
> >  delete mode 100644 meta-oe/recipes-core/llvm/llvm3.3/Remove-error-outp=
ut-from-configure-if-CFLAGS-is-set-.patch
> >  rename meta-oe/recipes-core/llvm/{llvm3.3 =3D> llvm3.5}/arm_fenv_uclib=
c.patch (100%)
> >  rename meta-oe/recipes-core/llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.bb=
} (71%)



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYncncACgkQN1Ujt2V2gBzVLgCdHiEMnkNfnld+lIWJ2VcXMvLg
5+EAni8/rl4BSIUx+EUiBeHxf0hEtEL3
=ViBg
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
