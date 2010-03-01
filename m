Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NmEBk-0007Be-0a
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 23:34:09 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYM008VUJVJQ601@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	01 Mar 2010 16:31:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7033A14AF60; Mon,
	01 Mar 2010 17:30:55 -0500 (EST)
Date: Mon, 01 Mar 2010 17:30:55 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100301223055.GF15391@denix.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda>
	<19c1b8a91003011411p420a449dw3c03d03c6f5cec9a@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <19c1b8a91003011411p420a449dw3c03d03c6f5cec9a@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 22:34:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 01, 2010 at 02:11:54PM -0800, Khem Raj wrote:
> On Sun, Feb 28, 2010 at 1:35 PM, Michael 'Mickey' Lauer
> <mickey@vanille-media.de> wrote:
> > Am Sonntag, den 28.02.2010, 20:39 +0100 schrieb Frans Meulenbroeks:
> >> We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
> >> Only a few versions are used (see also the grep below)
> >>
> >> for glib-2.0:
> >> "2.12.12"
> >> "2.16.4"
> >> "2.18.3"
> >> "2.20.3"
> >> "2.22.1"
> >> "2.22.4"
> >> "2.6.4"
> >> "2.8.6"
> >>
> >> for glib-2.0-native:
> >> "2.16.1"
> >> "2.18.0"
> >> "2.22.1"
> >> "2.22.4"
> >>
> >> Both include the last two versions
> >> Proposal is to remove all versions that are not used.
> >>
> >> How do people feel about this?
> >
> > Sounds good to me, althoug I'd recommend not removing them but just
> > moving them out of sight, i.e. in an 'old' folder. That way we could
> > please both the lets-keep-everything-no-matter-how-rotten and also the
> > lets-strive-for-few-high-quality recipes.
> >
> 
> FWIW I like the idea of having 'obsolete' recipes so moving them to
> recipes/obsolete may not be so bad.

+1 on this one, since we already have recipes/obsolete in BBMASK by default 
and it will reduce parse time for obsoleted recipes. And git-mv does a nice 
enough job of preserving commit history...

-- 
Denys


