Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C7E216C4CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 10:12:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 7so5212297wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2019 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zv8OpsGjsp5TCx8KAj7KGnnRwbQ77R+Lt1AcFgsxWBs=;
	b=gbEmcW7W8fPL78GYzZFF1pgBHL6pR6o0378kXPguAwVaCXA/VerLRWR8XgHvfS+3JC
	tasfIxldwEt2ZoH6pbC8N310xmFb27s5Bo9I2k3E92BhsGIQOLWcGnj91VIg7TR0MGkO
	nR5ZErijuGWRTyFWvOpltWz+DuOZ4Q0Nd+us+z9NpaDDloixlb322WNWMhudhiQwLUN9
	J78oGXgwq0sbOK9acHFjrKW9oauN5tNue9TTqN+raXSh1hzl9EolsZ10f9CZeGSIAcjW
	ED7t59wFQ37o0tS2DltCk17J+nkd+eX62N2ztGVhmdWStysFHv5Ib7fQCwMzauZ+e4bm
	UXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zv8OpsGjsp5TCx8KAj7KGnnRwbQ77R+Lt1AcFgsxWBs=;
	b=FrQct9pRUq7cyD6hj81fFSyJiKy4bFtD9Ig0yS61vQ4oEmKLHik7RCewAZ1xuhgB/+
	5OTB3IHt3no11PlGRYJgcuakNLQ5myleaRFGfaTpVK8OIQZG1vzwn07blLpOs4KP36TC
	bG45TUa1M2eeJ+CUK1me4coLNUz+0BabTujsqjRpNSL37BjgHNQPeSSd9uB5WNPMGeJW
	CBnIgzPo78hDHIoVYAhh1pHz0ycBpn7Ph6CAD5nz+Ck9AjHh6wpduEBt53FCZZM21lO8
	ZT7N4qKFOGOkUa1SpKDIjnvLJyvSRBR6MQUsz5W77g4FFs48pN/lAlkkU7qM0+N7vWjd
	qakw==
X-Gm-Message-State: APjAAAWCvA42Dlq7gvz9zKoAtfhV7LT0xE/GhpYjMyDx+So/h/pb2kAM
	XsgM5zrtoH+ZqBfk/RdtTEE=
X-Google-Smtp-Source: APXvYqxVRO8QfqkcmlCCLMrIsqw7e+Fir+7bW9exdt3hKP+Y7zcoPQsrtI+pkA+BmJpsknPaj66O2A==
X-Received: by 2002:a1c:7c15:: with SMTP id x21mr9512205wmc.36.1570183969359; 
	Fri, 04 Oct 2019 03:12:49 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t17sm11481688wrp.72.2019.10.04.03.12.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Oct 2019 03:12:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Oct 2019 12:12:48 +0200
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Message-ID: <20191004101248.GA1983@jama>
References: <20191004100835.1700461-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20191004100835.1700461-1-adrian.ratiu@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] renderdoc: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 04 Oct 2019 10:12:49 -0000
X-Groupsio-MsgNum: 80008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 01:08:35PM +0300, Adrian Ratiu wrote:
> This recipe depends on having x11 enabled so we add it to fix:
>=20
> ERROR: Nothing PROVIDES 'libxcb' (but
> meta-oe/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> DEPENDS on or otherwise requires it)
> libxcb was skipped: missing required distro feature 'x11' (not in DISTRO_=
FEATURES)

Thanks for quick update!

Sorry I haven't mentioned it in the (late) review comment, but this will
also need distro_features_check in the inherit for
REQUIRED_DISTRO_FEATURES variable to work.

Cheers,

> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb b/meta-o=
e/recipes-graphics/renderdoc/renderdoc_1.4.bb
> index b6e0c92f6..dd5e4058c 100644
> --- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> @@ -10,6 +10,8 @@ SRC_URI =3D "git://github.com/baldurk/${BPN}.git;protoc=
ol=3Dhttp;branch=3Dv1.x \
>  "
>  S =3D "${WORKDIR}/git"
> =20
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
>  DEPENDS +=3D "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-n=
ative"
> =20
>  RDEPENDS_${PN} =3D "libxcb xcb-util-keysyms"
> --=20
> 2.23.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXZcbHwAKCRA3VSO3ZXaA
HEGLAKCy+69oeb9CteG+372rcBoleiRMUwCgsZ5Rfea0P4wjNWPBxAhaBIimuec=
=ntO1
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
