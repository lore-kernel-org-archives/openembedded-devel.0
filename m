Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFA4C433FE
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 08:43:14 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.9327.1638520993431043024
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 00:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=je4d8WyS;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id l25so8386519eda.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R8C9Gxww9DmEa4psGIdCTeXcYXpMgVdtNRWQVj59aoY=;
        b=je4d8WySN906NrI48V3MB/NS6DYaLjp7KBkc22zE3Q1aGupCWvnx7qy9MsZ1ruFr4Q
         zlfVjpuWic4aL5d5pAZYWNlb8L4/pfkHomGk2Z8Z5PCPo/sNv3Hu3EzoD0JgCdURZr+s
         H8LYDuJBkJtj/tQZ8TQ4z52cmteDUMF7Lorpelg4uVwg/GcSdwxUfTdA2IKNittcXPLO
         Cd6qxGC2Nt7l0+H04Ylzy0mpaDZPxByNxYY34iyYcfawh2F7GAfbcqGaDbyJkczbaWL0
         9uxtKZ21azMhClaQUWfAbk9RROspEoC7K7XFZr/he1cMU5s4PzgBw/tkpHaAGgj/pA3v
         sopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R8C9Gxww9DmEa4psGIdCTeXcYXpMgVdtNRWQVj59aoY=;
        b=k18lGPItSl7IBorSAGgYoZtKCzvwv8ToDRkRSPxkrvO8SjZopxxRb2PFB+RCtNZ0o4
         eGrNa9op0I8OXrNiAUzkNRIoj6g6Wi2D7rHwMkoyiCNfDHdO2CBukat/g3mBcYm+dRW4
         unZYdUPwh//ZZv6kpuwggG+mmK8ABnfjNau1FmQ/nnTZtTr4AWqZ1nyTCnTQfx1yiK9G
         FKA0hpEqejvHEpLy/Tvy8aks9d6oqfd+GrJw5WLndC53XOJqu2g2jXX7j8ekUFtY4Hl/
         sr30NWLI8u/tUMbkdBcWfh0JKjLwrMXt34f93G1Sdbj34a97ORYsy+yjNfMNH4GQ8xiF
         AUNA==
X-Gm-Message-State: AOAM533wXFxPAOEaI5G1Hw5r6rdAvzYmpN6tjR7K/yOIXvXrBDyTjUDt
	eVReF94kvkpEyAJzc1DvFLM=
X-Google-Smtp-Source: 
 ABdhPJx6lIghA2Ve0Z4UA2bzgx3qDWtsMY6Skz+n6zsySCIrukHHTtkiP+sHCvOCb+vDH1+vev3LQA==
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr25191482edc.297.1638520991773;
        Fri, 03 Dec 2021 00:43:11 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 yc16sm1445415ejb.122.2021.12.03.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:43:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Dec 2021 09:43:10 +0100
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Unable to build image with qt examples
Message-ID: <20211203084232.clgqfgzl5hp7ttlx@jama>
References: <Iv8X.1638502118949323637.J1Lz@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gzl6mzt3wxazzbrb"
Content-Disposition: inline
In-Reply-To: <Iv8X.1638502118949323637.J1Lz@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 08:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94196


--gzl6mzt3wxazzbrb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 07:28:38PM -0800, Ankur Tyagi wrote:
> Hi,
>=20
> I am using dunfell branch and trying to include qtbase-examples, qtdeclar=
ative-examples, qtquickcontrols2-examples in the image by adding following =
to the packagegroup:
>=20
> QT5_EXAMPLES =3D " \
> qtbase-examples \
> qtdeclarative-examples \
> qtquickcontrols2-examples \
> "
> but during image creation I am getting following error:
>=20
> Error:
> Problem 1: conflicting requests
> - nothing provides qtdeclarative-examples needed by packagegroup-qt5-1.0-=
r0.noarch
> Problem 2: conflicting requests
> - nothing provides qtquickcontrols2-examples needed by packagegroup-qt5-e=
xamples-1.0-r0.noarch
> (try to add '--skip-broken' to skip uninstallable packages or '--nobest' =
to use not only best candidate packages)
>=20
> But checking qtdeclarative and qtquickcontrols2 recipes, they do provide =
this package:
>=20
> ankur@pc:~/build $ bitbake -e qtquickcontrols2 | grep ^PACKAGES=3D
> PACKAGES=3D"qtquickcontrols2-qmldesigner qtquickcontrols2-qmlplugins qtqu=
ickcontrols2-tools qtquickcontrols2-plugins qtquickcontrols2-mkspecs qtquic=
kcontrols2-examples qtquickcontrols2-src qtquickcontrols2-dbg qtquickcontro=
ls2-staticdev qtquickcontrols2-dev qtquickcontrols2-doc qtquickcontrols2-lo=
cale=A0 qtquickcontrols2"
>=20
> ankur@pc:~/build $ bitbake -e qtdeclarative | grep ^PACKAGES=3D
> PACKAGES=3D"qtdeclarative-ptest qtdeclarative-qmldesigner qtdeclarative-q=
mlplugins qtdeclarative-tools qtdeclarative-plugins qtdeclarative-mkspecs q=
tdeclarative-examples qtdeclarative-src qtdeclarative-dbg qtdeclarative-sta=
ticdev qtdeclarative-dev qtdeclarative-doc qtdeclarative-locale=A0 qtdeclar=
ative"
>=20
> What am I missing here?

most likely to enable the PACKAGECONFIG to build them

recipes-qt/qt5/qt5.inc:PACKAGECONFIG[examples] =3D ""
recipes-qt/qt5/qt5.inc:EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACK=
AGECONFIG', 'examples', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"

--gzl6mzt3wxazzbrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYanYngAKCRA3VSO3ZXaA
HGksAJ4pn31jLbyc7JxJI7IBkIYxnB04fQCgp0Q3JjREQIJGjOhlb2B9PUTiLNg=
=HiUX
-----END PGP SIGNATURE-----

--gzl6mzt3wxazzbrb--

