Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id E671270620
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:33:24 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so2778993wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cBir3QO4QCtjSa+9ug9i8/WGGKQvcJM97aIOvxul89M=;
	b=TW+N1120CxOJu3uUJ1Nfhqycauu/8rkkOuYK3MYCrZZzw0q5naPQk2rRaJFhXZzWNG
	tI+ZVEaB4qvZcwo+TozFsWh5d/dPT714ZriGCNJS5xWpIzDiXmCaVGnZwnV+/6gWez7T
	diZZpL3FPCbzOiMtl2EHEqOZJ2+ogsFUzWimZZUsVeIpge8VTrWyoA3oAlgQFAYK2Ki2
	ZaNvcrG48EL7+pPe0fOfZVJr6Xq/F3FWS+R0ifU2Xj0+SsJWkes4hJGpgcDxEab1d5xR
	kiC2gj3LjWK0Bm/4DURBf7yP5zDkiz0tiQfJnK5FqYA35KNsAy15vYoRbnJ2ao5/8JyN
	XFEw==
X-Received: by 10.180.206.134 with SMTP id lo6mr51000983wic.1.1407335604826;
	Wed, 06 Aug 2014 07:33:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eh7sm2885960wjd.32.2014.08.06.07.33.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 07:33:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 16:33:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806143354.GI14848@jama>
References: <1407322522-6572-1-git-send-email-bobadeshrikant@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407322522-6572-1-git-send-email-bobadeshrikant@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: Re: [meta-oe][daisy][PATCH] libmtp: inherit gettext
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
X-List-Received-Date: Wed, 06 Aug 2014 14:33:30 -0000
X-Groupsio-MsgNum: 51452
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gJNQRAHI5jiYqw2y"
Content-Disposition: inline

--gJNQRAHI5jiYqw2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 04:25:22PM +0530, Shrikant Bobade wrote:
> From: Shrikant Bobade <Shrikant_Bobade@mentor.com>
>=20
> This is required to fix autoreconf execution failure
> : AM_ICONV,AC_LIB

NAK: See meta-oe/master commit
74783ca1901aea31b79a762836a3595ffd1ad49b

which can be backported instead of this one.

> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> ---
>  .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-o=
e/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> index f4ea800..6185217 100644
> --- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> +++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> @@ -33,7 +33,7 @@ skip_udev_rules_generation () {
>  	cp ${WORKDIR}/69-libmtp.rules ${S}/
>  }
> =20
> -inherit autotools pkgconfig lib_package
> +inherit autotools pkgconfig lib_package gettext
> =20
>  EXTRA_OECONF +=3D "--disable-rpath"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gJNQRAHI5jiYqw2y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiPNIACgkQN1Ujt2V2gBxVRwCgmwXQlheX59u+GZBYGNt7bS+P
QhcAmwagG0r12ep1T+S09TjPVT7vM+FO
=BJrx
-----END PGP SIGNATURE-----

--gJNQRAHI5jiYqw2y--
