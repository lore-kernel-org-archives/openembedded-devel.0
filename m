Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9E277DB2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 17:08:17 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so18591302pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=ahAMx0+arPBf11hCXroknDcCex3Cj5N/zLx7EOpZoiU=;
	b=uaCtbs6rPx0x6ITNyZzc8oh1P/KT3nikYL8GgnoRUotwP4y/ErZ/HVV6q52pIxXXaz
	Txg8qStddWAvWOE8rs8jtWY6RhlcHpi3Cr73ETbvMNwWUmMh4zDq2LesBya8J7/bgZlx
	2KspkkUsZhCOIMyo6rnr418DrOMd5lXzNv2V3f6aVm2FEdRZVPTVeSrfMhu9+5AQsDlY
	8XxSo5YELmjWmWr+VXFrlKSjIbB6+mGr+bjdWEpnG3RootfyaYIHlrJMOjyMa79ReAZv
	4rL0hecViUJ/gEihKvTiUUK1KC8BgY1Xq/qwTJBZMlrIRZ0B1YEgVescFHjmUZOJgufA
	Wp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ahAMx0+arPBf11hCXroknDcCex3Cj5N/zLx7EOpZoiU=;
	b=VnZ5RzQUUJIjw88dvlWTeiZGlTs729d+ZJuCcHQPq4QAY0TydMJIwE+1l92gH5l/Ep
	6VVYZauvtPcGztEVSW/NKeTr11SZwzva4R5ub9yDjl0+8O9UoIswO+L72JzT1qrTKMv9
	kFNJMmtW95Qe0Afap1ESO8iXZksbcuDkwd1vFrnqO2y8YPMhci3K46W74WLI7L8aT4i4
	lyhzTWvErRIWRbwHUOTwtdZXB3GMyoEqAzW1TPuZoMjnzS9TYPUVYM4qhmfOrVqQdmIi
	DiWx18/MRD6IRpIccnygvs7YxDmE/nZ7p2XNZkFxVcBfhRgDuIylEn7NK8SC1Togp2Sg
	poZA==
X-Gm-Message-State: AFeK/H3IU+X2noOfC36hLPgzJFff80efBG2BCMVvuLsZUBVOJqc1IXoVF+y8VN9qB1USeA==
X-Received: by 10.98.68.82 with SMTP id r79mr3904737pfa.41.1490980098678;
	Fri, 31 Mar 2017 10:08:18 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:dd64:9ebc:182c:f6cf])
	by smtp.gmail.com with ESMTPSA id
	c19sm11674828pfd.85.2017.03.31.10.08.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 10:08:17 -0700 (PDT)
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20170331111032.6573-1-dmitry.rozhkov@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <445cc883-ce1a-1aea-58ea-816414b5790b@gmail.com>
Date: Fri, 31 Mar 2017 10:08:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170331111032.6573-1-dmitry.rozhkov@linux.intel.com>
Subject: Re: [meta-oe][PATCH] opencv: remove redundant build dependency on python2
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
X-List-Received-Date: Fri, 31 Mar 2017 17:08:17 -0000
X-Groupsio-MsgNum: 66058
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="VPmGowLd8wgNSTqQDpW835xTOUcw74QrG"

--VPmGowLd8wgNSTqQDpW835xTOUcw74QrG
Content-Type: multipart/mixed; boundary="hr14WDLpMrFDuIMo3b934UWgk2UVARRka";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <445cc883-ce1a-1aea-58ea-816414b5790b@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opencv: remove redundant build dependency
 on python2
References: <20170331111032.6573-1-dmitry.rozhkov@linux.intel.com>
In-Reply-To: <20170331111032.6573-1-dmitry.rozhkov@linux.intel.com>

--hr14WDLpMrFDuIMo3b934UWgk2UVARRka
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/31/17 4:10 AM, Dmitry Rozhkov wrote:
> The recipe opencv_3.2.bb inherits to either distutils-base or
> distutils3-base classes or both which do add appropriate
> build dependency on python or python3 respectively.
> There's no need to have python in DEPENDS explicitly.
>=20
> It can even make things needlessly complicated in case a user
> wants to build python3-only images.
>=20

right. Looks ok.

> The redundant build dependency on python is removed from DEPENDS.
>=20
> Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/rec=
ipes-support/opencv/opencv_3.2.bb
> index f47347a..f50bc05 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b2f8752cc5e=
df504d283107d033f544"
>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> =20
> -DEPENDS =3D "libtool swig swig-native python bzip2 zlib glib-2.0 libwe=
bp"
> +DEPENDS =3D "libtool swig swig-native bzip2 zlib glib-2.0 libwebp"
> =20
>  SRCREV_opencv =3D "70bbf17b133496bd7d54d034b0f94bd869e0e810"
>  SRCREV_contrib =3D "86342522b0eb2b16fa851c020cc4e0fef4e010b7"
>=20


--hr14WDLpMrFDuIMo3b934UWgk2UVARRka--

--VPmGowLd8wgNSTqQDpW835xTOUcw74QrG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljejQAACgkQuwUzVZGdMxRE7gCeOdvDOtdQTyhYpNRFNdn+RUK2
AAoAn1VTUUXiC9mqvej+rx8iF/vXETau
=OGTr
-----END PGP SIGNATURE-----

--VPmGowLd8wgNSTqQDpW835xTOUcw74QrG--
