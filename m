Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C136A73176
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 16:19:34 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l126so72135497wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/PauzqRf7hSJJgq0nz6jELsLMsRM5UHAtUL7M7Zxc+w=;
	b=VRW/1IQpx4PvAUeSFK3+6Dsol0lhrARPrLaLyFGx+9HHkqmGFJol9P6NLhi4f/KX/t
	QMGoCxV6sG/a2EFJCFInsSjLcMZuG/srapHTW6acpJoZFN0IFFIvzw8CofPOL4KBqDN+
	Q8zKnpBTtPC/onrEMg8ir05geK012H0WwFjSSuA7itqgoik+IrAJZLQ61XLKJ7b/pYz7
	juvkgkoRuxRCzTVH42DpqIvZBsCCbMVgFXZhz/SEUlMEOqHJGRErYMXWUV1mCzp4EzY6
	tb2F5Dcrm9YcB1NcRWQYhGZz3buLdtpRiHkVrn3vH99XVIzLT1jzCLcamgVfYaDJ3Ags
	7iAg==
X-Received: by 10.28.22.1 with SMTP id 1mr4272728wmw.41.1450455574636;
	Fri, 18 Dec 2015 08:19:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h67sm7261624wmf.17.2015.12.18.08.19.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 08:19:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 17:22:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151218162211.GA2556@jama>
References: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
	<1449130728-4066-5-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1449130728-4066-5-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH 4/4] meta-networking: depends on layer meta-perl
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
X-List-Received-Date: Fri, 18 Dec 2015 16:19:36 -0000
X-Groupsio-MsgNum: 59103
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 04:18:48PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Package mime-construct in layer meta-networking depends on some perl
> modules in layer meta-perl. So make meta-networking depends on layer
> meta-perl.

Cannot we move mime-construct to meta-perl instead?

It doesn't have any dependencies provided by meta-networking and also
nothing in meta-networking is using mime-construct.

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
=2Econf
> index 63bb07d..b7fc183 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -16,5 +16,6 @@ LAYERVERSION_networking-layer =3D "1"
>  LAYERDEPENDS_networking-layer =3D "core"
>  LAYERDEPENDS_networking-layer +=3D "openembedded-layer"
>  LAYERDEPENDS_networking-layer +=3D "meta-python"
> +LAYERDEPENDS_networking-layer +=3D "perl-layer"
> =20
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ0MWQACgkQN1Ujt2V2gByQuQCfTwzWlGpcroLL7MDeqted4YU+
Jm8Ani8DuWwkyLH10MZ5kDBG3lILQVdR
=+FcW
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
