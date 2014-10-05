Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id A4A686FC68
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Oct 2014 21:42:41 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id cc10so5274278wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2014 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QhtfhXMeV2ij88EeqGQhksOCLjIK8zjtUZ7ATzKKG/M=;
	b=L7sNGXRYy0GQcNFzIs/4S8FS2wFMx9hMiPreIGkazrN02WMDPJRVPkvB4TbZJ7y9mp
	a2X+PN7BJ/OKLU9r3QPeJx+8D4j9uOhTBKiq8O7DlkBlfLl6kYg1h5U9Aucxp+ygUfFb
	07iUsF6eYTy2VRF/EWRuaRLVNtLGbfpTcL5Nin4WK1fq2nPkH9YTEljgoDjRuZ+3Cp59
	Qry+Ozc0u8br2ssJQDUmRE24HPeAfJg7FnlE3wjv1NafpfqC49qxrnWkjv4TrXN3dYZm
	eqWSmM5RAraYIA8VEMJNlxA0UnxApovzDR22Ff2PvUry644oJox61fefFiNyvO469P7a
	Hj7A==
X-Received: by 10.194.59.109 with SMTP id y13mr4904755wjq.124.1412545362433;
	Sun, 05 Oct 2014 14:42:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ka3sm15200619wjc.3.2014.10.05.14.42.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 14:42:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 5 Oct 2014 23:43:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141005214342.GS25706@jama>
References: <1412543993-30871-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1412543993-30871-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-handheld][PATCH] encdec-updater: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 05 Oct 2014 21:42:44 -0000
X-Groupsio-MsgNum: 52365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8S8xwCNhfXjuHwS7"
Content-Disposition: inline

--8S8xwCNhfXjuHwS7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 05, 2014 at 11:19:53PM +0200, Andrea Adami wrote:
> The recipe is using BBCLASSEXTEND =3D "native" and as it is not buildable:
>=20
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'encdec-updater-native'
>  (but /oe/meta-handheld/recipes-bsp/zaurus-utils/zaurus-updater.bb
>   DEPENDS on or otherwise requires it)
> ERROR: encdec-updater-native was skipped: incompatible with machine poodle
>  (not in COMPATIBLE_MACHINE)
> ERROR: Required build target 'zaurus-installer' has no buildable provider=
s.
> Missing or unbuildable dependency chain was:
>  ['zaurus-installer', 'zaurus-updater', 'encdec-updater-native']
>=20
> Remove COMPAIBLE_MACHINE alltogether.
> While there, remove PR remnant.
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/zaurus-utils/encdec-updater.bb | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/recipes-bsp/zaurus-utils/encdec-updater.bb b/recipes-bsp/zau=
rus-utils/encdec-updater.bb
> index 1ee2e77..138cd26 100644
> --- a/recipes-bsp/zaurus-utils/encdec-updater.bb
> +++ b/recipes-bsp/zaurus-utils/encdec-updater.bb
> @@ -2,7 +2,6 @@ DESCRIPTION =3D "A tool to encode and decode the Sharp Za=
urus updater.sh script"
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://encsh.c;endline=3D15;md5=3Dd73360c98c2885be=
19245f2a8c728f38"
> -PR =3D "r2"

That would make the version going backwards.

>  SRC_URI =3D "http://distro.ibiblio.org/pub/linux/distributions/pdaxrom/d=
ownload/1.1.0beta4/src/survive-1.1.0.tar.bz2"
> =20
> @@ -21,6 +20,3 @@ do_install() {
>  }
> =20
>  BBCLASSEXTEND =3D "native"
> -
> -COMPATIBLE_MACHINE =3D "(poodle|c7x0|spitz|akita|tosa)"

Why don't you keep it with _class-target override?

> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8S8xwCNhfXjuHwS7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQxu44ACgkQN1Ujt2V2gBx45gCgs6dwHM5vMl30I0kKf4E2IzxX
AtwAoI8EBz4s5UkMuelejCco5b1XV0D0
=chC+
-----END PGP SIGNATURE-----

--8S8xwCNhfXjuHwS7--
