Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC6AF78AAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 21:17:16 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r1-v6so1505457pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 14:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=uPW3G3bDITaGzQX2Sv2Z4zcrnAtg/IwqdKQfgYzuVcM=;
	b=md7MUnH3Ma9fHkNGBjb7cuqSa6ajOq0LKHEwnt+9cmY5/whTHBUpOsEIdWemtzw4Qn
	1nyZ24XbGZbBd7OD9Ug/tlPHOtwYgarHjanXvQAFCv8YratEHLMgWMhOfk1zu8kFDZDp
	YBO6A+Cgu0ECq5wQ7dbJ4t7XcSMTI1WX4vidsKf2Ni+Dk/kYUXV6LO+So5AeLpqjbXbN
	g5paNJCy58UqEDPMG0T6jMAbHod0NSPtmGUQmvhx2Yy+S+g8wBuyO2TSBRwGX02hLOLP
	tKMtk55snZCBtJAVyXYmdLTAJjGHJt2fZ0gJ3RaRm4hz6Sb8LatTQCV6dmv8biTUWfvf
	zbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=uPW3G3bDITaGzQX2Sv2Z4zcrnAtg/IwqdKQfgYzuVcM=;
	b=ixtyRZ3iMm186zzhP08OaWzMv8AvmzuGRugsVkkdZ3WeaBVs6eTbTPizofg1dRVHcj
	08WTJKA8o0ZLO7xjOFvus6OyUI1ILRo0LhcA9fhFRIDJmjgiWHgTfV+9IUkL4r6u/T2y
	iFP9eodkkOMZq4u9P5gFGMxNUAU6amDrOyTPqY1y4XIBIwc2ex5uNDLYrcoD4V+qBEhq
	YAWIATYk5Dbel/YVJr3mUHvMsBNzSld3BemiMnpLEZ5Ecqqg2CFhXs9MyBDpPoQ94uKF
	N7IQd1pDcXv8aZhixtxVf3f5SrSAScUKQl+ljLV5lCbYQqr4rPbgKNiVwnoDjjkuLlMp
	Hcfg==
X-Gm-Message-State: APt69E3fUnnQSCtZz1xJWk6uFsGufP6tK99+/ZV6ah8y4kt0ESlnfDkX
	NyNKTVvb9HaPA1xu247ef8M4FF81
X-Google-Smtp-Source: ADUXVKJOpF4IX1mh05Mi30hqQ8LPxnSjkm9REgLdo8UH2Q/N2HwPuOfUhLvRgWMkzefzcoYO53CVcg==
X-Received: by 2002:a63:9311:: with SMTP id
	b17-v6mr26990375pge.261.1530652637570; 
	Tue, 03 Jul 2018 14:17:17 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:b95e:f0e0:47b8:11a8?
	([2601:646:877f:9499:b95e:f0e0:47b8:11a8])
	by smtp.gmail.com with ESMTPSA id
	v10-v6sm638824pgo.72.2018.07.03.14.17.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 14:17:17 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20180703092018.5018-1-ross.burton@intel.com>
	<20180703092018.5018-3-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <09682179-6edc-c225-a2c8-2532c4776fd7@gmail.com>
Date: Tue, 3 Jul 2018 14:17:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180703092018.5018-3-ross.burton@intel.com>
Subject: Re: [PATCH 3/4] php: actually enable openssl
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
X-List-Received-Date: Tue, 03 Jul 2018 21:17:17 -0000
X-Groupsio-MsgNum: 73174
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="qwQFoEnBaeSmtRtblV8NbcrBkpBlK5M0J"

--qwQFoEnBaeSmtRtblV8NbcrBkpBlK5M0J
Content-Type: multipart/mixed; boundary="a8k4dsP7vdFdfTTQXEbXIJveCLxpoFxiF";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <09682179-6edc-c225-a2c8-2532c4776fd7@gmail.com>
Subject: Re: [oe] [PATCH 3/4] php: actually enable openssl
References: <20180703092018.5018-1-ross.burton@intel.com>
 <20180703092018.5018-3-ross.burton@intel.com>
In-Reply-To: <20180703092018.5018-3-ross.burton@intel.com>

--a8k4dsP7vdFdfTTQXEbXIJveCLxpoFxiF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/3/18 2:20 AM, Ross Burton wrote:
> The PHP recipe depends on OpenSSL but support is disabled unless you pa=
ss
> --with-openssl.

perhaps its better to turn it into a PACKAGECONFIG option while you are
at it

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-dev=
tools/php/php.inc
> index f262d60d15..258b20e68c 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -57,7 +57,7 @@ EXTRA_OECONF =3D "--enable-mbstring \
>                  --with-config-file-path=3D${sysconfdir}/php/apache2-ph=
p${PHP_MAJOR_VERSION} \
>                  ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '=
ac_cv_c_bigendian_php=3Dno', 'ac_cv_c_bigendian_php=3Dyes', d)} \
>                  ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_c=
v_lib_pam_pam_start=3Dno', d)} \
> -                ${COMMON_EXTRA_OECONF} \
> +                ${COMMON_EXTRA_OECONF} --with-openssl \
>  "
> =20
>  CACHED_CONFIGUREVARS +=3D "ac_cv_func_dlopen=3Dyes ac_cv_lib_dl_dlopen=
=3Dyes"
>=20



--a8k4dsP7vdFdfTTQXEbXIJveCLxpoFxiF--

--qwQFoEnBaeSmtRtblV8NbcrBkpBlK5M0J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWzvn1wAKCRC7BTNVkZ0z
FL/iAJ0VyF1Pr0lNCy36gDf+t3WQGGJ5EACaAsqlRm5JarFftApr6CyDPTSuwnY=
=6AxV
-----END PGP SIGNATURE-----

--qwQFoEnBaeSmtRtblV8NbcrBkpBlK5M0J--
