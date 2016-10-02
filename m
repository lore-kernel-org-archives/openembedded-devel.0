Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 950266E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Oct 2016 20:35:51 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hh10so288954pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Oct 2016 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=+AHxmQ2Kwcnkt3Y1a5cAdHGxenoMCTaoZGFVFGNwGL4=;
	b=jiGaavaRs/Bb3GQDB3OSlBKMP/PU25ueg90Nv6WX+seCt33VBlb+9En7H8UYBudJKt
	ILeGhYf8oA3KokkvmAM5PbmlyhIL2LBn4HrCxbi9Bjpl6EESPRcWfNTngU3NDLjNlcmY
	4+JPKN2aps1bHm2C098Kw/DVwYnMUBw9NXYr/xp8VbYGkRRaxULtZTdPdEH3Mv+CsWTy
	NmizvhQPGK8t4T7tpuXceVGDNB3jgigWg15ywR7eUwrVJdMF5VMmDpcQS3PWUDnHW5ci
	dNOSHbFi45oq0gUQWfruHjQAJEZIK1l/hu+aiSY8SYaCK3C+OvMKsjmo00+Q1YsiBU8z
	MrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=+AHxmQ2Kwcnkt3Y1a5cAdHGxenoMCTaoZGFVFGNwGL4=;
	b=apmm3qlP/L5wbBj1Mweo1poqmzdhOCaFeH9sraeFWEqHPYhTGz0SU9tmpSwc/KipsY
	Cjk9cOHdhbjq5dQwO0vFoKhHLRrKij/NbnTZPoQ67o6cNylBYTQbbhPafvXvJ5emmEpl
	fLmQhO3BucNE9C3uN3tuOidAEY2mwVWgmLEYLfA1bqlkGkQ7j/alETS8hTxL757HlqNU
	2eBtMY1eWUOBws1pADBM2FsyXElHKh1GFxzemlMSKeweEoj38ax9bYC43xfX6jfDnurX
	2wp0gaafKMIHiobwqr03x2PJSZs3/9F8YiBkivsLB5Mje/fnM5N9BSXSTN6UCIte+tUt
	jL0w==
X-Gm-Message-State: AA6/9RntL/3Wq2cDEAIoYgPtkZSTiCsxAdCNxNtasjQDi57sfV3R9UpCbivb+YRFl/7kmw==
X-Received: by 10.67.16.76 with SMTP id fu12mr31548263pad.171.1475440552517;
	Sun, 02 Oct 2016 13:35:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:40e4:d250:309a:ad0f?
	([2601:646:8882:b8c:40e4:d250:309a:ad0f])
	by smtp.gmail.com with ESMTPSA id
	x24sm2760694pfa.17.2016.10.02.13.35.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 13:35:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1473709659-23717-1-git-send-email-armccurdy@gmail.com>
Date: Sun, 2 Oct 2016 13:35:46 -0700
Message-Id: <A7E9B3C1-3AFB-4168-BE3B-8E0C33FDE841@gmail.com>
References: <1473709659-23717-1-git-send-email-armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH] minini: update SRC_URI with new download path
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
X-List-Received-Date: Sun, 02 Oct 2016 20:35:51 -0000
X-Groupsio-MsgNum: 63366
Content-Type: multipart/signed;
	boundary="Apple-Mail=_412B4AAC-B1D3-4D84-8672-E16E84482F25";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_412B4AAC-B1D3-4D84-8672-E16E84482F25
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 12, 2016, at 12:47 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
>  https://code.google.com/archive/p/minini/downloads
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta-oe/recipes-support/minini/minini_1.2.b.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb =
b/meta-oe/recipes-support/minini/minini_1.2.b.bb
> index 6607dd8..4a73f12 100644
> --- a/meta-oe/recipes-support/minini/minini_1.2.b.bb
> +++ b/meta-oe/recipes-support/minini/minini_1.2.b.bb
> @@ -14,7 +14,7 @@ HOMEPAGE =3D "https://code.google.com/p/minini/"
> LICENSE =3D "Apache-2.0"
> LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Deb21481ad45c5578ae8c8d37b8c8d76d"
>=20
> -SRC_URI =3D =
"http://minini.googlecode.com/files/minIni_12b.zip;subdir=3D${BP}"
> +SRC_URI =3D =
"https://storage.googleapis.com/google-code-archive-downloads/v2/code.goog=
le.com/minini/minIni_12b.zip;subdir=3D${BP}=E2=80=9D

perhaps its better to switch to using the new upstream from github

https://github.com/compuphase/minIni

>=20
> SRC_URI[md5sum] =3D "32740621098e3f0a321c7c23f4bcbc5d"
> SRC_URI[sha256sum] =3D =
"b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2e888e2"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_412B4AAC-B1D3-4D84-8672-E16E84482F25
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfxb6gACgkQuwUzVZGdMxSkqACfc7tSBxGTJsCIjl321A+5rq7a
MfsAniEpHeVtd/UwuN7anHFsZ4j3jFmX
=x7NU
-----END PGP SIGNATURE-----

--Apple-Mail=_412B4AAC-B1D3-4D84-8672-E16E84482F25--
