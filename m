Received: from mta4.brinkster.com ([65.182.109.83])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NXF0N-0008LR-FK
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 15:24:31 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta4.brinkster.com (Postfix) with ESMTP id 4AE9328049C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 09:13:24 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta4.brinkster.com ([127.0.0.1])
	by localhost (mta4.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HM-F4se4ryWo
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 09:13:19 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta4.brinkster.com (Postfix) with ESMTP id C0FBE280660
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 09:13:18 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <4B54F654.4000500@atmel.com> <4B55B26C.5040706@gmail.com>
In-Reply-To: <4B55B26C.5040706@gmail.com>
Date: Tue, 19 Jan 2010 14:12:56 -0000
Message-ID: <023001ca9911$809fa3c0$81deeb40$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcqZCrKuX8ibetCoQHyusFtrVzVsqgAAHFDA
X-SA-Exim-Connect-IP: 65.182.109.83
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom: x11-gpe-image : Calibration of Screen ?
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
X-List-Received-Date: Tue, 19 Jan 2010 14:24:31 -0000
X-Groupsio-MsgNum: 15888
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0231_01CA9911.809FA3C0"
Content-Language: en-us

------=_NextPart_000_0231_01CA9911.809FA3C0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> No (really good) news,
> but I'm currently working on this.
> I tried to enable touchscreen calibration without success.
>=20
> I built Xorg version Xorg-1.7.3 configured with --enable-xcalibrate
> but I didn't get this extension in my Xorg, so when I try to call
> xtscal
> I always get this error:
>  # xtscal
>  XCALIBRATE extension missing: Success
>=20
> I debugged a bit the following packages: xtscal_0.6.3,
> libxcalibrate_git, libxext_1.1.1
>=20
> Temporary conclusion is that xtscal is no longer usable because the
> xcalibrate extension is only implemented for kdrive.
> Possible options are to use kdrive (hopefully not) or find another way
> to calibrate our touchscreen.
> I am working on a new way to calibrate the screen in the xorg (not
> kdrive) way.
>=20
> Any hints or help would be greatly appreciated.

The tail end of last year I found some un-credited code :-o on the =
internet (believed to be public domain/GPL depending on the header of =
the file but that does not thrill me to be honest).=20

I started to work on a fresh reimplementation of that code to return =
calibration information that could be fed into either xinput evtouch or =
xinput evdev (if you use a recent version of either driver that supports =
calibration for TS devices). I never finished the reimplementation work =
so a lot of the code is still the original un-credited code.

Not sure if this is of any help/interest but wrapped in a suitable GUI =
(or even scripts and Zenity) it could provide a sensible way to =
calibrate a touchscreen in X using X drivers that use the Linux event =
handling interface (rather than TSLib).

Note: I can't even recall if this code builds (I strongly suspect not) =
as I just grabbed it off my hard drive where it has been rotting for a =
while. It's really for reference only and fit for nothing more than the =
scrap heap at a guess.

Regards,

John

------=_NextPart_000_0231_01CA9911.809FA3C0
Content-Type: application/octet-stream;
	name="evdev_calibration.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="evdev_calibration.c"

/*
 * Generic X based touchscreen calibration program using the
 * Linux 2.6 input event handling interface.
 *
 * Outputs data in formats that can be used with both EVTOUCH
 * and EVDEV drivers.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

/*
 * Modified 2009/2010: John Willis
 */

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/Xos.h>
#include <X11/Xatom.h>
#include <X11/keysym.h>

#include <stdio.h>
#include <signal.h>
#include <termios.h>
#include <stdlib.h>
#include <sys/time.h>

/**************************************************************************=
***/

/* Event interface */
struct input_event {
	struct timeval time;
	unsigned short type;
	unsigned short code;
	int value;
};


/* Event types */
#define EV_SYN			0x00
#define EV_KEY			0x01
#define EV_REL			0x02
#define EV_ABS			0x03

/* Codes */
#define ABS_X			0x00
#define ABS_Y			0x01
#define SYN_REPORT		0
#define BTN_LEFT		0x110
#define BTN_RIGHT		0x111
#define BTN_TOUCH		0x14a

/**************************************************************************=
***/

#define FONT_NAME		"9x15"
#define IDLETIMEOUT		15
#define BLINKPERD		0.16

#define ROUND_SYMBOL
#define NumRect			5

#if 0
#define Background		cCYAN
#define	TouchedCross	cYELLOW
#define BlinkCrossBG	cRED
#define BlinkCrossFG	cWHITE
#define nTouchedCross	cBLUE
#define Cross			cWHITE
#define DrawGrid		cWHITE
#define DrawLine		cYELLOW
#define DrawUp			cRED
#define DrawDown		cBLUE
#define TimerLine		cRED
#define PromptText		cBLUE
#else
#define Background		cBLACK
#define	TouchedCross	cYELLOW
#define BlinkCrossBG	cRED
#define BlinkCrossFG	cWHITE
#define nTouchedCross	cBLUE
#define Cross			cYELLOW
#define DrawGrid		cGREEN
#define DrawLine		cYELLOW
#define DrawUp			cRED
#define DrawDown		cGREEN
#define TimerLine		cRED
#define PromptText		cWHITE
#endif

#define N_Colors		10

static char colors[N_Colors][10] =3D
{ "BLACK", "WHITE", "RED", "YELLOW", "GREEN", "BLUE", "#40C0C0" };

static unsigned long pixels[N_Colors];

#define cBLACK			(pixels[0])
#define cWHITE			(pixels[1])
#define cRED			(pixels[2])
#define cYELLOW			(pixels[3])
#define cGREEN			(pixels[4])
#define cBLUE			(pixels[5])
#define cCYAN			(pixels[6])

/* Stupid wait loops */
#define SYS_1( zzz... ) do {	\
	while ( (zzz) !=3D 1 );	\
} while (0)

#define SYS_0( zzz... ) do {	\
	while ( (zzz) !=3D 0 );	\
} while (0)

/* Calibration points */
#define SCREEN_DIVIDE	16
#define SCREEN_MAX	0x800
#define M_POINT		(SCREEN_MAX/SCREEN_DIVIDE)
int MARK_POINT[] =3D { M_POINT, SCREEN_MAX - 1 - M_POINT };

/**************************************************************************=
***/

int job_done =3D 0;
int points_touched =3D 0;
char *deviceName;
int points_x[4], points_y[4];

Display *display;
int screen;
GC gc;
Window root;
Window win;
XFontStruct *font_info;
unsigned int width, height;	/* window size */
char *progname;
int evfd;


/**************************************************************************=
***/

int get_events(int *px, int *py)
{
	int ret;
	int x =3D -1, y =3D -1;
	int touch =3D 0, sync =3D 0;
	struct input_event ev;

	/* read till sync event */
	while (!sync) {
		ret =3D read(evfd, &ev, sizeof(ev));
		if (ret =3D=3D -1)
			return -1;

		switch (ev.type) {
		case EV_ABS:
			switch (ev.code) {
			case ABS_X:
				if (x =3D=3D -1)
					x =3D ev.value;
				break;

			case ABS_Y:
				if (y =3D=3D -1)
					y =3D ev.value;
				break;

			default:
				break;
			}

			break;

		case EV_KEY:
			switch (ev.code) {
			case BTN_LEFT:
			case BTN_TOUCH:
				touch =3D 1;

			default:
			       break;
			}

			break;

		case EV_SYN:
			if (ev.code =3D=3D SYN_REPORT)
				sync =3D 1;

			break;

		default:
			break;
		}

	}

	if (!touch || x =3D=3D -1 || y =3D=3D -1)
		return -1;

	*px =3D x;
	*py =3D y;
	return 0;
}


/**************************************************************************=
***/

void cleanup_exit()
{
	SYS_1(XUnloadFont(display, font_info->fid));
	XUngrabServer(display);
	XUngrabKeyboard(display, CurrentTime);
	SYS_1(XFreeGC(display, gc));
	SYS_0(XCloseDisplay(display));
	close(evfd);
	exit(0);
}


void load_font(XFontStruct **font_info)
{
	char *fontname =3D FONT_NAME;

	if ((*font_info =3D XLoadQueryFont(display, fontname)) =3D=3D NULL) {
		printf("Cannot open %s font\n", FONT_NAME);
		exit(1);
	}
}


void draw_point(int x, int y, int width, int size, unsigned long color)
{
	XSetForeground(display, gc, color);
	XSetLineAttributes(display, gc, width, LineSolid,
			   CapRound, JoinRound);
	XDrawLine(display, win, gc, x - size, y, x + size, y);
	XDrawLine(display, win, gc, x, y - size, x, y + size);
}


void point_blink(unsigned long color)
{
	int i, j;
	int cx, cy;
	static int shift =3D 0;

	if (points_touched !=3D 4) {
		int RectDist =3D width / 200;
		i =3D points_touched / 2;
		j =3D points_touched % 2;
		cx =3D (MARK_POINT[j] * width) / SCREEN_MAX;
		cy =3D (MARK_POINT[i] * height) / SCREEN_MAX;

		XSetLineAttributes(display, gc, 1, LineSolid, CapRound, JoinRound);
		for (i =3D 0; i < NumRect; i++) {
			if ((i + shift) % NumRect =3D=3D 0)
				XSetForeground(display, gc, BlinkCrossBG);
			else
				XSetForeground(display, gc, BlinkCrossFG);

#ifdef ROUND_SYMBOL
			XDrawArc(display, win, gc,
			         cx - i * RectDist, cy - i * RectDist,
			         i * (2 * RectDist), i * (2 * RectDist),
			         0, 359 * 64);
#else
			XDrawRectangle(display, win, gc,
				       cx - i * RectDist, cy - i * RectDist,
				       i * (2 * RectDist), i * (2 * RectDist));
#endif
		}
		shift++;
	}
}


void draw_message(char *msg)
{
	char buf[300];
	char *prompt[] =3D { buf };
#define num	(sizeof(prompt) / sizeof(prompt[0]))
	static int init =3D 0;
	static int p_len[num];
	static int p_width[num];
	static int p_height;
	static int p_maxwidth =3D 0;
	int i, x, y;
	int line_height;

	strncpy(buf, msg, sizeof buf);

	for (i =3D 0; i < num; i++) {
		p_len[i] =3D strlen(prompt[i]);
		p_width[i] =3D XTextWidth(font_info, prompt[i], p_len[i]);

		if (p_width[i] > p_maxwidth)
			p_maxwidth =3D p_width[i];
	}

	p_height =3D font_info->ascent + font_info->descent;
	init =3D 1;

	line_height =3D p_height + 5;
	x =3D (width - p_maxwidth) / 2;
	y =3D height / 2 - line_height;

	XSetForeground(display, gc, PromptText);
	XSetLineAttributes(display, gc, 3, LineSolid, CapRound, JoinRound);
	XClearArea(display, win, x - 8, y - 8 - p_height, p_maxwidth + 8 * 2,
	           num * line_height + 8 * 2, False);
	XDrawRectangle(display, win, gc, x - 8, y - 8 - p_height,
	               p_maxwidth + 8 * 2, num * line_height + 8 * 2);

	for (i =3D 0; i < num; i++) {
		XDrawString(display, win, gc, x, y + i * line_height, prompt[i],
			    p_len[i]);
	}
#undef num
}


void draw_text()
{
	static char *prompt[] =3D {
		"                    4-Pt Calibration",
		"Please touch the blinking symbol until beep or stop blinking",
		"                     (ESC to Abort)",
	};
#define num	(sizeof(prompt) / sizeof(prompt[0]))
	static int init =3D 0;
	static int p_len[num];
	static int p_width[num];
	static int p_height;
	static int p_maxwidth =3D 0;
	int i, x, y;
	int line_height;

	if (!init) {
		for (i =3D 0; i < num; i++) {
			p_len[i] =3D strlen(prompt[i]);
			p_width[i] =3D XTextWidth(font_info, prompt[i], p_len[i]);
			if (p_width[i] > p_maxwidth)
				p_maxwidth =3D p_width[i];
		}
		p_height =3D font_info->ascent + font_info->descent;
		init =3D 1;
	}
	line_height =3D p_height + 5;
	x =3D (width - p_maxwidth) / 2;
	y =3D height / 2 - 6 * line_height;

	XSetForeground(display, gc, PromptText);
	XClearArea(display, win, x - 11, y - 8 - p_height,
		   p_maxwidth + 11 * 2, num * line_height + 8 * 2, False);
	XSetLineAttributes(display, gc, 3, FillSolid,
			   CapRound, JoinRound);
	XDrawRectangle(display, win, gc, x - 11, y - 8 - p_height,
		       p_maxwidth + 11 * 2, num * line_height + 8 * 2);

	for (i =3D 0; i < num; i++) {
		XDrawString(display, win, gc, x, y + i * line_height, prompt[i],
			    p_len[i]);
	}
#undef num
}


void draw_graphics()
{
	int i, j;
	unsigned cx, cy;
	unsigned long color;

	draw_text();

	for (i =3D 0; i < 2; i++) {
		for (j =3D 0; j < 2; j++) {
			int num =3D 2 * i + j;

			if (num =3D=3D points_touched)
				continue;

			if (num > points_touched)
				color =3D nTouchedCross;
			else
				color =3D TouchedCross;

			cx =3D (MARK_POINT[j] * width) / SCREEN_MAX;
			cy =3D (MARK_POINT[i] * height) / SCREEN_MAX;
			draw_point(cx, cy, width / 200, width / 64, color);
		}
	}
}


void get_gc(Window win, GC *gc, XFontStruct *font_info)
{
	unsigned long valuemask =3D 0;	/* ignore XGCvalues and use defaults */
	XGCValues values;
	unsigned int line_width =3D 5;
	int line_style =3D LineSolid;
	int cap_style =3D CapRound;
	int join_style =3D JoinRound;

	*gc =3D XCreateGC(display, win, valuemask, &values);

	XSetFont(display, *gc, font_info->fid);

	XSetLineAttributes(display, *gc, line_width, line_style,
			   cap_style, join_style);
}


int get_color()
{
	int default_depth;
	Colormap default_cmap;
	XColor my_color;
	int i;

	default_depth =3D DefaultDepth(display, screen);
	default_cmap =3D DefaultColormap(display, screen);

	for (i =3D 0; i < N_Colors; i++) {
		XParseColor(display, default_cmap, colors[i], &my_color);
		XAllocColor(display, default_cmap, &my_color);
		pixels[i] =3D my_color.pixel;
	}

	return 0;
}


Cursor create_empty_cursor()
{
	char nothing[] =3D { 0 };
	XColor nullcolor;
	Pixmap src =3D XCreateBitmapFromData(display, root, nothing, 1, 1);
	Pixmap msk =3D XCreateBitmapFromData(display, root, nothing, 1, 1);
	Cursor mycursor =3D XCreatePixmapCursor(display, src, msk,
					      &nullcolor, &nullcolor, 0, 0);
	XFreePixmap(display, src);
	XFreePixmap(display, msk);

	return mycursor;
}


void process_event()
{
	XEvent event;

	while (XCheckWindowEvent(display, win, -1, &event) =3D=3D True) {
		switch (event.type) {
		case KeyPress:
			{
				KeySym keysym =3D XKeycodeToKeysym(display,
							     event.xkey.keycode, 0);

				if (keysym =3D=3D XK_Escape) {
					puts("Aborted");
					cleanup_exit();
				}
			}
			break;

		case Expose:
			draw_graphics(win, gc, width, height);
			break;

		default:
			break;
		}
	}
}


double idle_time =3D 0;
double tick =3D 0;

void set_timer(double interval /* in second */ )
{
	struct itimerval timer;
	long sec =3D interval;
	long usec =3D (interval - sec) * 1.0e6;

	timer.it_value.tv_sec =3D sec;
	timer.it_value.tv_usec =3D usec;
	timer.it_interval =3D timer.it_value;
	setitimer(ITIMER_REAL, &timer, NULL);
	tick =3D interval;
}


void update_timer(void)
{
	int current =3D width * idle_time / IDLETIMEOUT;

	XSetLineAttributes(display, gc, 2, LineSolid, CapRound, JoinRound);
	XSetForeground(display, gc, Background);
	XDrawLine(display, win, gc, 0, height - 1, current, height - 1);
	XSetForeground(display, gc, TimerLine);
	XDrawLine(display, win, gc, current, height - 1, width, height - 1);
}


int register_fasync(int fd, void (*handle) (int))
{
	signal(SIGIO, handle);
	fcntl(fd, F_SETOWN, getpid());
	fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | FASYNC);
	return 0;
}


void sig_handler(int num)
{
	char buf[100];
	int i, rval, x, y;
	static int is_busy =3D 0;

	if (is_busy)
		return;
	is_busy =3D 1;

	switch (num) {
	case SIGALRM:
		if (!job_done)
			point_blink(BlinkCrossFG);

		update_timer();
		if (idle_time >=3D IDLETIMEOUT)
			cleanup_exit();

		idle_time +=3D tick;
		XFlush(display);
		process_event();

		break;

	case SIGIO:
		rval =3D get_events(&x, &y);

		if (rval =3D=3D -1)
			break;

		idle_time =3D 0;

		points_x[points_touched] =3D x;
		points_y[points_touched] =3D y;

		points_touched++;
		draw_graphics();

		break;

	default:
		break;
	}

	/* do the math */
	if (points_touched =3D=3D 4 && !job_done) {
		int x_low, y_low, x_hi, y_hi;
		int x_min, y_min, x_max, y_max;
		int x_seg, y_seg;
		int x_inv =3D 0, y_inv =3D 0;

		int temp;
#ifdef DEBUG
		printf("Touch 0 at %d/%d\n", points_x[0], points_y[0]);  /* l,l */
		printf("Touch 1 at %d/%d\n", points_x[1], points_y[1]);  /* l,h */
		printf("Touch 2 at %d/%d\n", points_x[2], points_y[2]);  /* h,l */
		printf("Touch 3 at %d/%d\n", points_x[3], points_y[3]);  /* h,h */
#endif

		if((points_x[0] > points_x[1]) && (points_x[2] > points_x[3])) {
#ifdef DEBUG
		  printf("swap x\n");
#endif
		  temp =3D points_x[0]; points_x[0] =3D points_x[1]; points_x[1] =3D temp=
;
		  temp =3D points_x[2]; points_x[2] =3D points_x[3]; points_x[3] =3D temp=
;
		}

		if((points_y[0] > points_y[2]) && (points_y[1] > points_y[3])) {
#ifdef DEBUG
		  printf("swap y\n");
#endif
		  temp =3D points_y[0]; points_y[0] =3D points_y[2]; points_y[2] =3D temp=
;
		  temp =3D points_y[1]; points_y[1] =3D points_y[3]; points_y[3] =3D temp=
;
		}

		if((points_x[1] > points_x[2])&&(points_y[1] < points_y[2])) {
#ifdef DEBUG
		  printf("swap mid\n");
#endif
		  temp =3D points_x[1]; points_x[1] =3D points_x[2]; points_x[2] =3D temp=
;
		  temp =3D points_y[1]; points_y[1] =3D points_y[2]; points_y[2] =3D temp=
;
		}

#ifdef DEBUG
		printf("Touch 0 at %d/%d\n", points_x[0], points_y[0]);  /* l,l */
		printf("Touch 1 at %d/%d\n", points_x[1], points_y[1]);  /* l,h */
		printf("Touch 2 at %d/%d\n", points_x[2], points_y[2]);  /* h,l */
		printf("Touch 3 at %d/%d\n", points_x[3], points_y[3]);  /* h,h */
#endif
		/* get the averages */
		x_low =3D (points_x[0] + points_x[1]) / 2;
		y_low =3D (points_y[0] + points_y[2]) / 2;
		x_hi =3D (points_x[2] + points_x[3]) / 2;
		y_hi =3D (points_y[1] + points_y[3]) / 2;

		/* see if one of the axes is inverted */
		if (x_low > x_hi) {
			int tmp =3D x_hi;
			x_hi =3D x_low;
			x_low =3D tmp;
			x_inv =3D 1;
		}
		if (y_low > y_hi) {
			int tmp =3D y_hi;
			y_hi =3D y_low;
			y_low =3D tmp;
			y_inv =3D 1;
		}

#if 0
      		printf("Touch at %d/%d/%d/%d\n", x_low,y_low, x_hi, y_hi);
#endif

		/* calc the min and max values */
		x_seg =3D (x_hi - x_low) / (SCREEN_DIVIDE - 2);
		x_min =3D x_low - x_seg;
		x_max =3D x_hi + x_seg;

		y_seg =3D (y_hi - y_low) / (SCREEN_DIVIDE - 2);
		y_min =3D y_low - y_seg;
		y_max =3D y_hi + y_seg;

		printf("Copy-Paste friendly, for EVTOUCH XF86 driver\n");
		printf("- Version 0.61 >\n");
		printf("	Option \"MinX\" \"%d\"\n", x_min);
		printf("	Option \"MinY\" \"%d\"\n", y_min);
		printf("	Option \"MaxX\" \"%d\"\n", x_max);
		printf("	Option \"MaxY\" \"%d\"\n", y_max);
		printf("	Option \"SwapX\" \"%d\"\n", x_inv);
		printf("	Option \"SwapY\" \"%d\"\n", y_inv);
		printf("\n");
		printf("Copy-Paste friendly, for EVDEV XF86 driver\n");
		printf("- Version 2.3.2 >\n");
		printf("	Option \"Calibration\" \"%d\"%d\"%d\"%d\"\n", x_min, x_max, y_mi=
n, y_max);
		printf("	Option \"SwapAxes\" \"%d\"\n", x_inv);
		printf("\n");

		draw_message("   Done...   ");
		XFlush(display);

		job_done =3D 1;
		idle_time =3D IDLETIMEOUT * 3 / 4;
		update_timer();
	}

	is_busy =3D 0;

	return;
}


int main(int argc, char *argv[], char *env[])
{
	char *display_name =3D NULL;
	XSetWindowAttributes xswa;

	/* one arg: device name */
	if (argc !=3D 2) {
		fprintf(stderr, "Usage %s <device>!\n", argv[0]);
		return 1;
	}

	evfd =3D open(argv[1], O_RDONLY | O_NONBLOCK);
	if (evfd =3D=3D -1) {
		fprintf(stderr, "Cannot open device file!\n");
		return 1;
	}


	/* connect to X server */
	if ((display =3D XOpenDisplay(display_name)) =3D=3D NULL) {
		fprintf(stderr, "%s: cannot connect to X server %s\n",
			progname, XDisplayName(display_name));
		close(evfd);
		exit(1);
	}

	screen =3D DefaultScreen(display);
	root =3D RootWindow(display, screen);

	/* setup window attributes */
	xswa.override_redirect =3D True;
	xswa.background_pixel =3D BlackPixel(display, screen);
	xswa.event_mask =3D ExposureMask | KeyPressMask;
	xswa.cursor =3D create_empty_cursor();

	/* get screen size from display structure macro */
	width =3D DisplayWidth(display, screen);
	height =3D DisplayHeight(display, screen);

	win =3D XCreateWindow(display, RootWindow(display, screen),
	                    0, 0, width, height, 0,
	                    CopyFromParent, InputOutput, CopyFromParent,
	                    CWOverrideRedirect | CWBackPixel | CWEventMask |
	                    CWCursor, &xswa);
	XMapWindow(display, win);
	XGrabKeyboard(display, win, False, GrabModeAsync, GrabModeAsync,
	              CurrentTime);
	XGrabServer(display);
	load_font(&font_info);
	get_gc(win, &gc, font_info);
	get_color();

	XSetWindowBackground(display, win, Background);
	XClearWindow(display, win);

	signal(SIGALRM, sig_handler);
	set_timer(BLINKPERD);
	register_fasync(evfd, sig_handler);

	/* wait for signals */
	while (1)
		pause();

	return 0;
}

------=_NextPart_000_0231_01CA9911.809FA3C0--
