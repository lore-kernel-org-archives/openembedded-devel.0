Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEAD6FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 17:24:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l6so7203158wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=57IhvapqWwrkERbw2uDmszGAsHiPWM9yNNcV7keP+Fc=;
	b=mASTFkA8b7RYjIrLy1Kf35ShRuj/ChW5cD0QbrR/FA7IHtbTXM04vWsw5MvBWS1Iin
	J7TSbMguyEb3nefh+vSfCkIYKGLlGjOrmXBbcFH8O0Le0w6ag9okqvmFBianqha7qrCp
	E3IGQkjFkqune1ROpDfZ0Ark5GJGRvQEBSTzH2ARdgdhweT0NeCOiaB23YiF3aCXNoou
	Yv2nSMP4vJZafIh/2Bv4dvTiEI2Uksz/i8dMxmr5Ij3KjVH3eki/QQ82EB5FCLE0ukU9
	yWjJtODGtwR1OsjPLq2GohADfKlDHiCeqY5Q3UbT+gOHMYkloMrEwrYImWcJDcNv4aOp
	evwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=57IhvapqWwrkERbw2uDmszGAsHiPWM9yNNcV7keP+Fc=;
	b=btOWoHcOwDw4wzFIjMzIn9EOPZumP8tClp1itR9nUaEwkztl0CIVX46FGB8YzyiBR0
	MC/3xgyAxOv6SoUV/EPy9NRL7F7Joq9iq3xdDsPxLOVJNEpay3KH11xdAafUjnzx4kVn
	HzqLuWlmmK6n2XxDyzXGA+5mADLR7aGx5wdSioqLMRrBaP66kgdnRDjMzg9a3W6nVWOS
	Q6ztSEGsvAEhu8n7DH069imGO8rTvGCk2bdSvcRVgE76ABWh4AABwiI0wWyPeNMF/9Aw
	USdip69Se2J/CTRQR9bpQ0xngkdr0B3eZJTYDEvv94XDgJZDwfoEilv6kQHo5US4OORf
	PTrg==
X-Gm-Message-State: AOPr4FX4XhmLJlt8ZLAnhBtYCi5fX3ewYZJbhQPnUMv9qq3rxOg1oPFDpE4f84cZqRB6+Q==
X-Received: by 10.194.186.242 with SMTP id fn18mr5491715wjc.65.1460481848427; 
	Tue, 12 Apr 2016 10:24:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n3sm34279428wja.6.2016.04.12.10.24.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 10:24:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Apr 2016 19:25:39 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160412172539.GE2564@jama>
References: <1460473156-25279-1-git-send-email-adrian.dudau@enea.com>
MIME-Version: 1.0
In-Reply-To: <1460473156-25279-1-git-send-email-adrian.dudau@enea.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] Revert "umip: blacklist"
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
X-List-Received-Date: Tue, 12 Apr 2016 17:24:10 -0000
X-Groupsio-MsgNum: 60972
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline

--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 04:59:16PM +0200, Adrian Dudau wrote:
> This reverts commit d82b0d8f638d1e1c7d9175605eadabfb99a6d345.
>=20
> The SRC_URI is up again, no need to blacklist the recipe anymore.

What about the second part with gram.h, that's not related to SRC_URI.

> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  meta-oe/recipes-connectivity/umip/umip_1.0.bb | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/reci=
pes-connectivity/umip/umip_1.0.bb
> index 41e5340..76901ab 100644
> --- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
> +++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
> @@ -16,5 +16,3 @@ S =3D "${WORKDIR}/git"
>  EXTRA_OE_CONF =3D "--enable-vt"
> =20
>  inherit autotools-brokensep
> -
> -PNBLACKLIST[umip] ?=3D "BROKEN: SRC_URI seems to be down and build from =
premirror fails to find gram.h, see http://errors.yoctoproject.org/Errors/D=
etails/56158/"
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

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcNL5EACgkQN1Ujt2V2gBz1rACgjE62UnQGQb1XMvAtsHiv25Qv
9aQAnRVejcSEWmRBx4W+SwQaH/UGS0ZE
=v27c
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
