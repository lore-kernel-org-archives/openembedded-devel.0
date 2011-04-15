Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QAcAy-0005ae-VC
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 08:06:41 +0200
Received: by fxm19 with SMTP id 19so1957157fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 23:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hHhqYXZbPiCOeJnX/J7oBJ3H98ppTngFAs2s9r6tvLY=;
	b=YmzfHAmq/SiaQIxKuBYRgeUzYSwJgVRzhF92V5IUePX+G4dsb7reRnbaLDFNJ6OHGt
	0nC8XtxOPHdfm6E6dPe8Vk+V8j+UJxHEwo9IdSGljQtsFwSx9ZwnCED80+zPZgRF2Ffa
	xT79XDHs88wrZhIEI4+q8/4AHmDGovvN4oJaE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=au8uLdnv4lbp3wSxQVeOKESODxWGlGxd7d7zBFylFDEoa2xSkIdBl4lbYfhVr5RFW4
	cDk2YH404RP++/w/JaNaoMHerfG95R84t/zvOz/WF0QdJyPejqL68du0l/p9wDl0CNQd
	K8Riu/pbLr+gGrTTyL5xvXBqTbyYp4qaVxv4w=
Received: by 10.223.6.11 with SMTP id 11mr1671379fax.100.1302847461519;
	Thu, 14 Apr 2011 23:04:21 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm693346fam.16.2011.04.14.23.04.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Apr 2011 23:04:20 -0700 (PDT)
Date: Fri, 15 Apr 2011 08:04:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110415060414.GN21027@jama.jama.net>
References: <1302596149.4323.18.camel@mattotaupa>
	<20110412084218.GA21027@jama.jama.net>
	<1302622768.4323.148.camel@mattotaupa>
	<1302707555.4031.27.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1302707555.4031.27.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] starling: change `gst-plugin-ivorbis` to `gst-plugin-ivorbisdec` in `RRECOMMENDS_${PN}`
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
X-List-Received-Date: Fri, 15 Apr 2011 06:06:41 -0000
X-Groupsio-MsgNum: 31188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dZihrQ6eCIduWT38"
Content-Disposition: inline

--dZihrQ6eCIduWT38
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2011 at 05:12:35PM +0200, Paul Menzel wrote:
> Date: Wed, 13 Apr 2011 09:21:16 +0200
>=20
> With commit e6d170ab [1]
>=20
>         commit e6d170abad28fcd0e3b8ba831705bed23e3309a4
>         Author: Martin Jansa <martin.jansa@gmail.com>
>         Date:   Thu Apr 7 00:12:22 2011 +0000
>        =20
>             gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pac=
k base/good/bad/ugly
>=20
> `bitbake starling` fails with the following error message.
>=20
>         ERROR: Nothing RPROVIDES 'gst-plugin-ivorbis' (but /oe/openembedd=
ed/recipes/starling/starling_0.9.bb
>=20
> The GStreamer recipe creates only a plugin named `gst-plugin-ivorbisdec` =
which is the same as `gst-plugin-ivorbis`.
>=20
>         gst-plugins-base-0.10.32$ ./configure --help
>         [=E2=80=A6]
>           --disable-ivorbis            disable integer vorbis plug-in: iv=
orbisdec
>         [=E2=80=A6]
>=20
> This patch is tested using the following configuration.
>=20
> 	Build Configuration:
> 	BB_VERSION        =3D "1.12.0"
> 	METADATA_BRANCH   =3D "master"
> 	METADATA_REVISION =3D "0779626"
> 	TARGET_ARCH       =3D "arm"
> 	TARGET_OS         =3D "linux-uclibceabi"
> 	MACHINE           =3D "beagleboard"
> 	DISTRO            =3D "minimal-uclibc"
> 	DISTRO_VERSION    =3D "dev-snapshot-20110413"
> 	TARGET_FPU        =3D "hard"
>=20
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De6d17=
0abad28fcd0e3b8ba831705bed23e3309a4
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> 1. I do not know if the PR bump is needed.
> 2. I have still no clue why it worked before that change and how `gst-plu=
gin-ivorbis` was created.
> ---
>  recipes/starling/starling_0.9.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/starling/starling_0.9.bb b/recipes/starling/starling=
_0.9.bb
> index 859bf6b..5a9c676 100644
> --- a/recipes/starling/starling_0.9.bb
> +++ b/recipes/starling/starling_0.9.bb
> @@ -3,7 +3,7 @@ SECTION =3D "gpe/multimedia"
>  PRIORITY =3D "optional"
>  LICENSE =3D "GPL"
>  DEPENDS =3D "gtk+ gstreamer gst-plugins-good gst-plugins-bad ${@base_con=
ditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)} esound sqlit=
e libsoup libhandoff"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  inherit gpe autotools
> =20
> @@ -20,7 +20,7 @@ RDEPENDS_${PN} =3D "\
>  RRECOMMENDS_${PN} =3D "\
>    gst-plugin-mad \
>    gst-plugin-modplug \
> -  gst-plugin-ivorbis \
> +  gst-plugin-ivorbisdec \
>    gst-plugin-tcp \
>  "
> =20
> --=20
> 1.7.4.1



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dZihrQ6eCIduWT38
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2n394ACgkQN1Ujt2V2gBy8nQCfTStX1gNonLzKnpq1kyJR6B7j
yqQAoLKtvT+uj1E69ebhP+uL5hlmz2o+
=XNL1
-----END PGP SIGNATURE-----

--dZihrQ6eCIduWT38--
