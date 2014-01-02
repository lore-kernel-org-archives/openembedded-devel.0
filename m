Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 252706B5C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2014 07:57:22 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so6053113eak.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 23:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+Vcn0Hd2cIP4Mz1NHMgVuT6RUzNQoB+TJgTe5klgDbc=;
	b=JlPTeRUFoYREKrTumwx8Vf0XCNrAwcNhXFv/YBNgWA7WJxJ0jArZRPVtpjKit4C5wY
	i7GvsrwtnGgLeGopKA19N4L1WTAJIBlZ6GZCj0A4atCKHt/fTkKrDn4PV1vqIWWqGDdW
	9IhpQuRA49F5cIj6WRsGMGPElwmHC9waUMSZWt1EcNwW531k/9bj9R7bNSDLTrOp/h7C
	g4jVbiUS3U8LUV9ljzVuBGUjD3NEC/WgoSCdmVmw1lC3RPRFazt6tVr4qrvHDBnOi7Bz
	C8WL6530LsxS7hfhMQThSOiqfiit7I6oZcQwvzkD1f18PytP8fYN8V1flg1NNcGJK58a
	9/ww==
X-Received: by 10.15.53.4 with SMTP id q4mr330862eew.113.1388649442010;
	Wed, 01 Jan 2014 23:57:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	l4sm133686175een.13.2014.01.01.23.57.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 23:57:21 -0800 (PST)
Date: Thu, 2 Jan 2014 08:57:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140102075724.GC3717@jama>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
	<1388581046-8713-7-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1388581046-8713-7-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Kevin Strasser <kevin.strasser@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe][WIP][PATCH 7/8] ajenti: Bump SRCREV a bit got get revision included in some branch
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
X-List-Received-Date: Thu, 02 Jan 2014 07:57:24 -0000
X-Groupsio-MsgNum: 47563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 01, 2014 at 01:57:25PM +0100, Martin Jansa wrote:
> * old c08fb4da65923aebd09116750a1f43f13b98a51a exists only in 0.6.2 tag a=
nd latest
>   bitbake refuses to fetch it
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb b/meta-=
webserver/recipes-webadmin/ajenti/ajenti_git.bb
> index 83e92f6..f499339 100644
> --- a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
> +++ b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
> @@ -9,7 +9,7 @@ DEPENDS +=3D "python-pyopenssl python-lxml python-gevent =
python-greenlet \
> =20
>  PV =3D "0.6.2+git${SRCPV}"
> =20
> -SRC_URI =3D "git://github.com/Eugeny/ajenti.git \
> +SRC_URI =3D "git://github.com/Eugeny/ajenti.git;branch=3Dajenti-0.6.x \
>             file://0001-setup.py-remove-extra-data-files.patch \
>             file://0002-plugins-hddstat-fix-disk-usage-check-to-work-with=
-bu.patch \
>             file://0003-plugins-sysload-fix-to-work-with-busybox.patch \
> @@ -22,8 +22,7 @@ SRC_URI =3D "git://github.com/Eugeny/ajenti.git \
>  DISTRO_FILES =3D "file://distro-detection-openembedded.patch \
>                  file://distributor-logo-openembedded.png"

This one wasn't merged, because the patches need to be rebased, is there
someone who cares about ajenti and will test it properly in runtime?

Paul? Kevin?

> =20
> -# Corresponds to the 0.6.2 tag
> -SRCREV =3D "c08fb4da65923aebd09116750a1f43f13b98a51a"
> +SRCREV =3D "411acfd0b96ad7a9bd79b3bdc1f9eef394f62198"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.8.4.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLFG+QACgkQN1Ujt2V2gBzWNgCgrDHjLRSyDQGTgfXD/kwckFT8
mQMAoKXhIOePITF/WkWoWTy2D/WNY/OP
=RSNA
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
