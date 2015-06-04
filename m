Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1D49C736BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 05:59:09 +0000 (UTC)
Received: by qgfa63 with SMTP id a63so13410787qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 22:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=t46p029P/AWHPDjdzFUlOIpcT2UpcRkr7fusURX2ye0=;
	b=A+DTgIVDzqN8/pBvJ/+Zc26b43mOvapCZnHXRWFoQFcCRb+aMSGCwaaVBmtB1kBXDO
	hX2Yqy77wZnDzFfULKFsqA9iMlI8SIJrDEt136t+5XH6K2eEakDJ15+tPgwm1Flieje5
	B0ueekIUqC3XzpYsUb+CMB4mCkLI8xxAHZdObMKwaNz1GZXLbmG0Eyh4o5h5cK7sPyDR
	0pGFT+7ikRrPqnc4Cn9hrwUqwm0I3w9pAsaoaep4bIOrr8pX6lqY34F94XH5V7iq0vfq
	92a3opia4ZrLOOKpBxV3jW3fSBhWJdPBzEQ30l3zS4l4wwkYpcNSxZ4Wer2I9cwl2kV2
	EMBg==
X-Received: by 10.55.17.226 with SMTP id 95mr40919129qkr.63.1433397550617;
	Wed, 03 Jun 2015 22:59:10 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:243b:97d2:82f:b7e8?
	([2601:9:3580:84c:243b:97d2:82f:b7e8])
	by mx.google.com with ESMTPSA id w67sm1836464qgw.41.2015.06.03.22.59.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 22:59:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1433387388-7660-4-git-send-email-armccurdy@gmail.com>
Date: Wed, 3 Jun 2015 22:59:07 -0700
Message-Id: <9A441CBD-E77B-473A-AE0C-643873B654E6@gmail.com>
References: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
	<1433387388-7660-4-git-send-email-armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-oe][PATCH 4/5] luajit: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 05:59:11 -0000
X-Groupsio-MsgNum: 55759
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AD6CB2DC-361A-4936-8D7E-3046745B4E1A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_AD6CB2DC-361A-4936-8D7E-3046745B4E1A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 3, 2015, at 8:09 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb =
b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> index 48137e3..05456bb 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> @@ -27,6 +27,7 @@ EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} \
> EXTRA_OEMAKE_append_powerpc =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> EXTRA_OEMAKE_append_x86-64 =3D ' HOST_CC=3D"${BUILD_CC}"'
> EXTRA_OEMAKE_append_i586 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> +EXTRA_OEMAKE_append_i686 =3D ' HOST_CC=3D"${BUILD_CC} -m32=E2=80=9D'

All 32bit/x86 could use =E2=80=98x86' override.

> EXTRA_OEMAKE_append_powerpc64 =3D ' HOST_CC=3D"${BUILD_CC}"'
> EXTRA_OEMAKE_append_arm =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> EXTRA_OEMAKE_append_mips64 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_AD6CB2DC-361A-4936-8D7E-3046745B4E1A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVv6SsACgkQuwUzVZGdMxS+RACfbl/Jx3NVLDpTWLKCpT1L4nsS
PcMAniPiZicyxqbLZwMFJzYyMrU1Pp+P
=irMt
-----END PGP SIGNATURE-----

--Apple-Mail=_AD6CB2DC-361A-4936-8D7E-3046745B4E1A--
