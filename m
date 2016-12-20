Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAFC7727A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 12:46:24 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id xy5so27477334wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 04:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aVZMFZ9G393+Jg7kQfL7DQYRRAwPg7SNJrysHOEvzII=;
	b=Dj9yK3Qiib4WchIDX3r7kOUayXTGaTQFfYHTXzjQ3JwpX5eGKiSzRVzW7qZSmVF4ZW
	qxI36PziA9hCWLX55PuJwrRimCciZTt1+bFlsMBCJggqdmKHx88qnWXcKXS0QUp9Uuyu
	ag6vPJfYmeavjle9/ZRMTqGW/uiScvT8Oh6owGNwvmeivAtJALDF0usTPQnN9eUkBz+J
	6E7Dfpa7VDcgUgrSEUuM3lAdZsGdre1dUiDwmI828LtZXwTy2fp1TyBEC8QIyi9Jj1Rc
	M4sLiWQalqvj7fd4YggD+9BlNWQ7CxxIa/aeI/AbaiHk467JTEQwzJbkA1dXUwo510VU
	4IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aVZMFZ9G393+Jg7kQfL7DQYRRAwPg7SNJrysHOEvzII=;
	b=YiT49Xh47YKL5WCOk/eWRroRxypbCMsUIGVKWWm7o9w8lFmGRQOdXWldqn8uTn0zdR
	4gJm7BhxSLZfluHe5gQXGp2Cc5/vC/jDK6gBzYRsORjmEo8yaa91GiM54aKf1pRR6Xdw
	JDkDQ7EmozOO4Vh4uFfW5wEBg1LEip+E4LixiiNo2J63XqbPe6TQjEQVyVYq60qA4cSS
	WLGtFxSbyjNLbKjSTPTt8He3X5D66yldUBuysABrUZGarj0dYHshoh8PWgg3GwOQF2Cb
	/IyYBlhlX7YoOu7Xq9oF0NkLTn3qbQs2pegqOwrn0Snw+Fd5ZndTjUYmjOOC5lDPUUeu
	NCWw==
X-Gm-Message-State: AKaTC03Yr+DeZ9YjeGQK6/1RlocU2AoOPBuFhQy5lXUM7Q/iFLI+cFUqiRQ/DFd/oleg4w==
X-Received: by 10.194.127.104 with SMTP id nf8mr17973767wjb.39.1482237985591; 
	Tue, 20 Dec 2016 04:46:25 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e188sm22008299wma.21.2016.12.20.04.46.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 04:46:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 13:46:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161220124624.GD3275@jama>
References: <20161220053351.4499-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161220053351.4499-1-raj.khem@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH V2] yajl_1.0.12: Add recipe for yajl1
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
X-List-Received-Date: Tue, 20 Dec 2016 12:46:25 -0000
X-Groupsio-MsgNum: 64433
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline

--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 09:33:51PM -0800, Khem Raj wrote:
> yajl1 and yajl2 are not ABI compatible, therefore
> add a recipe for latest release of yajl1
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../yajl-1.0.12/0001-bump-version-to-1.0.12.patch  | 25 ++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb       | 21 ++++++++++++++++=
++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-v=
ersion-to-1.0.12.patch
>  create mode 100644 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
>=20
> diff --git a/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-=
to-1.0.12.patch b/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-versi=
on-to-1.0.12.patch
> new file mode 100644
> index 000000000..5e8aef051
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.=
12.patch
> @@ -0,0 +1,25 @@
> +From 17b1790fb9c8abbb3c0f7e083864a6a014191d56 Mon Sep 17 00:00:00 2001
> +From: Lloyd Hilaiel <lloyd@hilaiel.com>
> +Date: Mon, 25 Apr 2011 12:56:24 -0600
> +Subject: [PATCH] bump version to 1.0.12
> +
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 727a488..c703244 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -34,7 +34,7 @@ PROJECT(YetAnotherJSONParser C)
> +=20
> + SET (YAJL_MAJOR 1)
> + SET (YAJL_MINOR 0)
> +-SET (YAJL_MICRO 11)
> ++SET (YAJL_MICRO 12)
> +=20
> + SET (YAJL_DIST_NAME "yajl-${YAJL_MAJOR}.${YAJL_MINOR}.${YAJL_MICRO}")
> +=20
> +--=20
> +2.11.0
> +
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recip=
es-devtools/yajl/yajl_1.0.12.bb
> new file mode 100644
> index 000000000..f8451a406
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Yet Another JSON Library."
> +
> +DESCRIPTION =3D "YAJL is a small event-driven (SAX-style) JSON parser \
> +written in ANSI C, and a small validating JSON generator."
> +
> +HOMEPAGE =3D "http://lloyd.github.com/yajl/"
> +
> +LICENSE =3D "ISC"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dda2e9aa80962d54e7c726f232a2bd=
1e8"

yajl1 was BSD:
https://github.com/lloyd/yajl/commit/de81b1fcd22b29b152f921f23faab759c79da7=
e1

> +
> +SRCREV =3D "6a8906d409dfe6dd3f1e01ed066aa162b1729cec"
> +
> +SRC_URI =3D "git://github.com/lloyd/yajl;branch=3D1.x \
> +           file://0001-bump-version-to-1.0.12.patch \
> +          "

This should be better than adding local .patch:

# corresponds to tag 1.0.12
SRCREV =3D "17b1790fb9c8abbb3c0f7e083864a6a014191d56"
SRC_URI =3D "git://github.com/lloyd/${PN};nobranch=3D1"

> +
> +inherit cmake lib_package
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
> --=20
> 2.11.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFkoIAAKCRA3VSO3ZXaA
HHKMAKCVVaY7fP5lc64w9awPKDnYvGMdJwCgrHlNciSQvDxGq/hkACbhK6yPbXc=
=/k1K
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
