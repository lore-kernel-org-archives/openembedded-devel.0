Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC7176FC4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:13:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l66so544809wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S3tPL3//YFrcEYnRlebZGwAHeqs0LUfnX+rfluBpI4c=;
	b=qaT3o/TLcgk6yhF8KIYR3FFGFT9ogYlGuulaFcsYAdbN7eTzaPQFssUuFCoHG/ykcm
	SE3V/3JYVK9YxK9xt1BZM1swC166iRUw517B8+t88xlDzW8QmdlZ9yMZEFXjaDDBGype
	Tzplh7DHBGRpy8MElgMOJ+b43KgKHMlZSPqkHfOIe6u+IkbeD8R0XMMFucxaEBybStHW
	/FV1qmfzz79b8YPr6Yk9aDi6lRU/b2IELNO3Z9wsNrAZATLl0EyxDadZDcGmlkFdILXB
	A7VF1AZKKJb7yh7LKA2f5OaeZkdzxhBHQDDHSci+8rIBjvEShLwNDAiJ/ye9EXpsDdAt
	qDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=S3tPL3//YFrcEYnRlebZGwAHeqs0LUfnX+rfluBpI4c=;
	b=MZHbEcnC9YMyb7lTy3Vo8Q5odYEzj4OjLPttwtqG6ZaLVUedfxD3rcVgry3Ue6E4Iq
	EvrCa0vIbdob6n4ZbnPN2fQjuDx3TR7C/NC2dLBivkibWHot7t9TAGFyj58x0eZSMyZE
	IOVomQONpumh67cqaTsyGKTV4P6mVJYcjERGjrCwVXuY72KBpeL3Gm2MWUbj01kW1js3
	2qQppO3DKgcIxR496V8anVWJQFDP3lhLKrgvxHpPayuyzaiWtnAOqGu+a70ZiCdroXAk
	y/LZTcuhJkzRQDJ01maQOvaoDISRa29hB0uCjoEK676uPeXxqA9u5j85kaVsixhjUfrS
	Kypg==
X-Gm-Message-State: AG10YOTO7KbVhtCjlHU6tlTZrS13dLBidzYYSzFdlOucTDApKa/XXBG2v/xxoJZHl5mFFQ==
X-Received: by 10.195.12.75 with SMTP id eo11mr28987426wjd.50.1453904017624;
	Wed, 27 Jan 2016 06:13:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x10sm6424915wjx.8.2016.01.27.06.13.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 06:13:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 15:15:49 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160127141549.GG2574@jama>
References: <1452726499-3950-1-git-send-email-nate.karstens@garmin.com>
MIME-Version: 1.0
In-Reply-To: <1452726499-3950-1-git-send-email-nate.karstens@garmin.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH v4] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Wed, 27 Jan 2016 14:13:38 -0000
X-Groupsio-MsgNum: 59722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TmwHKJoIRFM7Mu/A"
Content-Disposition: inline

--TmwHKJoIRFM7Mu/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 05:08:19PM -0600, Nate Karstens wrote:
> Adds a new recipe for dhcpcd version 6.10.0.

It was merged, but there is QA warning:
dhcpcd-6.9.4: dhcpcd rdepends on libudev, but it isn't a build dependency? =
[build-deps]

Please send follow-up patch to fix this.

> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
> ---
>  .../recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb   | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.=
10.0.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb=
 b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
> new file mode 100644
> index 0000000..058a932
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
> @@ -0,0 +1,22 @@
> +SECTION =3D "console/network"
> +SUMMARY =3D "dhcpcd - a DHCP client"
> +DESCRIPTION =3D "dhcpcd runs on your machine and silently configures you=
r computer to work on the attached networks without trouble and mostly with=
out configuration."
> +
> +HOMEPAGE =3D "http://roy.marples.name/projects/dhcpcd/"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://dhcpcd.c;endline=3D26;md5=3D77c40d671aff804=
ca91ea99556da8e9b"
> +
> +SRC_URI =3D "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.x=
z"
> +
> +SRC_URI[md5sum] =3D "f39c5773e7c4bea352d9fb7367c899de"
> +SRC_URI[sha256sum] =3D "ab56af9b2e86913c55a965cb0f835e87749df78318564acf=
90d5d698f413ad35"
> +
> +inherit autotools
> +
> +B =3D "${S}"
> +EXTRA_OECONF =3D "--enable-ipv4 --enable-ipv6"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"
> +
> +RDEPENDS_${PN} =3D "udev"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TmwHKJoIRFM7Mu/A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlao0RQACgkQN1Ujt2V2gBzGGwCeM2Wv7k055Xwhqe7NuO27xKBK
qMAAoJAL+Jtpk6/Ea8ygdzV9rvzRguPD
=e7CF
-----END PGP SIGNATURE-----

--TmwHKJoIRFM7Mu/A--
