Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7C03D74EAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 10:27:32 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id h5-v6so15418898wrm.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qPqhEmeLyq2dI3lBZuwKN8b+QRzrUj+g1Oa4iv/3ZYk=;
	b=q57Rtrniwj3Z7exc6Y16/nQayfrQsG5Wc1bdPpBlo+Ag9xZjnrg4DaPGEjjEnAn01T
	9KyzUtbwUbujDuWKGzGza/tUdckY5ThtyICdU9MPfDp/K3zswb8Vl+nGFHtifCelQhB7
	EqYMQfFkJ+jldYF3IcYiFWm0nC3s4fzkE/W2htwd2SvktTJeKo1FoF6ZX3BTgZSkFzUT
	epsasEgQbwgXokDdzlt/AdBtdLib5M/1AacAaIUupSojMaisDvS+reLUbuZSv6rJc5Ej
	Vj5Psd/LD6SFBxDSNX/UtAipiW5TdRehGKcuLZZ3QH80S3GAXQvr41QYUi1M/VwSA3g1
	gk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qPqhEmeLyq2dI3lBZuwKN8b+QRzrUj+g1Oa4iv/3ZYk=;
	b=dDZOIPVjaU7pYpP6Hp11wrE7d6RYyaW4HkKDXcej8is2YfC54I5DRObViAhriJy+9K
	/TtizB0Swu+pWd8PAtAGYKFD+adPWTSiwp/96OfU096o85Jm3uDjmVMW7j3OnqhpHmSY
	eT7iOLP7tBC8Xcbb3cmwrtz3Y8fdMvCc2Wrg4ySduwvuOCNUsLFSNRcp1jzgIH4tIM7L
	pz2Jc2Xu0ZJ4utsARCv9gGDrwAkNevTffcIVg2NR5XiXKjuke34l2HUQadro2TLbeiqg
	IfIABj7iUujU/lRf6NPEFzAwR/vRbW911Tk/wgMxZAmsbXONsrv+4bSnVWN4Cwkfh1Le
	Ecqw==
X-Gm-Message-State: ALKqPwecejijDa5G6HnlJgx0P6recNsG/xrJStBf8DgYoG3oZ1v8uVui
	2WkQDTOm7mryu3PPBKsWFgM=
X-Google-Smtp-Source: AB8JxZr8Bb831xCDeQfUI3NdZ8RPCcxvONRo6/8Aie8iJJaO74NI5BofulDieL0/ct7QexN1hbeoxg==
X-Received: by 2002:adf:ae59:: with SMTP id
	u25-v6mr9918562wrd.157.1526380053018; 
	Tue, 15 May 2018 03:27:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z192-v6sm25728wmc.10.2018.05.15.03.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 May 2018 03:27:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 May 2018 12:27:33 +0200
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Message-ID: <20180515102733.GA1892@jama>
References: <20180515101519.5413-1-hongl.fnst@cn.fujitsu.com>
	<20180515101519.5413-2-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20180515101519.5413-2-hongl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] openwsman: 2.6.3 -> 2.6.4
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
X-List-Received-Date: Tue, 15 May 2018 10:27:32 -0000
X-Groupsio-MsgNum: 72174
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 06:15:19PM +0800, Hong Liu wrote:
> Upgrade openwsman from 2.6.3 to 2.6.4
>=20
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../openwsman/{openwsman_2.6.3.bb =3D> openwsman_2.6.4.bb}              =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.3.bb =3D> openw=
sman_2.6.4.bb} (97%)
>=20
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb b/meta=
-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
> similarity index 97%
> rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
> rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
> index f618f02..f46a3bd 100644
> --- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
> +++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
> @@ -15,8 +15,8 @@ DEPENDS =3D "curl libxml2 openssl libpam"
>  inherit distro_features_check
>  REQUIRED_DISTRO_FEATURES =3D "pam"
> =20
> -SRCREV =3D "feb7ec9b004fcaea0dbe65ce8a1a79cc29dd994c"
> -PV =3D "2.6.3"
> +SRCREV =3D "4aff7eaf5df948b6ed74cf4f8dd721a397bfb759"
> +PV =3D "2.6.4"

This PV is already set from the filename of the recipe.

>  SRC_URI =3D "git://github.com/Openwsman/openwsman.git \
>             file://libssl-is-required-if-eventint-supported.patch \
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvq2FAAKCRA3VSO3ZXaA
HD1UAJ9B+BGmWiUcW2iH4ommSJ1xTAqS5QCgjTRn9SiP7WlNSMjLhAtqZPRlElo=
=NBZ2
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
