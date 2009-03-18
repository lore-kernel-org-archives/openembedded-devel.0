Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjzKp-0000c3-9A
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 18:13:46 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGP00ITOP5DV056@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	18 Mar 2009 12:12:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C4D2A6B83A8; Wed,
	18 Mar 2009 13:12:48 -0400 (EDT)
Date: Wed, 18 Mar 2009 13:12:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090318171248.GA25537@denix.org>
References: <1237328436.20770.57.camel@homestead>
	<d1b08f940903171633l7c66f604rfa6375bd95b2c3bf@mail.gmail.com>
	<20090318001624.GB20384@denix.org>
	<ac9c93b10903180121l3454a2adqbaac9590659daf76@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <ac9c93b10903180121l3454a2adqbaac9590659daf76@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL,BAYES_20,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Wed, 18 Mar 2009 17:13:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 18, 2009 at 09:21:53AM +0100, Frans Meulenbroeks wrote:
> A crude temp solution could be to just remove the stamps of all
> non-native, non-cross packages.
> 
> Also if you only want to reclaim space I guess it is ok to remove the
> work subdir (or at least in my case (beagleboard) the work/arm* dir)
> If this is not right I guess someone will correct me :-)
> 
> Btw: it would also be nice to have a command to purge the tmp dir, so
> if X build for r0 is there and X build for r1 is there the r0 version
> is nuked. Never got to writing something for that though :-)

Speaking of purging tmp/work - you might want to look for
INHERIT += "rm_work", which cleans work directory for every package, after 
it's built and staged/packaged.

-- 
Denys


