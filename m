Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6AF65D24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 17:28:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4E00CR15VJ4UK0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	21 Apr 2014 12:28:31 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 53600201BF; Mon,
	21 Apr 2014 13:28:30 -0400 (EDT)
Date: Mon, 21 Apr 2014 13:28:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140421172830.GR11339@denix.org>
References: <1396327671-22282-1-git-send-email-denis@denix.org>
	<20140420090511.GQ2486@jama>
MIME-version: 1.0
In-reply-to: <20140420090511.GQ2486@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][PATCH] linuxptp: fix and simplify recipe, drop dependency on kernel
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
X-List-Received-Date: Mon, 21 Apr 2014 17:28:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Apr 20, 2014 at 11:05:11AM +0200, Martin Jansa wrote:
> On Tue, Apr 01, 2014 at 12:47:51AM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > * Build script tries to locate the correct /usr/include/linux/net_tstamp.h just
> > to see if it contains definition for HWTSTAMP_TX_ONESTEP_SYNC. But that header
> > file hasn't changed in at least 5 years. The result of the check is to pass
> > additional defines to the build, which can be passed via EXTRA_OEMAKE.
> > 
> > * The sed command on makefile wasn't even working, plus there's no AR, prefix
> > is not used and better way is to use EXTRA_CFLAGS and EXTRA_LDFLAGS anyway.
> > 
> > * Neither autotools nor pkgconfig are use during the build, don't inherit them.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> Sorry for delay caused by test-dependencies run, but finally merged,
> thanks!

Thank you!

