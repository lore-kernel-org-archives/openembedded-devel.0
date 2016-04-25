Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 392386E666
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 21:24:42 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c126so126445030lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=DBlAc38lKW579onn5RiCFGxqiCD5D5Hd258gbMQcQVc=;
	b=nnJG9A8Y4/80RpdSoWttNSvRFC18LtfKOfHTC/LSzSQBp3ql2JY7I6NYmvnJfcpkFu
	+cpOmm6YEGKK7gfKNquv6QUyFvIfzE5o/y6JbBFH5PPPTp98z70WLOt1CVC0lcG60lzm
	Q/wWu/v1FYc0ODRFmmrgey7KWVr1qNyIaLxzTnilgG7tDw/NhSKTUkkKWOogBt5XzHMo
	RxKpyRdPbePbmBvjdwH+Ew0kJ38nh6/O80q2hx5g0BPJQdtt2QbbU8DKvZ9nKhQ0jNrd
	VFPtrKC0xUryLKboQ8hNIM6aG4tXAbr1ITkNTvvmHQR+bG1Xv0PWRMAI6S95OS3/J+C8
	5QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=DBlAc38lKW579onn5RiCFGxqiCD5D5Hd258gbMQcQVc=;
	b=c1imhE/NuunKVUm74KQpib49mtgn5mSy1hQ+Us07K8kkMP0WmiuJ9ywnn0BtbQjCYQ
	uyvYY2bhqRzhH3k5OISboJwaZCEbygIiLc9y42qpZ1Jz85MFu1cimsNYTlUbauJQaiRv
	VAz7JtAbfJdTXZZPGSLVizE9hkaLUIonFUKR6A//EPnhPETWq5TAk/HAjvtx06kEjTdA
	U7Km+UrPtKaosm1U7kpinxgfh7tUWJAk7L9HsoPQsGQZY1tKFdFpzkSfXzkpwt3ehpAB
	EncvXy5L6YdnkjhVop0dbzB9mXrt+pE91AtyQtm7dz8O+1OU2YNBCKzryC76iuLK95uk
	IkaA==
X-Gm-Message-State: AOPr4FUMvjTg8y9QpnCs7c0l4NZXTULzBSSGVJAT68ZvsGfts04EDGxJtqgfuxcEMZSjXtAAz0SXPF3u+UVi9A==
MIME-Version: 1.0
X-Received: by 10.25.153.69 with SMTP id b66mr2242407lfe.138.1461619482435;
	Mon, 25 Apr 2016 14:24:42 -0700 (PDT)
Received: by 10.112.180.229 with HTTP; Mon, 25 Apr 2016 14:24:42 -0700 (PDT)
In-Reply-To: <20160425180750.GW16135@denix.org>
References: <1459471643-7183-1-git-send-email-denis@denix.org>
	<20160420182710.GN16135@denix.org>
	<20160425180750.GW16135@denix.org>
Date: Mon, 25 Apr 2016 23:24:42 +0200
Message-ID: <CA+chaQeA63zpMf02NYbDrxZgXdSbx2=T3=nZGmxk4h8XxOx+Xg@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Apr 2016 21:24:43 -0000
Content-Type: text/plain; charset=UTF-8

I was testing if this is still needed with latest 5.6 currently in
jansa/master. Or if I can just drop this again when upgrading to newer
revisions.

Did you see this issue only with 5.6 revisions currently in master or with
5.6 revisions sent by Andreas which are now in master-next and where even
qtbase examples fail to build in default setup as reported in separate
e-mail?
http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/107077.html

On Mon, Apr 25, 2016 at 8:07 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Martin,
>
> Any comments?
>
>
> On Wed, Apr 20, 2016 at 02:27:10PM -0400, Denys Dmytriyenko wrote:
> > Ping. These 2 have been sitting in master-next as well for quite some
> time.
> > Any updates?
> >
> >
> > On Thu, Mar 31, 2016 at 08:47:22PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >
> git/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.cpp:180:14:
> error: 'QCoreApplication' has not been declared
> > >           if
> (!QCoreApplication::arguments().contains(QStringLiteral("--no_render_alpha")))
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  ...omparison-fix-QCoreApplication-has-not-be.patch | 28
> ++++++++++++++++++++++
> > >  recipes-qt/qt5/qtdeclarative_git.bb                |  1 +
> > >  2 files changed, 29 insertions(+)
> > >  create mode 100644
> recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > >
> > > diff --git
> a/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > new file mode 100644
> > > index 0000000..1687fbe
> > > --- /dev/null
> > > +++
> b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
> > > @@ -0,0 +1,28 @@
> > > +From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00 2001
> > > +From: Denys Dmytriyenko <denys@ti.com>
> > > +Date: Thu, 31 Mar 2016 19:38:58 -0400
> > > +Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not
> been
> > > + declared error
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > +---
> > > + examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h | 1 +
> > > + 1 file changed, 1 insertion(+)
> > > +
> > > +diff --git
> a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > +index 5b86c93..e77514e 100644
> > > +--- a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > ++++ b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
> > > +@@ -44,6 +44,7 @@
> > > + #include <QWidget>
> > > + #include <QQuickWidget>
> > > + #include <QQuickView>
> > > ++#include <QCoreApplication>
> > > +
> > > + QT_FORWARD_DECLARE_CLASS(QRadioButton)
> > > + QT_FORWARD_DECLARE_CLASS(QCheckBox)
> > > +--
> > > +2.2.0
> > > +
> > > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> qtdeclarative_git.bb
> > > index 93442fb..9274d00 100644
> > > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > > @@ -15,6 +15,7 @@ DEPENDS += "qtbase"
> > >
> > >  SRC_URI += " \
> > >      file://0001-qmltestexample-fix-link.patch \
> > > +
> file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
> > >  "
> > >
> > >  EXTRA_OEMAKE +=
> "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
> > > --
> > > 2.2.0
> > >
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
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

