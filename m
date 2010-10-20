Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8gGw-0008Kb-Re
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 23:32:36 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAL007M7YH3KAC0@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 16:31:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BA80C14AF64; Wed,
	20 Oct 2010 17:31:50 -0400 (EDT)
Date: Wed, 20 Oct 2010 17:31:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020213150.GV11514@denix.org>
References: <20101020203828.GU11514@denix.org>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3441@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F0803110B3441@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: LICENSE field format
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
X-List-Received-Date: Wed, 20 Oct 2010 21:32:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 20, 2010 at 04:06:10PM -0500, Maupin, Chase wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Denys Dmytriyenko
> > Sent: Wednesday, October 20, 2010 3:38 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] LICENSE field format
> > 
> > All,
> > 
> > We've had a number of discussions on the license matter recently. Trying
> > to
> > unify those brings us to the question of the LICENSE field format in
> > recipes.
> > As some projects are dual/triple licensed or use multiple licenses at the
> > same
> > time, it becomes hard to specify it all in the LICENSE field, especially
> > when
> > there are no rules defined. We do have several different formats used to
> > separate multiple licenses, which is quite confusing and doesn't make it
> > clear
> > whether licenses are AND-ed or OR-ed (I know those are not legal terms,
> > but
> > for the purpose of this discussion that's fine :)) Here are some examples:
> > 
> > LICENSE = "License1 License2"
> > LICENSE = "License1|License2"
> > LICENSE = "License1, License2"
> > LICENSE = "License1+License2"
> > LICENSE = "License1/License2"
> > 
> > LICENSE = "Very Long License Name"
> > LICENSE = "License with some exceptions"
> 
> I would vote for something along the following lines:
> 
> LICENSE = "License1|License2" 
> 	- This means the code is licensed under the terms of both licenses
> 
> LICENSE = "License1,License2"
> 	- This means the code can use either license exclusively
> 
> in the src_distribute class spaces should be replaced with "-"s.  Of course, 
> this could lead to licenses like "GPLv3+-with-GCC-RLE".
> 
> We should avoid separating licenses with "/" because that will mess up the 
> directory structure or "+" because that would be confusing when + is also 
> used to mean "or later" for some licenses like the GPL.

Chase,

I feel like those are just crutches and not the real solution to the problem. 
We should fix src_distribute class to work with the format we choose and not 
try to make the code happy by inventing workarounds in the format. In other 
words - the priority is to define a scalable, future-proof and easy to 
understand and follow format for the LICENSE field. And then make 
src_distribute class to behave accordingly - we can escape any special 
characters in there to make proper directory names, once we decide how to 
split the license field on individual items...

-- 
Denys

> > To make matters worse, src_distribute.bbclass splits the field at spaces
> > and
> > creates directories for each token. So, for the last two examples above,
> > we
> > end up with 4 directories for every license - each word is a separate
> > directory...
> > 
> > I'd like to raise this issue and start a discussion on unifying the
> > LICENSE
> > field format (and fixing src_distribute.bbclass accordingly). Would be
> > nice to
> > collect some ideas here on the maillist and/or discuss it further during
> > OEDEM
> > next week. Please feel free to comment.
> > 
> > --
> > Denys
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


