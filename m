Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmOn-0003CG-LX
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:57:16 +0100
Received: by mail-wi0-f174.google.com with SMTP id hj13so550217wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M7amGSoKZvg8/yGjzYoiDYAh8se3DiopXzZIbTQzk5k=;
	b=iN6Eh/jAiTYWzTHDk+XLpH5NW9IqOr9hT5C2qU/vAWKnFJmfN0yHSPRG3EgfcFV3g9
	5ctu0+KQ+TBZ6csIx9ojELM0nrNBIzf+9s6IdJk48k+q4eZgQpc6HpgmW6w6fqBwpRQ0
	ZmW7QCWZgv0O49uTWUpXdgi+WNpLZjjPYcYlIH4n7rvxfwdZQAHH23cb+ti3gUJxaJWj
	aGn+B2MGCyVi5gmKHjKK47Txo+WOkAG8AOj/GOukYSxSDAgjRMI8My7G5lvTKy/iB2/5
	l74BJk5yCGdYDcGT3ER/Qp3UnUSnE1STpRrjMPtwuc6Qc7Eec07EV9NMoC9XkndzAhlX
	jBrw==
X-Received: by 10.194.108.101 with SMTP id hj5mr20366438wjb.6.1359369693730;
	Mon, 28 Jan 2013 02:41:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fx5sm2625043wib.11.2013.01.28.02.41.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:41:33 -0800 (PST)
Date: Mon, 28 Jan 2013 11:41:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128104136.GV16904@jama.palm1.palmone.com>
References: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
	<1359182715-3063-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1359182715-3063-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 2/2] ebtables, arptables: add perl as runtime dependency
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
X-List-Received-Date: Mon, 28 Jan 2013 10:57:18 -0000
X-Groupsio-MsgNum: 42880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="22hJjvOmZW2O/jbw"
Content-Disposition: inline

--22hJjvOmZW2O/jbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 10:45:15PM -0800, Khem Raj wrote:
> Fixes errors like
>=20
> | Computing transaction...error: Can't install
> arptables-0.0.3+4-r0.0@ppce500v2: no package provides /usr/bin/perl

Applied, please split those perl scripts in followup patch.

Thanks
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    2 ++
>  .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb=
 b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index 2596d2f..4e9b0bc 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871=
a28ab1488fdbd2e73e"
>  SECTION =3D "console/network"
>  PR =3D "r1"
> =20
> +RDEPENDS +=3D "perl"
> +
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
>             file://installnonroot.patch \
>             file://01debian_defaultconfig.patch \
> diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.=
bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> index 71e2600..8da9bb7 100644
> --- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> @@ -3,6 +3,8 @@ PRIORITY =3D "optional"
>  LICENSE =3D "GPL-2.0"
>  SECTION =3D "console/network"
> =20
> +RDEPENDS +=3D "perl"
> +
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>  SRC_URI =3D " \
>  	${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=3Darptables=
 \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--22hJjvOmZW2O/jbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVeAACgkQN1Ujt2V2gByjEQCglUyk3O0dXUZgK8TUPVRJM5qZ
v6wAn0A2Y8+pUpKYM/Crjxw3V2Mx0Pu3
=mgP0
-----END PGP SIGNATURE-----

--22hJjvOmZW2O/jbw--
