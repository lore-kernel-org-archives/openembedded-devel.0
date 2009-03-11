Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LhElD-0006ox-D7
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 04:06:00 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGB009P6N8ML5F2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	10 Mar 2009 22:05:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B070B6B83A8; Tue,
	10 Mar 2009 23:05:09 -0400 (EDT)
Date: Tue, 10 Mar 2009 23:05:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090311030509.GA10085@denix.org>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
	<19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
	<1236699601.29394.99.camel@cheeto.emacinc.com>
	<19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2009 03:06:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 10, 2009 at 10:35:19AM -0700, Khem Raj wrote:
> On Tue, Mar 10, 2009 at 8:40 AM, Travis Stratman <tstratman@emacinc.com> wrote:
> > Thanks Khem.
> >
> > On Mon, 2009-03-09 at 15:35 -0700, Khem Raj wrote:
> >> On Mon, Mar 9, 2009 at 3:18 PM, Travis Stratman <tstratman@emacinc.com> wrote:
> >
> >> snip
> >>
> >> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
> >> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> >> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
> >>
> >> Can you try by removing above three
> >>
> >> Rest of the changes seems like should not have effect.
> >
> > This doesn't seem to change anything. I made the changes, cleaned all
> > glibc and gcc packages, then tried to build and I still get the same
> > issue.
> >
> > Any other ideas?
> 
> Hmm looking closely it seems that your cross compiler is from
> i686-linux -> i686-linux which is native configuration and intl
> configury  is then trying to use
> your freshly built CC instead of the BUILD_CC. In short its not really
> thinking if it is cross compiling. I have a x86_64 box thats why it
> worked for me because I am cross'ing from x86_64-linux to i686-linux
> 
> I will give it a shot on x86 box too. Meanwhile can you also define
> TARGET_VENDOR = "something" for your distr and rebuild

I'll save you some trouble - been building i686-generic on I32 x86 for months 
w/o a problem. Angstrom distro with a small overlay - configuration is pretty 
basic.

i686-linux holds my native packages
i686-angstrom-linux holds my target/cross packages, including gcc-cross
i686-generic-angstrom-linux holds machine-specific target packages

-- 
Denys


