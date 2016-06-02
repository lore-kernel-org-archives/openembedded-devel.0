Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E21C97744E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 16:44:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id e3so17250104wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CHiskU3gl4gI89b4J5F6Dcrnd9TFt1PrmZw8HCC/oOo=;
	b=yXYVxyqRVo8NlnjSH3z9SxNpXYS3e0uUXbl/EkNsxumDtl8UjXpVzEdldspSfhar6n
	CCGsvn+kW3lXK/pPMKqslfEwiMuAZbcdhYJscbPNZ9MRZoYQ/qBVEWa/rO6qp4zihIuW
	+a8HHu+zOFYB7vCCz5FZQX1zybxk5xqqXmmdkN0rrMq5Ny9ZY8ARJULm3axtuhDIiDnc
	xfvumoEHiS0Xk3mV3xfRmiarWXuWxfDq3Lsx4rWGIo77tDqxFJzl2hDq1H6r8E81rYVJ
	9fYOSA6lkRzD2S2LFn3LXAyKZvNeGqWDe7h1/mKop15FV74sXI4S21VaD/55UxLDlT/o
	uP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CHiskU3gl4gI89b4J5F6Dcrnd9TFt1PrmZw8HCC/oOo=;
	b=Lrab4QwAS+GnNGPBynLS6e0GvkVX4qAU9cwFj9iipJunPY22oQ1jUitSPGbuV65AT0
	lvKmUFZQkimAA8C2up6ycsri4SzeT1XhlBThTotB0/If0vmuII+Ll2czTq23DlAJ+MUs
	tiObmthPzzkzbvR+WedqZ/sk4UGQRfmDOYxUuYyl418e6vSTC3gi/Ol6S5ETM7AlNRXZ
	q4nEz0jQtTEZ0I0amu3aPhYFUFxTF2tj1f0Q76Y42O36aG+zFBEt7x5PtCxNpphttX+W
	FEeDKLftimyoEe5y1h0r5iDFAX4/InhiNtvoKdbTwFlz5GKrGi/Y8hLpTkyFFMyUEOa9
	kAOw==
X-Gm-Message-State: ALyK8tKw49L0LgOpZKJsUbij1NSQ79FbHl7EleUea1vrUvu4c4TGA7aS24ZCGmrwhLqXPQ==
X-Received: by 10.194.176.167 with SMTP id cj7mr10939979wjc.36.1464885867962; 
	Thu, 02 Jun 2016 09:44:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m8sm1395770wjd.34.2016.06.02.09.44.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Jun 2016 09:44:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Jun 2016 18:44:53 +0200
To: openembedded-devel@lists.openembedded.org,
	Stefan Agner <stefan.agner@toradex.com>
Message-ID: <20160602164453.GB2571@jama>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
	<2e56393d31a7bc3596af56ffb0803409d2127aa1.1464090710.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <2e56393d31a7bc3596af56ffb0803409d2127aa1.1464090710.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH 2/8] florence: update to 0.6.3
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
X-List-Received-Date: Thu, 02 Jun 2016 16:44:28 -0000
X-Groupsio-MsgNum: 61691
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 02:56:55PM +0300, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../florence/files/0001-Fix-glib-includes.patch    | 33 ----------------=
------
>  .../{florence_0.5.1.bb =3D> florence_0.6.3.bb}       | 10 +++----
>  2 files changed, 5 insertions(+), 38 deletions(-)
>  delete mode 100644 meta-gnome/recipes-support/florence/files/0001-Fix-gl=
ib-includes.patch
>  rename meta-gnome/recipes-support/florence/{florence_0.5.1.bb =3D> flore=
nce_0.6.3.bb} (71%)
>=20
> diff --git a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-incl=
udes.patch b/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includ=
es.patch
> deleted file mode 100644
> index 83e598e..0000000
> --- a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.pa=
tch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From c8419ef05ff92ffa3de2e626eb6acd5d2df3baa1 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Tue, 15 May 2012 13:40:05 +0200
> -Subject: [PATCH] Fix glib includes
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -Upstream-Status: unknown
> -
> -Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ----
> - src/trace.c |    5 +----
> - 1 files changed, 1 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/trace.c b/src/trace.c
> -index 5ea5c13..774c56d 100644
> ---- a/src/trace.c
> -+++ b/src/trace.c
> -@@ -21,10 +21,7 @@
> -=20
> - #include "trace.h"
> - #include "system.h"
> --#include <glib/gprintf.h>
> --#include <glib/gutils.h>
> --#include <glib/gslist.h>
> --#include <glib/gstrfuncs.h>
> -+#include <glib.h>
> - #include <stdio.h>
> - #include <stdarg.h>
> -=20
> ---=20
> -1.7.6.5
> -
> diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb b/meta=
-gnome/recipes-support/florence/florence_0.6.3.bb
> similarity index 71%
> rename from meta-gnome/recipes-support/florence/florence_0.5.1.bb
> rename to meta-gnome/recipes-support/florence/florence_0.6.3.bb
> index 71014f0..a8600a4 100644
> --- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> +++ b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
> @@ -8,13 +8,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552"
> =20
>  PR =3D "r1"
> =20
> -DEPENDS =3D "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-=
native gnome-doc-utils libnotify"
> +DEPENDS =3D "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-=
native gnome-doc-utils libnotify gstreamer1.0"

Does it depend on gtk3 or this commit message wasn't correct?


commit 5adc7db356071e22219d652e11911b98d9f8bf6e
Author: Stefan Agner <stefan.agner@toradex.com>
Date:   Tue May 24 13:43:11 2016 -0700

    florence: move to latest GTK2 version 0.5.4

It also doesn't apply because of this, so please confirm and resend.

>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-${PV=
}.tar.bz2 \
> -           file://0001-Fix-glib-includes.patch"
> -SRC_URI[md5sum] =3D "56d12e5b47c100d9df172aa5ddc0f609"
> -SRC_URI[sha256sum] =3D "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8=
719a68b192d5bc62"
> +          "
> +SRC_URI[md5sum] =3D "8775051d7352f75dec5a86dc9964e8e0"
> +SRC_URI[sha256sum] =3D "422992fd07d285be73cce721a203e22cee21320d69b0fda1=
579ce62944c5091e"
> =20
> -inherit gettext autotools gconf pkgconfig
> +inherit gettext autotools gconf pkgconfig gsettings
> =20
>  EXTRA_OECONF =3D "--disable-scrollkeeper --without-docs --without-at-spi=
 --without-panelapplet"
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldQYoMACgkQN1Ujt2V2gBxoeACeJsN8hAF5qpm0th3q/mIdtO7B
2pQAni/FMD+ua/Ta0Qs7Vwmsv8dYC6Jp
=bRMN
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
