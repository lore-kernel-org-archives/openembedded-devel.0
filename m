Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 752617D2D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 12:50:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w1so21211244wrp.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HGER9AIylk5+0jpknsE5TMz0/5SLnak88k0LCb03AS0=;
	b=VBFk4hyvKD+IyUL5KpcEKw5w9LUn1CeMKejl3XfkL46fznJcQoIJaAhbjVwjwSYiHV
	/sLahsw/VJqD6UUda42kmOkUMuj/ueWOCLFbEJi4E/+3Agcuzr/xLA3ZEHCZrwPn4AuJ
	ISj4N4hs7bCbgKq+IqSvCoOXTDx9Yokcq/sS5a9zrYoNySLVqhb9Yai4W38VMTquDJjY
	NJVrmdj4b8hb8OrrlttWDZ9u2U1F4LHXsvq5OgIJdC1MgxfXnQj94flFwtGt8PD6PcCv
	kpYHlDFGcDb6jcX9lBosvrsZdC3926zuVR8kCKA4uxzXfFybWcmEXUwkTtMKzUhVmq+/
	BtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HGER9AIylk5+0jpknsE5TMz0/5SLnak88k0LCb03AS0=;
	b=U0hdnxJm2DQuRqzmZes0nHf+9TU9ulWiw7fxOKIo8LCOGO7cEAVOtMPEYm1o4H2Z/L
	S7ICTvxLfjDEQvbyYv7N99Xq4OUxqmmUZCC12z4Q6PPmntt8hAeGPeqhMCZ7M7pwppZs
	YHsxn3/6Uknesr6FmJMn8r3LJ848MWirbkE53DFPxV8rnecMNWd7p1pPc2c9b1LNy6eg
	uFS6n1ILLcSqGy/hgTORLrGsNb/unOHZ5EI32pfRSi9ga8oxEEcOeJs+czvPb67YxI33
	5msueTZlgQ+bCrAKEwpv5uqwzkKMaKt96KqgpbA4vOSlaUqvXcb9L6jrp5kjg9mPQ4v/
	tZhg==
X-Gm-Message-State: APjAAAVj/t9B8jaj+Zi4qZLqcU9V2nO/KQ6wcCK8wxK4z5AabIx6Nkhv
	fd/pVuOMPIdqYFhN9Cnf4tlpGwUi
X-Google-Smtp-Source: APXvYqy5P+rekIuxFuf6Qm2icxK/XE3xiGPmO23Ir8GtQJJIGLK1Ncxr2F78WFyZEJkcIuEdplKzmQ==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr50436611wro.144.1554295825198;
	Wed, 03 Apr 2019 05:50:25 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	84sm28834451wme.43.2019.04.03.05.50.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 05:50:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Apr 2019 14:50:25 +0200
To: Vincent Prince <vincent.prince.fr@gmail.com>
Message-ID: <20190403125025.GB2025@jama>
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<20190403085651.GA6467@localhost>
	<CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
	<20190403111514.GA20836@localhost>
	<CAB2nKc-nz+YhZ9voQOSo=46gLhLoip5_GT2arkmT6jOGiyEo8w@mail.gmail.com>
	<20190403120314.GA2025@jama>
	<CAB2nKc9qLz=4hERKOORTSyb74=PsuuEJnA+GezrY0v1u=6Sfhw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB2nKc9qLz=4hERKOORTSyb74=PsuuEJnA+GezrY0v1u=6Sfhw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-devel@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 12:50:24 -0000
X-Groupsio-MsgNum: 76983
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2019 at 02:31:13PM +0200, Vincent Prince wrote:
> Martin,
>=20
> Thanks for precisions, I will update PV to 4.3.1 in V2
> By the way, it's first time I submit a patch series, should  changelog be
> in each patch for should I use --cover option to put them all in 0/3?

If you mean changelog for review changes made to individual commits,
then it's best to include them in commit message, but bellow --- so that
it doesn't end in the final commit message once it's applied.

Cover letter is useful to describe reasoning behind the whole series,
but each commit should make sense individually (especially because cover
letter doesn't end in git history).

Regards,
>=20
> Best regards
>=20
> Le mer. 3 avr. 2019 =E0 14:03, Martin Jansa <martin.jansa@gmail.com> a =
=E9crit :
>=20
> > On Wed, Apr 03, 2019 at 01:36:24PM +0200, Vincent Prince wrote:
> > > Adrien,
> > >
> > > What I'm not sure to understand is in which case we use "_git.bb"
> > instead
> > > of having PV in filename.
> >
> > The PV in filename is just another way for setting PV variable (instead
> > of setting it inside the recipe). This isn't relevant to what Adrian
> > requested and I would keep the filename as is.
> >
> > > If we use a release version, shouldn't we point to
> > > https://github.com/zeromq/cppzmq/archive/v4.3.0.tar.gz?
> >
> > Definitely don't use github archives, they are regenerated from time to
> > time with different checksums, either you can use developer uploaded
> > tarballs (some projects on github provides them as well) or use git
> > fetcher with the SRCREV pointing the the tag.
> >
> > > And if we use git version, shouldn't we specify git commit hash to re=
move
> > > any ambiguity between PV and SRCREV?
> >
> > With git bitbake fetcher (git:// in SRC_URI) you always need to specify
> > SRCREV, because that's the only thing which defines what "version" of
> > the source will be fetched.
> >
> > PV in this case is only to give this SRCREV some human readable (and
> > sortable) versioning scheme. And that's what users will see when
> > installing/upgrading the built packages, so it's important to set it
> > correctly.
> >
> > +git${SRCPV} in PV is usually used to signify that the SRCREV points to
> > commit a bit newer than the "base version" in this case 4.3.1 and in
> > this case this +git${SRCPV} is unnecessary if the SRCREV matches exactly
> > with 4.3.1 tag.
> >
> > > Do you know any convention is specified somewhere?
> >
> > I don't think it's spelled anywhere in wiki.
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXKSsEAAKCRA3VSO3ZXaA
HAA6AJ9hxDMi3MZhF+a90tFFTthQs9Kj4wCfa67v477qMgroSTXvmFe4nBeZvIQ=
=zqgl
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
