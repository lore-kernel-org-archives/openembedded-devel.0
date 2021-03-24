Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.1138.1616604237026805657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QM9Kag3Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id e7so28322320edu.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2PzrL5BCC8JTqrzhVdQfLSg6CxjPMVDaUVyhabe4kOc=;
        b=QM9Kag3ZzSE4/NDw4PcI5ZFN5haPK9fB02zCCOqzoJSX4IWyaq99Wg3pc9UiLh8/aq
         Dxk5KnxGhOdrKJUS/BIP0I9MI9QOzQWNixdHW3gi0UqJwhUS1a6b23oENnbBHM7p0cjI
         mj7apXp7Ci3nd2mt9F+8Skar40rYmOoBkK1E7EZYeIItesep+zh06WQ/Mi8TBBrwb1Qx
         OM534+UQWgdnJDn07lmjpievHfEreZcEo+C6yDH0tCAAS7EhOgOm3jHl/HPClIuDL5Xr
         SXDr2PZ3lMfVcoz4EZPxwLXaV4WtzYZIc6IIYrhTQEX61JRihkTLFX8bxrJe1TTrC1Qq
         P1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2PzrL5BCC8JTqrzhVdQfLSg6CxjPMVDaUVyhabe4kOc=;
        b=KAeoKYdXED3nFOF1xifCuSOxYqRCrDek3JnpYMxjkHlOr/6HkGTSMr0nrfAQcWNeRy
         lRuOSazNDY3kzKFBwhzQ681jXk+aQm9uxUs153Bqq95ye/Rb4KEJiOSF6lXSSNZ2O0ag
         oYefKIYM8jc6jwT4xA/z5M52gCNA7Gwg8JJdaDJSM3xNlLFQ+C6qUMx19TpmLPgJDaO8
         BtbhBeJIYT8UP7QkMKa6ZIoUJvwfsEpqHM2msACdfEXMPt2lug+1VvSJBz6mcomHvCrP
         x4QO1YVoXA3zAdhAaj39ipAXgfJC4Ct97dOWLecTRHChu/rjfThc/bD3jImFqCgaz3YJ
         Qm4g==
X-Gm-Message-State: AOAM531fer7Xunhmf6K5uY/Ogo7OhLxvZhWEDHsJi4mJfLgBfJCxHGSa
	r1esWQyZrC4TS6hU+wtks4I=
X-Google-Smtp-Source: ABdhPJwoBPxratomvJsirS2Jc2gVtpv3Fk616hncAyhDn1rWlpc6QY3v6weA8V85UPV02eL/LYc5og==
X-Received: by 2002:a05:6402:1350:: with SMTP id y16mr4385017edw.309.1616604235358;
        Wed, 24 Mar 2021 09:43:55 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p19sm1402447edr.57.2021.03.24.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:43:54 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Mar 2021 17:43:54 +0100
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Peace Lee <iipeace5@gmail.com>
Subject: Re: [dunfell][PATCH] guider: Upgrade to 3.9.7
Message-ID: <20210324164354.fqgz6s65jfpotd5k@jama>
References: <20210324104629.3484418-1-Martin.Jansa@gmail.com>
 <CAMKF1sonuwqAgSp-QzLq9eC879q9weuUgr6_NxLNDUiAs+waOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sonuwqAgSp-QzLq9eC879q9weuUgr6_NxLNDUiAs+waOQ@mail.gmail.com>
X-Groupsio-MsgNum: 90307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rte5l2f5l6e6lmog"
Content-Disposition: inline

--rte5l2f5l6e6lmog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 08:54:47AM -0700, Khem Raj wrote:
> there is v2 in master-next which I will send once builds are done.

This is for 3.9.7 (because that's where it switched from python2 to
python3) not 3.9.8 targetting master now.

> On Wed, Mar 24, 2021 at 3:46 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > From: Peace Lee <iipeace5@gmail.com>
> >
> > Signed-off-by: Peace Lee <iipeace5@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-devtools/guider/guider_3.9.6.bb   | 39 -------------------
> >  .../recipes-devtools/guider/guider_3.9.7.bb   | 19 +++++++++
> >  2 files changed, 19 insertions(+), 39 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> >  create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> >
> > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> > deleted file mode 100644
> > index f059002161..0000000000
> > --- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -SUMMARY = "runtime performance analyzer"
> > -HOMEPAGE = "https://github.com/iipeace/guider"
> > -BUGTRACKER = "https://github.com/iipeace/guider/issues"
> > -AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> > -
> > -LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> > -
> > -PV = "3.9.6+git${SRCPV}"
> > -PR = "r0"
> > -
> > -SRC_URI = "git://github.com/iipeace/${BPN}"
> > -#SRCREV = "${AUTOREV}"
> > -SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
> > -
> > -S = "${WORKDIR}/git"
> > -R = "${RECIPE_SYSROOT}"
> > -
> > -inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distutils", "", d)}
> > -
> > -GUIDER_OBJ = "guider.pyc"
> > -GUIDER_SCRIPT = "guider"
> > -
> > -do_install() {
> > -    python ${S}/setup.py install
> > -
> > -    install -d ${D}${bindir}
> > -    install -v -m 0755 ${STAGING_BINDIR_NATIVE}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
> > -
> > -    install -d ${D}${datadir}/${BPN}
> > -    install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
> > -}
> > -
> > -RDEPENDS_${PN} = "python-ctypes python-shell \
> > -                  python-json python-subprocess"
> > -python() {
> > -    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
> > -        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
> > -}
> > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> > new file mode 100644
> > index 0000000000..2b799fd5e4
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "runtime performance analyzer"
> > +HOMEPAGE = "https://github.com/iipeace/guider"
> > +BUGTRACKER = "https://github.com/iipeace/guider/issues"
> > +AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> > +
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> > +
> > +PV = "3.9.7+git${SRCPV}"
> > +
> > +SRC_URI = "git://github.com/iipeace/${BPN}"
> > +SRCREV = "c87269d6d4669d12c99a2a7b9b07c39a5dd24ac6"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit setuptools3
> > +
> > +RDEPENDS_${PN} = "python3 python3-core \
> > +        python3-ctypes python3-shell python3-json"
> > --
> > 2.30.2
> >

--rte5l2f5l6e6lmog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYFtsSAAKCRA3VSO3ZXaA
HJLmAJ0U/FRRi1W5w3/s0sbC9nfHtece7wCfY8rrhqu9nG1v5fzJszOIxjMNbN4=
=6ELi
-----END PGP SIGNATURE-----

--rte5l2f5l6e6lmog--
