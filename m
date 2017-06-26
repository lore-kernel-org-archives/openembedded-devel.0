Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6220477E9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5833420BA9;
	Mon, 26 Jun 2017 15:52:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WYAndsoDZKo9; Mon, 26 Jun 2017 15:52:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3523D207AF;
	Mon, 26 Jun 2017 15:52:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A2F76162514; Mon, 26 Jun 2017 11:52:56 -0400 (EDT)
Date: Mon, 26 Jun 2017 11:52:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ming Liu <liu.ming50@gmail.com>
Message-ID: <20170626155256.GG28053@denix.org>
References: <1497932912-30016-1-git-send-email-liu.ming50@gmail.com>
	<20170622191849.GS28053@denix.org>
	<20170623211933.GB28053@denix.org>
	<CA+chaQeXfn18+4zHth7_enazNF9hh3idLT+V7YvJLPH+5p5cQw@mail.gmail.com>
	<20170623214631.GC28053@denix.org>
	<CALatG=7jn597sL8XE2hk8X67smJTH84HPe+wsYzwHC1HNHh9cA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALatG=7jn597sL8XE2hk8X67smJTH84HPe+wsYzwHC1HNHh9cA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] [PATCH] qttools: DEPENDS on icu
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
X-List-Received-Date: Mon, 26 Jun 2017 15:52:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I believe this was meant to be sent to the list, not just me directly...

On Mon, Jun 26, 2017 at 05:00:14AM +0200, Ming Liu wrote:
> Hi,
> 
> Please revert it, I probably made a mistake, I encountered this issue in
> morty branch, then I checked the qttools-5.7 source, and found there is
> code referring ICU, so I thought the issue is also impacting the upstream,
> which it seems is not according to Denys, sorry for the inconvenience I
> brought.
> 
> //Ming Liu
> 
> 2017-06-23 23:46 GMT+02:00 Denys Dmytriyenko <denis@denix.org>:
> 
> > Thanks.
> >
> > On Fri, Jun 23, 2017 at 11:41:05PM +0200, Martin Jansa wrote:
> > > Yes, I've seen both e-mails. I'm waiting for response from author, then
> > > I'll revert it in master and pyro branches.
> > >
> > > On Fri, Jun 23, 2017 at 11:19 PM, Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > >
> > > > Martin,
> > > >
> > > > Were you able to look into this yet? I didn't copy you directly at
> > first,
> > > > so
> > > > not sure if you missed it...
> > > >
> > > >
> > > > On Thu, Jun 22, 2017 at 03:18:49PM -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, Jun 20, 2017 at 06:28:32AM +0200, liu.ming50@gmail.com
> > wrote:
> > > > > > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> > > > > >
> > > > > > This fixes a following QA issue:
> > > > > > | QA Issue: nativesdk-qtbase-tools rdepends on
> > nativesdk-libicui18n,
> > > > but it isn't a build dependency.
> > > > > > | QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicuuc,
> > but
> > > > it isn't a build dependency.
> > > > > > | QA Issue: nativesdk-qtbase-tools rdepends on
> > nativesdk-libicudata,
> > > > but it isn't a build dependency.
> > > > >
> > > > > It seems there's inconsistency here between errors above referring to
> > > > > nativesdk-qtbase-tools and the change below made to qttools instead
> > of
> > > > > qtbase!
> > > > >
> > > > > I wonder if this fix was not included by the author:
> > > > >
> > > > > https://github.com/meta-qt5/meta-qt5/commit/
> > > > ff073f04109900fc07bf81e2f1df63c626caf342
> > > > >
> > > > > Just to double-check, I just built nativesdk-qttools using meta-qt5
> > w/o
> > > > this
> > > > > patch and I don't see the above QA errors.
> > > > >
> > > > > --
> > > > > Denys
> > > > >
> > > > >
> > > > > > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > > > > > ---
> > > > > >  recipes-qt/qt5/qttools_git.bb | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/
> > > > qttools_git.bb
> > > > > > index 5c0f51c..1108390 100644
> > > > > > --- a/recipes-qt/qt5/qttools_git.bb
> > > > > > +++ b/recipes-qt/qt5/qttools_git.bb
> > > > > > @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
> > > > > >
> > > > > >  inherit ptest
> > > > > >
> > > > > > -DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
> > > > > > +DEPENDS += "qtbase qtdeclarative qtxmlpatterns icu"
> > > > > >
> > > > > >  SRC_URI += " \
> > > > > >      file://run-ptest \
> > > > > > --
> > > > > > 2.7.4
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
> > > >
> >

