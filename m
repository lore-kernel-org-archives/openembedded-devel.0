Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steven.w.warren@gmail.com>) id 1UTH2d-0003BW-Hu
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 21:32:22 +0200
Received: by mail-lb0-f177.google.com with SMTP id r10so3983294lbi.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=5p8RZLMFzuiJug5dJ1q0vq6/HbDbKCni3EYjZoU2x2Y=;
	b=WUXVuNj3X1bhvm5hDHt/A33AyfHE1bpUJfuwVuyz4qfTyxLkVkoQDedCuCowaArlJx
	hNxSMOUaKDLevg8F8oDWo/ojV+aPlDloNnegHAGQaVsV433uyikj61UaZtOwx3TcB/rS
	mxzQVfYUqiCNSoj3+OwYmDRejVDFgD+OzsJViC7m9TwzUbFLUqM34bp4n0TU7H5MAFdI
	bXe1pBTXjxD0Weuq82kB8xN5vxFIEpPOW7GpXiNEguQu5rM8P+180MOP3KLHkM1Cpn2L
	/62B1XnHYVDgpgX52BfpVz0mdo38HoFM1MsmJ0m5ejLXFGd/HPveozpLecBclojuhePr
	X7Kw==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr8631269lbb.26.1366398880507;
	Fri, 19 Apr 2013 12:14:40 -0700 (PDT)
Received: by 10.112.199.69 with HTTP; Fri, 19 Apr 2013 12:14:40 -0700 (PDT)
In-Reply-To: <1488847.vh4yAelbek@helios>
References: <1366376983-26493-1-git-send-email-steven.w.warren@gmail.com>
	<1488847.vh4yAelbek@helios>
Date: Fri, 19 Apr 2013 14:14:40 -0500
Message-ID: <CAFzuKnxbJoQYZ_mBhUr633W41uHFvX95+FAv0pHdU4d=WCJUaQ@mail.gmail.com>
From: "wayne, steve" <steven.w.warren@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qtserialport: Adds initial recipe.
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
X-List-Received-Date: Fri, 19 Apr 2013 19:33:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Paul,

Thanks much for the feedback, I have made the changes you suggest with the
exception of the changes to do_compile_append().

I did try setting "Prefix" in qt.conf yesterday to no effect, but as it
turns out qmake2 uses the qt.conf either in /qt/etc/qt.conf or in the same
directory as it for this binary (I verified this with strace). I read a
suggestion on stackoverflow that says to symlink the qt.conf into the bin
directory--in this case ${STAGING_BINDIR_NATIVE}--but that seems like it
could lead to parallel build problems since it could inject Prefix values
into qmake2 during concurrent build of another qt project.

Something else I tried was "qmake2 -set QT_INSTALL_PREFIX ${D}" in
do_configure_prepend() and "qmake2 -unset QT_INSTALL_PREFIX" in
do_compile_append() which did not work. Anyway, this might be just as bad
as symlinking qt.conf into ${STAGING_BINDIR_NATIVE} in terms of the effect
it would have on parallel builds.

So right now I am trying to symlink the qmake2 binary into ${WORKDIR} and
use that during the build.

wayne


On Fri, Apr 19, 2013 at 8:56 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Wayne,
>
> Some of this feedback is a little bit pedantic I'm afraid, but it's
> probably
> best to get everything right.
>
> On Friday 19 April 2013 08:09:43 Wayne Warren wrote:
> > ---
>
> Please include Signed-off-by.
>
> >  meta-oe/recipes-qt/qtserialport/qtserialport.inc   |   34
> > ++++++++++++++++++++ .../recipes-qt/qtserialport/qtserialport_5.1.0.bb |
> >  6 ++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport.inc
> >  create mode 100644 meta-oe/recipes-qt/qtserialport/
> qtserialport_5.1.0.bb
> >
> > diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport.inc
> > b/meta-oe/recipes-qt/qtserialport/qtserialport.inc new file mode 100644
> > index 0000000..09f2f9a
> > --- /dev/null
> > +++ b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
> > @@ -0,0 +1,34 @@
> > +DESCRIPTION = "Qt Serial Port Library"
>
> Would you mind using SUMMARY instead of DESCRIPTION here? (DESCRIPTION
> will be
> set from SUMMARY as well).
>
> > +SECTION = "qt/libs"
> > +HOMEPAGE = "http://qt-project.org/wiki/QtSerialPort"
> > +
> > +LICENSE = "LGPL FDL GPL "
>
> I'm not 100% sure, but I think for this particular piece of software, this
> should actually be "(LGPL-2.1 | GPL-3.0) & GFDL-1.3"
>
> > +LIC_FILES_CHKSUM = " \
> > +    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
> > +    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
> > +    file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
> > +    "
> > +
> > +inherit qt4e pkgconfig
>
> If this is to be built against Qt Embedded, the recipe should be named
> qtserialport-e; in fact I'd suggest replacing this with just "inherit
> pkgconfig" and then adding "inherit qt4e" to the .bb file and then it
> would be
> possible for someone else to create a qtserialport-x11 recipe that used the
> same inc file.
>
> > +SRC_URI = " \
> > +    git://gitorious.org/qt/qtserialport.git \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/${BPN}-${PV}"
> > +
> > +QMAKE_PROFILES="${S}/qtserialport.pro"
> > +EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
>
> I think this should be ${prefix} rather than hardcoding /usr.
>
> > +EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
> > +
> > +do_compile_append() {
> > +     BOGUS_PREFIX=`qmake2 -query QT_INSTALL_PREFIX`
> > +     for f in `find ${B} -name "Makefile"` ;do
> > +             sed -i -e
> "s|\(\$(INSTALL_ROOT)\)${BOGUS_PREFIX}|\1${prefix}|g" ${f}
> > +     done
> > +}
>
> It seems a bit extreme to me that this should be necessary; googling
> suggests
> that qt.conf is supposed to be used to override QT_INSTALL_PREFIX. My
> build is
> still running so I haven't been able to check if this can work yet or if
> there's an alternative method but I'll let you know.
>
> > +
> > +do_install() {
> > +    oe_runmake install DESTDIR=${D} INCLUDEDIR=${includedir}
> > +}
> > diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
> > b/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb new file mode
> > 100644
> > index 0000000..d903eb3
> > --- /dev/null
> > +++ b/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
> > @@ -0,0 +1,6 @@
> > +require qtserialport.inc
> > +
> > +PR = "r0"
>
> This doesn't need to be set this since it's the default value (and we're no
> longer incrementing this value manually).
>
> > +
> > +SRCREV="22e45f0b0f956c025339d72ad53dca57ef684858"
> > +
>
> This is really pedantic, but we usually prefer spaces around the assignment
> (as you have elsewhere.)
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Sourcewill

