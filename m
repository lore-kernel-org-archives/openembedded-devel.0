Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC56719DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:13:08 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id b123so16916940itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 10:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=knH5hIlMnx9ozavvY+hJh7N8PCsH4EDU7jTMPsXWlLo=;
	b=beXKIdd3wBMUx6RlY7tlvAXWb22QNetJAdHggsiMayGv9ibHdCepOoF/M656X5RQv5
	Xnb1QGMV7pmhdnk0Ar/kfbUAhnuFgxJZtKDjSg+PiLMGp7aD9Vbaq2JuCjcN/DFunsAO
	jlNot4h315JwvcIAvmNmPFdrBVSVDNYNmC+ZzbV3LwCJMboyfTkZOuKi7Z8lcxn3VlXs
	7UIUg1FJ76Q334ifMRxCH+IZsiZ1iaIPNqZjiFFoEIIj0Td714ZKznV4B35+MFe1kfck
	NsBBVnleyVmgbzoy4MVU70kVB3KEMVSA6Psk3jCITXNVFN/T8q2HolHh2T1cIh9FSyV4
	YwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=knH5hIlMnx9ozavvY+hJh7N8PCsH4EDU7jTMPsXWlLo=;
	b=DhLFHjDm1h8roby+eLf1zZggtsSp77NRt4ee3ilQkMuuOFRdAM0xcO8DkdoP4ddPsH
	8C9L9y0QN+0iSkPaNvFq6v76FxmBRr4+8QtLjwbh8DhtPvDZGiGVxfufD6EB81HYZrDn
	lr2REprhQw/S7cTLUmhp3hwsdTAdVygLSHwEAgavSEL2H7f3sWupnNT6C7K0gGImnRzD
	+2flsdmwqikJ7Gb7dvuPOUpyu1D1Tbx0rkx31B0yt+0Who4WMo/fieWQamUpg81ctSt8
	NLVJgDJcxVbVONkYkNIi7oRCXdG3BerlWIgBEHNWxoDtXf4rIgxUNwyiqW0yXdZ14df8
	pF1g==
X-Gm-Message-State: ABUngvfaZxJQS3MhHRlx8axO8YOBUQntp5NAimcaKe/4KfmpiDdMWb/Sm/epuEdJ3GyeNQ==
X-Received: by 10.36.160.134 with SMTP id o128mr13610481ite.26.1479406390633; 
	Thu, 17 Nov 2016 10:13:10 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	141sm1313138ity.12.2016.11.17.10.13.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 10:13:10 -0800 (PST)
To: openembedded-devel@lists.openembedded.org, wenzong.fan@windriver.com
References: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <9e50d470-714e-1c5c-83a9-39691b7315f8@gmail.com>
Date: Thu, 17 Nov 2016 10:11:49 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [meta-oe][PATCH] opencv: remove DEFAULT_PREFERENCE = "-1" for 3.1
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
X-List-Received-Date: Thu, 17 Nov 2016 18:13:09 -0000
X-Groupsio-MsgNum: 63866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="E7PHe1I0clOPeBD9DvgQS6KdEdVtNsSAt"

--E7PHe1I0clOPeBD9DvgQS6KdEdVtNsSAt
Content-Type: multipart/mixed; boundary="0Muu52Gn6xFoNGmk7UECKMARrlT4JSLxg";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wenzong.fan@windriver.com
Message-ID: <9e50d470-714e-1c5c-83a9-39691b7315f8@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opencv: remove DEFAULT_PREFERENCE = "-1"
 for 3.1
References: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>

--0Muu52Gn6xFoNGmk7UECKMARrlT4JSLxg
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/16/16 7:02 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> The opencv 2.4 has been blacklisted, 3.1 should be the default choice
> for both opencv and lib32-opencv.

blacklisting does not change the norms. Is it possible to fix the reason =
for
blacklisting 2.x

>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/rec=
ipes-support/opencv/opencv_3.1.bb
> index 1bbb965..a212f4f 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ea90d28b4de=
883d7af5e6711f14f7bf"
>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> =20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib g=
lib-2.0 libwebp protobuf protobuf-native"
> =20
>  SRCREV_opencv =3D "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
>=20


--0Muu52Gn6xFoNGmk7UECKMARrlT4JSLxg--

--E7PHe1I0clOPeBD9DvgQS6KdEdVtNsSAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgt8uUACgkQuwUzVZGdMxTZwQCfZlAXz33gFqr2G/hYz5WaXrEq
mwsAnigP88uzg4Dw/lKAeZheTOcck8N7
=Wy18
-----END PGP SIGNATURE-----

--E7PHe1I0clOPeBD9DvgQS6KdEdVtNsSAt--
