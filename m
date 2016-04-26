Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 9A20770022
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 15:30:26 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6800D9TZ2QEX70@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	26 Apr 2016 10:30:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=0gcC27t9AAAA:8 a=Q4-j1AaZAAAA:8
	a=sozttTNsAAAA:8 a=ox_5BdOvowhNDC-RjuMA:9	a=CjuIK1q_8ugA:10
	a=GxMFnAFjGssA:10
Received: by 100.15.86.14 with SMTP id 33809c08; Tue, 26 Apr 2016 15:30:26 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CBB72161FC7; Tue,
	26 Apr 2016 11:30:25 -0400 (EDT)
Date: Tue, 26 Apr 2016 11:30:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160426153025.GH31113@denix.org>
References: <1459471643-7183-1-git-send-email-denis@denix.org>
	<20160420182710.GN16135@denix.org> <20160425180750.GW16135@denix.org>
	<CA+chaQeA63zpMf02NYbDrxZgXdSbx2=T3=nZGmxk4h8XxOx+Xg@mail.gmail.com>
	<20160425214326.GA31113@denix.org>
	<CA+chaQduVd3gEmHO1D9YSzid0F6Lm-Mrv+Yh2rW0a=f5fQWKFQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+chaQduVd3gEmHO1D9YSzid0F6Lm-Mrv+Yh2rW0a=f5fQWKFQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 26 Apr 2016 15:30:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 26, 2016 at 08:37:19AM +0200, Martin Jansa wrote:
> The strange part is that examples built fine here with current master
> (5.5.99/5.6-beta)
> without your patches.

That is strange. Can it be toolchain-related? I'm using Linaro gcc-5.3, but I 
would expect OE-built gcc-5.3 to be as strict and fail similarly on those 
undeclared or incomplete classes...


> On Mon, Apr 25, 2016 at 11:43 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > On Mon, Apr 25, 2016 at 11:24:42PM +0200, Martin Jansa wrote:
> > > I was testing if this is still needed with latest 5.6 currently in
> > > jansa/master. Or if I can just drop this again when upgrading to newer
> > > revisions.
> > >
> > > Did you see this issue only with 5.6 revisions currently in master or
> > with
> > > 5.6 revisions sent by Andreas which are now in master-next and where even
> > > qtbase examples fail to build in default setup as reported in separate
> > > e-mail?
> > >
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/107077.html
> >
> > Sorry, I haven't had a chance to try master-next yet. Those patches are
> > needed
> > for 5.5.99/5.6-beta from current master.
> >
> > If you merge 5.6 into master any time soon, I would definitely prefer for
> > examples to work there. BTW, I can't believe examples are so broken in Qt,
> > even in the official 5.6 release, based on your other email... So, if you
> > want
> > master/krogoth to be 5.6 release, we'd have to backport example fixes from
> > post-5.6 revs, which I would be glad to help with...
> >
> > --
> > Denys
> >
> >
> > > On Mon, Apr 25, 2016 at 8:07 PM, Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > >
> > > > Martin,
> > > >
> > > > Any comments?
> > > >
> > > >
> > > > On Wed, Apr 20, 2016 at 02:27:10PM -0400, Denys Dmytriyenko wrote:
> > > > > Ping. These 2 have been sitting in master-next as well for quite some
> > > > time.
> > > > > Any updates?
> > > > >
> > > > >
> > > > > On Thu, Mar 31, 2016 at 08:47:22PM -0400, Denys Dmytriyenko wrote:
> > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > >
> > > > > >
> > > >
> > git/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.cpp:180:14:
> > > > error: 'QCoreApplication' has not been declared
> > > > > >           if
> > > >
> > (!QCoreApplication::arguments().contains(QStringLiteral("--no_render_alpha")))
> > > > > >
> > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > ---
> > > > > >  ...omparison-fix-QCoreApplication-has-not-be.patch | 28
> > > > ++++++++++++++++++++++
> > > > > >  recipes-qt/qt5/qtdeclarative_git.bb                |  1 +
> > > > > >  2 files changed, 29 insertions(+)
> > > > > >  create mode 100644
> > > >
> > recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > > > >
> > > > > > diff --git
> > > >
> > a/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > >
> > b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > > > > new file mode 100644
> > > > > > index 0000000..1687fbe
> > > > > > --- /dev/null
> > > > > > +++
> > > >
> > b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > > > > @@ -0,0 +1,28 @@
> > > > > > +From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00
> > 2001
> > > > > > +From: Denys Dmytriyenko <denys@ti.com>
> > > > > > +Date: Thu, 31 Mar 2016 19:38:58 -0400
> > > > > > +Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has
> > not
> > > > been
> > > > > > + declared error
> > > > > > +
> > > > > > +Upstream-Status: Pending
> > > > > > +
> > > > > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > +---
> > > > > > + examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h |
> > 1 +
> > > > > > + 1 file changed, 1 insertion(+)
> > > > > > +
> > > > > > +diff --git
> > > > a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > > b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > > > > +index 5b86c93..e77514e 100644
> > > > > > +---
> > a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > > > > ++++
> > b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > > > > +@@ -44,6 +44,7 @@
> > > > > > + #include <QWidget>
> > > > > > + #include <QQuickWidget>
> > > > > > + #include <QQuickView>
> > > > > > ++#include <QCoreApplication>
> > > > > > +
> > > > > > + QT_FORWARD_DECLARE_CLASS(QRadioButton)
> > > > > > + QT_FORWARD_DECLARE_CLASS(QCheckBox)
> > > > > > +--
> > > > > > +2.2.0
> > > > > > +
> > > > > > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> > > > qtdeclarative_git.bb
> > > > > > index 93442fb..9274d00 100644
> > > > > > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > > > > > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > > > > > @@ -15,6 +15,7 @@ DEPENDS += "qtbase"
> > > > > >
> > > > > >  SRC_URI += " \
> > > > > >      file://0001-qmltestexample-fix-link.patch \
> > > > > > +
> > > > file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > \
> > > > > >  "
> > > > > >
> > > > > >  EXTRA_OEMAKE +=
> > > > "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
> > > > > > --
> > > > > > 2.2.0
> > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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

