Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrE9c-0000AR-KG
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 18:28:17 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHQ00LLHO8XL9VI@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 11:24:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9E6CA6B83A8; Tue,
	07 Apr 2009 12:24:32 -0400 (EDT)
Date: Tue, 07 Apr 2009 12:24:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090407162432.GA11203@denix.org>
References: <20090402185006.GA12552@denix.org>
	<20090402191118.GC30840@smtp.west.cox.net>
	<20090402203832.GC12552@denix.org>
MIME-version: 1.0
In-reply-to: <20090402203832.GC12552@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: package_ipk.bbclass fails due to a wrong version of a	package
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
X-List-Received-Date: Tue, 07 Apr 2009 16:28:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 02, 2009 at 04:38:32PM -0400, Denys Dmytriyenko wrote:
> On Thu, Apr 02, 2009 at 12:11:18PM -0700, Tom Rini wrote:
> > On Thu, Apr 02, 2009 at 02:50:06PM -0400, Denys Dmytriyenko wrote:
> > 
> > > Hi,
> > > 
> > > I've been debugging this issue for a while now w/o much success.
> > > 
> > > We have following recipes in play:
> > > curl_7.19.0.bb
> > > curl-native_7.18.2.bb
> > > curl-sdk_7.18.2.bb
> > > 
> > > None of those set PV explicitly, so they are picked up from the filename.
> > 
> > Hmm, if you throw in a -v -DDD and log all the output, do you see both
> > curl_7.18.2.bb being loaded (for -sdk) and curl_7.19.0.bb (for target)
> > being loaded up?
> 
> Nope. While trying to build curl-sdk_7.18.2.bb there is no mentioning of 
> 7.19.0 (grepped the output) until the do_package_write_ipk, where it tried to 
> create a lock file, as I mentioned above:
> 
> NOTE: package curl-sdk-7.18.2-r0: task do_package_write_ipk: started
> DEBUG: mkdirhier(/oe/tmp/work/i686-i686-sdk-angstrom-linux/curl-sdk-7.18.2-r0/image)
> DEBUG: mkdirhier(/oe/tmp/work/i686-i686-sdk-angstrom-linux/curl-7.19.0-r1/image)
> ERROR: Error, lockfile path does not exist!: /oe/tmp/work/i686-i686-sdk-angstrom-linux/curl-7.19.0-r1/install
> 
> The second mkdirhier() is where it fails and it is called from lockfile(), 
> which gets called from do_package_ipk()...
> 
> BTW, this was a i686-generic build, thus i686-i686-sdk path...

FYI, I figured it out few days ago, but had some personal matters to resolve 
first. I'll be sending a detailed explanation and a patch soon.

-- 
Denys


