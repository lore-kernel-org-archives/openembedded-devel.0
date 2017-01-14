Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3784C60720
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 00:30:23 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c85so86314729wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 16:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9He1KDyDYqGSjC6hQ0RTdy5B8BWQGGvZ2nyP0lMgrtA=;
	b=Zv8CRitMD/jfi6C1Fbkw787+vVs1+X5mUhP+naCUpJIuC0PCv7/E4yeHMCjZ9psmR0
	bx9Gy2RBU+KCoweBjBK1tiHkL8LA+nbdex9Bc3M85eui6gRc6WB9jR4aMZBzM7twAaZM
	y+t+hJeaBhO1W5BE8R2P6XrijpfuDmsXNCgmLucfC2eVGB34Ow9R4oXivDnrqB+NZNLX
	+m2GpiTFT11yASUNjunwncvcgRT0QALiAJSfgkixDHopSHp+CQk3ucC6FL3rncKH3jdE
	rGPaEmuXz3L6st53b+Pv+L/6pQsZd7REXiQwYaBJt+I90AeyxsUkWxq2WQUvVFBqaJCa
	9LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9He1KDyDYqGSjC6hQ0RTdy5B8BWQGGvZ2nyP0lMgrtA=;
	b=bU2joKmXWzhFiWRKmNgNG1I78ShKV+rD0S4Apw9RmrkLhypRdyoDtMqMlpTkZeZoGF
	6z/HjdxCEvnwCXvNhg1leGQ9WM4S25Dnz6cCrOGd/65OAu71O7h7fkqUNaxgBlcs8+vQ
	YOvB2IHYvXryxIKIDAdV6aGUQRfGtfF+E8qQfqTtM9qnZU3SfHNtf4qdEexAFFr+EwGU
	zHcU0jTAqJp3vfywTRbWa7AsGmoZW6hLI+coXGp32gte38ns07HDD8nHN6aptbkoEDv9
	QxoiMiAntjxXnzQMRl5b9swjRGPxe99IvithZTsyCQnGsmTE2TYSyrjj7JWE+JJgpfNB
	V10A==
X-Gm-Message-State: AIkVDXIObF42DGwhC6xh0WvqauPiXXAJRV5N91gNl8sRPU9QYeEFY+ss9XFrxjjFY6tCwpjwyAJKXt/Y/4vtgg==
X-Received: by 10.28.18.194 with SMTP id 185mr3883727wms.124.1484353824072;
	Fri, 13 Jan 2017 16:30:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 13 Jan 2017 16:30:23 -0800 (PST)
In-Reply-To: <20170113232455.GI15833@denix.org>
References: <1482444889-16856-1-git-send-email-denis@denix.org>
	<20170102105051.GA3954@jama> <20170111002705.GC15833@denix.org>
	<CA+chaQcW-HOTstKGZuyTjHKVggMDeNzzivTHSmyhmQ4-yncyzQ@mail.gmail.com>
	<20170113211604.GF15833@denix.org> <20170113230656.GH15833@denix.org>
	<20170113232455.GI15833@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 14 Jan 2017 01:30:23 +0100
Message-ID: <CA+chaQfRmEW0MqeKGTeeTeQuDcr9mLufJAixWMNVFBztcT9zQg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][morty][PATCH] qtwayland: Fix building of QWaylandIntegration if some Qt5 features are disabled.
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
X-List-Received-Date: Sat, 14 Jan 2017 00:30:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Was it really merged?

Then why was it updated here instead of removing it completely?

https://patchwork.openembedded.org/patch/135662/

On Sat, Jan 14, 2017 at 12:24 AM, Denys Dmytriyenko <denis@denix.org> wrote=
:

> On Fri, Jan 13, 2017 at 06:06:56PM -0500, Denys Dmytriyenko wrote:
> > On Fri, Jan 13, 2017 at 04:16:04PM -0500, Denys Dmytriyenko wrote:
> > > On Wed, Jan 11, 2017 at 01:33:52AM +0100, Martin Jansa wrote:
> > > > morty-next
> > >
> > > I'm getting this:
> > >
> > > qtwebengine-5.7.1+gitAUTOINC+9cc97f0c63_b3c79e92f0-r0 do_fetch:
> Fetcher failure: Unable to find revision 9cc97f0c63049a8076476acc89c875c9=
e240abfb
> in branch 5.7 even from upstream
> >
> > But the good news is that qtwayland no longer seem to require the patch
> in
> > question for QWaylandIntegration!
>
> Ah, Never mind - just noticed that the patch was already merged before
> 5.7.1.
>
> I'll try fixing qtwebengine commit...
>
>
> > > > On Wed, Jan 11, 2017 at 1:27 AM, Denys Dmytriyenko <denis@denix.org=
>
> wrote:
> > > >
> > > > > On Mon, Jan 02, 2017 at 11:50:51AM +0100, Martin Jansa wrote:
> > > > > > On Thu, Dec 22, 2016 at 05:14:49PM -0500, Denys Dmytriyenko
> wrote:
> > > > > > > From: Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@gmail.com>
> > > > > > >
> > > > > > > QPlatformIntegration's interface methods are disabled based o=
n
> > > > > QT_NO_OPENGL,
> > > > > > > QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> > > > > > > QT_NO_SESSIONMANAGER, these has to be taken into account when
> compiling
> > > > > > > QtWayland.
> > > > > >
> > > > > > Is this still needed with:
> > > > > > [oe] [meta-qt5][morty][PATCH] qt5: update submodule SRCREVs to
> 5.7.1
> > > > > release
> > > > > >
> > > > > > The .patch doesn't apply in 5.7.1 anymore and I haven't had tim=
e
> to find
> > > > > > out why.
> > > > >
> > > > > I haven't tried it. Is 5.7.1 already in morty?
> > > > >
> > > > >
> > > > > > > Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@gmai=
l.com>
> > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > ---
> > > > > > >  recipes-qt/qt5/qtwayland-native_git.bb             |   1 +
> > > > > > >  ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156
> > > > > +++++++++++++++++++++
> > > > > > >  recipes-qt/qt5/qtwayland_git.bb                    |   1 +
> > > > > > >  3 files changed, 158 insertions(+)
> > > > > > >  create mode 100644 recipes-qt/qt5/qtwayland/0001-
> Fix-building-of-
> > > > > QWaylandIntegration-if-some-Qt5-feat.patch
> > > > > > >
> > > > > > > diff --git a/recipes-qt/qt5/qtwayland-native_git.bb
> b/recipes-qt/qt5/
> > > > > qtwayland-native_git.bb
> > > > > > > index a214346..1149aa5 100644
> > > > > > > --- a/recipes-qt/qt5/qtwayland-native_git.bb
> > > > > > > +++ b/recipes-qt/qt5/qtwayland-native_git.bb
> > > > > > > @@ -18,6 +18,7 @@ DEPENDS =3D "qtbase-native wayland-native"
> > > > > > >
> > > > > > >  SRC_URI +=3D " \
> > > > > > >      file://0001-Install-the-qtwaylandscanner-tool-to-the-
> native-side.patch
> > > > > \
> > > > > > > +    file://0001-Fix-building-of-QWaylandIntegration-if-some-
> Qt5-feat.patch
> > > > > \
> > > > > > >  "
> > > > > > >
> > > > > > >  do_configure() {
> > > > > > > diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-
> > > > > QWaylandIntegration-if-some-Qt5-feat.patch
> b/recipes-qt/qt5/qtwayland/
> > > > > 0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000..d173e67
> > > > > > > --- /dev/null
> > > > > > > +++ b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-
> > > > > QWaylandIntegration-if-some-Qt5-feat.patch
> > > > > > > @@ -0,0 +1,156 @@
> > > > > > > +From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17
> 00:00:00
> > > > > 2001
> > > > > > > +From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3D=
A4inen?=3D <
> > > > > dachaac@gmail.com>
> > > > > > > +Date: Sun, 18 Sep 2016 11:51:59 +0300
> > > > > > > +Subject: [PATCH] Fix building of QWaylandIntegration if some
> Qt5
> > > > > features are
> > > > > > > + disabled.
> > > > > > > +
> > > > > > > +QPlatformIntegration's interface methods are disabled based =
on
> > > > > QT_NO_OPENGL,
> > > > > > > +QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> > > > > > > +QT_NO_SESSIONMANAGER, these has to be taken into account whe=
n
> > > > > compiling
> > > > > > > +QtWayland.
> > > > > > > +---
> > > > > > > + src/client/qwaylandintegration.cpp | 21
> ++++++++++++++++++---
> > > > > > > + src/client/qwaylandintegration_p.h | 12 ++++++++++++
> > > > > > > + 2 files changed, 30 insertions(+), 3 deletions(-)
> > > > > > > +
> > > > > > > +diff --git a/src/client/qwaylandintegration.cpp b/src/client=
/
> > > > > qwaylandintegration.cpp
> > > > > > > +index 39fff53..481e3d6 100644
> > > > > > > +--- a/src/client/qwaylandintegration.cpp
> > > > > > > ++++ b/src/client/qwaylandintegration.cpp
> > > > > > > +@@ -39,7 +39,9 @@
> > > > > > > + #include "qwaylandinputcontext_p.h"
> > > > > > > + #include "qwaylandshmbackingstore_p.h"
> > > > > > > + #include "qwaylandnativeinterface_p.h"
> > > > > > > ++#ifndef QT_NO_CLIPBOARD
> > > > > > > + #include "qwaylandclipboard_p.h"
> > > > > > > ++#endif
> > > > > > > + #include "qwaylanddnd_p.h"
> > > > > > > + #include "qwaylandwindowmanagerintegration_p.h"
> > > > > > > + #include "qwaylandscreen_p.h"
> > > > > > > +@@ -57,7 +59,9 @@
> > > > > > > + #include <QSocketNotifier>
> > > > > > > +
> > > > > > > + #include <qpa/qplatforminputcontextfactory_p.h>
> > > > > > > ++#ifndef QT_NO_ACCESSIBILITY
> > > > > > > + #include <qpa/qplatformaccessibility.h>
> > > > > > > ++#endif
> > > > > > > + #include <qpa/qplatforminputcontext.h>
> > > > > > > +
> > > > > > > + #include "qwaylandhardwareintegration_p.h"
> > > > > > > +@@ -117,8 +121,6 @@ QWaylandIntegration::
> QWaylandIntegration()
> > > > > > > +     , mNativeInterface(new QWaylandNativeInterface(this))
> > > > > > > + #ifndef QT_NO_ACCESSIBILITY
> > > > > > > +     , mAccessibility(new QPlatformAccessibility())
> > > > > > > +-#else
> > > > > > > +-    , mAccessibility(0)
> > > > > > > + #endif
> > > > > > > +     , mClientBufferIntegrationInitialized(false)
> > > > > > > +     , mServerBufferIntegrationInitialized(false)
> > > > > > > +@@ -126,9 +128,12 @@ QWaylandIntegration::
> QWaylandIntegration()
> > > > > > > + {
> > > > > > > +     initializeInputDeviceIntegration();
> > > > > > > +     mDisplay =3D new QWaylandDisplay(this);
> > > > > > > ++#ifndef QT_NO_CLIPBOARD
> > > > > > > +     mClipboard =3D new QWaylandClipboard(mDisplay);
> > > > > > > ++#endif
> > > > > > > ++#ifndef QT_NO_DRAGANDDROP
> > > > > > > +     mDrag =3D new QWaylandDrag(mDisplay);
> > > > > > > +-
> > > > > > > ++#endif
> > > > > > > +     QString icStr =3D QPlatformInputContextFactory::
> requested();
> > > > > > > +     icStr.isNull() ? mInputContext.reset(new
> > > > > QWaylandInputContext(mDisplay))
> > > > > > > +                    : mInputContext.reset(
> > > > > QPlatformInputContextFactory::create(icStr));
> > > > > > > +@@ -136,8 +141,12 @@ QWaylandIntegration::
> QWaylandIntegration()
> > > > > > > +
> > > > > > > + QWaylandIntegration::~QWaylandIntegration()
> > > > > > > + {
> > > > > > > ++#ifndef QT_NO_DRAGANDDROP
> > > > > > > +     delete mDrag;
> > > > > > > ++#endif
> > > > > > > ++#ifndef QT_NO_CLIPBOARD
> > > > > > > +     delete mClipboard;
> > > > > > > ++#endif
> > > > > > > + #ifndef QT_NO_ACCESSIBILITY
> > > > > > > +     delete mAccessibility;
> > > > > > > + #endif
> > > > > > > +@@ -213,15 +222,19 @@ QPlatformFontDatabase
> *QWaylandIntegration::fontDatabase()
> > > > > const
> > > > > > > +     return mFontDb;
> > > > > > > + }
> > > > > > > +
> > > > > > > ++#ifndef QT_NO_CLIPBOARD
> > > > > > > + QPlatformClipboard *QWaylandIntegration::clipboard() const
> > > > > > > + {
> > > > > > > +     return mClipboard;
> > > > > > > + }
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > ++#ifndef QT_NO_DRAGANDDROP
> > > > > > > + QPlatformDrag *QWaylandIntegration::drag() const
> > > > > > > + {
> > > > > > > +     return mDrag;
> > > > > > > + }
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > + QPlatformInputContext *QWaylandIntegration::inputContext()
> const
> > > > > > > + {
> > > > > > > +@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::
> styleHint(StyleHint
> > > > > hint) const
> > > > > > > +     return QPlatformIntegration::styleHint(hint);
> > > > > > > + }
> > > > > > > +
> > > > > > > ++#ifndef QT_NO_ACCESSIBILITY
> > > > > > > + QPlatformAccessibility *QWaylandIntegration::accessibility(=
)
> const
> > > > > > > + {
> > > > > > > +     return mAccessibility;
> > > > > > > + }
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > + QPlatformServices *QWaylandIntegration::services() const
> > > > > > > + {
> > > > > > > +diff --git a/src/client/qwaylandintegration_p.h b/src/client=
/
> > > > > qwaylandintegration_p.h
> > > > > > > +index 987d805..b50ad95 100644
> > > > > > > +--- a/src/client/qwaylandintegration_p.h
> > > > > > > ++++ b/src/client/qwaylandintegration_p.h
> > > > > > > +@@ -80,15 +80,21 @@ public:
> > > > > > > +
> > > > > > > +     QPlatformNativeInterface *nativeInterface() const
> > > > > Q_DECL_OVERRIDE;
> > > > > > > +
> > > > > > > ++#ifndef QT_NO_CLIPBOARD
> > > > > > > +     QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > ++#ifndef QT_NO_DRAGANDDROP
> > > > > > > +     QPlatformDrag *drag() const Q_DECL_OVERRIDE;
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > +     QPlatformInputContext *inputContext() const
> Q_DECL_OVERRIDE;
> > > > > > > +
> > > > > > > +     QVariant styleHint(StyleHint hint) const Q_DECL_OVERRID=
E;
> > > > > > > +
> > > > > > > ++#ifndef QT_NO_ACCESSIBILITY
> > > > > > > +     QPlatformAccessibility *accessibility() const
> Q_DECL_OVERRIDE;
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > +     QPlatformServices *services() const Q_DECL_OVERRIDE;
> > > > > > > +
> > > > > > > +@@ -117,12 +123,18 @@ private:
> > > > > > > +     void initializeInputDeviceIntegration();
> > > > > > > +
> > > > > > > +     QPlatformFontDatabase *mFontDb;
> > > > > > > ++#ifndef QT_NO_CLIPBOARD
> > > > > > > +     QPlatformClipboard *mClipboard;
> > > > > > > ++#endif
> > > > > > > ++#ifndef QT_NO_DRAGANDDROP
> > > > > > > +     QPlatformDrag *mDrag;
> > > > > > > ++#endif
> > > > > > > +     QWaylandDisplay *mDisplay;
> > > > > > > +     QPlatformNativeInterface *mNativeInterface;
> > > > > > > +     QScopedPointer<QPlatformInputContext> mInputContext;
> > > > > > > ++#ifndef QT_NO_ACCESSIBILITY
> > > > > > > +     QPlatformAccessibility *mAccessibility;
> > > > > > > ++#endif
> > > > > > > +     bool mClientBufferIntegrationInitialized;
> > > > > > > +     bool mServerBufferIntegrationInitialized;
> > > > > > > +     bool mShellIntegrationInitialized;
> > > > > > > +--
> > > > > > > +2.7.4
> > > > > > > +
> > > > > > > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5=
/
> > > > > qtwayland_git.bb
> > > > > > > index b208961..e315924 100644
> > > > > > > --- a/recipes-qt/qt5/qtwayland_git.bb
> > > > > > > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > > > > > > @@ -46,6 +46,7 @@ FILES_${PN}-plugins-dbg +=3D " \
> > > > > > >
> > > > > > >  SRC_URI +=3D " \
> > > > > > >      file://0001-examples-wayland-include-server-buffer-only-
> when-bui.patch
> > > > > \
> > > > > > > +    file://0001-Fix-building-of-QWaylandIntegration-if-some-
> Qt5-feat.patch
> > > > > \
> > > > > > >  "
> > > > > > >
> > > > > > >  SRCREV =3D "a172672484b9496819e588b51ac2ff9fb4a21941"
> > > > > > > --
> > > > > > > 2.7.4
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > >
> > > > >
> > > > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

