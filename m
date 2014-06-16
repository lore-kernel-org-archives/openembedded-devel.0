Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D094865FC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 14:19:20 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so4170063wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hMBI0nvbF/AMzzmnN8GLlzcj4m3Hwm48SWabgUDrUno=;
	b=rPr72dmP+vaTNQwasqUEBl5DslGQoshqSurTYSKyID/CMEshU+X4amt9gYCq58+x06
	zLHdu/V/0O1K5LzJJ53+NP87BVw4G6fEuHdvAFMKsSaHkqEpcvidjVKzsd1D/NiH5FMX
	CX8pNg8sR7j3GSzQvcLTNq4IzIFE7enMdVWscx3F8Kj/cilOMgMPXm0N5nmBFw6txr92
	qyDVWuh7DarQqmjooyr5Zc9eyq9Ko5wHt8OZp35z8GaDGaXUMqd0KJelagR3tPJWnY3U
	UEh22/EwRMu5b/xBe6+s5kOlr5SuCTK5zr46q7/Rt+ztb5E8DHyhg9QEgZfJ4+t9p6Th
	fGfg==
X-Received: by 10.180.72.176 with SMTP id e16mr28007933wiv.44.1402928360684;
	Mon, 16 Jun 2014 07:19:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w9sm34231696eev.4.2014.06.16.07.19.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 07:19:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Jun 2014 16:19:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140616141945.GQ2428@jama>
References: <20140616122805.79FDD50297@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140616122805.79FDD50297@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [oe-commits] Robert Yang : tftp-hpa: inherit autotools-brokensep
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
X-List-Received-Date: Mon, 16 Jun 2014 14:19:21 -0000
X-Groupsio-MsgNum: 50354
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EguBBKnZWdUQS9Kz"
Content-Disposition: inline

--EguBBKnZWdUQS9Kz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2014 at 12:28:05PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 8e689bb7a154143c1bdfda5ec7a7e8c79bb1381b
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D8e689bb7a154143c1bdfda5ec7a7e8c79bb1381b
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Jun 13 08:46:24 2014 +0800
>=20
> tftp-hpa: inherit autotools-brokensep
>=20
> It needs autotools-brokensep, otherwise do_install error:
>=20
> make: *** No rule to make target `install'.  Stop.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>=20
> ---
>=20
>  '                                                   | 21 +++++++++++++++=
++++++

Joe: please remove this file ^

>  .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb        |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/' b/'
> new file mode 100644
> index 0000000..244cc72
> --- /dev/null
> +++ b/'
> @@ -0,0 +1,21 @@
> +radvd: inherit autotools-brokensep
> +
> +It needs autotools-brokensep, otherwise do_install error:
> +
> +install: cannot stat `radvd.conf.example': No such file or directory
> +
> +(LOCAL REV: NOT UPSTREAM) -- Waiting for updating upstream-master
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
> +# Please enter the commit message for your changes. Lines starting
> +# with '#' will be ignored, and an empty message aborts the commit.
> +# On branch wr-7.0-20140426
> +# Your branch is ahead of 'origin/wr-7.0-20140426' by 10 commits.
> +#   (use "git push" to publish your local commits)
> +#
> +# Changes to be committed:
> +#   (use "git reset HEAD <file>..." to unstage)
> +#
> +#	modified:   recipes-daemons/radvd/radvd.inc
> +#
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/m=
eta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> index 6978e06..5baa61b 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> @@ -29,7 +29,7 @@ SRC_URI =3D "http://kernel.org/pub/software/network/tft=
p/tftp-hpa/tftp-hpa-${PV}.t
>  SRC_URI[md5sum] =3D "46c9bd20bbffa62f79c958c7b99aac21"
>  SRC_URI[sha256sum] =3D "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c=
9332841304d1a269"
> =20
> -inherit autotools update-rc.d update-alternatives
> +inherit autotools-brokensep update-rc.d update-alternatives
> =20
>  EXTRA_OECONF +=3D "--disable-option-checking"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EguBBKnZWdUQS9Kz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOe/QEACgkQN1Ujt2V2gBzvYgCfUZjA7ILKGQb4fZH0iX9lsTnl
fAcAoLXI0HTKk2pROSZkorAn2aZ84gvu
=rdJT
-----END PGP SIGNATURE-----

--EguBBKnZWdUQS9Kz--
