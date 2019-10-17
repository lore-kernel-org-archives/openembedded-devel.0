Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A75667F69A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 20:44:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b24so3913079wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5ZBntD9vuOSnAttUeDdxEjbeNDxk8g4VCxH+3gmsvds=;
	b=dvv5zyKX48AwVGcdiR7EDwWcGUmXhyBxMTwx79pKRGWt+ky81Trx73XIDemAsfmT3z
	bkQzle9fKR+pEjJvMgM/wmGog5FDnzK31Alx2DDt2RNvOqk843mXa13Hc6oF2r3ZlY7v
	RQ60W0pyV0g7vkslT8r+3C++4wMuofYxyfkGc2cK99+ChOlruEjVeTeh3bArxhFTktzP
	OTibZ+zZs9V5NkWVwDiH5lNAg7PMnjjsih9ulHt8qJyZh0lzybfKwOAFBcec7SIT/P0k
	CBrXC4VGlWSCcPhBslVgeaG8CzFwTjsWwjgQh/sbsEcEf0l39CU/NGtTxk5PmJFI0BwV
	3eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5ZBntD9vuOSnAttUeDdxEjbeNDxk8g4VCxH+3gmsvds=;
	b=sGqimSpmwRMLl5W72CkjP38rHh6Kvoafy1mdzntUI7NYdjYLvJFoAVx5TnNA1Bd5Zt
	jIY3p01VtGimu24bSK3vSlyaKn3En4Q6qYY0LFIzG+RPdIblrj9HTRXsBC2OkbkayHw8
	mV36yqnqYgU8+DehathOZbXqB33LGfb/k+85VAwSQy+yYxPr6mPfWFI0KpefQCIWydPK
	kmbUzLGuvcZME9aGCiJBrxNZA3HTRAbC9Bwei7MraTDrt++di576Xhga+oyQAylUsDMJ
	J0FEAnoXWh0b7jo7IPgVoBcbM88ODlh59G90drs/l5eHzxeK2xl628v0xkcR5TK7wX9J
	tx3Q==
X-Gm-Message-State: APjAAAUk5reebged6jPHXauloH/GxSLJ1DfzQB3Ep9LdnU+ssyNmhvnm
	COFxaB4oE6KurG6qAvMser8=
X-Google-Smtp-Source: APXvYqy1UTle/ih1TBPykrIJrH8I6aSjxg0EI+r2NwrHua1ioiODBkuzeqXs3txdZ7RoLtqLlWquqg==
X-Received: by 2002:a05:600c:40f:: with SMTP id
	q15mr4432034wmb.30.1571345095273; 
	Thu, 17 Oct 2019 13:44:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	y19sm3100682wmi.13.2019.10.17.13.44.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 13:44:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Oct 2019 22:44:58 +0200
To: Sinan Kaya <okaya@kernel.org>
Message-ID: <20191017204458.GC1499@jama>
References: <20191017033946.16494-1-okaya@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191017033946.16494-1-okaya@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][thud][PATCH] protobuf-c: fix race condition
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
X-List-Received-Date: Thu, 17 Oct 2019 20:44:54 -0000
X-Groupsio-MsgNum: 80210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 03:39:46AM +0000, Sinan Kaya wrote:
> From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> (cherry picked from commit 489d3b4b932ee8016d792341f8ea5836a9522cd4)

Yes this is needed in thud as well, but first it should be backported to
warrior as well, I'll send separate patch for that.

> ---
>  .../0001-avoid-race-condition.patch           | 36 +++++++++++++++++++
>  .../protobuf/protobuf-c_1.3.1.bb              |  3 +-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avo=
id-race-condition.patch
>=20
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race=
-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-=
race-condition.patch
> new file mode 100644
> index 000000000..4fc7703d8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condit=
ion.patch
> @@ -0,0 +1,36 @@
> +From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Sun, 29 Sep 2019 17:20:42 +0800
> +Subject: [PATCH] avoid race condition
> +
> +It's possible that the cxx-generate-packed-data.cc is compiled
> +while the t/test-full.pb.h is being generated. This will result
> +the following error.
> +
> +  DEBUG:	./t/test-full.pb.h:4:0: error: unterminated #ifndef
> +  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> +
> +Add a dependency to avoid such problem.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index b0cb065..1608ae0 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -156,6 +156,7 @@ noinst_PROGRAMS +=3D \
> + t_generated_code2_cxx_generate_packed_data_SOURCES =3D \
> + 	t/generated-code2/cxx-generate-packed-data.cc \
> + 	t/test-full.pb.cc
> ++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
> + $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
> + t_generated_code2_cxx_generate_packed_data_CXXFLAGS =3D \
> + 	$(AM_CXXFLAGS) \
> +--=20
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> index 7ef030092..17f92f04b 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> @@ -15,7 +15,8 @@ DEPENDS =3D "protobuf-native protobuf"
>  PV .=3D "+git${SRCPV}"
>  SRCREV =3D "269771b4b45d3aba04e59569f53600003db8d9ff"
> =20
> -SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git"
> +SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> +           file://0001-avoid-race-condition.patch"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.23.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXajSyQAKCRA3VSO3ZXaA
HOY9AKCq2xnisEDh88Fs6LTX90TGZZFbdQCeLZHyWb/qupefFY1loLVYM2J7Je4=
=wO38
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
