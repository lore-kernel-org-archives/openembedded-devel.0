Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LhaZb-00016h-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 03:23:04 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGD00IEXFX3T8Z3@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	11 Mar 2009 21:22:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B1F3D6B83B5; Wed,
	11 Mar 2009 22:22:15 -0400 (EDT)
Date: Wed, 11 Mar 2009 22:22:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090312022215.GB12341@denix.org>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
	<19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
	<1236699601.29394.99.camel@cheeto.emacinc.com>
	<19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
	<20090311030509.GA10085@denix.org>
	<c384c5ea0903111428y4ffee26dud7662f1f614074ac@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <c384c5ea0903111428y4ffee26dud7662f1f614074ac@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Thu, 12 Mar 2009 02:23:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 11, 2009 at 10:28:09PM +0100, Leon Woestenberg wrote:
> Denys,
> 
> On Wed, Mar 11, 2009 at 4:05 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > i686-linux holds my native packages
> > i686-angstrom-linux holds my target/cross packages, including gcc-cross
> > i686-generic-angstrom-linux holds machine-specific target packages
> >
> Are that your overlay directory names?

Obviously, not. Those are my target and host triplets. Those are the 
directories used in work, stamps, staging and pkgdata among other things.

> Then they have nothing to do with the actual problem AFAIK.
> 
> It's probably the target triplet name that makes the difference, like
> Khem suggests.

Correct, as Khem suspected and Travis confirmed, not setting TARGET_VENDOR 
messes things up by clashing host and target triplets, which confuses the hell 
out of the cross-compilation :)
BTW, Angstrom sets it to "-angstrom" by default, as in my case.

-- 
Denys


