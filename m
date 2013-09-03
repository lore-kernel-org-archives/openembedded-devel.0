Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4863C6BDCA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:57:28 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so3147351ead.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dKwTNp7VfJEiPXinEMH01YNe2B7XVcBQMEPhoWPxCdQ=;
	b=nOubmWIxe6IChQ1PUm0h6XtViMklr60BVD+mk0wFsE+baLqYKBWDCevOnPCLZaodsq
	oJhrJP0YdD2WutqHNujb9Z5tXZBwktbXDETpvGdhEdGhLUSl+DPLPDaiG5yJvFefP7yQ
	EuAcpG5WHkcWJU5XmlYGgBEq6dNq1OD496oj4/zWJoO6/oD4wgOets/1jhGuv82XAiP9
	YTbO94BC0QxXWf5NIt5WyPasGrup3fIPJycWTgOS+BHIaZEKbBViszuaHu9cUmucubBL
	uwTMF6xNpScSFUwyTtrJzzo597R8Zn6szoM01pYQGwDb2mDtD8lQ28ku+rM+W2oTmA3g
	G3RA==
X-Received: by 10.15.94.201 with SMTP id bb49mr48528016eeb.23.1378231048643;
	Tue, 03 Sep 2013 10:57:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm33418435eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:57:28 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:58:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130903175846.GF3553@jama>
References: <1377267483-7785-1-git-send-email-eren@hambedded.org>
MIME-Version: 1.0
In-Reply-To: <1377267483-7785-1-git-send-email-eren@hambedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] mpg123: add PACKAGECONFIG for pulseaudio and alsa
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
X-List-Received-Date: Tue, 03 Sep 2013 17:57:28 -0000
X-Groupsio-MsgNum: 46049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline

--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 05:18:03PM +0300, Eren T=FCrkay wrote:
> The default DISTRO_FEATURES include alsa and pulseaudio at the same
> time. Hence, both of the options are enabled in mpg123 configuration
> without adding related dependencies, which causes build error.
>=20
> Make the options mutually exclusive through PACKAGECONFIG.  If both alsa
> and pulseaudio are specified, pulseaudio takes precedence.

Applied, thanks!

>=20
> Signed-off-by: Eren T=FCrkay <eren@hambedded.org>
> ---
>  .../recipes-multimedia/mpg123/mpg123_1.15.3.bb     |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb b=
/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> index 595235c..0075427 100644
> --- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> +++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> @@ -6,6 +6,14 @@ HOMEPAGE =3D "http://mpg123.de/"
>  BUGTRACKER =3D "http://sourceforge.net/p/mpg123/bugs/"
>  SECTION =3D "multimedia"
> =20
> +# The options should be mutually exclusive for configuration script.
> +# If both alsa and pulseaudio are specified (as in the default distro fe=
atures)
> +# pulseaudio takes precedence.
> +PACKAGECONFIG_ALSA =3D "${@base_contains('DISTRO_FEATURES', 'alsa', 'als=
a', '', d)}"
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'pulseaudio', '=
pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
> +PACKAGECONFIG[pulseaudio] =3D "--with-default-audio=3Dpulse,,pulseaudio"
> +PACKAGECONFIG[alsa] =3D "--with-default-audio=3Dalsa,,alsa-lib"
> +
>  LICENSE =3D "LGPLv2.1"
>  LICENSE_FLAGS =3D "commercial"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da7aa23a2b646eca38ad4eeb7a8537=
61c"
> @@ -23,7 +31,5 @@ EXTRA_OECONF =3D " \
>      --enable-shared \
>      ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=3Dneon', '=
', d)} \
>      ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=3Daltiv=
ec', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', '--with-default-audi=
o=3Dalsa', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', '--with-defaul=
t-audio=3Dpulse', '', d)} \
>  "
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImI1YACgkQN1Ujt2V2gBzdoQCdGQvdDLCzKVuyUIqKpLXcnpMM
FK4An0vnBQ+lC7O8F2CkQNDhdO2B8buw
=UJgJ
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
