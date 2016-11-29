Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B882171AAE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:04:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so23084652wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=luXrPBfFdBUtaonH5dclUArbcCBsY15ATy00GJNZWrA=;
	b=E+taK+3vvUVm+raGb03ztSUdnnzInmpHU+GeLUAUgbsbpD92Mf2ciurMkw7VG92l1u
	x1mA9sZa3WzpbWUU449aw+Urcun2ifYvm28Ff3zwT0KrGzWQyJRQN0LxkZbo1WSghgI1
	kuskIkfbPtxMwxgNNrM3oBQhIarOIziu3Dp9MYriDet7Yc4zy95FwL0rCfoAl2fns5Xa
	wxFUVOzGf7T28FLVP0FJqjlsR9IDNC/PfCbg89CHG9YC8tpX/Y9jVbAiNzsb3JUXOjBk
	kerw5vRx99HPSaobH12BnLnABuboS8gOsEU9AHQ49rbesRyb8THFx602Y1yJub5wVKL6
	H7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=luXrPBfFdBUtaonH5dclUArbcCBsY15ATy00GJNZWrA=;
	b=SLk9Kb7ouCx1jyH61pQiSmPdxUzQRBMOgT5bZ4FNJKQZAurm3X76E0H+qUYA/3ksln
	QcVMMCoyARf+/zCQ/ILxKbl7P5sO3++Nva8lflHAnAcysjcJTGdrPXL2VslEiAiAqm0J
	dy9e65v6rNM/uOlJfQgjxXXjUnM6wYgvb0jAECx3NbhY3bIpVdp9i0m8c67PGCYmp+yV
	krCVyZCboIOh8KGNT7Y5LgMnqbpv0ERTOVBU9RtDb1VA2/YEXmAXy3WlDyYQ3FvFtAUA
	roQElBfEeDRoPOMr++G6SBgfPP02vTc6tSRD2acgTIOcBpqzxn3aaHS5oO8NcKO6P7pQ
	SyQA==
X-Gm-Message-State: AKaTC00qUbwofYeo+ZdZZPVoWZemjGad2miRU5KuKFZT8e5Jjnm6XhAK3sPyLcsbaN5o/g==
X-Received: by 10.28.71.14 with SMTP id u14mr21710583wma.52.1480410255225;
	Tue, 29 Nov 2016 01:04:15 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c133sm1680800wme.12.2016.11.29.01.04.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Nov 2016 01:04:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Nov 2016 10:04:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161129090416.GA2700@jama>
References: <20161126062435.27569-1-raj.khem@gmail.com>
	<20161126062435.27569-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161126062435.27569-3-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-networking][PATCH V3 3/4] dante: Add recipe for 1.4.1
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
X-List-Received-Date: Tue, 29 Nov 2016 09:04:15 -0000
X-Groupsio-MsgNum: 64091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2016 at 10:24:34PM -0800, Khem Raj wrote:
> * Add packageconfig for krb5
> * Require pam in distro
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-protocols/dante/dante_1.4.1.bb         | 49 ++++++++++++++++=
++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/dante/dante_1.4.1.bb
>=20
> diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/met=
a-networking/recipes-protocols/dante/dante_1.4.1.bb
> new file mode 100644
> index 0000000..0fb0f67
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> @@ -0,0 +1,49 @@
> +SECTION =3D "console/utils"
> +SUMMARY =3D "A free SOCKS server"
> +DESCRIPTION =3D "Dante consists of a SOCKS server and a SOCKS client,\
> +implementing RFC 1928 and related standards. It is a flexible product\
> +that can be used to provide convenient and secure network\
> +connectivity. Once installed, Dante can in most cases be made\
> +transparent to clients, providing functionality somewhat similar to\
> +what could be described as a non-transparent Layer 4 router."
> +HOMEPAGE =3D "http://www.inet.no/dante/"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D221118dda731fe93a85d0ed973467=
249"
> +
> +SRC_URI =3D "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
> +          "
> +SRC_URI[md5sum] =3D "68c2ce12119e12cea11a90c7a80efa8f"
> +SRC_URI[sha256sum] =3D "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d80=
4b50b48f261c4f53"
> +
> +# without --without-gssapi, config.log will contain reference to /usr/lib
> +# as a consequence of GSSAPI path being set to /usr by default.
> +# --with-gssapi-path=3DPATH specify gssapi path
> +# --without-gssapi        disable gssapi support
> +# --enable-release        build prerelease as full release
> +EXTRA_OECONF +=3D "--without-gssapi --sbindir=3D${bindir}"
> +
> +DEPENDS +=3D "flex-native bison-native libpam"
> +
> +inherit autotools-brokensep
> +
> +REQUIRED_DISTRO_FEATURES =3D "pam"

Did you forget to add distro_features_check to inherit?

I've added this when cherry-picking to master-next, but not sure if Joe
will pick it from there.

> +
> +EXTRA_AUTORECONF =3D "-I ${S}"
> +
> +PACKAGECONFIG[libwrap] =3D ",--disable-libwrap,tcp-wrappers,libwrap"
> +PACKAGECONFIG[krb5] =3D ",--disable-krb5,krb5"
> +
> +PACKAGECONFIG ??=3D ""
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}
> +    cp ${S}/example/sock[sd].conf ${D}${sysconfdir}
> +}
> +
> +PACKAGES =3D+ "${PN}-sockd ${PN}-libdsocks "
> +
> +FILES_${PN}-libdsocks =3D "${libdir}/libdsocks.so"
> +FILES_${PN}-sockd =3D "${bindir}/sockd ${sysconfdir}/sockd.conf"
> +
> +INSANE_SKIP_${PN}-libdsocks =3D "dev-elf"
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWD1EjwAKCRA3VSO3ZXaA
HI27AKCgnxm/lPhcdqx89xwFZRaf4+COVgCgsA98G8YydjfuNkYfA/OV/nyHU5c=
=Od+i
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
