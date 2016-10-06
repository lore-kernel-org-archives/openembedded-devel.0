Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 233A5606CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 23:48:47 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cd13so1762680pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 16:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=8IEN3kArpxRL1uk8fgefLgPykZtcXkM15aUXzDa7Juo=;
	b=kM5HVjNqg3rbOIYaBksZR2I/xRfVbgS047ibUIBk5kqOQK61G4wiQ9Qz9RiQDs78sc
	QD0z5XN/rnlLiWx0U2Eo57TamgbEJMmdbTwUd0JcnIl/T02g4/ObHFTvtcvtGMwYIzcm
	wcZs5T1vnW8QyYZOW1b9NGHSNjhAU53kCD+dwuxh4CWoJDeb407dhjxMVX+G+b2S/j6H
	9Cu0DwuEVYerBIY4S6/V+l6Tc9RTgkej3IDzJm5rubCsSxlKbTWPmXHIvTycFkN6Xr0N
	91lg3KffI4OCcP8DzUUBAOL6qyNIXT/xg1gxT/CKpJU2Zw9JpStFNiBfKbJoxvIjNDz6
	whAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=8IEN3kArpxRL1uk8fgefLgPykZtcXkM15aUXzDa7Juo=;
	b=OwMJaq0gbWadHfTgJfL2Z/XQO7sq9z+8AkRCWm/CL58XzPdubZ0p707VcAB7FS96JM
	1rl6iOsWQlLaT7317/9tpTvpHPjYgSaeCIqAVOXfSBMlH8kyMU5x5QGZFdNRJodiB6YC
	x5NsrH2BVJ2qphJFKkFG2OqHyiSbD6KbQonBqmjw1Z/WhADz+x3ZyHmRptbxDBktx4d1
	oV9yTS5d9p3QD+T3iGlptD1qP10ikS1VD60DpNUV4/WvhPA7z3c52Ftu8QIaAMeHHvcV
	qkNorBzJ5pr2C0vQWuRtcmVyv59M8vv3un9XGxsiSQ+8E8CxXXjOJM1m1KZ6MTZZX0+3
	4LDg==
X-Gm-Message-State: AA6/9RkDoPtoqfrPBp0t4k/L7cbkrqHXm4VWY0cGXsvktq0syDEkQUoOe4Q63nZ4nzNThw==
X-Received: by 10.66.245.204 with SMTP id xq12mr26206855pac.37.1475797729088; 
	Thu, 06 Oct 2016 16:48:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:1891:a07b:2b72:a6d8?
	([2601:646:8882:b8c:1891:a07b:2b72:a6d8])
	by smtp.gmail.com with ESMTPSA id
	ps2sm25521929pab.31.2016.10.06.16.48.47
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 16:48:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1475783887-20739-1-git-send-email-denis@denix.org>
Date: Thu, 6 Oct 2016 16:48:44 -0700
Message-Id: <1F10663F-D6B7-4A28-BB4C-0F8E65B0D5CD@gmail.com>
References: <1475783887-20739-1-git-send-email-denis@denix.org>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-python][PATCH] python-pybind11: add pybind11 for operability between C++11 and Python
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
X-List-Received-Date: Thu, 06 Oct 2016 23:48:48 -0000
X-Groupsio-MsgNum: 63396
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FFD93175-70E3-45B0-AE6B-5E8D76C84BBB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FFD93175-70E3-45B0-AE6B-5E8D76C84BBB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 6, 2016, at 12:58 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> meta-python/recipes-devtools/python/python-pybind11.inc       | 9 =
+++++++++
> meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb  | 2 ++
> meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb | 2 ++
> 3 files changed, 13 insertions(+)
> create mode 100644 =
meta-python/recipes-devtools/python/python-pybind11.inc
> create mode 100644 =
meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
> create mode 100644 =
meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc =
b/meta-python/recipes-devtools/python/python-pybind11.inc
> new file mode 100644
> index 0000000..e13f6a5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pybind11.inc
> @@ -0,0 +1,9 @@
> +SUMMARY =3D "Seamless operability between C++11 and Python"
> +HOMEPAGE =3D "https://github.com/wjakob/pybind11"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D =
"file://PKG-INFO;md5=3D1e9383cd3e97753d7dd6067d079519ea"
> +PR =3D =E2=80=9Cr0"

Drop this

> +
> +SRC_URI =3D =
"https://pypi.python.org/packages/89/0b/f3a25633e49be5fae17ed2c7751c8106a0=
8199db70e3c82e8cc043388ba9/pybind11-1.8.1.tar.gz"
> +SRC_URI[md5sum] =3D "67845d8fd89a1c400dc7c61ccdee14d6"
> +SRC_URI[sha256sum] =3D =
"358d4b7d8c38cd1dde66064178c6bbaaa2c479a44e67e642820fe0f329a4fff8"
> diff --git =
a/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb =
b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
> new file mode 100644
> index 0000000..e567430
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools
> +require python-pybind11.inc
> diff --git =
a/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb =
b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
> new file mode 100644
> index 0000000..355e284
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-pybind11.inc
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_FFD93175-70E3-45B0-AE6B-5E8D76C84BBB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf24t8ACgkQuwUzVZGdMxRpugCdFD2x/BTUJDxspxreFzlBLxbH
B8YAn2qe51T9rbnwZnPegfo74g7IqpOM
=Voez
-----END PGP SIGNATURE-----

--Apple-Mail=_FFD93175-70E3-45B0-AE6B-5E8D76C84BBB--
