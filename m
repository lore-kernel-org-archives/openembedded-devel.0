Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZeIb-00087a-IQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Nov 2012 10:02:53 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1319692eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2012 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wG7OaOKwtVSk/xPPOUd2ytQaoYp5bZ77z5xIc8OkXkE=;
	b=HL6DB5SGFejIJuuIbQg02sjdQRC1YCQfDXqPvQJMtZ5Ze6K74jO2PW0rV6Dv2XyTnP
	IwwCz/VlrylP+zmQQfwbjiSpFDKk134w4pumsJMFjapFofaDYSuWM8LjjrgfrsfvNquP
	jArYVPmAsMoFmMsR9mP3PJeKAC4cqSi8050LViIkmjix1JYy0VpAExIXbdpAP35lLJDX
	rJy2+h7yQpm0xSPZplfHKFFSyXvpI3LxXx4HsTuZoqXo7DF8V0PeHI+j1J3RIPevWfq5
	IBGJexEPVaJZBaVVOCgauIDBOZMEmWKROP8FrUk59krdLT/tKHa94U9qgMDh4+LuKea0
	3tow==
Received: by 10.14.194.72 with SMTP id l48mr5409659een.9.1353142130350;
	Sat, 17 Nov 2012 00:48:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b44sm8944361eep.12.2012.11.17.00.48.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Nov 2012 00:48:49 -0800 (PST)
Date: Sat, 17 Nov 2012 09:49:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121117084905.GH3411@jama.jama.net>
References: <12301427.Yf0uchSh3U@helios>
	<20121112182616.GB22235@novatech.datenfreihafen.org>
	<1929015.S4sbRGzyuA@helios>
MIME-Version: 1.0
In-Reply-To: <1929015.S4sbRGzyuA@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] OE-Classic recipe migration status
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
X-List-Received-Date: Sat, 17 Nov 2012 09:02:54 -0000
X-Groupsio-MsgNum: 41538
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l0l+eSofNeLXHSnY"
Content-Disposition: inline

--l0l+eSofNeLXHSnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 10:52:08AM +0000, Paul Eggleton wrote:
> On Monday 12 November 2012 18:26:16 Stefan Schmidt wrote:
> > On Sun, 2012-11-11 at 19:11, Paul Eggleton wrote:
> > >    1484 other
> > >     218 BSP
> > >     211 BugLabs
> >=20
> > I now longer work for BugLabs but  during my last months there I split
> > up our bunch of recipes according to what we think was sane at that
> > time. Think end of last year here.
> >=20
> > The BSP layer can be found here:
> > https://github.com/buglabs/meta-bug
> >=20
> > And BugLabs specific recipes here:
> > https://github.com/buglabs/meta-buglabs
> >=20
> > All OpenJDK related stuff was going directly into upstream through
> > Tarent anyway. This should cover all stuff that was worth bringing
> > over.
>=20
> OK, I've removed everything that is now in meta-bug/meta-buglabs and mark=
ed=20
> everything else as obsolete. Thanks!
> =20
> > >      11 EFL
> >=20
> > I think everything worth working with is in meta-efl in meta-oe.
> > Martin is doing a great job catching up with everything we do
> > upstream. If something is really missing it might now longer work or
> > is just not worth bringing over.
>=20
> Martin, can you look over the EFL marked recipes and confirm this?

Yes, some could be usefull for someone:
remoko,
enna,
enotes,
euphony
but all have rather dead upstream and I'm not going to migrate them just
for migration sake (they would probably need a lot of changes/testing to
make them compatible with latest EFL).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l0l+eSofNeLXHSnY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCnT4EACgkQN1Ujt2V2gBzYxwCfffc4qGu5+RSCduV9cICwQA7v
h6IAn3WeqQEb4hu4GGqR3dpUHlXzaHFH
=WZtL
-----END PGP SIGNATURE-----

--l0l+eSofNeLXHSnY--
