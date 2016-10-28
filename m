Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 195AE71999
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 17:59:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i85so1839043pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=fdi26o/Pboew23C8RfDacVuBOkbqu7haltrFMu8GdDQ=;
	b=0x+OC8rSOGNvxgmzdv6b2Y+A8KQhNcG9LhYs8Mq78TeSrkg03fwQAnrAqELT0NVuvI
	77iiElc2EVq569wnssWuO/VZ6zWuWA2mctQRYdnWGw3sCYR220bb38sBMjWy8s+5t7Xf
	HJoXRN/MKfj7YPntotHPKNBW8BiO2dZsoxvhhOUOKGncEPmOc6iN/OWyzVRrYiUGciX7
	tc65VDi3ru8uYRfmvOf+YeO3IBX8PiHePrsSgqBh2Tslgyd0RrjKSK37DoDOqAbRDrpm
	OfGa72zxgho/fZp51vrwLiChIim+TOTLwfu4YKCIFJJI+5+UeA/h9BCw781/3bWdGXpw
	AR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=fdi26o/Pboew23C8RfDacVuBOkbqu7haltrFMu8GdDQ=;
	b=XsTGUs53IU+mo7p8Y+OG2MbJWMNQ6EqiHWqb/VJq6Ids0xgLVXuOx/7hzaS/JLW3F4
	QMEpxtljkldco56XN6f8lALNpEmGEg3RDi6rkvtgWki0ucTBvZ370+ZHdd3ZndARUU7q
	WoMabPfXDeHWXN1aHxB2qIygprkpAfjZSuEreC5q5bEKloyOrsfyfeNxR7pIP1OrlPaM
	BxGa23ESumC/Awx7ZV0dJcBFFc7awGCCwPrthYpgaG831ISRcrUWlQvTfpIQVxvT5b+V
	zYDPTW1fN8VfAsF6aXZVUeBnT2fcTP28VvefcmdNY2LEo7GTQvdz5NhLal5HcizoeUoD
	aBWw==
X-Gm-Message-State: ABUngvd+OOE6pMpwn8bhAUh51l5kg26BiRE32bJUt4ldWLZd9zhdyBsWspPDnOnCkwzPhg==
X-Received: by 10.99.50.71 with SMTP id y68mr22456314pgy.111.1477677569399;
	Fri, 28 Oct 2016 10:59:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:3551:a82d:200e:cc39?
	([2601:646:8882:b8c:3551:a82d:200e:cc39])
	by smtp.gmail.com with ESMTPSA id s3sm8118111pfe.27.2016.10.28.10.59.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 10:59:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <82cf8d34-0c55-f3ea-ebfa-b184a7c1c478@zenotrack.com>
Date: Fri, 28 Oct 2016 10:59:27 -0700
Message-Id: <762566DF-86AB-4090-921A-0FAF8CF42675@gmail.com>
References: <20161028112529.28464-1-kai.iskratsch@zenotrack.com>
	<82cf8d34-0c55-f3ea-ebfa-b184a7c1c478@zenotrack.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Fri, 28 Oct 2016 17:59:31 -0000
X-Groupsio-MsgNum: 63638
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D6CC8EAC-445B-442F-9DC9-AD37CEB4DBEC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D6CC8EAC-445B-442F-9DC9-AD37CEB4DBEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 28, 2016, at 7:17 AM, Kai Iskratsch =
<kai.iskratsch@zenotrack.com> wrote:
>=20
>=20
> Zenity was blacklisted in meta-gnome, but it seems the fixes for the =
problem listed in blacklist reason were rather minimal,
>=20
> additionally the newer version of libnotify no longer has the =
notify_notification_new_with_status_icon function, so this
> had to be replaced with notify_notification_new to get the build to =
complete

this looks fine

> ---
> .../0002-fix-build-with-newer-libnotify.patch      | 28 =
++++++++++++++++++++++
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   | 12 ++++++----
> 2 files changed, 35 insertions(+), 5 deletions(-)
> create mode 100644 =
meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotify.=
patch
>=20
> diff --git =
a/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotif=
y.patch =
b/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotif=
y.patch
> new file mode 100644
> index 0000000..67501c8
> --- /dev/null
> +++ =
b/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotif=
y.patch
> @@ -0,0 +1,28 @@
> +=46rom 87f5f2acbf4f2cad50a0d1ea389d7170fe325b4e Mon Sep 17 00:00:00 =
2001
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
> +@@ -184,10 +184,10 @@ zenity_notification_handle_stdin (GIOChannel =
*channel,
> +             icon =3D freeme =3D g_filename_to_uri (icon_file, NULL, =
NULL);
> +           }
> +
> +-          notif =3D notify_notification_new_with_status_icon (
> ++          notif =3D notify_notification_new (
> +                               message[0] /* title */,
> +                               message[1] /* summary */,
> +-                              icon, status_icon);
> ++                              gtk_status_icon_get_icon_name( =
status_icon));
> +
> +           g_strfreev (message);
> +           g_free (freeme);
> +--
> +2.10.1
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb =
b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
> index 4e01c5c..bc6c9c4 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
> @@ -4,18 +4,20 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e7"
>  PR =3D "r2"
> -PNBLACKLIST[zenity] ?=3D "BROKEN: doesn't build with B!=3DS"
> -
> -DEPENDS =3D "gtk+ glib-2.0 libnotify gnome-doc-utils"
> +GNOME_COMPRESS_TYPE =3D "bz2"
> +DEPENDS =3D "gtk+ glib-2.0 libnotify gnome-doc-utils intltool-native"
> +RDEPENDS_${PN} +=3D "perl"
>  inherit gnomebase
> -SRC_URI +=3D "file://0001-Makefile.am-don-t-build-help.patch"
> +SRC_URI +=3D "file://0001-Makefile.am-don-t-build-help.patch \
> +            file://0002-fix-build-with-newer-libnotify.patch \
> +            "
> SRC_URI[archive.md5sum] =3D "aa66ec35451b16e424519b4973082170"
> SRC_URI[archive.sha256sum] =3D =
"8838be041a07364b62a4281c971392e4a09bb01bb3237a836ec0457ec0ea18ac"
>  EXTRA_OECONF +=3D "--disable-scrollkeeper"
> # remove -I/usr/include from zenity_CPPFLAGS
> do_configure_prepend() {
> -    sed -i -e '/-I$(includedir)/d' src/Makefile.am
> +    sed -i -e '/-I$(includedir)/d' ${S}/src/Makefile.am
> }
> --
> 2.10.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_D6CC8EAC-445B-442F-9DC9-AD37CEB4DBEC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgTkgAACgkQuwUzVZGdMxT0EwCfZjGCx/3n5+C/9c9R3YO6b0lU
te4AoJAC9M2m7enYttQmFk33qhqiHlEF
=mwGe
-----END PGP SIGNATURE-----

--Apple-Mail=_D6CC8EAC-445B-442F-9DC9-AD37CEB4DBEC--
