Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 92A1B7787D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 10:19:15 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n11so26711584wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 02:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ADpcwJLNXXScwcL+QLwU1t1ccwN/J7no2xPDIrqpTN8=;
	b=d/3kiDyAhqGHtjWRoOcU28SejaE3wHub4AZNkpI5Vo/2SaKBJGh5ekbwY9s1LlJlqc
	K5sujSVNCAoCTBlRWui9Y/mvXRc3LWzvccPCRFRlICz2SqF9T8bXUDrFc6ww7lfyBc3A
	zS9PtEY+2zHwJGEJaSMMOondVhFJYrmwPBTCiSoV8hgk7+I3RlPf/NSud68M5fj+uu5h
	7TtBIIAPtn0loX1WnCxGFrJ0M3QeCx8BJOHsk/yAcgPb12J6rfj6gUFyi8agfXd8ZFs5
	RvL7bJauD8tzUYj+Efm8WU/rBiXwCHgQSFq7qQecvO7Zf6wOfvYpAND5Orcm5W40vJ47
	utYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ADpcwJLNXXScwcL+QLwU1t1ccwN/J7no2xPDIrqpTN8=;
	b=W6HHJv5D2uD5BDQ2EX/D/mlIrFKVJSDUXBUj/jyhUIiZn6DRAy3Ymzcaf1iZ3x3A1A
	KGgav21gDO+pBlEhQjc51Jhcy8/zUqZ8qxo8tNPgglc81gavIlHuwy6uWX11UV6hnwD5
	pOUD4iqjkcXrHHVk8VawXcIM/PImESVN0UknrODg7IG/1JnbzFZLu1R2cdeT4TrmyJx4
	VulyK4KC1c5z/khFAWolb7TdRDYOLixQlFXGi3uK3QsTtZIGsHOYm/jh7nbvlExpsQ4E
	HRoQolbZul+oy/HDxcFBsecmemqKybtkeAWZdf03nQq+Qi7sU9+BKnUoPc7RKoaH8dXG
	FF9Q==
X-Gm-Message-State: AMke39mAPhpr23pHjcWu+m4M5jRvErsBeBynrrnz3iy4pElzBuPKQipHxnzT0QbtfJR9lQ==
X-Received: by 10.28.19.78 with SMTP id 75mr23690886wmt.108.1488968356247;
	Wed, 08 Mar 2017 02:19:16 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s17sm3554783wrc.25.2017.03.08.02.19.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Mar 2017 02:19:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Mar 2017 11:19:15 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170308101915.GD3279@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-11-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170307071349.16444-11-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 11/14] rapidjson: Update to 1.1.0 + git
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
X-List-Received-Date: Wed, 08 Mar 2017 10:19:15 -0000
X-Groupsio-MsgNum: 65723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline

--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 11:13:46PM -0800, Khem Raj wrote:
> Drop backports
> Adjust the license checksums to match the changes to file especially
>=20
> https://github.com/miloyip/rapidjson/commit/b4b1a39937fbd168ef72ea477f90f=
626773d56fc
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../Fix-gcc-strict-overflow-warning.patch          | 30 ----------------
>  .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 41 +++++++++++++---=
------
>  .../{rapidjson_1.0.2.bb =3D> rapidjson_1.1.0.bb}     |  7 ++--
>  3 files changed, 28 insertions(+), 50 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-=
strict-overflow-warning.patch
>  rename meta-oe/recipes-devtools/rapidjson/{rapidjson_1.0.2.bb =3D> rapid=
json_1.1.0.bb} (74%)

Fails to build here
http://errors.yoctoproject.org/Errors/Details/134816/

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWL/aowAKCRA3VSO3ZXaA
HDWwAJ0U1+Wr52FPGY/kG7HExWFrGjHtlgCghSqSTfe+SECkTrfEpdc3S0ltT9Y=
=z+HY
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
