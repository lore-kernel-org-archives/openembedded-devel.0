Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E7C08766F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 13:47:20 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so240225944wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 06:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2EvLTtPB6bSe6Ax/gSuGBQrrs/xpqqvKOh7jvR4PGPc=;
	b=hF8N2vH9YhVbe2FzGB06o2uEqOuRKdZlpymb9uIES+yN8MxUHhQi+Yuk9y6gesNvGQ
	Di3WFS/2C3jAyiWaG0cTY4M1IPxZBo6kKPhnin1q8QRW3gHykAFP1KsClGWB54i1co+E
	/FkTj5RDxBKKMnOmP00vdjEYSfeMklMk9GPC8VdUYTnHvl4PZZASUi9Ov/Yk5DivbnkS
	TInXznM/hMamw6+8fu9CeCgEZMIh9XC5F5VTGlVbAkTOOlDRhJDG8ylPgFow8Qq378E5
	Kx7u45NrlTYQZoGmotWcWPKUf0ikRQBCs4Hc2m4iFxFHm0QiRLhcqjSH9eaIrkALHsz3
	2shg==
X-Received: by 10.194.5.135 with SMTP id s7mr30461813wjs.153.1443016040795;
	Wed, 23 Sep 2015 06:47:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id go2sm468587wib.20.2015.09.23.06.47.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 06:47:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Sep 2015 15:47:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150923134730.GC2384@jama>
References: <1442999044-30163-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1442999044-30163-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] p11-kit: remove from meta-oe
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
X-List-Received-Date: Wed, 23 Sep 2015 13:47:24 -0000
X-Groupsio-MsgNum: 57510
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline

--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 05:04:04PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Remove p11-kit from meta-oe that there is a newer version in oe-core.

Duplicates:
commit ad2932486ddf37b28fade4f4fd12c0c3fdb6df7a
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Mon Sep 14 15:26:44 2015 +0300

    p11-kit: remove the recipe due to its move to oe-core

which was already in master-next and now is in master.

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
>=20
> diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/=
recipes-support/p11-kit/p11-kit_0.19.1.bb
> deleted file mode 100644
> index e0ebe7d..0000000
> --- a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY =3D "Provides a way to load and enumerate PKCS#11 modules"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D02933887f609807fbb57aa4237d14=
a50"
> -
> -inherit autotools gettext pkgconfig
> -
> -DEPENDS =3D "libtasn1 libffi"
> -
> -SRC_URI =3D "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "d96046ab6ac00d005342caf416ed76ab"
> -SRC_URI[sha256sum] =3D "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b7=
9a1a3b4cf36ed256"
> -
> -FILES_${PN}-dev +=3D " \
> -    ${libdir}/p11-kit-proxy.so \
> -    ${libdir}/pkcs11/p11-kit-trust.so \
> -"
> -FILES_${PN}-dev +=3D "${libdir}/pkcs11/*.la"
> -FILES_${PN}-dbg +=3D "${libdir}/pkcs11/.debug"
> --=20
> 2.4.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYCrXEACgkQN1Ujt2V2gBy53gCffyieOe+XHwUu6WylO4xsUbZK
q5EAoJn6YNs77tIhvCaIIlH+n3yjqW7L
=EFFo
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
