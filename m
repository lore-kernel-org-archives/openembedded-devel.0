Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3508E7C6F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:35:13 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id p25so19931708qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=A/2IKbqic9V2W5QhHFRXhFfy3m9pvC3aqF6YPbqUdL4=;
	b=rnezeoAf76XsjSkz1QvSNXOCA3j4ivTTnfr4A/q7EBOmSwZ7u7uJ5yT9UB+U7BQYzW
	CFUeVcjddkUAuMbfUhv3ECj3Y3W746X93rEFPXqhnNerrRlVppe6xbL5zlUmn9Cl7aU8
	73cbPC3bS+JawJC1xyMe3HJsKnyu6btwFo8/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=A/2IKbqic9V2W5QhHFRXhFfy3m9pvC3aqF6YPbqUdL4=;
	b=dEqAqxWmVGDdVV+17aRH7a6XLSznNunR/iUoVz91C8kCGyuVVYWoUwIOrXq6tD94g2
	+vrZ3Vy13LJM2X91sAGxY4hE6RCKtfWlLU4aQvmDJXjTBN/m73+uHAQRldpJr1tkD+Qz
	dgXdBdv8eYjv/IIWYy91SvWDH533MurWGFKFQ+yzH0PbVUeTJ8nvOoudWjKz2YbTUtLO
	SqpoJRGc0pU6M2RHaXrrhaNDTSLqAciN8IT8RrJO5Vis3WnPUyRsiy2EujcFvB5PzcEQ
	3uT2EF5A0mP2RqNJtFva6lzKhACi7Mbc7HpElpMPsUkyBcBLIKGZmpT7qhGBm4BGzUNM
	5aRg==
X-Gm-Message-State: APjAAAW57qNPtDcZEWB3lv6IEZSE4zm7P8GERQLkYL2NlmglojkMONWz
	hI4kRTIlZ+hwL6SFE4wL6EOQhQ==
X-Google-Smtp-Source: AHgI3IbjdY9bR0i8WQberUnet8eKw8nuJpor+JR758Nvh3DfmZiJEFOUM6yzoVZBxFLRYXAsQep9QQ==
X-Received: by 2002:ac8:35a7:: with SMTP id k36mr2433726qtb.213.1551285314868; 
	Wed, 27 Feb 2019 08:35:14 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-84B8-DE84-7E3B-D376.dyn6.twc.com.
	[2606:a000:1401:880d:84b8:de84:7e3b:d376])
	by smtp.gmail.com with ESMTPSA id
	w8sm15690084qkw.80.2019.02.27.08.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 08:35:13 -0800 (PST)
Date: Wed, 27 Feb 2019 11:35:11 -0500
From: Tom Rini <trini@konsulko.com>
To: changqing.li@windriver.com
Message-ID: <20190227163511.GR12046@bill-the-cat>
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
	<1551256910-119653-5-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1551256910-119653-5-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 4/4] freeradius: add PACKAGECONFIGs
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
X-List-Received-Date: Wed, 27 Feb 2019 16:35:14 -0000
X-Groupsio-MsgNum: 76524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mkHYMT4O8DyWoHkb"
Content-Disposition: inline

--mkHYMT4O8DyWoHkb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2019 at 04:41:50PM +0800, changqing.li@windriver.com wrote:

> From: Changqing Li <changqing.li@windriver.com>
>=20
> add 3 PACKAGECONFIG
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb | 3=
 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3=
=2E0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0=
=2E17.bb
> index c17d56d..cee3b47 100644
> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> @@ -83,6 +83,9 @@ PACKAGECONFIG[perl] =3D "--with-perl=3D${STAGING_BINDIR=
_NATIVE}/perl-native/perl --w
>  PACKAGECONFIG[python] =3D "--with-rlm_python --with-rlm-python-bin=3D${S=
TAGING_BINDIR_NATIVE}/python-native/python --with-rlm-python-include-dir=3D=
${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python,python-native python"
>  PACKAGECONFIG[rest] =3D "--with-rlm_rest,--without-rlm_rest,curl json-c"
>  PACKAGECONFIG[ruby] =3D "--with-rlm_ruby,--without-rlm_ruby,ruby"
> +PACKAGECONFIG[no-ssl] =3D "--without-openssl,--with-openssl"

This is commonly done with 'openssl' as the PACKAGECONFIG flag.

> +PACKAGECONFIG[no-rlm-eap-fast] =3D "--without-rlm_eap_fast,--with-rlm_ea=
p_fast"
> +PACKAGECONFIG[no-rlm-eap-pwd] =3D "--without-rlm_eap_pwd,--with-rlm_eap_=
pwd"

We also don't have any other examples of "no-xxx".  What is the behavior
we have here today?  If "enabled" we should put them in the default
PACKAGECONFIG instead, imho.

--=20
Tom

--mkHYMT4O8DyWoHkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcdrw/AAoJEIf59jXTHXZSrEcQALBebU3M+bl3c6YQE4lRGH2Z
yNYDEtjN7jBZnxlwVJ9aQFWgTsdeSz9oLjG/nKrfvODiHJDKzPsLQ3Wcv66ORM1w
bne10sSEH+pZMALvw68o/L48lLj3XAFAThLETRvadKMNOQbwV2/r5afSWIJ9i5vr
PMQINrE+2sfJq44EJPgJqvBXC+OyDlL102+4uyv/7dU/S8eoyG5JBO+Nw4H9O/oU
iKCKtEalE1JH5SJLcHd0GMGPCXZ4TgjUHGcPrWq4UxFf9Goq/DE9BjbMu+SSMr4y
kFt+EcWVWZXS5xXZb4UfitsvljFfXApv1tVMWF8oHQSIXYt+WB3UiAX2W5ljyM18
8eYpKlMEIGtxXMVIeFWKWhSDEGGf5Nd81r3OfTDarXjOzgmOhTfL1+TkO8HDhgdq
miJgUrpK6pwgLlYRAY6cBXAfWXhGiV8PAs+io+cxio2RmlvchX/G7E3oxKCVgcPZ
xbln6sGWnilCkIoXlIDKx4YMFmVB8fubvTYgr9zyKeb8XcVCG2OYzYrircxwlN91
3QzUqjYJuNh+OLv804lbYTQfj05jCEVu46DuDhx1W9ZpU2XU0I8F5i6sSDVjKKSO
79H0ppmDUiIkhLHmoSLrYWLEaUuoZd01/UGN0JyYBe/S4bdf3FSTtsmM0or2jUvU
26rXGzDWU32P1aOhfWex
=+Q14
-----END PGP SIGNATURE-----

--mkHYMT4O8DyWoHkb--
