Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2739E6158B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:09:52 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so4131205eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+rUfY8ZwOC/QzR8kiY7GZ8cceQwyPqAITz/drOPORCI=;
	b=ivD13kLxtSsfPbDQ8E+8XaSI9/nDFGhPKNqd0m35lg+OzsNaeieOFT3hnP1Vm0tciC
	/BtRKWXqk8bWZ5UjxF2IQv6SiUsO33dGdav0Xf4rlH3hsGXcFit4T4bbk+bgvFe28a+r
	2a8Mf3MMOkxsPT96krLdmnP9N9cNoR4X1apTiIj8Po606W/zcyKCXWLhhylrYGLCJMGk
	kfog3njea+DIAUe/5V9AUTsJbp5jo6rQZ94pEIY3vznv3WSjpANRdVodTk9/QF1pvrFy
	lKWax0madMsIVOUpPGtc5+iwjW6tBJwFLP+WZI0+d3ldGYaKZ4dqcbBFAhES/MGzvzMr
	EL2A==
X-Received: by 10.14.149.14 with SMTP id w14mr740684eej.107.1379592593738;
	Thu, 19 Sep 2013 05:09:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm10848800eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:09:52 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:11:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919121131.GE18414@jama>
References: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH] dleyna: switch to git clones instead of generated tarballs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2013 12:09:52 -0000
X-Groupsio-MsgNum: 46250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Content-Disposition: inline

--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 04:31:53PM +0100, Ross Burton wrote:
> The tarballs used were the dynamically-generated tarballs from github, wh=
ich
> recently have changed checksum.  Avoid this problem entirely by fetching =
=66rom
> git, locked to the relevant tag.

Merged, thanks!

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb        |    6 =
+++---
>  .../recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb     |    6 =
+++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp=
_0.4.0.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.=
4.0.bb
> index 6d81ed2..fb0194b 100644
> --- a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.=
bb
> +++ b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.=
bb
> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \
> =20
>  DEPENDS =3D "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
> =20
> -SRC_URI =3D "https://github.com/01org/${BPN}/archive/v${PV}.zip"
> -SRC_URI[md5sum] =3D "9fc4db84b3459bc77232b24bde48b000"
> -SRC_URI[sha256sum] =3D "9cdee47bbbfa3de5aaa5cf3fc9e208ccd97e5079f6d8fa84=
a6d1f24a1b760237"
> +SRC_URI =3D "git://github.com/01org/${BPN}.git"
> +SRCREV =3D "1996ecbe4a06c95d22f7d958e32e3d28f7a4a2e9"
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools
> =20
> diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-u=
pnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-u=
pnp_0.3.0.bb
> index d23babe..478b1c7 100644
> --- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3=
=2E0.bb
> +++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3=
=2E0.bb
> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \
> =20
>  DEPENDS =3D "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
> =20
> -SRC_URI =3D "https://github.com/01org/${BPN}/archive/v${PV}.zip"
> -SRC_URI[md5sum] =3D "1e19349712a34dd56a14fc280b5d8b74"
> -SRC_URI[sha256sum] =3D "d6623d98dd35ee32bc08349b4a22d12101dda38a2ece1e46=
8ff0160e519a854d"
> +SRC_URI =3D "git://github.com/01org/${BPN}.git"
> +SRCREV =3D "4a0b1d7cd8e22d3cb0e09c77c344ceccbcbbd34f"
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66fMACgkQN1Ujt2V2gBzlYwCffWeps+iLHOiriIRbhzg9sqaW
xusAoIFzZF2HW5m7x3h3FoQYHlqDqdG6
=ZPIO
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--
