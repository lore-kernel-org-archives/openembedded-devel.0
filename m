Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpH1U-0006jl-8F
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 10:16:40 +0100
Received: by bwz10 with SMTP id 10so223035bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lUD0MZTohjrFkXRbcMpOdKhpwzUtniCd68fvWSm+0vQ=;
	b=n7qrdfPU7QUjJO9CKmBcrhLSblKrYx9DKgV7LPDUs4Bm7Pw4XN4ZLkerjUns+a29qH
	+ehRlcUA7+OfJZ13kCdAs4tgx9pUTZMnUkf3lXmKoQBvyGHdoCteZfhxuBohellFb3fO
	gvutEDjYWlpOsMhvDDg5JGkbiDLWRX+LhcFBk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=JXpYxs5DPeS1QatiAGBxEZ1c01wkaLJs3GJOMfxVaC3J0R8x25gmJeYyME/Dmqrg0x
	wksvhlaRgnOfG9+4K1wkkuqjUOhWzp/IpOnrT9I+OJf0UwRdfFtf5QqOr70arKQcqya0
	78UBdOfR9YiU4f0VxgIWM6kpIM1QtZTIU/NsY=
Received: by 10.204.75.142 with SMTP id y14mr1660130bkj.114.1297761328060;
	Tue, 15 Feb 2011 01:15:28 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm2426407bka.3.2011.02.15.01.15.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 01:15:26 -0800 (PST)
Date: Tue, 15 Feb 2011 10:15:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110215091517.GD8619@localhost.jama.net>
References: <20110214102232.GB8619@localhost.jama.net>
	<1297697243.2178.97.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1297697243.2178.97.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: debian.bbclass issues when some package is substring of another
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
X-List-Received-Date: Tue, 15 Feb 2011 09:16:40 -0000
X-Groupsio-MsgNum: 29221
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline

--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2011 at 03:27:23PM +0000, Phil Blundell wrote:
> On Mon, 2011-02-14 at 11:22 +0100, Martin Jansa wrote:
> > So can someone explain why we need that 'newpkg =3D pkg.replace(orig_pk=
g, devname, 1)' in else?
>=20
> If that line was removed altogether then the -dev packages (and -doc,
> -bin, ...) would stop being renamed, which wouldn't be a very good
> thing.  In other words, you'd get libncurses5 but ncurses-dev (not
> libncurses5-dev) etc.

That's not really what you get currently, but ok I see your point in keeping
that "else".

Currently you would get libncurses-dev without 5, because it replaces
with devname not pkgname.

>=20
> However you're right that the logic as it stands does look fairly
> broken.  Two ways of fixing it come to mind:
>=20
> a) have it explicitly search for (and rename) [orig_pkg]-dev,
> [orig_pkg]-doc etc, and remove the catch-all altogether; or
>=20
> b) switch to a two-phase approach where it first renames all the
> libraries themselves, then uses some heuristic to match the remaining
> packages against the libraries and apply an appropriate renaming to
> them.  Probably just matching on longest substring would be good enough
> here.
>=20
> I think (b) is probably a better solution although it would be a little
> harder to implement.

I'll try (b), but imho you have same problem there (if you have
-dev/-dbg for such package names and they are in wrong order, even worse ie:
PKG_ncurses-libncurses-dev, libncurses-dev    <=3D ok
PKG_ncurses-libncursesw-dev, libncursesw-dev  <=3D works only because
  ncurses-libncursesw is mapped to libncursesw which is the same like
  s/ncurses-libncurses/libncurses

but if you imagine stranger situation with SONAMES which are not
substrings of each other in package names which are substrings, like:
ncurses-libncurses > libncurses
ncurses-libncursesw > libwidecurses

then still
PKG_ncurses-libncurses-dev, libncurses-dev    <=3D ok
PKG_ncurses-libncursesw-dev, libncursesw-dev  <=3D bad, because libwidecurs=
es-dev was expected=20

and later you won't find ncurses-libncursesw-dev to replace
ncurses-libncursesw with libwidecurses

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1aRCQACgkQN1Ujt2V2gByglACfaLYPWVAPVXPtoUz27McrTjJy
KXoAn00VDk7wjSQnAtFPx5oDoNAoHFQ2
=pH65
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
