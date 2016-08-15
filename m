Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 14413770E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:19:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so10340134wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OkJkopx3dule7NmUjkuNIpkI8EyX6cW0BftEH0Lm9H4=;
	b=vz6gvazK2yShA4uNq90Jv8f8Iuu3cmHTUydB5xj7IB/hMaYJS9CEPhUHKB89stzvdo
	J6s09Cm7PfOvVDnOemO6u0MVa2GM0CdY0y/k39xji3YB1A4ZfAJ2tt/jE66/7fH74bm5
	LbTqcO1BMxvItLjiR2GpdIaubQNhbxMXQCTX8OLax2ZsPBkR3PKxaL07XzNoSeYYhHpw
	giWI0F65dE2ycMguLFRAXiFrYgy2SzCZ2Uy1fxxycqE+A6XCfPrR169YOkAyAHPk1vm+
	4ISrw4LxYUxAtWvq3NqhGZ4qDyhD3Zpqr1uejzP8wqOVTwtgMP39BVce36eZVon1byId
	HJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OkJkopx3dule7NmUjkuNIpkI8EyX6cW0BftEH0Lm9H4=;
	b=W3SeT3LAlNFeNEbsQFKX2noZwXnuocMCdBfNen2ALMCRyNwyPr35vtagNqVvdJVpCC
	cvyX9EGfHbEqy5tJWDT2sF/r8pkSeaXel8W4+E3rWRQsuG8PUaLwBsiFrXgpR/WAfdZU
	OluLO5JLrIt8RII5GIumGqs1ZmqPQLn3H6OsGtvivsFoOkx2hNqSiNypENOBv32fjTFu
	BpDe1k2S5ePlH+PmPCTw1mUVlgFihql8aJJk8nRZBpKUDaBIRBDFXIVQlAcK2Wqlo6vk
	9VC/UXq4sr6JTNnxEMUDYK0um64iybFJ6VH5h8Vq4SK8Hz11xKbL6OW8ImmnXRGnIBKn
	HQNw==
X-Gm-Message-State: AEkooutmo74x8JV+fAy0Qs0DuBklAxwa6fafjBxEOAFU69mj/pb/FLkJru9QSDShoDHuLA==
X-Received: by 10.194.106.36 with SMTP id gr4mr7464586wjb.107.1471256399917;
	Mon, 15 Aug 2016 03:19:59 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	f187sm15839294wmf.15.2016.08.15.03.19.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Aug 2016 03:19:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Aug 2016 12:20:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160815102001.oubghmqbafsu43fc@jama>
References: <1470942879-28353-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1470942879-28353-1-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] utouch-frame: fix build errors associated with xmllint
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2016 10:20:00 -0000
X-Groupsio-MsgNum: 62615
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gpn7vctpbjwnkwfz"
Content-Disposition: inline

--gpn7vctpbjwnkwfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 03:14:39PM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-support/utouch/utouch-frame_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe=
/recipes-support/utouch/utouch-frame_git.bb
> index 8fc8733..9bd18fc 100644
> --- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> @@ -16,5 +16,6 @@ PV =3D "1.1.2+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git/"
> =20
> -# http://errors.yoctoproject.org/Errors/Details/74486/
> -PNBLACKLIST[utouch-frame] ?=3D "BROKEN: Fails to execute xmllint"
> +# Fix non-deterministic issue with a2x being found in the environment (a=
sciidoc-native)
> +# and failing to complete xmllint due to missing dtd files
> +EXTRA_OECONF =3D "ASCIIDOC=3D'/bin/false'"

This isn't enough to fix it, maybe /bin/true would work, see:
http://errors.yoctoproject.org/Errors/Details/75464/

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

--gpn7vctpbjwnkwfz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlexl1EACgkQN1Ujt2V2gByN7QCgnZuC016lvR9etLfTgNob8crn
IZwAoIeTCld+RqepoRGHz/DRg4ZJn5lu
=hUob
-----END PGP SIGNATURE-----

--gpn7vctpbjwnkwfz--
