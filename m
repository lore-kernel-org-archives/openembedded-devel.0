Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF679782D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 10:48:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id k4so3058422wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Hr9uONhzOTCjprhqixgGB8OCaN4c1DNIM1oGN3kXqyU=;
	b=kmx8gJlXofBoozqMOGGU+Ez+qxUf5z7j4D5aXpga3oUuA1C6/gyQvb5VsMG0HE6gj2
	YHO7+8tLi+z5Z4m8XpUSXaVaen9Aij9iNOmsS8KK9zX2FZUeChRgO1DprhH7IBnhp6VO
	wh8LZtXcCCBmOGJpkjo6/G52bv3mTFpOUtrknlSin1Az7RdqlyO5Rb+SOnGKffctfJHR
	Ombnw/jrciX8B69yhCzMIxzfEf5TpYWql4sQDHxTeWnFz62stYZ1AdqtWDtzZ6Ysx7o4
	xOtUukV5b6Cz12WIuUknTYc2S1Q735S/QOe2Xg6/Qg9zI/YncY2GLFZbewxlmzxYUJ4s
	PfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Hr9uONhzOTCjprhqixgGB8OCaN4c1DNIM1oGN3kXqyU=;
	b=lIz/tqykJi8Mae5EABl1ZxMfvv+tLQrUc0qEDg/26eZqZSoYS1ers+EVjuwnmcsMZj
	YsHTm7bPwXed6gq31Onj/Q3RMwlewp2DmFhuLe524A6kM4PstiTJ2SM67c2VnqP/MDDT
	ytHKJzEx2RNYqlIyUxl1Ew9HuSVQGF7KqLY2dTcgm0KIOxIdeOaahN1uWkmWKvkhVJk8
	xgOY4GjmiHFZkvbTRUR+oTydfWzxcydpkUHtnbxAew6Z+iA9MoYPK6wYSL+q1I3k0WxK
	WZ9nQpLPP42VeHMwmnYjHXlVsPC1Pp97zdjx0feuIpBX1KNIb8E4ZQVbO2wlkffJPN87
	JJcQ==
X-Gm-Message-State: AMCzsaUu0Hm9ErYCau+V1UiXP+b84mn1wuD5jt2TmQMpSKisiA6PDf+W
	PwmwRmzur5ZzjKnXxtjWWtIncQ==
X-Google-Smtp-Source: ABhQp+SOEwtL4Z2hvQrEpb/BGtrD6m5GObmhBUgEEU25OfFwrAd45k9DhFL6uc2rOBqb0yiRjb3iTw==
X-Received: by 10.28.27.86 with SMTP id b83mr3156637wmb.74.1508237304564;
	Tue, 17 Oct 2017 03:48:24 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r44sm24556198wrb.37.2017.10.17.03.48.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Oct 2017 03:48:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Oct 2017 12:51:32 +0200
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <20171017105132.GB4387@jama>
References: <CA+chaQdLD0cS0vFugYi7xK8o1=MzyyE7pC3X4ReKCppGae_Faw@mail.gmail.com>
	<20171017103515.13487-1-mikko.ylinen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171017103515.13487-1-mikko.ylinen@linux.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] mraa/upm: enable nodejs bindings by default
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
X-List-Received-Date: Tue, 17 Oct 2017 10:48:24 -0000
X-Groupsio-MsgNum: 69233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 01:35:15PM +0300, Mikko Ylinen wrote:
> HAVE_NODEJS is a leftover from meta-refkit-core where the
> layer had to adapt to different BBLAYER combinations (some
> where nodejs wasn't available but mraa/upm were).
>=20
> Since that check is no longer needed and nodejs is in fact
> part of meta-oe, nodejs bindings can be enabled by default
> (with an exception for qemuarm/armv5 where nodejs isn't
> available).
>=20
> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
> ---
>  meta-oe/recipes-extended/mraa/mraa_git.bb | 5 ++++-
>  meta-oe/recipes-extended/upm/upm_git.bb   | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-=
extended/mraa/mraa_git.bb
> index 616048fac..b22691ca4 100644
> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -31,7 +31,10 @@ FILES_${PN}-utils =3D "${bindir}/"
>  # override this in local.conf to get needed bindings.
>  # BINDINGS_pn-mraa=3D"python"
>  # will result in only the python bindings being built/packaged.
> -BINDINGS ??=3D "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_N=
ODEJS') or '0') else '' }"
> +BINDINGS ??=3D "python nodejs"
> +
> +# nodejs isn't available for armv5 architecture
> +BINDINGS_qemuarm ??=3D "python"

qemuarm isn't the only armv4 and armv5 MACHINE OE supports, use the same
3 overrides nodejs recipe is using.

>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nod=
ejs', '', d)} \
>   ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)=
}"
> diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-ex=
tended/upm/upm_git.bb
> index 38065ce53..eea5ae80a 100644
> --- a/meta-oe/recipes-extended/upm/upm_git.bb
> +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> @@ -26,7 +26,10 @@ inherit distutils3-base cmake
>  # override this in local.conf to get needed bindings.
>  # BINDINGS_pn-upm=3D"python"
>  # will result in only the python bindings being built/packaged.
> -BINDINGS ??=3D "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_N=
ODEJS') or '0') else '' }"
> +BINDINGS ??=3D "python nodejs"
> +
> +# nodejs isn't available for armv5 architecture
> +BINDINGS_qemuarm ??=3D "python"
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nod=
ejs', '', d)} \
>   ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)=
}"
> --=20
> 2.11.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWeXgtAAKCRA3VSO3ZXaA
HH09AJdlGDp+SL5yojGvATv4c2Y4ubm1AKC5M5iIYmtg+U76x1BnyACCK8oj3w==
=PdP6
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
