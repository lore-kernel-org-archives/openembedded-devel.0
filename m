Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id CB49760269
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 07:56:06 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id k62so5663039wrc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 00:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2ayIV3BSKl9iXAUKDCk0tped1p80LprQnbdqo2uSdxY=;
	b=mc8M8TJsZTothqfOUrtDv4Vyjpej68HdwMyne9bKfi8A1PkhyS9741kZmNdZLlRz40
	EIGXX3C1k1oLkYQTbEcGlWuBe5dEdhvAwMntCaDgowgbVi+5p82vdA74NsDnEZFZzGHP
	Lzk/SpqnDHLEf7EwMyFfJUwVT2GzoeyDf9DrGtZwKG6riWgQrcEqHoZ2hgEONq7nwvzO
	5Eo3yr9zlx3MOZhZXz82PYRWiSXYZiP6a4ovDAG4P0Hq7hrGNZ/Ka+pEaWX41nmE+e06
	TluncLxGDJfJARMQM6Dsng4Xvk4GNGNrbGdhO8/zmrmq+pnL15mVNuQ7qKyvHRPe2XiT
	Zcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2ayIV3BSKl9iXAUKDCk0tped1p80LprQnbdqo2uSdxY=;
	b=ufsbYh/emDMFL2hgLpDooO1c2yxpm7opxbYttbGxh2NQArvqM9JiDEE/MYhOygdpBb
	5LijD8j9nLZMlMUX9nzajqEtWkk/03sDD9eNQnyNxhq7Rb6iRTw4vZRMg8Pe0QfXWd+x
	/8sS+i/aJtrTKdkeNVT13yPEFvOaBudfnz5CKrIClVLdpxJmBK0I6wB3vl1CggizkqDB
	bMQBqJ2mPbCty2ZqHi0lLFpAnmYPuTd88h5i1tL5ajM+JhZQ43gUAxztFY/YtLUbbDll
	UzH6wB7UjZqDgA0u8cx648zqdQPpumjBuEvByxRf6VFuQy9xDCV/C4H0KlB6+52V1OUK
	ba7g==
X-Gm-Message-State: AHPjjUgJ1jmY+j6CJLnIhMOG/xtj7N0eC8M1ACYUh2H8bazhtfWEuglZ
	4TnbXaBEpBNpcqE+Yfh9xH+gx/3U73ZLIaiKlH0=
X-Google-Smtp-Source: AOwi7QA+ePvP7yOg5PPnD/9FLgLgc/XAIRNCcDcRaXt6sOp0eClGhaqArZtq6K2wur7a29/LQUelQRaX58miuSV4+rc=
X-Received: by 10.223.157.142 with SMTP id p14mr15435458wre.104.1507017367580; 
	Tue, 03 Oct 2017 00:56:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 3 Oct 2017 00:56:06 -0700 (PDT)
In-Reply-To: <CA+chaQch17Fsivf7RYthxa-yFtpu6neGCUOFc1i1i+L-3_mPCQ@mail.gmail.com>
References: <1500946223-25865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C60E31BBC6@G08CNEXMBPEKD03.g08.fujitsu.local>
	<CA+chaQd2cADxXOpPJX3NDEY3w15oTwJKKGpx8SpA6TmB-2A5BA@mail.gmail.com>
	<20171002215123.GD16828@denix.org>
	<CA+chaQch17Fsivf7RYthxa-yFtpu6neGCUOFc1i1i+L-3_mPCQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Oct 2017 09:56:06 +0200
Message-ID: <CA+chaQeLcK8m8E9uV2BLVYHP3cx4p3HWjZPuQeMoJA5KTTqKzA@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Oct 2017 07:56:07 -0000
Content-Type: text/plain; charset="UTF-8"

additional fix from Khem:
https://github.com/meta-qt5/meta-qt5/commit/904296915495f7f606f5a07cb444d76903093ca0
and disabled gold by me to resolve the issue mentioned above:
https://github.com/meta-qt5/meta-qt5/commit/648f7b0a2eb202d4378ce50ae566b6ca450dd010

On Tue, Oct 3, 2017 at 9:53 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> IIRC It was merged as is with additional fix from Khem on top of that to
> resolve this build issue.
>
> On Mon, Oct 2, 2017 at 11:51 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
>
>> Was this actually merged to master as is?
>>
>>
>> On Tue, Aug 15, 2017 at 11:22:20AM +0200, Martin Jansa wrote:
>> > pong,
>> >
>> > it's failing to build as reported by me and Khem, so it won't get
>> merged in
>> > this form.
>> >
>> > http://lists.openembedded.org/pipermail/openembedded-devel/2
>> 017-August/114108.html
>> >
>> > On Tue, Aug 15, 2017 at 3:21 AM, Huang, Qiyu <
>> huangqy.fnst@cn.fujitsu.com>
>> > wrote:
>> >
>> > > ping
>> > >
>> > > > -----Original Message-----
>> > > > From: Huang, Qiyu
>> > > > Sent: Tuesday, July 25, 2017 9:30 AM
>> > > > To: openembedded-devel@lists.openembedded.org
>> > > > Cc: Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
>> > > > Subject: [oe] [meta-qt5] [PATCH v2] qtbase: add ptest
>> > > >
>> > > > Add ptest for qtbase by using provided testsuite.
>> > > >
>> > > > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> > > > ---
>> > > >  .../0001-Delete-qlonglong-and-qulonglong.patch     | 28
>> > > > ++++++++++++++++++++++
>> > > >  recipes-qt/qt5/qtbase/run-ptest                    |  6 +++++
>> > > >  recipes-qt/qt5/qtbase_git.bb                       | 17
>> ++++++++++++-
>> > > >  3 files changed, 50 insertions(+), 1 deletion(-)  create mode
>> 100644
>> > > > recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
>> > > >  create mode 100644 recipes-qt/qt5/qtbase/run-ptest
>> > > >
>> > > > diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-
>> > > qulonglong.patch
>> > > > b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
>> > > > new file mode 100644
>> > > > index 0000000..975cd28
>> > > > --- /dev/null
>> > > > +++ b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong
>> .patch
>> > > > @@ -0,0 +1,28 @@
>> > > > +From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00
>> > > > 2001
>> > > > +From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> > > > +Date: Wed, 7 Jun 2017 21:00:49 +0900
>> > > > +Subject: [PATCH] Delete qlonglong and qulonglong
>> > > > +
>> > > > +Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> > > > +---
>> > > > + tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro | 2
>> --
>> > > > + 1 file changed, 2 deletions(-)
>> > > > +
>> > > > +diff --git
>> > > > +a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
>> > > > +b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
>> > > > +index 09458bd..59a120e 100644
>> > > > +--- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
>> > > > ++++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
>> > > > +@@ -5,10 +5,8 @@ SUBDIRS=\
>> > > > +     char32_t \
>> > > > +     int \
>> > > > +     long \
>> > > > +-    qlonglong \
>> > > > +     qptrdiff \
>> > > > +     quintptr \
>> > > > +-    qulonglong \
>> > > > +     schar \
>> > > > +     short \
>> > > > +     uchar \
>> > > > +--
>> > > > +2.7.4
>> > > > +
>> > > > diff --git a/recipes-qt/qt5/qtbase/run-ptest
>> > > b/recipes-qt/qt5/qtbase/run-ptest
>> > > > new file mode 100644 index 0000000..044f834
>> > > > --- /dev/null
>> > > > +++ b/recipes-qt/qt5/qtbase/run-ptest
>> > > > @@ -0,0 +1,6 @@
>> > > > +#!/bin/sh
>> > > > +
>> > > > +for x in ` awk '{print $1}' tst_list `;do
>> > > > +    ./${x};
>> > > > +done
>> > > > +
>> > > > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/
>> qtbase_git.bb
>> > > index
>> > > > 5cfbcfa..8464873 100644
>> > > > --- a/recipes-qt/qt5/qtbase_git.bb
>> > > > +++ b/recipes-qt/qt5/qtbase_git.bb
>> > > > @@ -23,8 +23,12 @@ SRC_URI += "\
>> > > >      file://0005-configure-bump-path-length-from-256-to-512-
>> > > character.patch
>> > > > \
>> > > >      file://0009-Disable-all-unknown-features-instead-of-erroring
>> -out.patch
>> > > \
>> > > >
>> > > > file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERN
>> AL_H.patch
>> > > > \
>> > > > +    file://0001-Delete-qlonglong-and-qulonglong.patch \
>> > > > +    file://run-ptest \
>> > > >  "
>> > > >
>> > > > +inherit ptest
>> > > > +
>> > > >  # only for target qtbase
>> > > >  SRC_URI += "\
>> > > >      file://0008-configure-paths-for-target-qmake-properly.patch \
>> @@
>> > > -48,7
>> > > > +52,7 @@ PACKAGECONFIG_DISTRO ?= ""
>> > > >  PACKAGECONFIG_RELEASE ?= "release"
>> > > >  # This is in qt5.inc, because qtwebkit-examples are using it to
>> enable
>> > > > ca-certificates dependency  # PACKAGECONFIG_OPENSSL ?= "openssl"
>> > > > -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs
>> freetype"
>> > > > +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs
>> freetype
>> > > > tests"
>> > > >
>> > > >  PACKAGECONFIG ?= " \
>> > > >      ${PACKAGECONFIG_RELEASE} \
>> > > > @@ -171,6 +175,17 @@ do_configure() {
>> > > >          ${QT_CONFIG_FLAGS}
>> > > >  }
>> > > >
>> > > > +fakeroot do_install_ptest() {
>> > > > +    mkdir -p ${D}${PTEST_PATH}
>> > > > +    t=${D}${PTEST_PATH}
>> > > > +    for var in ` find ${B}/tests/auto/ -name tst_*`; do
>> > > > +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
>> > > > +            echo ${var##*/} >> ${t}/tst_list
>> > > > +            install -m 0644 ${var} ${t}
>> > > > +        fi
>> > > > +    done
>> > > > +}
>> > > > +
>> > > >  do_install_append() {
>> > > >      # Avoid qmake error "Cannot read
>> > > > [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or
>> > > directory"
>> > > >      touch
>> > > > ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
>> > > > --
>> > > > 2.7.4
>> > >
>> > >
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

