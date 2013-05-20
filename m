Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id DBDAF60658
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 21:43:47 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id k14so8147244oag.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 14:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type:x-gm-message-state;
	bh=G7EGUwwWUNN8tHHOQMYKQvJOGBFCtx0P49Z1iuu3nP0=;
	b=FbG1yNGR5kxIBQeaXY9GVAPhwj9ZhVia8c8kXsdaepHOw6Fq0VZ8B9z404nDqiGupH
	hPlFaZDMQdirZqIAE1i0zswUMvxVP9D5uK+oJwgAhCNMEDVSsavEfl0kFNIuHY0jkCtU
	VVXpwv6spSCYOS6iNazgDPujdFs9P/76OBhnSM47DNtaSc+uOpb3/nBe9dTQ13qJOMWp
	SIUSScwhXbqdQ9RaPLh2K3LFdNfhq6fgTCpaVwWpS5QwD4hFVp0OuqUiIK/5QX84HsLK
	ZOFs/51W+m+2qDqaxKkvHw5wSK7RMS3op2A66Fs7Dzk2WlO7R4PrrdTq503GW6dboLGN
	ZWsQ==
X-Received: by 10.60.62.237 with SMTP id b13mr9920825oes.40.1369086228280;
	Mon, 20 May 2013 14:43:48 -0700 (PDT)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id h4sm13932198oel.2.2013.05.20.14.43.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 20 May 2013 14:43:47 -0700 (PDT)
From: Felipe Ferreri Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2013 14:43:42 -0700
Message-ID: <1685845.Uyjpaanipg@localhost.localdomain>
User-Agent: KMail/4.10.2 (Linux/3.8.9-200.fc18.x86_64; KDE/4.10.2; x86_64; ; )
In-Reply-To: <20130517181159.GL24809@jama.dyndns-home.com>
References: <1368230662-18958-1-git-send-email-eu@felipetonello.com>
	<18040337.siUQ0VeMS8@localhost.localdomain>
	<20130517181159.GL24809@jama.dyndns-home.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmErjdhZWQoltzuHUDcni9yfXI31aUCF2NhGNZozUYhLZWRziT6F5aRmbl3H6zsBwWlcNUh
Subject: Re: [meta-oe][PATCH] connman: updated libconnman-qt to 1.0.7
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
X-List-Received-Date: Mon, 20 May 2013 21:43:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Friday, May 17, 2013 08:11:59 PM Martin Jansa wrote:
> On Fri, May 17, 2013 at 10:55:25AM -0700, Felipe Ferreri Tonello wrote:
> > On Friday, May 10, 2013 05:04:22 PM you wrote:
> > > From: "Felipe F. Tonello" <eu@felipetonello.com>
> > > 
> > > This new recipe version requires the changes in this patch:
> > > http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg
> > > 3814 8.html
> > > 
> > > Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> > > ---
> > > 
> > >  ...-to-disable-qml-plugin-and-test-program-t.patch | 37 ------------
> > >  .../libconnman-qt/libconnman-qt_0.4.0.bb           | 69
> > > 
> > > ---------------------- .../libconnman-qt/libconnman-qt_1.0.7.bb         
> > >  |
> > > 67 +++++++++++++++++++++ 3 files changed, 67 insertions(+), 106
> > > deletions(-)
> > > 
> > >  delete mode 100644
> > > 
> > > meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disab
> > > le-
> > > qml-plugin-and-test-program-t.patch delete mode 100644
> > > meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb create mode
> > > 100644
> > > meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> > > 
> > > diff --git
> > > a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-dis
> > > abl
> > > e-qml-plugin-and-test-program-t.patch
> > > b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-dis
> > > abl
> > > e-qml-plugin-and-test-program-t.patch deleted file mode 100644
> > > index 6ec084d..0000000
> > > ---
> > > a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-dis
> > > abl
> > > e-qml-plugin-and-test-program-t.patch +++ /dev/null
> > > @@ -1,37 +0,0 @@
> > > -From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> > > -From: "Felipe F. Tonello" <ftonello@cercacor.com>
> > > -Date: Mon, 7 Jan 2013 17:13:22 -0800
> > > -Subject: [PATCH] added flags to disable qml plugin and test program to
> > > - compile
> > > -
> > > -This is usefull when there is no need to compile test program and qml
> > > plugin. -
> > > -Upstream-Status: Accepted
> > > -
> > > -Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> > > ----
> > > - connman-qt.pro |   11 ++++++++++-
> > > - 1 file changed, 10 insertions(+), 1 deletion(-)
> > > -
> > > -diff --git a/connman-qt.pro b/connman-qt.pro
> > > -index 7d9ec99..425c41f 100644
> > > ---- a/connman-qt.pro
> > > -+++ b/connman-qt.pro
> > > -@@ -1,4 +1,13 @@
> > > - TEMPLATE = subdirs
> > > --SUBDIRS += libconnman-qt test plugin
> > > -+SUBDIRS += libconnman-qt
> > > - CONFIG += ordered
> > > -
> > > -+# CONFIG flag to disable test program
> > > -+!notest {
> > > -+    SUBDIRS += test
> > > -+}
> > > -+
> > > -+# CONFIG flag to disable qml plugin
> > > -+!noplugin {
> > > -+    SUBDIRS += plugin
> > > -+}
> > > ---
> > > -1.7.9.5
> > > -
> > > diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
> > > b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb deleted file
> > > mode
> > > 100644
> > > index 50c149f..0000000
> > > --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
> > > +++ /dev/null
> > > @@ -1,69 +0,0 @@
> > > -DESCRIPTION = "Qt Library for ConnMan"
> > > -HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
> > > -LICENSE = "Apache-2.0"
> > > -LIC_FILES_CHKSUM =
> > > "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900c
> > > e3c
> > > 5dac88" -
> > > -SECTION = "qt/lib"
> > > -
> > > -PR = "r0"
> > > -
> > > -inherit qt4x11 pkgconfig
> > > -
> > > -RDEPENDS_${PN} = "connman"
> > > -RDEPENDS_${PN}-plugin = "${PN}"
> > > -
> > > -PROVIDES += "${PN}-plugin"
> > > -
> > > -PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
> > > -RRECOMMENDS_${PN} = "${PN}-plugin"
> > > -
> > > -BRANCH = "master"
> > > -# this matches 0.4.0 tag
> > > -SRCREV = "3af5bd38d82255942f582398160a5d3354346ca3"
> > > -
> > > -SRC_URI = " \
> > > -    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
> > > -   
> > > file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> > > \ -"
> > > -
> > > -S = "${WORKDIR}/git"
> > > -
> > > -QT_IMPORTS_DIR = "${libdir}/qt4/imports"
> > > -# the plugin target needs to be the same as 'target.path' and
> > > 'qmldir.path' in ${S}/plugin/plugin.pro -PLUGINS_TARGET =
> > > "${QT_IMPORTS_DIR}/MeeGo/Connman"
> > > -
> > > -EXTRA_QMAKEVARS_PRE = " \
> > > -    CONFIG+=notest \
> > > -"
> > > -
> > > -do_configure_prepend() {
> > > -    # Hack *.pro variables
> > > -    find ${S}/plugin/*.pro -exec sed -i -e
> > > 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';' -}
> > > -
> > > -do_install() {
> > > -    export INSTALL_ROOT=${D}
> > > -    oe_runmake install
> > > -}
> > > -
> > > -FILES_${PN} = " \
> > > -    ${libdir}/libconnman-qt4${SOLIBS} \
> > > -"
> > > -
> > > -FILES_${PN}-dev = " \
> > > -    ${includedir}/connman-qt/* \
> > > -    ${libdir}/libconnman-qt4${SOLIBSDEV} \
> > > -    ${libdir}/libconnman-qt4.prl \
> > > -    ${libdir}/pkgconfig/connman-qt4.pc \
> > > -    ${libdir}/connman-qt4.pc \
> > > -"
> > > -
> > > -FILES_${PN}-plugin = " \
> > > -    ${PLUGINS_TARGET}/qmldir \
> > > -    ${PLUGINS_TARGET}/lib*.so \
> > > -"
> > > -
> > > -FILES_${PN}-plugin-dbg = " \
> > > -    ${PLUGINS_TARGET}/.debug \
> > > -    ${PLUGINS_TARGET}/.debug/* \
> > > -"
> > > diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> > > b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb new file mode
> > > 100644
> > > index 0000000..65a2731
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> > > @@ -0,0 +1,67 @@
> > > +DESCRIPTION = "Qt Library for ConnMan"
> > > +HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
> > > +LICENSE = "Apache-2.0"
> > > +LIC_FILES_CHKSUM =
> > > "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900c
> > > e3c
> > > 5dac88" +
> > > +SECTION = "qt/lib"
> > > +
> > > +PR = "r0"
> > > +
> > > +inherit qt4x11 pkgconfig
> > > +
> > > +RDEPENDS_${PN} = "connman"
> > > +RDEPENDS_${PN}-plugin = "${PN}"
> > > +
> > > +PROVIDES += "${PN}-plugin"
> > > +
> > > +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
> > > +RRECOMMENDS_${PN} = "${PN}-plugin"
> > > +
> > > +BRANCH = "master"
> > > +SRCREV = "6a5e4f981112a90a8c19d82bd671da389d2af993"
> > > +
> > > +SRC_URI = " \
> > > +    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
> > > +"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
> > > +# the plugin target needs to be the same as 'target.path' and
> > > 'qmldir.path' in ${S}/plugin/plugin.pro +PLUGINS_TARGET =
> > > "${QT_IMPORTS_DIR}/MeeGo/Connman"
> > > +
> > > +EXTRA_QMAKEVARS_PRE = " \
> > > +    CONFIG+=notest \
> > > +"
> > > +
> > > +do_configure_prepend() {
> > > +    # Hack *.pro variables
> > > +    find ${S}/plugin/*.pro -exec sed -i -e
> > > 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';' +}
> > > +
> > > +do_install() {
> > > +    export INSTALL_ROOT=${D}
> > > +    oe_runmake install
> > > +}
> > > +
> > > +FILES_${PN} = " \
> > > +    ${libdir}/libconnman-qt4${SOLIBS} \
> > > +"
> > > +
> > > +FILES_${PN}-dev = " \
> > > +    ${includedir}/connman-qt/* \
> > > +    ${libdir}/libconnman-qt4${SOLIBSDEV} \
> > > +    ${libdir}/libconnman-qt4.prl \
> > > +    ${libdir}/pkgconfig/connman-qt4.pc \
> > > +    ${libdir}/connman-qt4.pc \
> > > +"
> > > +
> > > +FILES_${PN}-plugin = " \
> > > +    ${PLUGINS_TARGET}/qmldir \
> > > +    ${PLUGINS_TARGET}/lib*.so \
> > > +"
> > > +
> > > +FILES_${PN}-plugin-dbg = " \
> > > +    ${PLUGINS_TARGET}/.debug \
> > > +    ${PLUGINS_TARGET}/.debug/* \
> > > +"
> > 
> > ping?
> 
> It was failing to build in last 3 world builds, you can see logs here:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-May/045588.html

Yes, it needs that fix that I mentioned into oe-core.

Can you take a look into that?

Thank you

-- 
Felipe Ferreri Tonello

