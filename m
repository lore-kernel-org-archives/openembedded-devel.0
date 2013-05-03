Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UYDK5-0001rk-GO
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 12:34:43 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 671F54B0180;
	Fri,  3 May 2013 12:16:41 +0200 (CEST)
Date: Fri, 3 May 2013 12:16:39 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130503121639.5ef55ace@e6520eb>
In-Reply-To: <CALbNGRT7OG1OxNhyvkjrcKxXPysOpX3QO1tqr-oy9SvAPGNy2Q@mail.gmail.com>
References: <1367575432-5173-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT7OG1OxNhyvkjrcKxXPysOpX3QO1tqr-oy9SvAPGNy2Q@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: otavio@ossystems.com.br
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
X-List-Received-Date: Fri, 03 May 2013 10:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Fri, 3 May 2013 12:08:10 +0200,
Andreas M=C3=BCller <schnitzeltony@googlemail.com> a =C3=A9crit :

> On Fri, May 3, 2013 at 12:03 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >  ...ser_main_loop.cc-fix-build-with-glib-2.35.patch |   42 ++++++++++++=
++++++++
> >  recipes-browser/chromium/chromium_24.0.1312.52.bb  |    3 +-
> >  2 files changed, 44 insertions(+), 1 deletions(-)
> >  create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/0001=
-browser_main_loop.cc-fix-build-with-glib-2.35.patch
> >
> > diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/0001-browse=
r_main_loop.cc-fix-build-with-glib-2.35.patch b/recipes-browser/chromium/ch=
romium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
> > new file mode 100644
> > index 0000000..cdf8051
> > --- /dev/null
> > +++ b/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_=
loop.cc-fix-build-with-glib-2.35.patch
> > @@ -0,0 +1,42 @@
> > +From eb0c0c982322c0e366c1c854475ceda6342dd55a Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> > +Date: Thu, 2 May 2013 15:12:24 +0200
> > +Subject: [PATCH] browser_main_loop.cc: fix build with glib > 2.35
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Upstream-Status: Applied [1]
> > +
> > +[1] http://code.ohloh.net/file?fid=3DpYuYekcDZUhiAoN5uY-KdIaKFTI&cid=
=3D0W4KUpSYxGo&s=3D&browser=3DDefault#L0
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > +---
> > + content/browser/browser_main_loop.cc |    5 +++++
> > + 1 files changed, 5 insertions(+), 0 deletions(-)
> > +
> > +diff --git a/content/browser/browser_main_loop.cc b/content/browser/br=
owser_main_loop.cc
> > +index ad4b0c6..86deea3 100644
> > +--- a/content/browser/browser_main_loop.cc
> > ++++ b/content/browser/browser_main_loop.cc
> > +@@ -687,12 +687,17 @@ void BrowserMainLoop::InitializeToolkit() {
> > +   // TODO(stevenjb): Move platform specific code into platform specif=
ic Parts
> > +   // (Need to add InitializeToolkit stage to BrowserParts).
> > + #if defined(OS_LINUX) || defined(OS_OPENBSD)
> > ++  // g_type_init will be deprecated in 2.36. 2.35 is the development
> > ++  // version for 2.36, hence do not call g_type_init starting 2.35.
> > ++  // http://developer.gnome.org/gobject/unstable/gobject-Type-Informa=
tion.html#g-type-init
> > ++#if !GLIB_CHECK_VERSION(2, 35, 0)
> > +   // Glib type system initialization. Needed at least for gconf,
> > +   // used in net/proxy/proxy_config_service_linux.cc. Most likely
> > +   // this is superfluous as gtk_init() ought to do this. It's
> > +   // definitely harmless, so retained as a reminder of this
> > +   // requirement for gconf.
> > +   g_type_init();
> > ++#endif
> > +
> > + #if !defined(USE_AURA)
> > +   gfx::GtkInitFromCommandLine(parsed_command_line_);
> > +--
> > +1.7.6.5
> > +
> > diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipe=
s-browser/chromium/chromium_24.0.1312.52.bb
> > index 2827cc1..a9a2d28 100644
> > --- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
> > +++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
> > @@ -11,9 +11,10 @@ SRC_URI =3D "http://commondatastorage.googleapis.com=
/chromium-browser-official/${P
> >          file://ui-gl-no-narrowing.patch \
> >          file://google-chrome \
> >          file://google-chrome.desktop \
> > +        file://0001-browser_main_loop.cc-fix-build-with-glib-2.35.patc=
h \
> >  "
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> >  # include.gypi exists only for armv6 and armv7a and there isn't someth=
ing like COMPATIBLE_ARCH afaik
> >  COMPATIBLE_MACHINE =3D "(-)"
> > --
> > 1.7.6.5
> >
> Aargh Sorry - I forgot meta-browser as subject prefix. Resend?
>=20
no don't worry I got it

Eric


