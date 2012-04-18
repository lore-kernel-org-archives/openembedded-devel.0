Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SKZBF-0000Ul-1s
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 20:00:38 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2O005S6S8APJ00@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	18 Apr 2012 12:50:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C3A9B2009A; Wed,
	18 Apr 2012 13:50:34 -0400 (EDT)
Date: Wed, 18 Apr 2012 13:50:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120418175034.GB6343@denix.org>
References: <CAOHjBZu=T6TrSomYSOW+Sp5afFwHTu5f4zGKx-3T361gdrJdmg@mail.gmail.com>
	<4F8ECB3D.7040200@mlbassoc.com>
	<CAOHjBZudcfECWJA-7Ey3dTjEBNBFK3Zj5+tek5V3uQ_EH8P9Yw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOHjBZudcfECWJA-7Ey3dTjEBNBFK3Zj5+tek5V3uQ_EH8P9Yw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [oe-core] build for 32bit architecture
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
X-List-Received-Date: Wed, 18 Apr 2012 18:00:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 18, 2012 at 04:17:30PM +0200, Giuseppe Condorelli wrote:
> 2012/4/18 Gary Thomas <gary@mlbassoc.com>
> 
> > On 2012-04-18 07:48, Giuseppe Condorelli wrote:
> >
> >> Hi All,
> >>
> >> I need to build the native packages for a 32bit architecture, although I'm
> >> working on a 64bit machine.
> >> So I need to pass the -m32 option to the compiler and my question is about
> >> the right place where to put it
> >> to be inherited by all native packages.
> >>
> >
> > Why would you need 32bit native packages when your build host is 64bit?
> > The native packages are only used to provide functionality during the
> > build and hence (it makes sense to me at least) they should match the
> > build host native environment.

> I need to build cross tools at 32bit for my goal.

Well, that's cross, not native, as you previously said.

For what you want look at SDKMACHINE in your local.conf

-- 
Denys


