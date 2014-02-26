Return-Path: <joe@deserted.net>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 878736BF88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 03:40:56 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id to1so221642ieb.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 19:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=0t5sdFR0ao4dmU7gPGCg+l4BItKxaINuTrtUNZ5yiLc=;
	b=Fw6rq9W1/EcEYqlxLR9aSrgSSXcy4sOPNIilcAgVNolu5b4nTRn1xWYFt57QMMryPe
	94QdQcoNPO4aYo8pOEYRtjNLvrBJvV1PEDC2g1UZv6BN8HoD6FPKvrsaPu1ItUuKYQl4
	Y38g34ktZVIutc1ZXziESCG3pnIj9IsL44fCEGEKq6Y/9silKHyZ3RPPwHZZwst9/Wdk
	/iKUqLNd8vCS/zXNoLoAxJDH4rcZDOTkfVeEzGucfOg+489ctC6SEvJ48hFGva7Podxz
	U0XrtLxM+3xr8eH8tGPJoc6PU86XGw2RUDAKvjj1XUiWVtMlrmuvf9EumizF0CvNAWAC
	80bw==
X-Gm-Message-State: ALoCoQmdtQPnrWUXhPsDlZFmGLVQaUIkPZAyEFB1NEzOU3TNHH0XyABDj5dZ86sjdSemrG+5DZmU
X-Received: by 10.50.67.82 with SMTP id l18mr687588igt.29.1393386056958;
	Tue, 25 Feb 2014 19:40:56 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	pn6sm1782673igb.4.2014.02.25.19.40.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 25 Feb 2014 19:40:56 -0800 (PST)
Date: Tue, 25 Feb 2014 22:40:53 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140226034051.GC7489@deserted.net>
References: <1393315114-26254-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1393315114-26254-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-networking] bridge-utils: fix the no brctl error when enable multilib
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
X-List-Received-Date: Wed, 26 Feb 2014 03:41:05 -0000
X-Groupsio-MsgNum: 48355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline

--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH][meta-networking] bridge-utils: fix the no brctl error when en=
able multilib] On 14.02.25 (Tue 15:58) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> update-alternatives.bbclass does not create the brctl symbolic links for
> multilib, since the wrong use of PN generates
> /usr/sbin/brctl.lib32-bridge-utils, not /usr/sbin/brctl.bridge-utils;
>=20
> In fact, no need to rename brctl by calling mv, since update-alternatives
> will handle it
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/bridge-utils/bridge-utils.inc |    1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.in=
c b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> index bcdc04a..e06c32e 100644
> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> @@ -20,7 +20,6 @@ ALTERNATIVE_LINK_NAME[brctl] =3D "${sbindir}/brctl"
>  EXTRA_OECONF =3D "--with-linux-headers=3D${STAGING_INCDIR}"
> =20
>  do_install_append () {
> -    mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
>      install -d ${D}/${datadir}/bridge-utils
>      install -d ${D}/${sysconfdir}/network/if-pre-up.d
>      install -d ${D}/${sysconfdir}/network/if-post-down.d
--=20
-Joe MacDonald.
:wq

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMNYkMACgkQwFvcllog0XzZagCgjTgRdgj/8nLKN2/aa/JM1o9a
YBgAn1XIV/dTpGu8jyhEKPXHal5qVurr
=dXZX
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
