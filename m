Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0DF73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 14:44:58 +0000 (UTC)
Received: by wikq8 with SMTP id q8so97179929wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZgKW3shNhyHfTkyPHhaRc1b3b+ORha+ZQMg+uXbvanI=;
	b=hnPuG+qksv9vB+Lzg/qWwZDpve9x3mkhAJQ6hnYRlInoVftFBuNc4AIn96b+bkEyue
	s3+jaBe+kYhkKQjppjuQKaT4/JJyVMf5OMrXiIiaD+TqI+vJ6F7Qfm9TlGccgQQm0Ys6
	tX0jnJ11ZNCTcPrcLZQL2OgDCZ+cmR5WhWUNxtFvsL6+vZ6P00styxUebP5eXShrukjJ
	zgc+UN9jpg5iwlfeYOEfft3BXdQ5JbLacxtmE57Vfwtlg4wd4hnuhTYQDVz8Er7E5FU+
	4L5Tetw7suUpZ3IVaAQSAJJCtez+9G52El8vdKO0viK2ABJV2aQs+0D6IhidVCxSXs0S
	xKVg==
X-Received: by 10.194.24.68 with SMTP id s4mr12201924wjf.12.1445438697798;
	Wed, 21 Oct 2015 07:44:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gc5sm7612963wic.12.2015.10.21.07.44.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 07:44:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2015 16:45:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151021144515.GE2556@jama>
References: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
	<20151021105937.GA2556@jama> <20151021110944.GB2556@jama>
	<20151021141118.GC2556@jama>
	<CAP9ODKpELjyK-=1CuuqEMcazzTS0FNtm59RoBAYCnj2_j-ZTzw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpELjyK-=1CuuqEMcazzTS0FNtm59RoBAYCnj2_j-ZTzw@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Oct 2015 14:45:02 -0000
X-Groupsio-MsgNum: 57951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline

--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 12:28:54PM -0200, Otavio Salvador wrote:
> On Wed, Oct 21, 2015 at 12:11 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Wed, Oct 21, 2015 at 01:09:44PM +0200, Martin Jansa wrote:
> >> On Wed, Oct 21, 2015 at 12:59:37PM +0200, Martin Jansa wrote:
> >> > On Wed, Oct 14, 2015 at 08:48:51PM +0200, Jens Rehsack wrote:
> >> > >
> >> > > llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes A=
RM in 3.5
> >> > > (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes=
-to-the-arm-backend).
> >> > >
> >> > > Ensure JIT is built with llvm
> >> >
> >> > I'm tempted to leave this one after jethro is branched, unless
> >> > default LLVM_RELEASE is updated in oe-core/jethro mesa as well.
> >> >
> >> > Otherwise everybody will need to set LLVM_RELASE in their mesa bbapp=
end
> >> > or we'll need to bbappend it in meta-oe.
> >>
> >> Or better, update this to keep 3.3 as llvm is meant to allow multiple
> >> versions being built and installed in parallel.
> >
> > Another reason to keep 3.3 around is build on older hosts, current 3.5
> > fails in Ubuntu-12.04
> >
> > | checking whether GCC is new enough... no
> > | configure: error:
> > | The selected GCC C++ compiler is not new enough to build LLVM. Please=
 upgrade
> > | to GCC 4.7. You may pass --disable-compiler-version-checks to configu=
re to
> > | bypass these sanity checks.
>=20
> I agree to keep 3.3 however supporting 12.04 is a goal? Poky does not
> support it anymore so will OE-Core keep it?

I'm not saying that we have to support Ubuntu-12.04, it's just what my
world builders currently have and this is first recipe which wouldn't
build on them (similar issue was in one other recipe lately, but it was
patched to allow build with gcc-4.6). Maybe we can get away with
--disable-compiler-version-checks here as well.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYnpPoACgkQN1Ujt2V2gBzDFQCgn96TzyNIRy0DjLHbT66Lv3UW
TJ4AoK13vdh7rgkEGgxFtne1qQE76FWc
=xBJ+
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
