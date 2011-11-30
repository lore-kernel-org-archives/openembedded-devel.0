Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfLK-0007qt-1X
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:16:38 +0100
Received: by eaad13 with SMTP id d13so317225eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1uaEOPGMC+NVLwjlzRKq2VbxjNAl+cgH5epRHmOjr6A=;
	b=o+8Zjl9XrruDrrHW9avQ7KOY64C5hcuwKx2EcD+GSiEyti5ETpoSwao5jppbrgCNXC
	hnqBc7Ax9+24mC1Zsb/4enfiyib8zTNwTNUx+oqKwuBHrOdMscRC4AHhzsb9N8ka3G/S
	Uo//BxtNnjUi03H93nM+d0iJSwH0cXaysiPLU=
Received: by 10.213.26.206 with SMTP id f14mr267499ebc.126.1322640598304;
	Wed, 30 Nov 2011 00:09:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm3608201eeh.5.2011.11.30.00.09.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:09:57 -0800 (PST)
Date: Wed, 30 Nov 2011 09:09:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111130080943.GA30631@jama.jama.net>
References: <cover.1322640244.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1322640244.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oo 0/4] mplayer changes and gconf-native drop
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
X-List-Received-Date: Wed, 30 Nov 2011 08:16:38 -0000
X-Groupsio-MsgNum: 35733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 09:06:39AM +0100, Martin Jansa wrote:
> The following changes since commit f3ca7acd0b678a9247e432aee34512a26e30f5=
09:

sorry about typo in prefix, but I belive that it will show in koen's
patchwork :)

>=20
>   libsdl-x11: drop from meta-oe (2011-11-30 08:52:38 +0100)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/meta-openembedded-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/pull
>=20
> Martin Jansa (4):
>   mplayer-common: import from OE-classic
>   mplayer2: drop armv7a/omapfb optimizations, those can be applied from
>     bsp layer if needed
>   mplayer2: drop OPTIMIZATIONs for now
>   gconf-native: drop from meta-gnome, newer version is in oe-core
>=20
>  .../recipes-gnome/gconf/gconf-native_2.6.1.bb      |   17 -
>  .../recipes-multimedia/mplayer/mplayer-common.bb   |   22 +
>  .../mplayer/mplayer-common/mplayer.conf            |   15 +
>  .../0001-video-out-for-omapfb-support.patch        |  826 --------------=
------
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   28 +-
>  5 files changed, 43 insertions(+), 865 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common/mpl=
ayer.conf
>  delete mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2/0001-vide=
o-out-for-omapfb-support.patch
>=20
> --=20
> 1.7.8.rc4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7V5McACgkQN1Ujt2V2gBygqwCeLH4P2gNhWOaonkUecuNxlRX1
eLYAn2MqLXRjoUYaC7E4h4YVIGOIZ1Yg
=ZJ/P
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
