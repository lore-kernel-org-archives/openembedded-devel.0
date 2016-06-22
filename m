Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC156FF25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 19:35:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a66so4305238wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 12:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5bDVs27NPLYU4ntwHQlCszGs5yc8wWaYEWy4iuK+ibI=;
	b=tGzZS9WpdmG2NgsHlFHVfc7Le8M81JyhZY+TQExkceIhzhfv1fknrRyzT/zPA6eCoR
	Xts3uJoVcSsrep0DhfoXhHcHn/zQif7xH9EqIANFoStY4WDqaZ5lT8c5KcrSXKahIlF/
	Br78663DMTYljAcz6EB1pr1sWaIVk84/hov60IVi7OmsBpNfs3EIMoocGNHy1raczOZX
	8bjg4/9+bcqHfzT3S1/rtcGX+bSD1V3fDKub4VjTGkyCwcQoK+1LOwH2NlbdRCMf+liD
	2L9+sJh0xJNaQ+HRL9MYPYn1K/b6dgwFbbApQoxuPQR/divJrOaPxD351xrAMfGlN8ar
	HTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5bDVs27NPLYU4ntwHQlCszGs5yc8wWaYEWy4iuK+ibI=;
	b=ELAYrRoJ1FsEHpR/3NW8xr8TIU6h+vMrIKRQLsbDqxs77t1t590yYYXifW79k70yV9
	mP8J/zbLZ7pSsmHw8fh82f1yxhkbwNUn9uWMiH53XXwZf8Ned9/CR/zPG7wG9d08jVav
	hpDDIW7PCVM8o+Bdr1NNkpeYouZ9/6gZGLlUPWrJCfcZDWZgj4WZE6ie57woVR82n+Hh
	fwsZasKozSw9qaRUStzIcQ2yBj1AFqcev8nyQ2jyTV+fU94ayizjIHq8a7m8H+O5b2Yp
	yuzsQWwxe7K/vBKHnCBG8WhGEWFfA8I0WJz8qywdZX8S4bRBa4OwSsxvt3no6L32u9wf
	mDLQ==
X-Gm-Message-State: ALyK8tLjswxxNNo2mJS1VvfeUwWjApwhBnoSEoEaonGfx/KFAbKME+6G8dZWA8gPTkF/Tg==
X-Received: by 10.194.5.40 with SMTP id p8mr26517435wjp.56.1466624141808;
	Wed, 22 Jun 2016 12:35:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	f189sm273910wmf.19.2016.06.22.12.35.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Jun 2016 12:35:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Jun 2016 21:35:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160622193559.GD4153@jama>
References: <1466192409-3297-1-git-send-email-derek@asterius.io>
	<1466192409-3297-2-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1466192409-3297-2-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCH 2/2] Remove blacklisted recipes due to poppler build failures
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
X-List-Received-Date: Wed, 22 Jun 2016 19:35:42 -0000
X-Groupsio-MsgNum: 61936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline

--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 03:40:09PM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-efl/recipes-efl/efl/epdf_svn.bb                 | 2 --
>  meta-gnome/recipes-gnome/evince/evince_3.18.2.bb     | 2 --
>  meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 2 --
>  meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb         | 2 --
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb     | 2 --
>  5 files changed, 10 deletions(-)
>=20
> diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/=
efl/epdf_svn.bb
> index a4c7d49..e32a5fd 100644
> --- a/meta-efl/recipes-efl/efl/epdf_svn.bb
> +++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
> @@ -25,5 +25,3 @@ EXTRA_OECONF =3D "\
> =20
>  # Some upgrade path tweaking, as in evas
>  AUTO_LIBNAME_PKGS =3D ""
> -
> -PNBLACKLIST[epdf] ?=3D "Depends on broken poppler"
> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnom=
e/recipes-gnome/evince/evince_3.18.2.bb
> index 4fa11a5..fe63093 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
> @@ -46,5 +46,3 @@ FILES_${PN}-staticdev +=3D "${libdir}/nautilus/extensio=
ns-2.0/*.a \
>                            ${libdir}/evince/*/backends/*.a"
>  FILES_${PN}-nautilus-extension =3D "${libdir}/nautilus/*/*so"
>  FILES_${PN}-browser-plugin =3D "${libdir}/mozilla/*/*so"
> -
> -PNBLACKLIST[evince] ?=3D "Depends on broken poppler"

evince is broken on it's own:

| ../../evince-3.18.2/libdocument/ev-document-misc.c: In function 'ev_docum=
ent_misc_format_date':
| ../../evince-3.18.2/libdocument/ev-document-misc.c:534:33: error: '%c' yi=
elds only last 2 digits of year in some locales [-Werror=3Dformat-y2k]
|   len =3D strftime (s, sizeof (s), fmt_hack, &t);
|                                  ^~~~~~~~


> diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-=
gnome/recipes-support/tracker/tracker_0.14.2.bb
> index 7e6c400..ff53669 100644
> --- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
> +++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
> @@ -83,5 +83,3 @@ FILES_${PN}-nautilus-extension +=3D "${libdir}/nautilus=
/extensions-2.0/*.so"
> =20
>  SRC_URI[md5sum] =3D "f3a871beeebf86fd752863ebd22af9ac"
>  SRC_URI[sha256sum] =3D "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d=
616d9969314bc7f1"
> -
> -PNBLACKLIST[tracker] ?=3D "Depends on broken poppler"
> diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recip=
es-graphics/gimp/gimp_2.8.14.bb
> index 3c134bb..29ed4d9 100644
> --- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
> +++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
> @@ -30,5 +30,3 @@ CFLAGS +=3D "-fPIC"
> =20
>  FILES_${PN}-dbg +=3D "${libdir}/gimp/2.0/*/.debug"
>  FILES_${PN}  +=3D "${datadir}/appdata"
> -
> -PNBLACKLIST[gimp] ?=3D "Depends on broken poppler"
> diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce=
/recipes-xfce/tumbler/tumbler_0.1.31.bb
> index 5a0fc6d..66385a4 100644
> --- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> @@ -27,5 +27,3 @@ FILES_${PN}-dbg +=3D "${libdir}/tumbler-1/.debug \
>                      ${libdir}/tumbler-1/plugins/.debug \
>                      ${libdir}/tumbler-1/plugins/cache/.debug \
>  "
> -
> -PNBLACKLIST[tumbler] ?=3D "Depends on broken poppler"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldq6J4ACgkQN1Ujt2V2gBy7VwCdFCBsL0RwsVI1F8ReOA5Bb636
e80Anjzg3AkBIT9fu1sMZTgmTOIoco7d
=xxzx
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
