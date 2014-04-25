Return-Path: <joe@deserted.net>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id EF2AC65D05
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:02:34 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id lx4so3070907iec.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=8Kl46L0BotnLquHaCTS2IjDZAfm/H3bya5FNdCbpRi8=;
	b=bf8zJeZZbWuFBtqvdj6O0r8e/XnPRCE5DEXL4J1/jztfird2Ogu2GsTv3zSI0tXPUs
	b26SRiMwNREk6eIRGcgOAOjTUREjOrMiQbMl9yiCdp9HJFLpdgPe4FHtjZ2cTrU+YxJ1
	XAPtbkmh0Qv5R/2iaBwGm1tGRQ/ZSc5JpTCF4XxYPT1oSikLUBc5Fd/gUtTjHxNQOx9E
	PCb3poWnsLPSUKaB9Tas3+YDdxPkUhBLBiFQ/kHFvpwUDgImlUicA8+GeXx5dTAD4pc9
	IG9ozvw5z4+oUMdGjnGIIwHwNrMM/TERxWSKU8GqBktGAf9zRlbgc4msPSTeqpikfgp+
	Bx0A==
X-Gm-Message-State: ALoCoQkIiA1SMS822pSU/vyzn/LqW/yIzUASgPCFqNA7y7x5dhwPGatzoMl0+4edXMv0ajoLKyqa
X-Received: by 10.50.12.100 with SMTP id x4mr1971185igb.15.1398387756132;
	Thu, 24 Apr 2014 18:02:36 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id s8sm3677117ige.4.2014.04.24.18.02.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:02:35 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:02:32 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425010230.GH10115@deserted.net>
References: <1398065845-2064-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1398065845-2064-1-git-send-email-koen@dominion.thruhere.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking][PATCH] dovecot: add libcap dependency
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
X-List-Received-Date: Fri, 25 Apr 2014 01:02:35 -0000
X-Groupsio-MsgNum: 49472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhtSGe8h3+lMyY1M"
Content-Disposition: inline

--zhtSGe8h3+lMyY1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] dovecot: add libcap dependency] On 14.04.21 =
(Mon 09:37) Koen Kooi wrote:

> This fixes:
> 	dovecot/dovecot/latest lost dependency on  libcap
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/=
meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> index 426e1c5..8528536 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "http://dovecot.org/releases/2.2/dovecot-${=
PV}.tar.gz \
>  SRC_URI[md5sum] =3D "037e9c9e07d9dbff54dcff09f280fc8c"
>  SRC_URI[sha256sum] =3D "75592483d40dc4f76cc3b41af40caa4be80478946a699d46=
846d5d03e4d2e09b"
> =20
> -DEPENDS =3D "openssl xz zlib bzip2"
> +DEPENDS =3D "openssl xz zlib bzip2 libcap"
> =20
>  inherit autotools
> =20
> --=20
> 1.9.0
>=20
--=20
-Joe MacDonald.
:wq

--zhtSGe8h3+lMyY1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZtCYACgkQwFvcllog0XwYywCggdbRk38qO3bIQs7/KgBRuNm7
2TEAn1huOkxADYjM8KsjfA97jOedERwh
=m8D6
-----END PGP SIGNATURE-----

--zhtSGe8h3+lMyY1M--
