Return-Path: <denis@denix.org>
X-Greylist: delayed 305 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Mar 2017 23:43:03 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 74FB877636
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 23:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F22A20B64
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 23:37:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xXluknYskzaz
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 23:37:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 51F722088F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 23:37:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6965C1623A6; Thu,  2 Mar 2017 18:37:58 -0500 (EST)
Date: Thu, 2 Mar 2017 18:37:58 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170302233758.GS7350@denix.org>
References: <20170202235401.10297-1-Martin.Jansa@gmail.com>
	<20170202235401.10297-3-Martin.Jansa@gmail.com>
	<CA+chaQfmX5Kvi6f+mUwK3rpRE80yF5KtYF_=-YSSqM0Gix0eyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfmX5Kvi6f+mUwK3rpRE80yF5KtYF_=-YSSqM0Gix0eyw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 02 Mar 2017 23:43:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2017 at 01:00:16AM +0100, Martin Jansa wrote:
> This isn't enough at least in some setups, but it's good start (it works
> after you add -lxkbcommon in 2 incorrectly generated Makefiles) and at
> least it documents that xkbcommon-evdev is now needed to be set in qtbase
> PACKAGECONFIG.

Can qtwayland 5.8 be built w/o "x11" in DISTRO_FEATURES?

I have X-less setup and obviously don't get xkbcommon-evdev in PACKAGECONFIG, 
thus:

| /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/git/src/shared/qwaylandxkb.cpp:297: error: undefined reference to 'xkb_keysym_to_utf32'
| /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/git/src/shared/qwaylandxkb.cpp:337: error: undefined reference to 'xkb_state_mod_name_is_active'
| /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/git/src/shared/qwaylandxkb.cpp:339: error: undefined reference to 'xkb_state_mod_name_is_active'
| /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/git/src/shared/qwaylandxkb.cpp:341: error: undefined reference to 'xkb_state_mod_name_is_active'
| /usr/src/debug/qtwayland/5.8.0+gitAUTOINC+0e2a950895-r0/git/src/shared/qwaylandxkb.cpp:343: error: undefined reference to 'xkb_state_mod_name_is_active'

-- 
Denys


> On Fri, Feb 3, 2017 at 12:54 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> 
> > * xkbcommon-evdev isn't enabled in default qtbase PACKAGECONFIG
> > * use patch from https://bugreports.qt.io/browse/QTBUG-57767
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../0001-fix-build-without-xkbcommon-evdev.patch   | 44
> > ++++++++++++++++++++++
> >  recipes-qt/qt5/qtwayland_git.bb                    |  3 ++
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qtwayland/0001-
> > fix-build-without-xkbcommon-evdev.patch
> >
> > diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> > b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> > new file mode 100644
> > index 0000000..e1e978e
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-
> > xkbcommon-evdev.patch
> > @@ -0,0 +1,44 @@
> > +From c93dbe53e8a1b2203c750a66c7efe6fc9a326903 Mon Sep 17 00:00:00 2001
> > +From: Raphael Freudiger <raphael.freudiger@siemens.com>
> > +Date: Thu, 22 Dec 2016 13:54:31 +0100
> > +Subject: [PATCH] fix build without xkbcommon-evdev
> > +
> > +Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
> > +---
> > + src/compositor/compositor_api/qwaylandkeyboard.cpp | 13 +++++++------
> > + 1 file changed, 7 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > +index 55381b4..5c054c6 100644
> > +--- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > ++++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > +@@ -338,12 +338,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap
> > *keymap)
> > +     xkb_state = xkb_state_new(keymap);
> > + }
> > +
> > +-uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> > nativeScanCode)
> > +-{
> > +-    const uint offset = 8;
> > +-    Q_ASSERT(nativeScanCode >= offset);
> > +-    return nativeScanCode - offset;
> > +-}
> > +
> > + void QWaylandKeyboardPrivate::createXKBKeymap()
> > + {
> > +@@ -373,6 +367,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
> > + }
> > + #endif
> > +
> > ++uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> > nativeScanCode)
> > ++{
> > ++    const uint offset = 8;
> > ++    Q_ASSERT(nativeScanCode >= offset);
> > ++    return nativeScanCode - offset;
> > ++}
> > ++
> > + void QWaylandKeyboardPrivate::sendRepeatInfo()
> > + {
> > +     Q_FOREACH (Resource *resource, resourceMap()) {
> > +--
> > +2.1.4
> > +
> > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_
> > git.bb
> > index 21abd54..d42d80a 100644
> > --- a/recipes-qt/qt5/qtwayland_git.bb
> > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > @@ -43,4 +43,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> >
> >  SRCREV = "0e2a950895805457a45abe860bc91a7cc4ba405e"
> >
> > +# From https://bugreports.qt.io/browse/QTBUG-57767
> > +SRC_URI += "file://0001-fix-build-without-xkbcommon-evdev.patch"
> > +
> >  BBCLASSEXTEND =+ "native nativesdk"
> > --
> > 2.10.2
> >
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

