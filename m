Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3285F6AC7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:39:45 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so1317639wev.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y52CW9AAsmQtaBPPDDGrzR0e1s41Fwx5/ZGsGiZnl5w=;
	b=GREIBkdtLAjOmjQC0ekZFXl40WaU1rtlzDjltizP1qYSfsVyRX3tsCokC10CFFI84P
	GuutYQGLFcDVRM6qLQhj8i/lyWedyFyfKbCPqw4o1Zv7JbprQ98ZJ8Jz9NZSEDDo2E+2
	4kNDVWiYthaDFxR4B55XxE7Zhh4kwOkwtGGWhUBU+c3hXgrJnGWPQg7efeQOyqRAg/24
	8rCF2nySOErF2bG5Fn1qsWPJ6eQP8vwH5WDaaTF+QrZ5uvLNxuvNlUsWUO7Q86J/+M53
	T9fiDiNDpg3Sr7Zr0cNYobfYk8fQj+UCrW0zzb8Qr65duen+bu309T9a2iS7jgaA8eL/
	tyKg==
X-Received: by 10.194.71.52 with SMTP id r20mr2183109wju.113.1406126386547;
	Wed, 23 Jul 2014 07:39:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ek3sm6773678wjd.17.2014.07.23.07.39.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 07:39:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 16:40:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140723144002.GF22875@jama>
References: <alpine.LFD.2.11.1407222013280.24982@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1407222013280.24982@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] Correct spelling of "BBFILES_PRIORITY" in comments
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
X-List-Received-Date: Wed, 23 Jul 2014 14:39:49 -0000
X-Groupsio-MsgNum: 51212
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FgWTvDHj0r903stt"
Content-Disposition: inline

--FgWTvDHj0r903stt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 08:14:32PM -0400, Robert P. J. Day wrote:
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Applying: Correct spelling of "BBFILES_PRIORITY" in comments
error: patch failed: meta-multimedia/conf/layer.conf:4
error: meta-multimedia/conf/layer.conf: patch does not apply
error: patch failed: meta-oe/conf/layer.conf:4
error: meta-oe/conf/layer.conf: patch does not apply
error: patch failed: meta-systemd/conf/layer.conf:4
error: meta-systemd/conf/layer.conf: patch does not apply
error: patch failed: toolchain-layer/conf/layer.conf:4
error: toolchain-layer/conf/layer.conf: patch does not apply
Patch failed at 0001 Correct spelling of "BBFILES_PRIORITY" in comments

Can you please rebase and resend?

>=20
> ---
>=20
> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer=
=2Econf
> index 64a0a44..bfecb8c 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -4,7 +4,7 @@
>  # search the directories from first to last as specified in BBPATH
>  # Therefore if you want a given layer to be considered high priority
>  # for the .inc and .conf etc. then consider it adding at the beginning
> -# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
> +# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
>  # the recipe contention so the order of directories in BBFILES does
>  # not matter.
>=20
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 2a5a428..9d7a60a 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -4,7 +4,7 @@
>  # search the directories from first to last as specified in BBPATH
>  # Therefore if you want a given layer to be considered high priority
>  # for the .inc and .conf etc. then consider it adding at the beginning
> -# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
> +# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
>  # the recipe contention so the order of directories in BBFILES does
>  # not matter.
>=20
> diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
> index f3fc45d..d8faf21 100644
> --- a/meta-systemd/conf/layer.conf
> +++ b/meta-systemd/conf/layer.conf
> @@ -4,7 +4,7 @@
>  # search the directories from first to last as specified in BBPATH
>  # Therefore if you want a given layer to be considered high priority
>  # for the .inc and .conf etc. then consider it adding at the beginning
> -# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
> +# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
>  # the recipe contention so the order of directories in BBFILES does
>  # not matter.
>=20
> diff --git a/toolchain-layer/conf/layer.conf b/toolchain-layer/conf/layer=
=2Econf
> index ca81eb1..9289a8f 100644
> --- a/toolchain-layer/conf/layer.conf
> +++ b/toolchain-layer/conf/layer.conf
> @@ -4,7 +4,7 @@
>  # search the directories from first to last as specified in BBPATH
>  # Therefore if you want a given layer to be considered high priority
>  # for the .inc and .conf etc. then consider it adding at the beginning
> -# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
> +# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
>  # the recipe contention so the order of directories in BBFILES does
>  # not matter.
>=20
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FgWTvDHj0r903stt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPyUIACgkQN1Ujt2V2gBzfUwCdETdeh+Zty0LYfLNIpV0s53ki
DSgAnjRkb87eGmiQLNgidiMCi4XTWncc
=SQwn
-----END PGP SIGNATURE-----

--FgWTvDHj0r903stt--
