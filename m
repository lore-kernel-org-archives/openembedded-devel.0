Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCttq-00083K-Q5
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 16:30:58 +0200
Received: by wera1 with SMTP id a1so682588wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uqRSeEXBcw4ikR+iR1/GKM5pWesju24aRub+piq+5PI=;
	b=MdfQwo7UAiSXxQC6z2Dt+APzfHjN5KoBLH1U1FGLs7wEoMXJfVoSCWp4YI8tGWO0l9
	wc7Fk0iks1ISO27JH5fpLSY1iitTKK8Fb3ZSWQEut1J9ftzj+BLxAj+qEyDNlfguH/eR
	vAIu0EBH85/Ney1IxuKv7+z8IGW9tzv46j5bExOAOjJj7ilf/Tai3Re3/Rn8zdJyMGEI
	I6+LHODDRfivqQlWc0IWuDNqiay47/uIL966nhikcSPo58BnCCQ2hYdBiyZ9FY2E5VR+
	j9ycb2/CTR1XqVyGA9VSjgr7OTi4whmFn3Aj0UhVH7hMSWI2oGZegpUXI0sY+uBpvCyd
	CFLg==
Received: by 10.180.88.169 with SMTP id bh9mr7675922wib.5.1332944516166;
	Wed, 28 Mar 2012 07:21:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm13976189wib.4.2012.03.28.07.21.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 07:21:55 -0700 (PDT)
Date: Wed, 28 Mar 2012 16:21:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120328142155.GD4004@jama.jama.net>
References: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
	<1332360619-3060-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1332360619-3060-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 2/2] midori: add librsvg-native to DEPENDS
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
X-List-Received-Date: Wed, 28 Mar 2012 14:30:58 -0000
X-Groupsio-MsgNum: 38038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 09:10:19PM +0100, Andreas M=FCller wrote:
> configure found rsvg-convert on host:
> ...
> Checking for program rsvg-convert           : /usr/bin/rsvg-convert
> ...
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  .../recipes-connectivity/midori/midori_0.4.4.bb    |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb b/meta-o=
e/recipes-connectivity/midori/midori_0.4.4.bb
> index 87855b1..a408d73 100644
> --- a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
> +++ b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
> @@ -2,7 +2,9 @@ DESCRIPTION =3D "Midori is a lightweight web browser."
>  HOMEPAGE =3D "http://www.twotoasts.de/index.php?/pages/midori_summary.ht=
ml"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> -DEPENDS =3D "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-n=
ative python-docutils-native"
> +DEPENDS =3D "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-n=
ative python-docutils-native librsvg-native"
> +
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.ta=
r.bz2;name=3Dmidori \
>            "
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk9zHoMACgkQN1Ujt2V2gBw9oQCfWe1iIYQ+aRJgntv1jiuvyQkz
cw0Anj8c8HjyDem7mT9/TzG2BrG5eowE
=tmba
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
