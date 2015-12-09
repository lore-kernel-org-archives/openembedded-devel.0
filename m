Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A6FA560616
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 15:15:30 +0000 (UTC)
Received: by wmww144 with SMTP id w144so77651782wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2015 07:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=7YbMcc7x6WF+q9CMVMkFe0HlQfUlkcsr3b0oNkHkQdM=;
	b=J4i517DGY8etjBswFFJ48Ca3y5XWmWWKehWyzovEqdOKC7cNXow0tYyoqpunrTJn9A
	BuUNCNtd4j7CQh7cXRA/Aex7CdmQoOXYeh7IvGGgwfiFwBUexcre1CZMxzTKwLSgSUuF
	hUXNMJ3MJuo5gOvhsqMp028Pv1srzipTcAOwcoUbGTYhyRGaOtG/xdIcvliusGeDbQuG
	GY5FPQllLFst+KVGYffnB58D/cR20wR+40QhBVcU+Mcx93X0dd/Mvd8n7lGYuQP8la7y
	Rkjj5fMFvVbVTB6nTHiWnW9qDyCQdi/NIBQ+2S+nUgAT2/neWb6qwvUOERproh+7R07S
	fuSg==
X-Received: by 10.28.68.213 with SMTP id r204mr33648284wma.35.1449674129457;
	Wed, 09 Dec 2015 07:15:29 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id vu4sm8151044wjc.2.2015.12.09.07.15.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Dec 2015 07:15:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1449645308-25141-1-git-send-email-jackie.huang@windriver.com>
Date: Wed, 9 Dec 2015 16:15:26 +0100
Message-Id: <63525F2D-BD9F-4511-80D2-5E30220115E3@gmail.com>
References: <1449645308-25141-1-git-send-email-jackie.huang@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java] [PATCH] antlr/cup: inherit java-bootstrap-components
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
X-List-Received-Date: Wed, 09 Dec 2015 15:15:31 -0000
X-Groupsio-MsgNum: 58953
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F32F5768-5332-4588-B029-E9356B19AAAE";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_F32F5768-5332-4588-B029-E9356B19AAAE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 09.12.2015 um 08:15 schrieb jackie.huang@windriver.com:
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> This should be part of the following commit but missed:
> commit 04d5d0bf414c05ca59618d77f17ff9898aa1c566
> Author: Jens Rehsack <rehsack@gmail.com>
> Date:   Tue Dec 8 14:51:50 2015 +0100
>=20
>    meta-java: rely on well known bootstrap-path
>=20
>    Instead of potential circular depending virtual/javac-native (even =
this
>    recipe provides such a useable java-native), rely on well known =
path
>    via cacao-native to build up to icedtea7-native in reliable manner.
>=20
>    virtual/javac-native should be used by parts not belonging to the =
bootstrap
>    phase.
>=20
>    Signed-off-by: Jens Rehsack <sno@netbsd.org>
>    Signed-off-by: Maxin B. John <maxin.john@intel.com>
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> recipes-core/antlr/antlr_2.7.7.bb | 2 +-
> recipes-core/cup/cup_0.10k.bb     | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-core/antlr/antlr_2.7.7.bb =
b/recipes-core/antlr/antlr_2.7.7.bb
> index 9d9d2d4..cff9535 100644
> --- a/recipes-core/antlr/antlr_2.7.7.bb
> +++ b/recipes-core/antlr/antlr_2.7.7.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3D361934e706423915b4d9f413ad37fb65"
> SRC_URI =3D "http://www.antlr2.org/download/${BP}.tar.gz"
> SRC_URI_append_class-native =3D " file://runantlr"
>=20
> -inherit java-library
> +inherit java-library java-bootstrap-components
>=20
> do_configure_class-native() {
>     sed -i -e"s|@JAR_FILE@|${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar|" =
${WORKDIR}/runantlr
> diff --git a/recipes-core/cup/cup_0.10k.bb =
b/recipes-core/cup/cup_0.10k.bb
> index 2a957f9..f2f254e 100644
> --- a/recipes-core/cup/cup_0.10k.bb
> +++ b/recipes-core/cup/cup_0.10k.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://${WORKDIR}/LICENSE;md5=3D2c9db91c00f38e52cfc8e67bafaa7c
> RDEPENDS_${PN} =3D "java2-runtime"
> RDEPENDS_${PN}_virtclass-native =3D ""
>=20
> -inherit java-library
> +inherit java-library java-bootstrap-components
>=20
> SRC_URI =3D =
"http://www.cs.princeton.edu/~appel/modern/java/CUP/java_${BPN}_v10k.tar.g=
z \
> 	   file://cup \
> --
> 2.3.5
>=20

It's very likely that I didn't catch the very latest dependency, even =
checking multiple times.
Usually an already published history shouldn't been rewritten (I would =
be fine with that, but maybe other users get offended).

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_F32F5768-5332-4588-B029-E9356B19AAAE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWaEWPAAoJEESZlq7c5QqdPOkQAJKd5n5ZPotAEwptwSTLv7EC
/MGMn+05hCbM880Yt0CDJW60y0rYHf/XSQ3jpkaJ5BIS76wpIQ2DiBvqIkBtMNSv
EWTr6MCCcdn26MXbZh6YscNXBb6HvO5CZ2NsctK4k9A3lWGZ/fg2aV+UjZIZXYqI
cqD+zh3wzs+nnCDl0Xgaci7d+/KgbZXKChTokeTaV6LccJnd653ltOoI577GCgSo
u27JYrkm1xn8P7s2ggH7reBb8RlMKD6gAdWjWoXezgjkS93VgpxGPp3RB+Bskogi
+5YyvOVq/8cN4CDZw8hM5i63CpT04iz4czcs4YkcvNev3eDlP6YskZ7hChZLEnu/
XCQi9I4dpY63GEfnnN9xNYrKKKOeH9HS8Se09hxCkhc2P2vOcZH4O/l45fIWZUIp
IAF1Zma+L3qK0Ov79kYW/q7+z6EfbrClskWAAm3SxuJYbsn3qfTSpB87lyxQ89x0
QRECh+I9Rfcb/nWyppG+UKq2Y4TsLFkO4rXJb3otTbi3c6bTyAY1znR6ok08brox
SyJc+qRBBCIl3DEaWNROJNFN5yZtUL+5SMDP2Ub1PrDrSyr3f6en4f0fnc7Nxh4/
S2zfpijhWWtYGuOdYpxM6J9t01Swvkk0PAEYyEC3Wvd2QzAEOUkaPIWfYwEEyc6T
X788cOObu9P9QZGqGli+
=AaEP
-----END PGP SIGNATURE-----

--Apple-Mail=_F32F5768-5332-4588-B029-E9356B19AAAE--
