Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 64253700EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 18:07:50 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6700EPJBP3HV10@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	25 Apr 2016 13:07:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=VIE5NLbcgHM51opIV0kA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 36a3803c; Mon, 25 Apr 2016 18:07:51 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DC5CD161FC8; Mon,
	25 Apr 2016 14:07:50 -0400 (EDT)
Date: Mon, 25 Apr 2016 14:07:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160425180750.GW16135@denix.org>
References: <1459471643-7183-1-git-send-email-denis@denix.org>
	<20160420182710.GN16135@denix.org>
MIME-version: 1.0
In-reply-to: <20160420182710.GN16135@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 25 Apr 2016 18:07:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Martin,

Any comments?


On Wed, Apr 20, 2016 at 02:27:10PM -0400, Denys Dmytriyenko wrote:
> Ping. These 2 have been sitting in master-next as well for quite some time. 
> Any updates?
> 
> 
> On Thu, Mar 31, 2016 at 08:47:22PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > git/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.cpp:180:14: error: 'QCoreApplication' has not been declared
> >           if (!QCoreApplication::arguments().contains(QStringLiteral("--no_render_alpha")))
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  ...omparison-fix-QCoreApplication-has-not-be.patch | 28 ++++++++++++++++++++++
> >  recipes-qt/qt5/qtdeclarative_git.bb                |  1 +
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > 
> > diff --git a/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > new file mode 100644
> > index 0000000..1687fbe
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > @@ -0,0 +1,28 @@
> > +From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00 2001
> > +From: Denys Dmytriyenko <denys@ti.com>
> > +Date: Thu, 31 Mar 2016 19:38:58 -0400
> > +Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
> > + declared error
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > +---
> > + examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > +index 5b86c93..e77514e 100644
> > +--- a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > ++++ b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > +@@ -44,6 +44,7 @@
> > + #include <QWidget>
> > + #include <QQuickWidget>
> > + #include <QQuickView>
> > ++#include <QCoreApplication>
> > + 
> > + QT_FORWARD_DECLARE_CLASS(QRadioButton)
> > + QT_FORWARD_DECLARE_CLASS(QCheckBox)
> > +-- 
> > +2.2.0
> > +
> > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
> > index 93442fb..9274d00 100644
> > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > @@ -15,6 +15,7 @@ DEPENDS += "qtbase"
> >  
> >  SRC_URI += " \
> >      file://0001-qmltestexample-fix-link.patch \
> > +    file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
> >  "
> >  
> >  EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
> > -- 
> > 2.2.0
> > 
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

