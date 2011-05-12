Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QKYyC-0007wL-Oc
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 18:42:41 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LL30058KCXJQLT2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	12 May 2011 11:39:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C314114AF5B; Thu,
	12 May 2011 12:39:19 -0400 (EDT)
Date: Thu, 12 May 2011 12:39:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110512163919.GD21678@denix.org>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
	<1305019695.8000.132.camel@phil-desktop>
	<20110510093616.GB3673@jama.jama.net>
MIME-version: 1.0
In-reply-to: <20110510093616.GB3673@jama.jama.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 1/2] recipes: fix LICENSE fields
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
X-List-Received-Date: Thu, 12 May 2011 16:42:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 10, 2011 at 11:36:16AM +0200, Martin Jansa wrote:
> On Tue, May 10, 2011 at 10:28:15AM +0100, Phil Blundell wrote:
> > On Tue, 2011-05-10 at 09:39 +0200, Martin Jansa wrote:
> > >   | /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/temp/run.SRC_DISTRIBUTECOMMAND.17340: line 95: /pixman: No such file or directory
> > 
> > If '&' in ${LICENSE} is breaking SRC_DISTRIBUTECOMMAND then that
> > suggests there is a bug in that code (probably some sort of missing
> > quotes).  Removing the &s might be a fine thing to do anyway, but it
> > would also be a good idea to track down and fix the underlying bug.
> 
> it calls cd tmp/deploy/sources/$license/pixman
> where with $license == '&' (because LICENSE field is splitted by ' ' and
> then '|'), it ends doing cd on background and then complaing about /pixman
> 
> Directory named & even when created with right backslash
> is still hard to use, so I think it would be better to have QA check 
> that LICENSE field has sane value, even better when we have list of
> possible values etc.

I would agree with Phil that fixing distribute_sources is required, but I'd go 
even further as to say that the current implementation of distribute_sources 
is quite bad. It splits the LICENSE field into tokens based on the wrong 
assumptions that all the whitespaces are used to separate multiple licenses. 
In other words, "Public Domain" is a valid license and shouldn't be replaced 
with "PD". What are you going to do with "GPLv2+ w/ GCC RLE"? Which stands for 
"GPL version 2 (or later) with GCC Runtime Library Exception" and is a valid 
license with an exception... Sorry, but "GPL+libraryexception" is just bogus 
(and it's not a personal remark - I do understand your constrains, see below).

I understand that distribute_sources is quite important and useful. So, maybe 
the correct way is to adopt a proper and stricter syntax for the LICENSE 
field, which uses some other characters to separate multiple licenses. Say, 
something like ":" or "|" should work. Using "," would be even better, but I'm 
afraid it can easily be used inside the license name on its own... Basically, 
something along the lines of "GPL:MIT:Public Domain:Texas A&M Proprietary" etc.

Any comments or objections?

-- 
Denys


