Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OgibK-0006xw-PO
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:22:05 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6N00MOU1JLCRO1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	04 Aug 2010 12:21:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AF98914AF64; Wed,
	04 Aug 2010 13:21:21 -0400 (EDT)
Date: Wed, 04 Aug 2010 13:21:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100804172121.GC7189@denix.org>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org> <20100804052042.GB7085@gmail.com>
	<1280920678.26249.33.camel@saphir>
	<1280922518.2692.377.camel@mill.internal.reciva.com>
	<20100804161327.GA7189@denix.org> <4C599C72.10805@xora.org.uk>
MIME-version: 1.0
In-reply-to: <4C599C72.10805@xora.org.uk>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in	COMPATIBLE_MACHINES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Aug 2010 18:22:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 04, 2010 at 05:59:30PM +0100, Graeme Gregory wrote:
>  On 04/08/10 17:13, Denys Dmytriyenko wrote:
> > On Wed, Aug 04, 2010 at 12:48:38PM +0100, Phil Blundell wrote:
> >> On Wed, 2010-08-04 at 13:17 +0200, Michael 'Mickey' Lauer wrote:
> >>> FWIW, minimal is using MACHINE_CLASS since quite a while to
> >>> reduce the need for adding the same files over and over again,
> >>> this is being used e.g. for HTC msm7 series and OpenEZX series
> >>> (see conf/machine/include).
> >>>
> >>> Perhaps it's time to standardize something like that.
> >> Yeah.  I certainly don't think we want a proliferation of such
> >> mechanisms.  If minimal is already using MACHINE_CLASS then there would
> >> be some sense in trying to make use of the same thing.
> >>
> >> Failing that though, testing COMPATIBLE_MACHINE against MACHINE_CLASS
> >> probably is more desirable than adding a completely new variable (i.e.
> >> SOC_FAMILY) for that purpose.
> > Phil,
> >
> > Re: "adding a completely new variable" - SOC_FAMILY has been in use for almost 
> > a year now. I'm hearing about MACHINE_CLASS for the first time, although it 
> > appears to be slightly older than SOC_FAMILY though. But it doesn't seem to be 
> > used anywhere besides in few machine configs and micro.conf. There are no 
> > recipes actually using it, unlike SOC_FAMILY...
> >
> > I'm not saying one is better than the other (actually, unifying them would 
> > be nice), I'm just saying it's too late to object adding SOC_FAMILY...
> >
> As the person who originally added MACHINE_CLASS to openmoko and the OE,
> then removed it from OE I can say it has different meaning that
> SOC_FAMILY. MACHINE_CLASS was to identify a range of machines that were
> 90% the same but had a few differences. It was used in a few recipes
> which were MACHINE_ARCH to make them use the same ARCH in these recipes
> to stop them being rebuilt when switching machines.
> 
> The original use was om-gta01 and om-gta02 which had the same MACHINE_CLASS.

Graeme,

Thanks for clarifying this! Do you still see a benefit in using MACHINE_CLASS? 
Why was it removed from OE? I don't see why it can't be used alongside 
SOC_FAMILY...

-- 
Denys


