Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.4947.1585253175722427287
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 13:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j38EOFLM;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id j69so6626753ila.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ueMKA+DtKOT5gjrAd1r7hagk4Nk4/NmDUMhjq1KEn7Y=;
        b=j38EOFLMo9gzexaQFPHYLmahYJNV20y/8QKHz4t4gpfqssv7Wdj0MchX7hjn1bb9xn
         dSFqVvWjMEC9k4FMl1UOz2up/qsB4Ytc/WANmBr+ea5UJvQWZ0s+bNoPmJTfTJrj5Wc9
         ixlvzham4oKtST9YLO8FBB+ZDT3BAaQ+rnMdSxHOL5pOJV0wOcKFNnvaukcLAXfr27C1
         Ww85gmR4HMiIKmK2502ZvG9gRTl2xZ3PdWkrKd2JvtWPHwX/P8i22VEpx9VZJRVaNtHC
         fF2LBs/ZpUJqdRh+SEiLkOuB4e5Z9I1OVFkG30/aw3aUSIkRfA5dHe36yM6E4gDcfKCi
         IDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ueMKA+DtKOT5gjrAd1r7hagk4Nk4/NmDUMhjq1KEn7Y=;
        b=jCtyDnyVgCAAczD01mGeIWnOhLNKVbKHkLKprKpRLPyK6Zr2pnM50tE16qbdavMem8
         wGy8t4QeqM17jjq0cspmI6qTAsgbF8YCC+6ogqqB+uciH6X6fj19yYtWfq4H2oseLMSM
         XeKh66iTi7hPmL9sJsbC3cyg6e3u4vvMWkAX8XYJv6gD7YVsugHNTubH/3R25HPmAc7k
         hgZ7z5cICR7KRCSJhhCyRWJpjE53h2MGOMf2giej8qHxvZL77Z1GXjNaV9GdNEPhrBwK
         9sz67uPNwqItCB0XNBia/w+U3ouZtzmz8feU1ZUjt3drsZs2Unc6KNwR6GJ0L+NUB4Sp
         m1WA==
X-Gm-Message-State: ANhLgQ3laoFKz/jG9fxlRmMN/QxLvBUiRdIpXFiIJDpCATS2MHY+gVAz
	qxI7sRUOx7lTgWfuQpunsb8JbWE+WgvbfjZq1XA=
X-Google-Smtp-Source: ADFU+vv8x5wiwPkIxd3lI3gwsAX94pvlzWXw3CiQ8KoDu5wbg6fccsIF97GlgWHd/DuCG0Xfw3ARCOkq6ZnHVkiHJns=
X-Received: by 2002:a92:3c04:: with SMTP id j4mr10853723ila.108.1585253175041;
 Thu, 26 Mar 2020 13:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200326000257.GF1578@denix.org> <20200326005529.c77siajyzfgxdc4a@jama>
 <20200326170721.GH1578@denix.org> <20200326193418.fiehd5wti6gd7yfw@jama>
In-Reply-To: <20200326193418.fiehd5wti6gd7yfw@jama>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Thu, 26 Mar 2020 21:06:03 +0100
Message-ID: <CALbNGRQV1Q=hCTJWXLknJLacgKX6LAyvAg6bt9hCzC5CQhZXAA@mail.gmail.com>
Subject: Re: [oe] [meta-qt5] qtwebkit 5.15 update failure
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 8:34 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> On Thu, Mar 26, 2020 at 01:07:21PM -0400, Denys Dmytriyenko wrote:
> > On Thu, Mar 26, 2020 at 01:55:29AM +0100, Martin Jansa wrote:
> > > On Wed, Mar 25, 2020 at 08:02:57PM -0400, Denys Dmytriyenko wrote:
> > > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:116: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacast(char const*)'
> > > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:121: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacall(QMetaObject::Call, int, void**)'
> > > > | Source/WebKit/CMakeFiles/WebKitWidgets.dir/WebKitWidgets_autogen/mocs_compilation.cpp.o:mocs_compilation.cpp:WebKit::DefaultFullScreenVideoHandler::staticMetaObject: error: undefined reference to 'QWebFullScreenVideoHandler::staticMetaObject'
> > > > | /usr/src/debug/qtwebkit/5.14.99+gitAUTOINC+ab1bd15209-r0.arago8/git/Source/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.cpp:45: error: undefined reference to 'vtable for QWebFullScreenVideoHandler'
> > > >
> > > > FWIW, it was building just fine before the update...
> > >
> > > If you care about qtwebkit, then please send patches for this.
> >
> > On the other hand - if you don't care about qtwebkit, why would you update it
> > from a working version to a broken one?
>
> I didn't update qtwebkit.
>
> qtwebkit isn't part of regular Qt upgrades since 5.9, I've already
> removed it a while ago and then restored it based on Andreas's request,
> see last few commits:
>
> c8cd55b0 qtwebkit: build with python3
> 23914740 Revert "qtwebkit: remove"
> a35403dc qtwebkit: remove
> a797f85c python-pyqt5, qtwebengine, qtwebkit, qt-kiosk-browser: skip without meta-python2
> b1f4f1fd Revert "recipes: Use python3 during build"
> 47fb26de recipes: Use python3 during build
>
> I have not intention to support it myself, either send patches or maybe
> Andreas will do.
>
> > The issue is that with the upcoming 3.1 LTS around the corner, many of us are
> > trying to finalize and stabilize our own code bases in master. I was very
> > close to resolving most of the breakages for my builds just couple days ago,
> > and now I got few more unexpected failures from meta-qt5...
>
> Yes, that's why there is dunfell branch as mentioned in the PR, see:
> https://github.com/meta-qt5/meta-qt5/pull/294
Since KDE (meta-qt5-extra) still requires it I have to take care - but
cannot say when I am tough enough for after dunfell adventures...

Andreas
