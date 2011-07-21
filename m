Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjyho-00065N-BK
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 21:14:44 +0200
Received: by fxh10 with SMTP id 10so4056807fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 12:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wAUDPcPqm94TXchnQsIex3qq7GHXxkTkYDOAOPUQorE=;
	b=oIwYRvKEJtJp6i3nGuOLUubCm7MtjweBcUFS+Up+GGPSGxp6JKCGNBxEoVe+fQiaeG
	3LeP9eQVJN5iugi9qaZC7KpnJ3kVCT4Q7WzIUuROspUsiTO/HTI1ZLk0yAX9h+lzVEHu
	u1ZKsn8czmE97BWuMkhXzbRSY5IC/zHwl1yDQ=
Received: by 10.223.97.131 with SMTP id l3mr757293fan.43.1311275436750;
	Thu, 21 Jul 2011 12:10:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h10sm1580949fai.19.2011.07.21.12.10.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 12:10:35 -0700 (PDT)
Date: Thu, 21 Jul 2011 21:10:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110721191023.GA12118@jama.jama.net>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
	<30479bfbd667bc29553eae73b1bab78f4cb248a4.1311195484.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <30479bfbd667bc29553eae73b1bab78f4cb248a4.1311195484.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 4/5] bluez4: add missing dependency usbpath
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
X-List-Received-Date: Thu, 21 Jul 2011 19:14:44 -0000
X-Groupsio-MsgNum: 33274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2011 at 10:58:49PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb b/meta-oe/=
recipes-connectivity/bluez/bluez4_4.93.bb
> index ab85776..7688986 100644
> --- a/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
>                      file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e \
>                      file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
> -DEPENDS =3D "udev gst-plugins-base alsa-lib libusb dbus-glib libnl"
> +DEPENDS =3D "udev gst-plugins-base alsa-lib libusb dbus-glib libnl usbpa=
th"

This patch only adds usbpath.

The patch which was commited also removes libnl, I guess it was
intentional manual edit, but maybe is worth it to say so in commit message=
=20
or pushing as separate change (to see who did it).

Because otherwise when I noticed it I expected that it was typo on my
side and that I did replace libnl with usbpath by my error.

Regards,

>  RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> =20
>  ASNEEDED =3D ""
> --=20
> 1.7.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4oeZ8ACgkQN1Ujt2V2gBwrqgCgs1C5+IWkQ+aDPZcqlywRVbGq
0J4AoKOxUflctiWaLoatDrV8hwFyiBWt
=GdMR
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
