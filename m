Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 754C57727A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 12:34:46 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id j10so27475590wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 04:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=G85u9hbUzgKKYwj/Hnaa51DMVXODzBGIt+LW/RQtjZk=;
	b=E0gboHnp/pqw+7kZdcUcKCgMiEFQ3Lz7XfMCbSD/+sw0JrlD8olbLrEngcjNqTQ58w
	Rf47iSBp7572C+j3uxzlrngIYA2UCTyGavLuW5RbUcpo89gw0Fo5rXneXlluX7A1DIpW
	YHR771OxjGYzLedRaf3u9KCz0h/zV8PLI2voTfxgK0bZbhDhNFytmxin/9yYXMAQn/FV
	Hr1zUV9EIwqOW93j2aXCoY7I2y223gBgsg692PugGv2pYUeG8HO5nNpa7pjWpftUjgUY
	15VH6SU7+Nne59uxMbDkWiqY/LBL7QgOLAi2VnkLjkGce17SoIEgAdmDByIuGUVZ3MzX
	QBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=G85u9hbUzgKKYwj/Hnaa51DMVXODzBGIt+LW/RQtjZk=;
	b=fkYHrT8yV0+eauMiiAaLKZsj/RLm2XltWbYIdDJSYQKZai2gGwVk09ySHiyTrl0io/
	ywU5yYTtpJ5LJKgXdD4JtVAWG7csYomJLsiIZxhhgbtdTwocTTUGPZ+kwD4F79aLt4Ur
	yp+i1Y39kbS7mWHwTx2IUiKm5E+Z6gsey0MXWscRG6Y2W3DffSSc5e2lE8IioZL2w589
	awkstp9vR4P48BP9mTnVfJ8Qu8rHXKdIWXo387xp/tK9moFVaUP4z/IXC95GlY0m1bR+
	fhLpRfFN3KiSGhEOXdGQNWq7BtTmpuX7U47Mrt86UQIEk9VJaQLJTFN2ZmZlbHete2/j
	wf2A==
X-Gm-Message-State: AIkVDXL9JREr9LbHEuI13BBf2LzeBKgflEWYiJmHQ8wlXsOb0/CrG/xy0F/iTuDa3LSqfQ==
X-Received: by 10.194.52.42 with SMTP id q10mr17488145wjo.50.1482237287247;
	Tue, 20 Dec 2016 04:34:47 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ei2sm25309703wjd.47.2016.12.20.04.34.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 04:34:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 13:34:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161220123446.GC3275@jama>
References: <20161216221033.18446-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161216221033.18446-1-raj.khem@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH] hplip: Fix build with clang
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
X-List-Received-Date: Tue, 20 Dec 2016 12:34:47 -0000
X-Groupsio-MsgNum: 64432
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2016 at 02:10:33PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...de-cups-ppd.h-for-missing-ppd-definitions.patch | 42 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-incl=
ude-cups-ppd.h-for-missing-ppd-definitions.patch
>=20
> diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cup=
s-ppd.h-for-missing-ppd-definitions.patch b/meta-oe/recipes-extended/hplip/=
hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
> new file mode 100644
> index 0000000..f259b5f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h=
-for-missing-ppd-definitions.patch
> @@ -0,0 +1,42 @@
> +From 7ef9c040dd959105c16d4dc67e14f3bbea25e77f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 16 Dec 2016 19:51:19 +0000
> +Subject: [PATCH] include cups/ppd.h for missing ppd definitions
> +
> +Fixes errors spotted by clang
> +
> +| prnt/hpcups/HPCupsFilter.cpp:365:18: error: use of undeclared identifi=
er 'ppdFindAttr'
> +|     if (((attr =3D ppdFindAttr(m_ppd, "hpPrinterLanguage", NULL)) =3D=
=3D NULL) ||
> +|                  ^
> +| prnt/hpcups/HPCupsFilter.cpp:368:13: error: use of undeclared identifi=
er 'ppdClose'
> +|             ppdClose(m_ppd);
> +|             ^
> +| prnt/hpcups/HPCupsFilter.cpp:444:9: error: use of undeclared identifie=
r 'ppdClose'
> +|         ppdClose(m_ppd);
> +|         ^
> +| prnt/hpcups/HPCupsFilter.cpp:497:13: error: use of undeclared identifi=
er 'ppdOpenFile'
> +|     m_ppd =3D ppdOpenFile(getenv("PPD"));
> +|             ^
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + prnt/hpcups/HPCupsFilter.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/prnt/hpcups/HPCupsFilter.h b/prnt/hpcups/HPCupsFilter.h
> +index 0431a7a..eb0cad6 100644
> +--- a/prnt/hpcups/HPCupsFilter.h
> ++++ b/prnt/hpcups/HPCupsFilter.h
> +@@ -37,6 +37,7 @@
> + #include "Job.h"
> +=20
> + #include "dbuscomm.h"
> ++#include <cups/ppd.h>
> +=20
> + #define		DBITMAPFILEHEADER		14
> + #define		DBITMAPINFOHEADER		40
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/rec=
ipes-extended/hplip/hplip_3.12.6.bb
> index 9848e5a..1f1e80c 100644
> --- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
> +++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
>             file://fix-libusb-paths.patch \
>             file://cups-1.6.patch \
>             file://configure.patch \
> +           file://0001-include-cups-ppd.h-for-missing-ppd-definitions.pa=
tch \
>  "

It failed to build even without clang (when using default toolchain),
but this patch fails to apply:

http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuar=
m.20161218_140914.log//2_max/failed/hplip.log

> =20
>  DEPENDS +=3D "cups python libusb"
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFklZQAKCRA3VSO3ZXaA
HBxsAJ44J2eZRDRAfd0jnfhqfq1EFZJSgACfdXZZBkyP0VobYb8v4QkCwZoli+c=
=2kdz
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
