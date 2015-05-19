Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id AF90F601DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 01:26:42 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so897558pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 18:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=sSXKnI5qlBBmsNtbss33dMrPSlM91h0feaN/kdsZLkA=;
	b=YinqAqhOgkRSOb27CyOs/ypcNdmk62ZnVyxqf4qSFuuQgfEsD3j2O0t4qsUJIHpFnf
	SCz6PGFhfu2a4SMVsDRyxqPcgXRhoRZWdhRU02HSEb5NGG1FWOqPTpOz2AZ6mfKG1TlJ
	e2FRjvIodRnCcQiHM4070YPA3nA0X6g94Kl+XlrMJA1UuqrVjc5Yhg1plhiVGm4qFfYk
	ugiEmrcihh6PaW/K5yGNsSw06kkUfT4FFjGEerfpGxjSLLzMBCBnIGoYn0QFByEpqnm2
	mOHK+uyhzs1w2EqfKrJkqfqrp4vaVW3fd5+vfhSDFcnyyHdnxqWw8EXAfRPMs5Z3GnzL
	sPlQ==
X-Received: by 10.68.209.227 with SMTP id mp3mr48841721pbc.100.1431998804320; 
	Mon, 18 May 2015 18:26:44 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:d1bd:ca93:84da:dce8?
	([2601:9:3580:84c:d1bd:ca93:84da:dce8])
	by mx.google.com with ESMTPSA id
	ms7sm11260452pdb.11.2015.05.18.18.26.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 May 2015 18:26:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431521304-19402-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 18 May 2015 18:26:38 -0700
Message-Id: <B7056697-F716-40D8-B738-776AEC8D75C9@gmail.com>
References: <20150415171653.GB2338@jama>
	<1431521304-19402-1-git-send-email-Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-oe][PATCH] Revert "libhugetlbfs: Add i586 to list of compatible host architectures"
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
X-List-Received-Date: Tue, 19 May 2015 01:26:44 -0000
X-Groupsio-MsgNum: 55549
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4AB4C818-F8F3-4E61-91D6-A29A718278B9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4AB4C818-F8F3-4E61-91D6-A29A718278B9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 13, 2015, at 5:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> It's still failing in world builds even when
> "libhugetlbfs: x86 - don't link against host libs" is applied as well.
>=20
> It was reported month ago:
> =
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg=
41565.html
>=20

=46rom this message it seems to me that linker script used for x86 is =
not digested well by gold and there
might be incompatibilities and gold certainly should not segfault. so =
its worth filing a bug report against gold as well.
Then there should be another one for libhugetlbfs to ensure that linker =
script is portable. But then in OE we can use

LDFLAGS +=3D =E2=80=9C-fuse-ld=3Dbfd=E2=80=9D

in recipe and that should get us going.

Avoid the revert

> This reverts commit 3cc7f186be46a0de049d1fab70ddb84111be6e29.
> ---
> meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git =
a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb =
b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 6fe5dce..4ce6a19 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -24,7 +24,7 @@ SRC_URI =3D =
"git://git.code.sf.net/p/libhugetlbfs/code \
>=20
> S =3D "${WORKDIR}/git"
>=20
> -COMPATIBLE_HOST =3D =
"(i586|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> +COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
>=20
> LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
> LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
> --
> 2.4.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_4AB4C818-F8F3-4E61-91D6-A29A718278B9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVakVIACgkQuwUzVZGdMxSETACfcb2MULgldF6eEgVZA7wN1D3F
r6UAn1S0pCokfiVAqDPnPsYOKiFAvzvW
=jr5o
-----END PGP SIGNATURE-----

--Apple-Mail=_4AB4C818-F8F3-4E61-91D6-A29A718278B9--
