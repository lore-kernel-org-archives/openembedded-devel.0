Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6EA671633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 01:04:20 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6000CJ4GAYEW30@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	21 Apr 2016 20:04:20 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=0gcC27t9AAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=moxdNLDgXe7PjqMsPKYA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 7db6dab9; Fri, 22 Apr 2016 01:04:20 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1D65B161FC7; Thu,
	21 Apr 2016 21:04:10 -0400 (EDT)
Date: Thu, 21 Apr 2016 21:04:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160422010410.GS16135@denix.org>
References: <1460061600-28075-1-git-send-email-denis@denix.org>
	<20160420182528.GM16135@denix.org>
	<CA+chaQfEgVEExME523XvcqQBc53U3WVuFO48s6ArMkpmt8kW8g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+chaQfEgVEExME523XvcqQBc53U3WVuFO48s6ArMkpmt8kW8g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] ne10: use bb.debug for debug messages
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
X-List-Received-Date: Fri, 22 Apr 2016 01:04:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 20, 2016 at 10:44:04PM +0200, Martin Jansa wrote:
> When everything is at least once tested in my jenkins builds and I've time
> to go through the list of pending changes.
> 
> I was away from computers almost whole previous week, so there is longer
> delay now.

Thanks, no problem and congrats!


> On Wed, Apr 20, 2016 at 8:25 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Ping. Also in master-next for over a week - how often does it get merged to
> > master?
> >
> >
> > On Thu, Apr 07, 2016 at 04:40:00PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Moreover, the messages are misleading, saying "Building for arch blah",
> > > even when this recipe is not being built. It merely checks if the recipe
> > > is cmaptible with the currently used architecture.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > > index 4d753a0..de97982 100644
> > > --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > > +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > > @@ -20,10 +20,10 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
> > >  python () {
> > >      if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES',
> > True).split()):
> > >          d.setVar('NE10_TARGET_ARCH', 'armv7')
> > > -        bb.note('Building Ne10 for armv7')
> > > +        bb.debug(2, 'Building Ne10 for armv7')
> > >      elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES',
> > True).split()):
> > >          d.setVar('NE10_TARGET_ARCH', 'aarch64')
> > > -        bb.note('Building Ne10 for aarch64')
> > > +        bb.debug(2, 'Building Ne10 for aarch64')
> > >      else:
> > >          raise bb.parse.SkipPackage("Incompatible with archs other than
> > armv7 and aarch64")
> > >  }
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
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

