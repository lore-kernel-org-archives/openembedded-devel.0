Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0058173E11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 07:00:05 +0000 (UTC)
Received: by igcse8 with SMTP id se8so5209114igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gGsgI3cZwEoi7SQFVvCP/5Y4cORx6vNxPWGtWsRhGTM=;
	b=O6I7StSzfhY0xLMa3xrEq9ZUBxSLE6GHXuroZC2PxwYzAtOIOTaXCxcYPqEjioxIKa
	tq/9Uw+MbF/VuxdMaFho07XfFxgb0SiRcKDogPdElTgssJYFmjsTbl875OHgYZ6Dchue
	WxBqyLLf6THGRllHQ0cMNRNtcGnT56tnMR7j/6FF/sBoECw4wuvTmNae3CDx66MDLfkt
	+y/MMgeUl1lAm3H+CV9ue3fWVw3FBgbWHxXwdiVgCfE5zs26tFLxuKhSOnfJUioScRSo
	JsxIgm2/71qGuVB+d9jsMP2km4PH2SVUGYrs0SDRaDf1wrwbEP0exsnBQ0QJ8lVSIgPc
	FrVw==
MIME-Version: 1.0
X-Received: by 10.50.85.45 with SMTP id e13mr780692igz.52.1440486005971; Tue,
	25 Aug 2015 00:00:05 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Tue, 25 Aug 2015 00:00:05 -0700 (PDT)
In-Reply-To: <1440438239-19765-2-git-send-email-raj.khem@gmail.com>
References: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
	<1440438239-19765-2-git-send-email-raj.khem@gmail.com>
Date: Tue, 25 Aug 2015 09:00:05 +0200
Message-ID: <CALbNGRTraUfFbCArpaMR0L7w9nME5+8-hN2q9R0Q=dwbULRM_w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH V2 2/4] qtwayland: Fix build for raspberryPi
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
X-List-Received-Date: Tue, 25 Aug 2015 07:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 7:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> rpi uses bcom EGL implementation and it has descrepency when it comes to
> defining 'EGLNativePixmapType', lets typecast the ussage of this type to
> avoid this sort of errors.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Upstream-Status?
> ---
>  ...egl-Typecast-proper-EGLNativeWindowType-t.patch | 56 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtwayland_git.bb                    |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast=
-proper-EGLNativeWindowType-t.patch
>
> diff --git a/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper=
-EGLNativeWindowType-t.patch b/recipes-qt/qt5/qtwayland/0001-xcomposite-egl=
-Typecast-proper-EGLNativeWindowType-t.patch
> new file mode 100644
> index 0000000..2e1f2c4
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNat=
iveWindowType-t.patch
> @@ -0,0 +1,56 @@
> +From 91746518a0cd56d7b0bfda69ba6cf743bf051fb9 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 23 Aug 2015 17:33:25 -0700
> +Subject: [PATCH] xcomposite-egl: Typecast proper EGLNativeWindowType to
> + eglCreateWindowSurface params
> +
> +This surfaces on rpi which has slightly different definition of
> +EGLNativeWindowType
> +
> +Fixes errors like
> +
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vf=
p-neon-angstrom-linux-gnueabi/qtwayland/5.4.2+gitAUTOINC+182488129c-r0/git/=
src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.=
cpp:117:26: error: no matching function for call
> +      to 'eglCreatePixmapSurface'
> +    EGLSurface surface =3D eglCreatePixmapSurface(mEglDisplay,config,pix=
map,attribList.constData());
> +                         ^~~~~~~~~~~~~~~~~~~~~~
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/raspberry=
pi2/usr/include/EGL/egl.h:270:31: note: candidate function not viable: no k=
nown conversion from 'Pixmap' (aka 'unsigned long') to 'EGLNativePixmapType=
' (aka 'void *') for 3rd argument; take the
> +      address of the argument with &
> +EGLAPI EGLSurface EGLAPIENTRY eglCreatePixmapSurface(EGLDisplay dpy, EGL=
Config config,
> +                              ^
> +1 error generated.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + .../client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp              =
 | 2 +-
> + .../compositor/xcomposite-egl/xcompositeeglintegration.cpp             =
 | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcomp=
ositeeglwindow.cpp b/src/hardwareintegration/client/xcomposite-egl/qwayland=
xcompositeeglwindow.cpp
> +index 01d6324..e268ede 100644
> +--- a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeg=
lwindow.cpp
> ++++ b/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeg=
lwindow.cpp
> +@@ -122,7 +122,7 @@ void QWaylandXCompositeEGLWindow::createEglSurface()
> +     XCompositeRedirectWindow(m_glxIntegration->xDisplay(), m_xWindow, C=
ompositeRedirectManual);
> +     XMapWindow(m_glxIntegration->xDisplay(), m_xWindow);
> +
> +-    m_surface =3D eglCreateWindowSurface(m_glxIntegration->eglDisplay()=
, m_config, m_xWindow,0);
> ++    m_surface =3D eglCreateWindowSurface(m_glxIntegration->eglDisplay()=
, m_config, (EGLNativeWindowType)m_xWindow,0);
> +     if (m_surface =3D=3D EGL_NO_SURFACE) {
> +         qFatal("Could not make eglsurface");
> +     }
> +diff --git a/src/hardwareintegration/compositor/xcomposite-egl/xcomposit=
eeglintegration.cpp b/src/hardwareintegration/compositor/xcomposite-egl/xco=
mpositeeglintegration.cpp
> +index 2401d67..61664b5 100644
> +--- a/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglint=
egration.cpp
> ++++ b/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglint=
egration.cpp
> +@@ -114,7 +114,7 @@ void XCompositeEglClientBufferIntegration::bindTextu=
reToBuffer(struct ::wl_resou
> +     attribList.append(EGL_TEXTURE_2D);
> +     attribList.append(EGL_NONE);
> +
> +-    EGLSurface surface =3D eglCreatePixmapSurface(mEglDisplay,config,pi=
xmap,attribList.constData());
> ++    EGLSurface surface =3D eglCreatePixmapSurface(mEglDisplay,config,(E=
GLNativeWindowType)pixmap,attribList.constData());
^ When looking at [1] this does not look correct to me.

Generally I think errors caused by a specific egl implementation
should not be fixed in packets using egl - and yes I know we have
these hacks in qt.

[1] https://www.khronos.org/registry/egl/sdk/docs/man/html/eglCreatePixmapS=
urface.xhtml

Andreas

