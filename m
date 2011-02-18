Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PqWPf-000162-1l
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 20:54:47 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LGT003IJWKZCYM0@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	18 Feb 2011 13:53:24 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1697514AF6D; Fri,
	18 Feb 2011 14:53:23 -0500 (EST)
Date: Fri, 18 Feb 2011 14:53:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110218195323.GB11390@denix.org>
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5ECA4D.4090309@mentor.com>
MIME-version: 1.0
In-reply-to: <4D5ECA4D.4090309@mentor.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Fri, 18 Feb 2011 19:54:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 18, 2011 at 12:36:45PM -0700, Tom Rini wrote:
> On 02/18/2011 12:26 PM, Tom Rini wrote:
>> In order to make the user experience better we now use bb.warn
>> on non-fatal QA errors and bb.error on fatal errors.
>
> Part of my motivation here is that after looking at poky, this error is 
> _not_ fatal there yet (none are), and until we can kill libtool 2.2.x 
> (which won't be until oe-core I believe) this is going to be a big problem 
> to solve, generally involving a libtool hack.  I think we can best spend 
> our time here on fixing RPATH issues that still show up once we're all 
> using libtool 2.4 (as there will still be a few in 'odd' packages, but most 
> will now be correct automatically).
>
> I'm going to push this into my simplify-target-flags branch as well and see 
> what falls out now (doing so already for smaller test cases).

Since our own Arago overlay still uses libtool 2.2 (disabling RPATH check 
locally), I fully support this change in OE until everyone adopts libtool 2.4

Acked-by: Denys Dmytriyenko <denys@ti.com>

-- 
Denys


