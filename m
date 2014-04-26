Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id A5BC865E0C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 22:38:07 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so3733192eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8E4pu39w/jY4LIMckLrIfBYtn3XULkDBazY5Kab+CLE=;
	b=bztOBgH09NGwE+Zus4U5Ph76LoOKWylxiFDFitSG0/LxvvhhFEN4zErUGyb0tiaOl3
	PSf55kDLwCjhl1SbCZujtBGk7dCMz3MY9AEVCdvcUB/KCAcWbuXJecVpXSA9ZOgDTz1M
	7z56rWpjXgihSnPh/xVAVCBCnVFSPB439i0FXLsX32tLoZ/Wwzbb8Tvwuj7Xu9IhK0+h
	4aJLMjs3qHNsI5kUAZYZ7KRZiOYPeqt+OC20oRjdzVjeoabfrHddCle5XRx5vsH5A2UQ
	1IfxqFNYWjwHftQROIup85TdpKshJ+WKVbBfATUcMZ182J2B6aVGH+rVawD33mQw5RN3
	8gZg==
X-Received: by 10.14.176.1 with SMTP id a1mr5687136eem.52.1398551887857;
	Sat, 26 Apr 2014 15:38:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm36715393eel.1.2014.04.26.15.38.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 15:38:06 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 27 Apr 2014 00:38:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140426223818.GD2486@jama>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
	<1398544484-27299-12-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1398544484-27299-12-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-gnome][PATCH 12/21] Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 22:38:10 -0000
X-Groupsio-MsgNum: 49543
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ColLPB4ZSxbGn3BV"
Content-Disposition: inline

--ColLPB4ZSxbGn3BV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2014 at 01:34:35PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Missing gnome-power-manager: in subject

> ---
>  .../gnome-power-manager/gnome-power-manager_2.32.0.bb              |    =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-man=
ager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-m=
anager_2.32.0.bb
> index ddc436e..8ddfd68 100644
> --- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.=
32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.=
32.0.bb
> @@ -29,10 +29,10 @@ EXTRA_OECONF =3D " --disable-scrollkeeper \
>  do_configure_append() {
>      rm config.log
>      # Sigh... --enable-compile-warnings=3Dno doesn't actually turn off -=
Werror
> -    for i in $(find ${S} -name "Makefile") ; do
> +    for i in $(find ${B} -name "Makefile") ; do
>          sed -i -e s:-Werror::g $i
>      done
> -    sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefile
> +    sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${B}/src/Makefile
>  }
> =20
>  PACKAGES =3D+ "${PN}-applets"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ColLPB4ZSxbGn3BV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNcNVoACgkQN1Ujt2V2gBz8wgCggSyUr8MTNiNpNBP7xfRYY+N/
xdMAoKsvuATePySj7qDvce7J0GjjauU5
=pnsG
-----END PGP SIGNATURE-----

--ColLPB4ZSxbGn3BV--
