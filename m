Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB8471DDA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 00:00:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r18so440844wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 16:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zJaEzCxo/0N4cdbgW8NB8c4PDwcE+yLJ4mxMLiTTpvA=;
	b=LJSX3RGvx3gYmme1BnQP7wE/LnRGihrhyoxd6Fi211Z6zO269LrZG+NjGJ0uOmT8kG
	thqOnMV0XEbLetCq6ypK2SK0ST3OAbwjRC0qaM287ERo1QioLMj4taieJms/jt2+Tz3M
	XmBEfwYm0N0ryAJd/U/UBpI56+drPf6faKvsHc5IkGpl0Nv7V+yBBaQ+YAlyWgIBJJet
	ysHIDQKFKUL8cyWyOsMr8ifuN9+u5GLlOTPAsYOsrHVYKpaWF80ZylWMZJ/JyOyXOh3h
	QltwtUlTl9es3CMX1aQMMP7dIUVl5JiSJtJsuMjymnXVeMJFOTip8dpVaoHijTVS8n9C
	qH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zJaEzCxo/0N4cdbgW8NB8c4PDwcE+yLJ4mxMLiTTpvA=;
	b=s6Wx/cG62vJn30p8wyqyWCJFgUALzXYGNmp9Z/CoP5tD3Y1wX3b8L3kS/ERZbirgm0
	fvC+BYRKAKDe/CV/Qz+bHv0EJnjnwCIuYhWo0Pc1lC9QxXiAN5+HBWJfpsUYfh/i8UVN
	tqLrwmcAu0sODRDnS4Avx5Lk1aQAY4gmH21/4Y2AtZNYCr6+91q+KmwyqW/XfOoTmjod
	i8vDNA4Jzps/h/NLU98XM5A031H5MNETy5gxkw0uqiD3EOEAKgR/R37WKSDAyvttyrLV
	nKjSARvw5cKGVZy5cDqdC+XZlzGCRUICjbP7HEnmDBk+Pu+cex0GOipaPsAYLVbtiNI+
	fCsg==
X-Gm-Message-State: AMke39m9oBmv1oM3CEbcQSQx16RGOizRMK3nnfpiOOE8f8fpzSUr3F/Kk1apnBviBks8PzuXTmNdSVBk+HX7lQ==
X-Received: by 10.28.96.130 with SMTP id u124mr109235wmb.81.1486080017056;
	Thu, 02 Feb 2017 16:00:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 2 Feb 2017 16:00:16 -0800 (PST)
In-Reply-To: <20170202235401.10297-3-Martin.Jansa@gmail.com>
References: <20170202235401.10297-1-Martin.Jansa@gmail.com>
	<20170202235401.10297-3-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Feb 2017 01:00:16 +0100
Message-ID: <CA+chaQfmX5Kvi6f+mUwK3rpRE80yF5KtYF_=-YSSqM0Gix0eyw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-qt5 3/4] qtwayland: fix build without xkbcommon-evdev
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
X-List-Received-Date: Fri, 03 Feb 2017 00:00:17 -0000
Content-Type: text/plain; charset=UTF-8

This isn't enough at least in some setups, but it's good start (it works
after you add -lxkbcommon in 2 incorrectly generated Makefiles) and at
least it documents that xkbcommon-evdev is now needed to be set in qtbase
PACKAGECONFIG.

On Fri, Feb 3, 2017 at 12:54 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * xkbcommon-evdev isn't enabled in default qtbase PACKAGECONFIG
> * use patch from https://bugreports.qt.io/browse/QTBUG-57767
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0001-fix-build-without-xkbcommon-evdev.patch   | 44
> ++++++++++++++++++++++
>  recipes-qt/qt5/qtwayland_git.bb                    |  3 ++
>  2 files changed, 47 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwayland/0001-
> fix-build-without-xkbcommon-evdev.patch
>
> diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> new file mode 100644
> index 0000000..e1e978e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-
> xkbcommon-evdev.patch
> @@ -0,0 +1,44 @@
> +From c93dbe53e8a1b2203c750a66c7efe6fc9a326903 Mon Sep 17 00:00:00 2001
> +From: Raphael Freudiger <raphael.freudiger@siemens.com>
> +Date: Thu, 22 Dec 2016 13:54:31 +0100
> +Subject: [PATCH] fix build without xkbcommon-evdev
> +
> +Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
> +---
> + src/compositor/compositor_api/qwaylandkeyboard.cpp | 13 +++++++------
> + 1 file changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> +index 55381b4..5c054c6 100644
> +--- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> ++++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> +@@ -338,12 +338,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap
> *keymap)
> +     xkb_state = xkb_state_new(keymap);
> + }
> +
> +-uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> nativeScanCode)
> +-{
> +-    const uint offset = 8;
> +-    Q_ASSERT(nativeScanCode >= offset);
> +-    return nativeScanCode - offset;
> +-}
> +
> + void QWaylandKeyboardPrivate::createXKBKeymap()
> + {
> +@@ -373,6 +367,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
> + }
> + #endif
> +
> ++uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> nativeScanCode)
> ++{
> ++    const uint offset = 8;
> ++    Q_ASSERT(nativeScanCode >= offset);
> ++    return nativeScanCode - offset;
> ++}
> ++
> + void QWaylandKeyboardPrivate::sendRepeatInfo()
> + {
> +     Q_FOREACH (Resource *resource, resourceMap()) {
> +--
> +2.1.4
> +
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_
> git.bb
> index 21abd54..d42d80a 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -43,4 +43,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
>
>  SRCREV = "0e2a950895805457a45abe860bc91a7cc4ba405e"
>
> +# From https://bugreports.qt.io/browse/QTBUG-57767
> +SRC_URI += "file://0001-fix-build-without-xkbcommon-evdev.patch"
> +
>  BBCLASSEXTEND =+ "native nativesdk"
> --
> 2.10.2
>
>

