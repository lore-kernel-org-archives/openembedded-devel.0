Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F67060071
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 23:05:34 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so10527335eaj.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 15:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lW2ZN5aai5xWPxszYWryvakRk91h097iBXa+Tuv4yX8=;
	b=zMu/Icgf+dXqieefkAYDXJzyxnFkHS4Zw43qAkZJM/eqGJ2xBx5cuAahTOggYFzcDW
	V2vJo2YKaBf2/3vhMHvYD57Glb+iEYMbRstGawM1RnNUw2GYNgVWbjEDztJsSVnpyOw1
	Jkx9SzLCkGilZXW+BgQoSLJwPjCeait8ZOaniMH/TG8WVeYozts7smSk7LOzpAZq6h8S
	AUHDbR+AkLKHkKVeSMpvb9Gk7JUPKRRKmymqAgg82OVJWs7VuT2+d9dWt4t+JK6DBuPC
	qXS+Gyk8PcYEnFoKgEsjz4EfnjIIWZyJUo0KFPXSyJNhNjY+zTKZLGrvHSWy/LnrV0cX
	swig==
X-Received: by 10.14.32.132 with SMTP id o4mr2225963eea.14.1386111932462;
	Tue, 03 Dec 2013 15:05:32 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm9059672eef.9.2013.12.03.15.05.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 15:05:31 -0800 (PST)
Date: Wed, 4 Dec 2013 00:05:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131203230542.GG3714@jama>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe 1/5] meta-oe: Drop pointercal-xinput from SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Tue, 03 Dec 2013 23:05:35 -0000
X-Groupsio-MsgNum: 47349
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Content-Disposition: inline

--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 07:44:03PM -0200, Otavio Salvador wrote:
> The pointercal-xinput has been moved to OE-Core so we should handle it
> here.

Is there patch for oe-core doing that?

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/conf/layer.conf | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index b50d1a4..2aa50ff 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -26,7 +26,6 @@ BBFILE_PRIORITY_openembedded-layer =3D "6"
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> =20
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> -  pointercal-xinput \
>    mplayer-common \
>    fbset-modes \
>    gpsd-machine-conf \
> --=20
> 1.8.4.3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKeY8YACgkQN1Ujt2V2gBxq7wCfRD7ym/o0KcnZ4UpdOfdsk9vd
uTQAnjwK4C75sXwG94kbF7B8yXOYEf4M
=8xMz
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--
