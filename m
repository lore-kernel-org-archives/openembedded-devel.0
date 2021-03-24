Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.1164.1616604319251812640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JAICUN1Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id u5so34005003ejn.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jJsmKXkg+QmQOL+Dgc2TodX3EvElN+Due28AHBVMePw=;
        b=JAICUN1ZfwzUA/j3UyWc+8t91OJnbH0JDYFfCUg8x1xQVQFn5PXyAAKf19oOPfOMXU
         jeETWEIOdFcZAfEFW3uPSXe51n6B5r50Cpq0P1yIXTNCuwcGtOkl281lUF/Vqutj+KKt
         G640lUjn7hlY89U4DDeERsgn8TCo4DXirk3LGPJchWkcaRiywT+iAklJkFdsXL7zdToK
         j+OI5vbwcv1rfzlwWNqz6xnZ+e/KsEZqzq8CzyK8EjbmLadY42PXpVUKONLhezySCPMW
         Uw+W2ZiAgsr805N62wI5D5/B5oE58iGXIkp6WFvbAerPXPYVqMN1vFsb3q6y2iK+OEwb
         6V3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jJsmKXkg+QmQOL+Dgc2TodX3EvElN+Due28AHBVMePw=;
        b=CxHPqAKKPMF2dmX+t78+kGc2GHcaL/8oO6MwRjn+ORfrNERVfFZF8zmy6inqLy4mMf
         QsPwPr3YJNom/Pp3mGHXqG8NpYJSJGXba+Pc/2uMgh+U0bst65z1caX3uNxPvbZZ6KHq
         4Or9Cdl0nZqC8mZnp1pC00BM7/fBJLaQxZuoypDGpJtXoWWbVMhOkGBN/iZAhZzvokd6
         AMkn3itDN8nKpibiyzdbk8vPLSx8dfRVaRo+IC0V0ID+iZYQ/HHTEqKYuWvL/ZvVdWOo
         YJ++/3gIUVtd0HKyCh7ryMaKgZjFcr7/hsji9u0VGe7pAuCEQAEGbaT3m9vbBdD4PkYx
         n5kQ==
X-Gm-Message-State: AOAM533tdFw4iIKDWxBwlnq1+mGEBTocG95v+sr6Sd73vNqucJtZydrh
	GgYMA3Xp5bKSgT49zsXzjTiTvvqrnmE=
X-Google-Smtp-Source: ABdhPJwWdKwuC/W5eIylh6u0oznHUl+laSrE2H9aIA1Rd/RegiYw7iX0cr7HUGAQ5x33z5umA2U5Sg==
X-Received: by 2002:a17:906:5e01:: with SMTP id n1mr4693988eju.359.1616604317704;
        Wed, 24 Mar 2021 09:45:17 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u14sm1151919ejx.60.2021.03.24.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:45:16 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Mar 2021 17:45:15 +0100
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Peace Lee <iipeace5@gmail.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [dunfell][PATCH] guider: Upgrade to 3.9.7
Message-ID: <20210324164515.66hjl3sewnnvxcch@jama>
References: <20210324104629.3484418-1-Martin.Jansa@gmail.com>
 <d762d887-e606-85bb-b8b4-81b795874d50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d762d887-e606-85bb-b8b4-81b795874d50@gmail.com>
X-Groupsio-MsgNum: 90308
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gcjyqag5knwthfc6"
Content-Disposition: inline

--gcjyqag5knwthfc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 09:09:50AM -0700, akuster808 wrote:
>=20
>=20
> On 3/24/21 3:46 AM, Martin Jansa wrote:
> > From: Peace Lee <iipeace5@gmail.com>
> >
> > Signed-off-by: Peace Lee <iipeace5@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> What is in this update? What about Gategarth?

This update is because this version from gatesgarth is where it switched f=
rom python2 to=20
python3, so that we don't need to skip it without meta-python2.

> > ---
> >  .../recipes-devtools/guider/guider_3.9.6.bb   | 39 ------------------=
-
> >  .../recipes-devtools/guider/guider_3.9.7.bb   | 19 +++++++++
> >  2 files changed, 19 insertions(+), 39 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> >  create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> >
> > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe=
/recipes-devtools/guider/guider_3.9.6.bb
> > deleted file mode 100644
> > index f059002161..0000000000
> > --- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -SUMMARY =3D "runtime performance analyzer"
> > -HOMEPAGE =3D "https://github.com/iipeace/guider"
> > -BUGTRACKER =3D "https://github.com/iipeace/guider/issues"
> > -AUTHOR =3D "Peace Lee <ipeace5@gmail.com>"
> > -
> > -LICENSE =3D "GPLv2+"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c1c00f9d3ed9e24fa69b932b7=
e7aff2"
> > -
> > -PV =3D "3.9.6+git${SRCPV}"
> > -PR =3D "r0"
> > -
> > -SRC_URI =3D "git://github.com/iipeace/${BPN}"
> > -#SRCREV =3D "${AUTOREV}"
> > -SRCREV =3D "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
> > -
> > -S =3D "${WORKDIR}/git"
> > -R =3D "${RECIPE_SYSROOT}"
> > -
> > -inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "d=
istutils", "", d)}
> > -
> > -GUIDER_OBJ =3D "guider.pyc"
> > -GUIDER_SCRIPT =3D "guider"
> > -
> > -do_install() {
> > -    python ${S}/setup.py install
> > -
> > -    install -d ${D}${bindir}
> > -    install -v -m 0755 ${STAGING_BINDIR_NATIVE}/${GUIDER_SCRIPT} ${D}=
${bindir}/${GUIDER_SCRIPT}
> > -
> > -    install -d ${D}${datadir}/${BPN}
> > -    install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVE=
RSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OB=
J}
> > -}
> > -
> > -RDEPENDS_${PN} =3D "python-ctypes python-shell \
> > -                  python-json python-subprocess"
> > -python() {
> > -    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
> > -        raise bb.parse.SkipRecipe('Requires meta-python2 to be presen=
t.')
> > -}
> > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe=
/recipes-devtools/guider/guider_3.9.7.bb
> > new file mode 100644
> > index 0000000000..2b799fd5e4
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "runtime performance analyzer"
> > +HOMEPAGE =3D "https://github.com/iipeace/guider"
> > +BUGTRACKER =3D "https://github.com/iipeace/guider/issues"
> > +AUTHOR =3D "Peace Lee <ipeace5@gmail.com>"
> > +
> > +LICENSE =3D "GPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c1c00f9d3ed9e24fa69b932b7=
e7aff2"
> > +
> > +PV =3D "3.9.7+git${SRCPV}"
> > +
> > +SRC_URI =3D "git://github.com/iipeace/${BPN}"
> > +SRCREV =3D "c87269d6d4669d12c99a2a7b9b07c39a5dd24ac6"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit setuptools3
> > +
> > +RDEPENDS_${PN} =3D "python3 python3-core \
> > +        python3-ctypes python3-shell python3-json"
> >
> >=20
> >
>=20

--gcjyqag5knwthfc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYFtsmwAKCRA3VSO3ZXaA
HNLYAJ95TE2IEgpVnTlBYOKxBSsK85Fk/QCcDs35x040PmAvrMQyy705sN1aza8=
=m2Qe
-----END PGP SIGNATURE-----

--gcjyqag5knwthfc6--
