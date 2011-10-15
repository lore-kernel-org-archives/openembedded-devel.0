Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RF5th-0005Hn-Nd
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 17:11:37 +0200
Received: (qmail invoked by alias); 15 Oct 2011 15:05:51 -0000
Received: from p4FDF1DFB.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.29.251]
	by mail.gmx.net (mp047) with SMTP; 15 Oct 2011 17:05:51 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+sm5cKujisTzCIURHt/cTPeE4fzpwq1OYnuLvOqM
	/hG7JRUEnm4rYb
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Oct 2011 17:10:21 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1318690583-15073-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1318690583-15073-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201110151710.21987.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-xfce] xfce4-settings 4.8.2: change default icon theme to 'gnome'
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
X-List-Received-Date: Sat, 15 Oct 2011 15:11:37 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday, October 15, 2011 04:56:23 PM Koen Kooi wrote:
> 'task-xfce4-base' doesn't install the 'Rodent' theme leading to missing i=
cons. With this patch all icons show up.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...settingsd-use-gnome-as-default-icon-theme.patch |   29 ++++++++++++++=
++++++
>  .../xfce4-settings/xfce4-settings_4.8.2.bb         |    6 +++-
>  2 files changed, 34 insertions(+), 1 deletions(-)
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
>=20
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xf=
settingsd-use-gnome-as-default-icon-theme.patch b/meta-xfce/recipes-xfce/xf=
ce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-them=
e.patch
> new file mode 100644
> index 0000000..d428848
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsetting=
sd-use-gnome-as-default-icon-theme.patch
> @@ -0,0 +1,29 @@
> +From 576e7881bdc84390cc51210ee37e5bdd87a170fc Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Sat, 15 Oct 2011 16:43:09 +0200
> +Subject: [PATCH] xfsettingsd: use 'gnome' as default icon theme
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> +
> +Upstream-status: unacceptable (config)
> +
> + xfsettingsd/xsettings.xml |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
> +index 049b4ed..d8c6a85 100644
> +--- a/xfsettingsd/xsettings.xml
> ++++ b/xfsettingsd/xsettings.xml
> +@@ -3,7 +3,7 @@
> + <channel name=3D"xsettings" version=3D"1.0">
> +   <property name=3D"Net" type=3D"empty">
> +     <property name=3D"ThemeName" type=3D"string" value=3D"Xfce"/>
> +-    <property name=3D"IconThemeName" type=3D"string" value=3D"Rodent"/>
> ++    <property name=3D"IconThemeName" type=3D"string" value=3D"gnome"/>
> +   </property>
> +   <property name=3D"Xft" type=3D"empty">
> +     <property name=3D"DPI" type=3D"int" value=3D"-1"/>
> +--=20
> +1.6.6.1
> +
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.b=
b b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
> index 7b31dae..258c238 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
> @@ -4,9 +4,13 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>  DEPENDS =3D "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi vir=
tual/libx11 xrandr libnotify libxcursor libxklavier"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  inherit xfce
> =20
> +SRC_URI +=3D "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.pa=
tch"
> +
>  SRC_URI[md5sum] =3D "a45420fea20f29265ab6785cb1d07377"
>  SRC_URI[sha256sum] =3D "3f79865a6a3817f3c868f2412cbf105e73e54810438f6203=
5699ae5fd72c29d0"
> +
> +RRECOMMENDS_${PN} +=3D "gnome-icon-theme"
>=20
One further step to a system working 'out of the box' and saving me time se=
tting up a new image - thanks!

Acked-by: Andreas M=FCller <schnitzeltony@gmx.de>


