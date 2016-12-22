Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7DF776FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B457D20A48
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:11:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id oDsggYk_VfCa
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:11:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94791207BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:11:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C0AEA1621EE; Thu, 22 Dec 2016 17:11:26 -0500 (EST)
Date: Thu, 22 Dec 2016 17:11:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161222221126.GJ30576@denix.org>
References: <1476819652-13977-1-git-send-email-denis@denix.org>
	<20161025183948.GG2494@denix.org>
MIME-Version: 1.0
In-Reply-To: <20161025183948.GG2494@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][master][PATCH] qtwayland: Fix building of QWaylandIntegration if some Qt5 features are disabled.
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
X-List-Received-Date: Thu, 22 Dec 2016 22:11:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

I just noticed that this patch was submitted to krogoth and then master before 
morty release, but got merged after morty was branched off and is now missing.

I'll re-submit it again specifically for morty...

-- 
Denys


On Tue, Oct 25, 2016 at 02:39:48PM -0400, Denys Dmytriyenko wrote:
> ping
> 
> 
> On Tue, Oct 18, 2016 at 03:40:52PM -0400, Denys Dmytriyenko wrote:
> > From: Vesa J‰‰skel‰inen <dachaac@gmail.com>
> > 
> > QPlatformIntegration's interface methods are disabled based on QT_NO_OPENGL,
> > QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> > QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
> > QtWayland.
> > 
> > Signed-off-by: Vesa J‰‰skel‰inen <dachaac@gmail.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > Adopted to current meta-qt5/master with Qt 5.7.0 from here:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109281.html
> > 
> >  recipes-qt/qt5/qtwayland-native_git.bb             |   1 +
> >  ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156 +++++++++++++++++++++
> >  recipes-qt/qt5/qtwayland_git.bb                    |   1 +
> >  3 files changed, 158 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
> > 
> > diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
> > index a214346..1149aa5 100644
> > --- a/recipes-qt/qt5/qtwayland-native_git.bb
> > +++ b/recipes-qt/qt5/qtwayland-native_git.bb
> > @@ -18,6 +18,7 @@ DEPENDS = "qtbase-native wayland-native"
> >  
> >  SRC_URI += " \
> >      file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
> > +    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch \
> >  "
> >  
> >  do_configure() {
> > diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
> > new file mode 100644
> > index 0000000..d173e67
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
> > @@ -0,0 +1,156 @@
> > +From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
> > +Date: Sun, 18 Sep 2016 11:51:59 +0300
> > +Subject: [PATCH] Fix building of QWaylandIntegration if some Qt5 features are
> > + disabled.
> > +
> > +QPlatformIntegration's interface methods are disabled based on QT_NO_OPENGL,
> > +QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> > +QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
> > +QtWayland.
> > +---
> > + src/client/qwaylandintegration.cpp | 21 ++++++++++++++++++---
> > + src/client/qwaylandintegration_p.h | 12 ++++++++++++
> > + 2 files changed, 30 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/src/client/qwaylandintegration.cpp b/src/client/qwaylandintegration.cpp
> > +index 39fff53..481e3d6 100644
> > +--- a/src/client/qwaylandintegration.cpp
> > ++++ b/src/client/qwaylandintegration.cpp
> > +@@ -39,7 +39,9 @@
> > + #include "qwaylandinputcontext_p.h"
> > + #include "qwaylandshmbackingstore_p.h"
> > + #include "qwaylandnativeinterface_p.h"
> > ++#ifndef QT_NO_CLIPBOARD
> > + #include "qwaylandclipboard_p.h"
> > ++#endif
> > + #include "qwaylanddnd_p.h"
> > + #include "qwaylandwindowmanagerintegration_p.h"
> > + #include "qwaylandscreen_p.h"
> > +@@ -57,7 +59,9 @@
> > + #include <QSocketNotifier>
> > + 
> > + #include <qpa/qplatforminputcontextfactory_p.h>
> > ++#ifndef QT_NO_ACCESSIBILITY
> > + #include <qpa/qplatformaccessibility.h>
> > ++#endif
> > + #include <qpa/qplatforminputcontext.h>
> > + 
> > + #include "qwaylandhardwareintegration_p.h"
> > +@@ -117,8 +121,6 @@ QWaylandIntegration::QWaylandIntegration()
> > +     , mNativeInterface(new QWaylandNativeInterface(this))
> > + #ifndef QT_NO_ACCESSIBILITY
> > +     , mAccessibility(new QPlatformAccessibility())
> > +-#else
> > +-    , mAccessibility(0)
> > + #endif
> > +     , mClientBufferIntegrationInitialized(false)
> > +     , mServerBufferIntegrationInitialized(false)
> > +@@ -126,9 +128,12 @@ QWaylandIntegration::QWaylandIntegration()
> > + {
> > +     initializeInputDeviceIntegration();
> > +     mDisplay = new QWaylandDisplay(this);
> > ++#ifndef QT_NO_CLIPBOARD
> > +     mClipboard = new QWaylandClipboard(mDisplay);
> > ++#endif
> > ++#ifndef QT_NO_DRAGANDDROP
> > +     mDrag = new QWaylandDrag(mDisplay);
> > +-
> > ++#endif
> > +     QString icStr = QPlatformInputContextFactory::requested();
> > +     icStr.isNull() ? mInputContext.reset(new QWaylandInputContext(mDisplay))
> > +                    : mInputContext.reset(QPlatformInputContextFactory::create(icStr));
> > +@@ -136,8 +141,12 @@ QWaylandIntegration::QWaylandIntegration()
> > + 
> > + QWaylandIntegration::~QWaylandIntegration()
> > + {
> > ++#ifndef QT_NO_DRAGANDDROP
> > +     delete mDrag;
> > ++#endif
> > ++#ifndef QT_NO_CLIPBOARD
> > +     delete mClipboard;
> > ++#endif
> > + #ifndef QT_NO_ACCESSIBILITY
> > +     delete mAccessibility;
> > + #endif
> > +@@ -213,15 +222,19 @@ QPlatformFontDatabase *QWaylandIntegration::fontDatabase() const
> > +     return mFontDb;
> > + }
> > + 
> > ++#ifndef QT_NO_CLIPBOARD
> > + QPlatformClipboard *QWaylandIntegration::clipboard() const
> > + {
> > +     return mClipboard;
> > + }
> > ++#endif
> > + 
> > ++#ifndef QT_NO_DRAGANDDROP
> > + QPlatformDrag *QWaylandIntegration::drag() const
> > + {
> > +     return mDrag;
> > + }
> > ++#endif
> > + 
> > + QPlatformInputContext *QWaylandIntegration::inputContext() const
> > + {
> > +@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::styleHint(StyleHint hint) const
> > +     return QPlatformIntegration::styleHint(hint);
> > + }
> > + 
> > ++#ifndef QT_NO_ACCESSIBILITY
> > + QPlatformAccessibility *QWaylandIntegration::accessibility() const
> > + {
> > +     return mAccessibility;
> > + }
> > ++#endif
> > + 
> > + QPlatformServices *QWaylandIntegration::services() const
> > + {
> > +diff --git a/src/client/qwaylandintegration_p.h b/src/client/qwaylandintegration_p.h
> > +index 987d805..b50ad95 100644
> > +--- a/src/client/qwaylandintegration_p.h
> > ++++ b/src/client/qwaylandintegration_p.h
> > +@@ -80,15 +80,21 @@ public:
> > + 
> > +     QPlatformNativeInterface *nativeInterface() const Q_DECL_OVERRIDE;
> > + 
> > ++#ifndef QT_NO_CLIPBOARD
> > +     QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
> > ++#endif
> > + 
> > ++#ifndef QT_NO_DRAGANDDROP
> > +     QPlatformDrag *drag() const Q_DECL_OVERRIDE;
> > ++#endif
> > + 
> > +     QPlatformInputContext *inputContext() const Q_DECL_OVERRIDE;
> > + 
> > +     QVariant styleHint(StyleHint hint) const Q_DECL_OVERRIDE;
> > + 
> > ++#ifndef QT_NO_ACCESSIBILITY
> > +     QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
> > ++#endif
> > + 
> > +     QPlatformServices *services() const Q_DECL_OVERRIDE;
> > + 
> > +@@ -117,12 +123,18 @@ private:
> > +     void initializeInputDeviceIntegration();
> > + 
> > +     QPlatformFontDatabase *mFontDb;
> > ++#ifndef QT_NO_CLIPBOARD
> > +     QPlatformClipboard *mClipboard;
> > ++#endif
> > ++#ifndef QT_NO_DRAGANDDROP
> > +     QPlatformDrag *mDrag;
> > ++#endif
> > +     QWaylandDisplay *mDisplay;
> > +     QPlatformNativeInterface *mNativeInterface;
> > +     QScopedPointer<QPlatformInputContext> mInputContext;
> > ++#ifndef QT_NO_ACCESSIBILITY
> > +     QPlatformAccessibility *mAccessibility;
> > ++#endif
> > +     bool mClientBufferIntegrationInitialized;
> > +     bool mServerBufferIntegrationInitialized;
> > +     bool mShellIntegrationInitialized;
> > +-- 
> > +2.7.4
> > +
> > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
> > index b208961..e315924 100644
> > --- a/recipes-qt/qt5/qtwayland_git.bb
> > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > @@ -46,6 +46,7 @@ FILES_${PN}-plugins-dbg += " \
> >  
> >  SRC_URI += " \
> >      file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
> > +    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch \
> >  "
> >  
> >  SRCREV = "a172672484b9496819e588b51ac2ff9fb4a21941"
> > -- 
> > 2.7.4
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

