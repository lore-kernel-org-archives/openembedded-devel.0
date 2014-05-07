Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4338A605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 16:48:23 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lg15so1654639vcb.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=x5/oXRC/zf3hOdQrvm8tLgqt/gTb0GFRlzAfQpo0vuE=;
	b=FRpAwGklfNb843TWgW8cDyixmX8uhWPjZUnvHsDxTKVGSNk1jxOVriMKHieQX1/U49
	uF+zM+KfFdZGV/0nMQ9CD3uZZku26f88M8vyf1i/KzFfHrv210Zd81JJXOAyHgDHV/Sx
	4NQWMHAT1ZhymOX+dJ7FL9AQDXb/nY7fyPoM7afa/GftGdaBw8DTF2UCAgzfWci0rXrM
	iQvkwthnncNn/rMkumBQFmdEnrdpIg3hmWy7pHpbLfoOv5nviqo1J4IRH6hcG91cI3TB
	TIj1gT/9IL0cWB+SY3O91TRpxbNrgFJQtr2+qt1yy4VFjCr5Tg9J0z6Wl1AdYg0ePxdk
	txrg==
X-Received: by 10.58.107.65 with SMTP id ha1mr40324599veb.1.1399481304726;
	Wed, 07 May 2014 09:48:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q6sm2334355vew.15.2014.05.07.09.48.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 09:48:22 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 May 2014 18:48:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140507164844.GF30955@jama>
References: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
	<CAMKF1so17ynGToCMO_i8mw+UpUdnZC3NL_797JJbbrbMOd=_-w@mail.gmail.com>
	<lkcqt0$j26$1@ger.gmane.org>
	<6062362.lpz6Qfmmsr@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <6062362.lpz6Qfmmsr@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] openldap: fix build against gnutls3
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
X-List-Received-Date: Wed, 07 May 2014 16:48:26 -0000
X-Groupsio-MsgNum: 49772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline

--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 09:57:52AM +0100, Paul Eggleton wrote:
> On Wednesday 07 May 2014 10:29:21 Koen Kooi wrote:
> > Khem Raj schreef op 07-05-14 09:47:
> > > On Tue, May 6, 2014 at 11:53 PM, Koen Kooi <koen.kooi@linaro.org> wro=
te:
> > >> ++                              TLS_LIBS=3D"-lgnutls -lgcrypt"
> > >=20
> > > Does this mean we need something more in DEPENDS or DEPENDS part of
> > > PACKAGECONFIG too ?
> >=20
> > Should be automatic since gnutls depends on it. It's not a new dependen=
cy.
>=20
> BitBake does not automatically ensure dependencies-of-dependencies are in=
 the=20
> sysroot. They almost always will be, but I have seen failures in these ki=
nds=20

Are you sure it doesn't?

But I'm also in favor of specifying dependencies-of-dependencies in
cases where the recipe configure task explicitly check for them (so that
when the required dependency is no longer included in "parent"
dependency, e.g. after moving it to PACKAGECONFIG).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNqY+wACgkQN1Ujt2V2gBx4zgCeNh+hNrD7r1fc0ehh2Yx+bBXV
3KsAoLPb+DEdBDpTBpC3Q4lry6r+idoW
=0zMD
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
