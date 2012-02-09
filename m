Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RvWYo-0007TG-Od
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 17:09:26 +0100
Received: by eekd41 with SMTP id d41so529636eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6aU3Sl6kM02TTK62J4Tx4e5AL5Q6gP8noXbZHpEc2R0=;
	b=tBgRO6p4dgpN3toTNABhRjcI/hG4xJy1aJEHWMmuNDvhUQV2fd1cN65GdF01zl3U/l
	9b5AT1aR7xbXV+oJRhRYZnG/vDUsRhVP07BO7wCrAfhoTPs/9/gT7dN51SGu+7g0jeJw
	79hh67r5CS8PJGCBjqPzOyNa36BZL1OhU8S5g=
Received: by 10.213.35.211 with SMTP id q19mr3693247ebd.10.1328803281442;
	Thu, 09 Feb 2012 08:01:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z47sm11002532eeh.9.2012.02.09.08.01.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 08:01:20 -0800 (PST)
Date: Thu, 9 Feb 2012 17:01:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120209160118.GE10322@jama.jama.net>
References: <cover.1328648257.git.otavio@ossystems.com.br>
	<155c4592f8890ee811c64a49ddcfc09bd6d40ae7.1328648257.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <155c4592f8890ee811c64a49ddcfc09bd6d40ae7.1328648257.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe 2/3] udisks: explicitly depends on systemd
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
X-List-Received-Date: Thu, 09 Feb 2012 16:09:26 -0000
X-Groupsio-MsgNum: 37051
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2012 at 08:58:23PM +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/rec=
ipes-support/udisks/udisks_1.0.4.bb
> index 55b115e..9ffaca5 100644
> --- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> +++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A storage daemon that implements well-de=
fined D-Bus interfaces th
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73d83aebe7e4b62346afde80e0e94=
273"
> =20
> -DEPENDS =3D "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
> +DEPENDS =3D "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 system=
d"
>  # optional dependencies: device-mapper parted
> =20
>  SRC_URI =3D "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;nam=
e=3D${BPN} \
> @@ -12,7 +12,7 @@ SRC_URI =3D "http://hal.freedesktop.org/releases/${BPN}=
-${PV}.tar.gz;name=3D${BPN} \
>  SRC_URI[udisks.md5sum] =3D "86c63b2b5484f2060499a052b5b6256b"
>  SRC_URI[udisks.sha256sum] =3D "854b89368733b9c3a577101b761ad5397ae75a051=
10c8698ac5b29de9a8bf8f5"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  inherit autotools systemd
> =20
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8z7c4ACgkQN1Ujt2V2gBxIgwCeNVEDYLYmnUq65k1nTq/891oU
83kAoJVUb6qolgM/clWRvoDWOGMnFYWN
=etWM
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
