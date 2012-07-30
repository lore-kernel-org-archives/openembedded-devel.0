Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Svlih-0005GZ-9t
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 10:52:55 +0200
Received: by ghbz2 with SMTP id z2so4048110ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 01:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=r2FZ1iGzh+hEHCkYPL/xmLY6W8cgd4cyJnCwLUi0D5E=;
	b=LJtZrx1FVGvhFN/SwkjCEdsodRcL7J2ieE4WG1g7AoTZ6EbwkJf9hPDwFTBN/4NCfD
	0C6lSuSAUFCgyzodYRJZxIyRu4mXD3SujY4VnXppUU/X6AGyWuXBOUbNsmnvi7UqvuSS
	yNlVTF0uz4oH85QAWT6/X5zgMpfXnN/Fy3JUPhu7RbPtntutFmUGo272up/bFmbCGg6F
	Kp8DjTu8dtc2q9c1CZW2j+x9JS9UwDar36WalBwzE3qomNltEsRY4MIC4eZBcPSKTBAz
	ueY2+4EibzGbEKaDiy/W9w7f/EsmfAZH6IlM5rexEN+6utDqcKUH7TsglqsHwr64E2PY
	ZjOw==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr7814891igc.5.1343637679395; Mon,
	30 Jul 2012 01:41:19 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 30 Jul 2012 01:41:19 -0700 (PDT)
In-Reply-To: <256f95eec467bf6e24853d8b2c770d4e16622085.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<256f95eec467bf6e24853d8b2c770d4e16622085.1343478744.git.Martin.Jansa@gmail.com>
Date: Mon, 30 Jul 2012 10:41:19 +0200
Message-ID: <CALbNGRSC9k1OsiuvGOG9460br+Ms4xqsDuXEypPUcLHV3Ra0GA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 5/5] upower: use gobject-introspection-stub instead of -native which was removed in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 08:52:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 2:33 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/upower/upower_0.9.14.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/re=
cipes-support/upower/upower_0.9.14.bb
> index 312ed58..5a33ab9 100644
> --- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
> +++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "UPower is an abstraction for enumerating=
 power devices, listening
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de8fbf1d97a140d1d93b9f14dcfb=
f08"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> -DEPENDS =3D "libusb1 udev glib-2.0 dbus-glib polkit gobject-introspectio=
n-native"
> +DEPENDS =3D "libusb1 udev glib-2.0 dbus-glib polkit gobject-introspectio=
n-stub"
>
>  SRC_URI =3D "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
>  SRC_URI[md5sum] =3D "18803f82102d56aac90949d1e4251645"
> --
> 1.7.8.6
>
Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


