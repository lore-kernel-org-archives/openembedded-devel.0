Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 75E0F7307C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 08:42:27 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l37so12391773wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Mar 2017 00:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9fizTvx/5Rvh5exLsur2C9dBfcHSlVxFSP+atDuJqco=;
	b=ZTaxHe68gE9hBm4x65QxzaGILFaRMiBkWzCEtyTyUBWfcN9DqRWUDOTZ1T9/5mmgum
	HeZa2bcxFJOGoLV4usEziIRSuSWvE8Va6MjwRl+bxy1aGTCXNYuWr94IB6A7tFa7CPhS
	Mx+nEkV6n9U3iz2YUENN1iSK44eT0/hhLsvx4LgFy/K52vWCEU8I/ba7O4DccPko8gpj
	+8zoWS4qCOtz1LoaXz28idj29Ij6Mm8CHNGnobZ48vo6tATgyr5+Rv4K6I92zkbis0MT
	IZVpHhp8kfxzqOCMTjEvkHVbAbyYgEp3P7NE0i0P/0gIRjWVCoT8Z4Dd0aPNPupbrYjB
	5+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9fizTvx/5Rvh5exLsur2C9dBfcHSlVxFSP+atDuJqco=;
	b=rf1hhMG7mphpyVFcuBM/fcDEou03Q5+H8G7NsxeLJFlUrnUdp3SRROaFmzlhrRgD74
	z7IdSTNPZvR100TpWpfxk4eoEfJ3QPGhMl0knX+r99r5j2Vj1rxh5dXfAgSBSfMitPtl
	1Cj22LrJHc3Tzmh21UduDz74UOgIRVlMHizniPYrHahnPF7n4zbLUTwdXrDk6vz/wxwg
	pYep6iVGN4+XEK7eLTaXlvz3e+yI0rYXyMWG9tiJVond/Fx44rMMqVjThq8fJL/rysLo
	mLL8xxoNWsA7+97YyeliQmviDz8PwZt5U3nq9d1HNUQbAFuuYvXyMb3mdY/LqQaBW5ej
	CY0w==
X-Gm-Message-State: AMke39lqu7uLArycT2PunZpAgpfJYIdAhjKzuiWLn6pLpZ5gWxLQzlGkpXN1AOL+UiBPJ1zs9rNg5kuzduT6eg==
X-Received: by 10.223.164.212 with SMTP id h20mr1467924wrb.196.1488530549124; 
	Fri, 03 Mar 2017 00:42:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Fri, 3 Mar 2017 00:42:28 -0800 (PST)
In-Reply-To: <20170302233758.GS7350@denix.org>
References: <20170202235401.10297-1-Martin.Jansa@gmail.com>
	<20170202235401.10297-3-Martin.Jansa@gmail.com>
	<CA+chaQfmX5Kvi6f+mUwK3rpRE80yF5KtYF_=-YSSqM0Gix0eyw@mail.gmail.com>
	<20170302233758.GS7350@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Mar 2017 09:42:28 +0100
Message-ID: <CA+chaQe1gUUnsnMsZyRtQBnY1QP2FXY=SOBiRVcC6QNG8kJMXw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 03 Mar 2017 08:42:28 -0000
Content-Type: text/plain; charset=UTF-8

Yes, it can be built, but you need to enable xkbcommon-evdev which works
even in DISTROs without x11, like I did in:
https://github.com/webOS-ports/meta-webos-ports/commit/03e259ca0fd95b38bf985064a8e9d2eb47a8a59f

On Fri, Mar 3, 2017 at 12:37 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Fri, Feb 03, 2017 at 01:00:16AM +0100, Martin Jansa wrote:
> > This isn't enough at least in some setups, but it's good start (it works
> > after you add -lxkbcommon in 2 incorrectly generated Makefiles) and at
> > least it documents that xkbcommon-evdev is now needed to be set in qtbase
> > PACKAGECONFIG.
>
> Can qtwayland 5.8 be built w/o "x11" in DISTRO_FEATURES?
>
> I have X-less setup and obviously don't get xkbcommon-evdev in
> PACKAGECONFIG,
> thus:
>
> | /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/
> git/src/shared/qwaylandxkb.cpp:297: error: undefined reference to
> 'xkb_keysym_to_utf32'
> | /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/
> git/src/shared/qwaylandxkb.cpp:337: error: undefined reference to
> 'xkb_state_mod_name_is_active'
> | /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/
> git/src/shared/qwaylandxkb.cpp:339: error: undefined reference to
> 'xkb_state_mod_name_is_active'
> | /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/
> git/src/shared/qwaylandxkb.cpp:341: error: undefined reference to
> 'xkb_state_mod_name_is_active'
> | /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/
> git/src/shared/qwaylandxkb.cpp:343: error: undefined reference to
> 'xkb_state_mod_name_is_active'
>
> --
> Denys
>
>
> > On Fri, Feb 3, 2017 at 12:54 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > * xkbcommon-evdev isn't enabled in default qtbase PACKAGECONFIG
> > > * use patch from https://bugreports.qt.io/browse/QTBUG-57767
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  .../0001-fix-build-without-xkbcommon-evdev.patch   | 44
> > > ++++++++++++++++++++++
> > >  recipes-qt/qt5/qtwayland_git.bb                    |  3 ++
> > >  2 files changed, 47 insertions(+)
> > >  create mode 100644 recipes-qt/qt5/qtwayland/0001-
> > > fix-build-without-xkbcommon-evdev.patch
> > >
> > > diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-
> xkbcommon-evdev.patch
> > > b/recipes-qt/qt5/qtwayland/0001-fix-build-without-
> xkbcommon-evdev.patch
> > > new file mode 100644
> > > index 0000000..e1e978e
> > > --- /dev/null
> > > +++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-
> > > xkbcommon-evdev.patch
> > > @@ -0,0 +1,44 @@
> > > +From c93dbe53e8a1b2203c750a66c7efe6fc9a326903 Mon Sep 17 00:00:00
> 2001
> > > +From: Raphael Freudiger <raphael.freudiger@siemens.com>
> > > +Date: Thu, 22 Dec 2016 13:54:31 +0100
> > > +Subject: [PATCH] fix build without xkbcommon-evdev
> > > +
> > > +Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
> > > +---
> > > + src/compositor/compositor_api/qwaylandkeyboard.cpp | 13
> +++++++------
> > > + 1 file changed, 7 insertions(+), 6 deletions(-)
> > > +
> > > +diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > > b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > > +index 55381b4..5c054c6 100644
> > > +--- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > > ++++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > > +@@ -338,12 +338,6 @@ void QWaylandKeyboardPrivate::
> createXKBState(xkb_keymap
> > > *keymap)
> > > +     xkb_state = xkb_state_new(keymap);
> > > + }
> > > +
> > > +-uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> > > nativeScanCode)
> > > +-{
> > > +-    const uint offset = 8;
> > > +-    Q_ASSERT(nativeScanCode >= offset);
> > > +-    return nativeScanCode - offset;
> > > +-}
> > > +
> > > + void QWaylandKeyboardPrivate::createXKBKeymap()
> > > + {
> > > +@@ -373,6 +367,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
> > > + }
> > > + #endif
> > > +
> > > ++uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> > > nativeScanCode)
> > > ++{
> > > ++    const uint offset = 8;
> > > ++    Q_ASSERT(nativeScanCode >= offset);
> > > ++    return nativeScanCode - offset;
> > > ++}
> > > ++
> > > + void QWaylandKeyboardPrivate::sendRepeatInfo()
> > > + {
> > > +     Q_FOREACH (Resource *resource, resourceMap()) {
> > > +--
> > > +2.1.4
> > > +
> > > diff --git a/recipes-qt/qt5/qtwayland_git.bb
> b/recipes-qt/qt5/qtwayland_
> > > git.bb
> > > index 21abd54..d42d80a 100644
> > > --- a/recipes-qt/qt5/qtwayland_git.bb
> > > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > > @@ -43,4 +43,7 @@ EXTRA_QMAKEVARS_CONFIGURE +=
> "${PACKAGECONFIG_CONFARGS}"
> > >
> > >  SRCREV = "0e2a950895805457a45abe860bc91a7cc4ba405e"
> > >
> > > +# From https://bugreports.qt.io/browse/QTBUG-57767
> > > +SRC_URI += "file://0001-fix-build-without-xkbcommon-evdev.patch"
> > > +
> > >  BBCLASSEXTEND =+ "native nativesdk"
> > > --
> > > 2.10.2
> > >
> > >
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
>

