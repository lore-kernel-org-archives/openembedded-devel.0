Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpIHz-0004ae-Ad
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 11:37:47 +0100
Received: by bwz10 with SMTP id 10so274357bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=L4CzEATpaY8viVMSu+QmbBoytt3dCwjyNmwibIFSgAU=;
	b=k8cN+jo3EZv5Ln+JMmws2kwcH5484MudMoLUPfvSaSPaoRu5XXB1up/sOaO6QObq/Z
	PK/mX7s0JfQEUHNi5C5CIx95LBXxoP1svN6k3SYdsDBqRQ4H5LXMjzK6CLhvMA2X0rOw
	RD1ZluETLB8HoZk+tpZME+8LiwzAKrZ+R5qjY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TdLL9XH7rFYnaVUWowz2ltKCuuOqENpCVcNGoqH5TUJJuCtKece2T2tadOFZr90CAt
	qLzDpQaWivpGfwmiHENyxxbO0N528AbgtUvmFWZDElp1sAYrdyajUN5DiaETD+TZFJnO
	98BhoKFNRBP+klu8slfI5uqmFfSqLglXrYhD8=
Received: by 10.204.73.160 with SMTP id q32mr4364273bkj.155.1297766196185;
	Tue, 15 Feb 2011 02:36:36 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm2475148bkb.22.2011.02.15.02.36.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 02:36:34 -0800 (PST)
Date: Tue, 15 Feb 2011 11:36:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110215103626.GF8619@localhost.jama.net>
References: <20110214102232.GB8619@localhost.jama.net>
	<1297697243.2178.97.camel@phil-desktop>
	<20110215091517.GD8619@localhost.jama.net>
	<1297765171.2178.109.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1297765171.2178.109.camel@phil-desktop>
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
X-List-Received-Date: Tue, 15 Feb 2011 10:37:47 -0000
X-Groupsio-MsgNum: 29227
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline

--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 10:19:31AM +0000, Phil Blundell wrote:
> On Tue, 2011-02-15 at 10:15 +0100, Martin Jansa wrote:
> > On Mon, Feb 14, 2011 at 03:27:23PM +0000, Phil Blundell wrote:
> > > b) switch to a two-phase approach where it first renames all the
> > > libraries themselves, then uses some heuristic to match the remaining
> > > packages against the libraries and apply an appropriate renaming to
> > > them.  Probably just matching on longest substring would be good enou=
gh
> > > here.
> > >=20
> > > I think (b) is probably a better solution although it would be a litt=
le
> > > harder to implement.
> >=20
> > I'll try (b), but imho you have same problem there (if you have
> > -dev/-dbg for such package names and they are in wrong order, even wors=
e ie:
> > PKG_ncurses-libncurses-dev, libncurses-dev    <=3D ok
> > PKG_ncurses-libncursesw-dev, libncursesw-dev  <=3D works only because
> >   ncurses-libncursesw is mapped to libncursesw which is the same like
> >   s/ncurses-libncurses/libncurses
> >=20
> > but if you imagine stranger situation with SONAMES which are not
> > substrings of each other in package names which are substrings, like:
> > ncurses-libncurses > libncurses
> > ncurses-libncursesw > libwidecurses
> >=20
> > then still
> > PKG_ncurses-libncurses-dev, libncurses-dev    <=3D ok
> > PKG_ncurses-libncursesw-dev, libncursesw-dev  <=3D bad, because libwide=
curses-dev was expected=20
> >=20
> > and later you won't find ncurses-libncursesw-dev to replace
> > ncurses-libncursesw with libwidecurses
>=20
> I'm not quite sure I understand the difficulty here.

Ah sorry, I didn't read your (b) properly, now I see last sentence about
"longest substring".

But that's mostly what reverse sorted patch does now, isn't it? Longer
patterns are replaced before their shorter substrings (which then
matches only to their proper packages, because longer were already
replaced while handling longer pattern and "normally" doesn't match
anymore).

Regards,

> If I understand right you're talking about two output packages,
> "ncurses" and "ncursesw", which contain sonames "libncurses.so.5" and
> "libwidecurses.so.5", right?  In that case, during the first phase you'd
> get:
>=20
> PKG_ncurses =3D "libncurses5"
> PKG_ncursesw =3D "libwidecurses5"
>=20
> and a dictionary of renames performed which would look a bit like:
>=20
> ncurses: { pkgname: libncurses5, devname: libncurses }
> ncursesw: { pkgname: libwidecurses5, devname: libwidecurses }
>=20
> which is all expected.  Then, during the second phase, you'd consider
> the other packages like ncurses-dev and ncursesw-dev.  In this case, the
> longest prefix match for ncurses-dev in the dictionary is "ncurses", so
> it'd get renamed to libncurses-dev.  The longest matching prefix for
> ncursesw-dev in the dictionary is "ncursesw", so it'd get renamed to
> libwidecurses-dev.  That all seems like it should work out fine.
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1aVyoACgkQN1Ujt2V2gBw7tgCdHghvPuZDCehLNawbSSDnaS0R
qwoAn3xZHYg/9KusmW74YqFyeD1DzM4+
=gBt/
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--
