Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U9Zcn-0002Ec-Cy
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2013 12:20:11 +0100
Received: by mail-we0-f181.google.com with SMTP id t44so1690003wey.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2013 03:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=UoUi+zJCkBomGBRXc410gVanqxYIPMDlDH3nl+9pCA4=;
	b=Spsmd3jEkyg4oNkriGZhxs0I7k551iUj1d53kcI1iKW4vbeECbFEn5YtLXJ0+h10lM
	y8RsjjoxOGIgbZy1Ba5cnsI0V9E6neU75+drJrgBNV5hhMtNZ/593ce0ImLse7Y1zyfP
	N6uhC6KNkHBsegpq7L5HIpX/v9EMvhAgoEYmmsJ7ci5RXLAysvOtDNKS7LNsdMkFRcog
	y9oaMsKDRp1eSc/9GeM7m//qP+6z1Qk/EiW4JxJQnUzy4L7jMmOa6DHEwXnLlSQ5zR13
	zGVjR+nLj3PUqykNrLwJa81aZdiBfN2BXsLtJNOuILyStY+IMg+Z3vscdR9bLru8Jk5p
	YTwA==
MIME-Version: 1.0
X-Received: by 10.180.8.4 with SMTP id n4mr6200406wia.13.1361703833137; Sun,
	24 Feb 2013 03:03:53 -0800 (PST)
Received: by 10.194.89.106 with HTTP; Sun, 24 Feb 2013 03:03:52 -0800 (PST)
Received: by 10.194.89.106 with HTTP; Sun, 24 Feb 2013 03:03:52 -0800 (PST)
In-Reply-To: <20130224074856.GA3154@sakrah.homelinux.org>
References: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
	<20130224074856.GA3154@sakrah.homelinux.org>
Date: Sun, 24 Feb 2013 03:03:53 -0800
Message-ID: <CA+chaQfNpg6VKyoxUYQ4j31NoomdL6Ac7iOPBbF_1v0t1vTQ5g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] connman: added recipe libconnman-qt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2013 11:20:14 -0000
Content-Type: text/plain; charset=UTF-8

I think I've changed that before merging. If it's in master with autorev,
then I'll fix it myself.
On Feb 24, 2013 8:52 AM, "Khem Raj" <raj.khem@gmail.com> wrote:

> On (11/02/13 09:25), eu@felipetonello.com wrote:
> > From: "Felipe F. Tonello" <ftonello@cercacor.com>
> >
> > This recipe provides the Qt library and QML plugins for connman.
> >
> > Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> > ---
> >  ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
> >  .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69
> ++++++++++++++++++++
> >  2 files changed, 106 insertions(+)
> >  create mode 100644
> meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> >  create mode 100644 meta-oe/recipes-qt/libconnmna-qt/
> libconnman-qt_0.4.0.bb
> >
> > diff --git
> a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> > new file mode 100644
> > index 0000000..6ec084d
> > --- /dev/null
> > +++
> b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> > @@ -0,0 +1,37 @@
> > +From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> > +From: "Felipe F. Tonello" <ftonello@cercacor.com>
> > +Date: Mon, 7 Jan 2013 17:13:22 -0800
> > +Subject: [PATCH] added flags to disable qml plugin and test program to
> > + compile
> > +
> > +This is usefull when there is no need to compile test program and qml
> plugin.
> > +
> > +Upstream-Status: Accepted
> > +
> > +Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> > +---
> > + connman-qt.pro |   11 ++++++++++-
> > + 1 file changed, 10 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/connman-qt.pro b/connman-qt.pro
> > +index 7d9ec99..425c41f 100644
> > +--- a/connman-qt.pro
> > ++++ b/connman-qt.pro
> > +@@ -1,4 +1,13 @@
> > + TEMPLATE = subdirs
> > +-SUBDIRS += libconnman-qt test plugin
> > ++SUBDIRS += libconnman-qt
> > + CONFIG += ordered
> > +
> > ++# CONFIG flag to disable test program
> > ++!notest {
> > ++    SUBDIRS += test
> > ++}
> > ++
> > ++# CONFIG flag to disable qml plugin
> > ++!noplugin {
> > ++    SUBDIRS += plugin
> > ++}
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bbb/meta-oe/recipes-qt/libconnmna-qt/
> libconnman-qt_0.4.0.bb
> > new file mode 100644
> > index 0000000..2c33b49
> > --- /dev/null
> > +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> > @@ -0,0 +1,69 @@
> > +DESCRIPTION = "Qt Library for ConnMan"
> > +HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM =
> "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
> > +
> > +SECTION = "qt/lib"
> > +
> > +PR = "r0"
> > +
> > +inherit qt4x11 pkgconfig
> > +
> > +RDEPENDS_${PN} = "connman"
> > +RDEPENDS_${PN}-plugin = "${PN}"
> > +
> > +PROVIDES += "${PN}-plugin"
> > +
> > +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
> > +RRECOMMENDS_${PN} = "${PN}-plugin"
> > +
> > +# this is for users to bbappend this recipe and change it
> > +BRANCH = "master"
> > +TAG = "${PV}"
> > +SRCREV = "${AUTOREV}"
>
> Dont use AUTOREV please. I know its merged but I would suggest to send
> an update for that and also avoid TAG and use concrete SRCREV
>
> > +
> > +SRC_URI = " \
> > +  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
> > +
>  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
> > +# the plugin target needs to be the same as 'target.path' and
> 'qmldir.path' in ${S}/plugin/plugin.pro
> > +PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
> > +
> > +FILES_${PN} = " \
> > +  ${libdir}/libconnman-qt4${SOLIBS} \
> > +"
> > +
> > +FILES_${PN}-dev = " \
> > +  ${includedir}/connman-qt/* \
> > +  ${libdir}/libconnman-qt4${SOLIBSDEV} \
> > +  ${libdir}/libconnman-qt4.prl \
> > +  ${libdir}/pkgconfig/connman-qt4.pc \
> > +  ${libdir}/connman-qt4.pc \
> > +"
> > +
> > +FILES_${PN}-plugin = " \
> > +  ${PLUGINS_TARGET}/qmldir \
> > +  ${PLUGINS_TARGET}/lib*.so \
> > +"
> > +
> > +FILES_${PN}-plugin-dbg = " \
> > +  ${PLUGINS_TARGET}/.debug \
> > +  ${PLUGINS_TARGET}/.debug/* \
> > +"
> > +
> > +EXTRA_QMAKEVARS_PRE = " \
> > +  CONFIG+=notest \
> > +"
> > +
> > +do_configure_prepend() {
> > +  # Hack *.pro variables
> > +  find ${S}/plugin/*.pro -exec sed -i -e
> 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
> > +}
> > +
> > +do_install() {
> > +  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
> > +}
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

