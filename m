Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B9FDC71A2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 00:33:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so13175091wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=16X1FrN5r6NAI2Rjw9grcR08qucHXTvVk3G2QaYyM04=;
	b=DrnWz3ji12dwXeJ/Fgd/OqT/jkAuCthqCC8Xk4DfqIGu/8AVr81WELPYu6m9xpGPGr
	1dfFJJA+H7PVBASe/m4+GUh6fLufT+44TyhzIk6i6VHkti63v+ks0P6AgT+m4nlIAzDT
	WM/nCvU9o/lqmOPmsmy3YlMpOBEtIi9D0EMkusPqJ8J58iBDpRU1cSL0ettu5Mi57jPO
	gQaizyXg7Po/BjzaoWEm5u4omn9oSOISFdEo5XK9qqxTSprS7cCiyZLfbRu1DI81a7Ap
	6rF7gOs3asWww53TkdKr8IGViT94jcF2uAgFRCWd0dPRG+mQV1sSvHWNjkTGutQ8NQfT
	FXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=16X1FrN5r6NAI2Rjw9grcR08qucHXTvVk3G2QaYyM04=;
	b=oukmfi5oIFCqKI7sZQQEdYiqj+aIT3GGWOzr/LNTx6NCNQ/BoBH2Brg0zIzFn6s4HU
	Zp0SMg47B+W+mh1bNlDmTsHBLJUUaW6VLejHNF+txKRGpu+Cuva2EN1ahdTP/zTo5pHP
	Vk1dYVnsbTcb8GpwTCfBnSwL2/p2O+oLdabK0G3coKgrMFvo470bOZBlWHFBf/tEHB9S
	DPI7ApzsGahD7XkgLgECYks9N5u/7w8KsUxXEcyERoaoYUu+RyC+/Ir+PqnRgLjyx/1o
	OneZVqq5OrgHbSFRpcymIRM+NhpT4Zy4xo+Vl+EVaTJ/ugnFhkcrUqv37O4zbwAVow4V
	PEXg==
X-Gm-Message-State: AIkVDXKA3RNVdRPvmEHKL4PhQobIHTY4JCoY46OTlv0J4mYhQPdoZmtjjqO2eehofpRxub2Tst9/WBHy2oPS0Q==
X-Received: by 10.28.96.130 with SMTP id u124mr1414027wmb.81.1484094833525;
	Tue, 10 Jan 2017 16:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Tue, 10 Jan 2017 16:33:52 -0800 (PST)
In-Reply-To: <20170111002705.GC15833@denix.org>
References: <1482444889-16856-1-git-send-email-denis@denix.org>
	<20170102105051.GA3954@jama> <20170111002705.GC15833@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Jan 2017 01:33:52 +0100
Message-ID: <CA+chaQcW-HOTstKGZuyTjHKVggMDeNzzivTHSmyhmQ4-yncyzQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 00:33:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

morty-next

On Wed, Jan 11, 2017 at 1:27 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Jan 02, 2017 at 11:50:51AM +0100, Martin Jansa wrote:
> > On Thu, Dec 22, 2016 at 05:14:49PM -0500, Denys Dmytriyenko wrote:
> > > From: Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@gmail.com>
> > >
> > > QPlatformIntegration's interface methods are disabled based on
> QT_NO_OPENGL,
> > > QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> > > QT_NO_SESSIONMANAGER, these has to be taken into account when compili=
ng
> > > QtWayland.
> >
> > Is this still needed with:
> > [oe] [meta-qt5][morty][PATCH] qt5: update submodule SRCREVs to 5.7.1
> release
> >
> > The .patch doesn't apply in 5.7.1 anymore and I haven't had time to fin=
d
> > out why.
>
> I haven't tried it. Is 5.7.1 already in morty?
>
>
> > > Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@gmail.com>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  recipes-qt/qt5/qtwayland-native_git.bb             |   1 +
> > >  ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156
> +++++++++++++++++++++
> > >  recipes-qt/qt5/qtwayland_git.bb                    |   1 +
> > >  3 files changed, 158 insertions(+)
> > >  create mode 100644 recipes-qt/qt5/qtwayland/0001-Fix-building-of-
> QWaylandIntegration-if-some-Qt5-feat.patch
> > >
> > > diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/
> qtwayland-native_git.bb
> > > index a214346..1149aa5 100644
> > > --- a/recipes-qt/qt5/qtwayland-native_git.bb
> > > +++ b/recipes-qt/qt5/qtwayland-native_git.bb
> > > @@ -18,6 +18,7 @@ DEPENDS =3D "qtbase-native wayland-native"
> > >
> > >  SRC_URI +=3D " \
> > >      file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side=
.patch
> \
> > > +    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat=
.patch
> \
> > >  "
> > >
> > >  do_configure() {
> > > diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-
> QWaylandIntegration-if-some-Qt5-feat.patch b/recipes-qt/qt5/qtwayland/
> 0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
> > > new file mode 100644
> > > index 0000000..d173e67
> > > --- /dev/null
> > > +++ b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-
> QWaylandIntegration-if-some-Qt5-feat.patch
> > > @@ -0,0 +1,156 @@
> > > +From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17 00:00:00
> 2001
> > > +From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=
=3D <
> dachaac@gmail.com>
> > > +Date: Sun, 18 Sep 2016 11:51:59 +0300
> > > +Subject: [PATCH] Fix building of QWaylandIntegration if some Qt5
> features are
> > > + disabled.
> > > +
> > > +QPlatformIntegration's interface methods are disabled based on
> QT_NO_OPENGL,
> > > +QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> > > +QT_NO_SESSIONMANAGER, these has to be taken into account when
> compiling
> > > +QtWayland.
> > > +---
> > > + src/client/qwaylandintegration.cpp | 21 ++++++++++++++++++---
> > > + src/client/qwaylandintegration_p.h | 12 ++++++++++++
> > > + 2 files changed, 30 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/src/client/qwaylandintegration.cpp b/src/client/
> qwaylandintegration.cpp
> > > +index 39fff53..481e3d6 100644
> > > +--- a/src/client/qwaylandintegration.cpp
> > > ++++ b/src/client/qwaylandintegration.cpp
> > > +@@ -39,7 +39,9 @@
> > > + #include "qwaylandinputcontext_p.h"
> > > + #include "qwaylandshmbackingstore_p.h"
> > > + #include "qwaylandnativeinterface_p.h"
> > > ++#ifndef QT_NO_CLIPBOARD
> > > + #include "qwaylandclipboard_p.h"
> > > ++#endif
> > > + #include "qwaylanddnd_p.h"
> > > + #include "qwaylandwindowmanagerintegration_p.h"
> > > + #include "qwaylandscreen_p.h"
> > > +@@ -57,7 +59,9 @@
> > > + #include <QSocketNotifier>
> > > +
> > > + #include <qpa/qplatforminputcontextfactory_p.h>
> > > ++#ifndef QT_NO_ACCESSIBILITY
> > > + #include <qpa/qplatformaccessibility.h>
> > > ++#endif
> > > + #include <qpa/qplatforminputcontext.h>
> > > +
> > > + #include "qwaylandhardwareintegration_p.h"
> > > +@@ -117,8 +121,6 @@ QWaylandIntegration::QWaylandIntegration()
> > > +     , mNativeInterface(new QWaylandNativeInterface(this))
> > > + #ifndef QT_NO_ACCESSIBILITY
> > > +     , mAccessibility(new QPlatformAccessibility())
> > > +-#else
> > > +-    , mAccessibility(0)
> > > + #endif
> > > +     , mClientBufferIntegrationInitialized(false)
> > > +     , mServerBufferIntegrationInitialized(false)
> > > +@@ -126,9 +128,12 @@ QWaylandIntegration::QWaylandIntegration()
> > > + {
> > > +     initializeInputDeviceIntegration();
> > > +     mDisplay =3D new QWaylandDisplay(this);
> > > ++#ifndef QT_NO_CLIPBOARD
> > > +     mClipboard =3D new QWaylandClipboard(mDisplay);
> > > ++#endif
> > > ++#ifndef QT_NO_DRAGANDDROP
> > > +     mDrag =3D new QWaylandDrag(mDisplay);
> > > +-
> > > ++#endif
> > > +     QString icStr =3D QPlatformInputContextFactory::requested();
> > > +     icStr.isNull() ? mInputContext.reset(new
> QWaylandInputContext(mDisplay))
> > > +                    : mInputContext.reset(
> QPlatformInputContextFactory::create(icStr));
> > > +@@ -136,8 +141,12 @@ QWaylandIntegration::QWaylandIntegration()
> > > +
> > > + QWaylandIntegration::~QWaylandIntegration()
> > > + {
> > > ++#ifndef QT_NO_DRAGANDDROP
> > > +     delete mDrag;
> > > ++#endif
> > > ++#ifndef QT_NO_CLIPBOARD
> > > +     delete mClipboard;
> > > ++#endif
> > > + #ifndef QT_NO_ACCESSIBILITY
> > > +     delete mAccessibility;
> > > + #endif
> > > +@@ -213,15 +222,19 @@ QPlatformFontDatabase *QWaylandIntegration::fo=
ntDatabase()
> const
> > > +     return mFontDb;
> > > + }
> > > +
> > > ++#ifndef QT_NO_CLIPBOARD
> > > + QPlatformClipboard *QWaylandIntegration::clipboard() const
> > > + {
> > > +     return mClipboard;
> > > + }
> > > ++#endif
> > > +
> > > ++#ifndef QT_NO_DRAGANDDROP
> > > + QPlatformDrag *QWaylandIntegration::drag() const
> > > + {
> > > +     return mDrag;
> > > + }
> > > ++#endif
> > > +
> > > + QPlatformInputContext *QWaylandIntegration::inputContext() const
> > > + {
> > > +@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::styleHint(StyleH=
int
> hint) const
> > > +     return QPlatformIntegration::styleHint(hint);
> > > + }
> > > +
> > > ++#ifndef QT_NO_ACCESSIBILITY
> > > + QPlatformAccessibility *QWaylandIntegration::accessibility() const
> > > + {
> > > +     return mAccessibility;
> > > + }
> > > ++#endif
> > > +
> > > + QPlatformServices *QWaylandIntegration::services() const
> > > + {
> > > +diff --git a/src/client/qwaylandintegration_p.h b/src/client/
> qwaylandintegration_p.h
> > > +index 987d805..b50ad95 100644
> > > +--- a/src/client/qwaylandintegration_p.h
> > > ++++ b/src/client/qwaylandintegration_p.h
> > > +@@ -80,15 +80,21 @@ public:
> > > +
> > > +     QPlatformNativeInterface *nativeInterface() const
> Q_DECL_OVERRIDE;
> > > +
> > > ++#ifndef QT_NO_CLIPBOARD
> > > +     QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
> > > ++#endif
> > > +
> > > ++#ifndef QT_NO_DRAGANDDROP
> > > +     QPlatformDrag *drag() const Q_DECL_OVERRIDE;
> > > ++#endif
> > > +
> > > +     QPlatformInputContext *inputContext() const Q_DECL_OVERRIDE;
> > > +
> > > +     QVariant styleHint(StyleHint hint) const Q_DECL_OVERRIDE;
> > > +
> > > ++#ifndef QT_NO_ACCESSIBILITY
> > > +     QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
> > > ++#endif
> > > +
> > > +     QPlatformServices *services() const Q_DECL_OVERRIDE;
> > > +
> > > +@@ -117,12 +123,18 @@ private:
> > > +     void initializeInputDeviceIntegration();
> > > +
> > > +     QPlatformFontDatabase *mFontDb;
> > > ++#ifndef QT_NO_CLIPBOARD
> > > +     QPlatformClipboard *mClipboard;
> > > ++#endif
> > > ++#ifndef QT_NO_DRAGANDDROP
> > > +     QPlatformDrag *mDrag;
> > > ++#endif
> > > +     QWaylandDisplay *mDisplay;
> > > +     QPlatformNativeInterface *mNativeInterface;
> > > +     QScopedPointer<QPlatformInputContext> mInputContext;
> > > ++#ifndef QT_NO_ACCESSIBILITY
> > > +     QPlatformAccessibility *mAccessibility;
> > > ++#endif
> > > +     bool mClientBufferIntegrationInitialized;
> > > +     bool mServerBufferIntegrationInitialized;
> > > +     bool mShellIntegrationInitialized;
> > > +--
> > > +2.7.4
> > > +
> > > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/
> qtwayland_git.bb
> > > index b208961..e315924 100644
> > > --- a/recipes-qt/qt5/qtwayland_git.bb
> > > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > > @@ -46,6 +46,7 @@ FILES_${PN}-plugins-dbg +=3D " \
> > >
> > >  SRC_URI +=3D " \
> > >      file://0001-examples-wayland-include-server-buffer-only-when-bui=
.patch
> \
> > > +    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat=
.patch
> \
> > >  "
> > >
> > >  SRCREV =3D "a172672484b9496819e588b51ac2ff9fb4a21941"
> > > --
> > > 2.7.4
> > >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>

