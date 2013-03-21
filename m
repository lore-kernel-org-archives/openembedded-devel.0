Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIWSb-0001iG-2q
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 04:46:39 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so1370603dae.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 20:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Q4qIYtq/0Q5LUH3xzW5n53OBWVl930pX1CpeUKx+i/0=;
	b=Kpg9MghHFgw8AM/iX4s6457JScujBMVVuQ7Xq18l6YSfV4sIlHNCEFnl/OE0Z3VAlE
	UPx0vARw8o3XpvLHX7MJxgsZwCVf3+iUNDqfOV/6vQtbddgsN30xfJwSc3hE7eloHAX8
	Ympn7M/AfkPehJsDNj6UjJ8PThJ2Qet/mI/bYP9wN1yM7lRgdxo0GbfZe6EsYqbdzJog
	Z5dMaXSBo2xLslrDZ248TrARK6j6CISo2niMkDXiMyPOVrIp5O+T4PbW8blXdZPJyCuz
	srTXW7M7BlHtBqgWt02LVnUa/y/MlUrmG945I6A9SW52g/RKEDvO1GdWHhyTrNcEKMrx
	309w==
X-Received: by 10.68.251.169 with SMTP id zl9mr12684967pbc.17.1363836584210;
	Wed, 20 Mar 2013 20:29:44 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ti8sm4340066pbc.12.2013.03.20.20.29.42
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 20:29:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363833125-9370-1-git-send-email-B40290@freescale.com>
Date: Wed, 20 Mar 2013 20:29:41 -0700
Message-Id: <120F33F5-0AE3-41BF-A550-E326F7886307@gmail.com>
References: <1363833125-9370-1-git-send-email-B40290@freescale.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Cc: Chunrong Guo <B40290@freescale.com>, B19537@freescale.com
Subject: Re: [OE-core][PATCH] fmlib: update to the commit for sdk 1.3.2
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
X-List-Received-Date: Thu, 21 Mar 2013 03:46:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

wrong list. wrong subject prefix These patches are for meta-fsl-ppc so =
mark them accordingly and apply them to master there

see the README on the layer it details about patch submission

On Mar 20, 2013, at 7:32 PM, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <b40290@freescale.com>
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
> recipes-ucode/fmlib/fmlib_git.bb |    6 ++++--
> 1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-ucode/fmlib/fmlib_git.bb =
b/recipes-ucode/fmlib/fmlib_git.bb
> index 74eb204..038f899 100644
> --- a/recipes-ucode/fmlib/fmlib_git.bb
> +++ b/recipes-ucode/fmlib/fmlib_git.bb
> @@ -3,11 +3,13 @@ SECTION =3D "fman"
> LICENSE =3D "BSD & GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3f16fa8e677e45af3127c5c4bafc3c00"
>=20
> +PR =3D "r1"
> +
> DEPENDS =3D "linux-libc-headers"
> DEPENDS_virtclass-native =3D ""
>=20
> SRC_URI =3D "git://git.freescale.com/ppc/sdk/fmlib.git"
> -SRCREV =3D "5ebbf75c3108404b513198c9fd9b955b123680af"
> +SRCREV =3D "e80c0625d4f2671ac4f15cabfdd1b334143eb515"
>=20
> S =3D "${WORKDIR}/git"
>=20
> @@ -34,6 +36,6 @@ do_install_virtclass-native () {
>       cp -rf ${S}/include/* ${D}/${includedir}
> }
>=20
> -ALLOW_EMPTY =3D "1"
> +ALLOW_EMPTY_${PN} =3D "1"
>=20
> BBCLASSEXTEND =3D "native"
> --=20
> 1.7.5.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



