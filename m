Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id ADCC560616
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:58:41 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p187so61362364wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZRrnqzfFIzDGJ2pmkcKy+q5jtfeEXI3FEhjuIVI9xrI=;
	b=qcfOYlIYd+r256IC7s4iszUub5MGBEBBQWVBUULjkCZo98jx1MvnrPunOHYOUANViA
	bb+BPW+oo8vxwAkOEUPeMCcomNRi0wSlhlfecS3bB4cqQq13sPKfzwTDEexQY8HABNhQ
	oRQj1v+KHZw9CHcO8yuYR2lq3YlcE4jnyvhNlGgMXv5FnIQyu3w902lr3CXHLluvg/u9
	q0Z/5nIoaWLp5DuP7Rh4sAtvxgbCYAHukkCCjxd6mYwm8HhNKZJDTjyMsqI50z0iLKdC
	QZtk+VVEVUe7h/pGu1px1zKoADvph0vaNAAhu5Xe23XDbTXOJhhx9P4sN/6gTnfCctzc
	ttAA==
X-Received: by 10.194.79.201 with SMTP id l9mr4009397wjx.151.1450439921682;
	Fri, 18 Dec 2015 03:58:41 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	o132sm1434287wmb.7.2015.12.18.03.58.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 03:58:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 13:01:12 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151218120112.GF2563@jama>
References: <1450251876-4321-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1450251876-4321-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe][v3] phoronix-test-suite: uprev it to 6.0.1
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
X-List-Received-Date: Fri, 18 Dec 2015 11:58:42 -0000
X-Groupsio-MsgNum: 59096
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ls2Gy6y7jbHLe9Od"
Content-Disposition: inline

--Ls2Gy6y7jbHLe9Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2015 at 03:44:36PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. inherit systemd and move the systemd unit files to correct dir
> 2. inherit allarch
> 3. add bash/python to RDEDEPENDS

v2 was merged today, can you please rebase and resend follow-up with
changes from v3?

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...-suite_5.2.1.bb =3D> phoronix-test-suite_6.0.1.bb} | 21 +++++++++++++=
+++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suit=
e_5.2.1.bb =3D> phoronix-test-suite_6.0.1.bb} (56%)
>=20
> diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-=
suite_5.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-tes=
t-suite_6.0.1.bb
> similarity index 56%
> rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-s=
uite_5.2.1.bb
> rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-sui=
te_6.0.1.bb
> index ef9f735..6b16887 100644
> --- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5=
=2E2.1.bb
> +++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6=
=2E0.1.bb
> @@ -6,19 +6,34 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504"
>  SECTION =3D "console/tests"
> =20
>  SRC_URI =3D "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "51e52d883710dc516c5494bd1c377219"
> -SRC_URI[sha256sum] =3D "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646d=
a2b2e3a60dda6cd9"
> +SRC_URI[md5sum] =3D "c3b26fcc57a3a253e558f759fdc1089f"
> +SRC_URI[sha256sum] =3D "27add54f4ecb464549de580cece84b4a4945b99df3ef7ff7=
034eb7f23ffb3b39"
>  S =3D "${WORKDIR}/phoronix-test-suite"
> =20
> +inherit systemd
> +
>  do_install() {
>  	DESTDIR=3D${D} ./install-sh ${exec_prefix}
> +
> +	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)};=
 then
> +		if [ "${systemd_unitdir}" !=3D "/usr/lib/systemd" ]; then
> +			install -d ${D}/${systemd_unitdir}/system/
> +			mv ${D}/usr/lib/systemd/system/* ${D}/${systemd_unitdir}/system/
> +			rm -rf ${D}/usr/lib/
> +		fi
> +	else
> +		rm -rf ${D}/usr/lib/
> +	fi
>  }
> =20
> -RDEPENDS_${PN} =3D "php-cli"
> +SYSTEMD_SERVICE_${PN} =3D "phoromatic-client.service phoromatic-server.s=
ervice"
> +RDEPENDS_${PN} +=3D "bash python php-cli"
> +
>  FILES_${PN} +=3D " \
>  	${datadir}/phoronix-test-suite \
>  	${datadir}/appdata/phoronix-test-suite.appdata.xml \
>  	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
>  	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking=
=2Epng \
>  	${datadir}/mime/packages/openbenchmarking-mime.xml \
> +	${systemd_unitdir}/* \
>  "
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

--Ls2Gy6y7jbHLe9Od
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZz9YcACgkQN1Ujt2V2gBzl7ACbBUVehFQYcJ4Aw9vbYFu5kTva
E9AAn0aailggK2/4JYxFDItK5W/dao4F
=9X/A
-----END PGP SIGNATURE-----

--Ls2Gy6y7jbHLe9Od--
