Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 02533605BA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 16:41:41 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 34CC621A; Mon, 21 Mar 2016 17:41:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 06474116;
	Mon, 21 Mar 2016 17:41:40 +0100 (CET)
Date: Mon, 21 Mar 2016 17:41:40 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160321164140.GC2540@piout.net>
References: <1456995129-777-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20160307121324.GE2549@jama> <20160307141931.GA2620@piout.net>
MIME-Version: 1.0
In-Reply-To: <20160307141931.GA2620@piout.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][master][jethro][PATCH] qtquick1: fix qtwebkit support
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
X-List-Received-Date: Mon, 21 Mar 2016 16:41:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/03/2016 at 15:19:31 +0100, Alexandre Belloni wrote :
> On 07/03/2016 at 13:13:24 +0100, Martin Jansa wrote :
> > On Thu, Mar 03, 2016 at 09:52:09AM +0100, Alexandre Belloni wrote:
> > > 40b7a93a3c6cf05136c606824c1cea848b75bcb6 ("qtquick1: allow to disable
> > > qtwebkit support") allowed to disable qtwebkit but actually disabled it in
> > > every cases.
> > > 
> > > Use the same mechanism as qttools to implement the feature.
> > > 
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > > ---
> > >  recipes-qt/qt5/qtquick1_git.bb | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
> > > index e0a264d4fa2d..cb5e395b9d67 100644
> > > --- a/recipes-qt/qt5/qtquick1_git.bb
> > > +++ b/recipes-qt/qt5/qtquick1_git.bb
> > > @@ -16,11 +16,13 @@ LIC_FILES_CHKSUM = " \
> > >  DEPENDS += "qtscript qtsvg qtxmlpatterns"
> > >  # qttools
> > >  
> > > -PACKAGECONFIG ??= "webkit"
> > > -PACKAGECONFIG[webkit] = "CONFIG+=enable-webkit,CONFIG-=enable-webkit,qtwebkit"
> > > +PACKAGECONFIG ??= "qtwebkit"
> > > +PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
> > 
> > Is there reason for renaming the packageconfig option?
> > 
> 
> I wanted to align with the qttools option.
> 
> > Where did you see this issue? Weren't you testing master-next with:
> > http://patchwork.openembedded.org/patch/116717/
> > without corresponding oe-core change?
> > 
> 
> It was on jethro. I'll try a NODISTRO build to see whether this is
> caused by poky.
> 

So I did a nodistro build and I can reproduce the issue on Jethro. The
dependency on qtwebkit works properly but CONFIG is not passed so it
does not contain "enable-webkit".




-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

