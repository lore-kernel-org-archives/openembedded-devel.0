Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 27BA871A00
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:04:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 68so17011189wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eWCnx2fDCuDQHl1K2PkM92HVWwWhHgIswGXwYZVc+PA=;
	b=YglTTVUCPn20AgT52phvlTSxKx6NMYTD/5cWI58SK6DeYsS1ol6YBVz7D28NoFc8Cb
	/2iVjCHoPUeW3dAhfsuzNe+FvLRc/e6y4T6JF/lchPWQAj7ClF8jl4TnI6GxI9OOlENP
	sH6cBRMZhCW+v1Mq9e5QMePlQkSIcuW2vMBETucAEdkSkNO2rqicse+IDyU+B0y4pvtc
	Y3ogMnBPqyGycJj/+IDgcDTdExfYg8o3OQRWVHvf7S9tywm/KDEvLI23pkkavAmelmgN
	K8GjRJCktlqN3c+uBiYfeTs1dvSNFgFvduseC2CY1HmvKN3RrigQEFHwRSCsxN+jTFUP
	/9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eWCnx2fDCuDQHl1K2PkM92HVWwWhHgIswGXwYZVc+PA=;
	b=aCPQJdaeL7QGp1TEdI4Ecrks7LjWzFAyxr7avsjfSdmwpj7ovzB68R5PiG8v8L/e1C
	mBFxZhKlt5VxTZJ1ZmNSghBiq8+ngBlTuEJgtdPmQnfPwa5bcguJFunFCYwruuEaYnjk
	qVQwznV5gGj+3gXhoSMNfWv+6nuDp7BYBwP1MSa8DyH7oLGq9OhsWd/l3Si8B6lHffzE
	02m8pepgpdYWRrf73YZ3OcB6aMp8/y8C1sCEYoZn42Rlq/t1vuxV5MgN+z1DUk9KwILT
	jBPZ49u1UjVnhOffxxgkRXE6HEjnlvPBjrvPZyDKJiXuxnKQb7FLLGWEevXBYk/39fzL
	+RDQ==
X-Gm-Message-State: ABUngvd2gNCwxhzQ8jdV43NR5peFemcqDSSIGvKSOYZExzPs4JvYAaSiH6sW5S8Cw9UNow==
X-Received: by 10.28.113.218 with SMTP id d87mr2513355wmi.111.1478023454113;
	Tue, 01 Nov 2016 11:04:14 -0700 (PDT)
Received: from localhost ([217.30.64.102]) by smtp.gmail.com with ESMTPSA id
	f194sm31894255wmg.12.2016.11.01.11.04.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 Nov 2016 11:04:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Nov 2016 19:04:18 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161101180418.GC2985@jama>
References: <1477886266-2836-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1477886266-2836-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-networking][V2]PATCH] wireshark: install missing header files
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
X-List-Received-Date: Tue, 01 Nov 2016 18:04:16 -0000
X-Groupsio-MsgNum: 63680
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline

--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 08:57:46PM -0700, Armin Kuster wrote:
> Wireshark does not install header files. add install_append
> Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer need=
ed
>=20
> V2]
> add missing libssh and sbc config
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-support/wireshark/wireshark_2.2.1.bb   | 28 ++++++++++++++++=
++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb=
 b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> index a5fb7f6..4e23bae 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> @@ -4,7 +4,7 @@ SECTION =3D "net"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
> =20
> -DEPENDS =3D "pcre expat glib-2.0 sbc"
> +DEPENDS =3D "pcre expat glib-2.0"
> =20
>  SRC_URI =3D "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz=
2"
> =20
> @@ -37,13 +37,33 @@ PACKAGECONFIG[lua] =3D "--with-lua=3Dyes, --with-lua=
=3Dno, lua"
>  PACKAGECONFIG[zlib] =3D "--with-zlib=3Dyes, --with-zlib=3Dno, zlib"
>  PACKAGECONFIG[geoip] =3D "--with-geoip=3Dyes, --with-geoip=3Dno, geoip"
>  PACKAGECONFIG[plugins] =3D "--with-plugins=3Dyes, --with-plugins=3Dno"
> +PACKAGECONFIG[sbc] =3D "--with-sbc=3Dyes, --with-sbc=3Dno, sbc"
> +
> +PACKAGECONFIG[libssh] =3D "--with-ssh=3Dyes, --with-ssh=3Dno, libssh2"
> +
> =20
>  # these next two options require addional layers
>  PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with-c-ares=3Dno, c-ar=
es"
> =20
>  EXTRA_OECONF +=3D "--with-qt=3Dno --enable-tshark --enable-rawshark"
> =20
> -ALLOW_EMPTY_${PN} =3D "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +# Currently wireshark does not install header files
> +do_install_append () {
> +
> +	install -d ${D}/${includedir}/${BPN}
> +	install -d ${D}/${includedir}/${BPN}/epan
> +	install -d ${D}/${includedir}/${BPN}/epan/crypt
> +	install -d ${D}/${includedir}/${BPN}/epan/dfilter
> +	install -d ${D}/${includedir}/${BPN}/epan/dissectors
> +	install -d ${D}/${includedir}/${BPN}/epan/ftypes
> +	install -d ${D}/${includedir}/${BPN}/epan/wmem
> =20
> -FILES_${PN} +=3D "${datadir}*"

Doesn't this still cause many unpackaged files and QA errors as reported
earlier?

> +	install config.h ${D}/${includedir}/${BPN}
> +	install ${S}/register.h ${D}/${includedir}/${BPN}
> +	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
> +	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
> +	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
> +	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/diss=
ectors
> +	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
> +	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
> +}
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgY2SEACgkQN1Ujt2V2gBwz1wCeI/jjfihSoTqB0jLvOCi9+jSk
vCEAn3m49UYrcj22nteEx8vacCKI1tP+
=Yffc
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
