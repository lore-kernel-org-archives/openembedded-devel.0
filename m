Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7F66028A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 21:46:53 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lc6so3030854vcb.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 14:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gpazH6Xia/LfzyS0HAt9jng7gVgj7F3mK/JMIjS8qb0=;
	b=H27a8SuXvzkwFydldLp05sXdJtSw5ki/opTijyjfR9njxm4Er0G2lCDC+mMpri/bHR
	z5cGxtmJcmZeNob3QcqM6Lndu15J9H2sm9m+75+5BJ1P6pPK++suhpWL4T/a0xVRE04G
	qFaGZ4N3WA3cv611+eD5kxzotu7X/+ZUCUKz5fK7AOiIQaWpSMwYe2bgBM6yABFNK5fq
	GiK25IYxnr8Hx2MapFx7Om0BPvIYo41CeWKxY0km+H50PVqAkXJQu4zItBJEQZ+AnBiN
	nzsdT00RvU6Z4y9sl6wR7eGqVoFH3PlaJW6CCoZ9b/ImftUUmOGGA/a2xzLHbocKHGnk
	HEfw==
X-Received: by 10.220.250.203 with SMTP id mp11mr24374690vcb.2.1399240014350; 
	Sun, 04 May 2014 14:46:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	un13sm13938578vdb.10.2014.05.04.14.46.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 14:46:53 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 4 May 2014 23:47:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140504214712.GG2486@jama>
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Sun, 04 May 2014 21:46:54 -0000
X-Groupsio-MsgNum: 49687
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vqhh7KwsSol0ht3S"
Content-Disposition: inline

--Vqhh7KwsSol0ht3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 12:27:39PM -0300, Otavio Salvador wrote:
> qtdeclarative requires accessibility to be enabled and it is added by
> default to the toolchain so we ought to have it enabled to ensure the
> default toolchain generation works.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes-qt/qt5/qtbase.inc |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 89736be..91cadef 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -39,6 +39,7 @@ PACKAGECONFIG_X11 ?=3D "${@base_contains('DISTRO_FEATUR=
ES', 'x11', 'xcb xvideo xsy
>  PACKAGECONFIG_FONTS ?=3D ""
>  PACKAGECONFIG_SYSTEM ?=3D "jpeg libpng zlib"
>  PACKAGECONFIG_MULTIMEDIA ?=3D "${@base_contains('DISTRO_FEATURES', 'puls=
eaudio', 'pulseaudio', '', d)}"
> +PACKAGECONFIG_ACCESSIBILITY ?=3D "accessibility"
>  PACKAGECONFIG_DISTRO ?=3D ""
>  # Either release or debug, can be overridden in bbappends
>  PACKAGECONFIG_RELEASE ?=3D "release"
> @@ -56,6 +57,7 @@ PACKAGECONFIG ?=3D " \
>      ${PACKAGECONFIG_FONTS} \
>      ${PACKAGECONFIG_SYSTEM} \
>      ${PACKAGECONFIG_MULTIMEDIA} \
> +    ${PACKAGECONFIG_ACCESSIBILITY} \
>      ${PACKAGECONFIG_DISTRO} \
>  "

As I told you on gtalk, I would prefer default to stay as minimal as
posible, why don't you change packagegroup-qt5-toolchain-target.bb to
use RRECOMMENDS instead of RDEPENDS so that missing
qtquickcontrols-qmlplugins package doesn't break it when it's not
available (because it's empty)?

> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Vqhh7KwsSol0ht3S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNmtWAACgkQN1Ujt2V2gBwi1QCfeSimIueUgcEe/5/J9BPus4+i
AR8An3SJb2fhxtW+rxK6UzSSvaq5lYag
=LVLM
-----END PGP SIGNATURE-----

--Vqhh7KwsSol0ht3S--
