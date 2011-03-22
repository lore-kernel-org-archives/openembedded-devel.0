Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q1zlI-0002mv-5D
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 12:28:33 +0100
Received: by bwz10 with SMTP id 10so5536108bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MSlDU6OuxJyFMAdTipZBjFNT9gu6qAVcC0zbs2LBmyw=;
	b=CJdiIJmWaz5bwboYssM0FLruFlt9i8TDdQ7rbjRKbwc8kf2hWFVVgBseyRzKN3AEfw
	9lEwBQ6VsRqa6Sh7d1zAfGzNtI/vJc4VyJMTk8y4KefqkPJaoigfXhWaGT7KimBsA/cb
	Lc8rZDU2M2SkVJxGRo6AS6cPFFvv+kLIzcMkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KyY6sHJ2L5XZ7s5MmwaJ1RFcusi3Wyaf8++0Ip8t1brgYg3v3KsTSMJ52NLF2eX+VH
	7lbYOaWCuwFECmDopaJAbv2i9BLKwBQ6Kwzx520vgF3pEcGxI9bFUxgv7uO4OvNgaLNq
	8GyWQXjMgSIaSzguiMb9nlpOqDzPgKGSxgq9U=
Received: by 10.204.175.194 with SMTP id bb2mr4838016bkb.121.1300793186239;
	Tue, 22 Mar 2011 04:26:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm5052137bkb.22.2011.03.22.04.26.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 04:26:25 -0700 (PDT)
Date: Tue, 22 Mar 2011 12:26:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322112618.GD3418@jama.jama.net>
References: <1300790542.3827.19.camel@mattotaupa>
	<20110322105613.GC3418@jama.jama.net>
	<1300791693.26064.1.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1300791693.26064.1.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] ipkg: remove legacy staging and install `libipkg.pc` properly
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
X-List-Received-Date: Tue, 22 Mar 2011 11:28:34 -0000
X-Groupsio-MsgNum: 30500
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 12:01:33PM +0100, Paul Menzel wrote:
> Am Dienstag, den 22.03.2011, 11:56 +0100 schrieb Martin Jansa:
> > On Tue, Mar 22, 2011 at 11:42:22AM +0100, Paul Menzel wrote:
> > > Date: Tue, 22 Mar 2011 10:51:47 +0100
> > >=20
> > > Convert to new style staging [1] and install `libipkg.pc` properly as=
 done in [2][3].
> > >=20
> > > [1] http://openembedded.org/index.php/Legacy_staging
> > > [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc=
2c8fe4c5629add94bd0b922f5b3446624a9f4d8
> > > [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D4=
8838f0fca6b00767115dd13bce2537f035fd3ba
> >=20
> > Is it worth to update it now when I hope last bits were also converted
> > to opkg?
>=20
> `gpe-package` depends on `libipkg`.

ok, btw ipkg is blacklisted by Angstrom and Kaeilos so fixing
gpe-package looks like better way to me, but I don't use
gpe-package|ipkg

> > git mv to obsolete would be easier to review :).
>=20
> Good point, but maybe someone still uses it and can benefit from the
> fix.

On the other hand, moving ipkg to obsolete would show that we're using
opkg by default now more clearly. And ipkg is used only in old stuff or
by accident.

Something like
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dd1c65e9a7d9d=
5b324095e6c4eb28cf7a58f394e5

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2Ih1oACgkQN1Ujt2V2gBzUFACfZgPaIqJ878/cWwt0u77KmtER
IZUAnjh2SkFR8dJkdtu095vFgSzvrJCu
=yqmJ
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
