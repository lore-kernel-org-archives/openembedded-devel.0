Return-Path: <joe@deserted.net>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id E573960167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:02:16 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id hn15so5717582igb.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=pBWAxm2elJSXYB8/ia7MSdaDmmUMzw6Oxd7X7LbEk+Y=;
	b=iiFX/8Qbwaa46k4Ub9aJLYulRarFJ/aVrZgftmfGT7qXkkpLs2UnG9fyZWaYgVr6AL
	A8ukUC4PqGKtGSt1UgQwK1wc+mzp8LQHsKqMDbO9vltDrx3TJnYg2HwOSqNEXP66ImYq
	+F+BCMMdh9lciyWcogxZRkG+cOi6y9myzRYI6zo7ZbGU7gtsgDDI2VMkLBxBixJc7w6A
	BOxuJenmX9IqASGEGX1/UxTmQztnsjFNCv4zyfy9a2rNdxdOBZYtKNlCGBxijAVfcrA3
	CcXDIk6GsFL3G1+51q0RhtKZtHVAbjen+00wgYROlZ6lg2TpmNZXMoro6qCnrWystH88
	f+8A==
X-Gm-Message-State: ALoCoQkRaxeZn3eQT0mhwfmSBvT+qEUj7VietQytq4iHiZAZEOmQQpdJXim6y9gpv9KQnsxjgIvD
X-Received: by 10.50.115.73 with SMTP id jm9mr8477945igb.3.1411524137444;
	Tue, 23 Sep 2014 19:02:17 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id ci9sm3160862igb.17.2014.09.23.19.02.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 19:02:16 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 74CD61685E4; Tue, 23 Sep 2014 22:02:15 -0400 (EDT)
Date: Tue, 23 Sep 2014 22:02:15 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140924020214.GA16953@deserted.net>
References: <1410563058-3288-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1410563058-3288-1-git-send-email-jslater@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 1/1] ptpd: update to version 2.3.1-rc2
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
X-List-Received-Date: Wed, 24 Sep 2014 02:02:19 -0000
X-Groupsio-MsgNum: 52202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 1/1] ptpd: update to version 2.3.1-rc2] On 14=
=2E09.12 (Fri 16:04) Joe Slater wrote:

> Add a little processing to find correct directory
> for source upstream.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>

Merged, thanks Joe.  I made a minor change to your commit based on
Armin's comment, but that's it.

-J.

> ---
>  .../ptpd/{ptpd_2.3.0.bb =3D> ptpd_2.3.1-rc2.bb}      |   23 ++++++++++++=
++++---
>  1 files changed, 19 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-daemons/ptpd/{ptpd_2.3.0.bb =3D> ptpd_2.3=
=2E1-rc2.bb} (58%)
>=20
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb b/meta-ne=
tworking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> similarity index 58%
> rename from meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> rename to meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> index 54679dc..2a23995 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> @@ -5,18 +5,33 @@ and PTP Version 2 implements IEEE-1588-2008. PTP was de=
veloped to provide very p
>  time coordination of LAN connected computers."
>  HOMEPAGE =3D "http://sourceforge.net/projects/ptpd"
>  SECTION =3D "network"
> +
> +# COPYRIGHT is gone, but maybe it will come back
> +#
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D4019cad2b3cd55f22ea819ffad6=
ccd41"
> +#LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D4019cad2b3cd55f22ea819ffad=
6ccd41"
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D2452033fe374283f29579898663b1a=
a8"
> =20
>  DEPENDS =3D "libpcap"
> =20
>  inherit autotools
> =20
> -SRC_URI =3D "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/pt=
pd-${PV}.tar.gz"
> +# return something like '1.2.3' or '1.2.3/rc1'
> +#
> +def get_sub(d):
> +    parts =3D d.getVar('PV',True).split('-')
> +    try:
> +        return parts[0] + '/' + parts[1]
> +    except:
> +        return parts[0]
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_s=
ub(d)}/ptpd-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "1ef2f1f2825080a865bbce0eb61246d4"
> +SRC_URI[sha256sum] =3D "2802aab758649bb222859dfcb62a5d282709ccb4d3f1df3f=
26f739cc091d0c8d"
> =20
>  S =3D "${WORKDIR}/ptpd-${PV}"
> -SRC_URI[md5sum] =3D "f5e931b4a229705ff0dbdfe22490566b"
> -SRC_URI[sha256sum] =3D "1a4e90496f004bfd91657ccc49209101dc25b787e540648c=
07c0973469f1d8f7"
> +
> =20
>  EXTRA_OEMAKE =3D ""
> =20
--=20
-Joe MacDonald.
:wq

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlQiJhwACgkQwFvcllog0XworQCgq4QJ79gFNkOm34Q21epkWOzJ
nQMAn2v6AtsrRUN84WT7bQSUrLGc323X
=xqGP
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
