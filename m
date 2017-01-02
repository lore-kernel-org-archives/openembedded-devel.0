Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id AF4B86093B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 10:50:52 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so68183496wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 02:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JaVUTlYgACBlF6+nEehfZCLzEOPVchWQhVr1eToZ62U=;
	b=lGImN37SOlYvLzou/iWZfwqvWxRm7ixT2+9mjz+Mrabz2qFYZo+UGAHqN57AqPCkp1
	bfqlwDzbJhX+tIoQfDfyLMPHMyN4oFbdkuUJZ2thkoigVsfdZvratoJO8ltrynIGfUBw
	xJd4PhZw/tizodf9IaqZUMGLB7cfTqbMbwIvv2qUUrJNyjgWcJ3plRHUdur7OTjbovxN
	ciueQG5qgRoUN9AyBsl8mKumEUPno0v96obRGs1Za3jh3tweQVhfxsdbpcpImmzYOYRl
	1LhfKUHfXu6+6NT89WpEPpb3Q/ouvee+9N2rB5zAzFbwkrB486SHa6Dk6NpfsZTGcN3C
	ISyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JaVUTlYgACBlF6+nEehfZCLzEOPVchWQhVr1eToZ62U=;
	b=Z7rFONSeEDfA+9hC9BZXrwTkTh7wlB1jgYpAV1n26+0EyMNi3MpoYbGh42oVDQ52a3
	sYOOmAh/gwDjwX3tKCR0TI0kgVgKUkO6k0UfSL9D2uzB2W83PuIStgZiRamH46jPKzz/
	6mo13ZkTUdDv3lLdDcQJ+mUSRkUVyy/TOUDSfTNZbfkjcNlrIkx/pP42Q6rJF3FFXgGJ
	QDGDzQoMaTTZAAgjc+2E3Aoh16IvqgIcaTIdRvgMN/Nyzh5pgO5eR3dmBxfPjt8GVYe6
	sfGM19v60yWovapMjn0f1jg9/0aED1ri1dIYRTHgIuhRNoukiPCxriBbNk/UbFj8E7gY
	pI7A==
X-Gm-Message-State: AIkVDXKHVdq4/krC0pYs1hRwlRAwQ2dE1t2ibWEZLXodzWUsIaMplyGeuoWB/tqp80qYeA==
X-Received: by 10.194.187.103 with SMTP id fr7mr47546565wjc.99.1483354252325; 
	Mon, 02 Jan 2017 02:50:52 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r7sm87195821wjp.43.2017.01.02.02.50.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jan 2017 02:50:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Jan 2017 11:50:51 +0100
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170102105051.GA3954@jama>
References: <1482444889-16856-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1482444889-16856-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Mon, 02 Jan 2017 10:51:05 -0000
X-Groupsio-MsgNum: 64591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2016 at 05:14:49PM -0500, Denys Dmytriyenko wrote:
> From: Vesa J=E4=E4skel=E4inen <dachaac@gmail.com>
>=20
> QPlatformIntegration's interface methods are disabled based on QT_NO_OPEN=
GL,
> QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
> QtWayland.

Is this still needed with:
[oe] [meta-qt5][morty][PATCH] qt5: update submodule SRCREVs to 5.7.1 release

The .patch doesn't apply in 5.7.1 anymore and I haven't had time to find
out why.

> Signed-off-by: Vesa J=E4=E4skel=E4inen <dachaac@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/qtwayland-native_git.bb             |   1 +
>  ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156 +++++++++++++++=
++++++
>  recipes-qt/qt5/qtwayland_git.bb                    |   1 +
>  3 files changed, 158 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylan=
dIntegration-if-some-Qt5-feat.patch
>=20
> diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwa=
yland-native_git.bb
> index a214346..1149aa5 100644
> --- a/recipes-qt/qt5/qtwayland-native_git.bb
> +++ b/recipes-qt/qt5/qtwayland-native_git.bb
> @@ -18,6 +18,7 @@ DEPENDS =3D "qtbase-native wayland-native"
> =20
>  SRC_URI +=3D " \
>      file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.pat=
ch \
> +    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.pat=
ch \
>  "
> =20
>  do_configure() {
> diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegr=
ation-if-some-Qt5-feat.patch b/recipes-qt/qt5/qtwayland/0001-Fix-building-o=
f-QWaylandIntegration-if-some-Qt5-feat.patch
> new file mode 100644
> index 0000000..d173e67
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-i=
f-some-Qt5-feat.patch
> @@ -0,0 +1,156 @@
> +From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D <=
dachaac@gmail.com>
> +Date: Sun, 18 Sep 2016 11:51:59 +0300
> +Subject: [PATCH] Fix building of QWaylandIntegration if some Qt5 feature=
s are
> + disabled.
> +
> +QPlatformIntegration's interface methods are disabled based on QT_NO_OPE=
NGL,
> +QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> +QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
> +QtWayland.
> +---
> + src/client/qwaylandintegration.cpp | 21 ++++++++++++++++++---
> + src/client/qwaylandintegration_p.h | 12 ++++++++++++
> + 2 files changed, 30 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/client/qwaylandintegration.cpp b/src/client/qwaylandint=
egration.cpp
> +index 39fff53..481e3d6 100644
> +--- a/src/client/qwaylandintegration.cpp
> ++++ b/src/client/qwaylandintegration.cpp
> +@@ -39,7 +39,9 @@
> + #include "qwaylandinputcontext_p.h"
> + #include "qwaylandshmbackingstore_p.h"
> + #include "qwaylandnativeinterface_p.h"
> ++#ifndef QT_NO_CLIPBOARD
> + #include "qwaylandclipboard_p.h"
> ++#endif
> + #include "qwaylanddnd_p.h"
> + #include "qwaylandwindowmanagerintegration_p.h"
> + #include "qwaylandscreen_p.h"
> +@@ -57,7 +59,9 @@
> + #include <QSocketNotifier>
> +=20
> + #include <qpa/qplatforminputcontextfactory_p.h>
> ++#ifndef QT_NO_ACCESSIBILITY
> + #include <qpa/qplatformaccessibility.h>
> ++#endif
> + #include <qpa/qplatforminputcontext.h>
> +=20
> + #include "qwaylandhardwareintegration_p.h"
> +@@ -117,8 +121,6 @@ QWaylandIntegration::QWaylandIntegration()
> +     , mNativeInterface(new QWaylandNativeInterface(this))
> + #ifndef QT_NO_ACCESSIBILITY
> +     , mAccessibility(new QPlatformAccessibility())
> +-#else
> +-    , mAccessibility(0)
> + #endif
> +     , mClientBufferIntegrationInitialized(false)
> +     , mServerBufferIntegrationInitialized(false)
> +@@ -126,9 +128,12 @@ QWaylandIntegration::QWaylandIntegration()
> + {
> +     initializeInputDeviceIntegration();
> +     mDisplay =3D new QWaylandDisplay(this);
> ++#ifndef QT_NO_CLIPBOARD
> +     mClipboard =3D new QWaylandClipboard(mDisplay);
> ++#endif
> ++#ifndef QT_NO_DRAGANDDROP
> +     mDrag =3D new QWaylandDrag(mDisplay);
> +-
> ++#endif
> +     QString icStr =3D QPlatformInputContextFactory::requested();
> +     icStr.isNull() ? mInputContext.reset(new QWaylandInputContext(mDisp=
lay))
> +                    : mInputContext.reset(QPlatformInputContextFactory::=
create(icStr));
> +@@ -136,8 +141,12 @@ QWaylandIntegration::QWaylandIntegration()
> +=20
> + QWaylandIntegration::~QWaylandIntegration()
> + {
> ++#ifndef QT_NO_DRAGANDDROP
> +     delete mDrag;
> ++#endif
> ++#ifndef QT_NO_CLIPBOARD
> +     delete mClipboard;
> ++#endif
> + #ifndef QT_NO_ACCESSIBILITY
> +     delete mAccessibility;
> + #endif
> +@@ -213,15 +222,19 @@ QPlatformFontDatabase *QWaylandIntegration::fontDa=
tabase() const
> +     return mFontDb;
> + }
> +=20
> ++#ifndef QT_NO_CLIPBOARD
> + QPlatformClipboard *QWaylandIntegration::clipboard() const
> + {
> +     return mClipboard;
> + }
> ++#endif
> +=20
> ++#ifndef QT_NO_DRAGANDDROP
> + QPlatformDrag *QWaylandIntegration::drag() const
> + {
> +     return mDrag;
> + }
> ++#endif
> +=20
> + QPlatformInputContext *QWaylandIntegration::inputContext() const
> + {
> +@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::styleHint(StyleHint =
hint) const
> +     return QPlatformIntegration::styleHint(hint);
> + }
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> + QPlatformAccessibility *QWaylandIntegration::accessibility() const
> + {
> +     return mAccessibility;
> + }
> ++#endif
> +=20
> + QPlatformServices *QWaylandIntegration::services() const
> + {
> +diff --git a/src/client/qwaylandintegration_p.h b/src/client/qwaylandint=
egration_p.h
> +index 987d805..b50ad95 100644
> +--- a/src/client/qwaylandintegration_p.h
> ++++ b/src/client/qwaylandintegration_p.h
> +@@ -80,15 +80,21 @@ public:
> +=20
> +     QPlatformNativeInterface *nativeInterface() const Q_DECL_OVERRIDE;
> +=20
> ++#ifndef QT_NO_CLIPBOARD
> +     QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
> ++#endif
> +=20
> ++#ifndef QT_NO_DRAGANDDROP
> +     QPlatformDrag *drag() const Q_DECL_OVERRIDE;
> ++#endif
> +=20
> +     QPlatformInputContext *inputContext() const Q_DECL_OVERRIDE;
> +=20
> +     QVariant styleHint(StyleHint hint) const Q_DECL_OVERRIDE;
> +=20
> ++#ifndef QT_NO_ACCESSIBILITY
> +     QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
> ++#endif
> +=20
> +     QPlatformServices *services() const Q_DECL_OVERRIDE;
> +=20
> +@@ -117,12 +123,18 @@ private:
> +     void initializeInputDeviceIntegration();
> +=20
> +     QPlatformFontDatabase *mFontDb;
> ++#ifndef QT_NO_CLIPBOARD
> +     QPlatformClipboard *mClipboard;
> ++#endif
> ++#ifndef QT_NO_DRAGANDDROP
> +     QPlatformDrag *mDrag;
> ++#endif
> +     QWaylandDisplay *mDisplay;
> +     QPlatformNativeInterface *mNativeInterface;
> +     QScopedPointer<QPlatformInputContext> mInputContext;
> ++#ifndef QT_NO_ACCESSIBILITY
> +     QPlatformAccessibility *mAccessibility;
> ++#endif
> +     bool mClientBufferIntegrationInitialized;
> +     bool mServerBufferIntegrationInitialized;
> +     bool mShellIntegrationInitialized;
> +--=20
> +2.7.4
> +
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_g=
it.bb
> index b208961..e315924 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -46,6 +46,7 @@ FILES_${PN}-plugins-dbg +=3D " \
> =20
>  SRC_URI +=3D " \
>      file://0001-examples-wayland-include-server-buffer-only-when-bui.pat=
ch \
> +    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.pat=
ch \
>  "
> =20
>  SRCREV =3D "a172672484b9496819e588b51ac2ff9fb4a21941"
> --=20
> 2.7.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWGowigAKCRA3VSO3ZXaA
HGhTAJ94Nv9fIf6nXPHGAAsJdG+02/BTuACfZbDM7S4gk2lGSbPhbRDibKL9TdE=
=4J2l
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
