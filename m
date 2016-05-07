Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8255372DC4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 21:33:15 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y84so17065352lfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2016 14:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2eqYAcIo6A5iM6B6BW0+s5+UcrswZFLXwPH9t5Gj3nY=;
	b=VmjZm+vxStyMImW3TA5ERheJUyh/FNRYh2OONtNbRFxY2kQPuF2SDojlTH2FHNbzGT
	cMoQWW259k1kYU0ydejsyr/S5tTIrmAeJRgvPal8pg4lCPm4wjcWMMGkH8OWrC71OqxM
	uoIAclZWmMlbI7uc/ZEuXVpi/V8ZNrq5hUWxWPXBMCH8/dPAHudEiByOcSyHhOTQVSK7
	SdNaJEW6ZVgw6ziUM/5JWvFwLsZ6zQbb8ioSpSDKnPOj/qa3Oz85GmuoGZHP3n1eNjRz
	NoJFVS9gB1khJYmb5QaDFfCWt6MAZlPhZxFI8QiY4w3qYIelpUAZM8+4sMflQC3CRTwa
	Y2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2eqYAcIo6A5iM6B6BW0+s5+UcrswZFLXwPH9t5Gj3nY=;
	b=LTEi5V9VOD4ScSrJfldXkBUldsjyVZVcIdheAACP8yTLu1pa6X4RQe4WjcaL+92323
	mVU9J3T46dzSX8UDI7fLQCaaw6Xct4Vd1ODZpA0Nsd+B+UlAppb+7/rEyv5/Kd5cwu7n
	o1yibFD1Cnq1BLZuDpkVtVj3GUcQPRO+EmIyHlERWC6lOYLA7htLHkYfpsc4iPbuiQhA
	JxVeusNkH2yVzwWYPI/hvhxZgGQYG9SIGFqAa/my5R1dpS5p17tV8SbqTKI8ad4hUYix
	RSAx1i9IFpQoLhEZf2Dag8QpTAdPTa4aLbnWK0iyeL/tWWo50dvCWN8p92bhOWNB+LcH
	2fXw==
X-Gm-Message-State: AOPr4FX0rrlHd4sdhRuvhDY+mzTP8dPWEMF6Iz/2yaypNW9S3b5g9dvWNzo/buO4KDcBURs8tr11lTJbVAf1/A==
MIME-Version: 1.0
X-Received: by 10.112.204.99 with SMTP id kx3mr212464lbc.31.1462656794259;
	Sat, 07 May 2016 14:33:14 -0700 (PDT)
Received: by 10.112.180.229 with HTTP; Sat, 7 May 2016 14:33:14 -0700 (PDT)
In-Reply-To: <572E2F5C.1080702@gmail.com>
References: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
	<572E2F5C.1080702@gmail.com>
Date: Sat, 7 May 2016 23:33:14 +0200
Message-ID: <CA+chaQeo3zZk2ekNVBm_Kfx6PDTrVqce+noRwgmq3WUebPk=Jw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Herrie <github.com@herrie.org>
Subject: Re: [PATCH][krogoth][meta-oe 1/3] pidgin: Update to 2.10.12
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
X-List-Received-Date: Sat, 07 May 2016 21:33:18 -0000
Content-Type: text/plain; charset=UTF-8

For me the imporant part is already in commit message, old version doesn't
build at all, new does, so it's improvement in itself.

Security fixes are good bonus, but in this case older version wasn't really
affected because it couldn't be even built with corresponding gnutls from
oe-core release.

On Sat, May 7, 2016 at 8:09 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 05/06/2016 07:35 AM, Martin Jansa wrote:
> > From: Herrie <github.com@herrie.org>
> >
> > Which is compatible with GnuTLS that's included in Krogoth.
>
> this update includes:
> Potential information leak from XMPP    CVE-2014-3698
> Malicious smiley themes could alter arbitrary files     CVE-2014-3697
> Remote crash parsing malformed Groupwise message        CVE-2014-3696
> Remote crash parsing malformed MXit emoticon    CVE-2014-3695
> Insufficient SSL certificate validation         CVE-2014-3694
>
> info like this helps in deciding patch inclusion.
>
> - armin
>
> >
> > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > ---
> >  .../pidgin/pidgin/pidgin-cross-python-265.patch    | 35
> ++++++++++++++--------
> >  .../pidgin/pidgin/pidgin.desktop-set-icon.patch    | 11 -------
> >  .../pidgin/{pidgin_2.10.9.bb => pidgin_2.10.12.bb} | 10 ++-----
> >  3 files changed, 26 insertions(+), 30 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
> >  rename meta-oe/recipes-support/pidgin/{pidgin_2.10.9.bb =>
> pidgin_2.10.12.bb} (91%)
> >
> > diff --git
> a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> > index 57c4c46..cfc681c 100644
> > --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> > +++ b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> > @@ -1,16 +1,27 @@
> > -Index: pidgin-2.6.5/configure.ac
> > -===================================================================
> > ---- pidgin-2.6.5.orig/configure.ac
> > -+++ pidgin-2.6.5/configure.ac
> > -@@ -1470,8 +1470,9 @@ if test "_$pythonpath" != _ ; then
> > -             AC_CHECK_LIB(pthread, pthread_create, )
> > -             AC_CHECK_LIB(util, openpty, )
> > -             AC_CHECK_LIB(db, dbopen, )
> > --            PY_LIBS="-L$PY_EXEC_PREFIX/lib/python$PY_VERSION/config
> -lpython$PY_VERSION"
> > --            PY_CFLAGS="-I$PY_PREFIX/include/python$PY_VERSION"
> > +From 428836ba7f9048970626ef0d6b805107f7c52d33 Mon Sep 17 00:00:00 2001
> > +From: Herrie <github.com@herrie.org>
> > +Date: Thu, 5 May 2016 13:33:29 +0200
> > +Subject: [PATCH] Updated python patch
> > +
> > +---
> > + configure.ac | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 94ea8cf..2285adb 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -1587,9 +1587,9 @@ dnl (Thanks to XChat)
> > + if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON"
> != x"no" ; then
> > +     AC_MSG_CHECKING(for Python compile flags)
> > +     if test -f ${PYTHON}-config; then
> > +-            PY_CFLAGS=`${PYTHON}-config --includes`
> > +-            PY_LIBS=`${PYTHON}-config --libs`
> > +-            AC_DEFINE(USE_PYTHON, [1], [Define if python headers are
> available.])
> >  +            m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
> >  +
> PY_LIBS="-L$PKG_CONFIG_SYSROOT_DIR/usr/lib/python$PY_VERSION/config
> -lpython$PY_VERSION"
> > -+
> PY_CFLAGS="-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"
> > -             AC_DEFINE(USE_PYTHON, [1], [Define if python headers are
> available.])
> > ++
> PY_CFLAGS="-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"
>      AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
> >               AC_MSG_RESULT(ok)
> >       else
> > +             AC_MSG_RESULT([Cannot find ${PYTHON}-config])
> > +
> > diff --git
> a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
> b/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
> > deleted file mode 100644
> > index 05f7689..0000000
> > --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > ---- pidgin-2.0.1/pidgin.desktop.in.orig      2007-06-20
> 23:50:44.000000000 +0000
> > -+++ pidgin-2.0.1/pidgin.desktop.in   2007-06-20 23:51:05.000000000
> +0000
> > -@@ -4,7 +4,7 @@
> > - _GenericName=Internet Messenger
> > - _Comment=Send instant messages over multiple protocols
> > - Exec=pidgin
> > --Icon=pidgin
> > -+Icon=/usr/share/icons/hicolor/48x48/apps/pidgin.png
> > - StartupNotify=true
> > - Terminal=false
> > - Type=Application
> > diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
> b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
> > similarity index 91%
> > rename from meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
> > rename to meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
> > index 8352110..9133c1c 100644
> > --- a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
> > +++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
> > @@ -2,23 +2,19 @@ DESCRIPTION = "multi-protocol instant messaging client"
> >  SECTION = "x11/network"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> > -DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls
> virtual/libintl gstreamer dbus intltool-native farsight2 libidn"
> > +DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls
> virtual/libintl gstreamer dbus intltool-native farsight2 libidn libxml2
> gconf dbus-glib"
> >
> >  inherit autotools gettext pkgconfig gconf perlnative
> >
> > -# http://errors.yoctoproject.org/Errors/Details/25824/
> > -PNBLACKLIST[pidgin] ?= "Not compatible with gnutls version 3.4
> currently in oe-core and also depends on broken libnice through farsight2"
> > -
> >  SRC_URI = "\
> >      ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
> >      file://sanitize-configure.ac.patch \
> > -    file://pidgin.desktop-set-icon.patch \
> >      file://purple-OE-branding-25.patch \
> >      file://pidgin-cross-python-265.patch \
> >  "
> >
> > -SRC_URI[md5sum] = "10a4a69d077893f6dd3438cd8af94e81"
> > -SRC_URI[sha256sum] =
> "dc362ed8577f623eea4554a79e917073aa726825074fea402f2e515f0f51f319"
> > +SRC_URI[md5sum] = "14e0f5cfb2ed065e4dc80391a806ac76"
> > +SRC_URI[sha256sum] =
> "2c7523f0fefe89749c03b2b738ab9f7bd186da435be4762f1487eee31e77ffdd"
> >
> >  EXTRA_OECONF = " \
> >      --enable-vv \
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

