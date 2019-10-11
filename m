Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62A997F512
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 08:16:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9B8Ef3d008835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Oct 2019 01:16:37 -0700 (PDT)
Received: from [128.224.158.229] (128.224.158.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 11 Oct 2019 01:16:10 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191011080629.3136-1-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <4762ca00-0033-b6fc-55ce-96342528e84a@windriver.com>
Date: Fri, 11 Oct 2019 16:16:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011080629.3136-1-schnitzeltony@gmail.com>
Subject: Re: [warrior][PATCH 1/3] xfce4-panel: Draw icons/background properly when compositing is disabled
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
X-List-Received-Date: Fri, 11 Oct 2019 08:16:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/10/11 下午4:06, Andreas Müller wrote:
> A similar patch was sent for master [1] but that was superseded by upgrade of
> xfce4-panel 4.14.0 -> 4.14.1 [2]
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-September/201966.html
> [2] http://lists.openembedded.org/pipermail/openembedded-devel/2019-September/201986.html

This patch is fine with me.

Acked-by: Kai Kang <kai.kang@windriver.com>


Regards,
Kai


>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...-icons-without-compositing-Bug-14577.patch | 80 +++++++++++++++++++
>   .../xfce4-panel/xfce4-panel_4.13.4.bb         |  1 +
>   2 files changed, 81 insertions(+)
>   create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch
> new file mode 100644
> index 000000000..8fac5ad81
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch
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
> +Upstream-Status: Accepted [1]
> +
> +[1] https://git.xfce.org/xfce/xfce4-panel/commit?id=f6f70cce417fd2982c2ce6f01016ed01deb6a9ae
> +
> +Refs: https://bugzilla.xfce.org/show_bug.cgi?id=14577
> +Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> +---
> + plugins/systray/systray-manager.c | 10 ++++++----
> + plugins/systray/systray.c         | 10 ----------
> + 2 files changed, 6 insertions(+), 14 deletions(-)
> +
> +diff --git a/plugins/systray/systray-manager.c b/plugins/systray/systray-manager.c
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
> +@@ -768,11 +769,12 @@ systray_manager_set_visual (SystrayManager *manager)
> +   visual_atom = gdk_x11_get_xatom_by_name_for_display (display,
> +       "_NET_SYSTEM_TRAY_VISUAL");
> +
> +-  if (gdk_screen_is_composited (gtk_widget_get_screen (manager->invisible))
> +-      && (gdk_screen_get_rgba_visual (screen) != NULL))
> ++  visual = gdk_screen_get_rgba_visual (screen);
> ++  panel_debug (PANEL_DEBUG_SYSTRAY, "rgba visual is %p", visual);
> ++  if (visual != NULL)
> +     {
> +-      /* get the rgba visual */
> +-      xvisual = GDK_VISUAL_XVISUAL (gdk_screen_get_rgba_visual (screen));
> ++      /* use the rgba visual */
> ++      xvisual = GDK_VISUAL_XVISUAL (visual);
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
> +   SystrayPlugin *plugin = XFCE_SYSTRAY_PLUGIN (user_data);
> +-  GdkScreen      *screen;
> +-
> +   panel_return_if_fail (XFCE_IS_SYSTRAY_PLUGIN (plugin));
> +   panel_return_if_fail (cr != NULL);
> +
> +-  screen = gtk_widget_get_screen (GTK_WIDGET (plugin));
> +-
> +-  if (G_LIKELY (screen != NULL))
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
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
> index 18e054c9d..ecae873c3 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
> @@ -12,6 +12,7 @@ SRC_URI[md5sum] = "c0f132fed2110d37f351aadc9e80a034"
>   SRC_URI[sha256sum] = "36ffd26ef7f5867c01ba310475b4358ff0e588cfd5599a266f0037a6c20052a1"
>   SRC_URI += " \
>       file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
> +    file://0002-systray-Fix-icons-without-compositing-Bug-14577.patch \
>   "
>   
>   python populate_packages_prepend() {


-- 
Kai Kang


