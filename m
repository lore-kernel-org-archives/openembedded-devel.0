Return-Path: <joe@deserted.net>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id A907B6F8DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:28:05 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id r5so4948481qcx.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=d6nguICRt2FLFTq4WwR2IN9FMZTFibs/fpUZYB3QDt8=;
	b=ILXDfWBMz/OZCRtgWjeI3B/+v4Fc3/TRR1D3OfOWQs/Xys3eKK6dbbwm14dWAcrKrv
	DHKvK7bDxAv8uL6Q9gdpSKpRMZWREF+PIeXTY9IPiL1Whc3lP4FP+EpQKa8P2eDsLYPk
	Lo/8wIM0IY71S03gApuEjGCKVKih/SVYAXyOJqAjQTjQhM+sGPVTL5KVpPmmcmukSN/W
	oAJpOOF+ht1ZFFK0l0NZ8z5RykMi5WYFfxSb+SXl6meai4xkjF9zXDK782EsgMOqjPzX
	PVHPl8MD4HlBToRZU1sHY6yVbBirarLZVURBoTAh+CUhNnOxaloyN4RaFBKnchEwAOL5
	e3HQ==
X-Gm-Message-State: ALoCoQkTGMYySIDXJ3jU5FFDwiZxdwonl2gr8Mx94IFR/JruXBM27shkxv++mxZjI6UblPWfjB4Y
X-Received: by 10.140.107.10 with SMTP id g10mr4614824qgf.56.1395952086127;
	Thu, 27 Mar 2014 13:28:06 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id f3sm5789373qag.7.2014.03.27.13.28.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 13:28:05 -0700 (PDT)
Date: Thu, 27 Mar 2014 16:28:03 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140327202801.GC15666@deserted.net>
References: <1395350240-29372-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1395350240-29372-1-git-send-email-jslater@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH 1/1] traceroute: fix alternate name
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2014 20:28:07 -0000
X-Groupsio-MsgNum: 48871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH 1/1] traceroute: fix alternate name] On 14.03=
=2E20 (Thu 14:17) Joe Slater wrote:

> traceroute6 for the name is misleading and will interfere
> with traceroute6 in iputils making an alternate link to
> the traceroute6 binary, so we change the name to traceroute.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-support/traceroute/traceroute_2.0.18.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-support/traceroute/traceroute_2.0.18.bb b/recipes-su=
pport/traceroute/traceroute_2.0.18.bb
> index e6718db..83ac5a7 100644
> --- a/recipes-support/traceroute/traceroute_2.0.18.bb
> +++ b/recipes-support/traceroute/traceroute_2.0.18.bb
> @@ -39,5 +39,5 @@ do_install() {
> =20
>  }
> =20
> -ALTERNATIVE_${PN} =3D "traceroute6"
> -ALTERNATIVE_LINK_NAME[traceroute6] =3D "${bindir}/traceroute"
> +ALTERNATIVE_${PN} =3D "traceroute"
> +ALTERNATIVE_LINK_NAME[traceroute] =3D "${bindir}/traceroute"
> --=20
> 1.7.3.4
>=20
--=20
-Joe MacDonald.
:wq

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlM0idEACgkQwFvcllog0XwRmwCfW9SIyuB2x2Jnx/TqjSgUHbYw
BIoAoKuZ/RFPEtPVzPJj0PQFUW5A0d9s
=CbN9
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
