Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7Zrg-0007Sr-G9
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 00:11:24 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so3033965pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 14:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=77dDHKauz6JoS3TTGycp+IsOc2xl+wRoWr7pfHM3XeA=;
	b=oUYOfRIpfpxi2ek8QXPipImlv0dGT7+bP/g0tpfyN09+zlwsv/KbPJoN5/o4//mM1A
	ErZaQCykubBVLJ6vrNehN4zjW1Vb49VI8Io0uJlWqQx16wkaD2RQkjJnqsQTnQhzQfvr
	AihKD8iduwquYRXvU2glD6e1k2LC1nbIHTxKIiNA/YxzlA+eOwPQabND20p6kl1rmh/G
	q2L9oQfhGkiX0gEzBxc4z6UAVCeFdbDeIb7vN1Sytf9vugfdO+MN3idKN4444CiueLV2
	wzNPwiiE1x0y2NSUqdX4dNIWXEAOdvOst0eGv722qH9D6Xu3D/euLRCX1AOamqDe6fH9
	Fotg==
X-Received: by 10.68.39.129 with SMTP id p1mr17240953pbk.19.1361228107424;
	Mon, 18 Feb 2013 14:55:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hp7sm15735581pbc.8.2013.02.18.14.55.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 14:55:06 -0800 (PST)
Date: Mon, 18 Feb 2013 23:55:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130218225508.GK3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360343179-29346-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360343179-29346-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] cyrus-sasl2: add 2.1.26
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 23:11:26 -0000
X-Groupsio-MsgNum: 43228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdv96I0Kd+XSW/CM"
Content-Disposition: inline

--fdv96I0Kd+XSW/CM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2013 at 06:06:19PM +0100, Marcin Juszkiewicz wrote:
> I took recipe from OE classic, updated, cleaned and got it build. I use
> it only as build dependency - did not checked binaries from ${PN}-bin.
>=20
> There are RPATH problems to solve:
>=20
> WARNING: QA Issue: package cyrus-sasl-bin contains bad RPATH
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysro=
ots/genericarmv8/usr/lib
> in file
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/=
aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl-bin/usr/sbi=
n/saslpasswd2
> WARNING: QA Issue: package cyrus-sasl-bin contains bad RPATH
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysro=
ots/genericarmv8/usr/lib
> in file
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/=
aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl-bin/usr/sbi=
n/pluginviewer
> WARNING: QA Issue: package cyrus-sasl-bin contains bad RPATH
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysro=
ots/genericarmv8/usr/lib
> in file
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/=
aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl-bin/usr/sbi=
n/sasldblistusers2
> WARNING: QA Issue: package cyrus-sasl contains bad RPATH
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysro=
ots/genericarmv8/usr/lib
> in file
> /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/=
aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl/usr/lib/sas=
l2/libsasldb.so.3.0.0

It was building with only those QA warnings before, but now on 2nd build
it fails with fatal error:

| checking for SPNEGO support in GSSAPI libraries... configure: error:
in
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/cyrus-sasl/2.1.26-r0/cyrus-sasl-2.1.26':
| configure: error: cannot run test program while cross compiling
| See `config.log' for more details

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl=
_2.1.26.bb
>=20
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
=2Ebb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> new file mode 100644
> index 0000000..44336f0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION =3D "Generic client/server library for SASL authentication."
> +SECTION =3D "console/network"
> +DEPENDS =3D "openssl virtual/db"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f55e0974e3d6db00ca6f57f2d206=
396"
> +
> +SRC_URI =3D "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz "
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
> +                 --with-bdb-libdir=3D${STAGING_LIBDIR} \
> +                 --with-bdb-incdir=3D${STAGING_INCDIR} \
> +                 --without-pam --without-opie --without-des"
> +
> +do_configure_prepend () {
> +    rm -f acinclude.m4 config/libtool.m4
> +}
> +
> +do_compile_prepend () {
> +    cd include
> +    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} makemd5.c -o makemd5
> +    touch makemd5.o makemd5.lo makemd5
> +    cd ..
> +}
> +
> +pkg_postinst_${PN}-bin () {
> +    grep cyrus /etc/passwd || adduser --disabled-password --home=3D/var/=
spool/mail --ingroup mail -g "Cyrus sasl" cyrus
> +    echo "cyrus" | saslpasswd2 -p -c cyrus
> +    chgrp mail /etc/sasldb2
> +}
> +
> +SRC_URI[md5sum] =3D "a7f4e5e559a0e37b3ffc438c9456e425"
> +SRC_URI[sha256sum] =3D "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16=
b3d406f1345b7bc3"
> +
> +PACKAGES =3D+ "${PN}-bin"
> +
> +FILES_${PN}           +=3D "${libdir}/sasl2/*.so.*"
> +FILES_${PN}-bin       +=3D "${bindir}"
> +FILES_${PN}-dev       +=3D "${libdir}/sasl2/*.so ${libdir}/sasl2/*.la"
> +FILES_${PN}-dbg       +=3D "${libdir}/sasl2/.debug"
> +FILES_${PN}-staticdev +=3D "${libdir}/sasl2/*.a"
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fdv96I0Kd+XSW/CM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEisUwACgkQN1Ujt2V2gByyMQCfSb1QY65gnw/SrADBcMt0gHy4
cnsAnj3n0+iz1Jo+Aky1C1pjNbG2tNkf
=++9F
-----END PGP SIGNATURE-----

--fdv96I0Kd+XSW/CM--
