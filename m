Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A51267F64A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 20:44:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p14so3852303wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MOXwFI32mHuziiRQ69OQ0+upUBi/MxNH4f7jARiShEQ=;
	b=rI6ohaz+UMHajL8MjaCrIQuC7b0hRzzbCgr6gRaKm44y9WY7PfROYxjraNhLtOVdGI
	OHupF/CHRUcPiZWzlHkdZwy6tSFtlqCStdiVtbrFCotAm/4IUsURZuSok4vbaO+QsPNt
	+k2qT2cJ1zqMI/b2xXyFa4G6oeSq5lsGHUgWn/4vVkXOH0ok3+Qs1GuiUtHd8Bqwebab
	ot5VUpOjcvuyC9uuNiIrB0G0xin15S+ReVqwzvtkk5vMruIc1mq3eYxf1tRkEy8RM4TO
	aO/uYDIvKjRf3NXJbkgjVrRsTvpG2bnL6E9HEz4ammoBMErm1h/hZu6mFrAmrSgCArEw
	Nmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MOXwFI32mHuziiRQ69OQ0+upUBi/MxNH4f7jARiShEQ=;
	b=stkbxwZPOUA8a+ltA5wHpzeH50T6hXv/mdALC16UnH1IFoDzFmhIf+E+G86v/3Ig/3
	Pxscw9N/f8W9Yt+a2MVhkfPPrr72/IukWaAedFz9W6cTl4LSveUpS/MeWmVdj/5u/BXK
	sWAcbUMgF6a38ROavrniRf4GXMXQxmkFa4HzmNYnbcVhz6vFr3QzUJzsNuYDZpz5H9gN
	vCVi+1sBLTe20GZUlZhyzZsB/z8wAMOizSiOGUR4qrlWMsHRyqXJdtekGgLI/p0OESH0
	ULI0QUoGOEl778zfOrjHtQr8Ijjo6jRAz9hWWwNoC7YdkQJvYLDFSkK24hTBOJVLOgGQ
	kjWw==
X-Gm-Message-State: APjAAAU4IdWWWGlMlw5lmCw3oLGoqqgfVP/XBsy9QiMzLjjD/eV/yF0P
	ie/4Ct6TNBY6bN5O4VRL2Cw=
X-Google-Smtp-Source: APXvYqztZ14VB8ANRnLfRTsHubV8O4NZgPRoab+D3gKy4oOXmlAJOYsuHfGHiMPK9XAQBnX11rnOKg==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr4960569wro.16.1571345051106; 
	Thu, 17 Oct 2019 13:44:11 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id j19sm2793682wre.0.2019.10.17.13.44.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 13:44:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Oct 2019 22:44:14 +0200
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20191017204414.GB1499@jama>
References: <20190929092956.13147-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190929092956.13147-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] protobuf-c: fix race condition
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
X-List-Received-Date: Thu, 17 Oct 2019 20:44:10 -0000
X-Groupsio-MsgNum: 80209
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2019 at 05:29:56PM +0800, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../0001-avoid-race-condition.patch           | 36 +++++++++++++++++++
>  .../protobuf/protobuf-c_1.3.2.bb              |  1 +
>  2 files changed, 37 insertions(+)
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

Thanks for this patch, it seems to indeed fix this issue, I've reported
a while ago:
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg6=
4363.html

I think the upstream would be interested in this fix as well, see:
https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee38eb5f1=
f11251b07239c

Cheers,

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
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> index 6d1ffc3f4..b92f82dec 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> @@ -15,6 +15,7 @@ DEPENDS =3D "protobuf-native protobuf"
>  SRCREV =3D "1390409f4ee4e26d0635310995b516eb702c3f9e"
> =20
>  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> +           file://0001-avoid-race-condition.patch \
>            "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXajSnQAKCRA3VSO3ZXaA
HArlAKCArgrqgz9t9Wd8xbnnq4p+vMQ+vwCgoxgloIRxff04wn1QNVStr9ZUkn4=
=rh7d
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
