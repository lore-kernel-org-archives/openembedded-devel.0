Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id C6516771AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:30:14 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0SDUF9u021992 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 07:30:15 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012807301503-389483 ;
	Thu, 28 Jan 2016 07:30:15 -0600 
Date: Thu, 28 Jan 2016 15:29:59 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160128152959.55a9a747@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CALbNGRRTKH2BsXQbB7di3geApmPLz-A_gGaEnGzyLEJzPkX7-Q@mail.gmail.com>
References: <1453978491-8849-1-git-send-email-adrian.ratiu@ni.com>
	<CALbNGRRTKH2BsXQbB7di3geApmPLz-A_gGaEnGzyLEJzPkX7-Q@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/28/2016 07:30:15 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/28/2016 07:30:15 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-28_06:, , signatures=0
Subject: Re: [meta-xfce][PATCH 1/1] xfwm4: add patch to fix touch event handling
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
X-List-Received-Date: Thu, 28 Jan 2016 13:30:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Jan 2016 12:52:06 +0100
Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:

> On Thu, Jan 28, 2016 at 11:54 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>=
 wrote:
> > Patch sent upstream, pending acceptance
> >
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  ...handling-of-touch-events-on-window-border.patch | 42 ++++++++++++++=
++++++++
> >  meta-xfce/recipes-xfce/xfwm4/xfwm4=5F4.12.3.bb       |  6 +++-
> >  2 files changed, 47 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-=
handling-of-touch-events-on-window-border.patch
> >
> > diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handlin=
g-of-touch-events-on-window-border.patch b/meta-xfce/recipes-xfce/xfwm4/fil=
es/0001-events-fix-handling-of-touch-events-on-window-border.patch
> > new file mode 100644
> > index 0000000..e01aac5
> > --- /dev/null
> > +++ b/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-to=
uch-events-on-window-border.patch
> > @@ -0,0 +1,42 @@
> > +From cb966e51ea51088a1d4fd5914fc7f917684e0b51 Mon Sep 17 00:00:00 2001
> > +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +Date: Thu, 28 Jan 2016 11:43:01 +0200
> > +Subject: [PATCH] events: fix handling of touch events on window borders
> > +
> > +When the Xorg server translates touch events into ButtonPress/ButtonRe=
lease
> > +events, the subwindow in the XEvent structure is set to zero. This cha=
nge adds
> > +a querry to determine the subwindow for the event in case it is missin=
g.
> > +
> > +Original patch & discussion at [1].
> > +
> > +Upstream-Status: Pending acceptance
> > +
> > +[1] http://xfce.10915.n7.nabble.com/Re-Xfwm-window-borders-do-not-resp=
ond-to-touch-screen-td42357.html
> > +
> > +Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> > +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +---
> > + src/events.c | 7 +++++++
> > + 1 file changed, 7 insertions(+)
> > +
> > +diff --git a/src/events.c b/src/events.c
> > +index 8aa0f0a..0565594 100644
> > +--- a/src/events.c
> > ++++ b/src/events.c
> > +@@ -917,6 +917,13 @@ handleButtonPress (DisplayInfo *display=5Finfo, X=
ButtonEvent * ev)
> > +     {
> > +         state =3D ev->state & MODIFIER=5FMASK;
> > +         win =3D ev->subwindow;
> > ++        if (!win) {
> > ++                Window root=5Fret;
> > ++                int rx,ry,wx,wy;
> > ++                unsigned int mask=5Fret;
> > ++                XQueryPointer(display=5Finfo->dpy, ev->window,
> > ++                              &root=5Fret, &win, &rx, &ry, &wx, &wy, =
&mask=5Fret);
> > ++        }
> > +         screen=5Finfo =3D c->screen=5Finfo;
> > +
> > +         if ((ev->button =3D=3D Button1) && (state) && (state =3D=3D s=
creen=5Finfo->params->easy=5Fclick))
> > +--
> > +2.7.0
> > +
> > diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4=5F4.12.3.bb b/meta-xfce=
/recipes-xfce/xfwm4/xfwm4=5F4.12.3.bb
> > index 41daa00..aa4b290 100644
> > --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4=5F4.12.3.bb
> > +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4=5F4.12.3.bb
> > @@ -6,7 +6,11 @@ DEPENDS =3D "virtual/libx11 libxpm gtk+ libxfce4util l=
ibxfce4ui xfconf libwnck dbu
> >
> >  inherit xfce update-alternatives
> >
> > -SRC=5FURI +=3D "file://0001-don-t-block-display-events-when-time-is-se=
t-backward.patch"
> > +SRC=5FURI +=3D " \
> > +    file://0001-don-t-block-display-events-when-time-is-set-backward.p=
atch \
> > +    file://0001-events-fix-handling-of-touch-events-on-window-border.p=
atch \
> > +"
> > +
> >  SRC=5FURI[md5sum] =3D "197ef087ca6a263627f1bea6d5a79d6f"
> >  SRC=5FURI[sha256sum] =3D "f4a988fbc4e0df7e8583c781d271559e56fd28696092=
f94ae052e9e6edb09eac"
> >
> > --
> > 2.7.0
> > =20
> I've checked the thread you point to: I am using xfce for touch
> screens and can resize windows, maximize them, move around and close
> them all with touch. What kind of error is fixed?

Thank you for challenging this, it helped bring more light on the issue.
It is a workaround the bug [1] in xserver which was fixed. More details her=
e [2]
I did not knew this untill I asked on the xfwm bugzilla.

So instead of "fixing" it here, we should try to backport that fix to OE or=
 verify
if it's not contained in OE's xserver already since it's working for you :)

[1] http://cgit.freedesktop.org/xorg/xserver/commit/?id=3D24b943132f
[2] https://bugzilla.xfce.org/show=5Fbug.cgi?id=3D12427

>=20
> Andreas


