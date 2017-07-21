Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B16FB78402
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 11:35:58 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id z37so11899359ybh.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c4YhpN+K80JUwbqiJSD7BInYYyF5DKBbSokNLLz16Bs=;
	b=VUuvSmxcEMeIfkJhrhBsM4kMZktpSyYhn8T8dAVoX0XURhR9075hapATmvcOOEO0lm
	WNJ5+A196sFJpBgCISYDC2LLGch5JR8etmCR/Stqf3lkLI6kgzLovVuqvvdpOMggXNkN
	t47+EYFE6DLrVABKxL3RfnNIiPgCOsq94lnHhbSV3DxQsS6F7FFdYtSy4bFEAilezVSy
	RmgsWmZAccNZ52P9qTAIieRBoD5LUDhTG9HeOHPC0gnoE67vcZx2ekkD6XsSTo2o0BrD
	FlfrW9xWzb0jUX1jxqD95JeNcYV8N6rIM/wAKGIOZLKLxOxuwrP42aC9VhRP6iJPQTli
	JGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c4YhpN+K80JUwbqiJSD7BInYYyF5DKBbSokNLLz16Bs=;
	b=e9F0xtCuTivVraKB4c3FM4oPzzl7eTn9gLUzp/7iaF4X5DmSIPfFWAhXezOuJN+JkZ
	YX7r/5YY7PH0x7NwPES/x4S8a5twnIUU1uUoGLchMFv+TtN1Zts46/8AiG8u5UMxCTkY
	9U5Aes33OMlyKJ/nd5BsRMXjrYNN+ww/cGvxEuCwMpdUY9M5mfKohaJMBNwxfyJ5Q/Ot
	X4CNL6s5kck/rtfNeNFz6ss6PsV1Cl5YeQ0ED9mT2774YPXoeqM5BwUvFVg31gO5NYYO
	QniTQBYIwRy6THG+m3SWS/CtSDStRxV6sCFEy+JytSKarEC5UR3eTSFRQzceWePr1+z2
	/6YQ==
X-Gm-Message-State: AIVw113RBXLVTLfQueMhaedhL2QsWfHlazd13/irfmeCqFgf673z9TuG
	RCZ0Xyj5pElH/jcE7kw6Qc9UMIz3ZA==
X-Received: by 10.37.189.204 with SMTP id g12mr6259958ybk.336.1500636959456;
	Fri, 21 Jul 2017 04:35:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 21 Jul 2017 04:35:58 -0700 (PDT)
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C60E25F48F@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C60E25DEFE@G08CNEXMBPEKD03.g08.fujitsu.local>
	<CA+chaQfhgcbZvh1iQ5wGTzxrkYtwpz3a87FZ7B4BZTKpc8qt3g@mail.gmail.com>
	<97F7C8E70D26E94FA7E05578493F65C60E25F48F@G08CNEXMBPEKD03.g08.fujitsu.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jul 2017 13:35:58 +0200
Message-ID: <CA+chaQcoC6XVFfVxYsXh5=KbNEH+D1dKHPvJXK6J7DV9TCLbeg@mail.gmail.com>
To: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [PATCH] qtbase: add ptest
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
X-List-Received-Date: Fri, 21 Jul 2017 11:35:58 -0000
Content-Type: text/plain; charset="UTF-8"

Dear Huang,

I'm sorry other ptest related changes were merged, but not this one. I've
added it to master-next now.

On Fri, Jul 21, 2017 at 11:41 AM, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> Dear Martin
>
>
>
> I have searched in the git log,and it was really not be mergerd.Could you
> please ensure it?
>
>
>
> huangqy
>
>
>
> *From:* Martin Jansa [mailto:martin.jansa@gmail.com]
> *Sent:* Friday, July 21, 2017 4:48 PM
> *To:* Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-qt5] [PATCH] qtbase: add ptest
>
>
>
> It was merged last week, why are you pinging this?
>
>
>
> On Fri, Jul 21, 2017 at 9:01 AM, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> wrote:
>
> ping
>
> > -----Original Message-----
> > From: Huang, Qiyu
> > Sent: Friday, June 09, 2017 9:06 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> > Subject: [oe] [meta-qt5] [PATCH] qtbase: add ptest
> >
>
> > Add ptest for qtbase  by using provided testsuite.
> >
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > ---
> >  .../0001-Delete-qlonglong-and-qulonglong.patch     | 28
> > ++++++++++++++++++++++
> >  recipes-qt/qt5/qtbase/run-ptest                    |  6 +++++
> >  recipes-qt/qt5/qtbase_git.bb                       | 17 ++++++++++++-
> >  3 files changed, 50 insertions(+), 1 deletion(-)  create mode 100644
> > recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> >  create mode 100644 recipes-qt/qt5/qtbase/run-ptest
> >
> > diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-
> qulonglong.patch
> > b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > new file mode 100644
> > index 0000000..975cd28
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > @@ -0,0 +1,28 @@
> > +From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00
> > 2001
> > +From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > +Date: Wed, 7 Jun 2017 21:00:49 +0900
> > +Subject: [PATCH] Delete qlonglong and qulonglong
> > +
> > +Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > +---
> > + tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro | 2 --
> > + 1 file changed, 2 deletions(-)
> > +
> > +diff --git
>
> > +a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > +b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
>
> > +index 09458bd..59a120e 100644
> > +--- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > ++++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > +@@ -5,10 +5,8 @@ SUBDIRS=\
> > +     char32_t \
> > +     int \
> > +     long \
> > +-    qlonglong \
> > +     qptrdiff \
> > +     quintptr \
> > +-    qulonglong \
> > +     schar \
> > +     short \
> > +     uchar \
> > +--
> > +2.7.4
> > +
> > diff --git a/recipes-qt/qt5/qtbase/run-ptest
> b/recipes-qt/qt5/qtbase/run-ptest
> > new file mode 100644 index 0000000..044f834
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtbase/run-ptest
> > @@ -0,0 +1,6 @@
> > +#!/bin/sh
> > +
> > +for x in ` awk '{print $1}' tst_list `;do
> > +    ./${x};
> > +done
> > +
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index
> > 27d0de1..39fc272 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -23,8 +23,12 @@ SRC_URI += "\
> >      file://0005-configure-bump-path-length-from-256-to-512-
> character.patch
> > \
> >      file://0009-Disable-all-unknown-features-instead-of-
> erroring-out.patch \
> >
> > file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
> > \
> > +    file://0001-Delete-qlonglong-and-qulonglong.patch \
> > +    file://run-ptest \
> >  "
> >
> > +inherit ptest
> > +
> >  # only for target qtbase
> >  SRC_URI += "\
> >      file://0008-configure-paths-for-target-qmake-properly.patch \ @@
> -48,7
> > +52,7 @@ PACKAGECONFIG_DISTRO ?= ""
> >  PACKAGECONFIG_RELEASE ?= "release"
> >  # This is in qt5.inc, because qtwebkit-examples are using it to enable
> > ca-certificates dependency  # PACKAGECONFIG_OPENSSL ?= "openssl"
> > -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype"
> > +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype
> > tests"
> >
> >  PACKAGECONFIG ?= " \
> >      ${PACKAGECONFIG_RELEASE} \
> > @@ -170,6 +174,17 @@ do_configure() {
> >          ${QT_CONFIG_FLAGS}
> >  }
> >
> > +fakeroot do_install_ptest() {
> > +    mkdir -p ${D}${PTEST_PATH}
> > +    t=${D}${PTEST_PATH}
> > +    for var in ` find ${B}/tests/auto/ -name tst_*`; do
> > +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
> > +            echo ${var##*/} >> ${t}/tst_list
> > +            install -m 0644 ${var} ${t}
> > +        fi
> > +    done
> > +}
> > +
> >  do_install_append() {
> >      # Avoid qmake error "Cannot read
> > [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or
> directory"
> >      touch
> > ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
> > --
> > 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

