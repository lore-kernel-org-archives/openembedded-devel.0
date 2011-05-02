Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QGqxB-00024X-Oo
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 13:06:13 +0200
Received: by bwz5 with SMTP id 5so4978227bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 04:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=NXJrMSXjpGsWk1zFPdnNROdwD1GoaJKi9UOHt0cBMZU=;
	b=sMS0tKn9Pt56ShwdFigYXgsTPl6BqtG27Gz0WDne+lWrMKwbmvngU2sc7ccY7eJH2Y
	Oeuzt9FoMvuGdh5NOeOTc3NPSbWEDu9jGMlSAPNGElEv3A34t+pWeqdk0v1MEe5YCExk
	rPWdw13Lgyv666xWJ8vg/Q7GMYOwN/PPziAE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=U0KeCeBGtlC3MzqIe3IFirt/ndU240iAgaS6sU48D9uoUM4PySp635QrFayV31VhPs
	mUmITRJs7WX5wCpEslobcOu4rJPriJIn49Wwag43WOJY93JH6m9KSzj2gAZNxioZuVpp
	pKUEQZaI4Z5JMfz3fXDL6P62s5el5oUU3HTYg=
Received: by 10.204.7.88 with SMTP id c24mr1748717bkc.61.1304334217573;
	Mon, 02 May 2011 04:03:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l1sm3219384bkl.1.2011.05.02.04.03.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 04:03:36 -0700 (PDT)
Date: Mon, 2 May 2011 13:03:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110502110334.GB3275@jama.jama.net>
References: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
	<4DBE8CAA.3050500@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4DBE8CAA.3050500@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 11:06:13 -0000
X-Groupsio-MsgNum: 31552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline

--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2011 at 12:51:22PM +0200, Eric B=E9nard wrote:
> Hi Radoslav,
>=20
> On 02/05/2011 12:18, Radoslav Kolev wrote:
> > In the recipe I have
> >
> > SRCREV =3D "${AUTOREV}"
> > PV =3D "0.4+gitr-${SRCPV}"
> >
> replace SRCPV with SRVREV in PV and you will the the rev instead of O.

and no upgradeable path at all when changing SRCREV or even using
AUTOREV like in example.


And BTW there usually isn't '-' between gitr and ${SRCPV} see recipes in
tree.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2+j4YACgkQN1Ujt2V2gBzONwCdEk0+4C1cIF0+Wc1GtGpGosUO
RbQAn1mJ8YKgMH4AF93cwf3QyY1CC0Rg
=lK3r
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
