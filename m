Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 365D27E53E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:12:12 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id n197so4536100iod.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=2qZ7AlEFUUiSrOD5Pi04lIv97vsquDOCtcmzy2HGnos=;
	b=P/X7V4VVA7X996NJwj6fi2lFR92xdnaIZzSr/dHD77JNqYWvkVqrkbsenygZWLmaPu
	9dmXlIggM4BxGlcOsH4LuxX1yye8VE7eEkT0i4KJbSb/HOHhPXQp6LXXQBEPsjgrcdQN
	KJydbigqvhqZKlvoS++gUO8jyix5LIh0i6LTz3vG7edK7R9+s66LA7T3c7ddXRbJVLpH
	uezMA+J3d3of/IWn1i3wjYds8Nin7el81n5IVB4Q/SUq8uISYUJiCtQVn+QZRkA7ho8U
	x8r6b8hh40kGqPmP1cp96mDSbctat55Cgn0Ru/1X1zcSbve5Gs2aqM89tNNdG58Lmv5e
	aGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=2qZ7AlEFUUiSrOD5Pi04lIv97vsquDOCtcmzy2HGnos=;
	b=RtcYaz6H68DMkQv7bTiQLqHZmt4CubCHsnre+jjE6HaSNA0C/gG4ef08xoaMQyt7qj
	AzkTSYgp92HN0xCcxNv9hXOGHLibCRvEjhmGIni0ZzcWQYjHRCiyk4u5rUW/ES0ip4/e
	xDNZqKgZxUWgm5OMoA3dnJK2vFjDfibDU2d7H0dVLYwR+ZBFStdWieh1ZKSCePpVVZon
	w40aDloslttDSw54n0LbNDtxXYPFvU46wwVk8iz/oBxmyxuYaZWGdP9YgT9D6+vft2h0
	sejcR5p3AuYiXm5cjzeno+phlonauXJb6t/PzJxxEv8+40ZLmvsMs9/rAXcehePBgYjp
	8lLw==
X-Gm-Message-State: APjAAAWye+Wa3J0XGjKgiY22WZULcRawIbDMJda7PlKezMyWgwnHulD3
	zZEvPmR5WltKjbQ8UIat1JkN7b65XmJn1Y5W3OywuFTR
X-Google-Smtp-Source: APXvYqw1GzzF8Jh+hmcKO/8+VMWd8K5nfToApcv54LwmJXMipcAbi77h4g4zD/st+cubRx9G2s0DHufCCZbCIKCmdi8=
X-Received: by 2002:a02:a792:: with SMTP id e18mr2634868jaj.125.1569489133802; 
	Thu, 26 Sep 2019 02:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190926071202.9750-1-schnitzeltony@gmail.com>
In-Reply-To: <20190926071202.9750-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 26 Sep 2019 11:12:02 +0200
Message-ID: <CALbNGRTAzotqiMVXeZ9Dhsz4ROc52ps2PH95kampxw0=BRWdDA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Kang Kai <kai.kang@windriver.com>
Subject: Re: [meta-xfce][PATCH 1/2] xfce-panel/systray: Draw icons/background properly when compositing is disabled
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
X-List-Received-Date: Thu, 26 Sep 2019 09:12:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 9:12 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> * this was the last long lasting xfce bug that annoyed me
> * while at it renumber patches
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...=3D> 0002-use-lxdm-to-replace-dm-tool.patch} |  0
>  ...-icons-without-compositing-Bug-14577.patch | 80 +++++++++++++++++++
>  .../xfce4-panel/xfce4-panel_4.14.0.bb         |  3 +-
>  3 files changed, 82 insertions(+), 1 deletion(-)
>  rename meta-xfce/recipes-xfce/xfce4-panel/files/{0001-use-lxdm-to-replac=
e-dm-tool.patch =3D> 0002-use-lxdm-to-replace-dm-tool.patch} (100%)
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0003-systray=
-Fix-icons-without-compositing-Bug-14577.patch
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-re=
place-dm-tool.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxd=
m-to-replace-dm-tool.patch
> similarity index 100%
> rename from meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-rep=
lace-dm-tool.patch
> rename to meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-repla=
ce-dm-tool.patch
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0003-systray-Fix-ic=
ons-without-compositing-Bug-14577.patch b/meta-xfce/recipes-xfce/xfce4-pane=
l/files/0003-systray-Fix-icons-without-compositing-Bug-14577.patch
> new file mode 100644
> index 000000000..12cc3f0dc
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0003-systray-Fix-icons-wit=
hout-compositing-Bug-14577.patch
> @@ -0,0 +1,80 @@
> +From f6f70cce417fd2982c2ce6f01016ed01deb6a9ae Mon Sep 17 00:00:00 2001
> +From: "Ivan A. Melnikov" <iv@altlinux.org>
> +Date: Mon, 23 Sep 2019 16:18:10 +0400
> +Subject: [PATCH] systray: Fix icons without compositing (Bug #14577)
> +
> +Wrapper window uses RGBA visual when it's available;
> +systray manager should try to do the same for
> +the transparent or parent-relative background to work.
> +
> +That means that the manager and icons will work with
> +RGBA visual even if the screen is not compositing; so
> +we should always force-redraw the icons.
> +
> +Refs: https://bugzilla.xfce.org/show_bug.cgi?id=3D14577
> +Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> +
> +Upstream-Status: Accepted [1]
> +
> +[1] https://git.xfce.org/xfce/xfce4-panel/commit?id=3D820de57c44c381e470=
91d3a7e214852bf8fafb53
> +---
> + plugins/systray/systray-manager.c | 10 ++++++----
> + plugins/systray/systray.c         | 10 ----------
> + 2 files changed, 6 insertions(+), 14 deletions(-)
> +
> +diff --git a/plugins/systray/systray-manager.c b/plugins/systray/systray=
-manager.c
> +index 68836554..4915649c 100644
> +--- a/plugins/systray/systray-manager.c
> ++++ b/plugins/systray/systray-manager.c
> +@@ -751,6 +751,7 @@ static void
> + systray_manager_set_visual (SystrayManager *manager)
> + {
> +   GdkDisplay  *display;
> ++  GdkVisual   *visual;
> +   Visual      *xvisual;
> +   Atom         visual_atom;
> +   gulong       data[1];
> +@@ -768,11 +769,12 @@ systray_manager_set_visual (SystrayManager *manage=
r)
> +   visual_atom =3D gdk_x11_get_xatom_by_name_for_display (display,
> +       "_NET_SYSTEM_TRAY_VISUAL");
> +
> +-  if (gdk_screen_is_composited (gtk_widget_get_screen (manager->invisib=
le))
> +-      && (gdk_screen_get_rgba_visual (screen) !=3D NULL))
> ++  visual =3D gdk_screen_get_rgba_visual (screen);
> ++  panel_debug (PANEL_DEBUG_SYSTRAY, "rgba visual is %p", visual);
> ++  if (visual !=3D NULL)
> +     {
> +-      /* get the rgba visual */
> +-      xvisual =3D GDK_VISUAL_XVISUAL (gdk_screen_get_rgba_visual (scree=
n));
> ++      /* use the rgba visual */
> ++      xvisual =3D GDK_VISUAL_XVISUAL (visual);
> +     }
> +   else
> +     {
> +diff --git a/plugins/systray/systray.c b/plugins/systray/systray.c
> +index 3fb9520c..beae1973 100644
> +--- a/plugins/systray/systray.c
> ++++ b/plugins/systray/systray.c
> +@@ -728,19 +728,9 @@ systray_plugin_box_draw (GtkWidget *box,
> +                          gpointer   user_data)
> + {
> +   SystrayPlugin *plugin =3D XFCE_SYSTRAY_PLUGIN (user_data);
> +-  GdkScreen      *screen;
> +-
> +   panel_return_if_fail (XFCE_IS_SYSTRAY_PLUGIN (plugin));
> +   panel_return_if_fail (cr !=3D NULL);
> +
> +-  screen =3D gtk_widget_get_screen (GTK_WIDGET (plugin));
> +-
> +-  if (G_LIKELY (screen !=3D NULL))
> +-    {
> +-      if (!gdk_screen_is_composited (screen))
> +-        return;
> +-    }
> +-
> +   /* separately draw all the composed tray icons after gtk
> +    * handled the draw event */
> +   gtk_container_foreach (GTK_CONTAINER (box),
> +--
> +2.21.0
> +
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb b/m=
eta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
> index 749c3fea4..faec9b2b7 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
> @@ -12,7 +12,8 @@ SRC_URI[md5sum] =3D "940e8b430e28093a2e56e390055bcd51"
>  SRC_URI[sha256sum] =3D "d5f8f3bd7e142139987e5e62cda26135a424baabb5e47aa0=
c23b4169d0a66ef4"
>  SRC_URI +=3D " \
>      file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.pat=
ch \
> -    file://0001-use-lxdm-to-replace-dm-tool.patch \
> +    file://0002-use-lxdm-to-replace-dm-tool.patch \
> +    file://0003-systray-Fix-icons-without-compositing-Bug-14577.patch \
>  "
>
>  python populate_packages_prepend() {
> --
> 2.21.0
>
Few minutes age xfce4-panel 4.14.1 was released containing the patch -
will send V2 tonight.

Andreas

