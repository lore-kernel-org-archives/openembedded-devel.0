Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxPC-0003vi-EA
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:33:18 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI6004JY3OC4L23@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:31:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A5B6C14AF6A; Wed,
	16 Mar 2011 16:31:24 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:31:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <tom_rini@mentor.com>
Message-id: <20110316203124.GM3042@denix.org>
References: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
	<20110315200131.GA3042@denix.org>
	<AANLkTikS9S8OdO3DqBzhErVMiTxHruk2Mo17rNqK9aad@mail.gmail.com>
	<4D80E2F3.7020204@mentor.com>
MIME-version: 1.0
In-reply-to: <4D80E2F3.7020204@mentor.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: add link to .rootfs.<type> or	.<type>.img
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
X-List-Received-Date: Wed, 16 Mar 2011 20:33:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 09:18:59AM -0700, Tom Rini wrote:
> On 03/16/2011 08:25 AM, Ben Gardiner wrote:
>> Thanks, Denys for the Ack and Tom for picking up the patches.
>>
>> Now that they have hit mainline, I would like to request that they get
>> into arago-oe-dev. From the 2010.03-maintenance announcement I'm
>> guessing that means that they need to be backported to
>> 2010.03-maintenance branch first.
>>
>> I've cherry-picked the following commits (some with fixups) to get a
>> successful build of hello-worldimage with externa-toolchain and
>> Build Configuration:
>> BB_VERSION        = "1.10.2"
>> METADATA_BRANCH   =
>> "upstream/oe/releases/2011.03-maintenance/features/BenGardiner/backport-ubifs-links"
>> METADATA_REVISION = "64d4245"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux-gnueabi"
>> MACHINE           = "da850-omapl138-evm"
>> DISTRO            = "angstrom"
>> DISTRO_VERSION    = "2011.03"
>> TARGET_FPU        = "soft"
>
> OK.  I don't have a problem merging things into the maintenance branch that 
> I pushed into mainline but I would like a few acks from other people.  And 

Sent my Acks, but mail server is slow again, so it may take some time to see 
them... :)

> I'd also like the patches you tested (helloworld-image + beagleboard + 
> angstrom-2008.1 should build and isn't too much to build) themselves posted 
> as a request (and a pullable git tree on githib/gitorosis/local/whatever 
> would be nice but isn't required).  Thanks!
>
> -- 
> Tom Rini
> Mentor Graphics Corporation
>


