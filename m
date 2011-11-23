Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RT7B3-0007qa-N3
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 08:23:29 +0100
Received: by wwo1 with SMTP id 1so1148124wwo.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 23:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dxzourpob3EZMjpiJwy1T3PlLo/MIllq4CaD65iZmUw=;
	b=j/SOMO9bx0xiIqBFaZ7yaqFBv1uqFVowhQua2meJ5godUUtzvIX/uu9zoMABiY9ORw
	GUIJa95z15+MidxX5y4gm/Qb+kYehPsjqHRPU5ld2Ag8My0cGIfgkJcZ8lVdSowzlex3
	sYAR07PAmqNP5jSnxNR8WMa/Dn1ybAM94W+sU=
Received: by 10.180.106.3 with SMTP id gq3mr22247140wib.34.1322032617508;
	Tue, 22 Nov 2011 23:16:57 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ca18sm7790770wib.13.2011.11.22.23.16.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 23:16:56 -0800 (PST)
Date: Wed, 23 Nov 2011 08:16:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111123071644.GR3565@jama.jama.net>
References: <1321980435-4389-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1321980435-4389-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-efl] e-wm: add missing dependency on dbus-x11
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
X-List-Received-Date: Wed, 23 Nov 2011 07:23:29 -0000
X-Groupsio-MsgNum: 35529
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRtLtq+kfJNLc57H"
Content-Disposition: inline

--QRtLtq+kfJNLc57H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2011 at 05:47:15PM +0100, Koen Kooi wrote:
> ERR<654>:e_dbus e_dbus.c:472 e_dbus_bus_get() Error connecting to bus: /u=
sr/bin/dbus-launch terminated abnormally without any error message
>=20

Looks good

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-efl/recipes-efl/e17/e-wm_svn.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/=
e17/e-wm_svn.bb
> index 2c2518b..9da788d 100644
> --- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
> +++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2667a0f4120372ea91f7467cdff40=
95f"
>  SRCNAME =3D "e"
>  PV =3D "0.16.999.060+svnr${SRCPV}"
> -PR =3D "r21"
> +PR =3D "r22"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit e update-alternatives gettext
> @@ -53,6 +53,7 @@ RDEPENDS_${PN} +=3D "\
>    mime-support \
>    edje-utils \
>    ${PN}-utils \
> +  dbus-x11 \
>  "
> =20
>  # Uclibc build don't have 'glibc-utils'
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

--QRtLtq+kfJNLc57H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7MndwACgkQN1Ujt2V2gBzxIQCeKOMWv4AxmwzB+Yoe09BT5y37
5hUAoLuBJ88OfdbGBA90YEcxn8A+fOSp
=D/gH
-----END PGP SIGNATURE-----

--QRtLtq+kfJNLc57H--
