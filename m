Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPwFE-0003za-0U
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 15:38:56 +0200
Received: by bkcjm2 with SMTP id jm2so1472131bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 06:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SUMFer32cwX48nLSR0ZuoFX1/itErBrprk5M9ixIh+s=;
	b=u5P/SglBmZQB/EGfqkiy8JMzmBOb1m8o77WtgVA/mTR8S2psGvK+s+ETE2Q3OWirLH
	Bzfkqpj+NGH3+jhqsAsrCmJ6fzKITLa8PCWnog5vnejWHttxA8foKTcUoLCW3JeQpnhm
	8hKLrWhe4ikBIAHi8LBO4GXN+3I2NyiKrslKcR1jDs5ZD4fukKHrJ+I0uUMozDy4fP+p
	+lrelmR5HYsSSeEvByMIi+YihJ0KcdK8W7JSW30ulFNvfSmgZ5Ji4hz9uHJ2A97IHTGA
	D52A8URbe68Q4NZO+OIDTyqMkV3AWVDpPEFbXPgyzXl8VFhRSeXJmOuGqUjui6DmSOrL
	3g7g==
Received: by 10.204.152.13 with SMTP id e13mr786844bkw.46.1336051750648;
	Thu, 03 May 2012 06:29:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z17sm10600686bkw.12.2012.05.03.06.29.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 06:29:09 -0700 (PDT)
Date: Thu, 3 May 2012 15:29:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120503132911.GA14648@jama.jama.net>
References: <4FA287CB.6040503@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4FA287CB.6040503@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: how to rebuild packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 13:38:56 -0000
X-Groupsio-MsgNum: 38563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2012 at 03:27:39PM +0200, Jaap de Jong wrote:
> Probably a total stupid question...
>=20
> In oe-classic I used to use
>=20
>      bitbake -c clean packageX
>      bitbake packageX
>=20
> This does not seem to work on oe-core.
> Even removing the directory=20
> build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/pack=
ageX*
> does not help...
> What is the way to do this?

-c cleansstate

> Thanks,
> Jaap
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+iiCcACgkQN1Ujt2V2gBxsaQCfdJTBMdV6h2B4xXCUSjXWseRv
U7YAniRZaFKBdYY25OiyYskuAQ3MKOiK
=44uo
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
