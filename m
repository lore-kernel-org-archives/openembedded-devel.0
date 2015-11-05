Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 803D875D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:39:46 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so7771761wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SAb1wsFVf04ohNgcLLEy7npCx7b9ON+kfQ8RxxFVk68=;
	b=iBf1bDSHh6Qjtc11iPjurCbIhKJ4wKCIJKNfbYnbKkTW8anEpOL/PG/o1bWl01ZAuZ
	UXkO5FJPHg/yJ/cDMpxA7ip9XqfZaTnAQksdzIGinbkFDVO0Rgkx5AT8kACYUx+p0BUE
	W8LQOV6m/NFMc/Ycaco71LRs6h8QzGuctnZYdmWb9odl6t3VxUq48jiVL28/JM6mkXIh
	r7nvwPkd5AhmHgtFRDgf6+sMZReU+dPmGthJ6gFTHMqq3+E4OKQMTXvplJw98e7r3347
	GUoYxM11oJPnL+EuraYqpoYTTWEhpK692OWszEfVE1Sw2QMGeiuhLo07fQmMzOfN0VBi
	gTHA==
X-Received: by 10.194.92.138 with SMTP id cm10mr8049050wjb.6.1446723586670;
	Thu, 05 Nov 2015 03:39:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t126sm33675359wmd.18.2015.11.05.03.39.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 03:39:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Nov 2015 12:39:57 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151105113957.GD2556@jama>
References: <1446722814-21435-1-git-send-email-funman@videolan.org>
MIME-Version: 1.0
In-Reply-To: <1446722814-21435-1-git-send-email-funman@videolan.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH] VLC: make gnome-vfs configurable
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
X-List-Received-Date: Thu, 05 Nov 2015 11:39:48 -0000
X-Groupsio-MsgNum: 58342
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Content-Disposition: inline

--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2015 at 12:26:54PM +0100, Rafa=EBl Carr=E9 wrote:
> ---
> XXX: to be cherry-picked together with <1446652999-24545-3-git-send-email=
-funman@videolan.org>

Squash 1446652999-24545-3-git-send-email-funman@videolan.org into this
one..

>=20
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index bf08405..ce6e52d 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -60,6 +60,7 @@ PACKAGECONFIG[qt4] =3D "--enable-qt,--disable-qt, qt4-x=
11-free"
>  PACKAGECONFIG[freerdp] =3D "--enable-freerdp,--disable-freerdp, freerdp"
>  PACKAGECONFIG[notify] =3D "--enable-notify,--disable-notify, libnotify g=
tk+"
>  PACKAGECONFIG[dvbpsi] =3D "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
> +PACKAGECONFIG[gnome-vfs] =3D "--enable-gnomevfs,--disable-gnome-vfs, gno=
me-vfs"
> =20
>  do_configure_prepend() {
>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY7QA0ACgkQN1Ujt2V2gBweBQCgkUPGCA3bQcqfTFGQ91RzoD6W
AZ8AnRJEUQAnNTL86cLdE4ZSN4r+hhvt
=4kzU
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
