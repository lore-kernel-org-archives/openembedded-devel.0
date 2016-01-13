Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 226AF7318D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 22:40:09 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id q63so90903436pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 14:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=iHuafmZC9mc7OdprAWlIdl/r5MeAxyRjnn9OoN5BOQY=;
	b=zwZ4mKUiVmAU5JI3fdrhPXcnVDFrR9GzfZ0Gd7QQ+W8/15mWnpzokYFwsO5I02ydwV
	8tuWvo2AKUe0dM9cCoUuZl7K7Py5LyHSsjvSt3sae3P5TCjE4wLpkT/R2onzGiRl57Tt
	/HNTQD6FtDSfnUngvNVLxb1UpT/bBOlkeaL3wlovlCw0KuZDZrnx9pdeQRaCJOQwyNtZ
	vwGdYvzWpkGE8crOuSlUwn6jEmZAr9cjQwN6hkDZGZgP5TmLpN16o5vsM0Pkeikrwc++
	UfICcfNHu3eirHZfb+uqfdYXXtoHd6B8pd/ypql88hbKBUR9s/6bGOHJf3udA+OpvcKf
	eXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=iHuafmZC9mc7OdprAWlIdl/r5MeAxyRjnn9OoN5BOQY=;
	b=Qqr8m3ALG3TvauuNoOPKEGe5O/W4iCaILuVP3SiiLAxPE/8F62FpT4ZZV0mkW/mZJD
	ew9XrsEGVmeiZ/eMrDQdzJgCc2ppDCCY4tUlK4J3vtY/6db1qy5oOy2lm9MCkCFoQBkI
	O6TidJYgGD66dOMCwO+PXL77LRssp1j2+2yijEaGSlOxzchzHvYVZk3QvnKWjvG4Uu8X
	4MN8o5B3RA7i60ILwyJ7FflexFeWHlgcsEHWmD0+oH15FvaV3PTJV9PHa6/W262Y0kD7
	RmUzSMPSuFvqeo8UjUVFXHNb7ylOVF662UQWX60GlfbZmhu8utwUJNYR6mXs72wMwAyE
	POFA==
X-Gm-Message-State: ALoCoQl+PMjuL/ag22i43obAfHc/3Gw/thq1RhatdyrCSlOLDzV/EjDfO8i6cKhSQM8vuvwDRVHI1mCBxLvxwNjY3dUWmN+Qjw==
X-Received: by 10.98.43.88 with SMTP id r85mr971281pfr.7.1452724810372;
	Wed, 13 Jan 2016 14:40:10 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:e406:58c9:b337:c1d9?
	([2601:646:8802:5d5c:e406:58c9:b337:c1d9])
	by smtp.gmail.com with ESMTPSA id
	f12sm4856798pat.20.2016.01.13.14.40.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 14:40:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452722841-2952-1-git-send-email-nate.karstens@garmin.com>
Date: Wed, 13 Jan 2016 14:40:05 -0800
Message-Id: <39572364-2F8B-497C-8BE1-C8E5C7EC27F0@gmail.com>
References: <1452722841-2952-1-git-send-email-nate.karstens@garmin.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-networking][PATCH v3] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Wed, 13 Jan 2016 22:40:10 -0000
X-Groupsio-MsgNum: 59523
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0FE159CD-542F-41BF-AA46-A9F0A4D50A09";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0FE159CD-542F-41BF-AA46-A9F0A4D50A09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 13, 2016, at 2:07 PM, Nate Karstens <nate.karstens@garmin.com> =
wrote:
>=20
> Adds a new recipe for dhcpcd version 6.10.0.
>=20
> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
> ---
> .../recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb   | 22 =
++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
> create mode 100644 =
meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
>=20
> diff --git =
a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb =
b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
> new file mode 100644
> index 0000000..6478a02
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
> @@ -0,0 +1,22 @@
> +SECTION =3D "console/network"
> +SUMMARY =3D "dhcpcd - a DHCP client"
> +DESCRIPTION =3D "dhcpcd runs on your machine and silently configures =
your computer to work on the attached networks without trouble and =
mostly without configuration."
> +
> +HOMEPAGE =3D "http://roy.marples.name/projects/dhcpcd/"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D =
"file://dhcpcd.c;endline=3D26;md5=3D77c40d671aff804ca91ea99556da8e9b"
> +
> +SRC_URI =3D =
"http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] =3D "f39c5773e7c4bea352d9fb7367c899de"
> +SRC_URI[sha256sum] =3D =
"ab56af9b2e86913c55a965cb0f835e87749df78318564acf90d5d698f413ad35"
> +
> +inherit autotools
> +
> +B =3D "${S}=E2=80=9D

you could inherit autotools-brokensep instead of autotools and remove =
above two lines.
ideally a fix to build it out of source tree would be choice #1

> +EXTRA_OECONF =3D "--enable-ipv4 --enable-ipv6"
> +
> +FILES_${PN}-dbg +=3D "/usr/lib/dhcpcd/dev/.debug=E2=80=9D

use ${libdir} instead of /usr/lib

> +
> +RDEPENDS_${PN} =3D "udev"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_0FE159CD-542F-41BF-AA46-A9F0A4D50A09
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaW0kkACgkQuwUzVZGdMxQQIwCgihPZPCy5cfUUGDoN86Wv5jLH
hE0An1DeypgxtUUGXfqujVUD5c3WsLiK
=W0J0
-----END PGP SIGNATURE-----

--Apple-Mail=_0FE159CD-542F-41BF-AA46-A9F0A4D50A09--
