Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F86371A8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:06:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c17so23719422wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K28yGzXLkGmSgH/STqFb3Yxx5koqnCozvsAlWXuvLdE=;
	b=c9doIr2gtWArg+Ru4h86+Cfbkc7i4YK+CqPk8FGtLAewrTEry9yNefTXXjYDq7bPx1
	4OxKCtI/r7C4eyGyNDK2ZGsL50CpT9do+VqAQ4ZA6AllXIKLq1N50zC4DlN8toY1lexe
	D7VSu8RoVwe2gnHAdXJVMely+0L628eBFwEPofl33onku3QGSXeR+7/xblwo+2JU8Y1G
	XrWk6WKsECqVRlGjhl4gH+SWr6X69lGN8dSN5Hta+9IP/TsfUu3ECDch8pIumvUim0wk
	tswhaogV/fJ/aHCnKzRUWJVLcM3Z7/swzOoW4PznAeevmjwhExFkyRj+gc/9772gS8DH
	1hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K28yGzXLkGmSgH/STqFb3Yxx5koqnCozvsAlWXuvLdE=;
	b=ZZqB5Vcg8m2xaEE4HLipwh6yGf6gwUYsNtpfNxdAQAHhpwSPhHj6Yxter8Q+SVYxEn
	5e/bjNdv/c5R0iPhjJw/RS3+i346xhs/Ao4P4wJxdBcaOI7DxYS1fR2Z9UWXbb2Du0R9
	2QA+h/LK+kWTR+TO8jNYF+xjgEwbv2u7iTUEcgGUOh5q6sLlg7lCJTgOI1D75xP4z1Ay
	d1dci7r0L1qZUBAYxWqi1ek3nN1D+w9useAB+YOP2KP5YaFAu6rrHOBeE0CIjFfFLKR7
	sT0wDEFFyBrHTMoerS4+/5dl0JNPY7W/y5tC72vBKTjj1fXsxdD9cacwdCybz8LMyvPZ
	x19g==
X-Gm-Message-State: ABUngvcVf07ktIZ7MTdUEYMMWtv/Y7zBWYiV0qSaf6yjqrXhEtprVYAXy56/rCjS1fw29g==
X-Received: by 10.28.40.67 with SMTP id o64mr2508365wmo.5.1478023587648;
	Tue, 01 Nov 2016 11:06:27 -0700 (PDT)
Received: from localhost ([217.30.64.102]) by smtp.gmail.com with ESMTPSA id
	k17sm31658742wmd.8.2016.11.01.11.06.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 Nov 2016 11:06:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Nov 2016 19:06:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161101180631.GD2985@jama>
References: <20161028112529.28464-1-kai.iskratsch@zenotrack.com>
	<82cf8d34-0c55-f3ea-ebfa-b184a7c1c478@zenotrack.com>
MIME-Version: 1.0
In-Reply-To: <82cf8d34-0c55-f3ea-ebfa-b184a7c1c478@zenotrack.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-gnome, jethro][PATCH] fix zenity build, and remove blacklist
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
X-List-Received-Date: Tue, 01 Nov 2016 18:06:27 -0000
X-Groupsio-MsgNum: 63681
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline

--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2016 at 04:17:47PM +0200, Kai Iskratsch wrote:
>=20
> Zenity was blacklisted in meta-gnome, but it seems the fixes for the=20
> problem listed in blacklist reason were rather minimal,
>=20
> additionally the newer version of libnotify no longer has the notify_noti=
fication_new_with_status_icon function, so this
> had to be replaced with notify_notification_new to get the build to compl=
ete

Is this already fixed in krogoth, morty and master?

I don't think so, so it needs to be fixed in master first and then it
might be backported into older releases.

> ---
>   .../0002-fix-build-with-newer-libnotify.patch      | 28 +++++++++++++++=
+++++++
>   meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   | 12 ++++++----
>   2 files changed, 35 insertions(+), 5 deletions(-)
>   create mode 100644 meta-gnome/recipes-gnome/zenity/files/0002-fix-build=
-with-newer-libnotify.patch
>=20
> diff --git a/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-ne=
wer-libnotify.patch b/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-=
with-newer-libnotify.patch
> new file mode 100644
> index 0000000..67501c8
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-lib=
notify.patch
> @@ -0,0 +1,28 @@
> +From 87f5f2acbf4f2cad50a0d1ea389d7170fe325b4e Mon Sep 17 00:00:00 2001
> +From: Kai Iskratsch <kai.iskratsch@zenotrack.com>
> +Date: Thu, 27 Oct 2016 13:08:40 +0200
> +Subject: [PATCH] fix build with newer libnotify
> +
> +---
> + src/notification.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/notification.c b/src/notification.c
> +index 99a2e36..3e5b320 100644
> +--- a/src/notification.c
> ++++ b/src/notification.c
> +@@ -184,10 +184,10 @@ zenity_notification_handle_stdin (GIOChannel *chan=
nel,
> +             icon =3D freeme =3D g_filename_to_uri (icon_file, NULL, NUL=
L);
> +           }
> +
> +-          notif =3D notify_notification_new_with_status_icon (
> ++          notif =3D notify_notification_new (
> +                               message[0] /* title */,
> +                               message[1] /* summary */,
> +-                              icon, status_icon);
> ++                              gtk_status_icon_get_icon_name( status_ico=
n));
> +
> +           g_strfreev (message);
> +           g_free (freeme);
> +--
> +2.10.1
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnom=
e/recipes-gnome/zenity/zenity_2.32.1.bb
> index 4e01c5c..bc6c9c4 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
> @@ -4,18 +4,20 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd=
002f49e7bb854063f7e7"
>  =20
>   PR =3D "r2"
>  =20
> -PNBLACKLIST[zenity] ?=3D "BROKEN: doesn't build with B!=3DS"
> -
> -DEPENDS =3D "gtk+ glib-2.0 libnotify gnome-doc-utils"
> +GNOME_COMPRESS_TYPE =3D "bz2"
> +DEPENDS =3D "gtk+ glib-2.0 libnotify gnome-doc-utils intltool-native"
> +RDEPENDS_${PN} +=3D "perl"
>  =20
>   inherit gnomebase
> -SRC_URI +=3D "file://0001-Makefile.am-don-t-build-help.patch"
> +SRC_URI +=3D "file://0001-Makefile.am-don-t-build-help.patch \
> +            file://0002-fix-build-with-newer-libnotify.patch \
> +            "
>   SRC_URI[archive.md5sum] =3D "aa66ec35451b16e424519b4973082170"
>   SRC_URI[archive.sha256sum] =3D "8838be041a07364b62a4281c971392e4a09bb01=
bb3237a836ec0457ec0ea18ac"
>  =20
>   EXTRA_OECONF +=3D "--disable-scrollkeeper"
>   # remove -I/usr/include from zenity_CPPFLAGS
>   do_configure_prepend() {
> -    sed -i -e '/-I$(includedir)/d' src/Makefile.am
> +    sed -i -e '/-I$(includedir)/d' ${S}/src/Makefile.am
>   }
>  =20
> --=20
> 2.10.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgY2acACgkQN1Ujt2V2gByV+wCfTXdFb6xWyxhvvNBRXmzfmGzN
M0oAnimf4sMoDmp+n67T/MpmyOaNXOJe
=b2T1
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
