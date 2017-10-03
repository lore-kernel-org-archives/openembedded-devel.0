Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7568760269
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 07:53:55 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id p10so3856092wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0mLtVAhFMXL86+FxYysFEwc16rj7QoP9P3w7Th9usZY=;
	b=TPJOnRIRb9hG+zQzzTGKyrEtjErLLKjzF0pZRUUq0nvgCAK1JavQBnj3xoDFTuGKPe
	hql/GUPufor/XavQaQaHRR/eAT18zNmuGOyn02URzsl60jJYO+Wct1tKAIrebPNz8ThT
	voeiCn+2lQUPFKgmrHP/bcS8rDqQ/7rP1yEYawa2Cx1ZqXnIxlvbJrf8ivIHpUSOcMnQ
	GZYeUiC48MaFilPrGcDQCGCWCLEIGIS/+PY0ii3zqk1WYL4wBBZrtV/QL8hU8qnBsCcn
	3S4jwwfipovT0+yWEaGI6CF5c3PQOBYqQTNwtWr2lN3w0qGbUAnD8755W0K/SYhwZ8ip
	GWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0mLtVAhFMXL86+FxYysFEwc16rj7QoP9P3w7Th9usZY=;
	b=kcDv4H6qsabyNdtQ2zbAbrnsK7h/w9ZgmHzLUY3MBavBpe4hs4UeyNqUJFUjgHqG6X
	SjXfxTRK0bVEWss73IASNhqQzmatfjGBYQM7acnqkVB330gpsccpmhPAXnv350FfvSKq
	Rt4psxbx3rx0Cd8UEs8HgEf4xunOqKyFOJE353IwIP+YxGjyPbwcjc59mG820zpLR2gc
	kwxaifvF1mqo7SPR63hvdhy3LKymY3qxVcwXVlI6TQS4bObSi+WkZXM0PIuEDwa+vceV
	x1T1p6mffiLodNO8YQpxJWjib7cR7PUkfSvOwpZbxLZ9GVJL2/8LOiurvTIft4bO6Kco
	Mzsw==
X-Gm-Message-State: AMCzsaUSGHzyrKXDKqPibWNe/iB+32gsO1/vfwTBbqFkU127keFMnPW1
	tUlCSoWCcXzDxbQ9Xwe6THy+PY28ZEpY8kUrdO8=
X-Google-Smtp-Source: AOwi7QDx1JMPqe+iASg6Ba6CaWUqL9Br2n6RSFqpcd6wqQOSi9gk+Szm4TLNezR1cJxK3EFW/9lLEeD74mQDdTR3orA=
X-Received: by 10.223.134.68 with SMTP id 4mr2460301wrw.67.1507017236652; Tue,
	03 Oct 2017 00:53:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 3 Oct 2017 00:53:55 -0700 (PDT)
In-Reply-To: <20171002215123.GD16828@denix.org>
References: <1500946223-25865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C60E31BBC6@G08CNEXMBPEKD03.g08.fujitsu.local>
	<CA+chaQd2cADxXOpPJX3NDEY3w15oTwJKKGpx8SpA6TmB-2A5BA@mail.gmail.com>
	<20171002215123.GD16828@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Oct 2017 09:53:55 +0200
Message-ID: <CA+chaQch17Fsivf7RYthxa-yFtpu6neGCUOFc1i1i+L-3_mPCQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 03 Oct 2017 07:53:56 -0000
Content-Type: text/plain; charset="UTF-8"

IIRC It was merged as is with additional fix from Khem on top of that to
resolve this build issue.

On Mon, Oct 2, 2017 at 11:51 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Was this actually merged to master as is?
>
>
> On Tue, Aug 15, 2017 at 11:22:20AM +0200, Martin Jansa wrote:
> > pong,
> >
> > it's failing to build as reported by me and Khem, so it won't get merged
> in
> > this form.
> >
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-August/114108.html
> >
> > On Tue, Aug 15, 2017 at 3:21 AM, Huang, Qiyu <
> huangqy.fnst@cn.fujitsu.com>
> > wrote:
> >
> > > ping
> > >
> > > > -----Original Message-----
> > > > From: Huang, Qiyu
> > > > Sent: Tuesday, July 25, 2017 9:30 AM
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Cc: Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > > Subject: [oe] [meta-qt5] [PATCH v2] qtbase: add ptest
> > > >
> > > > Add ptest for qtbase by using provided testsuite.
> > > >
> > > > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > > ---
> > > >  .../0001-Delete-qlonglong-and-qulonglong.patch     | 28
> > > > ++++++++++++++++++++++
> > > >  recipes-qt/qt5/qtbase/run-ptest                    |  6 +++++
> > > >  recipes-qt/qt5/qtbase_git.bb                       | 17
> ++++++++++++-
> > > >  3 files changed, 50 insertions(+), 1 deletion(-)  create mode 100644
> > > > recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > > >  create mode 100644 recipes-qt/qt5/qtbase/run-ptest
> > > >
> > > > diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-
> > > qulonglong.patch
> > > > b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > > > new file mode 100644
> > > > index 0000000..975cd28
> > > > --- /dev/null
> > > > +++ b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-
> qulonglong.patch
> > > > @@ -0,0 +1,28 @@
> > > > +From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00
> > > > 2001
> > > > +From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > > +Date: Wed, 7 Jun 2017 21:00:49 +0900
> > > > +Subject: [PATCH] Delete qlonglong and qulonglong
> > > > +
> > > > +Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > > > +---
> > > > + tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro | 2 --
> > > > + 1 file changed, 2 deletions(-)
> > > > +
> > > > +diff --git
> > > > +a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > > +b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > > +index 09458bd..59a120e 100644
> > > > +--- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > > ++++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > > > +@@ -5,10 +5,8 @@ SUBDIRS=\
> > > > +     char32_t \
> > > > +     int \
> > > > +     long \
> > > > +-    qlonglong \
> > > > +     qptrdiff \
> > > > +     quintptr \
> > > > +-    qulonglong \
> > > > +     schar \
> > > > +     short \
> > > > +     uchar \
> > > > +--
> > > > +2.7.4
> > > > +
> > > > diff --git a/recipes-qt/qt5/qtbase/run-ptest
> > > b/recipes-qt/qt5/qtbase/run-ptest
> > > > new file mode 100644 index 0000000..044f834
> > > > --- /dev/null
> > > > +++ b/recipes-qt/qt5/qtbase/run-ptest
> > > > @@ -0,0 +1,6 @@
> > > > +#!/bin/sh
> > > > +
> > > > +for x in ` awk '{print $1}' tst_list `;do
> > > > +    ./${x};
> > > > +done
> > > > +
> > > > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/
> qtbase_git.bb
> > > index
> > > > 5cfbcfa..8464873 100644
> > > > --- a/recipes-qt/qt5/qtbase_git.bb
> > > > +++ b/recipes-qt/qt5/qtbase_git.bb
> > > > @@ -23,8 +23,12 @@ SRC_URI += "\
> > > >      file://0005-configure-bump-path-length-from-256-to-512-
> > > character.patch
> > > > \
> > > >      file://0009-Disable-all-unknown-features-instead-of-
> erroring-out.patch
> > > \
> > > >
> > > > file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_
> EXTERNAL_H.patch
> > > > \
> > > > +    file://0001-Delete-qlonglong-and-qulonglong.patch \
> > > > +    file://run-ptest \
> > > >  "
> > > >
> > > > +inherit ptest
> > > > +
> > > >  # only for target qtbase
> > > >  SRC_URI += "\
> > > >      file://0008-configure-paths-for-target-qmake-properly.patch \
> @@
> > > -48,7
> > > > +52,7 @@ PACKAGECONFIG_DISTRO ?= ""
> > > >  PACKAGECONFIG_RELEASE ?= "release"
> > > >  # This is in qt5.inc, because qtwebkit-examples are using it to
> enable
> > > > ca-certificates dependency  # PACKAGECONFIG_OPENSSL ?= "openssl"
> > > > -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs
> freetype"
> > > > +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs
> freetype
> > > > tests"
> > > >
> > > >  PACKAGECONFIG ?= " \
> > > >      ${PACKAGECONFIG_RELEASE} \
> > > > @@ -171,6 +175,17 @@ do_configure() {
> > > >          ${QT_CONFIG_FLAGS}
> > > >  }
> > > >
> > > > +fakeroot do_install_ptest() {
> > > > +    mkdir -p ${D}${PTEST_PATH}
> > > > +    t=${D}${PTEST_PATH}
> > > > +    for var in ` find ${B}/tests/auto/ -name tst_*`; do
> > > > +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
> > > > +            echo ${var##*/} >> ${t}/tst_list
> > > > +            install -m 0644 ${var} ${t}
> > > > +        fi
> > > > +    done
> > > > +}
> > > > +
> > > >  do_install_append() {
> > > >      # Avoid qmake error "Cannot read
> > > > [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or
> > > directory"
> > > >      touch
> > > > ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
> > > > --
> > > > 2.7.4
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

