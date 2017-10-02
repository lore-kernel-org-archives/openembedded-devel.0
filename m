Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A4D9E71A15
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 21:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85B04209BC;
	Mon,  2 Oct 2017 21:51:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Aa22Hw7CS5cs; Mon,  2 Oct 2017 21:51:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 526C42078C;
	Mon,  2 Oct 2017 21:51:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B7BF71626B2; Mon,  2 Oct 2017 17:51:23 -0400 (EDT)
Date: Mon, 2 Oct 2017 17:51:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20171002215123.GD16828@denix.org>
References: <1500946223-25865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C60E31BBC6@G08CNEXMBPEKD03.g08.fujitsu.local>
	<CA+chaQd2cADxXOpPJX3NDEY3w15oTwJKKGpx8SpA6TmB-2A5BA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQd2cADxXOpPJX3NDEY3w15oTwJKKGpx8SpA6TmB-2A5BA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [PATCH v2] qtbase: add ptest
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
X-List-Received-Date: Mon, 02 Oct 2017 21:51:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Was this actually merged to master as is?


On Tue, Aug 15, 2017 at 11:22:20AM +0200, Martin Jansa wrote:
> pong,
> 
> it's failing to build as reported by me and Khem, so it won't get merged in
> this form.
> 
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114108.html
> 
> On Tue, Aug 15, 2017 at 3:21 AM, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> wrote:
> 
> > ping
> >
> > > -----Original Message-----
> > > From: Huang, Qiyu
> > > Sent: Tuesday, July 25, 2017 9:30 AM
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > Subject: [oe] [meta-qt5] [PATCH v2] qtbase: add ptest
> > >
> > > Add ptest for qtbase by using provided testsuite.
> > >
> > > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > ---
> > >  .../0001-Delete-qlonglong-and-qulonglong.patch     | 28
> > > ++++++++++++++++++++++
> > >  recipes-qt/qt5/qtbase/run-ptest                    |  6 +++++
> > >  recipes-qt/qt5/qtbase_git.bb                       | 17 ++++++++++++-
> > >  3 files changed, 50 insertions(+), 1 deletion(-)  create mode 100644
> > > recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > >  create mode 100644 recipes-qt/qt5/qtbase/run-ptest
> > >
> > > diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-
> > qulonglong.patch
> > > b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > > new file mode 100644
> > > index 0000000..975cd28
> > > --- /dev/null
> > > +++ b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > > @@ -0,0 +1,28 @@
> > > +From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00
> > > 2001
> > > +From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > +Date: Wed, 7 Jun 2017 21:00:49 +0900
> > > +Subject: [PATCH] Delete qlonglong and qulonglong
> > > +
> > > +Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > +---
> > > + tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro | 2 --
> > > + 1 file changed, 2 deletions(-)
> > > +
> > > +diff --git
> > > +a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > +b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > +index 09458bd..59a120e 100644
> > > +--- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > ++++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > +@@ -5,10 +5,8 @@ SUBDIRS=\
> > > +     char32_t \
> > > +     int \
> > > +     long \
> > > +-    qlonglong \
> > > +     qptrdiff \
> > > +     quintptr \
> > > +-    qulonglong \
> > > +     schar \
> > > +     short \
> > > +     uchar \
> > > +--
> > > +2.7.4
> > > +
> > > diff --git a/recipes-qt/qt5/qtbase/run-ptest
> > b/recipes-qt/qt5/qtbase/run-ptest
> > > new file mode 100644 index 0000000..044f834
> > > --- /dev/null
> > > +++ b/recipes-qt/qt5/qtbase/run-ptest
> > > @@ -0,0 +1,6 @@
> > > +#!/bin/sh
> > > +
> > > +for x in ` awk '{print $1}' tst_list `;do
> > > +    ./${x};
> > > +done
> > > +
> > > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> > index
> > > 5cfbcfa..8464873 100644
> > > --- a/recipes-qt/qt5/qtbase_git.bb
> > > +++ b/recipes-qt/qt5/qtbase_git.bb
> > > @@ -23,8 +23,12 @@ SRC_URI += "\
> > >      file://0005-configure-bump-path-length-from-256-to-512-
> > character.patch
> > > \
> > >      file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch
> > \
> > >
> > > file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
> > > \
> > > +    file://0001-Delete-qlonglong-and-qulonglong.patch \
> > > +    file://run-ptest \
> > >  "
> > >
> > > +inherit ptest
> > > +
> > >  # only for target qtbase
> > >  SRC_URI += "\
> > >      file://0008-configure-paths-for-target-qmake-properly.patch \ @@
> > -48,7
> > > +52,7 @@ PACKAGECONFIG_DISTRO ?= ""
> > >  PACKAGECONFIG_RELEASE ?= "release"
> > >  # This is in qt5.inc, because qtwebkit-examples are using it to enable
> > > ca-certificates dependency  # PACKAGECONFIG_OPENSSL ?= "openssl"
> > > -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype"
> > > +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype
> > > tests"
> > >
> > >  PACKAGECONFIG ?= " \
> > >      ${PACKAGECONFIG_RELEASE} \
> > > @@ -171,6 +175,17 @@ do_configure() {
> > >          ${QT_CONFIG_FLAGS}
> > >  }
> > >
> > > +fakeroot do_install_ptest() {
> > > +    mkdir -p ${D}${PTEST_PATH}
> > > +    t=${D}${PTEST_PATH}
> > > +    for var in ` find ${B}/tests/auto/ -name tst_*`; do
> > > +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
> > > +            echo ${var##*/} >> ${t}/tst_list
> > > +            install -m 0644 ${var} ${t}
> > > +        fi
> > > +    done
> > > +}
> > > +
> > >  do_install_append() {
> > >      # Avoid qmake error "Cannot read
> > > [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or
> > directory"
> > >      touch
> > > ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
> > > --
> > > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

