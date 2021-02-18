Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.608.1613669367548319332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 09:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C9dzvxjd;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id e13so3767268ejl.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Feb 2021 09:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cGGqgMU858gB2WXDCNMswkXNU7Bbl8iGUFvxzvWMZ/Y=;
        b=C9dzvxjdlE37T8HxACGVPsrSVcp/h/uE/+ZL5Qc6itSKpuWToCD2wXvnp15SW8mtch
         FxBM4NMtE/sZI647g4PdZBne6EKUROUWtnLbAjoBJgKYQTW91mGS2qpjaH2g289ik4n5
         EDMttiljjMxeECCt/Eq9MXZ76zJkTxU4DaT46GfPGehjjsLLgBZNRA7XTyIDmoXYm1Wv
         Z94uTq32xflrWGa679XoKnSUCqhldSvBCzKOCEpOt/nKmdbTo42YZ9seI3+aWvNUIjTS
         8bMnw/8QR1wHU5hcRg63nXHNiEm7MkUfx6AUl2IeE4rFUITJI8/DXEHPXnQx+Kg/lFyp
         1i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cGGqgMU858gB2WXDCNMswkXNU7Bbl8iGUFvxzvWMZ/Y=;
        b=Go8cVuPPWrzshTHtFShwiOmkc8yQOjcs5MYXjD+Nz0zrpfY/XYPtL8uJpKrvxem+y9
         0KGTF6cQkuzzmN2TiAk5sKVgcICMe4DNFm2gSYYn9qbfVKrYoa2xl0zTz9HIW/zPse2w
         SCgTv1KHQPXAR3iVF3F8HgZ/WgRHw+pwv9WUnlbpeRbewo2rQ2f4QBxDN5zb6euekIcU
         HyJeJLefdNr1E/NrgDh6efXaqZr1iWdxA3NNYuUhUelyfLIuB/PTeKH+wQWbQOBgYBEC
         3YZrd5Aw/sUrEqgNg0pQ6PPsX/e2+g/dtUQqsnEJihcSkZbJAlr6AE60CJ/A4jBwRC1Y
         vLyg==
X-Gm-Message-State: AOAM530sHuod+MralULi6DMQuML44f8GOQL+JeOTmY8x9VvYlR1XwIdB
	wRz4YBtv7L8VtVTV4bVqsQc=
X-Google-Smtp-Source: ABdhPJy7eTDmE3O5tJUO/6FWP5dFdUPV4XaT3JEaLmw4p9WNK1JFnExKubgF0ROG03By/14dRYEXxQ==
X-Received: by 2002:a17:906:69c2:: with SMTP id g2mr4851311ejs.249.1613669366015;
        Thu, 18 Feb 2021 09:29:26 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x17sm3425637edq.42.2021.02.18.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 09:29:24 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Feb 2021 18:29:24 +0100
To: akuster <akuster808@gmail.com>
Cc: Rahul Taya <Rahul.Taya@kpit.com>,
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com,
	nisha.parrakat@kpit.com, harpritkaur.bhandari@kpit.com
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
Message-ID: <20210218172924.7ysohqharr5h7lo4@jama>
References: <20210216152349.30824-1-Rahul.Taya@kpit.com>
 <fe08c709-7927-b56c-2461-630a18921e8e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <fe08c709-7927-b56c-2461-630a18921e8e@gmail.com>
X-Groupsio-MsgNum: 89588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sxyqun235ccivrqb"
Content-Disposition: inline

--sxyqun235ccivrqb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 07:19:53AM -0800, akuster wrote:
>=20
>=20
> On 2/16/21 7:23 AM, Rahul Taya wrote:
> > For python and python-native added patch to fix
> > CVE-2019-9674
> >
> > Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
>=20
> Please add your signoff in the applying patches. see below for example.
>=20
> Does this affect master or Gatesgarth?=C2=A0 What may avoid such questio=
ns is
> by=C2=A0 adding=C2=A0 something like "Affects: < {version}" will convey =
that info.

python in meta-python2 is identical in dunfell/gatesgarth/master
branches, so it has to affect all of them.

> -armin
> > ---
> >  recipes-devtools/python/python.inc            |  1 +
> >  .../python/python/CVE-2019-9674.patch         | 83 ++++++++++++++++++=
+
> >  2 files changed, 84 insertions(+)
> >  create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patch
> >
> > diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/pyt=
hon/python.inc
> > index a4ba0c5..787f23e 100644
> > --- a/recipes-devtools/python/python.inc
> > +++ b/recipes-devtools/python/python.inc
> > @@ -8,6 +8,7 @@ INC_PR =3D "r1"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e=
759642"
> >
> >  SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.=
xz \
> > +           file://CVE-2019-9674.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d=
3808ed4594812edef43"
> > diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch b/reci=
pes-devtools/python/python/CVE-2019-9674.patch
> > new file mode 100644
> > index 0000000..647d9da
> > --- /dev/null
> > +++ b/recipes-devtools/python/python/CVE-2019-9674.patch
> > @@ -0,0 +1,83 @@
> > +From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 200=
1
> > +From: JunWei Song <sungboss2004@gmail.com>
> > +Date: Wed, 11 Sep 2019 23:04:12 +0800
> > +Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentat=
ion
> > + (#13378)
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +* bpo-36260: Add pitfalls to zipfile module documentation
> > +
> > +We saw vulnerability warning description (including zip bomb) in Doc/=
library/xml.rst file.
> > +This gave us the idea of documentation improvement.
> > +
> > +So, we moved a little bit forward :P
> > +And the doc patch can be found (pr).
> > +
> > +* fix trailing whitespace
> > +
> > +* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.
> > +
> > +* Reformat text for consistency.
> > +
> > +Upstream-Status: Backport[http://archive.ubuntu.com/ubuntu/pool/main/=
p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz]
> > +CVE: CVE-2019-9674
> > +Link: http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.=
5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz
> > +Comment: From the original patch skipped changes for file
> > +Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.r=
st
> > +as this file is not present in our source code.
>=20
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>  <<<<----- somewhere in =
this area
>=20
> I tend to do mine just after "cve:"
>=20
> - armin
>=20
> > +---
> > + Doc/library/zipfile.rst                       | 41 +++++++++++++++++=
++
> > + 1 files changed, 41 insertions(+)
> > +
> > +diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst
> > +index b421ea5..2e0a91d 100644
> > +--- a/Doc/library/zipfile.rst
> > ++++ b/Doc/library/zipfile.rst
> > +@@ -574,4 +574,45 @@ Instances have the following attributes:
> > +
> > +    Size of the uncompressed file.
> > +
> > ++Decompression pitfalls
> > ++----------------------
> > ++
> > ++The extraction in zipfile module might fail due to some pitfalls lis=
ted below.
> > ++
> > ++From file itself
> > ++~~~~~~~~~~~~~~~~
> > ++
> > ++Decompression may fail due to incorrect password / CRC checksum / ZI=
P format or
> > ++unsupported compression method / decryption.
> > ++
> > ++File System limitations
> > ++~~~~~~~~~~~~~~~~~~~~~~~
> > ++
> > ++Exceeding limitations on different file systems can cause decompress=
ion failed.
> > ++Such as allowable characters in the directory entries, length of the=
 file name,
> > ++length of the pathname, size of a single file, and number of files, =
etc.
> > ++
> > ++Resources limitations
> > ++~~~~~~~~~~~~~~~~~~~~~
> > ++
> > ++The lack of memory or disk volume would lead to decompression
> > ++failed. For example, decompression bombs (aka `ZIP bomb`_)
> > ++apply to zipfile library that can cause disk volume exhaustion.
> > ++
> > ++Interruption
> > ++~~~~~~~~~~~~
> > ++
> > ++Interruption during the decompression, such as pressing control-C or=
 killing the
> > ++decompression process may result in incomplete decompression of the =
archive.
> > ++
> > ++Default behaviors of extraction
> > ++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ++
> > ++Not knowing the default extraction behaviors
> > ++can cause unexpected decompression results.
> > ++For example, when extracting the same archive twice,
> > ++it overwrites files without asking.
> > ++
> > ++
> > ++.. _ZIP bomb: https://en.wikipedia.org/wiki/Zip_bomb
> > + .. _PKZIP Application Note: https://pkware.cachefly.net/webdocs/case=
studies/APPNOTE.TXT
> > --
> > 2.17.1
> >
> > This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print, retain copy, disseminate, distribu=
te, or use this message or any part thereof. If you receive this message in=
 error, please notify the sender immediately and delete all copies of this =
message. KPIT Technologies Ltd. does not accept any liability for virus inf=
ected mails.
> >
> >=20
> >
>=20
>=20

>=20
>=20
>=20


--sxyqun235ccivrqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYC6j8gAKCRA3VSO3ZXaA
HICfAKCnAbWY5cUPB/ffO+pDvNkW6/fJewCePLwsuhJiQEe6nMzYr+XC//t3KHs=
=NlY6
-----END PGP SIGNATURE-----

--sxyqun235ccivrqb--
