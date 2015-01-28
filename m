Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id F2C447147D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 10:54:31 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so2470961wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=govGpLrMGBmvGDFxK4ZvmCjZ3bKUSuWhzYG3KDsSjrw=;
	b=yKVid/s1xCGRK86b8l6cCvxyoDTay03joRM9618sxRZLtY+w4zPUr4CUXBCYg3CEqD
	03NMkbvdrK5WrJEtL3c9bwTCet8rylg8CjSHDGmYsXxjYNOq3pVm6+b4hQh+/weInLuW
	AmrHOckFfbfC1TG7N/CLj+MCJZqiMoScL2uGvIhpDOrnO5EjTEhrigUdhgo/cjFAN2ng
	VZAQA9e1oaiL/LOn5RNTCFrRdX31wm8M/hOOSFjlqWCuUn4BV3o2oS791rkWLpJMpO98
	r7//owEVbEXtUJYdg/qUTiz7BD9tGtQ+15wXmqNId/ypWw3ByUbMY4AuesAJHrVt6gzL
	1rrQ==
X-Received: by 10.194.237.41 with SMTP id uz9mr6298469wjc.80.1422442472150;
	Wed, 28 Jan 2015 02:54:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ud9sm2275531wib.5.2015.01.28.02.54.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 02:54:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 11:54:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150128105433.GG2477@jama>
References: <1422006376-4509-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1422006376-4509-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] opensc: add new recipe
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
X-List-Received-Date: Wed, 28 Jan 2015 10:54:32 -0000
X-Groupsio-MsgNum: 54011
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7uYPyRQQ5N0D02nI"
Content-Disposition: inline

--7uYPyRQQ5N0D02nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2015 at 05:46:16PM +0800, Li xin wrote:
> OpenSC provides a set of libraries and utilities to work with smart cards.
> Its main focus is on cards that support cryptographic operations,
> and facilitate their use in security applications such as authentication,
> mail encryption and digital signatures.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/opensc/opensc_0.14.0.bb | 42 +++++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opensc/opensc_0.14.0.bb
>=20
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.14.0.bb b/meta-oe/re=
cipes-support/opensc/opensc_0.14.0.bb
> new file mode 100644
> index 0000000..bdb8d23
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc_0.14.0.bb
> @@ -0,0 +1,42 @@
> +SUMMARY =3D "Smart card library and applications"
> +DESCRIPTION =3D "OpenSC is a tool for accessing smart card devices. Basi=
c \
> +functionality (e.g. SELECT FILE, READ BINARY) should work on any ISO \
> +7816-4 compatible smart card. Encryption and decryption using private \
> +keys on the smart card is possible with PKCS \
> +such as the FINEID (Finnish Electronic IDentity) card. Swedish Posten \
> +eID cards have also been confirmed to work."
> +
> +HOMEPAGE =3D "https://github.com/OpenSC/OpenSC/wiki"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz"
> +SRC_URI[md5sum] =3D "1ee31dc2e89860458fd984e0cac9795e"
> +SRC_URI[sha256sum] =3D "ffe8bcc704f2ab9a05c6781bc815f00eaf75cba0a1bd21e3=
142b9194a7bed5c9"
> +
> +S =3D "${WORKDIR}/OpenSC-${PV}"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34"
> +
> +inherit autotools pkgconfig
> +DEPENDS =3D "openct pcsc-lite virtual/libiconv openssl"
> +
> +EXTRA_OECONF =3D " \
> +    --disable-static \
> +    --enable-openct \
> +    --disable-pcsc \
> +    --disable-ctapi \
> +    --enable-doc \
> +"
> +EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
> +
> +RDEPENDS_${PN} =3D "readline"
> +
> +FILES_${PN} +=3D "\
> +    ${libdir}/opensc-pkcs11.so \
> +    ${libdir}/onepin-opensc-pkcs11.so \
> +    ${libdir}/pkcs11-spy.so \
> +"
> +FILES_${PN}-dev +=3D "\
> +    ${libdir}/pkcs11/opensc-pkcs11.so \
> +    ${libdir}/pkcs11/onepin-opensc-pkcs11.so \
> +    ${libdir}/pkcs11/pkcs11-spy.so \
> +"

Fails to build in world:

| checking for OPENCT... yes
| checking XSLTPROC requirement... configure: error: Missing xslstylesheets=
dir
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opensc/0.14.0-r=
0/temp/log.do_configure.22998)
NOTE: recipe opensc-0.14.0-r0: task do_configure: Failed
ERROR: Task 8944 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe=
/recipes-support/opensc/opensc_0.14.0.bb, do_configure) failed with exit co=
de '1'

> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7uYPyRQQ5N0D02nI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTIv+kACgkQN1Ujt2V2gBxxZQCeMj+Jyu4TPOCYQUrvb1xLhcI0
NSAAn1DzzhCtz7ynhCp5v9mBRiBY25J5
=2VNH
-----END PGP SIGNATURE-----

--7uYPyRQQ5N0D02nI--
