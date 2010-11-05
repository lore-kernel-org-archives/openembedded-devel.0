Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PEAgn-0005D3-Uy
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 02:01:58 +0100
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LBE007UQ04EDS18@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	04 Nov 2010 20:00:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 163E814AF6A; Thu,
	04 Nov 2010 21:00:14 -0400 (EDT)
Date: Thu, 04 Nov 2010 21:00:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101105010014.GA6115@denix.org>
References: <AANLkTin8J-vi624U2Z4Emr=Zajq0+CsSnFR=a8+kjuOv@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTin8J-vi624U2Z4Emr=Zajq0+CsSnFR=a8+kjuOv@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Moving to layered structure of openembedded metadata
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
X-List-Received-Date: Fri, 05 Nov 2010 01:01:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Nov 04, 2010 at 04:34:42PM -0700, Khem Raj wrote:
> Hi
> 
> In recent discussions there seems to be a lot of interest in moving
> towards more layered structure in OE where we discussed machine
> layers and arch based layers. There certainly are advantages to this
> approach as discussed in other threads on mailing list
> I think poky has already achieved that to a certain extent and has
> made metadata changes
> needed for such a structure. There are other polishing to metadata
> which is beneficial in general like recipe licenses, gcc runtime
> demystification etc. I would like to suggest that we adopt this
> structure and use Poky as core layer which we
> should always maintain in coherence and add the extra
> machines,architectures and recipes as additional layers around
> the base layer.
> 
> This will also help us to scale the project and
> reduce the to and fro in merges as well as communities at large will
> benefit by seamless flow
> of patches and other contributions.
> 
> This will of course need a lot of work and I wanted to bring to
> everyone to know if this would be a good approach moving
> forward.

Khem,

That is already being discussed and decided. See the following previous topics 
on the mailing list...

The raw OEDEM meeting notes, where if you read carefully (and between the 
lines :) you can see the suggestion of using Poky as a new core being 
discussed:
http://article.gmane.org/gmane.comp.handhelds.openembedded/39108

Call for open discussion and future plans for advancing OpenEmbedded and 
Yocto Project:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/39114

-- 
Denys


