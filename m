Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVgcw-0005vY-AC
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:38:54 +0100
Received: by eaad13 with SMTP id d13so405288eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 01:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=la1Q5rhEQjQ2osUAK9W2m6RqIDdMhQ6k7WmGu+GFdSQ=;
	b=M8fxtDz2CAk3WBOkFTybqzmz2zv9LezvQdUEZq18brAXgIlR3AVNObXuwmFbZ3gGfF
	g1NG6IKCnYAt5mkygjOQ8t4AkJ8sgm6lU8y827Bd4Fm1VOe5eMXBNSnUDtuSzmmWl5SR
	nzMWd5l/uD2PF/UPuVQuvVHJILjTwrghL9iWo=
Received: by 10.213.7.138 with SMTP id d10mr300913ebd.132.1322645533971;
	Wed, 30 Nov 2011 01:32:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm4294706eeb.4.2011.11.30.01.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 01:32:12 -0800 (PST)
Date: Wed, 30 Nov 2011 10:32:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111130093200.GA4799@jama.jama.net>
References: <404d4fc58d6513392e0e567f15ebc92299c6f3df.1322640244.git.Martin.Jansa@gmail.com>
	<8aed264c593ee085d99e335ae04bed95c2536a0b.1322640244.git.Martin.Jansa@gmail.com>
	<jb4snk$rmo$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jb4snk$rmo$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oo 2/4] mplayer2: drop armv7a/omapfb optimizations, those can be applied from bsp layer if needed
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
X-List-Received-Date: Wed, 30 Nov 2011 09:38:54 -0000
X-Groupsio-MsgNum: 35755
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 10:24:04AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 30-11-11 09:06, Martin Jansa schreef:
> > * not everybody has FEED_ARCH in OVERRIDES * and not everybody has
> > PKGARCHCOMPAT_ARMV7A enabled so we would need to duplicate armv7a and
> > armv7a-vfp-neon
>=20
> NAK on that. I'm not going to cripple mplayer because some distros lack
> FEED_ARCH in overrides.

Do we also cripple mplayer for people not using PKGARCHCOMPAT_ARMV7A?=20
Or do we want all armv7a-vfp-neon duplicated with armv7a?

I've asked you to propose FEED_ARCH in oe-core before, please do..


> > * example of working omapfb patch and optimizations is in meta-smartpho=
ne
> > layer=20
> > http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D=
483afbee82869a0b2dacadc4b9580c47dcb59d26
>=20
> I
> >=20
> do agree that that omapfb patch belongs in a BSP, not in the recipe.

yes and the current version of that patch in meta-oe is broken IIRC..
=20
Cheers,

> regards,
>=20
> Koen
>=20
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > .../0001-video-out-for-omapfb-support.patch        |  826
> > -------------------- meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=
 |
> > 21 +- 2 files changed, 1 insertions(+), 846 deletions(-) delete mode
> > 100644
> > meta-oe/recipes-multimedia/mplayer/mplayer2/0001-video-out-for-omapfb-s=
upport.patch
> >
> >  diff --git
> > a/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-video-out-for-omapfb=
-support.patch
> > b/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-video-out-for-omapfb=
-support.patch
> >
> >=20
> deleted file mode 100644
> > index a362ef6..0000000 ---
> > a/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-video-out-for-omapfb=
-support.patch
> >
> >=20
> +++ /dev/null
> > @@ -1,826 +0,0 @@ -From 2a42cec41a018008d07ea33b2b91dca191d78481 Mon Sep
> > 17 00:00:00 2001 -From: Martin Jansa <Martin.Jansa@gmail.com> -Date: Th=
u,
> > 25 Nov 2010 16:49:53 +0100 -Subject: [PATCH] video out for omapfb
> > support - -Upstream-Status: Pending -Signed-off-by: Martin Jansa
> > <Martin.Jansa@gmail.com> -Signed-off-by: Koen Kooi
> > <koen@dominion.thruhere.net> ---- - Makefile          |    2 +- -
> > libvo/video_out.c |    2 + - libvo/vo_omapfb.c |  591
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++ - libvo/yuv.S
> > |  170 +++++++++++++++ - 4 files changed, 764 insertions(+), 1
> > deletions(-) - create mode 100644 libvo/vo_omapfb.c - create mode 100644
> > libvo/yuv.S - -diff --git a/Makefile b/Makefile -index 83304a2..1e88d40
> > 100644 ---- a/Makefile -+++ b/Makefile -@@ -450,7 +450,7 @@
> > SRCS_MPLAYER-$(DIRECTFB)     +=3D libvo/vo_directfb2.c libvo/vo_dfbmga.=
c -
> > SRCS_MPLAYER-$(DIRECTX)      +=3D libao2/ao_dsound.c libvo/vo_directx.c=
 -
> > SRCS_MPLAYER-$(DXR3)         +=3D libvo/vo_dxr3.c - SRCS_MPLAYER-$(ESD)
> > +=3D libao2/ao_esd.c --SRCS_MPLAYER-$(FBDEV)        +=3D libvo/vo_fbdev=
=2Ec
> > libvo/vo_fbdev2.c -+SRCS_MPLAYER-$(FBDEV)        +=3D libvo/vo_fbdev.c
> > libvo/vo_fbdev2.c libvo/vo_omapfb.c libvo/yuv.S - SRCS_MPLAYER-$(FFMPEG)
> > +=3D libvo/vo_png.c - SRCS_MPLAYER-$(GGI)          +=3D libvo/vo_ggi.c -
> > SRCS_MPLAYER-$(GIF)          +=3D libvo/vo_gif89a.c -diff --git
> > a/libvo/video_out.c b/libvo/video_out.c -index e796784..1433834 100644=
=20
> > ---- a/libvo/video_out.c -+++ b/libvo/video_out.c -@@ -95,6 +95,7 @@
> > extern struct vo_driver video_out_null; - extern struct vo_driver
> > video_out_bl; - extern struct vo_driver video_out_fbdev; - extern struct
> > vo_driver video_out_fbdev2; -+extern struct vo_driver video_out_omapfb;=
 -
> > extern struct vo_driver video_out_svga; - extern struct vo_driver
> > video_out_png; - extern struct vo_driver video_out_ggi; -@@ -193,6 +194=
,7
> > @@ const struct vo_driver *video_out_drivers[] =3D - #ifdef CONFIG_FBDE=
V -
> > &video_out_fbdev, -         &video_out_fbdev2, -+
> > &video_out_omapfb, - #endif - #ifdef CONFIG_SVGALIB -
> > &video_out_svga, -diff --git a/libvo/vo_omapfb.c b/libvo/vo_omapfb.c -n=
ew
> > file mode 100644 -index 0000000..7bd8927 ---- /dev/null -+++
> > b/libvo/vo_omapfb.c -@@ -0,0 +1,591 @@ -+/* -+ -+Copyright (C) 2008
> > Gregoire Gentil <gregoire@gentil.com> -+Portions Copyright (C) 2009
> > Howard Chu <hyc@symas.com> -+This file adds an optimized vo output to
> > mplayer for the OMAP platform. This is a first pass and an attempt to
> > help to improve -+media playing on the OMAP platform. The usual
> > disclaimer comes here: this code is provided without any warranty. -+Ma=
ny
> > bugs and issues still exist. Feed-back is welcome. -+ -+This output uses
> > the yuv420_to_yuv422 conversion from Mans Rullgard, and is heavily
> > inspired from the work of Siarhei Siamashka. -+I would like to thank
> > those two persons here, without them this code would certainly not
> > exist. -+ -+Two options of the output are available: -+fb_overlay_only
> > (disabled by default): only the overlay is drawn. X11 stuff is ignored.=
=20
> > -+dbl_buffer (disabled by default): add double buffering. Some tearsync
> > flags are probably missing in the code. -+ -+Syntax is the following:=
=20
> > -+mplayer -ao alsa -vo omapfb /test.avi -+mplayer -nosound -vo
> > omapfb:fb_overlay_only:dbl_buffer /test.avi -+ -+You need to have two
> > planes on your system. On beagleboard, it means something like:
> > video=3Domapfb:vram:2M,vram:4M -+ -+Known issues: -+1) A green line or =
some
> > vertical lines (if mplayer decides to draw bands instead of frame) may
> > appear. -+It's an interpolation bug in the color conversion that needs =
to
> > be fixed -+ -+2) The color conversion accepts only 16-pixel multiple for
> > width and height. -+ -+3) The scaling down is disabled as the scaling
> > down kernel patch for the OMAP3 platform doesn't seem to work yet. -+ -+
> > * This program is free software; you can redistribute it and/or modify =
-+
> > * it under the terms of the GNU General Public License as published by =
-+
> > * the Free Software Foundation; either version 2 of the License, or -+ *
> > (at your option) any later version. -+ * -+ * This program is distribut=
ed
> > in the hope that it will be useful, -+ * but WITHOUT ANY WARRANTY;
> > without even the implied warranty of -+ * MERCHANTABILITY or FITNESS FOR
> > A PARTICULAR PURPOSE.  See the -+ * GNU General Public License for more
> > details. -+ * -+ * You should have received a copy of the GNU General
> > Public License -+ * along with this program; if not, write to the Free
> > Software -+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
> > 02110-1301 USA -+*/ -+ -+#include <stdio.h> -+#include <stdlib.h>=20
> > -+#include <string.h> -+#include <fcntl.h> -+#include <unistd.h>=20
> > -+#include <errno.h> -+ -+#include <sys/mman.h> -+#include <sys/ioctl.h=
>=20
> > -+#include <linux/fb.h> -+ -+#include "config.h" -+#include
> > "video_out.h" -+#include "video_out_internal.h" -+#include
> > "fastmemcpy.h" -+#include "sub/sub.h" -+#include "mp_msg.h" -+#include
> > "omapfb.h" -+#include "x11_common.h" -+ -+#include
> > "libswscale/swscale.h" -+#include "libmpcodecs/vf_scale.h" -+#include
> > "libavcodec/avcodec.h" -+ -+#include "aspect.h" -+ -+#include
> > "subopt-helper.h" -+ -+#include <X11/Xlib.h> -+#include <X11/Xutil.h>=
=20
> > -+#include <X11/Xatom.h> -+#include "wskeys.h" -+ -+static vo_info_t in=
fo
> > =3D { -+	"omapfb video driver", -+	"omapfb", -+	"", -+	"" -+}; -+=20
> > -+LIBVO_EXTERN(omapfb) -+ -+static int fb_overlay_only =3D 0; // if set=
, we
> > need only framebuffer overlay, but do not need any x11 code -+static int
> > dbl_buffer =3D 0; -+static int fullscreen_flag =3D 0; -+static int
> > plane_ready =3D 0; -+static uint32_t drwX, drwY; -+ -+extern void
> > yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v, int =
w,
> > int h, int yw, int cw, int dw); -+static struct fb_var_screeninfo
> > sinfo_p0; -+static struct fb_var_screeninfo sinfo; -+static struct
> > fb_var_screeninfo sinfo2; -+static struct fb_fix_screeninfo finfo;=20
> > -+static struct omapfb_mem_info minfo; -+static struct omapfb_plane_info
> > pinfo; -+static int xoff, yoff; -+ -+static struct { -+    unsigned x; =
-+
> > unsigned y; -+    uint8_t *buf; -+} fb_pages[2]; -+static int dev_fd =3D
> > -1; -+static int fb_page_flip =3D 0; -+static int page =3D 0; -+static =
void
> > omapfb_update(int x, int y, int out_w, int out_h, int show); -+ -+extern
> > void mplayer_put_key( int code ); -+#include "input/keycodes.h" -+=20
> > -+#define TRANSPARENT_COLOR_KEY 0xff0 -+ -+static Display *display =3D
> > NULL; // pointer to X Display structure. -+static int screen_num; //
> > number of screen to place the window on. -+static Window win =3D 0;=20
> > -+static Window parent =3D 0; // pointer to the newly created window. -=
+=20
> > -+/* This is used to intercept window closing requests.  */ -+static At=
om
> > wm_delete_window; -+ -+ -+void vo_calc_drwXY(uint32_t *drwX, uint32_t
> > *drwY) -+{ -+    *drwX =3D *drwY =3D 0; -+    if (vo_fs) { -+
> > aspect(&vo_dwidth, &vo_dheight, A_ZOOM); -+        vo_dwidth  =3D
> > FFMIN(vo_dwidth, vo_screenwidth); -+        vo_dheight =3D
> > FFMIN(vo_dheight, vo_screenheight); -+        *drwX      =3D
> > (vo_screenwidth - vo_dwidth) / 2; -+        *drwY      =3D (vo_screenhe=
ight
> > - vo_dheight) / 2; -+        mp_msg(MSGT_VO, MSGL_V, "[vo-fs] dx: %d dy:
> > %d dw: %d dh: %d\n", -+               *drwX, *drwY, vo_dwidth,
> > vo_dheight); -+    } else if (WinID =3D=3D 0) { -+        *drwX =3D vo_=
dx; -+
> > *drwY =3D vo_dy; -+    } -+} -+ -+static void getPrimaryPlaneInfo() -+{=
 -+
> > int dev_fd =3D open("/dev/fb0", O_RDWR); -+ -+    if (dev_fd =3D=3D -1)=
 { -+
> > mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb0\n"); -+
> > return -1; -+    } -+ -+    ioctl(dev_fd, FBIOGET_VSCREENINFO,
> > &sinfo_p0); -+    close(dev_fd); -+} -+ -+/** -+ * Function to get the
> > offset to be used when in windowed mode -+ * or when using -wid option =
-+
> > */ -+static void x11_get_window_abs_position(Display *display, Window
> > window, -+                                             int *wx, int *wy,
> > int *ww, int *wh) -+{ -+    Window root, parent; -+    Window *child; -+
> > unsigned int n_children; -+    XWindowAttributes attribs; -+ -+    /* G=
et
> > window attributes */ -+    XGetWindowAttributes(display, window,
> > &attribs); -+ -+    /* Get relative position of given window */ -+    *=
wx
> > =3D attribs.x; -+    *wy =3D attribs.y; -+    if (ww) -+        *ww =3D
> > attribs.width; -+    if (wh) -+        *wh =3D attribs.height; -+ -+   =
 /*
> > Query window tree information */ -+    XQueryTree(display, window, &roo=
t,
> > &parent, &child, &n_children); -+    if (parent) -+    { -+      int x,
> > y; -+      /* If we have a parent we must go there and discover his
> > position*/ -+      x11_get_window_abs_position(display, parent, &x, &y,
> > NULL, NULL); -+      *wx +=3D x; -+      *wy +=3D y; -+    } -+ -+    /=
* If
> > we had children, free it */ -+    if(n_children) -+        XFree(child)=
;=20
> > -+} -+ -+static void x11_check_events(void) -+{ -+    int e =3D
> > vo_x11_check_events(mDisplay); -+ -+    if (e & VO_EVENT_RESIZE) -+
> > vo_calc_drwXY(&drwX, &drwY); -+ -+    if (e & VO_EVENT_EXPOSE || e &
> > VO_EVENT_RESIZE) -+    { -+        vo_xv_draw_colorkey(drwX, drwY,
> > vo_dwidth - 1, vo_dheight - 1); -+        omapfb_update(0, 0, 0, 0, 1);=
=20
> > -+    } -+} -+ -+static void x11_uninit() -+{ -+    if (display) { -+
> > XCloseDisplay(display); -+        display =3D NULL; -+    } -+} -+ -+/*=
* -+
> > * Initialize framebuffer -+ */ -+static int preinit(const char *arg) -+=
{=20
> > -+    opt_t subopts[] =3D { -+        {"fb_overlay_only", OPT_ARG_BOOL,
> > &fb_overlay_only, NULL}, -+        {"dbl_buffer", OPT_ARG_BOOL,
> > &dbl_buffer, NULL}, -+        {NULL} -+    }; -+ -+    if
> > (subopt_parse(arg, subopts) !=3D 0) { -+        mp_msg(MSGT_VO, MSGL_FA=
TAL,
> > "[omapfb] unknown suboptions: %s\n", arg); -+        return -1; -+    }=
=20
> > -+ -+    getPrimaryPlaneInfo(); -+    dev_fd =3D open("/dev/fb1", O_RDW=
R);=20
> > -+ -+    if (dev_fd =3D=3D -1) { -+        mp_msg(MSGT_VO, MSGL_FATAL,
> > "[omapfb] Error /dev/fb1\n"); -+        return -1; -+    } -+ -+
> > ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo); -+    ioctl(dev_fd,
> > OMAPFB_QUERY_PLANE, &pinfo); -+    ioctl(dev_fd, OMAPFB_QUERY_MEM,
> > &minfo); -+ -+    if (!fb_overlay_only && !vo_init()) -+    { -+
> > mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Could not open X, overlay
> > only...\n"); -+        fb_overlay_only =3D 1; -+    } -+ -+    return 0=
;=20
> > -+} -+ -+static void omapfb_update(int x, int y, int out_w, int out_h,
> > int show) -+{ -+    int xres, yres; -+    if (!fb_overlay_only) -+
> > x11_get_window_abs_position(mDisplay, vo_window, &x, &y, &out_w,
> > &out_h); -+ -+    /* Check for new screen rotation */ -+    ioctl(dev_f=
d,
> > FBIOGET_VSCREENINFO, &sinfo2); -+    if (sinfo2.rotate !=3D
> > sinfo_p0.rotate) -+        getPrimaryPlaneInfo(); -+ -+    if ( (!x && =
!y
> > && !out_w && !out_h) || -+        (out_w < sinfo.xres_virtual / 4) ||
> > (out_h < sinfo.yres_virtual / 4) ||  /* HW can't scale down by more than
> > 4x */ -+        (out_w > sinfo.xres_virtual * 8) || (out_h >
> > sinfo.yres_virtual * 8) ) { /* HW can't scale up by more than 8x */ -+
> > pinfo.enabled =3D 0; -+        pinfo.pos_x =3D 0; -+        pinfo.pos_y=
 =3D 0;=20
> > -+        ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo); -+        return; =
-+
> > } -+ -+    xres =3D sinfo.xres_virtual; -+    yres =3D sinfo.yres_virtu=
al;=20
> > -+ -+    /* Handle clipping: if the left or top edge of the window goes=
=20
> > -+     * offscreen, clamp the overlay to the left or top edge of the -+
> > * screen, and set the difference into the frame offset. Also -+     *
> > decrease the overlay size by the offset. The offset must -+     * take
> > window scaling into account as well. -+     * -+     * Likewise, if the
> > right or bottom edge of the window goes -+     * offscreen, clamp the
> > overlay to the right or bottom edge of -+     * the screen, and decrease
> > the overlay size accordingly. The -+     * hardware will truncate the
> > output accordingly, so no offset -+     * is needed. Also take window
> > scaling into account.  -- hyc -+     */ -+    if (x < 0) { -+        /*
> > clamp to left edge */ -+        xoff =3D -x; -+        if (out_w !=3D
> > sinfo.xres_virtual) { -+            /* account for scaling */ -+
> > xoff *=3D sinfo.xres_virtual; -+            xoff /=3D out_w; -+        =
} -+
> > xres -=3D xoff; -+        out_w +=3D x; -+        x =3D 0; -+    } else=
 { -+
> > xoff =3D 0; -+        if (x + out_w > sinfo_p0.xres) { -+            /*
> > clamp to right edge */ -+            int diff =3D sinfo_p0.xres - x; -+
> > if (out_w !=3D sinfo.xres_virtual) { -+                /* account for
> > scaling */ -+                xres =3D diff * sinfo.xres_virtual; -+
> > xres /=3D out_w; -+            } else { -+                xres =3D diff=
; -+
> > } -+            out_w =3D diff; -+        } -+    } -+ -+    if (y < 0)=
 {=20
> > -+        /* clamp to top edge - this seldom occurs since the window -+
> > * titlebar is usually forced to stay visible -+         */ -+        yo=
ff
> > =3D -y; -+        if (out_h !=3D sinfo.yres_virtual) { -+            /*
> > account for scaling */ -+            yoff *=3D sinfo.yres_virtual; -+
> > yoff /=3D out_h; -+        } -+        yres -=3D yoff; -+        out_h =
+=3D y;=20
> > -+        y =3D 0; -+    } else { -+        yoff =3D 0; -+        if (y=
 +
> > out_h > sinfo_p0.yres) { -+            /* clamp to bottom edge */ -+
> > int diff =3D sinfo_p0.yres - y; -+            if (out_h !=3D
> > sinfo.yres_virtual) { -+                /* account for scaling */ -+
> > yres =3D diff * sinfo.yres_virtual; -+                yres /=3D out_h; =
-+
> > } else { -+                yres =3D diff; -+            } -+
> > out_h =3D diff; -+        } -+    } -+ -+    if (xoff & 1) -+
> > xoff++; -+    if (xres & 1) -+        xres--; -+ -+    pinfo.enabled =3D
> > show; -+    pinfo.pos_x =3D x; -+    pinfo.pos_y =3D y; -+    pinfo.out=
_width
> > =3D out_w; -+    pinfo.out_height =3D out_h; -+ -+    sinfo.xoffset =3D
> > fb_pages[page].x + xoff; -+    sinfo.yoffset =3D fb_pages[page].y + yof=
f;=20
> > -+    /* If we had to change the overlay dimensions, update it */ -+
> > if (xres !=3D sinfo2.xres || yres !=3D sinfo2.yres || -+        sinfo.x=
offset
> > !=3D sinfo2.xoffset || -+        sinfo.yoffset !=3D sinfo2.yoffset) { -+
> > sinfo.xres =3D xres; -+        sinfo.yres =3D yres; -+        sinfo.rot=
ate =3D
> > sinfo2.rotate; -+        ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo); -+
> > } -+ -+    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo); -+} -+ -+static i=
nt
> > config(uint32_t width, uint32_t height, uint32_t d_width, -+		uint32_t
> > d_height, uint32_t flags, char *title, -+		uint32_t format) -+{ -+
> > uint8_t *fbmem; -+    int i; -+    struct omapfb_color_key color_key; -=
+=20
> > -+    XVisualInfo vinfo; -+    XSetWindowAttributes xswa; -+
> > XWindowAttributes attribs; -+    unsigned long xswamask; -+    int
> > depth; -+ -+    Window root, parent; -+    Window *child; -+    unsigned
> > int n_children; -+ -+    fullscreen_flag =3D flags & VOFLAG_FULLSCREEN;=
 -+
> > if (!fb_overlay_only) -+    { -+        if (!title) -+            title=
 =3D
> > "MPlayer OMAPFB (X11/FB) render"; -+ -+
> > XGetWindowAttributes(mDisplay, mRootWin, &attribs); -+        depth =3D
> > attribs.depth; -+        if (depth !=3D 15 && depth !=3D 16 && depth !=
=3D 24 &&
> > depth !=3D 32) -+            depth =3D 24; -+
> > XMatchVisualInfo(mDisplay, mScreen, depth, TrueColor, &vinfo); -+ -+
> > xswa.border_pixel =3D 0; -+        xswa.background_pixel =3D xv_colorke=
y =3D
> > TRANSPARENT_COLOR_KEY; -+ -+        xswamask =3D CWBackPixel |
> > CWBorderPixel; -+        xv_ck_info.method =3D CK_METHOD_BACKGROUND; -+=
 -+
> > vo_x11_create_vo_window(&vinfo, vo_dx, vo_dy, vo_dwidth, vo_dheight, -+
> > flags, CopyFromParent, "omapfb", title); -+
> > XChangeWindowAttributes(mDisplay, vo_window, xswamask, &xswa); -+ -+
> > /* Need to receive events on the parent window -- so when it is -+
> > moved / resized / etc., we know. */ -+        if(WinID > 0) -+        {=
=20
> > -+            /* Query window tree information */ -+
> > XQueryTree(mDisplay, vo_window, &root, &parent, &child, &n_children); -+
> > if (n_children) -+                XFree(child); -+ -+
> > XUnmapWindow(mDisplay, vo_window); -+            if (parent) -+
> > XSelectInput(mDisplay, parent, StructureNotifyMask); -+
> > XMapWindow(mDisplay, vo_window); -+        } -+ -+
> > vo_calc_drwXY(&drwX, &drwY); -+        vo_xv_draw_colorkey(drwX, drwY,
> > vo_dwidth - 1, vo_dheight - 1); -+    } -+ -+    fbmem =3D mmap(NULL,
> > minfo.size, PROT_READ|PROT_WRITE, MAP_SHARED, dev_fd, 0); -+    if (fbm=
em
> > =3D=3D MAP_FAILED) { -+        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Er=
ror
> > mmap\n"); -+        return -1; -+    } -+ -+    for (i =3D 0; i <
> > minfo.size / 4; i++) -+        ((uint32_t*)fbmem)[i] =3D 0x80008000; -+=
 -+
> > sinfo.xres =3D width & ~15; -+    sinfo.yres =3D height & ~15; -+
> > sinfo.xoffset =3D 0; -+    sinfo.yoffset =3D 0; -+    sinfo.nonstd =3D
> > OMAPFB_COLOR_YUY422; -+ -+    fb_pages[0].x =3D 0; -+    fb_pages[0].y =
=3D
> > 0; -+    fb_pages[0].buf =3D fbmem; -+ -+    if (dbl_buffer && minfo.si=
ze
> > >=3D sinfo.xres * sinfo.yres * 2) { -+        sinfo.xres_virtual =3D
> > sinfo.xres; -+        sinfo.yres_virtual =3D sinfo.yres * 2; -+
> > fb_pages[1].x =3D 0; -+        fb_pages[1].y =3D sinfo.yres; -+
> > fb_pages[1].buf =3D fbmem + sinfo.xres * sinfo.yres * 2; -+
> > fb_page_flip =3D 1; -+    } else { -+        sinfo.xres_virtual =3D
> > sinfo.xres; -+        sinfo.yres_virtual =3D sinfo.yres; -+
> > fb_page_flip =3D 0; -+    } -+ -+    ioctl(dev_fd, FBIOPUT_VSCREENINFO,
> > &sinfo); -+    ioctl(dev_fd, FBIOGET_FSCREENINFO, &finfo); -+ -+    if
> > (WinID <=3D 0) { -+        if (fullscreen_flag) { -+
> > omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1); -+        } else =
{=20
> > -+            omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2,
> > sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1); -+
> > } -+    } -+ -+    color_key.channel_out =3D OMAPFB_CHANNEL_OUT_LCD; -+
> > color_key.background =3D 0x0; -+    color_key.trans_key =3D
> > TRANSPARENT_COLOR_KEY; -+    if (fb_overlay_only) -+
> > color_key.key_type =3D OMAPFB_COLOR_KEY_DISABLED; -+    else -+
> > color_key.key_type =3D OMAPFB_COLOR_KEY_GFX_DST; -+    ioctl(dev_fd,
> > OMAPFB_SET_COLOR_KEY, &color_key); -+ -+    plane_ready =3D 1; -+    re=
turn
> > 0; -+} -+ -+static void draw_alpha(int x0, int y0, int w, int h, unsign=
ed
> > char *src, unsigned char *srca, int stride) -+{ -+
> > vo_draw_alpha_yuy2(w, h, src, srca, stride, fb_pages[page].buf + y0 *
> > finfo.line_length + x0 * 2, finfo.line_length); -+} -+ -+static void
> > draw_osd(void) -+{ -+    vo_draw_text(sinfo.xres, sinfo.yres,
> > draw_alpha); -+} -+ -+static int draw_frame(uint8_t *src[]) -+{ -+
> > return 1; -+} -+ -+static int draw_slice(uint8_t *src[], int stride[],
> > int w, int h, int x, int y) -+{ -+    if (x!=3D0) -+        return 0; -=
+ -+
> > if (!plane_ready) -+        return 0; -+ -+    ioctl(dev_fd,
> > OMAPFB_SYNC_GFX); -+ -+    yuv420_to_yuv422(fb_pages[page].buf + y *
> > finfo.line_length, src[0], src[1], src[2], w & ~15, h, stride[0],
> > stride[1], finfo.line_length); -+    return 0; -+} -+ -+static void
> > flip_page(void) -+{ -+    if (fb_page_flip) { -+        sinfo.xoffset =
=3D
> > fb_pages[page].x + xoff; -+        sinfo.yoffset =3D fb_pages[page].y +
> > yoff; -+        ioctl(dev_fd, FBIOPAN_DISPLAY, &sinfo); -+        page =
^=3D
> > fb_page_flip; -+    } -+} -+ -+static int query_format(uint32_t format)=
=20
> > -+{ -+    // For simplicity pretend that we can only do YV12, support
> > for -+    // other formats can be added quite easily if/when needed -+
> > if (format !=3D IMGFMT_YV12) -+        return 0; -+ -+    return
> > VFCAP_CSP_SUPPORTED | VFCAP_CSP_SUPPORTED_BY_HW | VFCAP_OSD |
> > VFCAP_SWSCALE | VFCAP_ACCEPT_STRIDE; -+} -+ -+ -+/** -+ * Uninitialize
> > framebuffer -+ */ -+static void uninit() -+{ -+    pinfo.enabled =3D 0;=
 -+
> > ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo); -+ -+    if (!fb_overlay_onl=
y)
> > { -+        struct omapfb_color_key color_key; -+
> > color_key.channel_out =3D OMAPFB_CHANNEL_OUT_LCD; -+
> > color_key.key_type =3D OMAPFB_COLOR_KEY_DISABLED; -+        ioctl(dev_f=
d,
> > OMAPFB_SET_COLOR_KEY, &color_key); -+    } -+ -+    close(dev_fd); -+ -+
> > if (!fb_overlay_only) -+        x11_uninit(); -+} -+ -+ -+static int
> > control(uint32_t request, void *data, ...) -+{ -+    switch (request) {=
=20
> > -+        case VOCTRL_QUERY_FORMAT: -+            return
> > query_format(*((uint32_t*)data)); -+        case VOCTRL_FULLSCREEN: { -+
> > if (WinID > 0) return VO_FALSE; -+            if (fullscreen_flag) { -+
> > if (!fb_overlay_only) -+                    vo_x11_fullscreen(); -+
> > fullscreen_flag =3D 0; -+                omapfb_update(sinfo_p0.xres / =
2 -
> > sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres,
> > sinfo.yres, 1); -+            } else { -+                if
> > (!fb_overlay_only) -+                    vo_x11_fullscreen(); -+
> > fullscreen_flag =3D 1; -+                omapfb_update(0, 0, sinfo_p0.x=
res,
> > sinfo_p0.yres, 1); -+            } -+            return VO_TRUE; -+
> > } -+        case VOCTRL_UPDATE_SCREENINFO: -+
> > update_xinerama_info(); -+            return VO_TRUE; -+    } -+
> > return VO_NOTIMPL; -+} -+ -+ -+static void check_events(void) -+{ -+
> > if (!fb_overlay_only) -+        x11_check_events(); -+} -diff --git
> > a/libvo/yuv.S b/libvo/yuv.S -new file mode 100644 -index
> > 0000000..1cd2c1d ---- /dev/null -+++ b/libvo/yuv.S -@@ -0,0 +1,170 @@=
=20
> > -+/* -+    Copyright (C) 2008 Mans Rullgard -+ -+    Permission is here=
by
> > granted, free of charge, to any person -+    obtaining a copy of this
> > software and associated documentation -+    files (the "Software"), to
> > deal in the Software without -+    restriction, including without
> > limitation the rights to use, copy, -+    modify, merge, publish,
> > distribute, sublicense, and/or sell copies -+    of the Software, and to
> > permit persons to whom the Software is -+    furnished to do so, subject
> > to the following conditions: -+ -+    The above copyright notice and th=
is
> > permission notice shall be -+    included in all copies or substantial
> > portions of the Software. -+ -+    THE SOFTWARE IS PROVIDED "AS IS",
> > WITHOUT WARRANTY OF ANY KIND, -+    EXPRESS OR IMPLIED, INCLUDING BUT N=
OT
> > LIMITED TO THE WARRANTIES OF -+    MERCHANTABILITY, FITNESS FOR A
> > PARTICULAR PURPOSE AND -+    NONINFRINGEMENT. IN NO EVENT SHALL THE
> > AUTHORS OR COPYRIGHT -+    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > OTHER LIABILITY, -+    WHETHER IN AN ACTION OF CONTRACT, TORT OR
> > OTHERWISE, ARISING FROM, -+    OUT OF OR IN CONNECTION WITH THE SOFTWARE
> > OR THE USE OR OTHER -+    DEALINGS IN THE SOFTWARE. -+ */ -+ -+
> > .macro mov32    rd, val -+        movw            \rd, #:lower16:\val -+
> > movt            \rd, #:upper16:\val -+        .endm -+ -+        .fpu
> > neon -+        .text -+ -+@ yuv420_to_yuv422(uint8_t *yuv, uint8_t *y,
> > uint8_t *u, uint8_t *v, -+@                  int w, int h, int yw, int
> > cw, int dw) -+ -+#define yuv  r0 -+#define y    r1 -+#define u    r2=20
> > -+#define v    r3 -+#define w    r4 -+#define h    r5 -+#define yw   r6=
=20
> > -+#define cw   r7 -+#define dw   r8 -+ -+#define tyuv r9 -+#define ty
> > r10 -+#define tu   r11 -+#define tv   r12 -+#define i    lr -+ -+
> > .global yuv420_to_yuv422 -+        .func   yuv420_to_yuv422=20
> > -+yuv420_to_yuv422: -+        push            {r4-r11,lr} -+        add
> > r4,  sp,  #36 -+.Ldo_conv: -+        ldm             r4, {r4-r8} -+
> > push            {r4} -+1: -+        mov             tu,   u -+        m=
ov
> > tv,   v -+        vld1.64         {d2}, [u,:64], cw               @ u0 =
-+
> > vld1.64         {d3}, [v,:64], cw               @ v0 -+        mov
> > tyuv, yuv -+        mov             ty,   y -+        vzip.8          d=
2,
> > d3                        @ u0v0 -+        mov             i,    #16 -+=
2:
> >  -+        pld             [y, #64] -+        vld1.64         {d0, d1},
> > [y,:128], yw        @ y0 -+        pld             [u, #64] -+
> > subs            i,    i,    #4 -+        vld1.64         {d6},
> > [u,:64],  cw        @ u2 -+        pld             [y, #64] -+
> > vld1.64         {d4, d5},   [y,:128], yw        @ y1 -+        pld
> > [v, #64] -+        vld1.64         {d7},       [v,:64],  cw        @ v2=
=20
> > -+        pld             [y, #64] -+        vld1.64         {d16,d17},
> > [y,:128], yw        @ y2 -+        vzip.8          d6,   d7
> > @ u2v2 -+        pld             [u, #64] -+        vld1.64
> > {d22},      [u,:64],  cw        @ u4 -+        pld             [v, #64]=
=20
> > -+        vld1.64         {d23},      [v,:64],  cw        @ v4 -+
> > pld             [y, #64] -+        vld1.64         {d20,d21},  [y,:128],
> > yw        @ y3 -+        vmov            q9,   q3
> > @ u2v2 -+        vzip.8          d22,  d23                       @ u4v4=
=20
> > -+        vrhadd.u8       q3,   q1,   q3                  @ u1v1 -+
> > vzip.8          q0,   q1                        @ y0u0y0v0 -+        vm=
ov
> > q12,  q11                       @ u4v4 -+        vzip.8          q2,   =
q3
> > @ y1u1y1v1 -+        vrhadd.u8       q11,  q9,   q11                 @
> > u3v3 -+        vst1.64         {d0-d3},    [yuv,:128], dw      @
> > y0u0y0v0 -+        vzip.8          q8,   q9                        @
> > y2u2y2v2 -+        vst1.64         {d4-d7},    [yuv,:128], dw      @
> > y1u1y1v1 -+        vzip.8          q10,  q11                       @
> > y3u3y3v3 -+        vst1.64         {d16-d19},  [yuv,:128], dw      @
> > y2u2y2v2 -+        vmov            q1,   q12 -+        vst1.64
> > {d20-d23},  [yuv,:128], dw      @ y3u3y3v3 -+        bgt             2b=
=20
> > -+ -+        subs            w,    w,    #16 -+        add
> > yuv,  tyuv, #32 -+        add             y,    ty,   #16 -+        add
> > u,    tu,   #8 -+        add             v,    tv,   #8 -+        bgt
> > 1b -+ -+        ldr             w,    [sp] -+        subs            h,
> > h,    #16 -+        add             yuv,  yuv,  dw, lsl #4 -+        sub
> > yuv,  yuv,  w,  lsl #1 -+        add             y,    y,    yw, lsl #4=
=20
> > -+        sub             y,    y,    w -+        add             u,
> > u,    cw, lsl #3 -+        sub             u,    u,    w,  asr #1 -+
> > add             v,    v,    cw, lsl #3 -+        sub             v,    =
v,
> > w,  asr #1 -+        bgt             1b -+ -+        pop
> > {r3-r11,pc} -+        .endfunc -+ -+        .func   neon_open=20
> > -+neon_open: -+        push            {r4-r8,lr} -+        ldrd
> > r4,  r5,  [r0, #16] -+        ldrd            r6,  r7,  [r0, #24] -+
> > lsl             r8,  r4,  #1 -+        mov32           r0,  conv_params=
=20
> > -+        stm             r0,  {r4-r8} -+        mov             r0,  #=
0=20
> > -+        pop             {r4-r8,pc} -+        .endfunc -+ -+
> > .func   neon_convert -+neon_convert: -+        push
> > {r4-r11,lr} -+        ldr             r0,  [r0] -+        mov32
> > r4,  conv_params -+        ldm             r1,  {r1-r3} -+        b
> > .Ldo_conv -+        .endfunc -+ -+        .func   neon_nop -+neon_nop: =
-+
> > bx              lr -+        .endfunc -+ -+        .section .bss=20
> > -+conv_params: -+        .skip           5*4 -+        .size
> > conv_params, . - conv_params -+ -+        .section        .rodata=20
> > -+.Lname: .asciz          "neon" -+ofb_pixconv_neon: -+        .word
> > .Lname -+        .word           0               @ flags -+        .word
> > neon_open -+        .word           neon_convert -+        .word
> > neon_nop        @ finish -+        .word           neon_nop        @
> > close -+        .size           ofb_pixconv_neon, . - ofb_pixconv_neon=
=20
> > -+ -+        .section        .ofb_pixconv, "a" -+ofb_pixconv_neon_p: -+
> > .word           ofb_pixconv_neon --- -1.7.2.5 - diff --git
> > a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> > b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb index
> > 10a69a9..c24cc4a 100644 ---
> > a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb +++
> > b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb @@ -5,7 +5,7 @@
> > HOMEPAGE =3D "http://www.mplayerhq.hu/" DEPENDS =3D "libvpx live555
> > libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52
> > freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11
> > virtual/kernel libass \ ${@base_conditional('ENTERPRISE_DISTRO', '1', '=
',
> > 'libmad liba52 lame', d)}"
> >=20
> > -#RDEPENDS_${PN} =3D "mplayer-common" +RDEPENDS_${PN} =3D "mplayer-comm=
on"=20
> > PROVIDES =3D "mplayer" RPROVIDES_${PN} =3D "mplayer" RCONFLICTS_${PN} =
=3D
> > "mplayer" @@ -17,10 +17,6 @@ SRC_URI =3D
> > "git://repo.or.cz/mplayer.git;protocol=3Dgit;branch=3Dmaster \=20
> > file://cross.compile.codec-cfg.patch \ "
> >=20
> > -SRC_URI_append_aarmv7a =3D " \ -
> > file://0001-video-out-for-omapfb-support.patch \ -	  " - SRCREV =3D
> > "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
> >=20
> > ARM_INSTRUCTION_SET =3D "ARM" @@ -40,9 +36,6 @@ CONFFILES_${PN} +=3D
> > "/usr/etc/mplayer/input.conf \
> >=20
> > inherit autotools pkgconfig
> >=20
> > -# We want a kernel header for armv7a, but we don't want to make mplayer
> > machine specific for that -STAGING_KERNEL_DIR =3D
> > "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel" -=
=20
> > EXTRA_OECONF =3D " \ --prefix=3D/usr \ --mandir=3D${mandir} \ @@ -135,2=
1 +128,9
> > @@ EXTRA_OECONF =3D " \ --extra-libs=3D' -lXext -lX11 -lBasicUsageEnvir=
onment
> > -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++' \ "
> >=20
> > -EXTRA_OECONF_append_armv6 =3D " --enable-armv6"=20
> > -EXTRA_OECONF_append_armv7a =3D " --enable-armv6 --enable-neon" -=20
> > FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O4 -ffast-math" -FULL_OPTIMIZATION_armv7a =3D
> > "-fexpensive-optimizations  -ftree-vectorize -fomit-frame-pointer -O4
> > -ffast-math" BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> >=20
> > -do_configure_prepend_armv7a() { -	cp
> > ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h
> > ${S}/libvo/omapfb.h || true -	cp
> > ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h
> > ${S}/libvo/omapfb.h || true -	cp
> > ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S}/libvo/omapfb.h || tru=
e=20
> > -	cp ${STAGING_DIR_TARGET}/kernel/include/linux/omapfb.h
> > ${S}/libvo/omapfb.h || true -	sed -e 's/__user//g' -i ${S}/libvo/omapfb=
=2Eh
> > || true -} - CFLAGS_append =3D " -I${S}/libdvdread4 "
> >=20
> > do_configure() {
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk7V9jEACgkQMkyGM64RGpGvFgCgmauFl5GYmdtr9KDc69Yu68A4
> cAcAn3eIhQeqzypd4tHVsq1d1CJz4FyV
> =3D+jxs
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7V+BAACgkQN1Ujt2V2gBxPUQCfUfPvMpvZfMvRij1ic7nhX8do
mTMAoItggpvh8G207a5D4K27zYTEBVWt
=6fKU
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
