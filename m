Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF2F7095F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:23:00 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so1573561wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CBUWM41T/NbCLMACD5Fk/hNQDhQMuUhogQ8fyvn44Eo=;
	b=Vr/q2F+2kM8+/TpI9lI9io7I5cQdb/U2gVWkn9MGWfnAZ8BBvFNBbkCX/QmcHo1XMk
	Cyr1pOBQDhGjGmdPq/0gcGnse00jmCvqsLLl58yRbvafuc2HStkJeOJVUKYFmUL/4JAP
	/Ld1+OZrX1c45zXNg9QHqzI1AhqiO7fllMQZJ5ZdnDPR9zYF6Gse1kMMsI5Vjz7QSF8L
	Bs4KzNl0NNa4x4vUzWqvwFohEExVdQjkO3Z+RjhPxGLitWzv1BXt7GM9HFa5dt+/uZ3k
	XN3P+mT8iBBSZmkyZ9ezSik/QRN4OmbWaTx71b8iaIUEMd3goMgxgdTgqjAOVM4L0wsE
	aYKg==
X-Received: by 10.194.3.74 with SMTP id a10mr8319210wja.85.1406740981828;
	Wed, 30 Jul 2014 10:23:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au7sm6916626wjc.41.2014.07.30.10.22.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 10:22:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 19:23:23 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140730172323.GS16445@jama>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
	<CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
	<CAMKF1srBNaC9hA8Sq_-jV3qmwn+SM4-nXpmvSBfU3+VftCUEZg@mail.gmail.com>
	<CAP9ODKo8o-bidnDgAUQZD5Yek_9fHg2FWR=m8+xE=-pLS4ttMA@mail.gmail.com>
	<CAMKF1soqe5woG5DcO9FP0tPVpprtgnHKMY4W8HcThZWTdncioA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soqe5woG5DcO9FP0tPVpprtgnHKMY4W8HcThZWTdncioA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
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
X-List-Received-Date: Wed, 30 Jul 2014 17:23:11 -0000
X-Groupsio-MsgNum: 51332
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s6WJ5R58009U+S7n"
Content-Disposition: inline

--s6WJ5R58009U+S7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 10:01:42AM -0700, Khem Raj wrote:
> On Wed, Jul 30, 2014 at 6:02 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > As I explained, this is the requirement for some projects we've been
> > involved with. The idea here is to share it in a 'reusable' way and
> > avoid this patch to be kept private for no good reason.
> >
>=20
> than have it in bbappends would solve it.

I agree with Otavio, that having just PACKAGECONFIG switch in .bbappend
or distro config is simpler than reinventing this .patch in each layer
which needs that.

>=20
> > I think it is fine as is.
>=20
> For you yes I understand, do you have say of other folks who use this lay=
er ?

He only adds the option, it even isn't enabled by default, so FWIW I'm
fine with this.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s6WJ5R58009U+S7n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPZKgsACgkQN1Ujt2V2gBxq1wCgqbgFsUwlJKwwnuMFXUJOYTce
TgYAn3eR9ZNHMKmMdcjiEpYr4e+Pk5ze
=eQDF
-----END PGP SIGNATURE-----

--s6WJ5R58009U+S7n--
