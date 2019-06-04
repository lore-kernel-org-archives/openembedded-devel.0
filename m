Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2667E25A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2019 07:38:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u16so8327246wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jun 2019 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=3/2jCDjtX+dZgJOCl7I6cVcToyConH6m1k9GuHBRagQ=;
	b=FYMmBr6CnzILUbYv+7vFG8S2C9s/hLSlUHJTxPeQFkOyXj+72XgtGgIF1X185R2soi
	9UPqcdiv9ztGiiFRGmwWNfiVC7Y8Jbl0NdjkSAabpgC2eNW9BaH8Jeqg5S2eUByfKdXr
	9bfNZAuofx2OjmtxO8RdnJ1M76NOnCTbigImSNEerz9esEoiom5hCcOCF5AAUz+AfDSJ
	oZGHwUlxJDWiJkF0noijknkluSXccqs882b5N/Pn+kJ7hCjCJbUTsv+U6gVzudWNFQ5i
	aOXh/5AsbY9HX+Omhk3XylO7237WiZU6gP6g5CMBXhEKQuaG4V5IAdIYu7PvHuv5SFVX
	UuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=3/2jCDjtX+dZgJOCl7I6cVcToyConH6m1k9GuHBRagQ=;
	b=ptl53hKwDufxo1EblVGcmRXTo6q5SjK7qbgEz79JL9SNJkcEO4WYq+6pUFoRG+8wxG
	VZCcn7RXOomQet6SMfTyu6gfHcHKnFeAYLzxWyT1L4gePppESQfEWfF1HD7NvWMd7nqU
	BEgnJT3b1FfShix6CNr42odMb0UKYQPYdUUqLv2tQisodWgwACHU9TJHfPUVs9Qp5DB6
	wGbEy5m6H/SeEC7c0GxhCjTcf8iqEDndFBS7gSOXAhLfM/vRnBIxEKOuabQhvn+6FAfw
	LLpTB1zsJSEPI0J4aDybI0PJC0zrfuLjkrCDFYTQCqRv5IgMGdiQClim4lhL0nYTOkJt
	Le9A==
X-Gm-Message-State: APjAAAUhgs6uo8BuMifGoV+t5jE6GYHoLjY+gndMo4vM1Dh27nvKNFL8
	xrJ82TQrTZGPa+lMu2yDbdiyDA==
X-Google-Smtp-Source: APXvYqwUdtK74L3p80IbfmKH5QiyqXg3bN2KItdvn2wHgCZIx/2LfdmZNPFs02+lyTZWx81srP4oFg==
X-Received: by 2002:a1c:a807:: with SMTP id r7mr16559274wme.137.1559633932847; 
	Tue, 04 Jun 2019 00:38:52 -0700 (PDT)
Received: from [192.168.0.100] (88-147-32-96.dyn.eolo.it. [88.147.32.96])
	by smtp.gmail.com with ESMTPSA id
	16sm12893578wmx.45.2019.06.04.00.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 00:38:52 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
Message-Id: <83FEA552-5A4B-4A54-BBF9-2D88B4B6B11F@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Date: Tue, 4 Jun 2019 09:38:48 +0200
In-Reply-To: <20190530132148.66500-1-paolo.valente@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
References: <20190530132148.66500-1-paolo.valente@linaro.org>
X-Mailer: Apple Mail (2.3445.104.8)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, bunk@stusta.de,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2] s-suite: push SRCREV to version 3.4
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
X-List-Received-Date: Tue, 04 Jun 2019 07:38:52 -0000
X-Groupsio-MsgNum: 77922
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BB8E83B8-AD56-450D-B5D3-CFD8F642A137";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_BB8E83B8-AD56-450D-B5D3-CFD8F642A137
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
anyone had time to look into this? Is the patch ok now?

Thanks,
Paolo

> Il giorno 30 mag 2019, alle ore 15:21, Paolo Valente =
<paolo.valente@linaro.org> ha scritto:
>=20
> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> ---
> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> index 706a55e11..741142c50 100644
> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Small collection of benchmarks for =
storage I/O"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>=20
> -SRCREV =3D "262227ec9de4be1ab41d9918d32ceb773089f1dd"
> -PV =3D "3.2+git${SRCPV}"
> +SRCREV =3D "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
> +PV =3D "3.4"
> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>=20
> S =3D "${WORKDIR}/git"
> --
> 2.20.1
>=20


--Apple-Mail=_BB8E83B8-AD56-450D-B5D3-CFD8F642A137
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEpYoduex+OneZyvO8OAkCLQGo9oMFAlz2IAgACgkQOAkCLQGo
9oNzYg//VOA4s3dTnLFI6UNzUeLH6PNvG/WImD6h2aoFnUW1M9yPQ0MMEFLpA5vk
TKg3w/YK2zmSubyvIqgZb5U37fA9foFENbpQsQgXNyTdlIot4Nxe81NhoyQh+CbM
GFOAmZgNSp2IYod8QbNTiN3w9PNuNInFuYNMocnpms1kF8DGdfgVgk9DTPuqqjWP
/9hppkZvqYB23S2NR00Ot5Na8tabqoJgDEK4hsOC6D58QV3Jttly+yAghNpER5LX
DKvMu6dqB+i7doWBie0yfK3ZZPoU4sVEV44nURMcR9MhRlYmLJvKLokFv5jZ1xey
qii1MGRkOEMGO7F359mnDyC8JDGdDQQW8cFxa7QIPEoF/exXE+7jMJj4yp47tEbs
MA/CMKHD1Mt931QAH+tIWwc/T/blI28sy1zyrglyhN5yimNapuAXg7UEPupBTo3s
V0DT4zw5+H8uTmrbwL5Ru+HPbEe+vBShib0DDFrpABCAfukhLnsvcRWANiBdsKaI
Tt5K5pHGxhi+Nep9D3AbAxyNkvIXK9e2HRiLw9jyruJo/0Mtmi2vH8vlf/3YTav+
7Xun+75mqB+Jx0MjAH3n+w/IyZmNvAIg5f5Kl+Mmj8bm4mZ4i3jnpv3xtZ8OwNYd
UPTeP/qNy1YovZms+wZQv4r4K8sllBUyo5Ojkq112dYOdSEI2Og=
=cZ3o
-----END PGP SIGNATURE-----

--Apple-Mail=_BB8E83B8-AD56-450D-B5D3-CFD8F642A137--
