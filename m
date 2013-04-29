Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWp7n-0003iN-Ry
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 16:32:22 +0200
Received: by mail-pb0-f54.google.com with SMTP id jt11so2000770pbb.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=glUsSej+yvym2SoSe67QFbMzM2zs6Jc87lejc6PIgho=;
	b=VLvvSkFYtOp6WRS6mi/YSxWP0XiSFK3IuRPf+mNgGRBJEnJBX+l1D1WXQ/tJDNmwQz
	4g3xNV0YZRzKOl8UI0MOMK5wqMG7ZxCzznlWVzZr16MtDa8VjW1QbgX4XTg3Koa7v7kn
	3aUpGrdLnYT4eDRhmhwhMw1JIM9Nx4wRyPgZRxoeiaAZUjw+2Hh1SQXLGBttikeuxb23
	hkvyKR1UvXoipwZHbNHiJyvTSQbypNtIakPB10jX2kh6JMOC7xdbdgM+OTthDT2Ur8YI
	fwLwIXtq/d4PLOXGEhP1tdEtDh0tmaMLRsNoy48wp2F27l08FaxYkBeZz9P3Is1HhxKR
	VC7Q==
X-Received: by 10.68.91.131 with SMTP id ce3mr70512416pbb.46.1367244865927;
	Mon, 29 Apr 2013 07:14:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	gi2sm24268242pbb.2.2013.04.29.07.14.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 07:14:24 -0700 (PDT)
Date: Mon, 29 Apr 2013 16:14:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130429141438.GK3199@jama>
References: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome 0/5] gnome-world-fixes
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
X-List-Received-Date: Mon, 29 Apr 2013 14:32:38 -0000
X-Groupsio-MsgNum: 44497
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vk/v8fjDPiDepTtA"
Content-Disposition: inline

--vk/v8fjDPiDepTtA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2013 at 02:31:20PM +0200, Andreas M=FCller wrote:
> The following changes since commit 3c47bd59d0315c98364a175a686e8a4b8ba668=
67:
>=20
>   apache2: fix multilib builds (2013-04-29 10:25:17 +0100)
>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git gnome-w=
orld-fixes
>=20
> Andreas M=FCller (5):
>       zenity: fix build
>       libgnomecanvas: update 2.30.3 to fix build
>       gnome-power-manager: fix configure
>       gnome-power-manager: fix compile
>       libgnome: fix compile

Thanks a lot!

>=20
>  .../0001-Makefile.am-don-t-build-help-man.patch    |   37 ++++++++++++++=
+++++
>  .../gnome-power-manager_2.32.0.bb                  |   15 ++++----
>  ...nome-Makefile.am-allow-deprecated-symbols.patch |   35 ++++++++++++++=
++++
>  .../recipes-gnome/libgnome/libgnome_2.32.1.bb      |    3 +-
>  ...mecanvas_2.26.0.bb =3D> libgnomecanvas_2.30.3.bb} |    8 ++---
>  .../files/0001-Makefile.am-don-t-build-help.patch  |   39 ++++++++++++++=
++++++
>  meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   |    3 +-
>  7 files changed, 125 insertions(+), 15 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-power-manager/gnome-po=
wer-manager-2.32.0/0001-Makefile.am-don-t-build-help-man.patch
>  create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgn=
ome-Makefile.am-allow-deprecated-symbols.patch
>  rename meta-gnome/recipes-gnome/libgnome/{libgnomecanvas_2.26.0.bb =3D> =
libgnomecanvas_2.30.3.bb} (77%)
>  create mode 100644 meta-gnome/recipes-gnome/zenity/files/0001-Makefile.a=
m-don-t-build-help.patch
>=20
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vk/v8fjDPiDepTtA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF+gE4ACgkQN1Ujt2V2gBxzGQCgja3PB0dN6U8NsZaZ9janEVwL
yG4AoIV52aDZnJWXckbEHlOUrVDYAXby
=cci/
-----END PGP SIGNATURE-----

--vk/v8fjDPiDepTtA--
