Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7063D65DDC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:45:00 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2915128eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PUeRlt8f+qZdjulrPYy6FYOVpwt0iyaLENDUjWCjxeg=;
	b=DNNA2Ws3mGysdAYQiNiPrZaoUqVaeFlLJ/WbNnULhzxcUYJoxGB5V0NOEntDw64Zj0
	e1lWh38rzR6ktsZ9asn320SpMq/jIsz5NxdvZX2Owod3qad2PNF6BloiHhjcbjsZon+0
	H8GeC9fs1X6Pxq8Y3MGQfTXy6YLmecgzQ3861TOSVf92i2/15WMb3ztlW6qbtKItG7LA
	y6ir1XD1J9enDJBUdxOp2lg/+JH6F5CHpJCNXIvA27eRarb4B1SCpp99nwo1YUdkAMyJ
	PRckagYFJ+c1pyIJ0MGcvMLsb+hZ59iw2nuAM4nE09tZKWE1nTE54Sbl6wQAflqr7ZhU
	qiMA==
X-Received: by 10.14.176.193 with SMTP id b41mr37979984eem.55.1397994301667;
	Sun, 20 Apr 2014 04:45:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cb5sm93933250eeb.18.2014.04.20.04.45.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:45:00 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:45:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140420114505.GY2486@jama>
References: <1396244397-4124-1-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396244397-4124-1-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org, patches@linaro.org
Subject: Re: [meta-oe][PATCH] utouch-evemu: force serial build
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
X-List-Received-Date: Sun, 20 Apr 2014 11:45:03 -0000
X-Groupsio-MsgNum: 49332
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DHs1QIiRxKbdokJu"
Content-Disposition: inline

--DHs1QIiRxKbdokJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 01:39:57AM -0400, Trevor Woerner wrote:
> My build always fails if allowed to build in parallel:
>=20
>     | make[2]: *** No rule to make target `evemu-record.1', needed by `al=
l-am'.  Stop.

I'll take this as temporary solution, but please try to fix the Makefile
and remove PARALLEL_MAKE.

> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-oe/recipes-support/utouch/utouch-evemu_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe=
/recipes-support/utouch/utouch-evemu_git.bb
> index 0efe79e..1dd5a86 100644
> --- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> @@ -13,3 +13,5 @@ SRCREV =3D "9752b50e922572e4cd214ac45ed95e4ee410fe24"
>  PV =3D "1.0.5+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git/"
> +
> +PARALLEL_MAKE =3D ""
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DHs1QIiRxKbdokJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTs0EACgkQN1Ujt2V2gBzaTACePTTfjM7AX/3lA5xxr9AUjacg
H1MAn0QxMbLp0TToNuKApYrfLAbJKWmV
=bPnL
-----END PGP SIGNATURE-----

--DHs1QIiRxKbdokJu--
