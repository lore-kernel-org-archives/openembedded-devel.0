Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE5465CCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:03:12 +0000 (UTC)
Received: by wijp15 with SMTP id p15so18712725wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M/T6VKc5DtSVp/I0MfWYeoyOBKZoHZ3nUW0hdbPDmL4=;
	b=qSkmrnee80f8NO8FctRLj1LJPUh1iSkJ4dBqmZDu12pCejsd/AUYDbKVKN5oc5V/2O
	EOUBnfa9GPz3nuCpI4zJToM1FRKUE60WA13rjxy6D1are/PpRxW737tU76fkVDsc4wLK
	fNp3PbHZfzWOwCNpqkVyAjOhh4UZtf8hoPYIwQgUo4WT/MboNYAw6N5qMjWiwjS3z24D
	/DNrStRCi3i5h4bpmB5z0kqMmDZGBoA+0QcXJpPaitTIQp91tj9K1QCTNWVbZmht4I0M
	9cbmt0G9sCdwVyNbCxa6jdjgNKnpfLKqXypEVfXqEgfTaY/o09lnl1Ctoo9dxI4XoI1y
	adUA==
X-Received: by 10.180.75.233 with SMTP id f9mr13598634wiw.21.1440082992210;
	Thu, 20 Aug 2015 08:03:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id xs1sm5966078wjc.7.2015.08.20.08.03.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:03:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:03:39 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150339.GH2446@jama>
References: <1438568853-10554-1-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1438568853-10554-1-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][meta-python][PATCH] python-pyparted: update to 3.10.5
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
X-List-Received-Date: Thu, 20 Aug 2015 15:03:13 -0000
X-Groupsio-MsgNum: 56836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zq44+AAfm4giZpo5"
Content-Disposition: inline

--zq44+AAfm4giZpo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 02, 2015 at 07:27:33PM -0700, Tim Orling wrote:
> * Upstream changed from fedorahosted to github
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../{python-pyparted_3.9.bb =3D> python-pyparted_3.10.5.bb}   | 13 +++++=
++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>  rename meta-python/recipes-extended/python-pyparted/{python-pyparted_3.9=
=2Ebb =3D> python-pyparted_3.10.5.bb} (54%)
>=20
> diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted=
_3.9.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10=
=2E5.bb
> similarity index 54%
> rename from meta-python/recipes-extended/python-pyparted/python-pyparted_=
3.9.bb
> rename to meta-python/recipes-extended/python-pyparted/python-pyparted_3.=
10.5.bb
> index bfb4f6f..a89c897 100644
> --- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> +++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5=
=2Ebb
> @@ -2,18 +2,19 @@ DESCRIPTION =3D "pyparted is a set of Python modules th=
at provide Python programme
>  an interface to libparted, the GNU parted library for disk partitioning =
and \
>  filesystem manipulation."
>  SUMMARY =3D "Python bindings for libparted"
> -HOMEPAGE =3D "https://fedorahosted.org/pyparted/"
> +HOMEPAGE =3D "https://github.com/rhinstaller/pyparted/"
>  LICENSE =3D "GPL-2.0+"
>  LIC_FILES_CHKSUM =3D "\
>      file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> -    file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3D70c62bd737=
82a03f56a0571a9f08ea46 \
> +    file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3Debcb25dde1=
ac9c46e986dec79b404e7e \
>  "
>  DEPENDS +=3D "parted"
> =20
> -SRC_URI =3D "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${P=
V}.tar.gz"
> -SRC_URI[md5sum] =3D "f16c7ef7f5fa4a43fcb2a4654b487e39"
> -SRC_URI[sha256sum] =3D "a56712e3d058ce3d859c158236dbbf45224018919efd3d88=
0ea80f9e0d0bebbb"
> -S =3D "${WORKDIR}/pyparted-${PV}"
> +SRCNAME =3D "pyparted"
> +SRC_URI =3D "https://github.com/rhinstaller/${SRCNAME}/archive/v${PV}.ta=
r.gz"

Don't use github archives, they are regenerated from time to time with=20
different checksums and they have stupid filenames (prone to collision=20
with other recipes).

> +SRC_URI[md5sum] =3D "b303caf8e907a2541e71aa492494b5e5"
> +SRC_URI[sha256sum] =3D "8cbaf024fbbc73cdceab2eac0937035052da48295970fe9e=
aa84b19d8e353e19"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> =20
>  inherit distutils
> =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zq44+AAfm4giZpo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV7EoACgkQN1Ujt2V2gBzEZACfbvKYwh8+WQpLIsst1RJOfCJX
+dcAn14m5sl8yqMnCZAMX6x/NSlwtwo1
=xIha
-----END PGP SIGNATURE-----

--zq44+AAfm4giZpo5--
