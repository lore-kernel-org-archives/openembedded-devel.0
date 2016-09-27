Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 36A4D6080F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 09:13:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l132so121723wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZCSjEHbrC//8ke0TItsPBOf+pLoiFZMdDKf2Gbaksz0=;
	b=IGOAwFngTzwIhdEPsqNOXR7TvAwSg4cmE+NJGULN3rbnP0vGZSWKkxcgIw7teqaZSo
	Or87jwPjT7+dkw8LCGG07j2cBDZdGlmk8JfzAGAFI4xtj0xHrvDWtmvMTh9IMrFMrjeQ
	+vBlHvPHLdPu9GTpufd6JCEoJJCdx3kWTr92pM6H3yavAen5soCPUuxhVcCN3tEtf+JO
	Cf66w9DPYibrn0TeOHUHM1tp6CjfFGBYGPR9ZxGWpkjnunZ5FpcL5L8HgTShPBQJl9e0
	OAR4NhkUKl+7P9bwPBqNykF4usj1lf2OV/McOa/f2+AwGxGXhvXWprpdlyye0FaddfWC
	0Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZCSjEHbrC//8ke0TItsPBOf+pLoiFZMdDKf2Gbaksz0=;
	b=VIYlT7CstydCMPKHVA6l9VgVl890zT5LT/tEB4HRD89Kzm1uSl8lnjCpE6hzaFvVKi
	6/eQSlxcUD4n58AY0osJa10v12Sm9aSSiiakRuMUuMFkc7l/gz9uLpIDrWu08SSWR2US
	cHxRPyWQJ+iX1+Ct467k1UY81gVYzxRnYQ6er37E9atu9+q0HxloH6EebqKEAxWtOUDy
	KArR3KyfuTZMfIpnepsVyZZIuqQ5Sv5PiFA/61IkNkz9F8CjPRXAk+bokSo2cEgeTHrl
	bKJRmJ1CdPSNiTvBHPh27auCRkOEL/OUvrG7Nd9y7J+1Zd92O3s6GqVRGSEA2fViNBo7
	9N2Q==
X-Gm-Message-State: AA6/9Rmot7oBc4+sb5wcalqzD48ZW1/5v0Cf3TTRYUoUl/XxjmWNEHbWnVSX1XdSHV8fRw==
X-Received: by 10.28.87.16 with SMTP id l16mr1947510wmb.75.1474967639899;
	Tue, 27 Sep 2016 02:13:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	e12sm15657193wmg.17.2016.09.27.02.13.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Sep 2016 02:13:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Sep 2016 11:14:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160927091406.GA2643@jama>
References: <1474905372-17360-1-git-send-email-laurent.gourvenec@qarnot-computing.com>
MIME-Version: 1.0
In-Reply-To: <1474905372-17360-1-git-send-email-laurent.gourvenec@qarnot-computing.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-python][PATCH] python-cython: update SRC_URI for new download location
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
X-List-Received-Date: Tue, 27 Sep 2016 09:14:00 -0000
X-Groupsio-MsgNum: 63313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2016 at 05:56:12PM +0200, Laurent Gourv=E9nec wrote:
> Signed-off-by: Laurent Gourv=E9nec <laurent.gourvenec@qarnot-computing.co=
m>

Applying: python-cython: update SRC_URI for new download location
error: meta-oe/recipes-devtools/python/python-cython_0.15.1.bb: does not
exist in index
Patch failed at 0001 python-cython: update SRC_URI for new download
location

> ---
>  meta-oe/recipes-devtools/python/python-cython_0.15.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb b/me=
ta-oe/recipes-devtools/python/python-cython_0.15.1.bb
> index 0bf057a..65db532 100644
> --- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
> @@ -8,7 +8,7 @@ SRCNAME =3D "Cython"
>  BBCLASSEXTEND =3D "native"
>  PR =3D "r3"
> =20
> -SRC_URI =3D "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
> +SRC_URI =3D "https://pypi.python.org/packages/source/C/Cython/Cython-${P=
V}.tar.gz \
>             file://0001-Don-t-append-docs-to-_Extension.extension.__doc__=
=2Epatch \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfqN4gACgkQN1Ujt2V2gBwGaACgju4Vc3ugxG1u6EPsTGWau5nh
/osAn2fqTq/sLB8UQod0ni2RWQJJlwzh
=RLdL
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
