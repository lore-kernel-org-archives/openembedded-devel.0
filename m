Return-Path: <joe@deserted.net>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id CE19F65D37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:01:25 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id lx4so3069927iec.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=yEY6ELkELnh53gFj2id9EqJBa3f2dfjp4tNDVE5TopA=;
	b=TlLLVaJ0r3t6VWSCnr11G4CEFf8LhQlNe6im9LgVw8D0D2pP+AZQfvFWgj9nceL/n7
	M9Rywtj8c46d5gXzeta3b2wFdwr/MUiyRUkMSFWmclm+Pf3mCkn028viNMP1cQwXd6tV
	r+QcXo91vLBiRjYi76LoiHXcn1B3ccXjypS9WOCk7nDLzi8RF7WomL2/muwF+4tqlx/c
	fgxTKRgkbPc6xiIr/UGxZVt6NFH6XlCxzVxD0JKkRiAU4cfW5Ot1GeoVYhtaBm4R0KL1
	wC9Fh6iYN807eyuSWpZEkCS/pkVBoTn1bZFTw3B1Z/J6N/LHTUDG3DjobrmclgFqbqbS
	Vkbw==
X-Gm-Message-State: ALoCoQn5UZHapzG2cHQU9A9RMHk9tOWe0gVoXQwYBk4RC9nrfsD2k6mEAx8FvCh8XK7A083Ktm69
X-Received: by 10.42.16.199 with SMTP id q7mr4627720ica.16.1398387686577;
	Thu, 24 Apr 2014 18:01:26 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	kw1sm3661793igb.4.2014.04.24.18.01.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:01:25 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:01:23 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425010121.GF10115@deserted.net>
References: <1398251678-6735-1-git-send-email-changhyeok.bae@lge.com>
MIME-Version: 1.0
In-Reply-To: <1398251678-6735-1-git-send-email-changhyeok.bae@lge.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] quagga: Add mirror site
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
X-List-Received-Date: Fri, 25 Apr 2014 01:01:26 -0000
X-Groupsio-MsgNum: 49470
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Content-Disposition: inline

--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] quagga: Add mirror site] On 14.04.23 (Wed 20=
:14) Changhyeok Bae wrote:

> * The SRC_URI is not accessible.
>   So need to add mirror site referred by the original site.
> * The problem is that
>   http://download.savannah.nongnu.org/releases redirects to closest mirror
>   and few mirrors (e.g. .jp) weren't working correctly while
>   http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.
>=20
> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  .../recipes-protocols/quagga/quagga.inc            |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index 65ff040..6127205 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -37,6 +37,8 @@ SRC_URI =3D "http://download.savannah.gnu.org/releases/=
quagga${QUAGGASUBDIR}/quagg
>             file://quagga-Avoid-duplicate-connected-address.patch \
>  "
> =20
> +MIRRORS +=3D "http://download.savannah.gnu.org/releases/ http://download=
-mirror.savannah.gnu.org/releases/ \n"
> +
>  PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '=
', d)}"
>  PACKAGECONFIG[cap] =3D "--enable-capabilities,--disable-capabilities,lib=
cap"
>  PACKAGECONFIG[pam] =3D "--with-libpam, --without-libpam, libpam"
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZs+EACgkQwFvcllog0XyCAgCgj2RMg5vhuUepK8V8G1Qn4gLH
ZzUAn1oMeABgxQVAfIaHS1PXrt1DS2pJ
=bVJJ
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--
