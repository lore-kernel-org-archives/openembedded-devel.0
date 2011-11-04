Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RML1K-00028X-C3
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 15:45:26 +0100
Received: by eyd9 with SMTP id 9so2066468eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Av7l2dL9781SodCccwAn8rNCH0g0x2463+HsB57IB28=;
	b=O1ookURNh0vkWSGtUOa6nkM+juHVw5156I9nWf09w/GIsYipsXvdWZu/a9r3JJQ08e
	fzLEX4y/m8azmuTgGfWFx4/zcRWmt/MaTqUYEopeR7sicluS62STrFauYtHa1g0cBuhO
	kjY/Cd18s5ylQGodEFYKRDLe5GtpYYSF80gHw=
Received: by 10.14.15.83 with SMTP id e59mr792769eee.139.1320417553610;
	Fri, 04 Nov 2011 07:39:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s43sm25769685eef.4.2011.11.04.07.39.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 07:39:12 -0700 (PDT)
Date: Fri, 4 Nov 2011 15:39:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111104143911.GW9949@jama.jama.net>
References: <20111104143627.1D8E31032F@opal>
MIME-Version: 1.0
In-Reply-To: <20111104143627.1D8E31032F@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] mlafauci : Add new vulcanoG20 machine configuration
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
X-List-Received-Date: Fri, 04 Nov 2011 14:45:26 -0000
X-Groupsio-MsgNum: 35214
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TOkWJigZa0YodlBE"
Content-Disposition: inline

--TOkWJigZa0YodlBE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 02:36:27PM +0000, git@git.openembedded.org wrote:
> Module: openembedded.git
> Branch: mckoan/kaeilos-2011
> Commit: b4c89dc47f0cdd59b74c882c5c2420864972f343
> URL:    http://git.openembedded.org/?p=3Dopenembedded.git&a=3Dcommit;h=3D=
b4c89dc47f0cdd59b74c882c5c2420864972f343
>=20
> Author: mlafauci <mlafauci@metodo2.it>
> Date:   Mon Oct 24 08:27:40 2011 +0200

Commit policy says that there should be real name in Author field..

>=20
> Add new vulcanoG20 machine configuration
>=20
> Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
>=20
> ---
>=20
>  conf/machine/vulcano-g20.conf |   21 +++++++++++++++++++++
>  1 files changed, 21 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/machine/vulcano-g20.conf b/conf/machine/vulcano-g20.conf
> new file mode 100644
> index 0000000..98072f5
> --- /dev/null
> +++ b/conf/machine/vulcano-g20.conf
> @@ -0,0 +1,21 @@
> +#@TYPE: Machine
> +#@Name: Metodo2 Vulcano G20 Board
> +#@DESCRIPTION: Machine configuration for Metodo2 VulcanoG20 module with =
AT91SAM9G20
> +
> +include conf/machine/include/at91-2.6.30.inc
> +
> +#PREFERRED_VERSION_linux =3D "2.6.30"
> +
> +# Has linux config file in OpenEmbedded
> +#LINUX26_DEFCONFIG =3D "at91sam9g20ek_defconfig"
> +
> +UBOOT_MACHINE =3D "vulcano-g20_nandflash_config"
> +#UBOOT_MACHINE =3D "vulcano-g20_dataflash_cs1_config"
> +# UBOOT_MACHINE =3D "vulcano-g20_config"
> +
> +AT91BOOTSTRAP_BOARD =3D "vulcano-g20 vulcano-g20df vulcano-g20nf"
> +
> +MACHINE_FEATURES +=3D "usbhost"
> +
> +#Vulcano with 64MB NAND
> +#EXTRA_IMAGECMD_jffs2 =3D "--pad --little-endian -s 0x200 -n  -e 16KiB"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TOkWJigZa0YodlBE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6z+Q8ACgkQN1Ujt2V2gBzSoACeOhGFJXyKF9P8eX2LIAzEH7EL
LG0AoKZtaaUIy+DljRqvxn1YzBj65UuZ
=HLvb
-----END PGP SIGNATURE-----

--TOkWJigZa0YodlBE--
