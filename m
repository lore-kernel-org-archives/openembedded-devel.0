Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Svlhx-00056N-Kv
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 10:52:09 +0200
Received: by ghbz2 with SMTP id z2so4047733ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 01:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ypa567qeiroSngBBcd8YX7qUw8dduj9Ih/J0iOKtcW4=;
	b=LdO7Lam2e9pSbM05rAhP9ngnZciCDPPSWfKNXw0cHgfVdspuydqvbfXXd6jkfPYBcq
	2Kov5lzZJMmzoiVPjHrQfkNlAHATWi/DDtsM9zctrzt13k1sD6vVhSTAkqzMGyZ23T8j
	Mn6n0G9RkYgUDTDReAEQiwyuaUSM5LukFqrgl2TFi62sJz/nJFcxhQk2XkLCs5Da+bdx
	MCG0CkazZS43oIkCB3ILyVmA65JxCXGAbKDTOPKVNq4J98fTCA8lrZP/TXfbSS48/bLT
	AZL0vYt5LWlJfnu8U94FuzAacOcyrXpzAkZyXduVfTOVf8F2MGOIIvDJF3WysCFm9BPe
	n8HQ==
MIME-Version: 1.0
Received: by 10.50.222.170 with SMTP id qn10mr7805612igc.45.1343637633349;
	Mon, 30 Jul 2012 01:40:33 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 30 Jul 2012 01:40:33 -0700 (PDT)
In-Reply-To: <4a5a3a693bc3a78813f11c7858b3e9aa957d1bb9.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<4a5a3a693bc3a78813f11c7858b3e9aa957d1bb9.1343478744.git.Martin.Jansa@gmail.com>
Date: Mon, 30 Jul 2012 10:40:33 +0200
Message-ID: <CALbNGRSidXd3Z_PMV50W4kVuVeUG7NmZ+A_2mjJpm9BNE46+pA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/5] libwnck: use gobject-introspection-stub instead of -native which was removed in oe-core
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
X-List-Received-Date: Mon, 30 Jul 2012 08:52:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 2:33 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb |   10 +++-------
>  meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb |   10 ++--------
>  2 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb b/meta-gn=
ome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
> index e2a3e3d..e54b8d3 100644
> --- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
> +++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
> @@ -5,14 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfd=
d0d91eb439ebec522ec2"
>  BPN =3D "libwnck"
>
>  SECTION =3D "x11/libs"
> -DEPENDS =3D "gobject-introspection-native gtk+3 gdk-pixbuf-native"
> +DEPENDS =3D "gobject-introspection-stub gtk+3 gdk-pixbuf-native"
> +
> +PR =3D "r1"
>
>  inherit gnome
>  SRC_URI[archive.md5sum] =3D "e4ea87320dd0600a81c50186e3804aae"
>  SRC_URI[archive.sha256sum] =3D "4946b612c22d53238810d431f1b05c21f073f201=
edfd247ff74e2fa228618083"
> -
> -EXTRA_OECONF +=3D "--enable-introspection=3Dno"
> -
> -do_configure_prepend() {
> -       sed -i '/GOBJECT_INTROSPECTION_CHECK([0.6.14])/d' configure.ac
> -}
> diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb b/meta-gn=
ome/recipes-gnome/libwnck/libwnck_2.30.5.bb
> index 6c8ca28..935d4a3 100644
> --- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
> +++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
> @@ -2,17 +2,11 @@ DESCRIPTION =3D "Window navigation construction toolkit=
"
>  LICENSE =3D "LGPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  SECTION =3D "x11/libs"
> -DEPENDS =3D "gobject-introspection-native gtk+ gdk-pixbuf-native"
> +DEPENDS =3D "gobject-introspection-stub gtk+ gdk-pixbuf-native"
>
>  inherit gnome
>  SRC_URI[archive.md5sum] =3D "4162d5b96151e6d24ec02ae3a822203c"
>  SRC_URI[archive.sha256sum] =3D "56b6681e89cd45491bb640165d62276d81369a08=
974042b26645dc1e0e954cc1"
> -
> -EXTRA_OECONF +=3D "--enable-introspection=3Dno"
> -
> -do_configure_prepend() {
> -       sed -i '/GOBJECT_INTROSPECTION_CHECK([0.6.14])/d' configure.ac
> -}
> --
> 1.7.8.6
>
Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


