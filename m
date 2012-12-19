Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlK7F-0000sp-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 14:55:32 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so935461dad.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tFrW3fXztiwwN/x1PJqKnPlOxcIxk96PN6xwAOcYKdk=;
	b=qiwcS3NYZ+eaInBiivImtHrGI3vAwg9K4zznvV7ARr0+Mg3BeJY3mrXhrqY9R1QJJq
	jXjUiNXXEfC4WN7yCeoLzNNYlfubhTKKl3IExD0yA+xe5HdlD2eDbRqSo5MjnRWl0imV
	s3lOETNABWnfaGi63Tsl58NQX7ddgvUMnRf4aObS5VeVU4sZNuNp01MQaHg/wavqvV4U
	I4at+SWPlLFrThEwOwwnFyXOTeRq/74xECXDCN63C/lC46Mubm0T7xnkTUwbzsq4BDlD
	X+CZvfvi9A7m7o1w+kkQAZfSogoKj+GTAa1WD0AIf1gU5ssIkBXk9huAgPH4++O3ttC0
	IZrg==
X-Received: by 10.66.89.199 with SMTP id bq7mr17588193pab.26.1355924437110;
	Wed, 19 Dec 2012 05:40:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oz9sm3131460pbb.68.2012.12.19.05.40.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 05:40:35 -0800 (PST)
Date: Wed, 19 Dec 2012 14:40:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121219134033.GD3525@jama.palm1.palmone.com>
References: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/3] openmotif: Update SRC_URI and add libxft in depends
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
X-List-Received-Date: Wed, 19 Dec 2012 13:55:32 -0000
X-Groupsio-MsgNum: 42255
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline

--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 07:15:56PM -0200, Otavio Salvador wrote:
> The file couldn't be found in the official repository and it seems
> unmaintained as it had processing errors when trying to register to be
> able to download the last release. Researching in the web a mirror has
> been found and than we're using now this mirror so fetch works again.
>=20
> During build test, from a clean tmp directory we found that libxft is
> a hard dependency so we add it to depends list.

Does not apply on master, because openmotif was removed:
commit 14b68506078a4133e743491d35245775a58a1317
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Wed Nov 14 12:31:18 2012 +0100

    openmotif: remove due to lack of libxp in repository

Can you rebase on master and resubmit if still needed?

Cheers,

>=20
> Change-Id: If486a40718af688dfad6768d56432afb573cf8d8
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-support/openmotif/openmotif_2.3.3.bb   |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-=
oe/recipes-support/openmotif/openmotif_2.3.3.bb
> index 2e9c2de..e7a0220 100644
> --- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
> +++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
> @@ -1,11 +1,13 @@
>  SECTION =3D "libs"
>  DESCRIPTION =3D "OSM/Motif implementation."
>  LICENSE =3D "OGPL"
> -DEPENDS =3D "xbitmaps virtual/libx11 libxt libxp"
> +DEPENDS =3D "xbitmaps virtual/libx11 libxt libxp libxft"
> =20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14f692c82491db3d52419929d2f3b=
343"
> =20
> -SRC_URI =3D "http://openmotif.com/files/public_downloads/openmotif/2.3/2=
=2E3.3/openmotif-2.3.3.tar.gz \
> +PR =3D "r1"
> +
> +SRC_URI =3D "http://fossies.org/unix/misc/openmotif-2.3.3.tar.gz \
>             file://configure.patch;patch=3D1"
> =20
>  SRC_URI[md5sum] =3D "fd27cd3369d6c7d5ef79eccba524f7be"
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

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDRw9EACgkQN1Ujt2V2gByy4wCfcqOI60tDOf5SdEp8pn1fTbUl
lZgAoLOKZzNx4vr+HaqVJmAQgfokuUYG
=pG4b
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
