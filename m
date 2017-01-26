Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 32B36731CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 18:24:51 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c7so39447905itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=fh7V0kqXWo0b5qLOpISOr/y4usIGrAPwtmDqQQZAoZw=;
	b=mTc6gYLwhcGKg77UB1SKUpuID06GM2sfe5NVsO8YPXuYHzBNJJf5Ehu61cKo5AYUPm
	xESAbvWdAlsocLPPh3QvURWw9f4FMQA6nun5g+wgEgz9250w9v7xX/g4Kf5TtjZLXYtA
	EzJd2d8G9kTjwGHJ7VhaX7+uDandY+G8ClIh0r3YfcXVz9llOZ4iFq0JhxfUJV55QF9o
	PaHqEY1oYngEQIonQgSiczHN0TuTkstfbxtNBuoeKRNZS1fmxWwvFA6+Wp3+I8daH9ig
	oNIIWuYOt0kcx7VwvOeCzsPIzsrcfjs4+/tQDc+M2wTanfgdRZSMUDECkyMoUywx8dOZ
	S3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=fh7V0kqXWo0b5qLOpISOr/y4usIGrAPwtmDqQQZAoZw=;
	b=sG3rEamusBLGOB929Ay2yQA+Zg/htMPcVyuGBX7ya0SDdTBQtBZFEZUODC7zP3b7WM
	WdiLIEBLWVBo8u7Ts831jYkQ9E/UAXYXA8c6DqcRfghO951d9PDFq4JwB59w8LD56yk6
	napnIj+vFR9muUGHwvhoaEi0YaujzTttFL3ZVdPk46pVsmx1jNs+iSnRY9G8FdZiXrFT
	nVkcCqv5vtZQx5p6PGbAxmhO9vbP2lJh4SiJ3MyB54EVmSSsXjNxYK/mHWxyQpuApL+J
	z1uArvyGy7mfFL7Bn2Hv2gGPAkyJDiPLrZ/B0xVQPaytbunEuRMy3GAmqOF1WkSOTBjW
	Yhtg==
X-Gm-Message-State: AIkVDXJ18ONMsLbU4+spXIzLhg6CM15wJ5qubuZ7/WaNxVlgxFHtvuIOGDvapSXXgWknpmE8Iwj32g0bFD930r4y
X-Received: by 10.36.123.136 with SMTP id q130mr30081776itc.25.1485455091438; 
	Thu, 26 Jan 2017 10:24:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Thu, 26 Jan 2017 10:24:31 -0800 (PST)
In-Reply-To: <20170125145422.GB3260@jama>
References: <1484134588-15143-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<20170125145422.GB3260@jama>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Thu, 26 Jan 2017 19:24:31 +0100
Message-ID: <CAKuJqM-N4+vnast8zJZGyY3kn0R1R3ThEiU8OnnVbHxoe3_Rmw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] nano: upgrade to 2.7.4
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
X-List-Received-Date: Thu, 26 Jan 2017 18:24:52 -0000
Content-Type: text/plain; charset=UTF-8

Martin -

May I ask you how it was built? I cannot reproduce this with poky 2.2 and
oe's 'master' and 'master-next' branches. The package builds perfectly
fine, without any errors or warnings.

Thanks.

On 25 January 2017 at 15:54, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Jan 11, 2017 at 12:36:28PM +0100, Oleksandr Kravchuk wrote:
> > Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>
> nano-2.7.4: nano rdepends on file, but it isn't a build dependency,
> missing file in DEPENDS or PACKAGECONFIG? [build-deps]
>
> > ---
> >  .../nano/nano-2.2.5/ncursesw.includedir.patch                | 12
> ------------
> >  meta-oe/recipes-support/nano/nano.inc                        |  6
> +++---
> >  meta-oe/recipes-support/nano/nano_2.2.5.bb                   |  8
> --------
> >  meta-oe/recipes-support/nano/nano_2.7.4.bb                   |  6
> ++++++
> >  4 files changed, 9 insertions(+), 23 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.
> includedir.patch
> >  delete mode 100644 meta-oe/recipes-support/nano/nano_2.2.5.bb
> >  create mode 100644 meta-oe/recipes-support/nano/nano_2.7.4.bb
> >
> > diff --git a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> b/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> > deleted file mode 100644
> > index 0f224be..0000000
> > --- a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -diff -uNr nano-2.2.5.orig//configure.ac nano-2.2.5/configure.ac
> > ---- nano-2.2.5.orig//configure.ac    2010-08-06 03:00:51.000000000
> +0200
> > -+++ nano-2.2.5/configure.ac  2010-08-10 14:11:52.000000000 +0200
> > -@@ -442,7 +442,7 @@
> > -     AC_CHECK_HEADERS(ncurses.h)
> > -
> > -     if test x$enable_utf8 != xno; then
> > --    AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB="-lncursesw"
> CPPFLAGS="-I/usr/include/ncursesw $CPPFLAGS" CURSES_LIB_NAME=ncursesw
> CURSES_LIB_WIDE=yes])
> > -+    AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB="-lncursesw"
> CURSES_LIB_NAME=ncursesw CURSES_LIB_WIDE=yes])
> > -     fi
> > -
> > -     if eval "test x$CURSES_LIB_NAME = x"; then
> > diff --git a/meta-oe/recipes-support/nano/nano.inc
> b/meta-oe/recipes-support/nano/nano.inc
> > index 0f31c6c..8a9f1e8 100644
> > --- a/meta-oe/recipes-support/nano/nano.inc
> > +++ b/meta-oe/recipes-support/nano/nano.inc
> > @@ -12,8 +12,8 @@ INC_PR = "r3"
> >
> >  PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).
> split('.')[1]}"
> >
> > -SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
> > +SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
> >
> > -inherit autotools gettext
> > +inherit autotools gettext pkgconfig
> >
> > -PACKAGECONFIG[tiny] = "--enable-tiny,--enable-all,"
> > +PACKAGECONFIG[tiny] = "--enable-tiny,"
> > diff --git a/meta-oe/recipes-support/nano/nano_2.2.5.bb
> b/meta-oe/recipes-support/nano/nano_2.2.5.bb
> > deleted file mode 100644
> > index e656f46..0000000
> > --- a/meta-oe/recipes-support/nano/nano_2.2.5.bb
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -include nano.inc
> > -
> > -PR = "${INC_PR}.0"
> > -
> > -SRC_URI += "file://ncursesw.includedir.patch"
> > -
> > -SRC_URI[md5sum] = "77a10a49589f975ce98350a4527a2ebf"
> > -SRC_URI[sha256sum] = "9015945d1badabbada203b37c4779d
> 3dd1066234235c714deb439989c5cd7d9e"
> > diff --git a/meta-oe/recipes-support/nano/nano_2.7.4.bb
> b/meta-oe/recipes-support/nano/nano_2.7.4.bb
> > new file mode 100644
> > index 0000000..5016f2e
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/nano/nano_2.7.4.bb
> > @@ -0,0 +1,6 @@
> > +include nano.inc
> > +
> > +PR = "${INC_PR}.0"
> > +
> > +SRC_URI[md5sum] = "c011c7f9e47cb1da27d4e7cc8b56ec6a"
> > +SRC_URI[sha256sum] = "752170643039e2c95a433de357f0c7
> 0a8c4c4c561a90a7e7259a63e225b659b9"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Yes, this is my signature

