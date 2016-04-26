Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 922CF6E666
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:37:20 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id u64so5152579lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Zh2JepJWzwHqLmSd2+stsvf9xo5iYeEdfx5z8oEqH3Q=;
	b=p3Bqe+dHi8CMs/Oj6ItNOB8skPz92dJOLt18jqecA0RpqJA75ZjKKHt/GRFjMIPmgN
	zvw3zaWhTyziX/KLSVrgpax2NvER/MdJZ+RbUgivZTMgqTYnMHnF6H5xfVsJZ4U3fL6D
	kk4BsYTIcn3NloJmnTWbPIEDSr9EpnyoZRgrTmc/C6gQ5fqiMeBl2yn15Jxx8BIVKBRr
	2o7W3vvvHxfIt/so6x+odYxMqGoQhJaErNgt+1B6zfMTYExYHB3wRP536T4nw7jZKZXl
	N5nyPTkw8JlxGd9v7wiqmYocvZadEuDjbvOBs2tmx2OZUrK9BLh4bjw4GhUiiYXShGpS
	67IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Zh2JepJWzwHqLmSd2+stsvf9xo5iYeEdfx5z8oEqH3Q=;
	b=a0y/E5e6j4rn6vntMhlLpHBloviWVgcEeRibPGCgoycCwjGxnX6w0R/GA36PuOJSx2
	KMoNg1JOSt5j64gw7lZamNzbskxdrLK6NFRBHsB4Yp3s2/zAt8EPtEVGHCKgbojpCk9Y
	fyT/Sl/Q9T+2C62laLr8Pzb4FupPtUSxEjNBGkQvX/gj4WoB/ByGcd7YK2qchAJGDFbp
	+Feai3uqPirJwDVG3OcgOqBlHgOCFFRyJrUVGNNq/76VDlce0v9cr2N0Cg+ZmJnWSWwO
	FU3iQZsXGATFZLfuQCIHk6vH5XWxxLAZv3uN/2WOycrdZ5vaMCEivzvxv47XbuuuzjWs
	3NtA==
X-Gm-Message-State: AOPr4FVD1dTL4TPwFELnO3Mdxq0YMwyevxlMGE+3y5PmRJxCgnkdPyMBqqlseuvJXRH68DR4lmsk4QX2hc28Cw==
MIME-Version: 1.0
X-Received: by 10.112.22.131 with SMTP id d3mr481650lbf.145.1461652639754;
	Mon, 25 Apr 2016 23:37:19 -0700 (PDT)
Received: by 10.112.180.229 with HTTP; Mon, 25 Apr 2016 23:37:19 -0700 (PDT)
In-Reply-To: <20160425214326.GA31113@denix.org>
References: <1459471643-7183-1-git-send-email-denis@denix.org>
	<20160420182710.GN16135@denix.org>
	<20160425180750.GW16135@denix.org>
	<CA+chaQeA63zpMf02NYbDrxZgXdSbx2=T3=nZGmxk4h8XxOx+Xg@mail.gmail.com>
	<20160425214326.GA31113@denix.org>
Date: Tue, 26 Apr 2016 08:37:19 +0200
Message-ID: <CA+chaQduVd3gEmHO1D9YSzid0F6Lm-Mrv+Yh2rW0a=f5fQWKFQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 1/2] qtdeclarative: fix compilation of examples/qquickviewcomparison
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
X-List-Received-Date: Tue, 26 Apr 2016 06:37:23 -0000
Content-Type: text/plain; charset=UTF-8

The strange part is that examples built fine here with current master
(5.5.99/5.6-beta)
without your patches.

On Mon, Apr 25, 2016 at 11:43 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Apr 25, 2016 at 11:24:42PM +0200, Martin Jansa wrote:
> > I was testing if this is still needed with latest 5.6 currently in
> > jansa/master. Or if I can just drop this again when upgrading to newer
> > revisions.
> >
> > Did you see this issue only with 5.6 revisions currently in master or
> with
> > 5.6 revisions sent by Andreas which are now in master-next and where even
> > qtbase examples fail to build in default setup as reported in separate
> > e-mail?
> >
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/107077.html
>
> Sorry, I haven't had a chance to try master-next yet. Those patches are
> needed
> for 5.5.99/5.6-beta from current master.
>
> If you merge 5.6 into master any time soon, I would definitely prefer for
> examples to work there. BTW, I can't believe examples are so broken in Qt,
> even in the official 5.6 release, based on your other email... So, if you
> want
> master/krogoth to be 5.6 release, we'd have to backport example fixes from
> post-5.6 revs, which I would be glad to help with...
>
> --
> Denys
>
>
> > On Mon, Apr 25, 2016 at 8:07 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> >
> > > Martin,
> > >
> > > Any comments?
> > >
> > >
> > > On Wed, Apr 20, 2016 at 02:27:10PM -0400, Denys Dmytriyenko wrote:
> > > > Ping. These 2 have been sitting in master-next as well for quite some
> > > time.
> > > > Any updates?
> > > >
> > > >
> > > > On Thu, Mar 31, 2016 at 08:47:22PM -0400, Denys Dmytriyenko wrote:
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > >
> > >
> git/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.cpp:180:14:
> > > error: 'QCoreApplication' has not been declared
> > > > >           if
> > >
> (!QCoreApplication::arguments().contains(QStringLiteral("--no_render_alpha")))
> > > > >
> > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > ---
> > > > >  ...omparison-fix-QCoreApplication-has-not-be.patch | 28
> > > ++++++++++++++++++++++
> > > > >  recipes-qt/qt5/qtdeclarative_git.bb                |  1 +
> > > > >  2 files changed, 29 insertions(+)
> > > > >  create mode 100644
> > >
> recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > > >
> > > > > diff --git
> > >
> a/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > >
> b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > > > new file mode 100644
> > > > > index 0000000..1687fbe
> > > > > --- /dev/null
> > > > > +++
> > >
> b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > > > @@ -0,0 +1,28 @@
> > > > > +From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00
> 2001
> > > > > +From: Denys Dmytriyenko <denys@ti.com>
> > > > > +Date: Thu, 31 Mar 2016 19:38:58 -0400
> > > > > +Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has
> not
> > > been
> > > > > + declared error
> > > > > +
> > > > > +Upstream-Status: Pending
> > > > > +
> > > > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > +---
> > > > > + examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h |
> 1 +
> > > > > + 1 file changed, 1 insertion(+)
> > > > > +
> > > > > +diff --git
> > > a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > > > +index 5b86c93..e77514e 100644
> > > > > +---
> a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > > > ++++
> b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > > > +@@ -44,6 +44,7 @@
> > > > > + #include <QWidget>
> > > > > + #include <QQuickWidget>
> > > > > + #include <QQuickView>
> > > > > ++#include <QCoreApplication>
> > > > > +
> > > > > + QT_FORWARD_DECLARE_CLASS(QRadioButton)
> > > > > + QT_FORWARD_DECLARE_CLASS(QCheckBox)
> > > > > +--
> > > > > +2.2.0
> > > > > +
> > > > > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> > > qtdeclarative_git.bb
> > > > > index 93442fb..9274d00 100644
> > > > > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > > > > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > > > > @@ -15,6 +15,7 @@ DEPENDS += "qtbase"
> > > > >
> > > > >  SRC_URI += " \
> > > > >      file://0001-qmltestexample-fix-link.patch \
> > > > > +
> > > file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> \
> > > > >  "
> > > > >
> > > > >  EXTRA_OEMAKE +=
> > > "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
> > > > > --
> > > > > 2.2.0
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

