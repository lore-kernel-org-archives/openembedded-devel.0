Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id B1873788F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 13:56:09 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id o2so27995433wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mCOqXqyZ+RLF6Pc5Y6tbDufLW5s/Mz8JzDiYzHWAd5o=;
	b=jD9gjKbgfp5K0ok1Lj3qeUkNX9ds+tvo+a3L1O/YY02h5rOfskvcvm7J8JsFz3fCB5
	aZWOFXP3MZ4TkodUrpyCEAT1sz1W1D9sPPXOmIXHXF+mvK9eJ9qgqc7vd6kac5K/it9h
	Ma9VLybLzqG2iVsIoBGL7cPWaxOXeraWoPZsxburb6ZnEnfw1wK20t5u2dwe+vtzA+Xn
	5jRBmj4RLiaWr2Rid1vzjI3PDLuCJ9C+Iwi3xQp6NT8VfcboKIkbziWmNlh5/reUEM5+
	zfCgyc/fWB3TRAyLUHovGupmOiCmTd6d3THk8gowFyLB4t5eue2in8Y7nGVcwsOmItba
	a4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mCOqXqyZ+RLF6Pc5Y6tbDufLW5s/Mz8JzDiYzHWAd5o=;
	b=tPTlszwRs42WyDSsi/19YVQLDS9oCbtoXbq8wVFMC9UGz7HjQLeP68jMHg+78zu0J5
	jkSBTVjc5NnKTyK4p3WK0FtXt0PDNRhbsfQFnyHaxV/3cPCrRJ4hRJW9vJFfc5FZCpQA
	KqO+Bx54wVrt0C9pnYlMoLRkUYsGpnVwR849yUAXBTdyPAkHbUtvC1ouMlgzh61NBmBC
	gcLDU20SoX9uayonxGpyqCj8BiGo7/FewVvN6ojfb/nVaR5NoLNrjWxLTB2NwK//VDMt
	k7U7/11bMWLWJAuOWGmx+QwY8Ytb/3pv7g7BnO0Fr9RbJ3D9PgYtKirRplSuKM3Ec2Sv
	98vw==
X-Gm-Message-State: AKGB3mLvuRzl6ZOmKzmCu0PxVdRhEfKBfvAnExwo9ISL/JCA+qkvvF8Z
	nqn1CnmKmtc7N8eLb1WSyFYf5HV6uP5VDglFazU=
X-Google-Smtp-Source: ACJfBovMsk5kMsNBxp1/p1SfT3gBGrom07kp08fl/qV8mx+Y6KX5ov8qMM+g3bH+r/UwlV1RulFinD46SKhpOLz84Jk=
X-Received: by 10.223.185.83 with SMTP id b19mr5340976wrg.58.1513950970406;
	Fri, 22 Dec 2017 05:56:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Fri, 22 Dec 2017 05:56:09 -0800 (PST)
In-Reply-To: <1511264578-10324-1-git-send-email-jhofstee@victronenergy.com>
References: <1511264578-10324-1-git-send-email-jhofstee@victronenergy.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Dec 2017 14:56:09 +0100
Message-ID: <CA+chaQe+J6XxOyDV1jcRL6g6R=Z6ZHBrEkECqUgbLc1OA+Xkvw@mail.gmail.com>
To: Jeroen Hofstee <jhofstee@victronenergy.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtdeclarative: fix build without opengl support
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
X-List-Received-Date: Fri, 22 Dec 2017 13:56:10 -0000
Content-Type: text/plain; charset="UTF-8"

Can you please test with master-next (where is pending upgrade to 5.10), if
this patch is still needed there?

If you want to use it with 5.9, then try rocko-next (with pending upgrade
to 5.9.3).

All my qt5 builds have opengl enabled, so I haven't seen this issue, but
the patch as is doesn't apply on top of 5.10 upgrade (so I've just dropped
it from master-next).

On Tue, Nov 21, 2017 at 12:42 PM, Jeroen Hofstee <jhofstee@victronenergy.com
> wrote:

> Don't build the qtdeclarative opengl example without opengl support,
> since it causes a build error. The included patch comes from buildroot.
>
> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> ---
>  ...uickviewcomparison-and-quickwidget-needs-.patch | 58
> ++++++++++++++++++++++
>  recipes-qt/qt5/qtdeclarative_git.bb                |  2 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtdeclarative/0002-examples-
> qquickviewcomparison-and-quickwidget-needs-.patch
>
> diff --git a/recipes-qt/qt5/qtdeclarative/0002-examples-
> qquickviewcomparison-and-quickwidget-needs-.patch b/recipes-qt/qt5/
> qtdeclarative/0002-examples-qquickviewcomparison-and-
> quickwidget-needs-.patch
> new file mode 100644
> index 0000000..875634f
> --- /dev/null
> +++ b/recipes-qt/qt5/qtdeclarative/0002-examples-qquickviewcomparison-and-
> quickwidget-needs-.patch
> @@ -0,0 +1,58 @@
> +From b4db5c6cef877b33b5e7cd5a07fe4a7e6797dcfc Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Tue, 16 May 2017 19:47:19 +0200
> +Subject: [PATCH] examples: qquickviewcomparison and quickwidget needs
> OpenGL
> + support
> +
> +Fixes:
> +
> +  main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_
> ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to
> `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
> +  .obj/main.o: In function `QQmlPrivate::QQmlElement<
> FbItem>::~QQmlElement()':
> +  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_
> ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to
> `vtable for QQuickFramebufferObject'
> +  .obj/main.o: In function `QQmlPrivate::QQmlElement<
> FbItem>::~QQmlElement()':
> +  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_
> ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to
> `vtable for QQuickFramebufferObject'
> +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to
> `QQuickFramebufferObject::isTextureProvider() const'
> +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to
> `QQuickFramebufferObject::textureProvider() const'
> +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to
> `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
> +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to
> `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::
> UpdatePaintNodeData*)'
> +  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_
> ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to
> `QQuickFramebufferObject::releaseResources()'
> +  .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
> +  moc_fbitem.cpp:(.text+0x70): undefined reference to
> `QQuickFramebufferObject::qt_metacast(char const*)'
> +  .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Call,
> int, void**)':
> +  moc_fbitem.cpp:(.text+0x80): undefined reference to
> `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
> +  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
> +  moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined
> reference to `vtable for QQuickFramebufferObject'
> +  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
> +  moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined
> reference to `vtable for QQuickFramebufferObject'
> +  .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typeinfo
> for QQuickFramebufferObject'
> +  .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to
> `QQuickFramebufferObject::isTextureProvider() const'
> +  .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to
> `QQuickFramebufferObject::textureProvider() const'
> +  .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to
> `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
> +  .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to
> `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::
> UpdatePaintNodeData*)'
> +  .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to
> `QQuickFramebufferObject::releaseResources()'
> +  .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to
> `QQuickFramebufferObject::staticMetaObject'
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + examples/quick/quick.pro | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
> +index 445dfb0fa..26ca0138e 100644
> +--- a/examples/quick/quick.pro
> ++++ b/examples/quick/quick.pro
> +@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
> + # Widget dependent examples
> + qtHaveModule(widgets) {
> +     SUBDIRS += embeddedinwidgets
> +-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> ++    # OpenGL Support Required
> ++    qtConfig(opengl(es1|es2)?) {
> ++        qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> ++    }
> + }
> +
> + EXAMPLE_FILES = \
> +--
> +2.11.0
> +
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> qtdeclarative_git.bb
> index 4ae870a..c9915af 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -32,4 +32,6 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
> 'qtxmlpatterns', '
>
>  SRCREV = "32218c3243fb4f0da83293c5bd6a663d8e3660ee"
>
> +SRC_URI += "file://0002-examples-qquickviewcomparison-and-
> quickwidget-needs-.patch"
> +
>  BBCLASSEXTEND =+ "native nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

