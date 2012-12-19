Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlHo1-0001S3-Ai
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 12:27:26 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so866470dak.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 03:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9KI4Se101KKlxcapqzEFhilRzdqJN6ej2Ls1GCj0Jyk=;
	b=l9zuTwaEJYH49Q9Cux0mmCJBrebwqUwQMa95vZlhzqpBHsnkJNaYkkiffMaYwurWC0
	xuCn/NK0SnP3+2Dlr5IKDZ75uiQSlcRmH0ZaLjnrcrNgUw84jkhJbPMySPWW81uHGjRn
	8gGw8q1XQ6ouP4k9zoPe1GZfiqWHOCUVNPhHT93sAoJZQTsprpreCfQKYAHtOGeMiuXK
	YpWdXYccdOC/+jT+5Sp9C0+kN88xlFp1lBNBPVxuUtWm22F+W13i9Rhy6VBoQQmveWpE
	pymNvPStXLLVByTlKlbi7QsZeUumqKOLYXBp8R7evTuXY9AmPKh+y99V70v4KhwZ7HJU
	fdOg==
X-Received: by 10.69.0.101 with SMTP id ax5mr17162934pbd.105.1355915557613;
	Wed, 19 Dec 2012 03:12:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oj5sm2946409pbb.47.2012.12.19.03.12.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 03:12:36 -0800 (PST)
Date: Wed, 19 Dec 2012 12:12:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121219111234.GC3525@jama.palm1.palmone.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 00/10] [meta-oe] More pending patches from patchwork and few fixes
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
X-List-Received-Date: Wed, 19 Dec 2012 11:27:36 -0000
X-Groupsio-MsgNum: 42254
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline

--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 05:54:59PM +0100, Martin Jansa wrote:
> bitbake world is still running, but if everything goes well I'll merge th=
is tomorrow
>=20
> The following changes since commit 4b5d2af979c17c6a2a65a6ea9a4e7f41414c9f=
eb:
>=20
>   libsdl-mixer: update to upstream version 1.2.12 (2012-12-16 21:11:45 +0=
100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/pull
>=20
> Andreas M=FCller (1):
>   gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
>=20
> Ben Deering (1):
>   claws-mail: Upgrade from 3.6.1 to 3.9.0

Merged without this one as it breaks 2 plugins:                            =
                                                            =20
                                                                           =
                                        =20
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.14.bb, do_compile  =
                                                                           =
       =20
| plugin_gtk.c:317:33: error: dereferencing pointer to incomplete type     =
                                                                           =
       =20
                   =20
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.18.bb, do_compile
| feed.c:940:3: error: too few arguments to function 'conv_unmime_header'  =
                                                                           =
       =20

Cheers,

>=20
> Cliff Brake (1):
>   update oe-stylize to be Python3 comaptible
>=20
> Marcin Juszkiewicz (1):
>   florence: move to meta-gnome due to libnotify
>=20
> Martin Jansa (6):
>   geos: fix typo in FILES_${PN}-dev
>   krb5: fix path to recipe and upgrade to 1.11
>   e-base: bump EFL_SRCREV for E17 release called lucky
>   terminology: upgrade to 0.2.0
>   azy: rename lemon provided by azy-native to azy_lemon
>   evince: disable help build
>=20
>  contrib/oe-stylize.py                              |  10 +-
>  meta-efl/classes/e-base.bbclass                    |   2 +-
>  .../conf/distro/include/efl-from-svn-recipes.inc   |   2 +-
>  .../{terminology_0.1.0.bb =3D> terminology_0.2.0.bb} |   4 +-
>  meta-efl/recipes-efl/e17/terminology_svn.bb        |   2 +-
>  meta-efl/recipes-efl/efl/azy_svn.bb                |   6 +-
>  meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |   3 +-
>  .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |   3 +-
>  .../florence/files/0001-Fix-glib-includes.patch    |   0
>  .../recipes-support/florence/florence_0.5.1.bb     |   0
>  .../recipes-connectivity/krb5/krb5_1.11.bb         |  24 +-
>  meta-oe/recipes-navigation/geos/geos.inc           |   8 +-
>  .../claws-mail-3.6.1/claws-mail-g_strcmp0.patch    | 575 ---------------=
------
>  .../claws-mail/claws-mail-3.6.1/desktop.patch      |  19 -
>  .../claws-mail-3.6.1/duplicate-header.patch        |  10 -
>  .../claws-mail/claws-mail-3.6.1/glib-2.32.patch    |  11 -
>  .../{claws-mail_3.6.1.bb =3D> claws-mail_3.9.0.bb}   |  17 +-
>  17 files changed, 38 insertions(+), 658 deletions(-)
>  rename meta-efl/recipes-efl/e17/{terminology_0.1.0.bb =3D> terminology_0=
=2E2.0.bb} (41%)
>  rename {meta-oe =3D> meta-gnome}/recipes-support/florence/files/0001-Fix=
-glib-includes.patch (100%)
>  rename {meta-oe =3D> meta-gnome}/recipes-support/florence/florence_0.5.1=
=2Ebb (100%)
>  rename meta/recipes-connectivity/krb5/krb5_1.8.5.bb =3D> meta-oe/recipes=
-connectivity/krb5/krb5_1.11.bb (48%)
>  delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/claw=
s-mail-g_strcmp0.patch
>  delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/desk=
top.patch
>  delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/dupl=
icate-header.patch
>  delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/glib=
-2.32.patch
>  rename meta-oe/recipes-sato/claws-mail/{claws-mail_3.6.1.bb =3D> claws-m=
ail_3.9.0.bb} (72%)
>=20
> --=20
> 1.8.0.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDRoSIACgkQN1Ujt2V2gBzRKACffo5dhD9QC9cPVNyBR2UztV4U
swEAoKaUcHy0BUUy7B6LgegwbfuNhF7V
=F4me
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
