Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 87C5873CC5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 13:45:35 +0000 (UTC)
Received: by widjs5 with SMTP id js5so64973042wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DnrayKGGkdDLEP3P7LDtxAveJazJNa5HfljT1+e/MwE=;
	b=OqNjcJSLQdfrEJgNnB8alwX0o6OZyShkluxZ+pPx0gwHnsDhT6xjx3qh/2ikaZZEF0
	9ztAM4bziTX5J21CQ/Rv1/XpoSx6Gv+rMh8ZDe0aDbyxW5XsAuevdQG+VgCKkXJOetbd
	YMQeLdlxKV6BxMmBY7WJWTxcylvTVKavT0aVt5HONtaC6e5EZtskdUK6OLIaZh/2uVNn
	jmhW1mST9EoAor66ck0jWjpV3Yazs5rH9i05+wwR7uAvPdmU54uh8UYMJgv5ehFZ16AY
	MHFbgzYbheZdic9CBpuAFPjzkosGn/S2KhHYzcQD5R6FHhxUpx5tt2Kz9dZSdIv8/4PE
	vGIA==
X-Received: by 10.180.84.201 with SMTP id b9mr21222295wiz.49.1428932736641;
	Mon, 13 Apr 2015 06:45:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id n8sm11575258wiy.19.2015.04.13.06.45.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 06:45:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 15:45:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150413134540.GG2330@jama>
References: <CAP9ODKpdtB_kq173kcoURafhoNGTmQqU2i-RabmG9fJro6KOOg@mail.gmail.com>
	<1427990643-16120-1-git-send-email-gary.robertson@linaro.org>
	<1427990643-16120-2-git-send-email-gary.robertson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1427990643-16120-2-git-send-email-gary.robertson@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH V4] libhugetlbfs: Add i586 to list of compatible host architectures
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
X-List-Received-Date: Mon, 13 Apr 2015 13:45:37 -0000
X-Groupsio-MsgNum: 55066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uc35eWnScqDcQrv5"
Content-Disposition: inline

--uc35eWnScqDcQrv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2015 at 11:04:03AM -0500, Gary S. Robertson wrote:
> COMPATIBLE_HOST included support for x86_64 but not for
> 32-bit x86 architectures - added i586 arch name to cover qemux86, etc.

But it still fails for qemux86 :(

http://errors.yoctoproject.org/Errors/Details/9749/

Please fix it ASAP, because I've already merged this change before
noticing this new build error.

Thanks,

> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 4ce6a19..6fe5dce 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -24,7 +24,7 @@ SRC_URI =3D "git://git.code.sf.net/p/libhugetlbfs/code \
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> +COMPATIBLE_HOST =3D "(i586|x86_64|powerpc|powerpc64|aarch64|arm).*-linux=
*"
> =20
>  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
>  LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
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

--uc35eWnScqDcQrv5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUryIQACgkQN1Ujt2V2gBwtgQCfetBKqGI9t/XcBHaifjIDN8dX
UTsAnRgNc1Z837RdzJxo0FfMoWv1D7Mj
=bOyx
-----END PGP SIGNATURE-----

--uc35eWnScqDcQrv5--
