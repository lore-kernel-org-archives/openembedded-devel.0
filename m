Received: from [216.168.135.167] (helo=sanddollar.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MGxH3-0008TD-ON
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 17:42:18 +0200
Received: (qmail 29057 invoked by uid 1003); 17 Jun 2009 15:31:37 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 17 Jun 2009 15:31:35 -0000
Message-ID: <4A390C56.1050608@balister.org>
Date: Wed, 17 Jun 2009 11:31:34 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1245236339-21074-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1245236339-21074-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] gst-omapfb: add recipe to build gst sink for	the omapfb overlay
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
X-List-Received-Date: Wed, 17 Jun 2009 15:42:22 -0000
X-Groupsio-MsgNum: 11324
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms060107070700080902060900"

--------------ms060107070700080902060900
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Koen Kooi wrote:
> From: Gregoire Gentil <gregoire@gentil.com>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  ...Overlay-and-I420-to-422-colorspace-conver.patch | 1097 ++++++++++++++++++++
>  recipes/gstreamer/gst-omapfb_1.0.bb                |   38 +
>  2 files changed, 1135 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gstreamer/gst-omapfb/0001-Implement-XOverlay-and-I420-to-422-colorspace-conver.patch
>  create mode 100644 recipes/gstreamer/gst-omapfb_1.0.bb
> 
> diff --git a/recipes/gstreamer/gst-omapfb/0001-Implement-XOverlay-and-I420-to-422-colorspace-conver.patch b/recipes/gstreamer/gst-omapfb/0001-Implement-XOverlay-and-I420-to-422-colorspace-conver.patch
> new file mode 100644
> index 0000000..d9854f8
> --- /dev/null
> +++ b/recipes/gstreamer/gst-omapfb/0001-Implement-XOverlay-and-I420-to-422-colorspace-conver.patch
> @@ -0,0 +1,1097 @@
> +From 7c8f0e13cd2558851ab3277a14a8929e14f5428f Mon Sep 17 00:00:00 2001
> +From: Tim Yamin <plasm@roo.me.uk>
> +Date: Sat, 25 Apr 2009 01:19:09 -0700
> +Subject: [STABLE][PATCH] Implement XOverlay and I420 to 422 colorspace conversion.
> +
> +---
> + Makefile |    8 +-
> + omapfb.c |  700 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> + omapfb.h |   78 +++++++-
> + yuv.S    |  117 +++++++++++
> + 4 files changed, 878 insertions(+), 25 deletions(-)
> + create mode 100644 yuv.S
> +
> +diff --git a/Makefile b/Makefile
> +index 0ad129b..37b8746 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,12 +1,12 @@
> +-GST_LIBS := $(shell pkg-config --libs gstreamer-0.10 gstreamer-base-0.10)
> +-GST_CFLAGS := $(shell pkg-config --cflags gstreamer-0.10 gstreamer-base-0.10)
> ++GST_LIBS := $(shell pkg-config --libs gstreamer-0.10 gstreamer-base-0.10 gstreamer-interfaces-0.10) -lX11
> ++GST_CFLAGS := $(shell pkg-config --cflags gstreamer-0.10 gstreamer-base-0.10 gstreamer-interfaces-0.10)
> + KERNEL := /data/public/dev/omap/linux-omap
> + 
> +-CC := arm-linux-gcc
> ++CC ?= arm-linux-gcc
> +-CFLAGS := -Wall -ggdb -ansi -std=c99
> ++CFLAGS := -Wall -ggdb -O3 -Wall -fomit-frame-pointer -mcpu=cortex-a8 -mfpu=neon
> + 
> + plugin := libgstomapfb.so
> +-objects := omapfb.o
> ++objects := omapfb.o yuv.o
> + 
> + plugin_dir := $(DESTDIR)/usr/lib/gstreamer-0.10
> + 
> +diff --git a/omapfb.c b/omapfb.c
> +index cbd6936..020a9bb 100644
> +--- a/omapfb.c
> ++++ b/omapfb.c
> +@@ -1,5 +1,9 @@
> + /*
> +  * Copyright (C) 2008 Felipe Contreras <felipe.contreras@gmail.com>
> ++ * Copyright (C) 2009 Tim Yamin <plasm@roo.me.uk>
> ++ *
> ++ * X code largely copied from ximagesink by Julien Moutte and
> ++ * vo_omapfb.c by Gregoire Gentil.
> +  *
> +  * This library is free software; you can redistribute it and/or
> +  * modify it under the terms of the GNU Lesser General Public
> +@@ -20,10 +24,398 @@
> + #include <sys/ioctl.h>
> + #include <sys/mman.h>
> + #include <unistd.h>
> ++#include <string.h>
> ++#include <sys/types.h>
> ++#include <malloc.h>
> ++#include <stdlib.h>
> + 
> + #include "omapfb.h"
> ++#include <gst/interfaces/xoverlay.h>
> + 
> + static GstVideoSinkClass *parent_class = NULL;
> ++extern void yuv420_to_yuv422(__uint8_t *yuv, __uint8_t *y, __uint8_t *u, __uint8_t *v,
> ++                             int w, int h, int yw, int cw, int dw);
> ++
> ++static void x11_get_window_abs_position(Display *display, Window window,
> ++                                        int *wx, int *wy, int *ww, int *wh)
> ++{
> ++    Window root, parent;
> ++    Window *child;
> ++    unsigned int n_children;
> ++    XWindowAttributes attribs;
> ++
> ++    /* Get window attributes */
> ++    XGetWindowAttributes(display, window, &attribs);
> ++
> ++    /* Get relative position of given window */
> ++    *wx = attribs.x;
> ++    *wy = attribs.y;
> ++    if (ww)
> ++        *ww = attribs.width;
> ++    if (wh)
> ++        *wh = attribs.height;
> ++
> ++    /* Query window tree information */
> ++    XQueryTree(display, window, &root, &parent, &child, &n_children);
> ++    if (parent)
> ++    {
> ++        int x, y;
> ++
> ++	/* If we have a parent we must go there and discover his position */
> ++	x11_get_window_abs_position(display, parent, &x, &y, NULL, NULL);
> ++	*wx += x;
> ++	*wy += y;
> ++    }
> ++
> ++    /* If we had children, free them */
> ++    if(n_children)
> ++        XFree(child);
> ++}
> ++
> ++static GstXWindow *
> ++gst_omapfbsink_xwindow_new (GstOmapFbSink * omapfbsink, gint width, gint height)
> ++{
> ++    GstXWindow *xwindow = NULL;
> ++    XGCValues values;
> ++
> ++    if(!omapfbsink->xcontext)
> ++        return NULL;
> ++
> ++    xwindow = g_new0 (GstXWindow, 1);
> ++    xwindow->width = width;
> ++    xwindow->height = height;
> ++    xwindow->internal = TRUE;
> ++
> ++    g_mutex_lock (omapfbsink->x_lock);
> ++    xwindow->win = XCreateSimpleWindow (omapfbsink->xcontext->disp,
> ++					omapfbsink->xcontext->root,
> ++					0, 0, xwindow->width, xwindow->height,
> ++					0, 0, omapfbsink->colorKey);
> ++
> ++    /* We have to do that to prevent X from redrawing the background on
> ++       ConfigureNotify. This takes away flickering of video when resizing. */
> ++    XSetWindowBackgroundPixmap (omapfbsink->xcontext->disp, xwindow->win, None);
> ++
> ++    if (omapfbsink->handle_events) {
> ++        Atom wm_delete;
> ++
> ++	XSelectInput (omapfbsink->xcontext->disp, xwindow->win, ExposureMask |
> ++		      StructureNotifyMask | PointerMotionMask | KeyPressMask |
> ++		      KeyReleaseMask | ButtonPressMask | ButtonReleaseMask);
> ++
> ++	/* Tell the window manager we'd like delete client messages instead of
> ++	 * being killed */
> ++	wm_delete = XInternAtom (omapfbsink->xcontext->disp,
> ++				 "WM_DELETE_WINDOW", False);
> ++	(void) XSetWMProtocols (omapfbsink->xcontext->disp, xwindow->win,
> ++				&wm_delete, 1);
> ++    }
> ++
> ++    xwindow->gc = XCreateGC (omapfbsink->xcontext->disp, xwindow->win,
> ++			     0, &values);
> ++
> ++    XMapRaised (omapfbsink->xcontext->disp, xwindow->win);
> ++    XSync (omapfbsink->xcontext->disp, FALSE);
> ++
> ++    g_mutex_unlock (omapfbsink->x_lock);
> ++    gst_x_overlay_got_xwindow_id (GST_X_OVERLAY (omapfbsink), xwindow->win);
> ++
> ++    return xwindow;
> ++}
> ++
> ++static gboolean gst_omapfbsink_update_plane (GstOmapFbSink *omapfbsink)
> ++{
> ++    int wx, wy, ww, wh;
> ++    if (!omapfbsink->xcontext)
> ++    {
> ++        if (ioctl (omapfbsink->overlay_fd, OMAPFB_SETUP_PLANE, &omapfbsink->plane_info))
> ++            return FALSE;
> ++        return TRUE;
> ++    }
> ++
> ++    if (omapfbsink->plane_info.enabled != 1)
> ++        return FALSE;
> ++
> ++    x11_get_window_abs_position(omapfbsink->xcontext->disp,
> ++				omapfbsink->xwindow->win, &wx, &wy, &ww, &wh);
> ++
> ++    if (wx != omapfbsink->xwindow->wx || wy != omapfbsink->xwindow->wy ||
> ++	wh != omapfbsink->xwindow->height || ww != omapfbsink->xwindow->width) {
> ++        omapfbsink->plane_info.out_width = omapfbsink->xwindow->width = ww;
> ++	omapfbsink->plane_info.out_height = omapfbsink->xwindow->height = wh;
> ++        omapfbsink->plane_info.pos_x = omapfbsink->xwindow->wx = wx;
> ++        omapfbsink->plane_info.pos_y = omapfbsink->xwindow->wy = wy;
> ++
> ++        GST_DEBUG_OBJECT(omapfbsink, "updating geometry to: (%d,%d) %dx%d", wx, wy, ww, wh);
> ++
> ++        XSetForeground (omapfbsink->xcontext->disp, omapfbsink->xwindow->gc, omapfbsink->colorKey);
> ++        XFillRectangle (omapfbsink->xcontext->disp, omapfbsink->xwindow->win, omapfbsink->xwindow->gc, 0, 0, ww, wh);
> ++
> ++        if (ioctl (omapfbsink->overlay_fd, OMAPFB_SETUP_PLANE, &omapfbsink->plane_info))
> ++	  return FALSE;
> ++    }
> ++
> ++    return TRUE;
> ++}
> ++
> ++static void
> ++gst_omapfbsink_expose (GstXOverlay * overlay)
> ++{
> ++    gst_omapfbsink_update_plane(GST_OMAPFB_SINK (overlay));
> ++}
> ++
> ++static void
> ++gst_omapfbsink_xwindow_destroy (GstOmapFbSink * omapfbsink,
> ++    GstXWindow * xwindow)
> ++{
> ++    g_return_if_fail (xwindow != NULL);
> ++    g_mutex_lock (omapfbsink->x_lock);
> ++
> ++    /* If we did not create that window we just free the GC and let it live */
> ++    if (xwindow->internal)
> ++        XDestroyWindow (omapfbsink->xcontext->disp, xwindow->win);
> ++    else
> ++        XSelectInput (omapfbsink->xcontext->disp, xwindow->win, 0);
> ++
> ++    XFreeGC (omapfbsink->xcontext->disp, xwindow->gc);
> ++    XSync (omapfbsink->xcontext->disp, FALSE);
> ++    g_mutex_unlock (omapfbsink->x_lock);
> ++    g_free (xwindow);
> ++}
> ++
> ++/* This function handles XEvents that might be in the queue. It generates
> ++   GstEvent that will be sent upstream in the pipeline to handle interactivity
> ++   and navigation.*/
> ++static void
> ++gst_omapfbsink_handle_xevents (GstOmapFbSink * omapfbsink)
> ++{
> ++    XEvent e;
> ++    g_mutex_lock (omapfbsink->flow_lock);
> ++    g_mutex_lock (omapfbsink->x_lock);
> ++
> ++    while (XCheckWindowEvent (omapfbsink->xcontext->disp,
> ++           omapfbsink->xwindow->win, ExposureMask | StructureNotifyMask, &e)) {
> ++        switch (e.type) {
> ++            case Expose:
> ++            case ConfigureNotify:
> ++                gst_omapfbsink_update_plane (omapfbsink);
> ++                break;
> ++            default:
> ++                break;
> ++        }
> ++    }
> ++
> ++    /* Handle Display events */
> ++    while (XPending (omapfbsink->xcontext->disp)) {
> ++        XNextEvent (omapfbsink->xcontext->disp, &e);
> ++
> ++        switch (e.type) {
> ++            case ClientMessage:{
> ++                Atom wm_delete;
> ++
> ++                wm_delete = XInternAtom (omapfbsink->xcontext->disp,
> ++                        "WM_DELETE_WINDOW", False);
> ++                if (wm_delete == (Atom) e.xclient.data.l[0]) {
> ++                    /* Handle window deletion by posting an error on the bus */
> ++                    GST_ELEMENT_ERROR (omapfbsink, RESOURCE, NOT_FOUND,
> ++                            ("Output window was closed"), (NULL));
> ++
> ++                    g_mutex_unlock (omapfbsink->x_lock);
> ++                    gst_omapfbsink_xwindow_destroy (omapfbsink, omapfbsink->xwindow);
> ++                    omapfbsink->xwindow = NULL;
> ++                    g_mutex_lock (omapfbsink->x_lock);
> ++                }
> ++                break;
> ++            }
> ++            default:
> ++                break;
> ++        }
> ++    }
> ++
> ++    g_mutex_unlock (omapfbsink->x_lock);
> ++    g_mutex_unlock (omapfbsink->flow_lock);
> ++}
> ++
> ++static gpointer
> ++gst_omapfbsink_event_thread (GstOmapFbSink * omapfbsink)
> ++{
> ++    GST_OBJECT_LOCK (omapfbsink);
> ++    while (omapfbsink->running) {
> ++        GST_OBJECT_UNLOCK (omapfbsink);
> ++
> ++	if (omapfbsink->xwindow)
> ++	  gst_omapfbsink_handle_xevents (omapfbsink);
> ++	g_usleep (100000);
> ++
> ++	GST_OBJECT_LOCK (omapfbsink);
> ++    }
> ++    GST_OBJECT_UNLOCK (omapfbsink);
> ++
> ++    return NULL;
> ++}
> ++
> ++/* This function gets the X Display and global info about it. Everything is
> ++   stored in our object and will be cleaned when the object is disposed. */
> ++static GstXContext *
> ++gst_omapfbsink_xcontext_get (GstOmapFbSink * omapfbsink)
> ++{
> ++    GstXContext *xcontext = g_new0 (GstXContext, 1);
> ++    g_mutex_lock (omapfbsink->x_lock);
> ++
> ++    xcontext->disp = XOpenDisplay (omapfbsink->display_name);
> ++
> ++    if (!xcontext->disp) {
> ++        g_mutex_unlock (omapfbsink->x_lock);
> ++	g_free (xcontext);
> ++	GST_ELEMENT_WARNING (omapfbsink, RESOURCE, WRITE,
> ++			     ("Could not initialise X output"),
> ++			     ("Could not open display"));
> ++	return NULL;
> ++    }
> ++
> ++    xcontext->screen = DefaultScreenOfDisplay (xcontext->disp);
> ++    xcontext->screen_num = DefaultScreen (xcontext->disp);
> ++    xcontext->visual = DefaultVisual (xcontext->disp, xcontext->screen_num);
> ++    xcontext->root = DefaultRootWindow (xcontext->disp);
> ++
> ++    xcontext->width = DisplayWidth (xcontext->disp, xcontext->screen_num);
> ++    xcontext->height = DisplayHeight (xcontext->disp, xcontext->screen_num);
> ++
> ++    g_mutex_unlock (omapfbsink->x_lock);
> ++
> ++    /* Setup our event listening thread */
> ++    GST_OBJECT_LOCK (omapfbsink);
> ++    omapfbsink->running = TRUE;
> ++    omapfbsink->event_thread = g_thread_create (
> ++      (GThreadFunc) gst_omapfbsink_event_thread, omapfbsink, TRUE, NULL);
> ++    GST_OBJECT_UNLOCK (omapfbsink);
> ++
> ++    return xcontext;
> ++}
> ++
> ++static void
> ++gst_omapfbsink_set_xwindow_id (GstXOverlay * overlay, XID xwindow_id)
> ++{
> ++    GstOmapFbSink *omapfbsink = GST_OMAPFB_SINK (overlay);
> ++    GstXWindow *xwindow = NULL;
> ++    XWindowAttributes attr;
> ++
> ++    /* If we already use that window, return */
> ++    if (omapfbsink->xwindow && (xwindow_id == omapfbsink->xwindow->win))
> ++        return;
> ++
> ++    /* If the element has not initialized the X11 context try to do so */
> ++    if (!omapfbsink->xcontext &&
> ++	!(omapfbsink->xcontext = gst_omapfbsink_xcontext_get (omapfbsink))) {
> ++      g_mutex_unlock (omapfbsink->flow_lock);
> ++      return;
> ++    }
> ++
> ++    /* If a window is there already we destroy it */
> ++    if (omapfbsink->xwindow) {
> ++      gst_omapfbsink_xwindow_destroy (omapfbsink, omapfbsink->xwindow);
> ++      omapfbsink->xwindow = NULL;
> ++    }
> ++
> ++    /* If the xid is 0 we go back to an internal window */
> ++    if (xwindow_id == 0) {
> ++      /* If no width/height caps nego did not happen window will be created
> ++	 during caps nego then */
> ++      if (GST_VIDEO_SINK_WIDTH (omapfbsink) && GST_VIDEO_SINK_HEIGHT (omapfbsink)) {
> ++	xwindow = gst_omapfbsink_xwindow_new (omapfbsink,
> ++          GST_VIDEO_SINK_WIDTH (omapfbsink),
> ++          GST_VIDEO_SINK_HEIGHT (omapfbsink));
> ++      }
> ++    } else {
> ++        xwindow = g_new0 (GstXWindow, 1);
> ++	xwindow->wx = xwindow->wy = -1;
> ++	xwindow->win = xwindow_id;
> ++
> ++	/* We get window geometry, set the event we want to receive,
> ++	   and create a GC */
> ++	g_mutex_lock (omapfbsink->x_lock);
> ++	XGetWindowAttributes (omapfbsink->xcontext->disp, xwindow->win, &attr);
> ++	xwindow->width = attr.width;
> ++	xwindow->height = attr.height;
> ++	xwindow->internal = FALSE;
> ++	if (omapfbsink->handle_events) {
> ++	    XSelectInput (omapfbsink->xcontext->disp, xwindow->win, ExposureMask |
> ++			  StructureNotifyMask | PointerMotionMask | KeyPressMask |
> ++			  KeyReleaseMask);
> ++	}
> ++
> ++        xwindow->gc = XCreateGC (omapfbsink->xcontext->disp, xwindow->win, 0, NULL);
> ++	g_mutex_unlock (omapfbsink->x_lock);
> ++    }
> ++
> ++    if (xwindow) {
> ++        omapfbsink->xwindow = xwindow;
> ++
> ++	g_mutex_lock (omapfbsink->x_lock);
> ++	gst_omapfbsink_update_plane(omapfbsink);
> ++	g_mutex_unlock (omapfbsink->x_lock);
> ++    }
> ++}
> ++
> ++static void
> ++gst_omapfbsink_xwindow_clear (GstOmapFbSink * omapfbsink,
> ++			      GstXWindow * xwindow)
> ++{
> ++    g_return_if_fail (xwindow != NULL);
> ++    g_mutex_lock (omapfbsink->x_lock);
> ++
> ++    XSetForeground (omapfbsink->xcontext->disp, xwindow->gc,
> ++		    XBlackPixel (omapfbsink->xcontext->disp,
> ++				 omapfbsink->xcontext->screen_num));
> ++
> ++    XFillRectangle (omapfbsink->xcontext->disp, xwindow->win, xwindow->gc,
> ++		    0, 0, xwindow->width, xwindow->height);
> ++
> ++    XSync (omapfbsink->xcontext->disp, FALSE);
> ++    g_mutex_unlock (omapfbsink->x_lock);
> ++}
> ++
> ++static void
> ++gst_omapfbsink_set_event_handling (GstXOverlay * overlay,
> ++    gboolean handle_events)
> ++{
> ++    GstOmapFbSink *omapfbsink = GST_OMAPFB_SINK (overlay);
> ++    omapfbsink->handle_events = handle_events;
> ++
> ++    g_mutex_lock (omapfbsink->flow_lock);
> ++
> ++    if (G_UNLIKELY (!omapfbsink->xwindow)) {
> ++        g_mutex_unlock (omapfbsink->flow_lock);
> ++	return;
> ++    }
> ++
> ++    g_mutex_lock (omapfbsink->x_lock);
> ++
> ++    if (handle_events) {
> ++        if (omapfbsink->xwindow->internal) {
> ++	  XSelectInput (omapfbsink->xcontext->disp, omapfbsink->xwindow->win,
> ++			ExposureMask | StructureNotifyMask | PointerMotionMask |
> ++			KeyPressMask | KeyReleaseMask | ButtonPressMask | ButtonReleaseMask);
> ++	} else {
> ++	  XSelectInput (omapfbsink->xcontext->disp, omapfbsink->xwindow->win,
> ++			ExposureMask | StructureNotifyMask | PointerMotionMask |
> ++			KeyPressMask | KeyReleaseMask);
> ++	}
> ++    } else {
> ++        XSelectInput (omapfbsink->xcontext->disp, omapfbsink->xwindow->win, 0);
> ++    }
> ++
> ++    g_mutex_unlock (omapfbsink->x_lock);
> ++    g_mutex_unlock (omapfbsink->flow_lock);
> ++}
> ++
> ++static void
> ++gst_omapfbsink_xoverlay_init (GstXOverlayClass * iface)
> ++{
> ++    iface->set_xwindow_id = gst_omapfbsink_set_xwindow_id;
> ++    iface->expose = gst_omapfbsink_expose;
> ++    iface->handle_events = gst_omapfbsink_set_event_handling;
> ++}
> + 
> + static GstCaps *
> + generate_sink_template (void)
> +@@ -49,15 +441,12 @@ generate_sink_template (void)
> +         g_value_init (&val, GST_TYPE_FOURCC);
> + 
> + #if 0
> +-        gst_value_set_fourcc (&val, GST_MAKE_FOURCC ('I', '4', '2', '0'));
> +-        gst_value_list_append_value (&list, &val);
> +-
> +         gst_value_set_fourcc (&val, GST_MAKE_FOURCC ('Y', 'U', 'Y', '2'));
> +         gst_value_list_append_value (&list, &val);
> +-
> +-        gst_value_set_fourcc (&val, GST_MAKE_FOURCC ('U', 'Y', 'V', 'Y'));
> +-        gst_value_list_append_value (&list, &val);
> + #else
> ++	gst_value_set_fourcc (&val, GST_MAKE_FOURCC ('I', '4', '2', '0'));
> ++	gst_value_list_append_value (&list, &val);
> ++
> +         gst_value_set_fourcc (&val, GST_MAKE_FOURCC ('U', 'Y', 'V', 'Y'));
> +         gst_value_list_append_value (&list, &val);
> + #endif
> +@@ -81,28 +470,112 @@ buffer_alloc (GstBaseSink *bsink,
> +               GstBuffer **buf)
> + {
> +     GstOmapFbSink *self;
> +-    GstBuffer *buffer;
> ++    GstBuffer *buffer = NULL;
> +     GstFlowReturn ret = GST_FLOW_OK;
> +-
> +     self = GST_OMAPFB_SINK (bsink);
> + 
> +-    buffer = gst_buffer_new ();
> +-    GST_BUFFER_DATA (buffer) = self->framebuffer;
> +-    GST_BUFFER_SIZE (buffer) = size;
> +-    gst_buffer_set_caps (buffer, caps);
> ++    if(self->row_skip) {
> ++        buffer = gst_buffer_new ();
> ++        GST_BUFFER_DATA (buffer) = self->buffer = self->framebuffer;
> ++        GST_BUFFER_SIZE (buffer) = self->buffer_size = size;
> ++        gst_buffer_set_caps (buffer, caps);
> ++    } else {
> ++        if(self->buffer && size == self->buffer_size) {
> ++            buffer = gst_buffer_new ();
> ++            GST_BUFFER_DATA (buffer) = self->buffer;
> ++            GST_BUFFER_SIZE (buffer) = size;
> ++            gst_buffer_set_caps (buffer, caps);
> ++        } else {
> ++            if(self->buffer)
> ++                free(self->buffer);
> ++            if(posix_memalign(&self->buffer, 16, (size_t) size) == 0) {
> ++                buffer = gst_buffer_new ();
> ++                GST_BUFFER_DATA (buffer) = self->buffer;
> ++                GST_BUFFER_SIZE (buffer) = self->buffer_size = size;
> ++                gst_buffer_set_caps (buffer, caps);
> ++            } else {
> ++                GST_ELEMENT_ERROR (self, RESOURCE, WRITE, ("Could not allocate aligned buf!"),
> ++                                  ("Could not alloc aligned buf!"));
> ++            }
> ++        }
> ++    }
> + 
> +     *buf = buffer;
> +-
> +     return ret;
> + }
> + 
> ++static GstFlowReturn
> ++render (GstBaseSink * bsink, GstBuffer * buf)
> ++{
> ++    int i, w, h;
> ++    GstOmapFbSink *omapfbsink = GST_OMAPFB_SINK(bsink);
> ++    __uint8_t *fb = omapfbsink->framebuffer, *data = GST_BUFFER_DATA(buf);
> ++
> ++    if(omapfbsink->plane_info.enabled == 2)
> ++    {
> ++        omapfbsink->plane_info.enabled = 1;
> ++
> ++        g_mutex_lock (omapfbsink->x_lock);
> ++        gst_omapfbsink_update_plane(omapfbsink);
> ++        g_mutex_unlock (omapfbsink->x_lock);
> ++    }
> ++
> ++    /* If a buffer which wasn't supplied by us is given to us to render with,
> ++       we need to copy to our buffer first so that memory alignment constraints
> ++       are met. */
> ++    if(data != omapfbsink->buffer && GST_BUFFER_SIZE(buf) <= omapfbsink->buffer_size)
> ++    {
> ++        memcpy(omapfbsink->buffer, data, GST_BUFFER_SIZE(buf));
> ++        data = omapfbsink->buffer;
> ++    }
> ++
> ++    /* buffer_alloc gave a direct buffer, so we have nothing to
> ++       do here... */
> ++    if(omapfbsink->row_skip)
> ++        return GST_FLOW_OK;
> ++
> ++    switch(omapfbsink->image_format) {
> ++        case GST_MAKE_FOURCC('I', '4', '2', '0'):
> ++            /* Convert to YUV422 and send to FB */
> ++
> ++            h = GST_VIDEO_SINK_HEIGHT (omapfbsink);
> ++            w = GST_VIDEO_SINK_WIDTH (omapfbsink);
> ++
> ++            __uint8_t *y, *u, *v;
> ++            y = data;
> ++            u = y + w * h;
> ++            v = u + w / 2 * h / 2;
> ++
> ++            yuv420_to_yuv422(fb, y, u, v, w & ~15, h, w, w / 2, omapfbsink->fixinfo.line_length);
> ++            break;
> ++
> ++        case GST_MAKE_FOURCC('U', 'Y', 'V', 'Y'):
> ++            /* Send to FB, taking into account line_length */
> ++
> ++            w = 2 * GST_VIDEO_SINK_WIDTH (omapfbsink);
> ++            for(i = 0; i < GST_VIDEO_SINK_HEIGHT (omapfbsink); i++)
> ++            {
> ++                memcpy(fb, data, w);
> ++
> ++                fb += omapfbsink->fixinfo.line_length;
> ++                data += w;
> ++            }
> ++
> ++            break;
> ++    }
> ++
> ++    return GST_FLOW_OK;
> ++}
> ++
> + static gboolean
> + setcaps (GstBaseSink *bsink,
> +          GstCaps *vscapslist)
> + {
> +     GstOmapFbSink *self;
> +     GstStructure *structure;
> ++
> +     gint width, height;
> ++    struct omapfb_color_key color_key;
> + 
> +     self = GST_OMAPFB_SINK (bsink);
> + 
> +@@ -118,22 +591,54 @@ setcaps (GstBaseSink *bsink,
> + 
> +     self->overlay_info.xoffset = 0;
> +     self->overlay_info.yoffset = 0;
> +-    self->overlay_info.nonstd = OMAPFB_COLOR_YUV422;
> ++
> ++    gst_structure_get_fourcc (structure, "format", &self->image_format);
> ++    switch(self->image_format) {
> ++        case GST_MAKE_FOURCC('I', '4', '2', '0'):
> ++            self->row_skip = FALSE; /* Colorspace conversion required */
> ++            self->overlay_info.nonstd = OMAPFB_COLOR_YUY422;
> ++            break;
> ++        case GST_MAKE_FOURCC('U', 'Y', 'V', 'Y'):
> ++            /* Can data be pushed straight to the FB or do we need to interleave? */
> ++            if (self->fixinfo.line_length != 2 * width)
> ++                self->row_skip = FALSE;
> ++            else
> ++                self->row_skip = TRUE;
> ++            self->overlay_info.nonstd = OMAPFB_COLOR_YUV422;
> ++            break;
> ++    }
> + 
> +     if (ioctl (self->overlay_fd, FBIOPUT_VSCREENINFO, &self->overlay_info))
> +         return FALSE;
> + 
> +-    self->plane_info.enabled = 1;
> ++    GST_VIDEO_SINK_WIDTH (self) = width;
> ++    GST_VIDEO_SINK_HEIGHT (self) = height;
> ++    if (!self->xwindow) {
> ++        self->xwindow = gst_omapfbsink_xwindow_new (self,
> ++            GST_VIDEO_SINK_WIDTH (self), GST_VIDEO_SINK_HEIGHT (self));
> ++    }
> ++
> ++    color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
> ++    color_key.background = 0x0;
> ++    color_key.trans_key = self->colorKey;
> ++    if (self->xwindow)
> ++        color_key.key_type = OMAPFB_COLOR_KEY_GFX_DST;
> ++    else
> ++        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
> ++
> ++    if (ioctl (self->overlay_fd, OMAPFB_SET_COLOR_KEY, &color_key))
> ++        return FALSE;
> ++
> +     self->plane_info.pos_x = 0;
> +     self->plane_info.pos_y = 0;
> +     self->plane_info.out_width = self->overlay_info.xres;
> +     self->plane_info.out_height = self->overlay_info.yres;
> ++    self->plane_info.enabled = 2;
> + 
> +-    if (ioctl (self->overlay_fd, OMAPFB_SETUP_PLANE, &self->plane_info))
> ++    if (ioctl (self->overlay_fd, FBIOGET_FSCREENINFO, &self->fixinfo))
> +         return FALSE;
> + 
> +     self->enabled = TRUE;
> +-
> +     return TRUE;
> + }
> + 
> +@@ -204,20 +709,126 @@ stop (GstBaseSink *bsink)
> +     return TRUE;
> + }
> + 
> ++/* This function cleans the X context. Closing the Display and unrefing the
> ++   caps for supported formats. */
> ++static void
> ++gst_omapfbsink_xcontext_clear (GstOmapFbSink * omapfbsink)
> ++{
> ++    GstXContext *xcontext;
> ++    GST_OBJECT_LOCK (omapfbsink);
> ++    if (omapfbsink->xcontext == NULL) {
> ++      GST_OBJECT_UNLOCK (omapfbsink);
> ++      return;
> ++    }
> ++
> ++    xcontext = omapfbsink->xcontext;
> ++    omapfbsink->xcontext = NULL;
> ++
> ++    GST_OBJECT_UNLOCK (omapfbsink);
> ++    g_mutex_lock (omapfbsink->x_lock);
> ++
> ++    XCloseDisplay (xcontext->disp);
> ++    g_mutex_unlock (omapfbsink->x_lock);
> ++    g_free (xcontext);
> ++}
> ++
> ++static void
> ++gst_omapfbsink_reset (GstOmapFbSink *omapfbsink)
> ++{
> ++    GThread *thread;
> ++
> ++    GST_OBJECT_LOCK (omapfbsink);
> ++    omapfbsink->running = FALSE;
> ++    /* grab thread and mark it as NULL */
> ++    thread = omapfbsink->event_thread;
> ++    omapfbsink->event_thread = NULL;
> ++    GST_OBJECT_UNLOCK (omapfbsink);
> ++
> ++    /* Wait for our event thread to finish before we clean up our stuff. */
> ++    if (thread)
> ++      g_thread_join (thread);
> ++
> ++    g_mutex_lock (omapfbsink->flow_lock);
> ++    if (omapfbsink->xwindow) {
> ++        gst_omapfbsink_xwindow_clear (omapfbsink, omapfbsink->xwindow);
> ++        gst_omapfbsink_xwindow_destroy (omapfbsink, omapfbsink->xwindow);
> ++        omapfbsink->xwindow = NULL;
> ++    }
> ++    g_mutex_unlock (omapfbsink->flow_lock);
> ++    gst_omapfbsink_xcontext_clear (omapfbsink);
> ++}
> ++
> ++static GstStateChangeReturn
> ++gst_omapfbsink_change_state (GstElement * element, GstStateChange transition)
> ++{
> ++    GstOmapFbSink *omapfbsink;
> ++    GstStateChangeReturn ret = GST_STATE_CHANGE_SUCCESS;
> ++    GstXContext *xcontext = NULL;
> ++
> ++    omapfbsink = GST_OMAPFB_SINK (element);
> ++
> ++    switch (transition) {
> ++    case GST_STATE_CHANGE_NULL_TO_READY:
> ++
> ++        /* Initializing the XContext */
> ++        if (omapfbsink->xcontext == NULL) {
> ++            xcontext = gst_omapfbsink_xcontext_get (omapfbsink);
> ++
> ++            GST_OBJECT_LOCK (omapfbsink);
> ++            omapfbsink->xcontext = xcontext;
> ++            GST_OBJECT_UNLOCK (omapfbsink);
> ++        }
> ++        break;
> ++    case GST_STATE_CHANGE_READY_TO_PAUSED:
> ++        g_mutex_lock (omapfbsink->flow_lock);
> ++        if (omapfbsink->xwindow)
> ++            gst_omapfbsink_xwindow_clear (omapfbsink, omapfbsink->xwindow);
> ++        g_mutex_unlock (omapfbsink->flow_lock);
> ++        break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_PLAYING:
> ++        break;
> ++    default:
> ++        break;
> ++    }
> ++
> ++    ret = GST_ELEMENT_CLASS (parent_class)->change_state (element, transition);
> ++
> ++    switch (transition) {
> ++    case GST_STATE_CHANGE_PLAYING_TO_PAUSED:
> ++        break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_READY:
> ++        GST_VIDEO_SINK_WIDTH (omapfbsink) = 0;
> ++        GST_VIDEO_SINK_HEIGHT (omapfbsink) = 0;
> ++        break;
> ++    case GST_STATE_CHANGE_READY_TO_NULL:
> ++        gst_omapfbsink_reset (omapfbsink);
> ++        break;
> ++    default:
> ++        break;
> ++    }
> ++
> ++    return ret;
> ++}
> ++
> + static void
> + type_class_init (gpointer g_class,
> +                  gpointer class_data)
> + {
> ++    GstElementClass *element_class;
> +     GstBaseSinkClass *base_sink_class;
> + 
> ++    element_class = (GstElementClass *) g_class;
> +     base_sink_class = (GstBaseSinkClass *) g_class;
> + 
> +-    parent_class = g_type_class_ref (GST_OMAPFB_SINK_TYPE);
> ++    parent_class = g_type_class_peek_parent (g_class);
> + 
> +     base_sink_class->set_caps = GST_DEBUG_FUNCPTR (setcaps);
> +     base_sink_class->buffer_alloc = GST_DEBUG_FUNCPTR (buffer_alloc);
> ++    base_sink_class->render = GST_DEBUG_FUNCPTR (render);
> +     base_sink_class->start = GST_DEBUG_FUNCPTR (start);
> +     base_sink_class->stop = GST_DEBUG_FUNCPTR (stop);
> ++
> ++    element_class->change_state = gst_omapfbsink_change_state;
> + }
> + 
> + static void
> +@@ -247,6 +858,42 @@ type_base_init (gpointer g_class)
> +     }
> + }
> + 
> ++static gboolean
> ++gst_omapfbsink_interface_supported (GstImplementsInterface * iface, GType type)
> ++{
> ++    g_assert (type == GST_TYPE_X_OVERLAY);
> ++    return TRUE;
> ++}
> ++
> ++static void
> ++gst_omapfbsink_interface_init (GstImplementsInterfaceClass * klass)
> ++{
> ++    klass->supported = gst_omapfbsink_interface_supported;
> ++}
> ++
> ++static void
> ++gst_omapfbsink_init (GstOmapFbSink * omapfbsink)
> ++{
> ++    omapfbsink->display_name = NULL;
> ++    omapfbsink->xcontext = NULL;
> ++    omapfbsink->xwindow = NULL;
> ++
> ++    omapfbsink->event_thread = NULL;
> ++    omapfbsink->running = FALSE;
> ++
> ++    omapfbsink->x_lock = g_mutex_new ();
> ++    omapfbsink->flow_lock = g_mutex_new ();
> ++
> ++    omapfbsink->handle_events = TRUE;
> ++    omapfbsink->colorKey = 0xff0;
> ++
> ++    omapfbsink->plane_info.enabled = 0;
> ++    omapfbsink->row_skip = FALSE;
> ++
> ++    omapfbsink->buffer = NULL;
> ++    omapfbsink->buffer_size = 0;
> ++}
> ++
> + GType
> + gst_omapfbsink_get_type (void)
> + {
> +@@ -255,14 +902,27 @@ gst_omapfbsink_get_type (void)
> +     if (G_UNLIKELY (type == 0))
> +     {
> +         GTypeInfo *type_info;
> ++        static const GInterfaceInfo iface_info = {
> ++            (GInterfaceInitFunc) gst_omapfbsink_interface_init,
> ++            NULL,
> ++            NULL,
> ++        };
> ++        static const GInterfaceInfo overlay_info = {
> ++            (GInterfaceInitFunc) gst_omapfbsink_xoverlay_init,
> ++            NULL,
> ++            NULL,
> ++        };
> + 
> +         type_info = g_new0 (GTypeInfo, 1);
> +         type_info->class_size = sizeof (GstOmapFbSinkClass);
> +         type_info->base_init = type_base_init;
> +         type_info->class_init = type_class_init;
> +         type_info->instance_size = sizeof (GstOmapFbSink);
> ++        type_info->instance_init = (GInstanceInitFunc) gst_omapfbsink_init;
> + 
> +         type = g_type_register_static (GST_TYPE_BASE_SINK, "GstOmapFbSink", type_info, 0);
> ++        g_type_add_interface_static (type, GST_TYPE_IMPLEMENTS_INTERFACE, &iface_info);
> ++        g_type_add_interface_static (type, GST_TYPE_X_OVERLAY, &overlay_info);
> + 
> +         g_free (type_info);
> +     }
> +@@ -273,13 +933,13 @@ gst_omapfbsink_get_type (void)
> + static gboolean
> + plugin_init (GstPlugin *plugin)
> + {
> +-    if (!gst_element_register (plugin, "omapfbsink", GST_RANK_NONE, GST_OMAPFB_SINK_TYPE))
> ++    if (!gst_element_register (plugin, "omapfbsink", GST_RANK_PRIMARY, GST_OMAPFB_SINK_TYPE))
> +         return FALSE;
> + 
> +     return TRUE;
> + }
> + 
> +-GstPluginDesc gst_plugin_desc =
> ++GST_PLUGIN_EXPORT GstPluginDesc gst_plugin_desc =
> + {
> +     GST_VERSION_MAJOR,
> +     GST_VERSION_MINOR,
> +diff --git a/omapfb.h b/omapfb.h
> +index 8dd91da..3e6af7f 100644
> +--- a/omapfb.h
> ++++ b/omapfb.h
> +@@ -23,21 +23,79 @@
> + #include <gst/video/gstvideosink.h>
> + #include <gst/video/video.h>
> + 
> ++#include <X11/Xlib.h>
> ++#include <X11/Xutil.h>
> ++
> + #include <linux/fb.h>
> +-#include <mach/omapfb.h>
> ++#include <linux/omapfb.h>
> + 
> + G_BEGIN_DECLS
> + 
> + #define GST_OMAPFB_SINK_TYPE (gst_omapfbsink_get_type ())
> + #define GST_OMAPFB_SINK(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_OMAPFB_SINK_TYPE, GstOmapFbSink))
> + 
> ++typedef struct GstXContext GstXContext;
> ++typedef struct GstXWindow GstXWindow;
> + typedef struct GstOmapFbSink GstOmapFbSink;
> + typedef struct GstOmapFbSinkClass GstOmapFbSinkClass;
> + 
> ++/**
> ++ * GstXWindow:
> ++ * @win: the Window ID of this X11 window
> ++ * @width: the width in pixels of Window @win
> ++ * @height: the height in pixels of Window @win
> ++ * @internal: used to remember if Window @win was created internally or passed
> ++ * through the #GstXOverlay interface
> ++ * @gc: the Graphical Context of Window @win
> ++ *
> ++ * Structure used to store informations about a Window.
> ++ */
> ++struct GstXWindow {
> ++    Window win;
> ++    gint width, height;
> ++    gboolean internal;
> ++    GC gc;
> ++
> ++    gint wx, wy;
> ++};
> ++
> ++/**
> ++ * GstXContext:
> ++ * @disp: the X11 Display of this context
> ++ * @screen: the default Screen of Display @disp
> ++ * @screen_num: the Screen number of @screen
> ++ * @visual: the default Visual of Screen @screen
> ++ * @root: the root Window of Display @disp
> ++ * @white: the value of a white pixel on Screen @screen
> ++ * @black: the value of a black pixel on Screen @screen
> ++ * @depth: the color depth of Display @disp
> ++ * @bpp: the number of bits per pixel on Display @disp
> ++ * @endianness: the endianness of image bytes on Display @disp
> ++ * @width: the width in pixels of Display @disp
> ++ * @height: the height in pixels of Display @disp
> ++ *
> ++ * Structure used to store various informations collected/calculated for a
> ++ * Display.
> ++ */
> ++struct GstXContext {
> ++    Display *disp;
> ++    Screen *screen;
> ++    gint screen_num;
> ++
> ++    Visual *visual;
> ++    Window root;
> ++
> ++    gint depth;
> ++    gint bpp;
> ++
> ++    gint width, height;
> ++};
> ++
> + struct GstOmapFbSink
> + {
> +     GstVideoSink videosink;
> + 
> ++    struct fb_fix_screeninfo fixinfo;
> +     struct fb_var_screeninfo varinfo;
> +     struct fb_var_screeninfo overlay_info;
> +     struct omapfb_mem_info mem_info;
> +@@ -46,6 +104,24 @@ struct GstOmapFbSink
> +     int overlay_fd;
> +     unsigned char *framebuffer;
> +     gboolean enabled;
> ++
> ++    GMutex *x_lock;
> ++    GMutex *flow_lock;
> ++
> ++    GstXContext *xcontext;
> ++    GstXWindow *xwindow;
> ++
> ++    gulong colorKey;
> ++    char *display_name;
> ++    GThread *event_thread;
> ++
> ++    void *buffer;
> ++    guint buffer_size;
> ++    guint image_format;
> ++
> ++    gboolean row_skip;
> ++    gboolean handle_events;
> ++    gboolean running;
> + };
> + 
> + struct GstOmapFbSinkClass
> +diff --git a/yuv.S b/yuv.S
> +new file mode 100644
> +index 0000000..52113fa
> +--- /dev/null
> ++++ b/yuv.S
> +@@ -0,0 +1,117 @@
> ++/*
> ++    Copyright (C) 2008 Mans Rullgard
> ++
> ++    Permission is hereby granted, free of charge, to any person
> ++    obtaining a copy of this software and associated documentation
> ++    files (the "Software"), to deal in the Software without
> ++    restriction, including without limitation the rights to use, copy,
> ++    modify, merge, publish, distribute, sublicense, and/or sell copies
> ++    of the Software, and to permit persons to whom the Software is
> ++    furnished to do so, subject to the following conditions:
> ++
> ++    The above copyright notice and this permission notice shall be
> ++    included in all copies or substantial portions of the Software.
> ++
> ++    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> ++    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> ++    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> ++    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> ++    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> ++    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> ++    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> ++    DEALINGS IN THE SOFTWARE.
> ++*/
> ++
> ++        .fpu neon
> ++        .text
> ++
> ++@ yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v,
> ++@                  int w, int h, int yw, int cw, int dw)
> ++
> ++#define yuv  r0
> ++#define y    r1
> ++#define u    r2
> ++#define v    r3
> ++#define w    r4
> ++#define h    r5
> ++#define yw   r6
> ++#define cw   r7
> ++#define dw   r8
> ++
> ++#define tyuv r9
> ++#define ty   r10
> ++#define tu   r11
> ++#define tv   r12
> ++#define i    lr
> ++
> ++        .global yuv420_to_yuv422
> ++        .func   yuv420_to_yuv422
> ++yuv420_to_yuv422:
> ++        push            {r4-r11,lr}
> ++        add             r4,  sp,  #36
> ++        ldm             r4, {r4-r8}
> ++1:
> ++        mov             tu,   u
> ++        mov             tv,   v
> ++        vld1.64         {d2}, [u,:64], cw               @ u0
> ++        vld1.64         {d3}, [v,:64], cw               @ v0
> ++        mov             tyuv, yuv
> ++        mov             ty,   y
> ++        vzip.8          d2,   d3                        @ u0v0
> ++        mov             i,    #16
> ++2:
> ++        pld             [y, #64]
> ++        vld1.64         {d0, d1},   [y,:128], yw        @ y0
> ++        pld             [u, #64]
> ++        subs            i,    i,    #4
> ++        vld1.64         {d6},       [u,:64],  cw        @ u2
> ++        pld             [y, #64]
> ++        vld1.64         {d4, d5},   [y,:128], yw        @ y1
> ++        pld             [v, #64]
> ++        vld1.64         {d7},       [v,:64],  cw        @ v2
> ++        pld             [y, #64]
> ++        vld1.64         {d16,d17},  [y,:128], yw        @ y2
> ++        vzip.8          d6,   d7                        @ u2v2
> ++        pld             [u, #64]
> ++        vld1.64         {d22},      [u,:64],  cw        @ u4
> ++        pld             [v, #64]
> ++        vld1.64         {d23},      [v,:64],  cw        @ v4
> ++        pld             [y, #64]
> ++        vld1.64         {d20,d21},  [y,:128], yw        @ y3
> ++        vmov            q9,   q3                        @ u2v2
> ++        vzip.8          d22,  d23                       @ u4v4
> ++        vrhadd.u8       q3,   q1,   q3                  @ u1v1
> ++        vzip.8          q0,   q1                        @ y0u0y0v0
> ++        vmov            q12,  q11                       @ u4v4
> ++        vzip.8          q2,   q3                        @ y1u1y1v1
> ++        vrhadd.u8       q11,  q9,   q11                 @ u3v3
> ++        vst1.64         {d0-d3},    [yuv,:128], dw      @ y0u0y0v0
> ++        vzip.8          q8,   q9                        @ y2u2y2v2
> ++        vst1.64         {d4-d7},    [yuv,:128], dw      @ y1u1y1v1
> ++        vzip.8          q10,  q11                       @ y3u3y3v3
> ++        vst1.64         {d16-d19},  [yuv,:128], dw      @ y2u2y2v2
> ++        vmov            q1,   q12
> ++        vst1.64         {d20-d23},  [yuv,:128], dw      @ y3u3y3v3
> ++        bgt             2b
> ++        subs            w,    w,    #16
> ++        add             yuv,  tyuv, #32
> ++        add             y,    ty,   #16
> ++        add             u,    tu,   #8
> ++        add             v,    tv,   #8
> ++        bgt             1b
> ++
> ++        ldr             w,    [sp, #36]
> ++        subs            h,    h,    #16
> ++        add             yuv,  yuv,  dw, lsl #4
> ++        sub             yuv,  yuv,  w,  lsl #1
> ++        add             y,    y,    yw, lsl #4
> ++        sub             y,    y,    w
> ++        add             u,    u,    cw, lsl #3
> ++        sub             u,    u,    w,  asr #1
> ++        add             v,    v,    cw, lsl #3
> ++        sub             v,    v,    w,  asr #1
> ++        bgt             1b
> ++
> ++        pop             {r4-r11,pc}
> ++        .endfunc
> ++
> +-- 
> +1.5.6.3
> +
> diff --git a/recipes/gstreamer/gst-omapfb_1.0.bb b/recipes/gstreamer/gst-omapfb_1.0.bb
> new file mode 100644
> index 0000000..f00ac7f
> --- /dev/null
> +++ b/recipes/gstreamer/gst-omapfb_1.0.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "GST output sink for Omapfb"
> +LICENSE = "GPL"
> +
> +inherit autotools
> +
> +DEPENDS = "gstreamer virtual/libx11 virtual/kernel"
> +
> +SRCREV = "6f0b1cb50d1c67c3a3db2f11246256060ac871de"
> +PV = "0.0+${PR}+gitr${SRCREV}"
> +
> +SRC_URI = "git://github.com/felipec/${PN}.git;protocol=git \
> +           file://0001-Implement-XOverlay-and-I420-to-422-colorspace-conver.patch;patch=1"
> +
> +S  ="${WORKDIR}/git"
> +
> +# We want a kernel header for armv7a, but we don't want to make gst-omapfb machine specific for that
> +STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
> +
> +EXTRA_OEMAKE = " KERNEL=${STAGING_KERNEL_DIR}"
> +CFLAGS += "-I${S}"
> +
> +TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}"
> +
> +do_configure_prepend() {
> +	install -d ${S}/linux
> +    cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h ${S}/linux || true
> +    cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h ${S}/linux || true
> +    cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S}/linux || true
> + 	sed -e 's/__user//g' -i ${S}/linux/omapfb.h
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}/gstreamer-0.10
> +	install -m 0755 libgstomapfb.so ${D}${libdir}/gstreamer-0.10
> +}
> +
> +FILES_${PN} += "${libdir}/gstreamer-0.10/libgstomapfb.so"
> +FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"

--------------ms060107070700080902060900
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDYxNzE1
MzEzNFowIwYJKoZIhvcNAQkEMRYEFHOZUPrsw+o6Ymn8173Odyec2qogMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQCj6dthMDzR226fCFnxLL4JAcW+fduHyq3N6X4Kqp+SO5Kr9qr5
ekxAFCMeMBuAn5GiXrpo3kpM5qkJPoJcKyfEaR+IJHl/5vLoqFtXAbpLyBVA9pqHcoizwektyk2t
lnDEiR0meSexH1l4SSaPMxuBIFQ3eVrrXJd4JTTjQG4JU88nJXKOulM7xbXPpsJN0qXjgze+7Yym
v/DyM0cU1gGGuu+UnHBZRZcuBKWrTz+EceTx2nIEzP8/4VmLGVUM6P+ci2S3FmCzPzR1qUXq7vPI
HqjQISOPz1VI/5TMYDjwljNCn3b31mvIR2uaG1YvoH9hzqIJViVlSFn5DRbrGPyEAAAAAAAA

--------------ms060107070700080902060900--
