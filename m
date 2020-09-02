Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.9983.1599005014524258695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 17:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHnRStPm;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id m22so4084564eje.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OPx9hF4kRqnXi/8uBbB/tnbr3ABgB0ViZdchUPnfk+g=;
        b=LHnRStPmI5Xrx8X8OazTYLXH0dBeATyqhEWTeMyk9yWmWRe/HgatbSBcGAzNdjK68H
         XmvqgAMnM2C1NJn4fxBIEqTx/cIy78FrICAacubpgVuFRMlOYYFpdp/PHbm4sEMKjVHe
         Ap4TTYHuap4ibEgR1TZcQ4aW8QHJa16VnHTUbncH+vVb+cBdeZ43MRMNC2bf6lhHUyfp
         SypISQ0jIF1/aEOpiRvRJaGTgwFw6cJmxF4fwO+bUtMKeKVrIPG/yLGZKVmfU6HaufpW
         ynlOfEA7bdovW+zeOfMmAg1tPDQHV5qGGJwCg5/eoM53/oC+E1kKKDkaIBp5JgwfDQwQ
         VezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OPx9hF4kRqnXi/8uBbB/tnbr3ABgB0ViZdchUPnfk+g=;
        b=IYHz/I69JYAu4mvl0JM50LAb/IHjHJd8mGOICo2U53eIcJnjtVSNCuM1n9oASLpN+k
         LTNb0nDTHm2eQK3VQm40wX40Aqg9OZd4+E2IoVCszu79uJXdQY50Q2PPuftn8OAYQIYC
         7tIz9aNsDRZlxD8tSlDfOKPHdrnvVgJw6elN/u4yBgp8wToMziIa3rxfnlO6YkPaG04s
         dXBtOjxtxn/+AqZFPd1n++BNlZiAboGjiqhX0NOc2i9vkot97RbY6r0yYwI+xt6Ve/u9
         DN+HCRSmgxZh16yOxRYcWk5sGO8rM3rN+I/D3ijfXBn5T6xbVQVNcMNneBWzefUsuMi2
         L3zw==
X-Gm-Message-State: AOAM533azP1y4ogjyFSHD0ihpGw6wAHLhIKtRucxqLkSXScni7zGxxlr
	FVds5/zDaP+rvjS8BchxcSk=
X-Google-Smtp-Source: ABdhPJxnLcmAPtFMUHaQuWxjylx8I1mmjrkp906lVhcIe19WkprVUzwFiGEhXkV5TDWa1PSy7BhQPg==
X-Received: by 2002:a17:906:8d8:: with SMTP id o24mr3717597eje.384.1599005012654;
        Tue, 01 Sep 2020 17:03:32 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z4sm747206ede.65.2020.09.01.17.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 17:03:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2020 02:03:31 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] nss: remove signlibs.sh
Message-ID: <20200902000331.lru5uw6phplqjws6@jama>
References: <162F7E2FF7270601.30808@lists.openembedded.org>
 <20200901224141.40600-1-Martin.Jansa@gmail.com>
 <CAMKF1soOvykbhXx=-XbsZ=3Twv5hptwyVejLV-SObYkw1=C+Tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soOvykbhXx=-XbsZ=3Twv5hptwyVejLV-SObYkw1=C+Tg@mail.gmail.com>
X-Groupsio-MsgNum: 86777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tcmlzdbgxevb4kly"
Content-Disposition: inline

--tcmlzdbgxevb4kly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 04:16:15PM -0700, Khem Raj wrote:
> On Tue, Sep 1, 2020 at 3:41 PM Martin Jansa <Martin.Jansa@gmail.com> wro=
te:
> >
> > Looks like my "solution" also isn't working well at least for images w=
ith read-only-rootfs in IMAGE_FEATURES.
> >
> > pkg_postinst_ontarget_${PN} is always forced to run on the target, whi=
ch for read-only-rootfs results in:
> > log.do_rootfs:
> > ...
> > NOTE: If an image is being built, the postinstalls for the following p=
ackages will be postponed for first boot: nss
> > ...
> > ERROR: The following packages could not be configured offline and root=
fs is read-only: ['nss']
> >
> > and now looking at the /usr/bin/signlibs.sh and it does pretty much
> > the same as the postinst script when D isn't empty.
> >
> > From oe-core git history it shows that signlibs.sh was added first:
> > https://git.openembedded.org/openembedded-core/commit/?id=3Da4580f967c=
8064294a06d406acf5deb24aee2acc
> > then the offline version of postinst was added to support read-only-ro=
otfs in:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D64e87fc6e9=
9bc1d4807034166735034b1f92bad8
> > and nss-native should always provide the shlibsign since:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D88540c5b08=
dea069660d1a68e506aebdd68e6ae0
> > and only after
> > https://git.openembedded.org/openembedded-core/commit/?id=3D8f782f7095=
e718dd9452055af53363beb6bdbece
> > it looked like signlibs.sh was something special only for target.
> >
> > So it looks to me, that we should just remove signlibs.sh script and l=
et the same postinst be used on target and offline
> > (with or without D being empty).
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/nss/nss/signlibs.sh | 20 --------------------
> >  meta-oe/recipes-support/nss/nss_3.56.bb     |  6 ------
> >  2 files changed, 26 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/nss/nss/signlibs.sh
> >
> > diff --git a/meta-oe/recipes-support/nss/nss/signlibs.sh b/meta-oe/rec=
ipes-support/nss/nss/signlibs.sh
> > deleted file mode 100644
> > index a74e499f8c..0000000000
> > --- a/meta-oe/recipes-support/nss/nss/signlibs.sh
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -#!/bin/sh
> > -
> > -# signlibs.sh
> > -#
> > -# (c)2010 Wind River Systems, Inc.
> > -#
> > -# regenerates the .chk files for the NSS libraries that require it
> > -# since the ones that are built have incorrect checksums that were
> > -# calculated on the host where they really need to be done on the
> > -# target
> > -
>=20
> if we remove this then how do we solve above said issue? is it still an =
issue ?

I think above said issue was resolved in 2013 with:
https://git.openembedded.org/openembedded-core/commit/?id=3D64e87fc6e99bc1=
d4807034166735034b1f92bad8

since then nobody should be running signlibs.sh on target (if it was
already finished in do_rootfs) and if it works offline for read-only-rootf=
s
then it doesn't really run on the target, right?

>=20
> > -CHK_FILES=3D`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
> > -SIGN_BINARY=3D`which shlibsign`
> > -for I in $CHK_FILES
> > -do
> > -       DN=3D`dirname $I`
> > -       BN=3D`basename $I .chk`
> > -       FN=3D$DN/$BN.so
> > -       $SIGN_BINARY -i $FN
> > -done
> > diff --git a/meta-oe/recipes-support/nss/nss_3.56.bb b/meta-oe/recipes=
-support/nss/nss_3.56.bb
> > index 107b0a0152..997f8950fd 100644
> > --- a/meta-oe/recipes-support/nss/nss_3.56.bb
> > +++ b/meta-oe/recipes-support/nss/nss_3.56.bb
> > @@ -21,7 +21,6 @@ VERSION_DIR =3D "${@d.getVar('BP').upper().replace('=
-', '_').replace('.', '_') + '
> >
> >  SRC_URI =3D "http://ftp.mozilla.org/pub/mozilla.org/security/nss/rele=
ases/${VERSION_DIR}/src/${BP}.tar.gz \
> >             file://nss.pc.in \
> > -           file://signlibs.sh \
> >             file://0001-nss-fix-support-cross-compiling.patch \
> >             file://nss-no-rpath-for-cross-compiling.patch \
> >             file://nss-fix-incorrect-shebang-of-perl.patch \
> > @@ -214,7 +213,6 @@ do_install_append() {
> >          touch ${D}/${libdir}/$file
> >          chmod 755 ${D}/${libdir}/$file
> >      done
> > -    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.=
sh
> >
> >      install -d ${D}${libdir}/pkgconfig/
> >      sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_=
VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
> > @@ -251,10 +249,6 @@ pkg_postinst_${PN} () {
> >      done
> >  }
> >
> > -pkg_postinst_ontarget_${PN} () {
> > -    ${bindir}/signlibs.sh
> > -}
> > -
> >  PACKAGES =3D+ "${PN}-smime"
> >  FILES_${PN}-smime =3D "\
> >      ${bindir}/smime \
> > --
> > 2.25.1
> >
> >=20

--tcmlzdbgxevb4kly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCX07hTwAKCRA3VSO3ZXaA
HNtmAKCldYSJhx+TvRcJA1CaWf3cMHIf4gCgs9r/GVYjeJzayI71oEP3UyFN7RQ=
=p2oh
-----END PGP SIGNATURE-----

--tcmlzdbgxevb4kly--
