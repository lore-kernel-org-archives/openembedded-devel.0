Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9896013D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2015 18:28:24 +0000 (UTC)
Received: by wevl61 with SMTP id l61so41674866wev.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2015 10:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hzQAhdGBo94C9kVdxhF+42N8o9wbis8YFo2/QEc1zJo=;
	b=mbmfajH9Rf2T9C0losqXN8bfx1pb9MYsqY5nCkoUBDxlxxCxQSWzRG9cKnxwKsbR53
	kUacsq6Z+nuVcqGLCC/YEs8KVrJ9loUVuhJOPFzYE3jzTYTQMHcdLkqpnFgTEY1eBBcd
	NtWZhlF5PnBTOdBPOtOcSd2NpH3TyqknK5CO95iqDo2BFdtJ+vz5ZhBe+jPW4JQgngLg
	T1bgMAL5hJwI6NAGsFkL9XaIvSPkcZeHdqN6IjJHr4wTONfP09IbidjvLsrXQO+25xa3
	dPKVRcDboOAbPlyyc04JScGrglcfaoD4gvLRLwZnuJKjnHd4Q57VgREAzEL09y4rg/y+
	deKw==
X-Received: by 10.194.81.1 with SMTP id v1mr502929wjx.50.1425407305546;
	Tue, 03 Mar 2015 10:28:25 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v16sm21680599wib.5.2015.03.03.10.28.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 10:28:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 Mar 2015 19:28:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150303182827.GC2337@jama>
References: <1425403541-19039-1-git-send-email-stephan.binner@basyskom.com>
MIME-Version: 1.0
In-Reply-To: <1425403541-19039-1-git-send-email-stephan.binner@basyskom.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] fix build of qtwebengine if qtbase has no accessibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2015 18:28:32 -0000
X-Groupsio-MsgNum: 54602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline

--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 06:25:41PM +0100, Stephan Binner wrote:
> Signed-off-by: Stephan Binner <stephan.binner@basyskom.com>
> ---
>  recipes-qt/qt5/qtbase.inc                          |   2 +-
>  .../0004-fix-build-without-accessiblity.diff       | 498 +++++++++++++++=
++++++
>  recipes-qt/qt5/qtwebengine_5.4.1.bb                |   1 +
>  3 files changed, 500 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-qt/qt5/qtwebengine/0004-fix-build-without-acc=
essiblity.diff
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index c6fe358..d7c027f 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -64,7 +64,7 @@ PACKAGECONFIG[examples] =3D "-make examples -compile-ex=
amples,-nomake examples"
>  PACKAGECONFIG[tools] =3D "-make tools,-nomake tools"
>  # only for completeness, configure will add libs even if you try to expl=
icitly remove it
>  PACKAGECONFIG[libs] =3D "-make libs,-nomake libs"
> -# accessibility is required to compile qtquickcontrols and qtwebengine
> +# accessibility is required to compile qtquickcontrols
>  PACKAGECONFIG[accessibility] =3D "-accessibility,-no-accessibility"
>  PACKAGECONFIG[glib] =3D "-glib,-no-glib,glib-2.0"
>  # use either system freetype or bundled freetype, if you disable freetyp=
e completely
> diff --git a/recipes-qt/qt5/qtwebengine/0004-fix-build-without-accessibli=
ty.diff b/recipes-qt/qt5/qtwebengine/0004-fix-build-without-accessiblity.di=
ff
> new file mode 100644
> index 0000000..85255d1
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0004-fix-build-without-accessiblity.diff
> @@ -0,0 +1,498 @@
> +commit 11786ea03a2c474c5629c016ca5bf59d07c69a04
> +Author: Stephan Binner <stephan.binner@basyskom.com>
> +Date:   Mon Mar 2 14:06:48 2015 +0100
> +
> +    Enable building Qt WebEngine without accessiblity enabled.
> +   =20
> +    Backport of https://codereview.qt-project.org/#/c/104207/

I'll fix it this time, but next time please use "git format-patch" to
create .patch files with proper headers (to apply with git am).

And the right syntax is:

Upstream-Status: Backport https://codereview.qt-project.org/#/c/104207/

and add information in which branch/version it's already applied.

> +
> +diff --git a/examples/webengine/quicknanobrowser/quicknanobrowser.pro b/=
examples/webengine/quicknanobrowser/quicknanobrowser.pro
> +index 3628b81..a8e57b0 100644
> +--- a/examples/webengine/quicknanobrowser/quicknanobrowser.pro
> ++++ b/examples/webengine/quicknanobrowser/quicknanobrowser.pro
> +@@ -1,3 +1,5 @@
> ++requires(contains(QT_CONFIG, accessibility))
> ++
> + TEMPLATE =3D app
> + TARGET =3D quicknanobrowser
> +=20
> +diff --git a/src/core/browser_accessibility_manager_qt.cpp b/src/core/br=
owser_accessibility_manager_qt.cpp
> +index 28d0dd7..6729866 100644
> +--- a/src/core/browser_accessibility_manager_qt.cpp
> ++++ b/src/core/browser_accessibility_manager_qt.cpp
> +@@ -45,9 +45,14 @@ namespace content {
> +=20
> + BrowserAccessibility *BrowserAccessibilityFactoryQt::Create()
> + {
> ++#ifndef QT_NO_ACCESSIBILITY
> +     return new BrowserAccessibilityQt();
> ++#else
> ++    return 0;
> ++#endif // QT_NO_ACCESSIBILITY
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + BrowserAccessibilityManagerQt::BrowserAccessibilityManagerQt(
> +     QObject* parentObject,
> +     const ui::AXTreeUpdate& initialTree,
> +@@ -131,5 +136,6 @@ void BrowserAccessibilityManagerQt::NotifyAccessibil=
ityEvent(ui::AXEvent event_t
> +         break;
> +     }
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + }
> +diff --git a/src/core/browser_accessibility_manager_qt.h b/src/core/brow=
ser_accessibility_manager_qt.h
> +index 5d8498d..49b3af3 100644
> +--- a/src/core/browser_accessibility_manager_qt.h
> ++++ b/src/core/browser_accessibility_manager_qt.h
> +@@ -38,6 +38,7 @@
> + #define BROWSER_ACCESSIBILITY_MANAGER_QT_H
> +=20
> + #include "content/browser/accessibility/browser_accessibility_manager.h"
> ++#ifndef QT_NO_ACCESSIBILITY
> + #include <QtCore/qobject.h>
> +=20
> + QT_BEGIN_NAMESPACE
> +@@ -74,4 +75,5 @@ private:
> +=20
> + }
> +=20
> ++#endif // QT_NO_ACCESSIBILITY
> + #endif
> +diff --git a/src/core/browser_accessibility_qt.cpp b/src/core/browser_ac=
cessibility_qt.cpp
> +index b5cd26f..4b8e97a 100644
> +--- a/src/core/browser_accessibility_qt.cpp
> ++++ b/src/core/browser_accessibility_qt.cpp
> +@@ -40,6 +40,8 @@
> +=20
> + #include "browser_accessibility_qt.h"
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> ++
> + #include "third_party/WebKit/public/web/WebAXEnums.h"
> + #include "ui/accessibility/ax_node_data.h"
> +=20
> +@@ -898,3 +900,5 @@ void BrowserAccessibilityQt::modelChange(QAccessible=
TableModelChangeEvent *)
> + }
> +=20
> + } // namespace content
> ++
> ++#endif // QT_NO_ACCESSIBILITY
> +diff --git a/src/core/browser_accessibility_qt.h b/src/core/browser_acce=
ssibility_qt.h
> +index db190ff..e87b5d8 100644
> +--- a/src/core/browser_accessibility_qt.h
> ++++ b/src/core/browser_accessibility_qt.h
> +@@ -38,6 +38,8 @@
> + #define BROWSER_ACCESSIBILITY_QT_H
> +=20
> + #include <QtGui/qaccessible.h>
> ++
> ++#ifndef QT_NO_ACCESSIBILITY
> + #include "content/browser/accessibility/browser_accessibility.h"
> +=20
> + namespace content {
> +@@ -145,4 +147,5 @@ public:
> +=20
> + }
> +=20
> ++#endif // QT_NO_ACCESSIBILITY
> + #endif
> +diff --git a/src/core/render_widget_host_view_qt.cpp b/src/core/render_w=
idget_host_view_qt.cpp
> +index c221e94..349028e 100644
> +--- a/src/core/render_widget_host_view_qt.cpp
> ++++ b/src/core/render_widget_host_view_qt.cpp
> +@@ -198,15 +198,18 @@ RenderWidgetHostViewQt::RenderWidgetHostViewQt(con=
tent::RenderWidgetHost* widget
> +     , m_initPending(false)
> + {
> +     m_host->SetView(this);
> +-
> ++#ifndef QT_NO_ACCESSIBILITY
> +     QAccessible::installActivationObserver(this);
> +     if (QAccessible::isActive())
> +         content::BrowserAccessibilityStateImpl::GetInstance()->EnableAc=
cessibility();
> ++#endif // QT_NO_ACCESSIBILITY
> + }
> +=20
> + RenderWidgetHostViewQt::~RenderWidgetHostViewQt()
> + {
> ++#ifndef QT_NO_ACCESSIBILITY
> +     QAccessible::removeActivationObserver(this);
> ++#endif // QT_NO_ACCESSIBILITY
> + }
> +=20
> + void RenderWidgetHostViewQt::setDelegate(RenderWidgetHostViewQtDelegate=
* delegate)
> +@@ -296,6 +299,7 @@ gfx::NativeViewAccessible RenderWidgetHostViewQt::Ge=
tNativeViewAccessible()
> +=20
> + void RenderWidgetHostViewQt::CreateBrowserAccessibilityManagerIfNeeded()
> + {
> ++#ifndef QT_NO_ACCESSIBILITY
> +     if (GetBrowserAccessibilityManager())
> +         return;
> +=20
> +@@ -303,6 +307,9 @@ void RenderWidgetHostViewQt::CreateBrowserAccessibil=
ityManagerIfNeeded()
> +         m_adapterClient->accessibilityParentObject(),
> +         content::BrowserAccessibilityManagerQt::GetEmptyDocument(),
> +         this));
> ++else
> ++    return 0;
> ++#endif // QT_NO_ACCESSIBILITY
> + }
> +=20
> + // Set focus to the associated View component.
> +@@ -953,6 +960,7 @@ void RenderWidgetHostViewQt::AccessibilityFatalError=
()
> +     SetBrowserAccessibilityManager(NULL);
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + void RenderWidgetHostViewQt::accessibilityActiveChanged(bool active)
> + {
> +     if (active)
> +@@ -960,6 +968,7 @@ void RenderWidgetHostViewQt::accessibilityActiveChan=
ged(bool active)
> +     else
> +         content::BrowserAccessibilityStateImpl::GetInstance()->DisableA=
ccessibility();
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + void RenderWidgetHostViewQt::handleWheelEvent(QWheelEvent *ev)
> + {
> +@@ -1042,6 +1051,7 @@ void RenderWidgetHostViewQt::handleFocusEvent(QFoc=
usEvent *ev)
> +     }
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + QAccessibleInterface *RenderWidgetHostViewQt::GetQtAccessible()
> + {
> +     // Assume we have a screen reader doing stuff
> +@@ -1051,6 +1061,7 @@ QAccessibleInterface *RenderWidgetHostViewQt::GetQ=
tAccessible()
> +     content::BrowserAccessibilityQt *accQt =3D static_cast<content::Bro=
wserAccessibilityQt*>(acc);
> +     return accQt;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + void RenderWidgetHostViewQt::didFirstVisuallyNonEmptyLayout()
> + {
> +diff --git a/src/core/render_widget_host_view_qt.h b/src/core/render_wid=
get_host_view_qt.h
> +index d4a3ff2..fac7efd 100644
> +--- a/src/core/render_widget_host_view_qt.h
> ++++ b/src/core/render_widget_host_view_qt.h
> +@@ -50,6 +50,7 @@
> + #include <QRect>
> + #include <QtGlobal>
> + #include <QtGui/qaccessible.h>
> ++#include <QtGui/QTouchEvent>
> +=20
> + #include "delegated_frame_node.h"
> +=20
> +@@ -59,7 +60,6 @@ class QFocusEvent;
> + class QHoverEvent;
> + class QKeyEvent;
> + class QMouseEvent;
> +-class QTouchEvent;
> + class QVariant;
> + class QWheelEvent;
> + class QAccessibleInterface;
> +@@ -93,7 +93,9 @@ class RenderWidgetHostViewQt
> +     , public RenderWidgetHostViewQtDelegateClient
> +     , public content::BrowserAccessibilityDelegate
> +     , public base::SupportsWeakPtr<RenderWidgetHostViewQt>
> ++#ifndef QT_NO_ACCESSIBILITY
> +     , public QAccessible::ActivationObserver
> ++#endif // QT_NO_ACCESSIBILITY
> + {
> + public:
> +     RenderWidgetHostViewQt(content::RenderWidgetHost* widget);
> +@@ -213,9 +215,11 @@ public:
> +     virtual gfx::Point AccessibilityOriginInScreen(const gfx::Rect& bou=
nds) const Q_DECL_OVERRIDE  { return gfx::Point(); }
> +     virtual void AccessibilityHitTest(const gfx::Point& point) Q_DECL_O=
VERRIDE  { }
> +     virtual void AccessibilityFatalError() Q_DECL_OVERRIDE;
> ++#ifndef QT_NO_ACCESSIBILITY
> +     virtual void accessibilityActiveChanged(bool active) Q_DECL_OVERRID=
E;
> +=20
> +     QAccessibleInterface *GetQtAccessible();
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> +     void didFirstVisuallyNonEmptyLayout();
> +=20
> +diff --git a/src/core/web_contents_adapter.cpp b/src/core/web_contents_a=
dapter.cpp
> +index 3f223f7..e41acd0 100644
> +--- a/src/core/web_contents_adapter.cpp
> ++++ b/src/core/web_contents_adapter.cpp
> +@@ -628,12 +628,14 @@ void WebContentsAdapter::enableInspector(bool enab=
le)
> +     ContentBrowserClientQt::Get()->enableInspector(enable);
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + QAccessibleInterface *WebContentsAdapter::browserAccessible()
> + {
> +     Q_D(const WebContentsAdapter);
> +     RenderWidgetHostViewQt *rwhv =3D static_cast<RenderWidgetHostViewQt=
*>(d->webContents->GetRenderWidgetHostView());
> +     return rwhv ? rwhv->GetQtAccessible() : Q_NULLPTR;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + void WebContentsAdapter::runJavaScript(const QString &javaScript)
> + {
> +diff --git a/src/core/web_contents_adapter_client.h b/src/core/web_conte=
nts_adapter_client.h
> +index 8fd401f..df18980 100644
> +--- a/src/core/web_contents_adapter_client.h
> ++++ b/src/core/web_contents_adapter_client.h
> +@@ -168,7 +168,9 @@ public:
> +     virtual void passOnFocus(bool reverse) =3D 0;
> +     // returns the last QObject (QWidget/QQuickItem) based object in th=
e accessibility
> +     // hierarchy before going into the BrowserAccessibility tree
> ++#ifndef QT_NO_ACCESSIBILITY
> +     virtual QObject *accessibilityParentObject() =3D 0;
> ++#endif // QT_NO_ACCESSIBILITY
> +     virtual void javaScriptConsoleMessage(JavaScriptConsoleMessageLevel=
 level, const QString& message, int lineNumber, const QString& sourceID) =
=3D 0;
> +     virtual void authenticationRequired(const QUrl &requestUrl, const Q=
String &realm, bool isProxy, const QString &challengingHost, QString *outUs=
er, QString *outPassword) =3D 0;
> +     virtual void runMediaAccessPermissionRequest(const QUrl &securityOr=
igin, MediaRequestFlags requestFlags) =3D 0;
> +diff --git a/src/webengine/api/qquickwebengineview.cpp b/src/webengine/a=
pi/qquickwebengineview.cpp
> +index 3497c16..a35cfc3 100644
> +--- a/src/webengine/api/qquickwebengineview.cpp
> ++++ b/src/webengine/api/qquickwebengineview.cpp
> +@@ -61,16 +61,20 @@
> + #include <QScreen>
> + #include <QStringBuilder>
> + #include <QUrl>
> ++#ifndef QT_NO_ACCESSIBILITY
> + #include <private/qquickaccessibleattached_p.h>
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + QT_BEGIN_NAMESPACE
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + static QAccessibleInterface *webAccessibleFactory(const QString &, QObj=
ect *object)
> + {
> +     if (QQuickWebEngineView *v =3D qobject_cast<QQuickWebEngineView*>(o=
bject))
> +         return new QQuickWebEngineViewAccessible(v);
> +     return 0;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + QQuickWebEngineViewPrivate::QQuickWebEngineViewPrivate()
> +     : adapter(new WebContentsAdapter)
> +@@ -102,7 +106,9 @@ QQuickWebEngineViewPrivate::QQuickWebEngineViewPriva=
te()
> +         // 1x, 2x, 3x etc assets that fit an integral number of pixels.
> +         setDevicePixelRatio(qMax(1, qRound(webPixelRatio)));
> +     }
> ++#ifndef QT_NO_ACCESSIBILITY
> +     QAccessible::installFactory(&webAccessibleFactory);
> ++#endif // QT_NO_ACCESSIBILITY
> + }
> +=20
> + QQuickWebEngineViewPrivate::~QQuickWebEngineViewPrivate()
> +@@ -395,11 +401,13 @@ void QQuickWebEngineViewPrivate::runMediaAccessPer=
missionRequest(const QUrl &sec
> +    Q_EMIT e->featurePermissionRequested(securityOrigin, feature);
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + QObject *QQuickWebEngineViewPrivate::accessibilityParentObject()
> + {
> +     Q_Q(QQuickWebEngineView);
> +     return q;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + WebEngineSettings *QQuickWebEngineViewPrivate::webEngineSettings() const
> + {
> +@@ -414,6 +422,7 @@ void QQuickWebEngineViewPrivate::setDevicePixelRatio=
(qreal devicePixelRatio)
> +     m_dpiScale =3D devicePixelRatio / screen->devicePixelRatio();
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + QQuickWebEngineViewAccessible::QQuickWebEngineViewAccessible(QQuickWebE=
ngineView *o)
> +     : QAccessibleObject(o)
> + {}
> +@@ -460,6 +469,7 @@ QAccessible::State QQuickWebEngineViewAccessible::st=
ate() const
> +     QAccessible::State s;
> +     return s;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + void QQuickWebEngineViewPrivate::adoptWebContents(WebContentsAdapter *w=
ebContents)
> + {
> +@@ -497,8 +507,10 @@ QQuickWebEngineView::QQuickWebEngineView(QQuickItem=
 *parent)
> +     this->setActiveFocusOnTab(true);
> +     this->setFlag(QQuickItem::ItemIsFocusScope);
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> +     QQuickAccessibleAttached *accessible =3D QQuickAccessibleAttached::=
qmlAttachedProperties(this);
> +     accessible->setRole(QAccessible::Grouping);
> ++#endif // QT_NO_ACCESSIBILITY
> + }
> +=20
> + QQuickWebEngineView::~QQuickWebEngineView()
> +diff --git a/src/webengine/api/qquickwebengineview_p.h b/src/webengine/a=
pi/qquickwebengineview_p.h
> +index 22713ee..f3ceb2c 100644
> +--- a/src/webengine/api/qquickwebengineview_p.h
> ++++ b/src/webengine/api/qquickwebengineview_p.h
> +@@ -155,7 +155,9 @@ private:
> +     friend class QQuickWebEngineViewExperimental;
> +     friend class QQuickWebEngineViewExperimentalExtension;
> +     friend class QQuickWebEngineNewViewRequest;
> ++#ifndef QT_NO_ACCESSIBILITY
> +     friend class QQuickWebEngineViewAccessible;
> ++#endif // QT_NO_ACCESSIBILITY
> + };
> +=20
> + QT_END_NAMESPACE
> +diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine=
/api/qquickwebengineview_p_p.h
> +index 6662f1f..3ab95c6 100644
> +--- a/src/webengine/api/qquickwebengineview_p_p.h
> ++++ b/src/webengine/api/qquickwebengineview_p_p.h
> +@@ -175,7 +175,9 @@ public:
> +     virtual void javaScriptConsoleMessage(JavaScriptConsoleMessageLevel=
 level, const QString& message, int lineNumber, const QString& sourceID) Q_=
DECL_OVERRIDE;
> +     virtual void authenticationRequired(const QUrl&, const QString&, bo=
ol, const QString&, QString*, QString*) Q_DECL_OVERRIDE { }
> +     virtual void runMediaAccessPermissionRequest(const QUrl &securityOr=
igin, MediaRequestFlags requestFlags) Q_DECL_OVERRIDE;
> ++#ifndef QT_NO_ACCESSIBILITY
> +     virtual QObject *accessibilityParentObject() Q_DECL_OVERRIDE;
> ++#endif // QT_NO_ACCESSIBILITY
> +     virtual WebEngineSettings *webEngineSettings() const Q_DECL_OVERRID=
E;
> +     virtual void allowCertificateError(const QExplicitlySharedDataPoint=
er<CertificateErrorController> &errorController);
> +=20
> +@@ -202,6 +204,7 @@ private:
> +     qreal m_dpiScale;
> + };
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + class QQuickWebEngineViewAccessible : public QAccessibleObject
> + {
> + public:
> +@@ -217,7 +220,7 @@ public:
> + private:
> +     QQuickWebEngineView *engineView() const { return static_cast<QQuick=
WebEngineView*>(object()); }
> + };
> +-
> ++#endif // QT_NO_ACCESSIBILITY
> + QT_END_NAMESPACE
> +=20
> + QML_DECLARE_TYPE(QQuickWebEngineViewExperimental)
> +diff --git a/src/webenginewidgets/api/qwebenginepage.cpp b/src/webengine=
widgets/api/qwebenginepage.cpp
> +index 72b16f2..068c175 100644
> +--- a/src/webenginewidgets/api/qwebenginepage.cpp
> ++++ b/src/webenginewidgets/api/qwebenginepage.cpp
> +@@ -39,6 +39,7 @@
> + #include <QApplication>
> + #include <QAuthenticator>
> + #include <QClipboard>
> ++#include <QContextMenuEvent>
> + #include <QFileDialog>
> + #include <QIcon>
> + #include <QInputDialog>
> +@@ -342,10 +343,12 @@ void QWebEnginePagePrivate::runMediaAccessPermissi=
onRequest(const QUrl &security
> +     Q_EMIT q->featurePermissionRequested(securityOrigin, requestedFeatu=
re);
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + QObject *QWebEnginePagePrivate::accessibilityParentObject()
> + {
> +     return view;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + void QWebEnginePagePrivate::updateAction(QWebEnginePage::WebAction acti=
on) const
> + {
> +diff --git a/src/webenginewidgets/api/qwebenginepage.h b/src/webenginewi=
dgets/api/qwebenginepage.h
> +index 7856b82..9fd81b0 100644
> +--- a/src/webenginewidgets/api/qwebenginepage.h
> ++++ b/src/webenginewidgets/api/qwebenginepage.h
> +@@ -258,7 +258,9 @@ private:
> +=20
> +     friend class QWebEngineView;
> +     friend class QWebEngineViewPrivate;
> ++#ifndef QT_NO_ACCESSIBILITY
> +     friend class QWebEngineViewAccessible;
> ++#endif // QT_NO_ACCESSIBILITY
> + };
> +=20
> +=20
> +diff --git a/src/webenginewidgets/api/qwebenginepage_p.h b/src/webengine=
widgets/api/qwebenginepage_p.h
> +index 5412922..2307e7a 100644
> +--- a/src/webenginewidgets/api/qwebenginepage_p.h
> ++++ b/src/webenginewidgets/api/qwebenginepage_p.h
> +@@ -135,7 +135,9 @@ public:
> +     virtual void javaScriptConsoleMessage(JavaScriptConsoleMessageLevel=
 level, const QString& message, int lineNumber, const QString& sourceID) Q_=
DECL_OVERRIDE;
> +     virtual void authenticationRequired(const QUrl &requestUrl, const Q=
String &realm, bool isProxy, const QString &challengingHost, QString *outUs=
er, QString *outPassword) Q_DECL_OVERRIDE;
> +     virtual void runMediaAccessPermissionRequest(const QUrl &securityOr=
igin, MediaRequestFlags requestFlags) Q_DECL_OVERRIDE;
> ++#ifndef QT_NO_ACCESSIBILITY
> +     virtual QObject *accessibilityParentObject() Q_DECL_OVERRIDE;
> ++#endif // QT_NO_ACCESSIBILITY
> +     virtual WebEngineSettings *webEngineSettings() const Q_DECL_OVERRID=
E;
> +     virtual void allowCertificateError(const QExplicitlySharedDataPoint=
er<CertificateErrorController> &controller) Q_DECL_OVERRIDE;
> +=20
> +diff --git a/src/webenginewidgets/api/qwebengineview.cpp b/src/webengine=
widgets/api/qwebengineview.cpp
> +index 8d21989..63ac405 100644
> +--- a/src/webenginewidgets/api/qwebengineview.cpp
> ++++ b/src/webenginewidgets/api/qwebengineview.cpp
> +@@ -85,19 +85,22 @@ void QWebEngineViewPrivate::bind(QWebEngineView *vie=
w, QWebEnginePage *page)
> +     }
> + }
> +=20
> +-
> ++#ifndef QT_NO_ACCESSIBILITY
> + static QAccessibleInterface *webAccessibleFactory(const QString &, QObj=
ect *object)
> + {
> +     if (QWebEngineView *v =3D qobject_cast<QWebEngineView*>(object))
> +         return new QWebEngineViewAccessible(v);
> +     return Q_NULLPTR;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + QWebEngineViewPrivate::QWebEngineViewPrivate()
> +     : page(0)
> +     , m_pendingContextMenuEvent(false)
> + {
> ++#ifndef QT_NO_ACCESSIBILITY
> +     QAccessible::installFactory(&webAccessibleFactory);
> ++#endif // QT_NO_ACCESSIBILITY
> + }
> +=20
> + QWebEngineView::QWebEngineView(QWidget *parent)
> +@@ -274,6 +277,7 @@ void QWebEngineView::contextMenuEvent(QContextMenuEv=
ent *event)
> +     menu->popup(event->globalPos());
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + int QWebEngineViewAccessible::childCount() const
> + {
> +     if (view() && child(0))
> +@@ -294,6 +298,7 @@ int QWebEngineViewAccessible::indexOfChild(const QAc=
cessibleInterface *c) const
> +         return 0;
> +     return -1;
> + }
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + QT_END_NAMESPACE
> +=20
> +diff --git a/src/webenginewidgets/api/qwebengineview_p.h b/src/webengine=
widgets/api/qwebengineview_p.h
> +index 9db971f..e0cc3f4 100644
> +--- a/src/webenginewidgets/api/qwebengineview_p.h
> ++++ b/src/webenginewidgets/api/qwebengineview_p.h
> +@@ -59,6 +59,7 @@ public:
> +     bool m_pendingContextMenuEvent;
> + };
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + class QWebEngineViewAccessible : public QAccessibleWidget
> + {
> + public:
> +@@ -72,7 +73,7 @@ public:
> + private:
> +     QWebEngineView *view() const { return static_cast<QWebEngineView*>(=
object()); }
> + };
> +-
> ++#endif // QT_NO_ACCESSIBILITY
> +=20
> + QT_END_NAMESPACE
> +=20
> +diff --git a/tests/quicktestbrowser/quicktestbrowser.pro b/tests/quickte=
stbrowser/quicktestbrowser.pro
> +index ac8fe74..51ea5a2 100644
> +--- a/tests/quicktestbrowser/quicktestbrowser.pro
> ++++ b/tests/quicktestbrowser/quicktestbrowser.pro
> +@@ -1,3 +1,5 @@
> ++requires(contains(QT_CONFIG, accessibility))
> ++
> + TEMPLATE =3D app
> + TARGET =3D quicktestbrowser
> +=20
> diff --git a/recipes-qt/qt5/qtwebengine_5.4.1.bb b/recipes-qt/qt5/qtweben=
gine_5.4.1.bb
> index 92e8c04..2935f18 100644
> --- a/recipes-qt/qt5/qtwebengine_5.4.1.bb
> +++ b/recipes-qt/qt5/qtwebengine_5.4.1.bb
> @@ -9,4 +9,5 @@ SRC_URI +=3D " \
>      file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.pat=
ch \
>      file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
>      file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.pat=
ch \
> +    file://0004-fix-build-without-accessiblity.diff \
>  "
> --=20
> 1.9.1
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT1/UsACgkQN1Ujt2V2gBwOlwCfco8/T2Y1R476gBfh8VKAa1xK
DTsAn14Vhqb+tR7cZmOtB3c4pxaYbQ6N
=E/G2
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
