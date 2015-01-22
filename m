Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A19CD71637
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:21:13 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id bs8so4109091wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KcD/ac8J3Wtou8NWtEOft6agcAWgHx9lSjupyyGVTnc=;
	b=YaWTpS6sYvrC+qz3M1wOfflUFpNZ8iHozOXZHQupVYECTLYNx2cx3BKIzMaNz4FloB
	oTB3xLW54+di6mdPYqDrJ8j8kaYJTjtK3HZyTKdEKaq7YylhEM4vgqIVoEh+RO/nyVji
	kdqQV6a99o95/jWsgJDdSx7S+hw5SUJhhDOkByYgAXjG3z6yi5mFdLnlgfFFEIt5jCpI
	olTqamuMsQrvv9bJ6Jh8erlouRXdUjQmy5pu5/ytdGRjMERwHOV7PfpHUY0Z4RICR6B0
	V9MtWq7FrUaWR5fDrSKeCU8VQhiypK3t4UV3/8JVV403W13QbYb1K+VG9gSULPXzDtEO
	k51A==
X-Received: by 10.180.75.102 with SMTP id b6mr23041129wiw.34.1421940073652;
	Thu, 22 Jan 2015 07:21:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p6sm4341405wjf.39.2015.01.22.07.21.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 07:21:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Jan 2015 16:21:18 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150122152118.GD2456@jama>
References: <1421819683-8631-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1421819683-8631-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] traceroute: give high priority when update-alternatives
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
X-List-Received-Date: Thu, 22 Jan 2015 15:21:18 -0000
X-Groupsio-MsgNum: 53930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline

--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2015 at 01:54:43PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> busybox provides traceroute command and uses the default priority to
> update-alternatives, if traceroute is not defined the priority, the
> traceroute maybe link to busybox's

Doesn't apply, test your changes in master. This has to be older than 2
weeks when it was sent.

commit 6303c3c0de184388febdd60f9cb3f8b3c3522fec
Author:     Paul Eggleton <paul.eggleton@linux.intel.com>
AuthorDate: Mon Jan 5 10:51:29 2015 +0000
Commit:     Joe MacDonald <joe_macdonald@mentor.com>
CommitDate: Wed Jan 7 13:58:52 2015 -0500

    traceroute: update to 2.0.21
   =20
    Also fix LICENSE to be "or any later version" (as specified in the
    upstream source headers); both licenses apply so use &.

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.20=
=2Ebb b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
> index 4b49c76..914c2a0 100644
> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
> @@ -38,5 +38,6 @@ do_install() {
> =20
>  }
> =20
> +ALTERNATIVE_PRIORITY =3D "60"
>  ALTERNATIVE_${PN} =3D "traceroute"
>  ALTERNATIVE_LINK_NAME[traceroute] =3D "${bindir}/traceroute"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTBFW4ACgkQN1Ujt2V2gByDWwCeJKqlyhkFG44ifskhNFrZrMwx
W2gAn2rEJK+IarsyG03dDbWG5R64ztvH
=KmtW
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
