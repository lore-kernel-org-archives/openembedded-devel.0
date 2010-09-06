Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVqm-000160-7W for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 09:10:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVq8-0001Hg-Rt for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 09:10:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 09:10:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 09:10:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Sep 2010 08:48:06 +0200
Message-ID: <i622r6$jp9$5@dough.gmane.org>
References: <201009030248.37612.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <201009030248.37612.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/5] moblin: update recipes to match latest clutter
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
X-List-Received-Date: Mon, 06 Sep 2010 07:10:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-09-10 02:48, Andreas Mueller wrote:
> 
> * nbtk: bump required to configure properly with clutter
> * clutter-imcontext: now required by nbtk
> * hornsey_git: bump required to configure properly with clutter
> * libccss_git: bump required to match new nbtk requirements
>   bumping by SRCREV_pn-libccss = .. is a hack to get throgh the door
>   and needs clean solution later.
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
>  recipes/moblin/bickley_git.bb                      |    4 +-
>  recipes/moblin/clutter-imcontext_git.bb            |   19 ++++
>  recipes/moblin/hornsey_git.bb                      |    4 +-
>  recipes/moblin/libccss_git.bb                      |    5 +-
>  .../moblin/nbtk/03_fix_FTBFS_port_to_gtk2.20.patch |  111 ++++++++++++++++++++
>  recipes/moblin/nbtk_git.bb                         |   15 ++-
>  6 files changed, 148 insertions(+), 10 deletions(-)
>  create mode 100644 recipes/moblin/clutter-imcontext_git.bb
>  create mode 100644 recipes/moblin/nbtk/03_fix_FTBFS_port_to_gtk2.20.patch
> 
> diff --git a/recipes/moblin/bickley_git.bb b/recipes/moblin/bickley_git.bb
> index fc7abc8..c4c1f7c 100644
> --- a/recipes/moblin/bickley_git.bb
> +++ b/recipes/moblin/bickley_git.bb
> @@ -2,9 +2,9 @@ DESCRIPTION = "A meta data manager API and framework (including Media)"
>  SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git"
>  PV = "0.0"
>  PR_append = "+git${SRCREV}"
> -PR = "r4"
> +PR = "r5"
>  
> -DEPENDS = "redland gtk+ dbus-glib clutter-gst-0.9 libexif taglib gupnp gupnp-av samba"
> +DEPENDS = "redland gtk+ dbus-glib clutter-gst libexif taglib gupnp gupnp-av samba"
>  RDEPENDS_${PN} = "xdg-user-dirs"
>  
>  S = "${WORKDIR}/git"
> diff --git a/recipes/moblin/clutter-imcontext_git.bb b/recipes/moblin/clutter-imcontext_git.bb
> new file mode 100644
> index 0000000..0d35fc3
> --- /dev/null
> +++ b/recipes/moblin/clutter-imcontext_git.bb
> @@ -0,0 +1,19 @@
> +LICENSE = "LGPLv2.1"
> +
> +SRCREV = "2cb6f0ff153db639a489e58e36802e0e928b1968"
> +PV = "0.1.4"
> +PR = "r0"
> +PR_append = "+git${SRCREV}"
> +
> +DEPENDS = "glib-2.0 gtk+ libccss clutter"
> +
> +SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git"
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure_prepend () {
> +    echo "EXTRA_DIST=" > ${S}/gtk-doc.make
> +    echo "CLEANFILES=" >> ${S}/gtk-doc.make
> +}
> +
> diff --git a/recipes/moblin/hornsey_git.bb b/recipes/moblin/hornsey_git.bb
> index c5c62d4..e2cf840 100644
> --- a/recipes/moblin/hornsey_git.bb
> +++ b/recipes/moblin/hornsey_git.bb
> @@ -3,10 +3,10 @@ LICENSE = "LGPLv2.1"
>  
>  SRCREV = "125a1dea08d552ed2510ee762e1b54ca161915c1"
>  PV = "0.0"
> -PR = "r1"
> +PR = "r2"
>  PR_append = "+git${SRCREV}"
>  
> -DEPENDS = "clutter-0.9 clutter-gst-0.9 bickley nbtk bognor-regis libunique startup-notification gtk+"
> +DEPENDS = "clutter clutter-gst bickley nbtk bognor-regis libunique startup-notification gtk+"
>  
>  SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git \
>             file://fix-api.patch \
> diff --git a/recipes/moblin/libccss_git.bb b/recipes/moblin/libccss_git.bb
> index 049bf6e..b3e7ff5 100644
> --- a/recipes/moblin/libccss_git.bb
> +++ b/recipes/moblin/libccss_git.bb
> @@ -1,7 +1,10 @@
>  SRC_URI = "git://anongit.freedesktop.org/git/ccss.git;protocol=git"
> -PV = "0.0+git${SRCREV}"
> +PV = "0.3.1+git${SRCREV}"
>  PR = "r0"
>  
> +# nbtk needs libccss-0.3.1
> +SRCREV_pn-libccss = "cd63b0960ca782987d226811d1473e5745d2591d"
> +
>  DEPENDS = "glib-2.0 cairo librsvg libsoup-2.4"
>  
>  S = "${WORKDIR}/git"
> diff --git a/recipes/moblin/nbtk/03_fix_FTBFS_port_to_gtk2.20.patch b/recipes/moblin/nbtk/03_fix_FTBFS_port_to_gtk2.20.patch
> new file mode 100644
> index 0000000..2df0f77
> --- /dev/null
> +++ b/recipes/moblin/nbtk/03_fix_FTBFS_port_to_gtk2.20.patch
> @@ -0,0 +1,111 @@
> +Index: nbtk-1.2.3/nbtk/nbtk-gtk-expander.c
> +===================================================================
> +--- nbtk-1.2.3.orig/nbtk/nbtk-gtk-expander.c	2010-04-17 14:16:07.866564625 +0800
> ++++ nbtk-1.2.3/nbtk/nbtk-gtk-expander.c	2010-04-17 14:18:25.454564286 +0800
> +@@ -62,7 +62,7 @@
> + nbtk_gtk_expander_expose_event (GtkWidget      *widget,
> +                                 GdkEventExpose *event)
> + {
> +-  if (GTK_WIDGET_DRAWABLE (widget))
> ++  if (gtk_widget_is_drawable (widget))
> +     {
> +       NbtkGtkExpanderPrivate *priv = NBTK_GTK_EXPANDER (widget)->priv;
> +       GtkContainer *container = GTK_CONTAINER (widget);
> +@@ -180,7 +180,7 @@
> +   child = gtk_bin_get_child ((GtkBin*) widget);
> +   label = ((NbtkGtkExpander *) widget)->priv->label;
> + 
> +-  if (label && GTK_WIDGET_VISIBLE (label))
> ++  if (label && gtk_widget_is_drawable (label))
> +     {
> +       gtk_widget_size_request (label, &label_req);
> + 
> +@@ -202,7 +202,7 @@
> +   else
> +     label_h = priv->indicator_size;
> + 
> +-  if (priv->is_open && child && GTK_WIDGET_VISIBLE (child))
> ++  if (priv->is_open && child && gtk_widget_get_visible (child))
> +     {
> +       gtk_widget_size_request (child, &child_req);
> + 
> +@@ -239,7 +239,7 @@
> +   requisition->width = widget->style->xthickness * 2;
> +   requisition->height = widget->style->ythickness * 2;
> + 
> +-  if (label && GTK_WIDGET_VISIBLE (label))
> ++  if (label && gtk_widget_get_visible (label))
> +     {
> +       gtk_widget_size_request (label, &req);
> + 
> +@@ -251,7 +251,7 @@
> +                              priv->indicator_size +
> +                              widget->style->ythickness * 2);
> + 
> +-  if (priv->is_open && child && GTK_WIDGET_VISIBLE (child))
> ++  if (priv->is_open && child && gtk_widget_get_visible (child))
> +     {
> +       gtk_widget_size_request (child, &req);
> + 
> +Index: nbtk-1.2.3/nbtk/nbtk-gtk-frame.c
> +===================================================================
> +--- nbtk-1.2.3.orig/nbtk/nbtk-gtk-frame.c	2010-04-17 14:16:07.866564625 +0800
> ++++ nbtk-1.2.3/nbtk/nbtk-gtk-frame.c	2010-04-17 14:18:25.454564286 +0800
> +@@ -147,7 +147,7 @@
> +   cairo_clip (cairo);
> + 
> +   /* initialise the background */
> +-  gdk_cairo_set_source_color (cairo, &style->bg[GTK_WIDGET_STATE (widget)]);
> ++  gdk_cairo_set_source_color (cairo, &style->bg[gtk_widget_get_state(widget)]);
> +   cairo_rectangle (cairo, widget->allocation.x, widget->allocation.y,
> +                    widget->allocation.width, widget->allocation.height);
> +   cairo_fill (cairo);
> +@@ -177,7 +177,7 @@
> + {
> +   GtkWidgetClass *grand_parent;
> + 
> +-  if (GTK_WIDGET_DRAWABLE (widget))
> ++  if (gtk_widget_is_drawable (widget))
> +     {
> +       nbtk_gtk_frame_paint (widget, &event->area);
> + 
> +@@ -252,7 +252,7 @@
> +   child_allocation.width = allocation->width - 2 * xmargin;
> +   child_allocation.height = allocation->height - 2 * ymargin - title_allocation.height;
> + 
> +-  if (GTK_WIDGET_MAPPED (widget) &&
> ++  if (gtk_widget_get_mapped (widget) &&
> +       (child_allocation.x != frame->child_allocation.x ||
> +        child_allocation.y != frame->child_allocation.y ||
> +        child_allocation.width != frame->child_allocation.width ||
> +@@ -261,7 +261,7 @@
> +       gdk_window_invalidate_rect (widget->window, &widget->allocation, FALSE);
> +     }
> + 
> +-  if (bin->child && GTK_WIDGET_VISIBLE (bin->child))
> ++  if (bin->child && gtk_widget_get_visible (bin->child))
> +     {
> +       gtk_widget_size_allocate (bin->child, &child_allocation);
> +     }
> +Index: nbtk-1.2.3/nbtk/nbtk-gtk-light-switch.c
> +===================================================================
> +--- nbtk-1.2.3.orig/nbtk/nbtk-gtk-light-switch.c	2010-04-17 14:16:07.866564625 +0800
> ++++ nbtk-1.2.3/nbtk/nbtk-gtk-light-switch.c	2010-04-17 14:18:25.454564286 +0800
> +@@ -147,7 +147,7 @@
> + 
> +   priv = NBTK_GTK_LIGHT_SWITCH_GET_PRIVATE (lightswitch);
> +   style = lightswitch->style;
> +-  state_type = GTK_WIDGET_STATE (lightswitch);
> ++  state_type = gtk_widget_get_state (lightswitch);
> + 
> +   on_label_x = (priv->trough_width / 5) * 0.75;
> +   off_label_x = (priv->trough_width / 8) * 5;
> +@@ -231,7 +231,7 @@
> +   /* draw the switch itself */
> +   gtk_paint_box (style,
> +                  lightswitch->window,
> +-                 GTK_WIDGET_STATE (lightswitch),
> ++                 gtk_widget_get_state (lightswitch),
> +                  GTK_SHADOW_OUT,
> +                  NULL,
> +                  NULL,
> diff --git a/recipes/moblin/nbtk_git.bb b/recipes/moblin/nbtk_git.bb
> index 174adeb..36e458b 100644
> --- a/recipes/moblin/nbtk_git.bb
> +++ b/recipes/moblin/nbtk_git.bb
> @@ -1,13 +1,18 @@
>  LICENSE = "LGPLv2.1"
>  
> -SRCREV = "73958e79f0ad69dd4e63cb8e697bd80ecee1cc34"
> -PV = "0.8.0"
> -PR = "r1"
> +SRCREV = "caed93dd6ab6ae0cd7eb436357ceefa18f878981"
> +PV = "1.2.3"
> +PR = "r3"
>  PR_append = "+git${SRCREV}"
>  
> -DEPENDS = "glib-2.0 gtk+ libccss clutter-0.9"
> +DEPENDS = "glib-2.0 gtk+ libccss clutter clutter-imcontext"
> +
> +# 03_fix_FTBFS_port_to_gtk2.20.patch grabbed from http://launchpadlibrarian.net/48166967/nbtk_1.2.3-1_1.2.3-2.diff.gz
> +
> +SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git \
> +           file://03_fix_FTBFS_port_to_gtk2.20.patch \
> +"
>  
> -SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMhI6mMkyGM64RGpERAvG+AJ93BDC7WtdhDwWyg1/HOnGGcGrW+ACcDTKB
VoQeUxCdqdaDZCUkwsM9PpU=
=TPqp
-----END PGP SIGNATURE-----



