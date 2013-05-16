Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UcuMi-0008Ky-8z
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 May 2013 11:20:51 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 728354B0085;
	Thu, 16 May 2013 11:02:28 +0200 (CEST)
Date: Thu, 16 May 2013 11:02:26 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Andreas =?UTF-8?B?TcO8bGxlcg==?= <schnitzeltony@googlemail.com>
Message-ID: <20130516110226.0ee11170@e6520eb>
In-Reply-To: <1367575432-5173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367575432-5173-1-git-send-email-schnitzeltony@googlemail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
Subject: Re: [PATCH] chromium: fix build with glib >= 2.35
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
X-List-Received-Date: Thu, 16 May 2013 09:21:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Fri,  3 May 2013 12:03:52 +0200,
Andreas M=C3=BCller <schnitzeltony@googlemail.com> a =C3=A9crit :

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...ser_main_loop.cc-fix-build-with-glib-2.35.patch |   42 ++++++++++++++=
++++++
>  recipes-browser/chromium/chromium_24.0.1312.52.bb  |    3 +-
>  2 files changed, 44 insertions(+), 1 deletions(-)
>  create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/0001-b=
rowser_main_loop.cc-fix-build-with-glib-2.35.patch
>=20
> diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_=
main_loop.cc-fix-build-with-glib-2.35.patch b/recipes-browser/chromium/chro=
mium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
> new file mode 100644
> index 0000000..cdf8051
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_lo=
op.cc-fix-build-with-glib-2.35.patch
> @@ -0,0 +1,42 @@
> +From eb0c0c982322c0e366c1c854475ceda6342dd55a Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Thu, 2 May 2013 15:12:24 +0200
> +Subject: [PATCH] browser_main_loop.cc: fix build with glib > 2.35
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Applied [1]
> +
> +[1] http://code.ohloh.net/file?fid=3DpYuYekcDZUhiAoN5uY-KdIaKFTI&cid=3D0=
W4KUpSYxGo&s=3D&browser=3DDefault#L0
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + content/browser/browser_main_loop.cc |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +diff --git a/content/browser/browser_main_loop.cc b/content/browser/brow=
ser_main_loop.cc
> +index ad4b0c6..86deea3 100644
> +--- a/content/browser/browser_main_loop.cc
> ++++ b/content/browser/browser_main_loop.cc
> +@@ -687,12 +687,17 @@ void BrowserMainLoop::InitializeToolkit() {
> +   // TODO(stevenjb): Move platform specific code into platform specific=
 Parts
> +   // (Need to add InitializeToolkit stage to BrowserParts).
> + #if defined(OS_LINUX) || defined(OS_OPENBSD)
> ++  // g_type_init will be deprecated in 2.36. 2.35 is the development
> ++  // version for 2.36, hence do not call g_type_init starting 2.35.
> ++  // http://developer.gnome.org/gobject/unstable/gobject-Type-Informati=
on.html#g-type-init
> ++#if !GLIB_CHECK_VERSION(2, 35, 0)
> +   // Glib type system initialization. Needed at least for gconf,
> +   // used in net/proxy/proxy_config_service_linux.cc. Most likely
> +   // this is superfluous as gtk_init() ought to do this. It's
> +   // definitely harmless, so retained as a reminder of this
> +   // requirement for gconf.
> +   g_type_init();
> ++#endif
> +=20
> + #if !defined(USE_AURA)
> +   gfx::GtkInitFromCommandLine(parsed_command_line_);
> +--=20
> +1.7.6.5
> +
> diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-=
browser/chromium/chromium_24.0.1312.52.bb
> index 2827cc1..a9a2d28 100644
> --- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
> +++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
> @@ -11,9 +11,10 @@ SRC_URI =3D "http://commondatastorage.googleapis.com/c=
hromium-browser-official/${P
>          file://ui-gl-no-narrowing.patch \
>          file://google-chrome \
>          file://google-chrome.desktop \
> +        file://0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch \
>  "
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  # include.gypi exists only for armv6 and armv7a and there isn't somethin=
g like COMPATIBLE_ARCH afaik
>  COMPATIBLE_MACHINE =3D "(-)"

pushed to master.

Thanks !

Eric


