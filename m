Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E058A731C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:38:14 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f206so167751863wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gi2EB55FTIdvr3/a5Ckf+NupoQm42gHM1YvOoPGYEJI=;
	b=KhpXv+2+cyGywTDf/biBMtX5NS3ScTHmIqye4bk+fA8Y5xef1gAAClmXwOcf1KwydB
	QhYm8V1hpzsZ+AdWzOu9owPqAJT3q+tdgQh/pF2IAM7+UhdvKHzJnUKEFAUY4NSx24q7
	VvXe/N3sPCQ+HhInngT2JWg2/YiKqIvyE3d2Z5BZVCRuhdChq5Pi//74LGwsJg/3Y6ms
	9ZAYLqEolWqPYLqyQf1VrgFI1BDdi4oZB3gndY3aeax/EKHMo3pYw9ac8etCm0xe2C+e
	jOl68vkw9GwvsQTaQBAmueed+yRsanXh3aJAtSSF0o+49ok+dnAboLlUIF4cf5q60y0o
	7WUA==
X-Received: by 10.194.115.164 with SMTP id jp4mr57680919wjb.26.1451903894649; 
	Mon, 04 Jan 2016 02:38:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w80sm56201370wme.17.2016.01.04.02.38.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 02:38:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 11:42:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104104224.GB2581@jama>
References: <1450813380-3570-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1450813380-3570-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Mon, 04 Jan 2016 10:38:15 -0000
X-Groupsio-MsgNum: 59299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline

--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 02:43:00PM -0500, Philip Balister wrote:
>  * Run tested cpp bindings with GNU Radio Control Port.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 30 ++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-o=
e/recipes-connectivity/thrift/thrift_0.9.3.bb
> new file mode 100644
> index 0000000..43b93cd
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> @@ -0,0 +1,30 @@
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4ed21f679b2aafef26eac82ab0c2=
cbf"
> +
> +SRC_URI =3D "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=
=3Dhttps \
> +"
> +SRCREV =3D "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "thrift-native boost python libevent flex-native bison-nativ=
e openssl"

Autodetects qt5 qmake and fails to use it, please disable it explicitly

| -- Parsed Thrift version: 1.0.0 (1.0.0)
| CMake Error at
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib/cmake/Qt=
5Core/Qt5CoreConfig.cmake:27
(message):
|   The imported target "Qt5::Core" references the file
|=20
|      "/qmake"
|=20


> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +inherit pkgconfig cmake pythonnative
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +export BUILD_SYS
> +export HOST_SYS
> +
> +EXTRA_OECMAKE =3D "-DWITH_QT4=3DOFF"
> +EXTRA_OECMAKE_append_class-native =3D "-DWITH_QT4=3DOFF -DBUILD_TESTING=
=3DOFF \
> +             -DBUILD_EXAMPLES=3DOFF -DWITH_CPP=3DOFF"
> +EXTRA_OECMAKE_append_class-nativesdk =3D "-DBUILD_TESTING=3DOFF \
> +             -DBUILD_EXAMPLES=3DOFF -DWITH_PYTHON=3DOFF"
> +
> +do_install_append () {
> +	cd ${D}/${bindir}
> +	ln -sf thrift thrift-compiler
> +}
> +
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKTI8ACgkQN1Ujt2V2gBxJKgCaAs7yQF2pMVZQ2KJ+lboWThVX
kYYAni9i1FnpCzmyjsO0KVTSVOxZQyUP
=bbyZ
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
