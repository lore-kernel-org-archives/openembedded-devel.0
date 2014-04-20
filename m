Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id BE6DC65D10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:16:54 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2936522eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o+Z5hkvVfNE+cKuN4ZGnpomfU+75MXMsqSRpJMF9vE0=;
	b=0S1/DQ61NauFqKu3WOoXVenFpaitX4pYlrSpVI2S9gmCNPrlxcBzr9H42JaxZoqz7M
	GA71RWlBr98Yxqp5R8iChq+/OpEZ+FLD3adOjaIASOf1BsJlfXjChcYTftjq5om5L37a
	oufBisVAdsqH+ZuypcDDVoKbAkJlo8ZTzw+3ymXKfQNpMR44Ddsk1gfnCja2HngU9IIV
	ylMydHmXLH4Miea8oq16CP9iAWKHqUSHcLfozc4mUny5Sk+NpWw+wcxqrBHHzhZaSIuX
	kugWFkD1tkzPSY4vAVGCmMeygDDTmiCpYxPWIKV+RTnKTewsBuOSWpZAjp8BTpbPyOan
	x+bw==
X-Received: by 10.15.42.138 with SMTP id u10mr37948625eev.7.1397992615418;
	Sun, 20 Apr 2014 04:16:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm93743607eev.5.2014.04.20.04.16.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:16:54 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:16:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420111659.GN2486@jama>
References: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
	<1397023113-29936-2-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397023113-29936-2-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/3] libyaml: update to 0.1.5
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
X-List-Received-Date: Sun, 20 Apr 2014 11:16:56 -0000
X-Groupsio-MsgNum: 49321
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V/YKEhZ4Pe4jxeTU"
Content-Disposition: inline

--V/YKEhZ4Pe4jxeTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 01:58:31PM +0800, Kai Kang wrote:
> Update libyaml from 0.1.4 to latest version 0.1.5.

Merged, thanks!

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../libyaml/{libyaml_0.1.4.bb =3D> libyaml_0.1.5.bb}           | 12 ++++=
++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-support/libyaml/{libyaml_0.1.4.bb =3D> libyaml_0.=
1.5.bb} (36%)
>=20
> diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb b/meta-oe/r=
ecipes-support/libyaml/libyaml_0.1.5.bb
> similarity index 36%
> rename from meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
> rename to meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
> index af8d63f..c44eda4 100644
> --- a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
> +++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
> @@ -1,12 +1,16 @@
> -SUMMARY =3D "LibYAML is a YAML parser and emitter written in C"
> +SUMMARY =3D "LibYAML is a YAML 1.1 parser and emitter written in C."
> +DESCRIPTION =3D "LibYAML is a C library for parsing and emitting data in=
 YAML 1.1, \
> +a human-readable data serialization format. "
>  HOMEPAGE =3D "http://pyyaml.org/wiki/LibYAML"
>  SECTION =3D "libs/devel"
> +
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6015f088759b10e0bc2bf64898d4a=
e17"
> =20
> -SRC_URI =3D "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz;name=
=3Dlibyaml"
> -SRC_URI[libyaml.md5sum] =3D "36c852831d02cf90508c29852361d01b"
> -SRC_URI[libyaml.sha256sum] =3D "7bf81554ae5ab2d9b6977da398ea789722e0db75=
b86bffdaeb4e66d961de6a37"
> +SRC_URI =3D "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "24f6093c1e840ca5df2eb09291a1dbf1"
> +SRC_URI[sha256sum] =3D "fa87ee8fb7b936ec04457bc044cd561155e1000a4d250298=
67752e543c2d3bef"
> =20
>  S =3D "${WORKDIR}/yaml-${PV}"
> =20
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V/YKEhZ4Pe4jxeTU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrKsACgkQN1Ujt2V2gBwTnwCfW6+92x8lZ2EMmMiWBvB0yrwh
qRwAmQEt03Ewl9fEKYi2inegSJmhDc+8
=cOgN
-----END PGP SIGNATURE-----

--V/YKEhZ4Pe4jxeTU--
