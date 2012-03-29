Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SDJ2n-0005Gl-2n
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 19:21:53 +0200
Received: by yhjj56 with SMTP id j56so1678550yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 10:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=Sur7TfMkrgavOQahKALUdmzL6ygSGHQlW0zaGA4nayM=;
	b=Eq27Y/E/csdoCqwFZSOcye/QmokwQxG3QWD4A5+49XYIv6Zw3m0unGFK6MD7QEwVpe
	dyXjp+IGohEImlss/Y+x79qmqFu9qf1jU7djb4jA5rLirYQIuVctyJXi3vBRvur7yFuq
	EmbJEs63GG+ve8H2ZW7GwTzCLEJOFPeydfBJNAaM3QEbqP88C70qrKuIMg1QhrpXSktp
	GaEmEVwrpZwYdYG8Bb5pIOpdnu5DVfxvRyFcRxeKhZGzYDTtJRtKzyQSUH2l/DVK0llm
	gsttJyS/k48xCSsA+KlWWZ4eVQDKuMEaWcwjXfxaCh/eVhi0cazbpj5I7r0D+A9iR5Je
	4h0A==
Received: by 10.60.2.198 with SMTP id 6mr44452224oew.34.1333041168485;
	Thu, 29 Mar 2012 10:12:48 -0700 (PDT)
Received: from bill-the-cat ([68.230.54.74])
	by mx.google.com with ESMTPS id n10sm6627074obu.23.2012.03.29.10.12.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 10:12:46 -0700 (PDT)
Date: Thu, 29 Mar 2012 10:12:44 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120329171244.GA2418@bill-the-cat>
References: <cover.1332849864.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1332849864.git.sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ulf Samuelsson <ulf.samuelsson@telia.com>,
	openembedded-devel@lists.openembedded.org,
	Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [2011.03-maintenance 0/3] pull request 20120327
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
X-List-Received-Date: Thu, 29 Mar 2012 17:21:53 -0000
X-Groupsio-MsgNum: 38077
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 02:06:47PM +0200, Steffen Sledz wrote:

> Hi Tom,
>=20
> please pull these commits cherry-picked from oe.dev.
> The fix some python build problems.
> All are well tested in our own environment.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit ec639a6b04449ef8e064e7bf35660ab31c3e2e=
ee:
>=20
>   libmatthew-0.7.1: SRC_URI updated (2012-03-24 07:16:26 +0100)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/openembedded sledz/pull3
>   http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dsledz/pull3
>=20
> Paul Menzel (1):
>   python-scons_1.3.0: add `python-native` to `DEPENDS_virtclass-native`
>=20
> Simon Busch (1):
>   python-2.6.6: backport pkgconfig support from version 2.7.1 and bump PR
>=20
> Ulf Samuelsson (1):
>   python-2.6.6: Fix python-2.6.6 build failure on linux-3.x
>=20
>  .../python/python-2.6.6/07-linux3-regen-fix.patch  |   18 ++++
>  .../python/python-2.6.6/pkgconfig-support.patch    |   94 ++++++++++++++=
++++++
>  recipes/python/python-scons_1.3.0.bb               |    1 +
>  recipes/python/python_2.6.6.bb                     |    4 +-
>  4 files changed, 116 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/python/python-2.6.6/07-linux3-regen-fix.patch
>  create mode 100644 recipes/python/python-2.6.6/pkgconfig-support.patch

Applied, thanks!

--=20
Tom

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk90mAwACgkQdZngf2G4WwMJ6QCcCaS2mrz5L5DSbEJeZMTo1hLN
xLAAoI3qGVD+98CkXbCSymmLchBRhTI2
=EjSZ
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
