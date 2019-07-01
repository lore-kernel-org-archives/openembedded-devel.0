Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id DAF1F7E830
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 10:55:33 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v14so13299325wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2019 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XeXbpi2jfU/qG5FgSiO2llMPWcfrjtjf1KGhFJtzSUw=;
	b=XjWcI24YP+hUpXtimPAHAljayDEMLvhFIhGZgxKc34OCd/h2Nuuu0dR6pD8y6pF732
	Sd5VlBtEweFlHG1dBnaL7Ai3MCxZIrEM/rqcQvvGGbAiGvTAuCfqOXWVAN9LcnZepCsX
	GaP46nEkyspcCKB7feGCLNWlRcFAW2n++XoJHOvyY8qvms40Q17MXkvC9MMAOFa8FEXm
	SPycx5NdPG3RmJr7EaItR7qPC3tolgbVfCBLQupcaaDNL16HgrEzxgbSpS7zjTnPFq8U
	0O5/FhayTZbW8WOm9A89L4qx179caNBbULs0PYxoWaNP3T/EgJ8rhYIzLee4EjbgOxfC
	UabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XeXbpi2jfU/qG5FgSiO2llMPWcfrjtjf1KGhFJtzSUw=;
	b=BB3TB5rk2uFiXcrFTgnc/9g/zY71rhmheH65L6Q8ZhgmA0D539plOPP0SQiPg3WSHO
	lfSCEHX0fqp7/nwqG6BnkIb2+Ub+BMFqc/hHqbmxyO5gxDye/4LtpWRinBLSZ60XsGuN
	aH4R6c84LFQFF41ntEdbSO7APhcX+6kzd2/AnAv5GnTMmJXkEAjeLW9nGQhQffdVmPOa
	6G0lakW/jv9DLRxzazQcoTlJuxE0nlBcFGy5OOLzKURBjI6zRh/H7SPf7QT+7QznRt3x
	8MIFb+k1y4L15wTGFMxyTfTm3CB+/pUrFOcnu+3jg5sMcKsm5QA8MRgGnksaoFj5stCH
	mHrA==
X-Gm-Message-State: APjAAAUnN6AaFeUTCV4zC4sSbehazDqh2rxzbrbup7KE8g7uhQMo+w4C
	n4iGoYQn0/wtqv802UOgmACTxVpI
X-Google-Smtp-Source: APXvYqwqACxxmMl47eU3XGPcILuKM7zZagzh0l3jbcTPuAWx4ULrZHgvoguHlD1XWRZw4LBVjUDTTg==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr17319963wri.213.1561978534482;
	Mon, 01 Jul 2019 03:55:34 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j7sm13977018wru.54.2019.07.01.03.55.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 03:55:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Jul 2019 12:55:35 +0200
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190701105535.GA1508@jama>
References: <20190630215007.13328-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190630215007.13328-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] sethdlc: set PV in filename
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
X-List-Received-Date: Mon, 01 Jul 2019 10:55:34 -0000
X-Groupsio-MsgNum: 78319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2019 at 11:50:07PM +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../sethdlc/{sethdlc.bb =3D> sethdlc_1.18.bb}                   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/sethdlc/{sethdlc.bb =3D> set=
hdlc_1.18.bb} (94%)
>=20
> diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/me=
ta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
> similarity index 94%
> rename from meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> rename to meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
> index fc304fae7..fa9399310 100644
> --- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> +++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
> @@ -5,14 +5,14 @@ LICENSE =3D "GPLv2 & GPLv2+ "
>  LIC_FILES_CHKSUM =3D "file://sethdlc.c;endline=3D10;md5=3D90f936879e9f8b=
755a138aeb348782eb"
> =20
> =20
> -SRC_URI =3D "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18=
=2Etar.gz \
> +SRC_URI =3D "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-${PV=
}.tar.gz \

${BPN}-${PV} -> ${BP}

>             file://sethdlc-fix-host-contamination.patch \
>  "
>  SRC_URI[md5sum] =3D "9016878156a5eadb06c0bae71cc5c9ab"
>  SRC_URI[sha256sum] =3D "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706=
bd5b3d4f6ab6b04e"
> =20
> =20
> -S =3D "${WORKDIR}/${BPN}-1.18"
> +S =3D "${WORKDIR}/${BPN}-${PV}"

This is the default value, you can just drop it.

>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  DEPENDS =3D "virtual/kernel"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXRnmpgAKCRA3VSO3ZXaA
HNrSAJ40jmLJOcNGHm11K+RUTve5jKWhIwCfSwZrCIB8ZyePmkfBcQegI+AuX4Q=
=x7zP
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
