Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF73576894
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 01:39:16 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so1368346pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=3OVapPI5IVtcRDVrvxjiwkft28cZ3EdWQ+ofcR5QJHs=;
	b=p30J+dOELSh5davp0rS08j0M7nCTn24fxo8pQ3IbUjxOTkgHIiBPP/sk7tTVWBFZIs
	y0KOiIhzu4JX5PdUiUODIG7QWyjRovIlHdqglsbxf4531BL4flKvZEy4BwAPfFbWDGai
	H3/75jZwYcg1ApPfNUJyySzF2tg17x4vPEfCx2ChL7I1DX6whS2LvDzkc7xWNXncfRrT
	c+SiX/B2fMgkt5zgN31Hj2Bf4Swxsd7bdccd15yjgGUFG9qRVdfS895SCJMdD9vbx/h8
	KibLJf7BwRI3iENp1DW7E+vKG/H856FV07/Kq/+WHOkiwMetWCWQtcqPTR9AJhc6Pglz
	w/gA==
X-Received: by 10.70.38.231 with SMTP id j7mr63464887pdk.146.1439343556646;
	Tue, 11 Aug 2015 18:39:16 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:157:79f9:ef5c:d3d0?
	([2601:646:8601:4580:157:79f9:ef5c:d3d0])
	by smtp.gmail.com with ESMTPSA id pj3sm4225280pdb.6.2015.08.11.18.39.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Aug 2015 18:39:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1439307808-7581-1-git-send-email-alejandro.delcastillo@ni.com>
Date: Tue, 11 Aug 2015 18:39:14 -0700
Message-Id: <C1999217-99AE-4AB2-83D7-8EED48D721D8@gmail.com>
References: <1439307808-7581-1-git-send-email-alejandro.delcastillo@ni.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-python][PATCH] python-pyinotify: add recipe
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
X-List-Received-Date: Wed, 12 Aug 2015 01:39:18 -0000
X-Groupsio-MsgNum: 56651
Content-Type: multipart/signed;
	boundary="Apple-Mail=_053BA99B-D89D-4523-9A7B-9A8F59AB560E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_053BA99B-D89D-4523-9A7B-9A8F59AB560E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 11, 2015, at 8:43 AM, Alejandro del Castillo =
<alejandro.delcastillo@ni.com> wrote:
>=20
> Python bindings for Linux inotify mechanism
>=20
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
> .../recipes-devtools/python/python-pyinotify_0.9.6.bb   | 17 =
+++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 =
meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
>=20
> diff --git =
a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb =
b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
> new file mode 100644
> index 0000000..07e95b0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "Python pyinotify: Linux filesystem events =
monitoring"
> +HOMEPAGE =3D "https://pypi.python.org/pypi/pyinotify"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dab173cade7965b411528464589a08382"
> +
> +PR =3D =E2=80=9Cr0"

drop it.

> +SRCNAME =3D "pyinotify"
> +
> +SRC_URI =3D =
"https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar=
.gz"
> +
> +SRC_URI[md5sum] =3D "8e580fa1ff3971f94a6f81672b76c406"
> +SRC_URI[sha256sum] =3D =
"9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_053BA99B-D89D-4523-9A7B-9A8F59AB560E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXKo8IACgkQuwUzVZGdMxT/HwCcDazglDO2YsCsJcKOnQ3sZH0J
6PgAn05g2T19Pw7mMLOt3/v4LbIpg2lR
=6SMr
-----END PGP SIGNATURE-----

--Apple-Mail=_053BA99B-D89D-4523-9A7B-9A8F59AB560E--
