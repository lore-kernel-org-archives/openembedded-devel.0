Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4CE6BFA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 18:08:09 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so1213992ead.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 10:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kuJYCijpmDjeWoZhiau2f7D6eWQbsVqKfZ1wI4N4tAY=;
	b=g1AWlsK1xeliVQZYrPRaFN+rNSacrP7RjgsNc+iscNGMh5oJ4uP62ky6d1ip4bSJUu
	kp2AGq2No2a7O4dOmGc9OePpAPmzJVJ4gHJpjMnVLc6LmQoAWOJAwNaFcc0A736awzLH
	BwF4FDrTlkOlwPEMMc0WYavGRkEVFQvgGxSnOu8DkodEAQyjxbUvO+Ti/yJUXTqgbip/
	TBnO1bLfE9h0sF/LUNSm6pGB2R0DDH3WacK/ADA8YW4V8ziNbqnK3OmYEzbpzOQgfQlu
	iiKfHDQ3+evl2I7cLLF3Fxiv4uiLlCh97psMYpct0k43evuVg9cuAcBfXbKMl9Ex3QRg
	sJoQ==
X-Received: by 10.14.176.195 with SMTP id b43mr4163951eem.99.1394042890529;
	Wed, 05 Mar 2014 10:08:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	46sm11833908ees.4.2014.03.05.10.08.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 10:08:09 -0800 (PST)
Date: Wed, 5 Mar 2014 19:08:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140305180816.GA26981@jama>
References: <1393696487-30736-1-git-send-email-mike.looijmans@topic.nl>
MIME-Version: 1.0
In-Reply-To: <1393696487-30736-1-git-send-email-mike.looijmans@topic.nl>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: Re: [PATCH] musicbrainz: Build with B=S
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
X-List-Received-Date: Wed, 05 Mar 2014 18:08:10 -0000
X-Groupsio-MsgNum: 48527
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0R7t4+nAS57LSdzv"
Content-Disposition: inline

--0R7t4+nAS57LSdzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 01, 2014 at 06:54:47PM +0100, mike.looijmans@topic.nl wrote:
> From: Mike Looijmans <milo-software@users.sourceforge.net>
>=20
> This recipe doesn't work when B!=3DS, so force B=3D$S to fix the failure.
>=20
> Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>

What's the relation of this change to
http://patchwork.openembedded.org/patch/67597/
?

> ---
>  .../musicbrainz/libmusicbrainz_git.bb              |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index f6a8f53..4cc04b8 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -37,3 +37,6 @@ do_configure_prepend() {
> =20
>  EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:PATH=3D${libdir} \
>                   -DIMPORT_EXECUTABLES=3Dbuild-native/ImportExecutables.c=
make"
> +
> +# out-of-tree building doesn't appear to work for this package.
> +B =3D "${S}"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0R7t4+nAS57LSdzv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXaBAACgkQN1Ujt2V2gBxd1QCeKGibITToqt7sNLx54Kusd2re
WCIAoJmwlro21Cz/BOrbYK12zZLii4wn
=IMx5
-----END PGP SIGNATURE-----

--0R7t4+nAS57LSdzv--
