Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E7A747D1AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 16:44:09 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id p20so23835344qtc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5KbgPNunxKhZ/rRuyO9lhaxbVt39Ieca/mxa0L4nKKI=;
	b=HyBmk7d63JigMuX6PXfqDW9UxG3zJa2xACWIjEOcFxX9Roo6ISEgxZARHwF1XCY2hj
	etx4F+rHYhlMRTLhlMANErRL6Zekz4ftO+Avng/4jSyojXyCgf6/nR4Po3OhXqpkoOJM
	cgQuS9zPMSjh4zNJ2W7fWPt7/hABNY72lSo7Vxu0LfNg1tN1P6tWJLYakPJESPpP47ZB
	zIj/tRki3igSCVl8Tm3VZFr2j6sshCkIE5C1ObNeIDmfw3bhCkCokUNIyKXEOlZNecrc
	9ZvftStoLZqBRsASCAySEnkCxd/o/0yz6zytCTdTA0yEE+X9ftQhTcw8TmVQ579OCsTX
	HqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5KbgPNunxKhZ/rRuyO9lhaxbVt39Ieca/mxa0L4nKKI=;
	b=VZiYgU1AIZYRoMzHxcf5XXr7JCzWLCLSCZ+iuhTCHeeJDImUUnZn81Ak2j0DC+f55T
	THgSZzbSeHvVIX9w9FxxzEpOrzolx1WdtazhhE0dmn0qDzKrO2Yz7Yh4ASCEQfEXcFxb
	cpr11k64rMqMYq7A1bGn1d8D/Rvq3jrxpgdF4nRkrKhaAJLssMPMhhd6wCyUdbkzJk3K
	eLfp/QDL68Turo/cLBjLKhpwhf1GUO1cMr/PwUVxD2/v9xq9+9oSXviQPQBIS70iSx/u
	k0zPHK0LbwbYVoGBDVFyqYCXRJ/NyaIsQt0jSJWA+dGE4yAbqMrIekNB/KC/LF+0yKA6
	LHZg==
X-Gm-Message-State: APjAAAULfzTTT6GWrANSUF9R/tCsvXIp3HPG4gTGoJO1T0U39obbAAIx
	xnwH+xyc875/FP/sb9HCE2uhCgrKRgiE5L+R19g=
X-Google-Smtp-Source: APXvYqxzQ1ZKAjFonhhYbU4oEosMgi5p8Tg2eI1mPnt2sZOptTcKGG51xfU+3yVRi3/IHZ1SJtejl5llMrrfMj0CU0Y=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr35565821qte.196.1553791450412; 
	Thu, 28 Mar 2019 09:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
	<20190327153509.23928-13-schnitzeltony@gmail.com>
In-Reply-To: <20190327153509.23928-13-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2019 09:43:44 -0700
Message-ID: <CAMKF1sqfj0KOjgL9AT-Jo8EfaKkrON78tB7MZi8A7WshyVtoDA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/15] gnome-system-monitor: upgrade 3.26.0 -> 3.32.0
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
X-List-Received-Date: Thu, 28 Mar 2019 16:44:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2019 at 8:37 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Be aware that it needs 'polkit' in DISTRO_FEATURES
>

Fails on systemd-less based distros
https://errors.yoctoproject.org/Errors/Details/234765/


> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...-build-help-we-do-not-have-yelp-yet.patch} | 32 ++++++++++---------
>  ...26.0.bb =3D> gnome-system-monitor_3.32.0.bb} | 24 +++++++-------
>  2 files changed, 28 insertions(+), 28 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-system-monitor/{files/0001-help-re=
move-YELP-macro.patch =3D> gnome-system-monitor/0001-Do-not-build-help-we-d=
o-not-have-yelp-yet.patch} (38%)
>  rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monit=
or_3.26.0.bb =3D> gnome-system-monitor_3.32.0.bb} (43%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-hel=
p-remove-YELP-macro.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/g=
nome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
> similarity index 38%
> rename from meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help=
-remove-YELP-macro.patch
> rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-moni=
tor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
> index 57b60a0d5..f2e720e9e 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remov=
e-YELP-macro.patch
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/=
0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
> @@ -1,7 +1,7 @@
> -From 4a3ee8b46d25b3d310448bfa4446e15a686fc685 Mon Sep 17 00:00:00 2001
> +From c6649fdcfb2f44807089741557f8e527ab9751e4 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Fri, 23 Mar 2018 13:50:18 +0100
> -Subject: [PATCH] help: remove YELP macro
> +Date: Sun, 24 Mar 2019 02:46:07 +0100
> +Subject: [PATCH] Do not build help - we do not have yelp yet
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -10,19 +10,21 @@ Upstream-Status: Inappropriate [embedded-specific]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>  ---
> - help/Makefile.am | 2 --
> - 1 file changed, 2 deletions(-)
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
>
> -diff --git a/help/Makefile.am b/help/Makefile.am
> -index c5cd0d3..4b83adf 100644
> ---- a/help/Makefile.am
> -+++ b/help/Makefile.am
> -@@ -1,5 +1,3 @@
> --@YELP_HELP_RULES@
> --
> - HELP_ID =3D gnome-system-monitor
> +diff --git a/meson.build b/meson.build
> +index d60ced7..6a0ab4b 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -183,7 +183,6 @@ subdir('data')
> + subdir('po')
> + subdir('scripts')
> + subdir('src')
> +-subdir('help')
>
> - HELP_FILES =3D \
> +
> + message('\n'.join(['',
>  --
> -2.14.3
> +2.20.1
>
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_3.26.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_3.32.0.bb
> similarity index 43%
> rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-mo=
nitor_3.26.0.bb
> rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-moni=
tor_3.32.0.bb
> index 9b6ce17ca..d0297d438 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
3.26.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
3.32.0.bb
> @@ -3,32 +3,30 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
>  DEPENDS =3D " \
> -    intltool-native \
> +    itstool-native \
>      gnome-common-native \
> +    libxml2-native \
>      glib-2.0-native \
>      gtkmm3 \
>      libgtop \
>      librsvg \
>      libwnck3 \
> +    polkit \
>  "
>
> -inherit gnomebase distro_features_check
> +GNOMEBASEBUILDCLASS =3D "meson"
>
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +inherit gnomebase gtk-icon-cache distro_features_check gettext
>
> -SRC_URI[archive.md5sum] =3D "fcd59867c07f8c4853b1e28d60cbc037"
> -SRC_URI[archive.sha256sum] =3D "f848a8c2ca5e164cf09d3a205dd49e4e4bf4b60d=
43b0969c10443eb519d0e6b3"
> -SRC_URI +=3D "file://0001-help-remove-YELP-macro.patch"
> +REQUIRED_DISTRO_FEATURES =3D "x11 polkit"
> +
> +SRC_URI[archive.md5sum] =3D "6c2c5c5bf8f15d3e6985faacbd3055dd"
> +SRC_URI[archive.sha256sum] =3D "af00c4a42dd1db17d9abe88edb11c7751b20982d=
b1a8a2a467bab206fd8a77e3"
> +SRC_URI +=3D "file://0001-Do-not-build-help-we-do-not-have-yelp-yet.patc=
h"
>
>  RRECOMMENDS_${PN} =3D "adwaita-icon-theme"
>
>  FILES_${PN} +=3D " \
> -    ${datadir}/icons \
>      ${datadir}/dbus-1 \
> -    ${datadir}/gnome/autostart \
> -"
> -
> -FILES_${PN}-doc +=3D " \
> -    ${datadir}/omf \
> -    ${datadir}/gnome/help \
> +    ${datadir}/metainfo \
>  "
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

