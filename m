Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id E4F9860034;
	Sat, 21 Mar 2015 15:32:35 +0000 (UTC)
Received: by webcq43 with SMTP id cq43so103873424web.2;
	Sat, 21 Mar 2015 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y6yYXnl4ddgeT5L1SIoTQQeeSqdM9AAwiL+BE9Hi4rE=;
	b=SS/37uLZeuhh8zaWI1sShFH4xVe1Jb8dSaODbdN8vS/jUJHFQirKcHgtFgPdTK5iHM
	lyDXbQ/opkyThfss4uKlTbiU7sxAYUjQNpyYTqBS4XMa3WQTifgSpb0atIcsNbejgkPk
	28An4sMFSZSvLsDNlPW0L6wmNqaRgUqSmbSR9y9tk+qGFSljQE+FTB8Zy6m8TBseWDrF
	xyW735uwwK6g+0T6zFEvNMs73iR5q1ScGX+tirgr2i67TAwGmL/uGd+WTpWcCy+Kzkz6
	2b8P3Kouhk/51ExvIj0nM6eXJXF0dHTOOJTsuTfiJXwOzXJsV0iLRx6C4RJjKrdLamC1
	mPTA==
X-Received: by 10.180.73.9 with SMTP id h9mr5055839wiv.63.1426951955981;
	Sat, 21 Mar 2015 08:32:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cn10sm2767386wib.15.2015.03.21.08.32.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 08:32:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 16:32:45 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150321153245.GK4738@jama>
References: <20150112143629.39773504C0@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150112143629.39773504C0@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ash Charles : mpd: ship systemd socket file
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
X-List-Received-Date: Sat, 21 Mar 2015 15:32:36 -0000
X-Groupsio-MsgNum: 54838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lZZ4ablUVnt2XgAh"
Content-Disposition: inline

--lZZ4ablUVnt2XgAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2015 at 02:36:29PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: c702fc4dfab0c09449bd47a04deecca5946d981f
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dc702fc4dfab0c09449bd47a04deecca5946d981f
>=20
> Author: Ash Charles <ashcharles@gmail.com>
> Date:   Thu Jan  8 10:58:19 2015 -0800
>=20
> mpd: ship systemd socket file
>=20
> As of mpd version 19.1, as systemd socket file, mpd.socket, is
> installed. Ship this file as part of the mpd-systemd package.

Can you please fix this issue?
mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? =
[build-deps]

>=20
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> index 04eed0a..feec985 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> @@ -48,7 +48,7 @@ do_install_append() {
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "mpd.service"
> +SYSTEMD_SERVICE_${PN} =3D "mpd.service mpd.socket"
> =20
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM_${PN} =3D " \
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lZZ4ablUVnt2XgAh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUNjx0ACgkQN1Ujt2V2gBy8RgCgsw9yJuy/QL2Pxh9VnTTQs2Rb
J9MAn1wJBepHA8g8QipP38ApoLJcCdLu
=4MUJ
-----END PGP SIGNATURE-----

--lZZ4ablUVnt2XgAh--
