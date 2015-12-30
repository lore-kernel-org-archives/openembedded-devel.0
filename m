Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC0260589
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 20:48:28 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id uo6so121239911pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 12:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=1ywFojmFQ6aJy/hYDs+7inbl8itIeMd6nq/b6ey0yKY=;
	b=Kn2tEawZ9uaftHIf8OZy8yH3IcT+33cWDVFtDg+5b8TcZNa+xgop4MQFCD6orhk7p2
	RhoDyUB+C1TpNgCRxFaVoH0ibsvxeu8pjEGmRhwEt0Rd299FbJbSN2Q8WpKIWVCooGbI
	ZaE2F7lscHLQHOH3CQOAmbCPvTTcy0QCIQpJXRMBh5OAjFouG+7+BGnpCY2pxDleRiQk
	Tojccm70Zb/ZxfmHanx3EJsyx4570Dcby8SU8pnjb06BuvKBS73S0yfL0wGiro08NjTP
	KNxg+u6QRUCDWztCUUE2QUgeLz7ooOy6kBJToS818U2nG3+lIe5KkxupZcnQSzmAzqYw
	LRKQ==
X-Received: by 10.66.141.41 with SMTP id rl9mr96087308pab.139.1451508509130;
	Wed, 30 Dec 2015 12:48:29 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:30cb:380:8779:5f88?
	([2601:646:8802:5d5c:30cb:380:8779:5f88])
	by smtp.gmail.com with ESMTPSA id
	r83sm30375208pfa.13.2015.12.30.12.48.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 12:48:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1451506017-6206-1-git-send-email-twoerner@gmail.com>
Date: Wed, 30 Dec 2015 12:48:23 -0800
Message-Id: <D7088E06-64E6-48CF-B84B-4E47815CFA38@gmail.com>
References: <1451506017-6206-1-git-send-email-twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe][PATCH v2] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Wed, 30 Dec 2015 20:48:30 -0000
X-Groupsio-MsgNum: 59242
Content-Type: multipart/signed;
	boundary="Apple-Mail=_95063FF6-A96C-4C12-8295-BDBD17D36763";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_95063FF6-A96C-4C12-8295-BDBD17D36763
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 30, 2015, at 12:06 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> Additionally, the LICENSE file changed: Updated node LICENSE file with =
new npm
> license:
>=20
> - npm's license changed from being copyrighted "Isaac Z. Schlueter" to =
"npm,
>  Inc. and Contributors"; more text was added clarifying the copyrights =
to
>  things such as the npm logo, the typeface, and trademarks

Does this mean we need to alter packaging of these files ?
are there any commercial implications ?

>=20
> - further text was added clarifying the separation between npm itself =
and the
>  various npm packages, their data and licenses
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> .../recipes-devtools/nodejs/{nodejs_4.2.3.bb =3D> nodejs_4.2.4.bb}    =
| 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.3.bb =3D> =
nodejs_4.2.4.bb} (93%)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb =
b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> index 66a3c11..18e23b7 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
> @@ -1,7 +1,7 @@
> DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> HOMEPAGE =3D "http://nodejs.org"
> LICENSE =3D "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Dee90ba97d933fc8d56e97812b7dd62e9"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D963ca39eebcb15ac618bc3006504ae3f"
>=20
> DEPENDS =3D "openssl"
>=20
> @@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
> SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>     file://no-registry.patch \
> "
> -SRC_URI[md5sum] =3D "529a8abd4ca5a2225636767d3f14c382"
> -SRC_URI[sha256sum] =3D =
"5008ade5feb4b089f59163f66bffddc113f27de5d78edf203e39435c2c5d554f"
> +SRC_URI[md5sum] =3D "86e4d0d8b626f6e60ca7bef02f2543d2"
> +SRC_URI[sha256sum] =3D =
"4ee244ffede7328d9fa24c3024787e71225b7abaac49fe2b30e68b27460c10ec"
>=20
> S =3D "${WORKDIR}/node-v${PV}"
>=20
> --
> 2.7.0.rc3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_95063FF6-A96C-4C12-8295-BDBD17D36763
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaEQxsACgkQuwUzVZGdMxQhtACePdeS1B41rmCy3kBfBbUQ5xgN
7nQAniXADKjkBRNeLCLKyFVL2bcBybRx
=vLNj
-----END PGP SIGNATURE-----

--Apple-Mail=_95063FF6-A96C-4C12-8295-BDBD17D36763--
