Received: from [216.168.135.167] (helo=sanddollar.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MGxHI-0008TL-98
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 17:42:22 +0200
Received: (qmail 7639 invoked by uid 1003); 17 Jun 2009 15:31:51 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 17 Jun 2009 15:31:50 -0000
Message-ID: <4A390C65.7000007@balister.org>
Date: Wed, 17 Jun 2009 11:31:49 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1245236406-21118-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1245236406-21118-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] mplayer: reenable vo_omapfb patch
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
X-Groupsio-MsgNum: 11325
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms090403080508050405030607"

--------------ms090403080508050405030607
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Koen Kooi wrote:
> From: Gregoire Gentil <gregoire@gentil.com>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/mplayer/files/omapfb.patch |   19 +++
>  recipes/mplayer/files/vo_omapfb.c  |  269 ++++++++++-------------------------
>  recipes/mplayer/mplayer_svn.bb     |    6 +-
>  3 files changed, 100 insertions(+), 194 deletions(-)
> 
> diff --git a/recipes/mplayer/files/omapfb.patch b/recipes/mplayer/files/omapfb.patch
> index 860cf07..2356d80 100644
> --- a/recipes/mplayer/files/omapfb.patch
> +++ b/recipes/mplayer/files/omapfb.patch
> @@ -8,3 +8,22 @@
>   extern vo_functions_t video_out_svga;
>   extern vo_functions_t video_out_png;
>   extern vo_functions_t video_out_ggi;
> +@@ -177,6 +178,7 @@
> + #ifdef CONFIG_FBDEV
> +         &video_out_fbdev,
> +         &video_out_fbdev2,
> ++        &video_out_omapfb,
> + #endif
> + #ifdef CONFIG_SVGALIB
> +         &video_out_svga,
> +--- a/Makefile	2009-02-03 13:45:48.000000000 -0800
> ++++ b/Makefile	2009-02-03 13:45:50.000000000 -0800
> +@@ -551,7 +551,7 @@
> + SRCS_MPLAYER-$(DXR2)         += libao2/ao_dxr2.c libvo/vo_dxr2.c
> + SRCS_MPLAYER-$(DXR3)         += libvo/vo_dxr3.c
> + SRCS_MPLAYER-$(ESD)          += libao2/ao_esd.c
> +-SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c
> ++SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c libvo/vo_omapfb.c libvo/yuv.S
> + SRCS_MPLAYER-$(GGI)          += libvo/vo_ggi.c
> + SRCS_MPLAYER-$(GIF)          += libvo/vo_gif89a.c
> + SRCS_MPLAYER-$(GL)           += libvo/gl_common.c libvo/vo_gl.c libvo/vo_gl2.c
> diff --git a/recipes/mplayer/files/vo_omapfb.c b/recipes/mplayer/files/vo_omapfb.c
> index 5a43404..127e550 100644
> --- a/recipes/mplayer/files/vo_omapfb.c
> +++ b/recipes/mplayer/files/vo_omapfb.c
> @@ -58,8 +58,8 @@ It's an interpolation bug in the color conversion that needs to be fixed
>  #include "fastmemcpy.h"
>  #include "sub.h"
>  #include "mp_msg.h"
> -
>  #include "omapfb.h"
> +#include "x11_common.h"
>  
>  #include "libswscale/swscale.h"
>  #include "libmpcodecs/vf_scale.h"
> @@ -87,10 +87,12 @@ static int fb_overlay_only = 0; // if set, we need only framebuffer overlay, but
>  static int dbl_buffer = 0;
>  static int fullscreen_flag = 0;
>  static int plane_ready = 0;
> +static uint32_t drwX, drwY;
>  
>  extern void yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v, int w, int h, int yw, int cw, int dw);
>  static struct fb_var_screeninfo sinfo_p0;
>  static struct fb_var_screeninfo sinfo;
> +static struct fb_fix_screeninfo finfo;
>  static struct omapfb_mem_info minfo;
>  static struct omapfb_plane_info pinfo;
>  static struct {
> @@ -155,155 +157,20 @@ static void x11_get_window_abs_position(Display *display, Window window,
>          XFree(child);
>  }
>  
> -
> -/**
> - * Function that controls fullscreen state for x11 window
> - * action = 1 (set fullscreen)
> - * action = 0 (set windowed mode)
> - */
> -static void x11_set_fullscreen_state(Display *display, Window window, int action)
> -{
> -    XEvent xev;
> -
> -    /* init X event structure for _NET_WM_FULLSCREEN client msg */
> -    xev.xclient.type = ClientMessage;
> -    xev.xclient.serial = 0;
> -    xev.xclient.send_event = True;
> -    xev.xclient.message_type = XInternAtom(display, "_NET_WM_STATE", False);
> -    xev.xclient.window = window;
> -    xev.xclient.format = 32;
> -    xev.xclient.data.l[0] = action;
> -    xev.xclient.data.l[1] = XInternAtom(display, "_NET_WM_STATE_FULLSCREEN", False);
> -    xev.xclient.data.l[2] = 0;
> -    xev.xclient.data.l[3] = 0;
> -    xev.xclient.data.l[4] = 0;
> -
> -    /* finally send that damn thing */
> -    if (!XSendEvent(display, DefaultRootWindow(display), False, SubstructureRedirectMask | SubstructureNotifyMask, &xev)) {
> -        mp_msg(MSGT_VO, MSGL_ERR, "[omapfb] failure in x11_set_fullscreen_state\n");
> -        exit(1);
> -    }
> -    XSync(display, False);
> -}
> -
> -
> -XClassHint classhint = {"mediaplayer-ui", "mediaplayer-ui"};
> -
> -
> -/**
> - * Initialize x11 window (it is used to allocate some screen area for framebuffer overlay)
> - */
> -static void x11_init()
> +static void x11_check_events(void)
>  {
> -    display = XOpenDisplay(getenv("DISPLAY"));
> -    if (display == NULL) {
> -        mp_msg(MSGT_VO, MSGL_ERR, "[omapfb] failure in x11_init, can't open display\n");
> -        exit(1);
> -    }
> +    int e = vo_x11_check_events(mDisplay);
>  
> -    screen_num = DefaultScreen(display);
> +    if (e & VO_EVENT_RESIZE)
> +        vo_calc_drwXY(&drwX, &drwY);
>  
> -    if (WinID > 0)
> +    if (e & VO_EVENT_EXPOSE || e & VO_EVENT_RESIZE)
>      {
> -        Window root;
> -        Window *child;
> -        unsigned int n_children;
> -
> -        win = WinID;
> -
> -        /* Query window tree information */
> -        XQueryTree(display, win, &root, &parent, &child, &n_children);
> -        if (n_children)
> -            XFree(child);
> -
> -        XUnmapWindow(display, win);
> -        if (parent)
> -            XSelectInput(display, parent, StructureNotifyMask);
> -        XMapWindow(display, win);
> -
> -        wm_delete_window = XInternAtom(display, "WM_DELETE_WINDOW", False);
> -        XSetWMProtocols(display, win, &wm_delete_window, 1);
> -    } else {
> -        win = XCreateSimpleWindow(display, RootWindow(display, screen_num),
> -                                  sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 0,
> -                                  WhitePixel(display, screen_num),
> -                                  TRANSPARENT_COLOR_KEY);
> -
> -        XSetClassHint(display, win, &classhint);
> -
> -        XStoreName(display, win, "MPlayer");
> -        XMapWindow(display, win);
> -
> -        /* Set WM_DELETE_WINDOW atom in WM_PROTOCOLS property (to get window_delete requests).  */
> -        wm_delete_window = XInternAtom(display, "WM_DELETE_WINDOW", False);
> -        XSetWMProtocols(display, win, &wm_delete_window, 1);
> -        XSelectInput(display, win, StructureNotifyMask | KeyPressMask);
> -    }
> -}
> -
> -
> -void print_properties(Window win2)
> -{
> -	Atom *p;
> -	int num, j;
> -	char *aname;
> -	Atom type;
> -	int format;
> -	unsigned long nitems, bytes_after;
> -	unsigned char *ret = NULL;
> -
> -	p = XListProperties(display, win2, &num);
> -	printf("found %d properties for window %d\n", num, (int)win2);
> -	for (j = 0; j < num; j++) {
> -		aname = XGetAtomName(display, p[j]);
> -		if (aname) {
> -			if(Success == XGetWindowProperty(display, win2, XInternAtom(display, aname, False),
> -						0L, ~0L, False, XA_STRING,
> -						&type, &format, &nitems,
> -						&bytes_after, &ret))
> -			{
> -/*				printf("format = %d, nitems = %d, bytes_after = %d\n", format, nitems, bytes_after);*/
> -				printf("%s = %s\n", aname, ret);
> -				XFree(ret);
> -			}
> -			XFree(aname);
> -		} else printf("NULL\n");
> -	}
> -	XFree(p);
> -}
> -
> -
> -static int x11_check_events()
> -{
> -    if (!display) {
> -        mp_msg(MSGT_VO, MSGL_ERR, "[omapfb] 'x11_check_events' called out of sequence\n");
> -        exit(1);
> -    }
> -
> -    int ret = 0;
> -    XEvent Event;
> -    while (XPending(display)) {
> -        XNextEvent(display, &Event);
> -        if (Event.type == UnmapNotify)
> -            omapfb_update(0, 0, 0, 0, 0);
> -        else if ((Event.type == MapNotify) || (Event.type == ConfigureNotify))
> -            omapfb_update(0, 0, 0, 0, 1);
> -        else if (Event.type == KeyPress) {
> -            int key;
> -            KeySym keySym = XKeycodeToKeysym(display, Event.xkey.keycode, 0);
> -            key = ((keySym & 0xff00) != 0 ? ((keySym & 0x00ff) + 256) : (keySym));
> -            ret |= VO_EVENT_KEYPRESS;
> -            vo_x11_putkey(key);
> -        } else if (Event.type == ClientMessage) {
> -            if ((Atom)Event.xclient.data.l[0] == wm_delete_window) {
> -                mplayer_put_key(KEY_ESC);
> -            }
> -        }
> +        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
> +        omapfb_update(0, 0, 0, 0, 1);
>      }
> -    return ret;
>  }
>  
> -
>  static void x11_uninit()
>  {
>      if (display) {
> @@ -312,13 +179,11 @@ static void x11_uninit()
>      }
>  }
>  
> -
>  /**
>   * Initialize framebuffer
>   */
>  static int preinit(const char *arg)
>  {
> -
>      opt_t subopts[] = {
>          {"fb_overlay_only", OPT_ARG_BOOL, &fb_overlay_only, NULL},
>          {"dbl_buffer", OPT_ARG_BOOL, &dbl_buffer, NULL},
> @@ -351,49 +216,28 @@ static int preinit(const char *arg)
>      ioctl(dev_fd, OMAPFB_QUERY_PLANE, &pinfo);
>      ioctl(dev_fd, OMAPFB_QUERY_MEM, &minfo);
>  
> -    if (!fb_overlay_only)
> -        x11_init();
> +    if (!fb_overlay_only && !vo_init())
> +    {
> +        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Could not open X, overlay only...\n");        
> +        fb_overlay_only = 1;
> +    }
>  
>      return 0;
>  }
>  
> -
>  static void omapfb_update(int x, int y, int out_w, int out_h, int show)
>  {
>      if (!fb_overlay_only)
> -        x11_get_window_abs_position(display, win, &x, &y, &out_w, &out_h);
> -
> -    if ((x < 0) || (y < 0)
> -
> -// If you develop the right scaling-down patch in kernel, uncomment the line below and comment the next one
> -//        || (out_w < sinfo.xres / 4) || (out_h < sinfo.yres / 4)
> -        || (out_w < sinfo.xres) || (out_h < sinfo.yres)
> -
> -// If you don't have the right scaling-up patch in kernel, comment the line below and uncomment the next one
> -/* Kernel patch to enable scaling up on the omap3
> -======================================================
> ---- a/drivers/video/omap/dispc.c	2008-11-01 20:08:04.000000000 -0700
> -+++ b/drivers/video/omap/dispc.c	2008-11-01 20:09:02.000000000 -0700
> -@@ -523,9 +523,6 @@
> - 	if ((unsigned)plane > OMAPFB_PLANE_NUM)
> - 		return -ENODEV;
> - 
> --	if (out_width != orig_width || out_height != orig_height)
> --		return -EINVAL;
> --
> - 	enable_lcd_clocks(1);
> - 	if (orig_width < out_width) {
> - 		/*
> -======================================================
> -*/
> -        || (out_w > sinfo.xres * 8) || (out_h > sinfo.yres * 8)
> -//        || (out_w > sinfo.xres) || (out_h > sinfo.yres)
> +        x11_get_window_abs_position(mDisplay, vo_window, &x, &y, &out_w, &out_h);
>  
> -        || (x + out_w > sinfo_p0.xres) || (y + out_h > sinfo_p0.yres)) {
> +    if (x < 0 || y < 0 || (x + out_w > sinfo_p0.xres) || (y + out_h > sinfo_p0.yres) || /* Clipping not currently supported */
> +        (out_w < sinfo.xres / 4) || (out_h < sinfo.yres / 4) ||  /* HW can't scale down by more than 4x */
> +        (out_w > sinfo.xres * 8) || (out_h > sinfo.yres * 8) ) { /* HW can't scale up by more than 8x */
>          pinfo.enabled = 0;
>          pinfo.pos_x = 0;
>          pinfo.pos_y = 0;
>          ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
> +        ioctl(dev_fd, FBIOGET_FSCREENINFO, &finfo);
>          return;
>      }
>  
> @@ -403,9 +247,9 @@ static void omapfb_update(int x, int y, int out_w, int out_h, int show)
>      pinfo.out_width  = out_w;
>      pinfo.out_height = out_h;
>      ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
> +    ioctl(dev_fd, FBIOGET_FSCREENINFO, &finfo);
>  }
>  
> -
>  static int config(uint32_t width, uint32_t height, uint32_t d_width,
>  		uint32_t d_height, uint32_t flags, char *title,
>  		uint32_t format)
> @@ -414,7 +258,56 @@ static int config(uint32_t width, uint32_t height, uint32_t d_width,
>      int i;
>      struct omapfb_color_key color_key;
>  
> +    XVisualInfo vinfo;
> +    XSetWindowAttributes xswa;
> +    XWindowAttributes attribs;
> +    unsigned long xswamask;
> +    int depth;
> +
> +    Window root, parent;
> +    Window *child;
> +    unsigned int n_children;
> +
>      fullscreen_flag = flags & VOFLAG_FULLSCREEN;
> +    if (!fb_overlay_only)
> +    {
> +        if (!title)
> +            title = "MPlayer OMAPFB (X11/FB) render";
> +
> +        XGetWindowAttributes(mDisplay, mRootWin, &attribs);
> +        depth = attribs.depth;
> +        if (depth != 15 && depth != 16 && depth != 24 && depth != 32)
> +            depth = 24;
> +        XMatchVisualInfo(mDisplay, mScreen, depth, TrueColor, &vinfo);
> +
> +        xswa.border_pixel = 0;
> +        xswa.background_pixel = xv_colorkey = TRANSPARENT_COLOR_KEY;
> +
> +        xswamask = CWBackPixel | CWBorderPixel;
> +        xv_ck_info.method = CK_METHOD_BACKGROUND;
> +
> +        vo_x11_create_vo_window(&vinfo, vo_dx, vo_dy, vo_dwidth, vo_dheight,
> +                                flags, CopyFromParent, "omapfb", title);
> +        XChangeWindowAttributes(mDisplay, vo_window, xswamask, &xswa);
> +
> +        /* Need to receive events on the parent window -- so when it is
> +           moved / resized / etc., we know. */
> +        if(WinID > 0)
> +        {
> +            /* Query window tree information */
> +            XQueryTree(mDisplay, vo_window, &root, &parent, &child, &n_children);
> +            if (n_children)
> +                XFree(child);
> +
> +            XUnmapWindow(mDisplay, vo_window);
> +            if (parent)
> +                XSelectInput(mDisplay, parent, StructureNotifyMask);
> +            XMapWindow(mDisplay, vo_window);
> +        }
> +
> +        vo_calc_drwXY(&drwX, &drwY);
> +        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
> +    }
>  
>      fbmem = mmap(NULL, minfo.size, PROT_READ|PROT_WRITE, MAP_SHARED, dev_fd, 0);
>      if (fbmem == MAP_FAILED) {
> @@ -452,12 +345,8 @@ static int config(uint32_t width, uint32_t height, uint32_t d_width,
>  
>      if (WinID <= 0) {
>          if (fullscreen_flag) {
> -            if (!fb_overlay_only)
> -                x11_set_fullscreen_state(display, win, 1);
>              omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
>          } else {
> -            if (!fb_overlay_only)
> -                x11_set_fullscreen_state(display, win, 0);
>              omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
>          }
>      }
> @@ -475,25 +364,21 @@ static int config(uint32_t width, uint32_t height, uint32_t d_width,
>      return 0;
>  }
>  
> -
>  static void draw_alpha(int x0, int y0, int w, int h, unsigned char *src, unsigned char *srca, int stride)
>  {
> -    vo_draw_alpha_yuy2(w, h, src, srca, stride, fb_pages[page].buf + sinfo.xres * y0 * 2 + x0 * 2, sinfo.xres);
> +    vo_draw_alpha_yuy2(w, h, src, srca, stride, fb_pages[page].buf + y0 * finfo.line_length + x0 * 2, finfo.line_length);
>  }
>  
> -
>  static void draw_osd(void)
>  {
>      vo_draw_text(sinfo.xres, sinfo.yres, draw_alpha);
>  }
>  
> -
>  static int draw_frame(uint8_t *src[])
>  {
>      return 1;
>  }
>  
> -
>  static int draw_slice(uint8_t *src[], int stride[], int w, int h, int x, int y)
>  {
>      if (x!=0)
> @@ -504,12 +389,10 @@ static int draw_slice(uint8_t *src[], int stride[], int w, int h, int x, int y)
>  
>      ioctl(dev_fd, OMAPFB_SYNC_GFX);
>  
> -    yuv420_to_yuv422(fb_pages[page].buf + 2 * sinfo.xres * y, src[0], src[1], src[2], w & ~15, h, stride[0], stride[1], 2 * sinfo.xres_virtual);
> -
> +    yuv420_to_yuv422(fb_pages[page].buf + y * finfo.line_length, src[0], src[1], src[2], w & ~15, h, stride[0], stride[1], finfo.line_length);
>      return 0;
>  }
>  
> -
>  static void flip_page(void)
>  {
>      if (fb_page_flip) {
> @@ -520,7 +403,6 @@ static void flip_page(void)
>      }
>  }
>  
> -
>  static int query_format(uint32_t format)
>  {
>      // For simplicity pretend that we can only do YV12, support for
> @@ -563,17 +445,20 @@ static int control(uint32_t request, void *data, ...)
>              if (WinID > 0) return VO_FALSE;
>              if (fullscreen_flag) {
>                  if (!fb_overlay_only)
> -                    x11_set_fullscreen_state(display, win, 0);
> +                    vo_x11_fullscreen();
>                  fullscreen_flag = 0;
>                  omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
>              } else {
>                  if (!fb_overlay_only)
> -                    x11_set_fullscreen_state(display, win, 1);
> +                    vo_x11_fullscreen();
>                  fullscreen_flag = 1;
>                  omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
>              }
>              return VO_TRUE;
>          }
> +        case VOCTRL_UPDATE_SCREENINFO:
> +            update_xinerama_info();
> +            return VO_TRUE;
>      }
>      return VO_NOTIMPL;
>  }
> diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn.bb
> index fa39d79..3042a3c 100644
> --- a/recipes/mplayer/mplayer_svn.bb
> +++ b/recipes/mplayer/mplayer_svn.bb
> @@ -16,7 +16,7 @@ SRC_URI = "svn://svn.mplayerhq.hu/mplayer;module=trunk \
>  	   "
>  
>  SRC_URI_append_armv7a = " \
> -#		file://omapfb.patch;patch=1 \
> +		file://omapfb.patch;patch=1 \
>  	   file://vo_omapfb.c \
>  	   file://yuv.S \
>  	  "
> @@ -37,7 +37,7 @@ RCONFLICTS_${PN} = "mplayer-atty"
>  RREPLACES_${PN} = "mplayer-atty"
>  
>  PV = "0.0+1.0rc2+svnr${SRCREV}"
> -PR = "r9"
> +PR = "r10"
>  DEFAULT_PREFERENCE = "-1"
>  DEFAULT_PREFERENCE_armv7a = "1"
>  
> @@ -198,6 +198,8 @@ do_configure_prepend_armv7a() {
>   	cp ${WORKDIR}/vo_omapfb.c ${S}/libvo
>  	cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h ${S}/libvo/omapfb.h || true
>   	cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h ${S}/libvo/omapfb.h || true
> +	cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S}/libvo/omapfb.h || true
> + 	sed -e 's/__user//g' -i ${S}/libvo/omapfb.h || true
>  }
>  
>  CFLAGS_append = " -I${S}/libdvdread4 "

--------------ms090403080508050405030607
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
MzE0OVowIwYJKoZIhvcNAQkEMRYEFE9FSb/DDMOf4GdzDyWUTst6G8PcMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQCxxQrjLdNB8yojEFdxpl+d1i48zq1KvWiuVBb2v2axa+WhUS+Y
88nTxxcfQDOORBl9EgCt6ZGo8zwH1gkLcGnDRAyKjWpOvVZMLWEQsG7jFcJwTKfXNOfYmd9JNEvb
qol/P6ZpDrG9qXKGV8uX9504sqyHr2sWbPpO4Xabs2YCXfNXYIA3V/tGF9MweQq+Cz4lZqO2Q+FF
VgVifvRQzKXh7j2iV56DaELOA7GaO895jIWP9cp5fvklfz3j5BqPx9rpfpL4U3zuq6/kRPe40jFD
5K7H2Tws9FBz8X2A5LH2MUFtmeUbQFg3zm10lo2VW2h4bCXaVmn9AH7LMIm5yymKAAAAAAAA

--------------ms090403080508050405030607--
