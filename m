Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3F2735FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 11:49:17 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 8A1E7122; Thu, 19 Feb 2015 12:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 5809390
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 12:49:18 +0100 (CET)
Date: Thu, 19 Feb 2015 12:49:17 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150219114917.GH10602@piout.net>
References: <1424287616-637-1-git-send-email-alexandre.belloni@free-electrons.com>
	<CAP9ODKpeDCspPy_e51KHKbnG_rqq4BgyYc43piN+3wfcnLD3VQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpeDCspPy_e51KHKbnG_rqq4BgyYc43piN+3wfcnLD3VQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][dizzy][PATCH 1/2] qmake5: add a qmake5_internal
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Feb 2015 11:49:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19/02/2015 at 09:15:10 -0200, Otavio Salvador wrote :
> On Wed, Feb 18, 2015 at 5:26 PM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > Add a qmake5_internal class to be used when configuring and compiling qt
> > itself.
> > It simply remove the -r parameter from the qmake command line. This is
> > necessary to avoid those errors when building qtdeclarative or qt3d
> > without opengl for example:
> > Project ERROR: Unknown module(s) in QT: quick-private
> > or
> > Project ERROR: Unknown module(s) in QT: quick
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> 
> I use prefer we use a:
> 
> USE_RECURSIVE = "0"
> 

Yeah, see my other patch ;)

> Flag or similar to control it and avoid to duplicate the class. Does
> it makes sense? Also this patches should target master branch.
> 

I'm never sure how to tag the branch. I need that patch on both master
and dizzy...

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

