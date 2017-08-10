Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6482571BF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 15:19:57 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u185so877721pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=4oGeQuUPHquAW/yomw8pKjfKWIFrnKi8UckNObEAXf8=;
	b=OtP74KBZx2E1m36hBwoHqZy1fx/WgHj64INyDNZN6TUzSbZRKp/7olDS4ws7cARCim
	jnrQlf06lcs9Hr14XENVWs9QKKqlDFuKJpLKIXpM3cht0qh3oX04OQRLD9xbsy0PbV9N
	VQXFUt/kJydFa/QUx3hwNoNBdm72ZYMNBiBEs5aasgC0FR15HesU/wfRzlkgYIxXkW1C
	WAnUbJO02yYWdtamz8FXTJXQ6XWR6L8TnAMSKWMYEOqqVfwgGjYSTxtSzg5Zfwh2Dp60
	tLa1GdzMF4QXkszJKCo+AusarOR2mJt2Sl+RftfkyPLNunsWuA3XhaaLcAbxYtptJ55/
	OK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=4oGeQuUPHquAW/yomw8pKjfKWIFrnKi8UckNObEAXf8=;
	b=N67zbiuoEn3nNn3+9Ip4pdoO3OU4UoOk+kjD5KgejFhguC/nsDLDoZNUe7Wv0+vbhP
	03KO9YND/Mw1xBjwpdAJAgXci5E2mB+MreiXQhPkU9VKvris4AaEsS4QHiNCMxon1E2y
	4ju8Rr2TYP8Q1+T6h+Geu1Mv7gOU1sepBPkWANcWJ262It2AaaotWLutxfjKBU4NwRok
	wxdAzeqp3O4HlN6FVUuHDodltnLl9oFVChdQRazQsohY3mpIZrKX4JuLn39qrA8A5Njt
	/yx7l9wmqZ1S9oWo22eT6aR24TT3jbO/AbycbrWdftRBsthqjiLt44w29hpaakJc7jRV
	VPZg==
X-Gm-Message-State: AHYfb5iSj1fOntBCO1f4cfK0rRiOnbJYtJWGWh9aqQWVOHAzApE0gvB4
	DmThLJdTyNCx4g==
X-Received: by 10.98.156.85 with SMTP id f82mr4248868pfe.47.1502378399562;
	Thu, 10 Aug 2017 08:19:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:8ad:6c8a:7887:b9be?
	([2601:646:8882:b8c:8ad:6c8a:7887:b9be])
	by smtp.gmail.com with ESMTPSA id
	q88sm15759291pfk.8.2017.08.10.08.19.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 08:19:58 -0700 (PDT)
To: liu.ming50@gmail.com, openembedded-devel@lists.openembedded.org
References: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
Date: Thu, 10 Aug 2017 08:19:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
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
X-List-Received-Date: Thu, 10 Aug 2017 15:19:58 -0000
X-Groupsio-MsgNum: 68069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="KbIa4FKAXsb5w8Q4NvhaXEUWpF3HMClLb"

--KbIa4FKAXsb5w8Q4NvhaXEUWpF3HMClLb
Content-Type: multipart/mixed; boundary="G5LfWhLcWe6sPJ5wH4StlkK36DKD4BrEC";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: liu.ming50@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Message-ID: <2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
References: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>

--G5LfWhLcWe6sPJ5wH4StlkK36DKD4BrEC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/10/17 8:12 AM, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>=20
> This fixes following errors when compiling with clang:
> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to=
 '__atomic_load_4'
> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to=
 '__atomic_compare_exchange_4'
> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to=
 '__atomic_fetch_sub_4'
> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to=
 '__atomic_fetch_add_4'
>=20
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b=
/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> index 53bbf7e..2f456bf 100644
> --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> @@ -17,6 +17,8 @@ S =3D "${WORKDIR}/json_spirit_v${PV}"
> =20
>  DEPENDS =3D "boost"
> =20
> +LDFLAGS +=3D "-Wl,--as-needed -latomic -Wl,--no-as-needed"

Do we need --as-needed

> +
>  inherit cmake
> =20
>  FILES_${PN}-dev +=3D "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake=
"
>=20



--G5LfWhLcWe6sPJ5wH4StlkK36DKD4BrEC--

--KbIa4FKAXsb5w8Q4NvhaXEUWpF3HMClLb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlmMeZ0ACgkQuwUzVZGdMxQATACaApPQ3enUsfGIZgi3xVmvdcHS
RHwAn3r+Ini7Eqs3ekmt8CWmBzRGlGEs
=TrEt
-----END PGP SIGNATURE-----

--KbIa4FKAXsb5w8Q4NvhaXEUWpF3HMClLb--
